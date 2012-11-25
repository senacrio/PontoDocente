Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Data.SqlDbType
Imports System.Data.Common

Partial Class ProcessoSelecao_Unidades
    Inherits System.Web.UI.Page

    Dim Param As New SqlParameter
    Dim dr As SqlDataReader

    Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovo.Click
        mulUnidades.ActiveViewIndex = 1
        LimparCampos()
        cbxIncluir.Checked = True
    End Sub

    Protected Sub btnAlterar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterar.Click
        If Not gvwUnidades.SelectedIndex = -1 Then
            cbxIncluir.Checked = False
            Using con As SqlConnection = New SqlConnection
                con.ConnectionString = ConfigurationManager.ConnectionStrings("ServidorBD").ConnectionString
                Using cmd As SqlCommand = New SqlCommand
                    con.Close()

                    cmd.CommandText = "SELECT * FROM psgUnidade WHERE IDUnidade = @ID"

                    Param = New SqlParameter("@ID", SqlDbType.Int)
                    Param.Value = tbxID.Text
                    Param.Direction = ParameterDirection.Input
                    cmd.Parameters.Add(Param)
                    cmd.Connection = con

                    con.Open()
                    dr = cmd.ExecuteReader
                    If dr.Read Then
                        LimparCampos()
                        mulUnidades.ActiveViewIndex = 1
                        LerCampos()
                    End If
                    con.Close()
                End Using
            End Using
        Else
            Me.RegisterClientScriptBlock("x", "<script>alert(Selecione uma Unidade para seguir com a alteração.')</script>")
        End If
    End Sub

    Protected Sub gvwUnidades_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvwUnidades.SelectedIndexChanged
        tbxID.Text = gvwUnidades.SelectedValue
    End Sub

    Protected Sub gvwUnidades_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvwUnidades.RowCommand
        If e.CommandName = "Excluir" Then
            tbxID.Text = e.CommandArgument
            SqlSUnidade.Delete()
            SqlSUnidade.DataBind()
            gvwUnidades.DataBind()
            SqlDSDetalhe.DataBind()
            dvwEvento.DataBind()
        End If
    End Sub

    Private Sub LimparCampos()
        tbxUnidade.Text = ""
        tbxEndereco.Text = ""
        tbxBairro.Text = ""
        tbxCidade.Text = ""
        tbxCep.Text = ""
        tbxEstado.Text = ""
        tbxComplemento.Text = ""
    End Sub

    Private Sub LerCampos()
        tbxUnidade.Text = dr("Unidade").ToString()
        tbxEndereco.Text = dr("Endereco").ToString()
        tbxComplemento.Text = dr("Complemento").ToString()
        tbxBairro.Text = dr("Bairro").ToString()
        tbxCidade.Text = dr("Cidade").ToString()
        tbxCep.Text = dr("Cep").ToString()
        tbxEstado.Text = dr("Estado").ToString()
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar.Click
        LimparCampos()
        mulUnidades.ActiveViewIndex = 0
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        If cbxIncluir.Checked Then
            SqlSUnidade.Insert()
        Else
            SqlSUnidade.Update()
        End If
        mulUnidades.ActiveViewIndex = 0
        SqlSUnidade.DataBind()
        gvwUnidades.DataBind()
        SqlDSDetalhe.DataBind()
        dvwEvento.DataBind()
    End Sub

End Class
