Imports System.Data.SqlTypes
Imports CRUD
Partial Class clickoportunidades_AdmVagasManter
    Inherits System.Web.UI.Page
    Dim oCrud As New CRUD2

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Session("empresavagasPopulado") = False
        'Dim oVagas As New Vagas
        'Dim oEmpresa As New Empresas
        'Session("id_vaga") = oVagas.Inclui(oEmpresa.ID(Session("EmpresaCNPJ")))
        'formVaga.ChangeMode(FormViewMode.Edit)
        Session("_modo") = "Incluir"
        Session("id_empresa") = GridEmpresas.SelectedValue
        MultiView1.ActiveViewIndex = 1

        ibtSalvarAlterar.Visible = False

    End Sub

    Protected Sub ddlModalidade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CBOModalidade.SelectedIndexChanged
        If CBOModalidade.SelectedValue() = "E" Then
            datmodalidade_fim.Enabled = False
        Else
            datmodalidade_fim.Enabled = True
        End If
    End Sub

    Protected Sub ibtCancela_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        If Not IsPostBack Then
            Session("empresavagasPopulado") = False
        End If

        lblAvisoCadastro.Visible = False
        ImageButton1.Visible = False
        lblareaEdicao.Visible = False
        lbltituloEmpresas.Visible = False
        lbltituloVagas.Visible = False

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender




        If Session("_modo") = "Alterar" Then

            oCrud.Popula(View2, sqlVagaForm)

            ibtSalvarAlterar.Visible = True
            ibtSalvarInclusao.Visible = False
            lblareaEdicao.Visible = True


        ElseIf Session("_modo") = "Incluir" Then

            'INCLUIR
            lbltituloVagas.Visible = False
            ibtSalvarAlterar.Visible = False
            ibtSalvarInclusao.Visible = True
            lblareaEdicao.Visible = True
            oCrud.Limpa(View2)


        End If
    End Sub

    Protected Sub ibtSalvar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarInclusao.Click
        Try
            Session("id_empresa") = gridVaga.SelectedValue
            sqlVagaForm.Insert()
            gridVaga.DataBind()
            MultiView1.ActiveViewIndex = 1

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        SqlLogAlteracao.Insert()
    End Sub

    Protected Sub ibtAlterar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarAlterar.Click
        Session("_modo") = "Alterar"
        sqlVagaForm.Update()
        MultiView1.ActiveViewIndex = 1
        gridVaga.DataBind()
        SqlLogAlteracao.Insert()
    End Sub
    Protected Sub cboid_cargo_fkPai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_cargo_fkPai.SelectedIndexChanged
        cboid_cargo_fk.DataBind()
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnVoltar.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub btnAprova_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAprova.Click

        lbltituloEmpresas.Visible = True

        Dim parCNPJ, parRazaoSocial, parNomeFantasia, parAprovada, parcancelamento As New Parameter

        'Limpa todos os parâmetros correntes
        sqlAprovacaoGrid.SelectParameters.Clear()

        parCNPJ.Name = "cnpj"
        If txtCNPJ.Text.Length = 0 Then
            parCNPJ.DefaultValue = "%"
        Else
            parCNPJ.DefaultValue = txtCNPJ.Text
        End If
        sqlAprovacaoGrid.SelectParameters.Add(parCNPJ)

        parRazaoSocial.Name = "razao_social"
        If txtRazao.Text.Length = 0 Then
            parRazaoSocial.DefaultValue = "%"
        Else
            parRazaoSocial.DefaultValue = txtRazao.Text
        End If
        sqlAprovacaoGrid.SelectParameters.Add(parRazaoSocial)

        parNomeFantasia.Name = "nome_fantasia"
        If txtNomefantasia.Text.Length = 0 Then
            parNomeFantasia.DefaultValue = "%"
        Else
            parNomeFantasia.DefaultValue = txtNomefantasia.Text
        End If
        sqlAprovacaoGrid.SelectParameters.Add(parNomeFantasia)

        parAprovada.Name = "aprovado"
        parAprovada.DefaultValue = rdAprovada.SelectedValue
        sqlAprovacaoGrid.SelectParameters.Add(parAprovada)

        txtCNPJ.Text = ""
        txtNomefantasia.Text = ""
        txtRazao.Text = ""
    End Sub

    Protected Sub GridEmpresas_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEmpresas.SelectedIndexChanged
        lbltituloVagas.Visible = True
        lbltituloEmpresas.Visible = True

        Session("id_empresa") = GridEmpresas.SelectedValue

        If gridVaga.SelectedIndex < 0 Then
            lbltituloVagas.Text = "Não há vagas abertas por essa empresa."
        End If

        
    End Sub

    Protected Sub gridVaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridVaga.SelectedIndexChanged
        lbltituloVagas.Visible = True
        ImageButton1.Visible = True

        Session("_modo") = "Alterar"
        Session("id_empresa_fk") = gridVaga.SelectedIndex

        MultiView1.ActiveViewIndex = 1
    End Sub
End Class


