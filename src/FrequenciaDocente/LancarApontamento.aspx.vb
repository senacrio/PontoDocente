Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_LancarApontamento
    Inherits System.Web.UI.Page
    ' Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        LoadGridVT()
    End Sub

    Private Sub LoadGridVT()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Dim listaVT = From r In db.AgendaExecutadas _
                      Where r.Matricula.Equals("00014134") _
                      Select r


        grdVT.DataSource = listaVT
        grdVT.DataBind()


    End Sub

End Class
