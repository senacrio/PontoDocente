
Partial Class Ponto_Relatorios_MarcacaoPontoUsuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then


            Dim teste As String
            teste = Session("c_Matricula")
            ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote

            ReportViewer1.ServerReport.ReportServerUrl = New Uri("http://banco01/reportserver")
            ReportViewer1.ServerReport.ReportPath = "/Report_SisPonto/MarcacaoUsuario"

            Dim params(0) As Microsoft.Reporting.WebForms.ReportParameter

            Dim p As Microsoft.Reporting.WebForms.ReportParameter
            p = New Microsoft.Reporting.WebForms.ReportParameter("matricula", teste)

            params(0) = p

            ReportViewer1.ServerReport.SetParameters(params)

            ReportViewer1.ServerReport.Refresh()
        End If
    End Sub

  
End Class
