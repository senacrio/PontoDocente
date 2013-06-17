Imports Microsoft.Reporting.WebForms
Imports System.Collections.Generic
Imports System.Linq

Partial Class FrequenciaDocente_Relatorio_Divergencia
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedValue.Equals("Dia") Then
            dataInical.SelectionMode = CalendarSelectionMode.Day
        ElseIf DropDownList1.SelectedValue.Equals("Mês") Then
            dataInical.SelectionMode = CalendarSelectionMode.DayWeekMonth
        ElseIf DropDownList1.SelectedValue.Equals("Semana") Then
            dataInical.SelectionMode = CalendarSelectionMode.DayWeek
        End If


    End Sub

    Protected Sub btnGerar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGerar.Click
        ReportViewer1.Visible = True
        Dim datainicio, datafim As New Date()
        Dim tipo As Integer

        If DropDownList1.SelectedValue.Equals("Dia") Then
            datainicio = dataInical.SelectedDate
            datafim = datainicio
            tipo = 2
        ElseIf DropDownList1.SelectedValue.Equals("Mês") Then
            datainicio = dataInical.SelectedDates(0)
            datafim = dataInical.SelectedDates(dataInical.SelectedDates.Count - 1)
            tipo = 220
        ElseIf DropDownList1.SelectedValue.Equals("Semana") Then
            datainicio = dataInical.SelectedDates(0)
            datafim = dataInical.SelectedDates(dataInical.SelectedDates.Count - 1)
            tipo = 44
        End If

        Dim parametroDataInicio = New ReportParameter("datainicio", datainicio)
        Dim parametroDataFim = New ReportParameter("datafim", datafim)
        Dim parametroTipo = New ReportParameter("tipo", tipo)
        Dim parametros As New List(Of ReportParameter)
        parametros.Add(parametroDataInicio)
        parametros.Add(parametroDataFim)
        parametros.Add(parametroTipo)
        ReportViewer1.LocalReport.SetParameters(parametros)

        ReportViewer1.DataBind()
    End Sub
End Class
