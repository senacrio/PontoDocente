Imports Senac.ControleRHDocente

Partial Class FrequenciaDocente_controls_EntradaSaida
    Inherits System.Web.UI.UserControl

    Public Property SelectedValue() As String
        Get
            Return ddlDeAte.SelectedValue
        End Get
        Set(ByVal value As String)
            ddlDeAte.SelectedValue = value
        End Set
    End Property


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
