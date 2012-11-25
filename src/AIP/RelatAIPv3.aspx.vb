
Partial Class AIP_RelatAIPv3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            Dim oFuncionario As New Funcionario
            oFuncionario.PegaUnidadeLotacao(Session("c_Matricula"))
            Session("CentroCusto") = oFuncionario.UnidadeNegocio
            oFuncionario.Close()
            '  End If
            Dim _UnidadeLotacao As String = Session("CentroCusto")

            ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote
            ReportViewer1.ServerReport.ReportServerUrl = New Uri("http://banco01/reportserver")
            ReportViewer1.ServerReport.ReportPath = "/AIP/RelatAIPv3"

            Dim params(0) As Microsoft.Reporting.WebForms.ReportParameter

            Dim pUnidLotac As Microsoft.Reporting.WebForms.ReportParameter
            pUnidLotac = New Microsoft.Reporting.WebForms.ReportParameter("UnidLotac", _UnidadeLotacao)

            params(0) = pUnidLotac
            ReportViewer1.ServerReport.SetParameters(params)
            'If Not Page.IsPostBack Then
            ReportViewer1.ServerReport.Refresh()
        End If

    End Sub

End Class
