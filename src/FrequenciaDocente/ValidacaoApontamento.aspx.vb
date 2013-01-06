Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_ValidacaoApontamento
    Inherits System.Web.UI.Page
    ' Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"

    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"

    Dim parametroAtivo As Parametro
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.parametroAtivo = GetParametroAtivo()

        If (Me.parametroAtivo Is Nothing) Then
            pnl.Enabled = False
        End If

        If (Not Page.IsPostBack) Then
            LoadGridValidacao()
        End If
    End Sub

    Private Sub LoadGridValidacao()
        Dim db As New FrequenciaDocenteDataContext(conn)
        Dim listaValidacao = From v In db.vwValidacaos _
                             Where v.idparametro.Equals(Me.parametroAtivo.Id.ToString())

        grdValidacao.DataSource = listaValidacao
        grdValidacao.DataBind()
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

    Protected Sub lnkExpandir_Click(sender As Object, e As EventArgs)
        Dim lnkButton = DirectCast(sender, LinkButton)

        If lnkButton.Text.Equals("[+]") Then
            lnkButton.Text = "[-]"
        Else
            lnkButton.Text = "[+]"
        End If
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        For Each row As GridViewRow In grdValidacao.Rows
            If (row.RowType = DataControlRowType.DataRow) Then
                Dim chkValidacao = DirectCast(row.FindControl("chkValidacao"), CheckBox)
                chkValidacao.Checked = False
            End If
        Next
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        Dim db As New FrequenciaDocenteDataContext(conn)
        For Each row As GridViewRow In grdValidacao.Rows
            If (row.RowType = DataControlRowType.DataRow) Then

                Dim chkValidacao = DirectCast(row.FindControl("chkValidacao"), CheckBox)
                If (chkValidacao.Checked) Then
                    Dim matricula = chkValidacao.Attributes("Matricula").ToString()
                    Dim idUnidade = chkValidacao.Attributes("IdUnidade").ToString()
                    Dim categoria = chkValidacao.Attributes("IdCategoria").ToString()
                    Dim tipo = chkValidacao.Attributes("Tipo").ToString()

                    Dim listaAA = From a In db.AtividadeAcademicas _
                                Where _
                                a.IdUnidade.Equals(idUnidade) And _
                                a.Matricula.Equals(matricula.PadLeft("8", "0")) And _
                                a.Categoria.Equals(categoria) _
                                Select a

                    Dim listaVT = From a In db.AgendaExecutadaVTs _
                               Where _
                               a.Unidade.Equals(idUnidade) And _
                               a.Matricula.Equals(matricula.PadLeft("8", "0")) And _
                               a.Categoria.Equals(categoria) And _
                               a.ValorVT.HasValue _
                               Select a

                    Dim listaCoord = From a In db.Coordenacaos _
                               Where _
                               a.IdUnidade.Equals(idUnidade) And _
                               a.Matricula.Equals(matricula.PadLeft("8", "0")) And _
                               a.Categoria.Equals(categoria) _
                               Select a

                    For Each atividade In listaAA
                        atividade.Validacao = True
                        atividade.DataHoraValidacao = DateTime.Now
                        atividade.UsuarioValidacao = Session("c_Matricula")
                        db.SubmitChanges()
                    Next

                    For Each atividade In listaVT
                        atividade.Validacao = True
                        atividade.DataHoraValidacao = DateTime.Now
                        db.SubmitChanges()
                    Next

                    For Each atividade In listaCoord
                        atividade.Validacao = True
                        atividade.DataHoraValidacao = DateTime.Now
                        atividade.UsuarioValidacao = Session("c_Matricula")
                        db.SubmitChanges()
                    Next

                End If

            End If
        Next
        LoadGridValidacao()
    End Sub

    Protected Sub grdValidacao_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdValidacao.RowDataBound
        Dim db As New FrequenciaDocenteDataContext(conn)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim chkValidacao = DirectCast(e.Row.FindControl("chkValidacao"), CheckBox)
            Dim grdDetalhes = DirectCast(e.Row.FindControl("grdDetalhes"), GridView)

            Dim matricula = chkValidacao.Attributes("Matricula").ToString()
            Dim idUnidade = chkValidacao.Attributes("IdUnidade").ToString()
            Dim categoria = chkValidacao.Attributes("IdCategoria").ToString()

            Dim detalhes = From a In db.vwApontamentos _
                           Where a.Matricula.Equals(matricula.PadLeft("8", "0")) And _
                           a.IdUnidade.Equals(idUnidade) And _
                           a.Categoria.Equals(categoria) _
                           Select a

            grdDetalhes.DataSource = detalhes
            grdDetalhes.DataBind()


        End If
    End Sub

    Protected Sub btnValidar_Click(sender As Object, e As EventArgs)
        Dim db As New FrequenciaDocenteDataContext(conn)
        Dim btn = DirectCast(sender, Button)
        Dim id = btn.CommandArgument

        Dim tipo = btn.Attributes("tipo").ToString()

        If (tipo.Equals("AtividadeAcademica")) Then
            Dim atv = (From a In db.AtividadeAcademicas _
                      Where a.Id.Equals(id) _
                      Select a).FirstOrDefault()
            atv.Validacao = True
            atv.DataHoraValidacao = DateTime.Now
            atv.UsuarioValidacao = Session("c_Matricula")
        ElseIf tipo.Equals("Coordenacao") Then
            Dim coord = (From c In db.Coordenacaos _
                      Where c.Id.Equals(id) _
                      Select c).FirstOrDefault()
            coord.Validacao = True
            coord.DataHoraValidacao = DateTime.Now
            coord.UsuarioValidacao = Session("c_Matricula")
        ElseIf tipo.Equals("AgendaExecutadaVT") Then
            Dim ae = (From a In db.AgendaExecutadaVTs _
                    Where a.Id.Equals(id) _
                    Select a).FirstOrDefault()

            ae.Validacao = True
            ae.DataHoraValidacao = DateTime.Now
        End If

        db.SubmitChanges()

        LoadGridValidacao()
    End Sub
End Class
