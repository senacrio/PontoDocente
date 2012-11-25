
Partial Class Sos_TransferirSolicitante
    Inherits System.Web.UI.Page

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboNovoSolicitante.SelectedIndexChanged

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        sdsTransferir.Update()
        cboNovoSolicitante.DataBind()
        cboSolicitante.DataBind()

    End Sub
End Class
