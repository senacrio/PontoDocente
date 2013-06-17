Imports Microsoft.Reporting.WebForms
Imports System.Collections.Generic
Imports System.Reflection

Partial Class FrequenciaDocente_Relatorio_Instrutor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        DisableUnwantedExportFormat(ReportViewer1, "Excel")
        'Session("c_Nome") = "Fulano de tal marques"
        'Session("c_Matricula") = "14134"
        Dim parametroNome = New ReportParameter("nome", Session("c_Nome").ToString())
        Dim parametroMAT = New ReportParameter("matricula", Session("c_Matricula").ToString())
        Dim parametros As New List(Of ReportParameter)
        parametros.Add(parametroNome)
        parametros.Add(parametroMAT)
        ReportViewer1.LocalReport.SetParameters(parametros)
    End Sub

    Public Sub DisableUnwantedExportFormat(ByVal ReportViewerID As ReportViewer, ByVal strFormatName As String)
        Dim info As FieldInfo

        For Each extension As RenderingExtension In ReportViewerID.LocalReport.ListRenderingExtensions()
            If extension.Name = strFormatName Then
                info = extension.[GetType]().GetField("m_isVisible", BindingFlags.Instance Or BindingFlags.NonPublic)
                info.SetValue(extension, False)
            End If
        Next
    End Sub
End Class
