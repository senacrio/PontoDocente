Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_CronogramaFechamentoList
    Inherits System.Web.UI.Page

    ' Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"

    Protected Sub grdCronogramaFechamento_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdCronogramaFechamento.SelectedIndexChanged

    End Sub

    Protected Sub grdCronogramaFechamento_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdCronogramaFechamento.RowDataBound

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        LoadGrid()
        If Not Request("Mensagem") Is Nothing Then
            lblMsg.Text = Request("Mensagem").ToString()
            lblMsg.ForeColor = Drawing.Color.Green
        End If

    End Sub

    Private Sub LoadGrid()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Dim parametros = From p In db.Parametros _
                         Where p.Ativo _
                         And Convert.ToDateTime(p.Ano.ToString() + "-" + p.Mes.ToString() + "-01") >= Convert.ToDateTime(DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-01") _
                          Order By p.Ano Descending _
                          Order By p.Mes Descending _
                          Order By p.Versao Descending

        grdCronogramaFechamento.DataSource = parametros
        grdCronogramaFechamento.DataBind()
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Dim id = CType(sender, ImageButton)
        Response.Redirect("CronogramaFechamento.aspx?Id=" + id.CommandArgument)
    End Sub

    Protected Sub btnNovo_Click(sender As Object, e As EventArgs) Handles btnNovo.Click
        Response.Redirect("CronogramaFechamento.aspx")
    End Sub

    Protected Sub grdCronogramaFechamento_PageIndexChanged(sender As Object, e As EventArgs) Handles grdCronogramaFechamento.PageIndexChanged

    End Sub

    Protected Sub grdCronogramaFechamento_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs) Handles grdCronogramaFechamento.SelectedIndexChanging

    End Sub

    Protected Sub grdCronogramaFechamento_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles grdCronogramaFechamento.PageIndexChanging

        grdCronogramaFechamento.PageIndex = e.NewPageIndex
        LoadGrid()
    End Sub
End Class
