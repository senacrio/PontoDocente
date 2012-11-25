
Partial Class curriculo
    Inherits System.Web.UI.Page

   
    Protected Sub DataList2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList2.Load
        If DataList2.Items.Count <= 0 Then
            Panel11.Visible = False
        Else
            Panel11.Visible = True
        End If
    End Sub


    Protected Sub DataList7_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList7.Load
        If DataList7.Items.Count <= 0 Then
            Panel8.Visible = False
        Else
            Panel8.Visible = True
        End If
    End Sub

    Protected Sub DataList8_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList8.Load
        If DataList8.Items.Count <= 0 Then
            Panel12.Visible = False
        Else
            Panel12.Visible = True
        End If
    End Sub

    Protected Sub DataList3_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList3.Load
        If DataList3.Items.Count <= 0 Then
            Panel3.Visible = False
        Else
            Panel3.Visible = True
        End If
    End Sub

    Protected Sub DataList6_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList6.Load
        If DataList6.Items.Count <= 0 Then
            Panel7.Visible = False
        Else
            Panel7.Visible = True
        End If
    End Sub

    Protected Sub DataList9_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList9.Load
        If DataList9.Items.Count <= 0 Then
            Panel10.Visible = False
        Else
            Panel10.Visible = True
        End If
    End Sub

    Protected Sub DataList4_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList4.Load
        If DataList4.Items.Count <= 0 Then
            Panel4.Visible = False
        Else
            Panel4.Visible = True
        End If
    End Sub
End Class
