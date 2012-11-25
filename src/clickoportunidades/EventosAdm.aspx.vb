
Partial Class EventosAdm
    Inherits System.Web.UI.Page

    Protected Sub botaoIncluiEvento_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluiEvento.Click
        MultiView1.ActiveViewIndex = 0
        SqlDataSource1.Insert()
        GridView1.DataBind()
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        SqlDataSource1.Update()
        GridView1.DataBind()
    End Sub



    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        CRUD.Limpa(View2)
    End Sub

    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton6.Click
        MultiView1.ActiveViewIndex = 2
    End Sub
    Protected Sub ImageButton8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton8.Click
        SqlInsereparticipante.Insert()
        GridParticipantes.DataBind()
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub ImageButton9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton9.Click
        Session("id_evento") = cboid_evento_fk.SelectedValue
        MultiView1.ActiveViewIndex = 1
        CRUD.Popula(View2, SqlEventoCompleta)

    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        Try
            SqlEventoCompleta.Update()
            Label15.Text = "Dados foram inseridos com sucesso."
        Catch ex As Exception
            Label15.Text = "Dados não foram atualizados."
        End Try

    End Sub

    Protected Sub cboid_evento_fk_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_evento_fk.SelectedIndexChanged
        Session("id_evento") = cboid_evento_fk.SelectedValue
        CRUD.Popula(View2, SqlEventoCompleta)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtEvento.Text = ""
    End Sub

    Protected Sub ImageButton10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton10.Click
        Label18.Visible = False
        MultiView1.ActiveViewIndex = 1
        Session("id_evento") = cboid_evento_fk.SelectedValue
        CRUD.Popula(View2, SqlEventoCompleta)
    End Sub

    Protected Sub ImageButton11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton11.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            sqlEventoUpdate0.Update()

        Catch ex As Exception
            Label17.Text = "Selecione um evento na lista."
        End Try
        GridView1.DataBind()
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        sqlEventoUpdate.Update()
        GridView1.DataBind()
    End Sub
End Class
