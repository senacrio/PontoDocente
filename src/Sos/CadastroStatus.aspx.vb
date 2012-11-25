
Partial Class Sos_CadastroStatus
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Try
            sdsStatus.Insert()
            lblErro.Text = "Registro incluído."
        Catch ex As Exception
            lblErro.Text = ex.Message.ToString()
        Finally
            grdStatus.DataBind()
        End Try



        txtStatus.Text = ""

    End Sub

    Protected Sub grdStatus_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdStatus.RowCommand
        lblErro.Text = ""
    End Sub

    Protected Sub grdStatus_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles grdStatus.RowUpdated
        lblErro.Text = "Registro alterado."
    End Sub
End Class
