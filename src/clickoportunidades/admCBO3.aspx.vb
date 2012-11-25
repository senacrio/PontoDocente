Imports System.Drawing
Partial Class clickoportunidades_admCBO
    Inherits System.Web.UI.Page
#Region " Funções "

    Private Sub colorirProgramacao()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("Senacrjconnectionstring").ToString)
        Dim sql As String = "SELECT  tblSGA_Ofertas.nome FROM tblCboOferta INNER JOIN tblCBO ON tblCboOferta.id_cargo_fk = tblCBO.id_cargo INNER JOIN tblSGA_Ofertas ON tblCboOferta.oferta_fk = tblSGA_Ofertas.oferta INNER JOIN tblSGA_AreasConhecimento ON tblSGA_Ofertas.area_operacional_rj = tblSGA_AreasConhecimento.codigo"
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        While reader.Read()
            If reader.HasRows Then
                For x As Integer = 0 To rdOferta.Items.Count - 1
                    If reader("nome") = rdOferta.Items(x).Text Then
                        rdOferta.Items(x).Attributes.Add("style", "background-color: #87CEEB")
                    End If
                Next
            End If
        End While

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

    End Sub


    Private Sub colorirCargo()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("Senacrjconnectionstring").ToString)
        Dim sql As String = "SELECT  isnull(tblCBO.cargo,'') as cargo FROM tblCboOferta INNER JOIN tblCBO ON tblCboOferta.id_cargo_fk = tblCBO.id_cargo INNER JOIN tblSGA_Ofertas ON tblCboOferta.oferta_fk = tblSGA_Ofertas.oferta INNER JOIN tblSGA_AreasConhecimento ON tblSGA_Ofertas.area_operacional_rj = tblSGA_AreasConhecimento.codigo"
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.HasRows Then
            While reader.Read()


                For x As Integer = 0 To chkCargo.Items.Count - 1

                    If reader("cargo") = chkCargo.Items(x).Text Then
                        chkCargo.Items(x).Attributes.Add("style", "background-color: #66CCFF")
                    End If
                Next



            End While
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()
    End Sub
#End Region

    Protected Sub btninserir0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btninserir0.Click

        For i As Integer = 0 To chkCargo.Items.Count - 1
            'Label6.Text += ArrayCargo(i).ToString + " "
            If chkCargo.Items(i).Selected Then
                SqlrelacionaInserir.InsertParameters("id_cargo_fk").DefaultValue = chkCargo.Items(i).Value
                SqlrelacionaInserir.Insert()
            End If
        Next


        MultiView1.ActiveViewIndex = 1
        GridRelacionados.DataBind()
        chkCargo.DataBind()
        rdOferta.DataBind()


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
            colorirCargo()
            colorirProgramacao()
        Catch
        End Try

        Label5.Text = ""
        lbladicionarcargo1.Text = "Para modificar um CBO, clique na seta azul para selecionar."
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


    Protected Sub CheckBoxList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkCargo.SelectedIndexChanged
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
    End Sub

  
    Protected Sub View2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles View2.Load
        'colorirCargo()
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'colorirCargo()
    End Sub

    Protected Sub chkCargo_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkCargo.DataBound
        colorirCargo()
    End Sub

    Protected Sub rdOferta_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdOferta.DataBound
        colorirProgramacao()
    End Sub

    Protected Sub rdOferta_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdOferta.SelectedIndexChanged
        lblSelecionada.Text = "Oferta selecionada: " + rdOferta.SelectedItem.ToString
    End Sub
End Class
