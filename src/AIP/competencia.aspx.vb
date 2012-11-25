
Partial Class competencia
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        SqlCompetenciaGrid.Insert()
        GridCompetencia.DataBind()
        txtcompetencia.Text = ""
    End Sub

End Class
