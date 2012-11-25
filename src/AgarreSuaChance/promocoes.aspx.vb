
Partial Class Promocoes
    Inherits System.Web.UI.Page
    Private _valorTotal As Decimal

    
    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim o1 As GridView
        o1 = GridView1

        Dim l1 As Integer
        Dim o1Soma As Integer = 0
        For l1 = 0 To o1.Rows.Count - 1
            o1Soma += Int(o1.Rows(l1).Cells(12).Text)
        Next

        ' Lbltotal1.Text = "Total : " + (o1Soma).ToString
    End Sub

   
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Label3.Text = GridView1.SelectedRow.Cells(5).Text
        Label4.Text = GridView1.SelectedRow.Cells(1).Text
        Label5.Text = GridView1.SelectedRow.Cells(3).Text

        Label7.Visible = True
        GridView2.Visible = True
        GridView2.DataBind()

    End Sub



    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        Label7.Visible = False
        GridView2.Visible = False

    End Sub

    Protected Sub DropDownList3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList3.SelectedIndexChanged
        Label7.Visible = False
        GridView2.Visible = False
    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        MultiView1.ActiveViewIndex = Menu1.SelectedValue

    End Sub

    Protected Sub GridView3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView3.SelectedIndexChanged

    End Sub

    Protected Sub brnfiltrar1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles brnfiltrar1.Click
        ReportViewer1.LocalReport.Refresh()
    End Sub

    Protected Sub TextBox6_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBox6.TextChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
