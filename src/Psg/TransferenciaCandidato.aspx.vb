Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Data.SqlDbType
Imports System.Data.Common

Partial Class ProcessoSelecaoAprovacao
    Inherits System.Web.UI.Page

    Dim Param As New SqlParameter
    Dim dr As SqlDataReader
    Private Sub PopulaTransferencia(ByVal IDInscricao As Integer)

        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select idcandidato,idturma,nome,turno,idunidade,idcurso from dbo.fnPsgRelatorio() where IDInscricao=@idinscricao", conn)
        Dim pIDIdentificador As SqlParameter = New SqlParameter()

        pIDIdentificador.ParameterName = "idinscricao"
        pIDIdentificador.Value = IDInscricao

        cmd.Parameters.Add(pIDIdentificador)
        conn.Open()


        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()

        If reader.HasRows Then

            Session("IDUnidadeDe") = reader("idunidade")
            Session("IDCursoDe") = reader("idcurso")
            Session("IDTurmaDe") = reader("idturma")
            Session("IDcandidato") = reader("IDCandidato")

        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()



    End Sub
    Private Sub PopulaTurno(ByVal IDturma As Integer)

        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select turno from psgturma where IDturma=@idturma", conn)
        Dim pIDIdentificador As SqlParameter = New SqlParameter()

        pIDIdentificador.ParameterName = "idturma"
        pIDIdentificador.Value = IDturma

        cmd.Parameters.Add(pIDIdentificador)
        conn.Open()


        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()

        If reader.HasRows Then

            ddlTurnot.SelectedValue = reader("turno")

        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()



    End Sub



    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar.Click
        mulTriagem.ActiveViewIndex = 0
    End Sub

    Protected Sub AbrirTriagem()
        Using con As SqlConnection = New SqlConnection
            con.ConnectionString = ConfigurationManager.ConnectionStrings("ServidorBD").ConnectionString
            Using cmd As SqlCommand = New SqlCommand
                con.Close()

                cmd.CommandText = "SELECT " & _
                                  "t.IDTurma, " & _
                                  "t.IDCurso, " & _
                                  "t.IDUnidade, " & _
                                  "(SELECT Unidade FROM psgUnidade u WHERE u.IDUnidade = t.IDUnidade)AS Unidade, " & _
                                  "c.Curso + ' - ' + (SELECT Tipo FROM psgCursoTipo ct WHERE ct.IDTipo = c.IDTipo AND Ativo = 1)AS Evento,  " & _
                                  "t.TotalVagas, " & _
                                  "CONVERT(VARCHAR,DataInicioInscricao,103)AS DataInicioInscricao, " & _
                                  "CONVERT(VARCHAR,DataTerminoInscricao,103)AS DataTerminoInscricao, " & _
                                  "CONVERT(VARCHAR,DataInicioCurso,103)AS DataInicioCurso, " & _
                                  "CONVERT(VARCHAR,DataTerminoCurso,103)AS DataTerminoCurso, " & _
                                  "CASE TURNO WHEN 1 THEN 'Manha' ELSE (CASE TURNO WHEN 2 THEN 'Tarde' ELSE 'Noite' END)END AS Turno, " & _
                                  "(SELECT COUNT(*)FROM psgInscricao i WHERE i.IDTurma = t.IDTurma)AS Inscritos, " & _
                                  "(SELECT COUNT(*)FROM psgInscricao i WHERE i.IDTurma = t.IDTurma AND Aprovacao = 1)AS Aprovados " & _
                                  "FROM  " & _
                                  "psgTurma t, " & _
                                  "psgCurso c  " & _
                                  "WHERE  " & _
                                  "t.IDCurso = c.IDCurso  AND " & _
                                  "c.Ativo     = 1        AND " & _
                                  "t.Ativo     = 1        And " & _
                                  "t.IDTurma   = @IDTurma AND " & _
                                  "t.IDCurso   = @IDCurso AND " & _
                                  "t.IDUnidade = @IDUnidade "

                Param = New SqlParameter("@IDTurma", SqlDbType.Int)
                Param.Value = txtIDTurma.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)
                cmd.Connection = con

                Param = New SqlParameter("@IDCurso", SqlDbType.Int)
                Param.Value = txtIDCurso.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)
                cmd.Connection = con

                Param = New SqlParameter("@IDUnidade", SqlDbType.Int)
                Param.Value = txtIDUnidade.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)
                cmd.Connection = con

                con.Open()
                dr = cmd.ExecuteReader
                If dr.Read Then
                    LimparCampos()
                    mulTriagem.ActiveViewIndex = 1
                    LerCampos()
                End If
                con.Close()
            End Using
        End Using
    End Sub

    Private Sub LerCampos()
        lblUnidadeInteresse0.Text = dr("Unidade")
        lblEventoInteresse0.Text = dr("Evento")
        lblDtInicioInteresse0.Text = dr("DataInicioInscricao")
        lblDtFimInteresse0.Text = dr("DataTerminoInscricao")
        lblHrInicioInteresse0.Text = dr("DataInicioCurso")
        lblHrFimInteresse0.Text = dr("DataTerminoCurso")
        lblNVagasInteresse0.Text = dr("TotalVagas")
        lblNInscInteresse0.Text = dr("Inscritos")
        lblNAprovados.Text = dr("Aprovados")
        lblDiasSemanaInteresse0.Text = dr("Turno")
    End Sub

    Private Sub LimparCampos()
        lblUnidadeInteresse0.Text = ""
        lblEventoInteresse0.Text = ""
        lblDtInicioInteresse0.Text = ""
        lblDtFimInteresse0.Text = ""
        lblHrInicioInteresse0.Text = ""
        lblHrFimInteresse0.Text = ""
        lblNVagasInteresse0.Text = ""
        lblNInscInteresse0.Text = ""
        lblDiasSemanaInteresse0.Text = ""
    End Sub

    Protected Sub gvwEvento_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvwEvento.SelectedIndexChanged
        If Not gvwEvento.SelectedIndex = -1 Then
            txtIDTurma.Text = gvwEvento.SelectedDataKey.Values(0).ToString()
            txtIDCurso.Text = gvwEvento.SelectedDataKey.Values(1).ToString()
            txtIDUnidade.Text = gvwEvento.SelectedDataKey.Values(2).ToString()

            AbrirTriagem()
            mtvAprovacao.ActiveViewIndex = -1
        End If
    End Sub

    Protected Sub gvwCandidatos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvwCandidatos.SelectedIndexChanged
        lblMsg.Text = ""
        txtMotivo.Text = ""

        ' ddlCursot.SelectedIndex = 0


        'PopulaTransferencia(btn.CommandArgument)
        lblNome.Text = gvwCandidatos.DataKeys(gvwCandidatos.SelectedIndex).Values("nome")
        lblcursot.Text = lblEventoInteresse0.Text
        lblunidadet.Text = lblUnidadeInteresse0.Text
        lblturnot.Text = lblDiasSemanaInteresse0.Text
        'Response.Redirect("TransferirCandidato.aspx?idinscricao=" + btn.CommandArgument.ToString)
        mulTriagem.ActiveViewIndex = 3

    End Sub

    Protected Sub btnVoltarA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltarA.Click
        mtvAprovacao.ActiveViewIndex = -1
        LimparAprovacao()
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        If rbSNE.SelectedValue = True Then
            ddlMotivo.SelectedIndex = -1
            tbxDescricao.Text = ""
        End If

        SqlDataSCandidatoInscrito.Update()
        SqlDataSCandidatoInscrito.DataBind()
        gvwCandidatos.DataBind()

        SqlDSEventos.DataBind()
        gvwEvento.DataBind()

        AbrirTriagem()

        mtvAprovacao.ActiveViewIndex = -1
    End Sub

    Protected Sub LimparAprovacao()
        rbSNE.SelectedIndex = -1
        ddlMotivo.SelectedIndex = -1
        tbxDescricao.Text = ""
    End Sub

    Protected Sub LerAprovacao()
        rbSNE.SelectedValue = IIf(dr("Aprovacao") Is DBNull.Value, -1, dr("Aprovacao"))

        If rbSNE.SelectedValue = True Then
            ddlMotivo.SelectedIndex = -1
            tbxDescricao.Text = ""

            ddlMotivo.Enabled = False
            tbxDescricao.Enabled = False

            rfvMotivo.Enabled = False
            rfvDesc.Enabled = False
        Else
            ddlMotivo.Enabled = True
            tbxDescricao.Enabled = True

            rfvMotivo.Enabled = True
            rfvDesc.Enabled = True
        End If

        ddlMotivo.SelectedValue = IIf(dr("IDMotivoReprovacao") Is DBNull.Value, "", dr("IDMotivoReprovacao"))
        tbxDescricao.Text = IIf(dr("Descricao") Is DBNull.Value, "", dr("Descricao"))
    End Sub

    Protected Sub rbSNE_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbSNE.SelectedIndexChanged
        If rbSNE.SelectedValue = True Then
            ddlMotivo.SelectedIndex = -1
            tbxDescricao.Text = ""

            ddlMotivo.Enabled = False
            tbxDescricao.Enabled = False

            rfvMotivo.Enabled = False
            rfvDesc.Enabled = False
        Else
            ddlMotivo.Enabled = True
            tbxDescricao.Enabled = True

            rfvMotivo.Enabled = True
            rfvDesc.Enabled = True
        End If
    End Sub

    Protected Sub ddlPaginacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPaginacao.SelectedIndexChanged
        gvwEvento.PageSize = ddlPaginacao.SelectedValue + 1
    End Sub

    Protected Sub btnSubmeter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmeter.Click
        gvwEvento.DataBind()

        SqlDataSCandidatoInscrito.DataBind()
        gvwCandidatos.DataBind()

        btnSubmeter.Enabled = False
        gvwCandidatos.Columns.Item(0).Visible = False

        Me.RegisterClientScriptBlock("x", "<script>alert('Turma encerrada com sucesso!')</script>")
    End Sub

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    lblUnidadeInteresse2.Text = lblUnidadeInteresse0.Text
    '    lblEventoInteresse2.Text = lblEventoInteresse0.Text
    '    lblDtInicioInteresse2.Text = lblDtInicioInteresse0.Text
    '    lblDtFimInteresse2.Text = lblDtFimInteresse0.Text
    '    lblHrInicioInteresse2.Text = lblHrInicioInteresse0.Text
    '    lblHrFimInteresse2.Text = lblHrFimInteresse0.Text
    '    lblNVagasInteresse2.Text = lblNVagasInteresse0.Text
    '    lblNInscInteresse2.Text = lblNInscInteresse0.Text
    '    lblDiasSemanaInteresse2.Text = lblDiasSemanaInteresse0.Text

    '    mulTriagem.ActiveViewIndex = 2
    '    gdvAnaliseDados.PageSize = lblNVagasInteresse0.Text
    '    SqlDataSAnaliseDados.DataBind()
    'End Sub

    Protected Sub btnVoltar0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar0.Click
        mulTriagem.ActiveViewIndex = 1
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        

    End Sub

    Protected Sub btnSalvar0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar0.Click
        Try
            PopulaTransferencia(gvwCandidatos.SelectedValue)
            sdsTransferir.Update()
            sdsRegistraTransferencia.Insert()
            lblMsg.Text = "Candidato foi transferido com sucesso."
            txtMotivo.Text = ""
            gvwCandidatos.DataBind()
            gvwEvento.DataBind()

        Catch ex As Exception
            lblMsg.Text = ex.Message.ToString
        End Try

    End Sub

    Protected Sub View1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles View1.Load

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ddlTurma_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTurma.DataBound
        PopulaTurno(ddlTurma.SelectedValue)
    End Sub

    Protected Sub ddlTurma_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTurma.SelectedIndexChanged
        PopulaTurno(ddlTurma.SelectedValue)
    End Sub

    Protected Sub ddlTurnot_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTurnot.DataBound
        PopulaTurno(ddlTurma.SelectedValue)
    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        mulTriagem.ActiveViewIndex = 1
    End Sub
End Class