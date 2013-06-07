Imports Senac.ControleRHDocente
Imports System.Collections.Generic

Partial Class FrequenciaDocente_controls_EntradaSaida
    Inherits System.Web.UI.UserControl

    Public Property SelectedValueDe() As String
        Get
            Return ddlDe.SelectedItem.Text
        End Get
        Set(ByVal value As String)
            ddlDe.SelectedItem.Text = value
        End Set
    End Property

    Public Property SelectedValueAte() As String
        Get
            Return ddlAte.SelectedItem.Text
        End Get
        Set(ByVal value As String)
            ddlAte.SelectedItem.Text = value
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
            Dim i As Int16 = 0

            While data <= dataFim

                ddlDe.Items.Add(New ListItem(data.ToString("HH:mm"), i))
                ddlAte.Items.Add(New ListItem(data.ToString("HH:mm"), i))
                data = data.AddMinutes(15)

                i = i + 1
            End While

            ddlDe.SelectedValue = "12"
            ddlAte.SelectedValue = "24"
        ElseIf (DropDownList1.SelectedValue.Equals("2")) Then



            Dim data As DateTime = Convert.ToDateTime("2001-01-01 12:15")
            Dim dataFim As DateTime = Convert.ToDateTime("2001-01-01 17:45")
            ddlDe.Items.Add("12:01")
            Dim i As Int16 = 0
            While data <= dataFim

                ddlDe.Items.Add(New ListItem(data.ToString("HH:mm"), i))
                ddlAte.Items.Add(New ListItem(data.ToString("HH:mm"), i))
                data = data.AddMinutes(15)
                i = i + 1
            End While
            ddlAte.Items.Add("17:59")


            ddlDe.SelectedValue = "3"
            ddlAte.SelectedItem.Text = "17:59"

        ElseIf (DropDownList1.SelectedValue.Equals("3")) Then



            Dim data As DateTime = Convert.ToDateTime("2001-01-01 18:00")
            Dim dataFim As DateTime = Convert.ToDateTime("2001-01-01 23:59")

            Dim i As Int16 = 0
            While data <= dataFim

                ddlDe.Items.Add(New ListItem(data.ToString("HH:mm"), i))
                ddlAte.Items.Add(New ListItem(data.ToString("HH:mm"), i))
                data = data.AddMinutes(15)
                i = i + 1
            End While

            ddlDe.SelectedItem.Text = "18:00"
            ddlAte.SelectedItem.Text = "22:00"

        End If

    End Sub

End Class
