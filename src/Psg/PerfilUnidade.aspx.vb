Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Data.SqlDbType
Imports System.Data.Common

Partial Class PerfilUnidade
    Inherits System.Web.UI.Page

    Dim Param As New SqlParameter
    Dim dr As SqlDataReader

    Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovo.Click
        mulPerfilUnidade.ActiveViewIndex = 1
        LimparCampos()
        cbxIncluir.Checked = True
    End Sub

    Protected Sub btnAlterar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterar.Click
        If Not gvwPerfilUnidade.SelectedIndex = -1 Then
            cbxIncluir.Checked = False
            mulPerfilUnidade.ActiveViewIndex = 1
            LerCampos()
        Else
            Me.RegisterClientScriptBlock("x", "<script>alert(Selecione um item para seguir com a alteração.')</script>")
        End If
    End Sub

    Protected Sub gvwPerfilUnidade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvwPerfilUnidade.SelectedIndexChanged
        tbxIDP.Text = gvwPerfilUnidade.SelectedDataKey.Values(0).ToString()
        tbxIDU.Text = gvwPerfilUnidade.SelectedDataKey.Values(1).ToString()
    End Sub

    Protected Sub btnGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGravar.Click
        If cbxIncluir.Checked Then
            Try
                SqlDSPerfilUnidade.Insert()
            Catch ex As Exception
            End Try
        Else
            SqlDSPerfilUnidade.Update()
        End If
        mulPerfilUnidade.ActiveViewIndex = 0
        SqlDSPerfilUnidade.DataBind()
        gvwPerfilUnidade.DataBind()
    End Sub

    Private Sub LimparCampos()
        ddlPerfil.SelectedIndex = -1
        ddlUnidade.SelectedIndex = -1
    End Sub

    Private Sub LerCampos()
        ddlPerfil.SelectedValue = tbxIDP.Text 
        ddlUnidade.SelectedValue = tbxIDU.Text
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar.Click
        LimparCampos()
        mulPerfilUnidade.ActiveViewIndex = 0
    End Sub

    Protected Sub gvwPerfilUnidade_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvwPerfilUnidade.RowCommand
        If Not e.CommandName = "Select" Then
            tbxIDP.Text = e.CommandArgument
            tbxIDU.Text = e.CommandName

            SqlDSPerfilUnidade.Delete()
            SqlDSPerfilUnidade.DataBind()
            gvwPerfilUnidade.DataBind()
        End If
    End Sub
End Class
