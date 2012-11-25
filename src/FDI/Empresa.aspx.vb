
Partial Class Empresa
    Inherits System.Web.UI.Page

    Protected Sub GridEmpresa_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEmpresa.DataBound
        txtAviso.Text = ""
    End Sub

    Protected Sub GridEmpresa_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridEmpresa.RowDeleted
        txtAviso.Text = ""
        txtIdEmpresa.Text = ""
        txtNomeEmpresa.Text = ""
        txtCidadeEmpresa.Text = ""
        txtUFEmpresa.Text = ""
        txtCNPJEmpresa.Text = ""
        txtEnderecoEmpresa.Text = ""
    End Sub

    Protected Sub GridEmpresa_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridEmpresa.RowDeleting
        Try
            SqlEmpresa.Delete()
            GridEmpresa.DataBind()
            txtNomeEmpresa.Text = ""
            txtAviso.Text = "Empresa eliminada com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível eliminar esta Empresa. Existe relacionamento com iniciativas ou unidades."
        End Try
    End Sub

    Protected Sub GridEmpresa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEmpresa.SelectedIndexChanged
        txtAviso.Text = ""
        txtIdEmpresa.Text = GridEmpresa.SelectedRow.Cells(1).Text
        txtNomeEmpresa.Text = Server.HtmlDecode(GridEmpresa.SelectedRow.Cells(2).Text)
        txtCNPJEmpresa.Text = GridEmpresa.SelectedRow.Cells(3).Text
        txtEnderecoEmpresa.Text = Server.HtmlDecode(GridEmpresa.SelectedRow.Cells(4).Text)
        txtCidadeEmpresa.Text = GridEmpresa.SelectedRow.Cells(5).Text
        txtUFEmpresa.Text = GridEmpresa.SelectedRow.Cells(6).Text

    End Sub

    Protected Sub ImIncEmpresa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImIncEmpresa.Click
        Try
            SqlEmpresa.Insert()
            GridEmpresa.DataBind()
            txtAviso.Text = "Empresa incluída com sucesso"
            txtIdEmpresa.Text = ""
            txtNomeEmpresa.Text = ""
            txtCidadeEmpresa.Text = ""
            txtUFEmpresa.Text = ""
            txtCNPJEmpresa.Text = ""
            txtEnderecoEmpresa.Text = ""
        Catch ex As Exception
            txtAviso.Text = "Não foi possível incluir nova empresa. Já existe empresa com o código escolhido "
        End Try
    End Sub

    Protected Sub ImDelEmpresa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub botaoVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoVoltar.Click
        txtIdEmpresa.Text = ""
        txtNomeEmpresa.Text = ""
        txtCidadeEmpresa.Text = ""
        txtUFEmpresa.Text = ""
        txtCNPJEmpresa.Text = ""
        txtEnderecoEmpresa.Text = ""
    End Sub

    Protected Sub botaoAlterarEmpresa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAlterarEmpresa.Click
        Try
            SqlEmpresa.Update()
            GridEmpresa.DataBind()
            txtAviso.Text = "Dados da empresa alterados com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível alterar dados da empresa. Favor verificar mensagem de erro abaixo:  " & ex.ToString
        End Try
    End Sub
End Class
