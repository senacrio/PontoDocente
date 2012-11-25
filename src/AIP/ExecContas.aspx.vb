Imports System.Data
Partial Class aip_ExecContas

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnIncluiEC_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles BtnIncluiEC.Click
        txtAviso.Text = ""
        Try
            If GridViewFuncionCSC.SelectedIndex >= 0 Then
                SqlEC.Insert()
                GridViewExecContas.DataBind()
            End If
        Catch ex As Exception
            txtAviso.Text = "Item já foi inserido, favor selecionar outra opção"
        End Try

    End Sub
End Class
