
Partial Class TpProjeto
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        SqlTpProjetoGrid.Insert()
        GridTpProjeto.DataBind()
        txtTpProjeto.Text = ""
    End Sub
End Class
