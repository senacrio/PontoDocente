Imports Dados
Imports Cripto
Partial Class MudarSenha
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

        Session("nome") = e.NewValues.Item("nome").ToString()

        Try

            SqlLogVaga.Insert()

        Catch ex As Exception

            lblAviso.Text = "Não é possível executar essa operação."

        End Try



    End Sub

    Protected Sub btnBuscar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnBuscar.Click
        Dim parNome, parCPF As New Parameter

        'Limpa todos os parâmetros correntes
        SqlMudaSenha.SelectParameters.Clear()

        parNome.Name = "nome"
        If txtNome.Text.Length = 0 Then
            parNome.DefaultValue = "%"
        Else
            parNome.DefaultValue = txtNome.Text
        End If
        SqlMudaSenha.SelectParameters.Add(parNome)

        parCPF.Name = "identificador"
        If txtCPF.Text.Length = 0 Then
            parCPF.DefaultValue = "%"
        Else
            parCPF.DefaultValue = txtCPF.Text
        End If
        SqlMudaSenha.SelectParameters.Add(parCPF)

        txtCPF.Text = ""
        txtNome.Text = ""
        lblAviso.Text = ""
    End Sub
End Class
