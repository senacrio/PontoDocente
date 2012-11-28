
Partial Class FrequenciaDocente_controls_DeAte


    Inherits System.Web.UI.UserControl


    Public Property De() As String
        Get
            Return txtDeHora.Text + ":" + txtDeMinuto.Text
        End Get
        Set(ByVal value As String)
            txtDeHora.Text = value.Split(":")(0)
            txtDeMinuto.Text = value.Split(":")(1)
        End Set
    End Property


    Public Property Ate() As String
        Get
            Return txtAteHora.Text + ":" + txtAteMinuto.Text
        End Get
        Set(ByVal value As String)
            txtAteHora.Text = value.Split(":")(0)
            txtAteMinuto.Text = value.Split(":")(1)
        End Set
    End Property


End Class
