
Partial Class Area
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        SqlArea.Insert()
        GridArea.DataBind()
        txtArea.Text = ""
    End Sub
End Class
