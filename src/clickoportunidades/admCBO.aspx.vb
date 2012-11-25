Imports System.Drawing
Partial Class clickoportunidades_admCBO
    Inherits System.Web.UI.Page
#Region " Funções "
    Private Sub colorirDropProgramacao()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("Senacrjconnectionstring").ToString)
        Dim sql As String = "SELECT  tblSGA_Ofertas.nome FROM tblCboOferta INNER JOIN tblCBO ON tblCboOferta.id_cargo_fk = tblCBO.id_cargo INNER JOIN tblSGA_Ofertas ON tblCboOferta.oferta_fk = tblSGA_Ofertas.oferta INNER JOIN tblSGA_AreasConhecimento ON tblSGA_Ofertas.area_operacional_rj = tblSGA_AreasConhecimento.codigo"
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        While reader.Read()
            If reader.HasRows Then

                For x As Integer = 0 To cboSenacRio.Items.Count - 1

                    If reader("nome") = cboSenacRio.Items(x).Text Then
                        cboSenacRio.Items(x).Attributes.Add("style", "background-color: #87CEEB")
                    End If
                Next


            End If
        End While

        conn.Dispose()
        cmd.Dispose()
        reader.Close()




    End Sub


    Private Sub colorirDropCargo()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("Senacrjconnectionstring").ToString)
        Dim sql As String = "SELECT  tblCBO.cargo FROM tblCboOferta INNER JOIN tblCBO ON tblCboOferta.id_cargo_fk = tblCBO.id_cargo INNER JOIN tblSGA_Ofertas ON tblCboOferta.oferta_fk = tblSGA_Ofertas.oferta INNER JOIN tblSGA_AreasConhecimento ON tblSGA_Ofertas.area_operacional_rj = tblSGA_AreasConhecimento.codigo"
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        While reader.Read()
            If reader.HasRows Then

                For x As Integer = 0 To cbocargo.Items.Count - 1

                    If reader("cargo") = cbocargo.Items(x).Text Then
                        cbocargo.Items(x).Attributes.Add("style", "background-color: #87CEEB")
                    End If
                Next


            End If
        End While

        conn.Dispose()
        cmd.Dispose()
        reader.Close()




    End Sub
#End Region

    Protected Sub btninserir0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btninserir0.Click
        SqlrelacionaInserir.Insert()
        MultiView1.ActiveViewIndex = 1
        GridRelacionados.DataBind()
       


    End Sub

    Protected Sub btninserir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btninserir.Click
        Try
            SqlCargoInserir.Insert()
        Catch ex As Exception
            Label5.Text = "Não foi possível inserir o cargo. Tente novamente."
        End Try

        GridNovoCargo.DataBind()

        txtcargo.Text = ""
        txtcargo2.Text = ""
        txtid_cargo.Text = ""
    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        Select Case e.Item.Value
            Case "0"

                MultiView1.ActiveViewIndex = 0

                Exit Select
            Case "1"
                MultiView1.ActiveViewIndex = 1


                Exit Select
        End Select
    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("id_cargo") = GridNovoCargo.SelectedValue
        SqlDesativar.Update()
        GridNovoCargo.DataBind()
    End Sub

    Protected Sub btnNO_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("id_cargo") = GridNovoCargo.SelectedValue
        Sqlativar.Update()
        GridNovoCargo.DataBind()
    End Sub

    Protected Sub btnOK2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("id_codRel") = GridRelacionados.SelectedValue
        SqldesativarRelacionamento.Update()
        GridRelacionados.DataBind()
    End Sub

    Protected Sub btndesativar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("id_codRel") = GridRelacionados.SelectedValue
        SqlAtivarRelacionamento.Update()
        GridRelacionados.DataBind()
    End Sub

    Protected Sub btnpesquisar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnpesquisar.Click
        Dim parCargo As New Parameter

        Sqlbuscacargo.SelectParameters.Clear()
        Sqlbuscacargo0.SelectParameters.Clear()

        parCargo.Name = "cargo"
        If txtcargo.Text.Length = 0 Then
            parCargo.DefaultValue = "%"
        Else
            parCargo.DefaultValue = txtcargo.Text
        End If
        Sqlbuscacargo.SelectParameters.Add(parCargo)
        Sqlbuscacargo0.SelectParameters.Add(parCargo)

        txtcargo.Text = ""
    End Sub


    Protected Sub SqlCargos_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlCargos.Selecting

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            colorirDropProgramacao()
            colorirDropCargo()
        Catch
        End Try

        Label5.Text = ""
        lbladicionarcargo1.Text = "Para modificar um CBO, clique na seta azul para selecionar."
    End Sub

    Protected Sub cboSenacRio_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSenacRio.SelectedIndexChanged

    End Sub

    Protected Sub cboSenacRio_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSenacRio.DataBound



    End Sub

    Protected Sub SqlCargos_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlCargos.Selected

    End Sub

    Protected Sub btnCancela_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancela.Click
        txtcargo.Text = ""
        txtcargo2.Text = ""
        txtid_cargo.Text = ""
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            Sqlbuscacargo.Delete()
        Catch ex As Exception
            lbladicionarcargo1.Text = "Existe um relacionamento para esse cargo, favor excluir relacionamento primeiro."

        End Try
    End Sub
End Class
