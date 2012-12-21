Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_LancarApontamento
    Inherits System.Web.UI.Page
    ' Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"

    Dim parametroAtivo As Parametro
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Me.parametroAtivo = GetParametroAtivo()

        If (Me.parametroAtivo Is Nothing) Then
            pnlVT.Enabled = False
        Else
            '    lblDataVT.Text = Me.parametroAtivo.
            LoadGridVT()

        End If
    End Sub

    Private Function GetParametroAtivo() As Parametro
        Dim db As New FrequenciaDocenteDataContext(conn)
        Dim par = (From p In db.Parametros _
                  Where p.Ano = DateTime.Now.Year And _
                  p.Mes = DateTime.Now.Month And _
                  p.Ativo _
                  Select p).FirstOrDefault()

        Return par
    End Function

    Private Sub LoadGridVT()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Dim listaVT = From r In db.AgendaExecutadas _
                      Where r.Matricula.Equals("00014134") _
                      And r.IdParametro = Me.parametroAtivo.Id _
                      Select r


        grdVT.DataSource = listaVT
        grdVT.DataBind()


    End Sub

    Protected Sub grdVT_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdVT.RowDataBound

        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim idAgendaExecutada = CType(e.Row.DataItem, AgendaExecutada).Id

            Dim registroVT As RegistroVT = GetRegistroVT(idAgendaExecutada)

            If Not (registroVT.Id Is Nothing) Then
                CType(e.Row.FindControl("txtIdaVolta"), TextBox).Text = registroVT.IdaVolta
                CType(e.Row.FindControl("txtValorVT"), TextBox).Text = registroVT.ValorVT
            End If

        End If


    End Sub

    Private Function GetRegistroVT(idAgendaExecutada As String) As RegistroVT
        Dim db = New FrequenciaDocenteDataContext(conn)
        Dim registroVT As RegistroVT = (From r In db.RegistroVTs _
                                       Where r.IdAgendaExecutada = idAgendaExecutada _
                                       Select r).FirstOrDefault()

        If (registroVT Is Nothing) Then
            Return New RegistroVT()
        Else
            Return registroVT
        End If

    End Function

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        For Each row As GridViewRow In grdVT.Rows
            If (row.RowType = DataControlRowType.DataRow) Then

            End If


        Next
    End Sub
End Class
