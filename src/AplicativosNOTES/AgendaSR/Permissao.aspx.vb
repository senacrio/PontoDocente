Imports ClassesSR
Partial Class AplicativosNOTES_AgendaSR_Permissao
    Inherits System.Web.UI.Page

    Private oPermissao As New srPermissao
    Private oColaborador As New SGT_RHFuncionarioAtivo

    Private Sub PopulaGrid()
        gridPermissao.DataSource = oPermissao.ListarPermissao()
        gridPermissao.DataBind()
    End Sub

    Private Sub PopulaFuncionario()
        oColaborador.nom_pessoa_fisic = TextBox1.Text
        gridFuncionarios.DataSource = oColaborador.ListarColaborador()
        gridFuncionarios.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            PopulaGrid()
            PopulaFuncionario()
        End If
    End Sub

    Protected Sub btnBuscar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnBuscar.Click
        lblmsg.Text = ""
        PopulaFuncionario()
        gridFuncionarios.SelectedIndex = -1
        gridPermissao.SelectedIndex = -1
    End Sub

    Protected Sub btnAutoriza_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAutoriza.Click

        oPermissao.Cd_Usuario_FK = gridFuncionarios.SelectedValue
        Try
            oPermissao.Salvar()
            lblmsg.Text = gridFuncionarios.DataKeys(gridFuncionarios.SelectedIndex).Values("nom_pessoa_fisic") + " foi autorizado."
            gridFuncionarios.SelectedIndex = -1
        Catch ex As Exception
            lblmsg.Text = ex.Message.ToString
        End Try

        PopulaGrid()
        PopulaFuncionario()
    End Sub

    Protected Sub btnRemove_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemove.Click
        oPermissao.Cd_Usuario_FK = gridPermissao.SelectedValue

        Try
            oPermissao.Excluir()
            lblmsg.Text = gridPermissao.DataKeys(gridPermissao.SelectedIndex).Values("nom_pessoa_fisic") + " não tem mais permissão."
            gridPermissao.SelectedIndex = -1
        Catch ex As Exception
            lblmsg.Text = ex.Message.ToString
        End Try
        
        PopulaGrid()
        PopulaFuncionario()

    End Sub

  
End Class
