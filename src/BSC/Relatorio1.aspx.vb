
Partial Class BSC_Relatorio1
    Inherits System.Web.UI.Page

    Protected Sub BtExecuta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtExecuta.Click
        ReportViewer1.LocalReport.Refresh()
    End Sub
End Class
