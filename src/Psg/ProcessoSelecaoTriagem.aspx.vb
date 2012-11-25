Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Data.SqlDbType
Imports System.Data.Common

Partial Class ProcessoSelecaoTriagem
    Inherits System.Web.UI.Page

    Dim Param As New SqlParameter
    Dim dr As SqlDataReader

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
                                  "(SELECT COUNT(*)FROM psgInscricao i WHERE i.IDTurma = t.IDTurma)AS Inscritos " & _
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
        End If
    End Sub

    Protected Sub ddlPaginacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPaginacao.SelectedIndexChanged
        gvwEvento.PageSize = ddlPaginacao.SelectedValue + 1
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        lblUnidadeInteresse2.Text = lblUnidadeInteresse0.Text
        lblEventoInteresse2.Text = lblEventoInteresse0.Text
        lblDtInicioInteresse2.Text = lblDtInicioInteresse0.Text
        lblDtFimInteresse2.Text = lblDtFimInteresse0.Text
        lblHrInicioInteresse2.Text = lblHrInicioInteresse0.Text
        lblHrFimInteresse2.Text = lblHrFimInteresse0.Text
        lblNVagasInteresse2.Text = lblNVagasInteresse0.Text
        lblNInscInteresse2.Text = lblNInscInteresse0.Text
        lblDiasSemanaInteresse2.Text = lblDiasSemanaInteresse0.Text

        mulTriagem.ActiveViewIndex = 2
        gdvAnaliseDados.PageSize = lblNVagasInteresse0.Text
        SqlDataSAnaliseDados.DataBind()
    End Sub

    Protected Sub btnVoltar0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar0.Click
        mulTriagem.ActiveViewIndex = 1
    End Sub

    Protected Sub gvwCandidatos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvwCandidatos.SelectedIndexChanged
        Response.Redirect("detalhecandidato.aspx?idcandidato=" + gvwCandidatos.SelectedValue.ToString)

    End Sub

    Protected Sub btnImprimir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnImprimir.Click
        Response.Redirect("ImprimirClassificados.aspx?idunidade=" + txtIDUnidade.Text + "&idturma=" + txtIDTurma.Text + "&idcurso=" + txtIDCurso.Text + "&unidade=" + lblUnidadeInteresse0.Text + "&turno=" + lblDiasSemanaInteresse0.Text + "&curso=" + lblEventoInteresse0.Text)

    End Sub

    
    Protected Sub btnCandidatos_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCandidatos.Click
        Response.Redirect("Candidatos.aspx?idunidade=" + txtIDUnidade.Text)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class

