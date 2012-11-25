
Partial Class Usuario
    Inherits System.Web.UI.Page

    Protected Sub gvwUsuario_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvwUsuario.RowCommand
        Using oConexao As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString())
            Using oCmd As SqlCommand = New SqlCommand
                oCmd.Connection = oConexao
                oConexao.Open()

                If e.CommandName = "Select" Then

                    btnGravar.CommandArgument = e.CommandArgument
                    btnGravar.CommandName = e.CommandName
                    MultiView1.ActiveViewIndex = 0
                    lblForm.Text = lblForm.Text + " - Alterar"
                    oCmd.CommandText = "SELECT * FROM admPortalUsuario WHERE IdUsuario=" + e.CommandArgument
                    Dim oDr As SqlDataReader = oCmd.ExecuteReader
                    If oDr.Read Then
                        txtNome.Text = oDr("Nome").ToString()
                        txtLogin.Text = oDr("Login").ToString()
                        txtMatricula.Text = oDr("Matricula").ToString()
                    End If
                    oDr.Close()

                ElseIf e.CommandName = "AtivoTrue" Then

                    oCmd.CommandText = "UPDATE admPortalUsuario SET Ativo=0 WHERE IdUsuario=" + e.CommandArgument
                    oCmd.ExecuteNonQuery()

                ElseIf e.CommandName = "AtivoFalse" Then

                    oCmd.CommandText = "UPDATE admPortalUsuario SET Ativo=1 WHERE IdUsuario=" + e.CommandArgument
                    oCmd.ExecuteNonQuery()

                ElseIf e.CommandName = "Excluir" Then

                    sdsUsuario.DeleteParameters("IdUsuario").DefaultValue = e.CommandArgument
                    sdsUsuario.Delete()

                End If

                oConexao.Close()
                oCmd.Dispose()
            End Using
        End Using

        gvwUsuario.DataBind()
    End Sub

    Protected Sub btnIcluir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIcluir.Click
        btnGravar.CommandName = "Incluir"
        MultiView1.ActiveViewIndex = 0
        lblForm.Text = lblForm.Text + " - Incluir"
        txtNome.Text = ""
        txtLogin.Text = ""
        txtMatricula.Text = ""
    End Sub

    Protected Sub btnGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGravar.Click
        If btnGravar.CommandName = "Incluir" Then
            sdsUsuario.Insert()
        ElseIf btnGravar.CommandName = "Select" Then
            sdsUsuario.UpdateParameters("IdUsuario").DefaultValue = btnGravar.CommandArgument
            sdsUsuario.Update()
        End If
        gvwUsuario.DataBind()
        MultiView1.ActiveViewIndex = -1
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar.Click
        MultiView1.ActiveViewIndex = -1
    End Sub

    Protected Sub btnFiltrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFiltrar.Click
        gvwUsuario.DataBind()
    End Sub

    Protected Sub View1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles View1.Load
        txtNome.Focus()
    End Sub

    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub
End Class
