Imports Microsoft.Reporting.WebForms
Imports System.Collections.Generic

Partial Class FrequenciaDocente_Relatorio_Instrutor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim parametroNome = New ReportParameter("nome", Session("c_Nome").ToString())
        Dim parametroMAT = New ReportParameter("matricula", Session("c_Matricula").ToString())
        Dim parametros As New List(Of ReportParameter)
        parametros.Add(parametroNome)
        parametros.Add(parametroMAT)
        ReportViewer1.LocalReport.SetParameters(parametros)
    End Sub
End Class
