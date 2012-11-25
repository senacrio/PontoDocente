
Partial Class Horas_Executadas_HorasExecutadas
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Panel2.Visible = True

        Panel3.Visible = False
        Panel4.Visible = False

        Label2.Visible = True

        Label3.Visible = False
        Label4.Visible = False

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click

        Panel3.Visible = True
        Panel2.Visible = False
        Panel4.Visible = False

        Label3.Visible = True
        Label2.Visible = False
        Label4.Visible = False



    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Panel4.Visible = True
        Panel2.Visible = False
        Panel3.Visible = False

        Label4.Visible = True
        Label2.Visible = False
        Label3.Visible = False


    End Sub
End Class
