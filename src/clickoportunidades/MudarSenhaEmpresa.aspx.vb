Imports Dados
Imports Cripto
Partial Class MudarSenhaEmpresa
    Inherits System.Web.UI.Page

    Protected Sub GridViewMudarSenha_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewMudarSenha.RowUpdating
        e.NewValues("senha") = Cripto.crplost(e.NewValues("senha"))
        GridViewMudarSenha.DataBind()
        Try

            lblAviso.Text = "Senha alterada com sucesso."

        Catch ex As Exception
            lblAviso.Text = "Senha não pode ser alterada, entre em contato com suporte."
        End Try


    End Sub


    Protected Sub GridViewMudarSenha_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridViewMudarSenha.RowUpdated

        Session("cnpj") = e.NewValues.Item("cnpj").ToString()

        Try

            SqlTrocaSenha.Insert()

        Catch ex As Exception

            lblAviso.Text = "Não é possível executar essa operação."

        End Try


    End Sub

    Protected Sub btnAprova_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAprova.Click
        Dim parCNPJ, parRazaoSocial, parNomeFantasia As New Parameter

        'Limpa todos os parâmetros correntes
        SqlMudaSenha.SelectParameters.Clear()

        parCNPJ.Name = "cnpj"
        If txtCNPJ.Text.Length = 0 Then
            parCNPJ.DefaultValue = "%"
        Else
            parCNPJ.DefaultValue = txtCNPJ.Text
        End If
        SqlMudaSenha.SelectParameters.Add(parCNPJ)

        parRazaoSocial.Name = "razao_social"
        If txtRazao.Text.Length = 0 Then
            parRazaoSocial.DefaultValue = "%"
        Else
            parRazaoSocial.DefaultValue = txtRazao.Text
        End If
        SqlMudaSenha.SelectParameters.Add(parRazaoSocial)

        parNomeFantasia.Name = "nome_fantasia"
        If txtNomeFantasia.Text.Length = 0 Then
            parNomeFantasia.DefaultValue = "%"
        Else
            parNomeFantasia.DefaultValue = txtNomeFantasia.Text
        End If
        SqlMudaSenha.SelectParameters.Add(parNomeFantasia)

        txtCNPJ.Text = ""
        txtNomeFantasia.Text = ""
        txtRazao.Text = ""
        lblAviso.Text = ""

    End Sub
End Class
