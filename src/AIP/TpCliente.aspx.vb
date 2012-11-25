
Partial Class TpCliente
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        SqlTpClienteGrid.Insert()
        GridTpCliente.DataBind()
        txtTpCliente.Text = ""
    End Sub
End Class
