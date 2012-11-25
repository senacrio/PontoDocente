
Partial Class Sos_audit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" Then
            Response.Write(Request.ServerVariables("REMOTE_ADDR"))
        Else
            Response.Write(Request.ServerVariables("HTTP_X_FORWARDED_FOR"))
        End If
    End Sub
End Class
