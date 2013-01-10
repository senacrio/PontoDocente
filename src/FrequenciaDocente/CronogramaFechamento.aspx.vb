Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_CronogramaFechamento
    Inherits System.Web.UI.Page
    Dim mesAnoInsert As String
    Dim ativoInsert As Boolean


    Dim db As FrequenciaDocenteDataContext

    'Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"

    Private Sub InsertParametro(parametro As Parametro)
        db = New FrequenciaDocenteDataContext(conn)
        db.Parametros.InsertOnSubmit(parametro)
        db.SubmitChanges()
        db.Dispose()

    End Sub

    Private Sub GetParametro()
        db = New FrequenciaDocenteDataContext(conn)
        Dim parametros As New Parametro
        parametros = (From p In db.Parametros _
                     Where p.Id = id _
                     ).FirstOrDefault()

        LoadControls(parametros)
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        Try
            Dim data As DateTime

            DateTime.TryParse("20" + txtDeAnoCoord.Text + "-" + txtDeMesCoord.Text + "-01", data)

            If (data < Convert.ToDateTime(DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-01")) Then
                lblMsg.Text = "A data de início é invalida"
                lblMsg.ForeColor = Drawing.Color.Red
                Return
            End If

            Dim erro As Boolean = False

            'quadro 1
            Dim dataPAI_VTde As String = txtDeAno.Text + "-" + txtDeMes.Text + "-" + txtDeDia.Text
            Dim dataPAI_VTate As String = txtAteAno.Text + "-" + txtAteMes.Text + "-" + txtAteDia.Text

            If Not Util.ValidaData("20" + dataPAI_VTde, "20" + dataPAI_VTate) Then
                divPAVT.Style.Add("border", "2px solid red")
                erro = True
            End If

            'quadro 2
            Dim dataPAAde As String = txtDeAnoApt.Text + "-" + txtDeMesApt.Text + "-" + txtDeDiaApt.Text
            Dim dataPAAate As String = txtAteAnoApt.Text + "-" + txtAteMesApt.Text + "-" + txtAteDiaApt.Text

            If Not Util.ValidaData("20" + dataPAAde, "20" + dataPAAate) Then
                divPAA.Style.Add("border", "2px solid red")
                erro = True
            End If

            'quadro 3
            Dim dataCoordde As String = txtDeAnoCoord.Text + "-" + txtDeMesCoord.Text + "-" + txtDeDiaCoord.Text
            Dim dataCoordate As String = txtAteAnoCoord.Text + "-" + txtAteMesCoord.Text + "-" + txtAteDiaCoord.Text

            If Not Util.ValidaData("20" + dataCoordde, "20" + dataCoordate) Then
                divPAI.Style.Add("border", "2px solid red")
                erro = True
            End If


            If Not Util.ValidaDataRange("20" + dataPAI_VTde, "20" + dataCoordde, "20" + dataCoordate) Then
                divPAVT.Style.Add("border", "2px solid red")
                erro = True
            End If

            If Not Util.ValidaDataRange("20" + dataPAI_VTate, "20" + dataCoordde, "20" + dataCoordate) Then
                divPAVT.Style.Add("border", "2px solid red")
                erro = True
            End If

            If Not Util.ValidaDataDiff("20" + dataPAAde, "20" + dataCoordde, "20" + dataCoordate) Then
                divPAA.Style.Add("border", "2px solid red")
                erro = True
            End If

            If (Not dataCoordate = dataPAI_VTate) Then
                divPAVT.Style.Add("border", "2px solid red")
            End If

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

            If (erro) Then
                lblMsg.Text = "O(s) quadro(s) em vermelho apresentam inconsistências nas datas"
                lblMsg.ForeColor = Drawing.Color.Red
                Return
            End If

            Dim parametros As New Parametro
            parametros.JN_MI_VA = valorVA
            parametros.PAA_ATE = dataPAAate
            parametros.PAA_DE = dataPAAde
            parametros.PAI_VT_ATE = dataPAI_VTate
            parametros.PAI_VT_DE = dataPAI_VTde
            parametros.PCO_ATE = dataCoordate
            parametros.PCO_DE = dataCoordde
            parametros.TN_MN_ATE = turnoManhaAte
            parametros.TN_MN_DE = turnoManhaDe
            parametros.TN_NT_ATE = turnoNoiteAte
            parametros.TN_NT_DE = turnoNoiteDe
            parametros.TN_TD_ATE = turnoTardeAte
            parametros.TN_TD_DE = turnoTardeDe
            parametros.VL_CT_VT = valorVT
            parametros.VL_UN_AA = valorAA
            parametros.Id = Guid.NewGuid().ToString()
            parametros.Ano = data.Year
            parametros.Mes = data.Month
            parametros.Versao = GetVersao(data.Month, data.Year)
            parametros.Ativo = True

            VerifyAndDisableParametros(parametros)

            InsertParametro(parametros)
            Response.Redirect("CronogramaFechamentoList.aspx?Mensagem=" + "Cronograma salvo com sucesso!")

        Catch ex As Exception
            lblMsg.Text = "Ocorreu um erro ao salvar o cronograma!"
            lblMsg.ForeColor = Drawing.Color.Red

        End Try
    End Sub

    Protected Sub btnSalvar_Load(sender As Object, e As EventArgs) Handles btnSalvar.Load
        If (Request("id") Is Nothing) Then
            ativoInsert = True
            pnlGeral.Enabled = True

        Else
            id = Request("id").ToString()
            GetParametro()
            ativoInsert = False
            pnlGeral.Enabled = False
        End If

        If (Not Page.IsPostBack) Then
            txtValorVa.Text = "6"
            txtValorAA.Text = "22,00"

        End If

        turnomanha.De = "08:00"
        turnomanha.Ate = "12:00"
        turnotarde.De = "13:00"
        turnotarde.Ate = "17:00"
        turnonoite.De = "18:00"
        turnonoite.Ate = "22:00"
    End Sub

    Private Sub LoadControls(parametro As Parametro)
        txtValorVa.Text = parametro.JN_MI_VA

        txtAteAnoApt.Text = parametro.PAA_ATE.Split("-")(0)
        txtAteMesApt.Text = parametro.PAA_ATE.Split("-")(1)
        txtAteDiaApt.Text = parametro.PAA_ATE.Split("-")(2)

        txtDeAnoApt.Text = parametro.PAA_DE.Split("-")(0)
        txtDeMesApt.Text = parametro.PAA_DE.Split("-")(1)
        txtDeDiaApt.Text = parametro.PAA_DE.Split("-")(2)

        txtAteAno.Text = parametro.PAI_VT_ATE.Split("-")(0)
        txtAteMes.Text = parametro.PAI_VT_ATE.Split("-")(1)
        txtAteDia.Text = parametro.PAI_VT_ATE.Split("-")(2)

        txtDeAno.Text = parametro.PAI_VT_DE.Split("-")(0)
        txtDeMes.Text = parametro.PAI_VT_DE.Split("-")(1)
        txtDeDia.Text = parametro.PAI_VT_DE.Split("-")(2)

        txtAteAnoCoord.Text = parametro.PCO_ATE.Split("-")(0)
        txtAteMesCoord.Text = parametro.PCO_ATE.Split("-")(1)
        txtAteDiaCoord.Text = parametro.PCO_ATE.Split("-")(2)

        txtDeAnoCoord.Text = parametro.PCO_DE.Split("-")(0)
        txtDeMesCoord.Text = parametro.PCO_DE.Split("-")(1)
        txtDeDiaCoord.Text = parametro.PCO_DE.Split("-")(2)

        turnomanha.Ate = parametro.TN_MN_ATE
        turnomanha.De = parametro.TN_MN_DE
        turnonoite.Ate = parametro.TN_NT_ATE
        turnonoite.De = parametro.TN_NT_DE
        turnotarde.Ate = parametro.TN_TD_ATE
        turnotarde.De = parametro.TN_TD_DE
        txtValorVT.Text = parametro.VL_CT_VT
        txtValorAA.Text = parametro.VL_UN_AA
    End Sub
    Private Sub CommitData()
        Try
            db.SubmitChanges()
            db.Dispose()
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Private Sub DisableAllParametros()
        Try
            db = New FrequenciaDocenteDataContext(conn)
            Dim parametros = (From p In db.Parametros _
                              Where p.Ativo)

            For Each Parametro As Parametro In parametros
                Parametro.Ativo = False

            Next
            db.SubmitChanges()
        Catch ex As Exception

        End Try
    End Sub

    Private Function GetVersao(mes As Integer, ano As Integer) As Nullable(Of Integer)
        db = New FrequenciaDocenteDataContext(conn)

        Dim versao = (From p In db.Parametros _
                     Where p.Mes = mes And p.Ano = ano _
                     Order By p.Versao Descending).FirstOrDefault()

        If (versao Is Nothing) Then
            Return "1"
        Else
            Return versao.Versao + 1
        End If

    End Function

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Response.Redirect("CronogramaFechamentoList.aspx")
    End Sub

    Private Sub VerifyAndDisableParametros(param As Parametro)
        Try
            db = New FrequenciaDocenteDataContext(conn)
            Dim parametros = (From p In db.Parametros _
                              Where p.Ano = param.Ano And p.Mes = param.Mes _
                              Where p.Ativo)

            For Each Parametro As Parametro In parametros
                Parametro.Ativo = False
            Next

            db.SubmitChanges()
        Catch ex As Exception

        End Try
    End Sub

End Class
