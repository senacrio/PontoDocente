
Partial Class SubCategUnidade
    Inherits System.Web.UI.Page

    Protected Sub GridAreaConhec_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridCategUnidade.DataBound
        txtAviso.Text = ""
    End Sub

    Protected Sub ImIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImInclui.Click
        Try
            SDSCategUnidade.Insert()
            GridCategUnidade.DataBind()
            txtAviso.Text = ""
            txtAviso.Text = "Relacionamento incluído com sucesso"
        Catch ex As Exception
            'txtAviso.Text = "Não foi possível incluir novo relacionamento. Já existe um centro de custo com o mesmo nome."
            txtAviso.Text = ex.Message.ToString()
        End Try
        GridCategUnidade.DataBind()
    End Sub

    Protected Sub GridCategUnidade_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridCategUnidade.RowDeleted
        txtAviso.Text = ""
    End Sub

    Protected Sub GridCategUnidade_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridCategUnidade.RowDeleting
        Try
            SDSGridCategUnidade.Delete()
            GridCategUnidade.DataBind()
            txtAviso.Text = ""
            txtAviso.Text = "Relacionamento eliminado com sucesso"
        Catch ex As Exception
            '            txtAviso.Text = "Não foi possível eliminar este relacionamento."
            txtAviso.Text = ex.Message.ToString()
        End Try

    End Sub

    Protected Sub GridCategUnidade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridCategUnidade.SelectedIndexChanged
        txtAviso.Text = ""
    End Sub

   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
