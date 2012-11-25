Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Data.SqlDbType
Imports System.Data.Common

Partial Class Turma
    Inherits System.Web.UI.Page

    Dim Param As New SqlParameter
    Dim dr As SqlDataReader

    Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovo.Click
        mtvTurma.ActiveViewIndex = 1
        LimparCampos()
        cbxIncluir.Checked = True
    End Sub

    Protected Sub btnAlterar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterar.Click
        If Not gvwTurma.SelectedIndex = -1 Then
            cbxIncluir.Checked = False
            Using con As SqlConnection = New SqlConnection
                con.ConnectionString = ConfigurationManager.ConnectionStrings("ServidorBD").ConnectionString
                Using cmd As SqlCommand = New SqlCommand
                    con.Close()

                    cmd.CommandText = "SELECT " & _
                                      "IDTurma,  " & _
                                      "IDCurso, " & _
                                      "IDUnidade, " & _
                                      "CONVERT(VARCHAR,DataInicioInscricao,103)AS DataInicioInscricao, " & _
                                      "CONVERT(VARCHAR,DataTerminoInscricao,103)AS DataTerminoInscricao, " & _
                                      "CONVERT(VARCHAR,DataInicioCurso,103)AS DataInicioCurso, " & _
                                      "CONVERT(VARCHAR,DataTerminoCurso,103)AS DataTerminoCurso, " & _
                                      "Turno, " & _
                                      "Ativo, " & _
                                      "TotalVagas, " & _
                                      "ProcessoSeletivoAno, " & _
                                      "ProcessoSeletivoSeq, " & _
                                      "DedicadaMista, " & _
                                      "Cancelada " & _
                                      "FROM  " & _
                                      "psgTurma t " & _
                                      "WHERE  " & _
                                      "IDTurma = @ID "

                    Param = New SqlParameter("@ID", SqlDbType.Int)
                    Param.Value = tbxID.Text
                    Param.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(Param)
                    cmd.Connection = con

                    con.Open()
                    dr = cmd.ExecuteReader
                    If dr.Read Then
                        LimparCampos()
                        mtvTurma.ActiveViewIndex = 1
                        LerCampos()
                    End If
                    con.Close()
                End Using
            End Using
        Else
            Me.RegisterClientScriptBlock("x", "<script>alert(Selecione uma turma para seguir com a alteração.')</script>")
        End If
    End Sub

    Private Sub LimparCampos()
        ddlCurso.SelectedIndex = -1
        ddlUnidades.SelectedIndex = -1
        ddlTurno.SelectedIndex = -1
        ddlAno.SelectedIndex = -1
        ddlSeq.SelectedIndex = -1
        ddlTipoCurso.SelectedIndex = -1

        tbxDtInicio.Text = ""
        tbxDtTermino.Text = ""
        tbxDtInicioCurso.Text = ""
        tbxDtTerminoCurso.Text = ""
        tbxTotalVagas.Text = ""

        cbxAtivo.Checked = True
        cbxCancelada.Checked = False
    End Sub

    Private Sub LerCampos()
        ddlCurso.SelectedValue = dr("IDCurso")
        ddlCurso.Focus()
        ddlUnidades.SelectedValue = dr("IDUnidade")
        ddlTurno.SelectedValue = dr("Turno")
        ddlAno.SelectedValue = dr("ProcessoSeletivoAno")
        ddlSeq.SelectedValue = dr("ProcessoSeletivoSeq")
        ddlTipoCurso.SelectedValue = dr("DedicadaMista")

        tbxDtInicio.Text = dr("DataInicioInscricao")
        tbxDtTermino.Text = dr("DataTerminoInscricao")
        tbxDtInicioCurso.Text = dr("DataInicioCurso")
        tbxDtTerminoCurso.Text = dr("DataTerminoCurso")
        tbxTotalVagas.Text = dr("TotalVagas")

        cbxAtivo.Checked = dr("Ativo")
        cbxCancelada.Checked = dr("Cancelada")
    End Sub

    Protected Sub gvwCurso_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvwTurma.SelectedIndexChanged
        tbxID.Text = gvwTurma.SelectedValue
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar.Click
        LimparCampos()
        mtvTurma.ActiveViewIndex = 0
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        If cbxIncluir.Checked Then
            Incluir()
        Else
            Alterar()
        End If
        mtvTurma.ActiveViewIndex = 0
        SqlDSTurma.DataBind()
        gvwTurma.DataBind()
        SqlDSDetalhe.DataBind()
        dvwEvento.DataBind()
    End Sub

    Protected Sub Incluir()
        Using conn As New SqlConnection
            Using cmd As New SqlCommand
                Dim Param As New SqlParameter

                conn.ConnectionString = ConfigurationManager.ConnectionStrings("ServidorBD").ToString

                cmd.CommandText = "INSERT INTO psgTurma " & _
                                  "           ( " & _
                                  "			   IDCurso " & _
                                  "           ,IDUnidade " & _
                                  "           ,DataInicioInscricao " & _
                                  "           ,DataTerminoInscricao " & _
                                  "           ,DataInicioCurso " & _
                                  "           ,DataTerminoCurso " & _
                                  "           ,Turno " & _
                                  "           ,Ativo " & _
                                  "           ,TotalVagas " & _
                                  "           ,ProcessoSeletivoAno " & _
                                  "           ,ProcessoSeletivoSeq " & _
                                  "           ,DedicadaMista " & _
                                  "           ,Cancelada " & _
                                  "			  ) " & _
                                  "     VALUES " & _
                                  "           ( " & _
                                  "			   @IDCurso " & _
                                  "           ,@IDUnidade " & _
                                  "           ,@DataInicioInscricao " & _
                                  "           ,@DataTerminoInscricao " & _
                                  "           ,@DataInicioCurso " & _
                                  "           ,@DataTerminoCurso " & _
                                  "           ,@Turno " & _
                                  "           ,@Ativo " & _
                                  "           ,@TotalVagas " & _
                                  "           ,@ProcessoSeletivoAno " & _
                                  "           ,@ProcessoSeletivoSeq " & _
                                  "           ,@DedicadaMista " & _
                                  "           ,@Cancelada " & _
                                  "			  ) "

                Param = New SqlParameter("@IDCurso", SqlDbType.Int)
                Param.Value = ddlCurso.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@IDUnidade", SqlDbType.Int)
                Param.Value = ddlUnidades.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DataInicioInscricao", SqlDbType.SmallDateTime)
                Param.Value = tbxDtInicio.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DataTerminoInscricao", SqlDbType.SmallDateTime)
                Param.Value = tbxDtTermino.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DataInicioCurso", SqlDbType.SmallDateTime)
                Param.Value = tbxDtInicioCurso.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DataTerminoCurso", SqlDbType.SmallDateTime)
                Param.Value = tbxDtTerminoCurso.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@Turno", SqlDbType.Int)
                Param.Value = ddlTurno.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@Ativo", SqlDbType.Int)
                Param.Value = cbxAtivo.Checked
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@TotalVagas", SqlDbType.Int)
                Param.Value = tbxTotalVagas.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@ProcessoSeletivoAno", SqlDbType.SmallInt)
                Param.Value = ddlAno.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@ProcessoSeletivoSeq", SqlDbType.TinyInt)
                Param.Value = ddlSeq.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DedicadaMista", SqlDbType.TinyInt)
                Param.Value = ddlTipoCurso.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@Cancelada", SqlDbType.Int)
                Param.Value = cbxCancelada.Checked
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                cmd.Connection = conn
                conn.Open()
                tbxID.Text = cmd.ExecuteScalar()

                conn.Close()
            End Using
        End Using
    End Sub

    Protected Sub Alterar()
        Using conn As New SqlConnection
            Using cmd As New SqlCommand
                Dim Param As New SqlParameter

                conn.ConnectionString = ConfigurationManager.ConnectionStrings("ServidorBD").ToString

                cmd.CommandText = "UPDATE psgTurma " & _
                                  "   SET IDCurso              = @IDCurso " & _
                                  "      ,IDUnidade            = @IDUnidade " & _
                                  "      ,DataInicioInscricao  = @DataInicioInscricao " & _
                                  "      ,DataTerminoInscricao = @DataTerminoInscricao " & _
                                  "      ,DataInicioCurso      = @DataInicioCurso " & _
                                  "      ,DataTerminoCurso     = @DataTerminoCurso " & _
                                  "      ,Turno                = @Turno " & _
                                  "      ,Ativo                = @Ativo " & _
                                  "      ,TotalVagas           = @TotalVagas " & _
                                  "      ,ProcessoSeletivoAno  = @ProcessoSeletivoAno " & _
                                  "      ,ProcessoSeletivoSeq  = @ProcessoSeletivoSeq " & _
                                  "      ,DedicadaMista        = @DedicadaMista " & _
                                  "      ,Cancelada            = @Cancelada " & _
                                  " WHERE IDTurma              = @ID "

                Param = New SqlParameter("@IDCurso", SqlDbType.Int)
                Param.Value = ddlCurso.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@IDUnidade", SqlDbType.Int)
                Param.Value = ddlUnidades.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DataInicioInscricao", SqlDbType.SmallDateTime)
                Param.Value = tbxDtInicio.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DataTerminoInscricao", SqlDbType.SmallDateTime)
                Param.Value = tbxDtTermino.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DataInicioCurso", SqlDbType.SmallDateTime)
                Param.Value = tbxDtInicioCurso.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DataTerminoCurso", SqlDbType.SmallDateTime)
                Param.Value = tbxDtTerminoCurso.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@Turno", SqlDbType.Int)
                Param.Value = ddlTurno.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@Ativo", SqlDbType.Int)
                Param.Value = cbxAtivo.Checked
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@TotalVagas", SqlDbType.Int)
                Param.Value = tbxTotalVagas.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@ProcessoSeletivoAno", SqlDbType.SmallInt)
                Param.Value = ddlAno.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@ProcessoSeletivoSeq", SqlDbType.TinyInt)
                Param.Value = ddlSeq.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@DedicadaMista", SqlDbType.TinyInt)
                Param.Value = ddlTipoCurso.SelectedValue
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@Cancelada", SqlDbType.Bit)
                Param.Value = cbxCancelada.Checked
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                Param = New SqlParameter("@ID", SqlDbType.Int)
                Param.Value = tbxID.Text
                Param.Direction = ParameterDirection.Input
                cmd.Parameters.Add(Param)

                cmd.Connection = conn
                conn.Open()
                tbxID.Text = cmd.ExecuteScalar()

                conn.Close()
            End Using
        End Using
    End Sub

    Protected Sub gvwCurso_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvwTurma.RowCommand
        If e.CommandName = "Excluir" Then
            tbxID.Text = e.CommandArgument
            SqlDSTurma.Delete()
            SqlDSTurma.DataBind()
            gvwTurma.DataBind()
            SqlDSDetalhe.DataBind()
            dvwEvento.DataBind()
        End If
    End Sub

    Protected Sub ddlPaginacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPaginacao.SelectedIndexChanged
        gvwTurma.PageSize = ddlPaginacao.SelectedValue + 1
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.IsPostBack Then
            For nAno As Integer = 2009 To Now.Year()
                ddlAno.Items.Add(nAno.ToString)
                If nAno = Now.Year() Then
                    ddlAno.Items(nAno - 2009).Selected = True
                End If
            Next
        End If

    End Sub
End Class
