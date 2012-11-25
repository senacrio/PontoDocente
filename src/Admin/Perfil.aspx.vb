
Partial Class Perfil
    Inherits System.Web.UI.Page

    Protected Sub gvwPerfil_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvwPerfil.RowCommand
        Using oConexao As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString())
            Using oCmd As SqlCommand = New SqlCommand
                oCmd.Connection = oConexao
                oConexao.Open()

                If e.CommandName = "Select" Then

                    btnGravar.CommandArgument = e.CommandArgument
                    btnGravar.CommandName = e.CommandName
                    MultiView1.ActiveViewIndex = 0
                    lblForm.Text = lblForm.Text + " - Alterar"
                    oCmd.CommandText = "SELECT * FROM admPortalPerfil WHERE IdPerfil=" + e.CommandArgument
                    Dim oDr As SqlDataReader = oCmd.ExecuteReader
                    If oDr.Read Then
                        txtDescricao.Text = oDr("Descricao").ToString()
                    End If
                    oDr.Close()

                ElseIf e.CommandName = "AtivoTrue" Then

                    oCmd.CommandText = "UPDATE admPortalPerfil SET Ativo=0 WHERE IdPerfil=" + e.CommandArgument
                    oCmd.ExecuteNonQuery()

                ElseIf e.CommandName = "AtivoFalse" Then

                    oCmd.CommandText = "UPDATE admPortalPerfil SET Ativo=1 WHERE IdPerfil=" + e.CommandArgument
                    oCmd.ExecuteNonQuery()

                ElseIf e.CommandName = "AdminTrue" Then

                    oCmd.CommandText = "UPDATE admPortalPerfil SET Administrador=0 WHERE IdPerfil=" + e.CommandArgument
                    oCmd.ExecuteNonQuery()

                ElseIf e.CommandName = "AdminFalse" Then

                    oCmd.CommandText = "UPDATE admPortalPerfil SET Administrador=1 WHERE IdPerfil=" + e.CommandArgument
                    oCmd.ExecuteNonQuery()

                ElseIf e.CommandName = "Excluir" Then

                    sdsPerfil.DeleteParameters("IdPerfil").DefaultValue = e.CommandArgument
                    sdsPerfil.Delete()

                End If

                oConexao.Close()
                oCmd.Dispose()
            End Using
        End Using

        gvwPerfil.DataBind()
    End Sub

    Protected Sub btnIcluir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIcluir.Click
        btnGravar.CommandName = "Incluir"
        MultiView1.ActiveViewIndex = 0
        lblForm.Text = lblForm.Text + " - Incluir"
        txtDescricao.Text = ""
    End Sub

    Protected Sub btnGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGravar.Click
        If btnGravar.CommandName = "Incluir" Then
            sdsPerfil.Insert()
        ElseIf btnGravar.CommandName = "Select" Then
            sdsPerfil.UpdateParameters("IdPerfil").DefaultValue = btnGravar.CommandArgument
            sdsPerfil.Update()
        End If
        gvwPerfil.DataBind()
        MultiView1.ActiveViewIndex = -1
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar.Click
        MultiView1.ActiveViewIndex = -1
    End Sub

    Protected Sub btnFiltrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFiltrar.Click
        gvwPerfil.DataBind()
    End Sub

    Protected Sub View1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles View1.Load
        txtDescricao.Focus()
    End Sub

End Class
