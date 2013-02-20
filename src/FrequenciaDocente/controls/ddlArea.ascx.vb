Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_controls_ddlArea
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

        If (Not Page.IsPostBack) Then

            If (Session("_areas") Is Nothing) Then
                Session("_areas") = From u In db.AreaDocentes _
                                       Select u _
                                       Order By u.Nome

            End If

            DropDownList1.DataSource = Session("_areas")
            DropDownList1.DataValueField = "Id"
            DropDownList1.DataTextField = "Nome"
            DropDownList1.DataBind()


        End If
        db.Dispose()
    End Sub
End Class
