
Partial Class Psg_ImprimirClassificados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCurso.Text = Request.QueryString("curso").ToString
        lblTurno.Text = Request.QueryString("turno").ToString
        lblUnidade.Text = Request.QueryString("unidade").ToString

    End Sub
End Class
