Imports CRUD


Partial Class AdmAlterarEmpresa
    Inherits System.Web.UI.Page

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        Select Case e.Item.Value
            Case "0"

                Session("EmpresaID") = cbonome_fantasia.SelectedValue
                MultiView1.ActiveViewIndex = 0

                Exit Select

            Case "1"

                Session("EmpresaID") = cbonome_fantasia.SelectedValue

                MultiView1.ActiveViewIndex = 1



                Dim oempresa As New Empresas
                Dim srepresentante As String

                oempresa.PossuiRepresentante(Session("EmpresaID"))
                srepresentante = oempresa.PossuiRepresentante(Session("empresaID"))
                If srepresentante = 0 Then

                    MultiView1.ActiveViewIndex = 2

                    lblFaltarepresentante3.Text = "Cadastro de dados do representante"
                    lblAvisoRepresentante0.Text = "Clique aqui para incluir um representante ou cancelar operação."
                    Session("_modoRep") = "Incluir"
                    ibtIncluir.Visible = True
                    ibtSalvar.Visible = False
                    lblFaltarepresentante2.Visible = False
                    lblAvisoRepresentante.Visible = True

                Else
                    MultiView1.ActiveViewIndex = 1
                    Session("_modoEmp") = "Alterar"
                    lblEmpresaAviso.Text = "Seus dados foram salvos com sucesso."
                End If
                Exit Select
            Case "3"
                Session("EmpresaID") = cbonome_fantasia.SelectedValue
                MultiView1.ActiveViewIndex = 3


                Exit Select



        End Select
        lblAvisoRepresentante.Text = "Clique aqui para incluir um representante."
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            CRUD.Popula(View1, sqlEmpresa)
        End If

        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        'gridRepresentantes.DataBind()
        lblEmpresaAviso.Text = ""
        'A empresa possui conta, mas a senha está errada
        Dim oEmpresa As New Empresas

        Session("_modoEmp") = "Alterar"

        Session("EmpresaID") = oEmpresa.ID(Session("EmpresaCNPJ"))

        'Verifico se o usuario cadastrou o nome da empresa para que possa
        'ser visualizado na tela.

        oEmpresa.PegaRegistro(Session("EmpresaCNPJ"))

        'If oEmpresa.Registro.Count = 0 Then
        'Response.Write("Sessão expirou...<br>")
        'Response.Write("<a href='empresa.aspx'>Clique aqui para logar novamente.</a>")
        'Response.End()
        'End If

        If Session("Empresa") Is DBNull.Value Then
            lblEmpresalogado.Text = ""
        Else
            lblEmpresalogado.Text = Session("Empresa")
        End If

        lblAvisoCNAE.Text = ""




    End Sub

    Protected Sub ibtSalvarEmpresa_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarEmpresa.Click
        Try
            If cboid_cnae_fkPai.SelectedValue = "" Or cboid_cnae_fk.SelectedValue = "" Then

                lblAvisoCNAE.Text = "Por favor selecione uma das opções acima."

            Else
                Session("EmpresaID") = cbonome_fantasia.SelectedValue
                sqlEmpresa.Update()
                SqlAlteraEmpresa.Insert()
                lblEmpresaAviso.Text = "Seus dados foram salvos, favor prosseguir com cadastro de representante."

            End If
        Catch ex As Exception
            lblEmpresaAviso.Text = "Dados inválidos não foram inseridos, favor verificar campos do formulário."
        End Try

        MultiView1.ActiveViewIndex = 1


    End Sub

    Protected Sub ibtRepresentanteIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtRepresentanteIncluir.Click

        Dim oempresa As New Empresas
        Dim srepresentante As String

        oempresa.PossuiRepresentante(Session("EmpresaID"))
        srepresentante = oempresa.PossuiRepresentante(Session("empresaID"))
        If srepresentante = 0 Then

            MultiView1.ActiveViewIndex = 2
            Session("_modoRep") = "Incluir"
            ibtIncluir.Visible = True
            btnCancelar.Visible = True
            ibtSalvar.Visible = False
            lblFaltarepresentante2.Visible = False

            lblAvisoRepresentante0.Text = "Clique aqui para incluir um representante ou cancelar operação."
            lblFaltarepresentante1.Text = "Cadastro de representante obrigatório"
            lblFaltarepresentante3.Text = "Cadastro de representante obrigatório"
            lblAvisoRepresentante.Visible = True
            lblFaltarepresentante2.Visible = False

        Else
            MultiView1.ActiveViewIndex = 2
            lblAvisoRepresentante0.Text = "Clique aqui para incluir um representante ou cancelar operação."
            Session("_modoRep") = "Incluir"
            ibtIncluir.Visible = True
            ibtSalvar.Visible = False
            lblFaltarepresentante2.Visible = False
            lblAvisoRepresentante.Visible = True

        End If

        gridRepresentantes.DataBind()
        'sqlEmpresa.Update()

    End Sub

    Protected Sub gridRepresentantes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridRepresentantes.SelectedIndexChanged

        Session("_modoRep") = "Alterar"
        ibtSalvar.Visible = True
        ibtIncluir.Visible = False
        btnCancelar.Visible = True
        Session("id_representante") = gridRepresentantes.SelectedValue()
        MultiView1.ActiveViewIndex = 2
        lblFaltarepresentante2.Visible = True
        lblFaltarepresentante2.Text = "Dados atualizados com sucesso."
        lblFaltarepresentante3.Text = "Alteração de dados do representante"
        lblAvisoRepresentante0.Text = "Clique aqui para alterar os dados ou cancelar operação."
        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboestado.SelectedIndexChanged

        cboid_municipio.DataBind()


    End Sub

    Protected Sub ibtSalvar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvar.Click
        Session("empresaid") = cbonome_fantasia.SelectedValue
        lblFaltarepresentante3.Visible = False
        ibtCancelar.Visible = False
        ibtSalvar.Visible = False
        SqlRepresentantesGrid.Update()
        gridRepresentantes.DataBind()
        MultiView1.ActiveViewIndex = 1
    End Sub


    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        Session("EmpresaID") = cbonome_fantasia.SelectedValue

        If MultiView1.ActiveViewIndex = 0 Then
            If Session("_modoEmp") = "Alterar" Then

                'ALTERAR - Mudificado por Rafael - Dia 03/09/2008 Verificar com o André.
                'CRUD.Popula(View1, sqlEmpresa)

            ElseIf Session("_modoEmp") = "Incluir" Then

                'INCLUIR
                CRUD.Limpa(View1)
            End If


        ElseIf MultiView1.ActiveViewIndex = 2 Then

            If Session("_modoRep") = "Alterar" Then

                'ALTERAR
                CRUD.Popula(View2, sqlRepresentantes)

            ElseIf Session("_modoRep") = "Incluir" Then

                'INCLUIR
                CRUD.Limpa(View2)

            End If
        End If

    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtIncluir.Click
        Session("EmpresaID") = cbonome_fantasia.SelectedValue
        SqlRepresentantesGrid.Insert()
        gridRepresentantes.DataBind()
        MultiView1.ActiveViewIndex = 1



    End Sub


    'Protected Sub ibtVoltarEmpresas_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtVoltarEmpresas.Click
    'Dim oempresa As New Empresas
    'Dim srepresentante As String

    '   oempresa.PossuiRepresentante(Session("EmpresaID"))
    '  srepresentante = oempresa.PossuiRepresentante(Session("empresaID"))
    ' If srepresentante = 0 Then
    '    MultiView1.ActiveViewIndex = 2
    '   ibtSalvar.Visible = False
    '  btnCancelar.Visible = False
    ' lblFaltarepresentante3.Visible = True
    '   lblFaltarepresentante3.Text = "Cadastro de representante é obrigatório, favor preencher os dados."
    '  lblFaltarepresentante1.Text = "Cadastro de representante obrigatório, favor preencher os dados."
    ' lblFaltarepresentante2.Text = "Cadastro de representante obrigatório, favor preencher os dados."
    'lblFaltarepresentante3.Text = "Cadastro de representante obrigatório, favor preencher os dados."
    '    Else
    '       Response.Redirect("empresa.aspx")
    '  End If
    'End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelar.Click
        Session("empresaid") = cbonome_fantasia.SelectedValue
        MultiView1.ActiveViewIndex = 1
        lblFaltarepresentante2.Text = "Dados não foram atualizados."
    End Sub

    Protected Sub btnCancelarEmpresa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelarEmpresa.Click
        Session("empresaid") = cbonome_fantasia.SelectedValue
        Sqlcancelamento.Update()
        Sqlcancelamento.Insert()


        System.Threading.Thread.Sleep(3000)

        Response.Clear()
        FormsAuthentication.SignOut()
        Session.Abandon()

        Response.Redirect("AdmAlterarEmpresa.aspx")
        lblEmpresaAviso.Text = "Conta foi cancelada"

    End Sub

    Protected Sub ibtSalvar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvar0.Click
        Session("empresaid") = cbonome_fantasia.SelectedValue


        CRUD.Popula(View1, sqlEmpresa)


    End Sub

    Protected Sub ImageButton1_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            SqlRepresentantesGrid.Delete()


        Catch ex As Exception
            lblFaltarepresentante3.Text = "Para excluir o representante, clique na seta laranja."
        End Try
        Session("empresaID") = cbonome_fantasia.SelectedValue
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub cboid_cnae_fkPai_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_cnae_fkPai.DataBound
        cboid_cnae_fk.DataBind()
    End Sub

    Protected Sub btnpesquisar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnpesquisar.Click
        Dim parEmpresa, parCNPJ As New Parameter

        SqlbuscaEmpresa.SelectParameters.Clear()

        parEmpresa.Name = "nome_fantasia"
        If txtBuscaEmpresa.Text.Length = 0 Then
            parEmpresa.DefaultValue = "%"
        Else
            parEmpresa.DefaultValue = txtBuscaEmpresa.Text
        End If
        SqlbuscaEmpresa.SelectParameters.Add(parEmpresa)

        parCNPJ.Name = "cnpj"
        If txtBuscaCNPJ.Text.Length = 0 Then
            parCNPJ.DefaultValue = "%"
        Else
            parCNPJ.DefaultValue = txtBuscaCNPJ.Text
        End If
        SqlbuscaEmpresa.SelectParameters.Add(parCNPJ)

        txtBuscaEmpresa.Text = ""
        txtBuscaCNPJ.Text = ""
    End Sub
End Class
