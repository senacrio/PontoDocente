Imports ClassesSR
Partial Class AplicativosNOTES_AgendaSR_CadastroTipo
    Inherits System.Web.UI.Page

#Region " FUNÇÕES "

    Dim oTipo As New srTipo()

    Private Sub PopulaGridTipo()
        gridTipo.DataSource = oTipo.ListarTodos()
        gridTipo.DataBind()
    End Sub

    Private Sub GetTipo()
        oTipo.Cd_Tipo = gridTipo.SelectedValue
        oTipo.Listar()
        txtTipo.Text = oTipo.Nm_Tipo
    End Sub

    Private Sub SetTipo()

        oTipo.Cd_Tipo = gridTipo.SelectedValue
        oTipo.Bt_Ativo = True
        oTipo.Nm_Tipo = txtTipo.Text

    End Sub
#End Region


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PopulaGridTipo()
    End Sub

    Protected Sub gridTipo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridTipo.SelectedIndexChanged
        GetTipo()
        mvTipo.ActiveViewIndex = 1
    End Sub

    Protected Sub ImageButton16_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton16.Click
        SetTipo()
        Try
            oTipo.Salvar()
            mvTipo.ActiveViewIndex = 0

        Catch ex As Exception
            Response.Write(ex.Message.ToString)
        Finally
            PopulaGridTipo()
        End Try

    End Sub

    Protected Sub btnIncluir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIncluir.Click
        gridTipo.SelectedIndex = -1
        mvTipo.ActiveViewIndex = 1
        txtTipo.Text = ""
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnVoltar.Click
        mvTipo.ActiveViewIndex = 0
    End Sub
End Class
