
Partial Class Municipio
    Inherits System.Web.UI.Page

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Try
            SqlMunicipio.Insert()
            GridMunicipio.DataBind()
            txtMunicipio.Text = ""
            txtAviso.Text = "Município incluído com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível incluir novo município. Já existe um município com o mesmo nome."
        End Try
    End Sub

    Protected Sub GridMunicipio_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridMunicipio.DataBound
        txtAviso.Text = ""
    End Sub

    Protected Sub GridMunicipio_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridMunicipio.RowDeleted
        txtAviso.Text = ""
    End Sub

    Protected Sub GridMunicipio_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridMunicipio.SelectedIndexChanged
        txtAviso.Text = ""
    End Sub

    Protected Sub txtMunicipio_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtMunicipio.TextChanged

    End Sub
End Class
