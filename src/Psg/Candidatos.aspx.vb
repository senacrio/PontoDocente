
Partial Class Psg_Candidatos
    Inherits System.Web.UI.Page

    Protected Sub ddlUnidades_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlUnidades.SelectedIndexChanged
        GridView1.DataBind()

    End Sub
End Class
