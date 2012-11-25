
Partial Class Sos_CadastroServico
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Try
            sdsServico.Insert()
            lblErro.Text = "Resgistro incluído."

        Catch ex As Exception
            lblErro.Text = ex.Message.ToString()

        Finally
            grdServico.DataBind()
        End Try

        txtNome.Text = ""
        txtDescricao.Text = ""


    End Sub

    Protected Sub grdServico_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdServico.RowCommand
        lblErro.Text = ""
    End Sub

    Protected Sub grdServico_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles grdServico.RowUpdated
        lblErro.Text = "Resgistro alterado."
    End Sub
End Class
