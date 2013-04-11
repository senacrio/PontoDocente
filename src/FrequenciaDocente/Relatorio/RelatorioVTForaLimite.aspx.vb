Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_Relatorio_RelatorioVTForaLimite
    Inherits System.Web.UI.Page

    'Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"

    Private Function GetParametroAtivo() As Parametro
        Dim db As New FrequenciaDocenteDataContext(conn)
        Dim par = (From p In db.Parametros _
                  Where p.Ano = DateTime.Now.Year And _
                  p.Mes = DateTime.Now.Month And _
                  p.Ativo _
                  Select p).FirstOrDefault()

        Return par
    End Function



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim parametro = GetParametroAtivo()

        Session("c_ValorVT") = parametro.VL_CT_VT
        Session("c_Parametro") = parametro.Id
    End Sub
End Class
