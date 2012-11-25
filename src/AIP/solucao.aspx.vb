
Partial Class solucao
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        SqlsolucaoGrid.Insert()
        Gridsolucao.DataBind()
        txtsolucao.Text = ""
    End Sub

End Class
