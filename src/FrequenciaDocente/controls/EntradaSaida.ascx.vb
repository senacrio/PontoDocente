Imports Senac.ControleRHDocente
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
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        CarregarHoras()


    End Sub

    Private Sub CarregarHoras()
        Dim listaHoraManha As New List(Of String)
        ddlDe.Items.Clear()
        ddlAte.Items.Clear()

        If (DropDownList1.SelectedValue.Equals("1")) Then



            Dim data As DateTime = Convert.ToDateTime("2001-01-01 08:00")
            Dim dataFim As DateTime = Convert.ToDateTime("2001-01-01 12:00")

            While data <= dataFim

                ddlDe.Items.Add(data.ToString("HH:mm"))
                ddlAte.Items.Add(data.ToString("HH:mm"))
                data = data.AddMinutes(15)
            End While

        ElseIf (DropDownList1.SelectedValue.Equals("2")) Then



            Dim data As DateTime = Convert.ToDateTime("2001-01-01 13:00")
            Dim dataFim As DateTime = Convert.ToDateTime("2001-01-01 17:00")

            While data <= dataFim
                ddlDe.Items.Add(data.ToString("HH:mm"))
                ddlAte.Items.Add(data.ToString("HH:mm"))
                data = data.AddMinutes(15)
            End While
        ElseIf (DropDownList1.SelectedValue.Equals("3")) Then



            Dim data As DateTime = Convert.ToDateTime("2001-01-01 18:00")
            Dim dataFim As DateTime = Convert.ToDateTime("2001-01-01 22:00")

            While data <= dataFim
                ddlDe.Items.Add(data.ToString("HH:mm"))
                ddlAte.Items.Add(data.ToString("HH:mm"))
                data = data.AddMinutes(15)
            End While

        End If

    End Sub

End Class
