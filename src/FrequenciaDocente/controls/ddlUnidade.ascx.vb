Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_controls_ddlUnidade
    Inherits System.Web.UI.UserControl
    'Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"


    Public Property SelectedValue() As String
        Get
            Return DropDownList1.SelectedValue
        End Get
        Set(ByVal value As String)
            DropDownList1.SelectedValue = value
        End Set
    End Property

    Public Sub Limpar()
        DropDownList1.SelectedIndex = 0
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim db As New FrequenciaDocenteDataContext(conn)

        If (Session("_unidades") Is Nothing) Then
            Session("_unidades") = From u In db.vwUnidadePontoDocentes _
                                   Select u
        End If

        DropDownList1.DataSource = Session("_unidades")
        DropDownList1.DataValueField = "IdUnidade"
        DropDownList1.DataTextField = "Unidade"
        DropDownList1.DataBind()

        db.Dispose()

    End Sub
End Class
