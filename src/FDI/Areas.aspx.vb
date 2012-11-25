
Partial Class Areas
    Inherits System.Web.UI.Page

    Protected Sub GridEmpresa_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridArea.DataBound
        txtAviso.Text = ""
    End Sub

    Protected Sub GridEmpresa_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridArea.RowDeleted
        txtAviso.Text = ""
        txtNomeArea.Text = ""
        txtCodArea.Text = ""
    End Sub

    Protected Sub GridEmpresa_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridArea.RowDeleting
        Try
            SqlArea.Delete()
            GridArea.DataBind()
            txtNomeArea.Text = ""
            txtCodArea.Text = ""
            txtAviso.Text = "Área eliminada com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível eliminar esta Área. Existe relacionamento com iniciativas."
        End Try
    End Sub

    Protected Sub GridEmpresa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridArea.SelectedIndexChanged
        txtAviso.Text = ""
        txtCodArea.Text = Server.HtmlDecode(GridArea.SelectedRow.Cells(4).Text)
        txtNomeArea.Text = Server.HtmlDecode(GridArea.SelectedRow.Cells(5).Text)
        Session("Id_Empresa") = GridArea.SelectedRow.Cells(1).Text
    End Sub

    Protected Sub ImIncArea_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImIncArea.Click
        If txtNomeArea.Text <> "" Then
            Try
                SqlArea.Insert()
                GridArea.DataBind()
                txtAviso.Text = "Área incluída com sucesso"
                txtNomeArea.Text = ""
            Catch ex As Exception
                txtAviso.Text = "Não foi possível incluir nova área. Já existe área com o código ou nome escolhido "
            End Try
        End If
    End Sub

    Protected Sub ImDelArea_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub botaoVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoVoltar.Click
        txtNomeArea.Text = ""
        txtCodArea.Text = ""
    End Sub

    Protected Sub botaoAlterarEmpresa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAlterarArea.Click
        Try
            SqlArea.Update()
            GridArea.DataBind()
            txtAviso.Text = "Dados da área alterados com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível alterar dados da área. Favor verificar mensagem de erro abaixo:  " & ex.ToString
        End Try
    End Sub
End Class
