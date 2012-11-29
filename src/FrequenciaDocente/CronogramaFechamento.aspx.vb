Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_CronogramaFechamento
    Inherits System.Web.UI.Page

   

    Private Sub UpdateParametro(field As String, valor As String)
        Dim db As New FrequenciaDocenteDataContext
        Dim parametros As New Parametro
        parametros = (From p In db.Parametros _
                     Where p.ParametroField = field).FirstOrDefault()


        parametros.Value = valor



        db.SubmitChanges()
        db.Dispose()

    End Sub

    Private Function GetParametro(field As String) As String
        Dim db As New FrequenciaDocenteDataContext
        Dim parametros As New Parametro
        parametros = (From p In db.Parametros _
                     Where p.ParametroField = field).FirstOrDefault()

        db.Dispose()

        Return parametros.Value
    End Function

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        Try

               'quadro 1
        Dim dataPAI_VTde As String = txtDeAno.Text + "-" + txtDeMes.Text + "-" + txtDeDia.Text
        Dim dataPAI_VTate As String = txtAteAno.Text + "-" + txtAteMes.Text + "-" + txtAteDia.Text

       
        'quadro 2
        Dim dataPAAde As String = txtDeAnoApt.Text + "-" + txtDeMesApt.Text + "-" + txtDeDiaApt.Text
        Dim dataPAAate As String = txtAteAnoApt.Text + "-" + txtAteMesApt.Text + "-" + txtAteDiaApt.Text


        'quadro 3
        Dim dataCoordde As String = txtDeAnoCoord.Text + "-" + txtDeMesCoord.Text + "-" + txtDeDiaCoord.Text
        Dim dataCoordate As String = txtAteAnoCoord.Text + "-" + txtAteMesCoord.Text + "-" + txtAteDiaCoord.Text

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

            lblMsg.Text = "Cronograma salvo com sucesso!"
            lblMsg.ForeColor = Drawing.Color.Green

        Catch ex As Exception
            lblMsg.Text = "Ocorreu um erro ao salvar o cronograma!"
            lblMsg.ForeColor = Drawing.Color.Red

        End Try


    End Sub

    Protected Sub btnSalvar_Load(sender As Object, e As EventArgs) Handles btnSalvar.Load
        If Not Page.IsPostBack Then
            LoadControls()
        End If


    End Sub

    Private Sub LoadControls()
        txtValorVa.Text = GetParametro("JN_MI_VA")
        Dim dataPAAate = GetParametro("PAA_ATE")

        txtAteAnoApt.Text = dataPAAate.Split("-")(0)
        txtAteMesApt.Text = dataPAAate.Split("-")(1)
        txtAteDiaApt.Text = dataPAAate.Split("-")(2)

        Dim dataPAAde = GetParametro("PAA_DE")

        txtDeAnoApt.Text = dataPAAde.Split("-")(0)
        txtDeMesApt.Text = dataPAAde.Split("-")(1)
        txtDeDiaApt.Text = dataPAAde.Split("-")(2)

        Dim dataPAIate = GetParametro("PAI_VT_ATE")

        txtAteAno.Text = dataPAIate.Split("-")(0)
        txtAteMes.Text = dataPAIate.Split("-")(1)
        txtAteDia.Text = dataPAIate.Split("-")(2)


        Dim dataPAIde = GetParametro("PAI_VT_DE")

        txtDeAno.Text = dataPAIde.Split("-")(0)
        txtDeMes.Text = dataPAIde.Split("-")(1)
        txtDeDia.Text = dataPAIde.Split("-")(2)

        Dim dataPCOate = GetParametro("PCO_ATE")

        txtAteAnoCoord.Text = dataPCOate.Split("-")(0)
        txtAteMesCoord.Text = dataPCOate.Split("-")(1)
        txtAteDiaCoord.Text = dataPCOate.Split("-")(2)


        Dim dataPCOde = GetParametro("PCO_DE")

        txtDeAnoCoord.Text = dataPCOde.Split("-")(0)
        txtDeMesCoord.Text = dataPCOde.Split("-")(1)
        txtDeDiaCoord.Text = dataPCOde.Split("-")(2)

        Dim turnoManhaAte = GetParametro("TN_MN_ATE")
        turnomanha.Ate = turnoManhaAte

        Dim turnoManhaDe = GetParametro("TN_MN_DE")
        turnomanha.De = turnoManhaDe

        Dim turnoNoiteAte = GetParametro("TN_NT_ATE")
        turnonoite.Ate = turnoNoiteAte

        Dim turnoNoiteDe = GetParametro("TN_NT_DE")
        turnonoite.De = turnoNoiteDe

        Dim turnoTardeAte = GetParametro("TN_TD_ATE")
        turnotarde.Ate = turnoTardeAte

        Dim turnoTardeDe = GetParametro("TN_TD_DE")
        turnotarde.De = turnoTardeDe

        Dim valorCtVt = GetParametro("VL_CT_VT")
        txtValorVT.Text = valorCtVt

        Dim valorUnAA = GetParametro("VL_UN_AA")
        txtValorAA.Text = valorUnAA

    End Sub

  

End Class
