
Partial Class BSC_teste
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Label1.Text = Session("c_IdUsuario")
        Label2.Text = Session("c_nome")
        Label3.Text = Session("c_matricula")
        Label7.Text = Request.ServerVariables(28)
        Label4.Text = Request.ServerVariables(32)
        Label5.Text = Request.ServerVariables(37)
        Label6.Text = Session("c_workstation")
    End Sub
End Class
