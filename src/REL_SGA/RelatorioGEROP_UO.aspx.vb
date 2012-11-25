
Partial Class relatorios_sga_RelatorioGEROP_UO
    Inherits System.Web.UI.Page

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If RadioButtonList1.SelectedValue = 0 Then
            reportGEROP.Visible = True
            reportUO.Visible = False
        Else
            reportGEROP.Visible = False
            reportUO.Visible = True
        End If


    End Sub
End Class
