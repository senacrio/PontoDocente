
Partial Class Sos_Default
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Try
            sdsGrupoServico.Insert()
            lblErro.Text = "Resgistro incluído."

        Catch ex As Exception
            lblErro.Text = ex.Message.ToString()

        Finally
            grdGrupoServico.DataBind()
        End Try

        txtNome.Text = ""
        txtDescricao.Text = ""



    End Sub

    Protected Sub grdGrupoServico_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdGrupoServico.RowCommand
        lblErro.Text = ""
    End Sub

    Protected Sub grdGrupoServico_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles grdGrupoServico.RowUpdated
        lblErro.Text = "Registro alterado."
    End Sub
End Class
