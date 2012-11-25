Imports System.Data
Imports System.Data.SqlClient

Partial Class Permissao
    Inherits System.Web.UI.Page

    Dim rl As DataRelation
    Dim dr As SqlDataReader
    Dim StringDeConexao As String = ConfigurationManager.ConnectionStrings("ServidorBD").ToString()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            AtualizaTree()
        End If
    End Sub


    Private Sub AtualizaTree()
        Using cnn As SqlConnection = New SqlConnection(StringDeConexao)
            Using ds As DataSet = New DataSet
                Using da As SqlDataAdapter = New SqlDataAdapter
                    Using cmd As SqlCommand = New SqlCommand

                        ds.DataSetName = "dsMenus"

                        cmd.Connection = cnn
                        cmd.CommandText = _
                            "SELECT IdMenu, " + _
                                    "CASE WHEN Ativo=1 THEN TituloPOR ELSE '<font color=Gray>' + TituloPOR + '</font>' END AS Titulo, " + _
                                    "CASE WHEN Ativo=1 THEN '../../Icones/PNG/Blue/18/arrow_right.png' ELSE '../../Icones/PNG/Yellow/18/arrow_down.png' END AS Imagem, " + _
                                    "IdMenuPai, DescricaoPOR AS Descricao " + _
                            "FROM admPortalMenu " + _
                            "ORDER BY OrdemExibicao"

                        da.SelectCommand = cmd

                        da.Fill(ds, "tbMenu")
                        ds.Tables(0).TableName = "tbMenu"

                        rl = New DataRelation("ParentChild", ds.Tables("tbMenu").Columns("IdMenu"), ds.Tables("tbMenu").Columns("IdMenuPai"), True)
                        rl.Nested = True
                        ds.Relations.Add(rl)

                        xdsMenu.Data = ds.GetXml()

                        cnn.Close()

                        TreeView1.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub

    Protected Sub btnRecolhe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRecolhe.Click
        TreeView1.CollapseAll()
    End Sub

    Protected Sub btnExpande_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExpande.Click
        TreeView1.ExpandAll()
    End Sub

    Protected Sub MarcaChk(ByVal oChk As CheckBox)
        If oChk.Checked Then
            oChk.Text = "Desmarcar"
        Else
            oChk.Text = "Marcar"
        End If
    End Sub

    Protected Sub btnAdicionaPerfil_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdicionaPerfil.Click
        Dim i As Integer
        Dim cSql As String = ""
        For i = 0 To lsbPerfilLista.Items.Count - 1
            If lsbPerfilLista.Items(i).Selected Then
                For Each node As TreeNode In TreeView1.CheckedNodes
                    cSql += " IF NOT EXISTS(SELECT * FROM admPortalMenuPerfil "
                    cSql += "WHERE IdMenu=" + node.Value + " AND IdPerfil=" + lsbPerfilLista.Items(i).Value + ") "
                    cSql += " INSERT INTO admPortalMenuPerfil (IdMenu, IdPerfil) VALUES ("
                    cSql += node.Value + ","
                    cSql += lsbPerfilLista.Items(i).Value + ") "
                Next
            End If
        Next
        If cSql <> "" Then
            sdsPerfil.InsertCommand = cSql
            sdsPerfil.Insert()
            lsbPerfil.DataBind()
            lsbPerfilLista.DataBind()
            chkPerfilLista.Checked = False
            MarcaChk(chkPerfilLista)
        End If
    End Sub

    Protected Sub btnRemovePerfil_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoverPerfil.Click
        Dim i As Integer
        Dim cIdPerfil As String = ""
        Dim cIdMenu As String = ""
        For i = 0 To lsbPerfil.Items.Count - 1
            If lsbPerfil.Items(i).Selected Then
                cIdPerfil += "," + lsbPerfil.Items(i).Value
            End If
        Next
        For Each node As TreeNode In TreeView1.CheckedNodes
            cIdMenu += "," + node.Value
        Next
        If cIdPerfil <> "" And cIdMenu <> "" Then
            sdsPerfil.DeleteCommand = " DELETE FROM admPortalMenuPerfil WHERE " + _
                                        "IdMenu IN (0" + cIdMenu + ") AND " + _
                                        "IdPerfil IN (0" + cIdPerfil + ") "
            sdsPerfil.Delete()
            lsbPerfil.DataBind()
            lsbPerfilLista.DataBind()
            chkPerfil.Checked = False
            MarcaChk(chkPerfil)
        End If
    End Sub

    Protected Sub lsbPerfil_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lsbPerfil.SelectedIndexChanged
        lsbUsuario.DataBind()
        lsbUsuarioLista.DataBind()
    End Sub

    Protected Sub btnAdicionaUsuario_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdicionaUsuario.Click
        Dim i As Integer
        Dim c As Integer
        Dim cSql As String = ""
        For i = 0 To lsbUsuarioLista.Items.Count - 1
            If lsbUsuarioLista.Items(i).Selected Then
                For c = 0 To lsbPerfil.Items.Count - 1
                    If lsbPerfil.Items(c).Selected Then
                        cSql += " INSERT INTO admPortalPerfilUsuario (IdPerfil, IdUsuario) VALUES ("
                        cSql += lsbPerfil.Items(c).Value + ","
                        cSql += lsbUsuarioLista.Items(i).Value + ") "
                    End If
                Next
            End If
        Next
        If cSql <> "" Then
            sdsUsuario.InsertCommand = cSql
            sdsUsuario.Insert()
            lsbUsuario.DataBind()
            lsbUsuarioLista.DataBind()
            chkUsuario.Checked = False
            MarcaChk(chkUsuario)
        End If
    End Sub

    Protected Sub btnRemoverUsuario_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoverUsuario.Click
        Dim i As Integer
        Dim cIdUsuario As String = ""
        Dim cIdPerfil As String = ""
        For i = 0 To lsbUsuario.Items.Count - 1
            If lsbUsuario.Items(i).Selected Then
                cIdUsuario += "," + lsbUsuario.Items(i).Value
            End If
        Next
        For i = 0 To lsbPerfil.Items.Count - 1
            If lsbPerfil.Items(i).Selected Then
                cIdPerfil += "," + lsbPerfil.Items(i).Value
            End If
        Next
        If cIdUsuario <> "" And cIdPerfil <> "" Then
            sdsUsuario.DeleteCommand = " DELETE FROM admPortalPerfilUsuario WHERE " & _
                                        "IdUsuario IN (0" & cIdUsuario & ") AND " & _
                                        "IdPerfil IN (0" & cIdPerfil & ") "
            sdsUsuario.Delete()
            lsbUsuario.DataBind()
            lsbUsuarioLista.DataBind()
            chkUsuario.Checked = False
            MarcaChk(chkUsuario)
        End If
    End Sub

    Protected Sub chkPerfil_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkPerfil.CheckedChanged
        Dim i As Integer
        For i = 0 To lsbPerfil.Items.Count - 1
            lsbPerfil.Items(i).Selected = chkPerfil.Checked
        Next
        MarcaChk(chkPerfil)
    End Sub

    Protected Sub chkPerfilLista_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkPerfilLista.CheckedChanged
        Dim i As Integer
        For i = 0 To lsbPerfilLista.Items.Count - 1
            lsbPerfilLista.Items(i).Selected = chkPerfilLista.Checked
        Next
        MarcaChk(chkPerfilLista)
    End Sub

    Protected Sub chkUsuario_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkUsuario.CheckedChanged
        Dim i As Integer
        For i = 0 To lsbUsuario.Items.Count - 1
            lsbUsuario.Items(i).Selected = chkUsuario.Checked
        Next
        MarcaChk(chkUsuario)
    End Sub

    Protected Sub chkUsuarioLista_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkUsuarioLista.CheckedChanged
        Dim i As Integer
        For i = 0 To lsbUsuarioLista.Items.Count - 1
            lsbUsuarioLista.Items(i).Selected = chkUsuarioLista.Checked
        Next
        MarcaChk(chkUsuarioLista)
    End Sub

End Class
