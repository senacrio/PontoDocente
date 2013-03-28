﻿Imports Senac.ControleRHDocente
Imports System.Collections.Generic

Partial Class FrequenciaDocente_controls_EntradaSaida
    Inherits System.Web.UI.UserControl

    Public Property SelectedValueDe() As String
        Get
            Return ddlDe.SelectedValue
        End Get
        Set(ByVal value As String)
            ddlDe.SelectedValue = value
        End Set
    End Property

    Public Property SelectedValueAte() As String
        Get
            Return ddlAte.SelectedValue
        End Get
        Set(ByVal value As String)
            ddlAte.SelectedValue = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (Not Page.IsPostBack) Then
            CarregarHoras()
            '  ddlAte.SelectedIndex = ddlAte.Items.Count - 1
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        CarregarHoras()
        'ddlAte.SelectedIndex = ddlAte.Items.Count - 1

    End Sub

    Private Sub CarregarHoras()
        Dim listaHoraManha As New List(Of String)
        ddlDe.Items.Clear()
        ddlAte.Items.Clear()

        If (DropDownList1.SelectedValue.Equals("1")) Then



            Dim data As DateTime = Convert.ToDateTime("2001-01-01 06:00")
            Dim dataFim As DateTime = Convert.ToDateTime("2001-01-01 12:00")

            While data <= dataFim

                ddlDe.Items.Add(data.ToString("HH:mm"))
                ddlAte.Items.Add(data.ToString("HH:mm"))
                data = data.AddMinutes(15)
            End While

            ddlDe.SelectedValue = "09:00"
            ddlAte.SelectedValue = "12:00"
        ElseIf (DropDownList1.SelectedValue.Equals("2")) Then



            Dim data As DateTime = Convert.ToDateTime("2001-01-01 12:15")
            Dim dataFim As DateTime = Convert.ToDateTime("2001-01-01 17:45")
            ddlDe.Items.Add("12:01")
            While data <= dataFim
                ddlDe.Items.Add(data.ToString("HH:mm"))
                ddlAte.Items.Add(data.ToString("HH:mm"))
                data = data.AddMinutes(15)
            End While
            ddlAte.Items.Add("17:59")


            ddlDe.SelectedValue = "13:00"
            ddlAte.SelectedValue = "17:59"

        ElseIf (DropDownList1.SelectedValue.Equals("3")) Then



            Dim data As DateTime = Convert.ToDateTime("2001-01-01 18:00")
            Dim dataFim As DateTime = Convert.ToDateTime("2001-01-01 23:59")

            While data <= dataFim
                ddlDe.Items.Add(data.ToString("HH:mm"))
                ddlAte.Items.Add(data.ToString("HH:mm"))
                data = data.AddMinutes(15)
            End While

            ddlDe.SelectedValue = "18:00"
            ddlAte.SelectedValue = "22:00"

        End If

    End Sub

End Class
