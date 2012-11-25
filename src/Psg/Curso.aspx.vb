Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Data.SqlDbType
Imports System.Data.Common

Partial Class ProcessoSelecao_Curso
    Inherits System.Web.UI.Page

    Dim Param As New SqlParameter
    Dim dr As SqlDataReader

    Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovo.Click
        mtvCurso.ActiveViewIndex = 1
        LimparCampos()
        cbxIncluir.Checked = True
    End Sub

    Protected Sub btnAlterar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterar.Click
        If Not gvwCurso.SelectedIndex = -1 Then
            cbxIncluir.Checked = False
            Using con As SqlConnection = New SqlConnection
                con.ConnectionString = ConfigurationManager.ConnectionStrings("ServidorBD").ConnectionString
                Using cmd As SqlCommand = New SqlCommand
                    con.Close()

                    cmd.CommandText = "SELECT  " & _
                                      "IDCurso,  " & _
                                      "IDTipo, " & _
                                      "Curso, " & _
                                      "Ativo " & _
                                      "FROM  " & _
                                      "psgCurso c " & _
                                      "WHERE " & _
                                      "IDCurso = @ID "

                    Param = New SqlParameter("@ID", SqlDbType.Int)
                    Param.Value = tbxID.Text
                    Param.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(Param)
                    cmd.Connection = con

                    con.Open()
                    dr = cmd.ExecuteReader
                    If dr.Read Then
                        LimparCampos()
                        mtvCurso.ActiveViewIndex = 1
                        LerCampos()
                    End If
                    con.Close()
                End Using
            End Using
        Else
            Me.RegisterClientScriptBlock("x", "<script>alert(Selecione um curso para seguir com a alteração.')</script>")
        End If
    End Sub

    Private Sub LimparCampos()
        ddlTipo.SelectedIndex = -1
        tbxDescricao.Text = ""
        cbxAtivo.Checked = True
    End Sub

    Private Sub LerCampos()
        ddlTipo.SelectedValue = dr("IDTipo")
        tbxDescricao.Text = dr("Curso")
        cbxAtivo.Checked = dr("Ativo")
    End Sub

    Protected Sub gvwCurso_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvwCurso.SelectedIndexChanged
        tbxID.Text = gvwCurso.SelectedValue
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar.Click
        LimparCampos()
        mtvCurso.ActiveViewIndex = 0
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        If cbxIncluir.Checked Then
            SqlDSCursos.Insert()
        Else
            SqlDSCursos.Update()
        End If
        mtvCurso.ActiveViewIndex = 0
        SqlDSCursos.DataBind()
        gvwCurso.DataBind()
        SqlDSDetalhe.DataBind()
        dvwEvento.DataBind()
    End Sub

    Protected Sub gvwCurso_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvwCurso.RowCommand
        If e.CommandName = "Excluir" Then
            tbxID.Text = e.CommandArgument
            SqlDSCursos.Delete()
            SqlDSCursos.DataBind()
            gvwCurso.DataBind()
            SqlDSDetalhe.DataBind()
            dvwEvento.DataBind()
        End If
    End Sub

    Protected Sub ddlPaginacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPaginacao.SelectedIndexChanged
        gvwCurso.PageSize = ddlPaginacao.SelectedValue + 1
    End Sub

End Class
