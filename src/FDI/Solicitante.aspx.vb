Partial Class Solicitante
    Inherits System.Web.UI.Page
 
    Protected Sub GridSolicitante_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridSolicitante.RowDeleted
        txtAviso.Text = ""
        txtMatric.Text = ""
        txtEMail.Text = ""
        txtNome.Text = ""
    End Sub
 
    Protected Sub GridSolicitante_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridSolicitante.RowDeleting
        Try
            SqlSolicitante.Delete()
            GridSolicitante.DataBind()
            txtMatric.Text = ""
            txtEMail.Text = ""
            txtNome.Text = ""
            txtAviso.Text = "Solicitante eliminada com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível eliminar este Solicitante. Existe relacionamento com iniciativas."
        End Try
    End Sub
 
    Protected Sub Gridsolicitante_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridSolicitante.SelectedIndexChanged
        txtAviso.Text = ""
        txtMatric.Text = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(5).Text)
        txtNome.Text = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(6).Text)
        txtEMail.Text = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(7).Text)
        txtLogin.Text = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(8).Text)
        DDLEmpresa.SelectedValue = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(1).Text)
        DDLArea.SelectedValue = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(3).Text)
        Session("Id_Solicitante") = GridSolicitante.DataKeys(GridSolicitante.SelectedIndex).Values("id_Solicitante")
    End Sub
 
    Protected Sub ImIncSolic_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImIncSolic.Click
        If txtMatric.Text <> "" Then
            Try
                SqlSolicitante.Insert()
                GridSolicitante.DataBind()
                txtAviso.Text = "Solicitante incluído com sucesso"
                txtMatric.Text = ""
                txtEMail.Text = ""
                txtNome.Text = ""
                txtLogin.Text = ""
            Catch ex As Exception
                txtAviso.Text = "Não foi possível incluir novo solicitante. Já existe solicitante com o código ou nome cadastrado "
            End Try
        End If
    End Sub
 
    Protected Sub ImDelSolic_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
 
    End Sub
 
    Protected Sub botaoVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoVoltar.Click
        txtMatric.Text = ""
        txtEMail.Text = ""
        txtNome.Text = ""
    End Sub
 
    Protected Sub botaoAlterarSolicitante_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAlterarSolic.Click
        Try
            SqlSolicitante.Update()
            GridSolicitante.DataBind()
            txtAviso.Text = "Dados do solicitante alterados com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível alterar dados do solicitante. Favor verificar mensagem de erro abaixo:  " & ex.ToString
        End Try
    End Sub
 
    Protected Sub GridSolicitante_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridSolicitante.DataBound
        txtAviso.Text = ""
    End Sub
 
    Protected Sub DDLEmpresa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLEmpresa.SelectedIndexChanged
        txtMatric.Text = ""
        txtEMail.Text = ""
        txtNome.Text = ""
        txtLogin.Text = ""
    End Sub

    Protected Sub SqlSolicitante_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlSolicitante.Selecting

    End Sub
End Class
