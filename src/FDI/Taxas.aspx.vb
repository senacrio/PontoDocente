
Partial Class Taxas
    Inherits System.Web.UI.Page

   
    Protected Sub ImIncArea_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImIncArea.Click
        sqlTaxa.Insert()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("c_Nome") = "" Then
            Response.Redirect("Default.aspx")
        End If

    End Sub
End Class
