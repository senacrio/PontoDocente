Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_CronogramaFechamento
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Private Sub UpdateParametro(field As String, valor As String)
        Dim db As New FrequenciaDocenteDataContext
        Dim parametros As New Parametro
        parametros = (From p In db.Parametros _
                     Where p.ParametroField = field).FirstOrDefault()


        parametros.Value = valor



        db.SubmitChanges()
        db.Dispose()

    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        'quadro 1
        Dim dataPAI_VTde As String = "20" + txtDeAno.Text + "-" + txtDeMes.Text + "-" + txtDeDia.Text
        Dim dataPAI_VTate As String = "20" + txtDeAno.Text + "-" + txtDeMes.Text + "-" + txtDeDia.Text

       
        'quadro 2
        Dim dataPAAde As String = "20" + txtDeAnoApt.Text + "-" + txtDeMesApt.Text + "-" + txtDeDiaApt.Text
        Dim dataPAAate As String = "20" + txtDeAnoApt.Text + "-" + txtDeMesApt.Text + "-" + txtDeDiaApt.Text


        'quadro 3
        Dim dataCoordde As String = "20" + txtDeAnoCoord.Text + "-" + txtDeMesCoord.Text + "-" + txtDeDiaCoord.Text
        Dim dataCoordate As String = "20" + txtDeAnoCoord.Text + "-" + txtDeMesCoord.Text + "-" + txtDeDiaCoord.Text

        'quadro 4
        Dim turnoManhaDe As String = turnomanha.De
        Dim turnoManhaAte As String = turnomanha.Ate

        Dim turnoTardeDe As String = turnotarde.De
        Dim turnoTardeAte As String = turnotarde.Ate

        Dim turnoNoiteDe As String = turnonoite.De
        Dim turnoNoiteAte As String = turnonoite.Ate

        Dim valorVA As String = txtValorVa.Text
        Dim valorVT As String = txtValorVT.Text
        Dim valorAA As String = txtValorAA.Text

        UpdateParametro("JN_MI_VA", valorVA)
        UpdateParametro("PAA_ATE", dataPAAate)
        UpdateParametro("PAA_DE", dataPAAde)
        UpdateParametro("PAI_VT_ATE", dataPAI_VTate)
        UpdateParametro("PAI_VT_DE", dataPAI_VTde)
        UpdateParametro("PCO_ATE", dataCoordate)
        UpdateParametro("PCO_DE", dataCoordde)
        UpdateParametro("TN_MN_ATE", turnoManhaAte)
        UpdateParametro("TN_MN_DE", turnoManhaDe)
        UpdateParametro("TN_NT_ATE", turnoNoiteAte)
        UpdateParametro("TN_NT_DE", turnoNoiteDe)
        UpdateParametro("TN_TD_ATE", turnoTardeAte)
        UpdateParametro("TN_TD_DE", turnoTardeDe)
        UpdateParametro("VL_CT_VT", valorVT)
        UpdateParametro("VL_UN_AA", valorAA)

    End Sub
End Class
