
Partial Class Unidades
    Inherits System.Web.UI.Page

    Protected Sub GridEmpresa_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridUnidade.DataBound
        txtAviso.Text = ""
        txtErro.Text = ""
    End Sub

    Protected Sub GridEmpresa_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridUnidade.RowDeleted
        txtAviso.Text = ""
        txtErro.Text = ""
        txtNomeUnidade.Text = ""
        txtCodUnidade.Text = ""
        txtSiglaUnidade.Text = ""
    End Sub

    Protected Sub GridEmpresa_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridUnidade.RowDeleting
        Try
            SqlUnidade.Delete()
            GridUnidade.DataBind()
            txtNomeUnidade.Text = ""
            txtCodUnidade.Text = ""
            txtSiglaUnidade.Text = ""
            txtAviso.Text = "Unidade eliminada com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível eliminar esta Unidade. Existe relacionamento com iniciativas."
            '            txtErro.Text = ex.ToString
        End Try
    End Sub

    Protected Sub GridEmpresa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridUnidade.SelectedIndexChanged
        txtAviso.Text = ""
        txtCodUnidade.Text = Server.HtmlDecode(GridUnidade.SelectedRow.Cells(4).Text)
        txtSiglaUnidade.Text = Server.HtmlDecode(GridUnidade.SelectedRow.Cells(5).Text)
        txtNomeUnidade.Text = Server.HtmlDecode(GridUnidade.SelectedRow.Cells(6).Text)
        Session("Id_Empresa") = GridUnidade.SelectedRow.Cells(1).Text
    End Sub

    Protected Sub ImIncUnidade_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImIncUnidade.Click
        If txtNomeUnidade.Text <> "" Then
            Try
                SqlUnidade.Insert()
                GridUnidade.DataBind()
                txtAviso.Text = "Unidade incluída com sucesso"
                txtNomeUnidade.Text = ""
                txtCodUnidade.Text = ""
                txtSiglaUnidade.Text = ""
            Catch ex As Exception
                txtAviso.Text = "Não foi possível incluir nova unidade. Já existe unidade com o código ou nome escolhido "
                'txtErro.Text = ex.ToString
            End Try
        End If
    End Sub


    Protected Sub botaoVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoVoltar.Click
        txtNomeUnidade.Text = ""
        txtCodUnidade.Text = ""
        txtSiglaUnidade.Text = ""
        txtAviso.Text = ""
        txtErro.Text = ""
    End Sub

    Protected Sub botaoAlterarEmpresa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAlterarUnidade.Click
        Try
            SqlUnidade.Update()
            GridUnidade.DataBind()
            txtAviso.Text = "Dados da unidade alterados com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível alterar dados da unidade.  "
            '           txtErro.Text = ex.ToString
        End Try
    End Sub


    Protected Sub ImDelUnidade_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub DDLEmpresa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLEmpresa.SelectedIndexChanged
        Session("Id_Empresa") = DDLEmpresa.SelectedValue
        GridUnidade.DataBind()
    End Sub
End Class
