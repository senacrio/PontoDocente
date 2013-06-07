Imports Senac.ControleRHDocente
Imports System.Linq

Partial Class FrequenciaDocente_ValidacaoApontamento
    Inherits System.Web.UI.Page
    Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"

    'Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"

    Dim parametroAtivo As Parametro
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.parametroAtivo = GetParametroAtivo()
        ' Context.Session("c_Cod_Lotac") = "61"

        Dim dataInicioVal = DateTime.ParseExact(Me.parametroAtivo.PAA_DE, "yy-MM-dd", Nothing)
        Dim dataFimVal = DateTime.ParseExact(Me.parametroAtivo.PAA_ATE, "yy-MM-dd", Nothing)

        If (Me.parametroAtivo Is Nothing Or Not (DateTime.Now.Date >= dataInicioVal And DateTime.Now.Date <= dataFimVal)) Then
            divValidacao.Visible = False
            pnl.Enabled = False
            lblMsgErro.ForeColor = Drawing.Color.Red
            lblMsgErro.Text = "NÃO EXISTE MOVIMENTO PARA SER VALIDADO."

        Else

            If (Not Page.IsPostBack) Then
                LoadComboValidacao()
                LoadGridValidacao()
            End If
        End If
    End Sub

    Private Sub LoadGridValidacao()
        Dim db As New FrequenciaDocenteDataContext(conn)
        Dim lotacaoInterino = GetInterino()

        Dim area = Session("c_Ccusto").ToString().Substring(0, 3)

        Dim listaValidacao = From v In db.vwValidacaos _
                             Where v.idparametro.Equals(Me.parametroAtivo.Id.ToString()) _
                             And v.tipo.Equals(ddlValidacao.SelectedValue) _
                             And v.IdUnidade.Equals(area) _
                             Order By v.funcionario Ascending
        'And v.|
        'And v.IdUnidade.Equals(Context.Session("c_Cod_Lotac")) _
        '  Or v.IdUnidade.Equals(lotacaoInterino)

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


                Dim grdDetalhes As GridView = CType(row.FindControl("grdDetalhes"), GridView)

                If (Not grdDetalhes Is Nothing) Then
                    For Each rowDetalhe As GridViewRow In grdDetalhes.Rows
                        If (rowDetalhe.RowType = DataControlRowType.DataRow) Then
                            Dim chkValidacao = DirectCast(rowDetalhe.FindControl("chkValidaVT"), CheckBox)
                            Dim chkValidacaoHora = DirectCast(rowDetalhe.FindControl("chkValidaHora"), CheckBox)
                            Dim ddlCentroCusto = CType(rowDetalhe.FindControl("ddlCentroCusto"), DropDownList)
                            Dim idApontamento = chkValidacaoHora.Attributes("idApontamento").ToString()


                            Dim atividadeAcademica = (From a In db.AtividadeAcademicas _
                                       Where a.Id.Equals(idApontamento) _
                                                    Select a).FirstOrDefault()

                            Dim agendaExecutada = (From a In db.AgendaExecutadaVTs _
                                       Where a.Id.Equals(idApontamento) _
                                       Select a).FirstOrDefault()

                            Dim coordenacao = (From a In db.Coordenacaos _
                                       Where a.Id.Equals(idApontamento) _
                                       Select a).FirstOrDefault()

                            Dim ead = (From a In db.LancamentoEADs _
                                      Where a.Id.Equals(idApontamento) _
                                      Select a).FirstOrDefault()

                            Dim lancamentoVT = (From a In db.LancamentoVTs _
                                     Where a.Id.Equals(idApontamento) _
                                     Select a).FirstOrDefault()

                            If (Not atividadeAcademica Is Nothing) Then
                                atividadeAcademica.ValidacaoHora = chkValidacaoHora.Checked
                                atividadeAcademica.Validacao = chkValidacao.Checked
                                atividadeAcademica.DataHoraValidacao = DateTime.Now
                                atividadeAcademica.CentroCusto = ddlCentroCusto.SelectedValue
                            End If

                            If (Not agendaExecutada Is Nothing) Then
                                agendaExecutada.ValidacaoHora = chkValidacaoHora.Checked
                                agendaExecutada.Validacao = chkValidacao.Checked
                                agendaExecutada.DataHoraValidacao = DateTime.Now
                                agendaExecutada.CentroCusto = ddlCentroCusto.SelectedValue
                            End If

                            If (Not coordenacao Is Nothing) Then
                                coordenacao.ValidacaoHora = chkValidacaoHora.Checked
                                coordenacao.Validacao = chkValidacao.Checked
                                coordenacao.DataHoraValidacao = DateTime.Now
                                coordenacao.CentroCusto = ddlCentroCusto.SelectedValue
                            End If

                            If (Not ead Is Nothing) Then
                                ead.ValidacaoHora = chkValidacaoHora.Checked
                                ead.Validacao = chkValidacao.Checked
                                ead.DataHoraValidacao = DateTime.Now
                                ead.CentroCusto = ddlCentroCusto.SelectedValue
                            End If

                            If (Not lancamentoVT Is Nothing) Then
                                lancamentoVT.Validacao = chkValidacao.Checked
                            End If

                            db.SubmitChanges()
                        End If

                    Next
                End If
            End If
        Next


        LoadComboValidacao()
        LoadGridValidacao()

        lblMsgErro.ForeColor = Drawing.Color.Green
        lblMsgErro.Text = "Registro(s) validados com sucesso."

    End Sub

    Protected Sub grdValidacao_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdValidacao.RowDataBound
        Dim db As New FrequenciaDocenteDataContext(conn)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim chkValidacao = DirectCast(e.Row.FindControl("chkValidacao"), CheckBox)
            Dim grdDetalhes = DirectCast(e.Row.FindControl("grdDetalhes"), GridView)
            Dim area = Session("c_Ccusto").ToString().Substring(0, 3)

            Dim matricula = chkValidacao.Attributes("Matricula").ToString()
            Dim idUnidade = chkValidacao.Attributes("IdUnidade").ToString()
            Dim categoria = chkValidacao.Attributes("IdCategoria").ToString()
            Dim idapontamento = chkValidacao.Attributes("IdParametro").ToString()

            Dim detalhes = From a In db.vwApontamentos _
                           Where a.Matricula.Equals(matricula) And _
                           a.Area.Equals(idUnidade) And _
                           a.Categoria.Equals(categoria) _
                           And a.IdParametro.Equals(idapontamento) _
                           And a.tipo.Equals(ddlValidacao.SelectedValue) _
                           And a.Area.Equals(area) _
                           Select a _
                           Order By a.Data

            grdDetalhes.DataSource = detalhes
            grdDetalhes.DataBind()


        End If
    End Sub

    Protected Sub btnValidar_Click(sender As Object, e As EventArgs)
        Dim db As New FrequenciaDocenteDataContext(conn)
        Dim btn = DirectCast(sender, Button)
        Dim id = btn.CommandArgument

        Dim tipo = btn.Attributes("tipo").ToString()

        If (tipo.Equals("Atividade Acadêmica")) Then
            Dim atv = (From a In db.AtividadeAcademicas _
                      Where a.Id.Equals(id) _
                      Select a).FirstOrDefault()
            atv.Validacao = True
            atv.ValidacaoHora = True
            atv.DataHoraValidacao = DateTime.Now
            atv.UsuarioValidacao = Session("c_Matricula")
        ElseIf tipo.Equals("Coordenação") Then
            Dim coord = (From c In db.Coordenacaos _
                      Where c.Id.Equals(id) _
                      Select c).FirstOrDefault()
            coord.Validacao = True
            coord.DataHoraValidacao = DateTime.Now
            coord.UsuarioValidacao = Session("c_Matricula")
        ElseIf tipo.Equals("Agenda Executada") Then
            Dim ae = (From a In db.AgendaExecutadaVTs _
                    Where a.Id.Equals(id) _
                    Select a).FirstOrDefault()
            ae.ValidacaoHora = True
            ae.Validacao = True
            ae.DataHoraValidacao = DateTime.Now
        ElseIf tipo.Equals("EAD") Then
            Dim ead = (From c In db.LancamentoEADs _
                      Where c.Id.Equals(id) _
                      Select c).FirstOrDefault()
            ead.Validacao = True
            ead.ValidacaoHora = True
            ead.DataHoraValidacao = DateTime.Now
            ead.UsuarioValidacao = Session("c_Matricula")
        ElseIf tipo.Equals("Lancamento VT") Then
            Dim vt = (From c In db.LancamentoVTs _
                      Where c.Id.Equals(id) _
                      Select c).FirstOrDefault()
            vt.Validacao = True

            vt.DataHoraValidacao = DateTime.Now
            vt.UsuarioValidacao = Session("c_Matricula")
        End If

        db.SubmitChanges()

        LoadGridValidacao()
        LoadComboValidacao()
    End Sub

    Private Function GetInterino() As String
        Dim db As New FrequenciaDocenteDataContext(conn)

        Dim interino = (From i In db.ptnInterinos _
                       Where i.Matricula.Equals(Session("c_Matricula"))).FirstOrDefault()

        If (Not interino Is Nothing) Then
            Return interino.Lotacao
        Else
            Return ""
        End If

    End Function

    Private Sub LoadComboValidacao()
        Dim db As New FrequenciaDocenteDataContext(conn)
        Dim area = Session("c_Ccusto").ToString().Substring(0, 3)

        Dim lista = (From v In db.vwValidacaos _
                             Where v.idparametro.Equals(Me.parametroAtivo.Id.ToString()) _
                             And v.IdUnidade.Equals(area) _
                             Group v By Key = v.tipo Into Group _
                             Select Id = Key, Texto = Key + " ( " + Group.Count().ToString() + " )").ToList()


        'ddlValidacao.Items.Clear()
        'ddlValidacao.Items.Add(New ListItem("Agenda Executada", "Agenda Executada"))
        'ddlValidacao.Items.Add(New ListItem("Atividade Acadêmica", "Atividade Acadêmica"))
        'ddlValidacao.Items.Add(New ListItem("Coordenação", "Coordenação"))
        'ddlValidacao.Items.Add(New ListItem("EAD", "EAD"))

        ddlValidacao.DataSource = lista
        ddlValidacao.DataTextField = "Texto"
        ddlValidacao.DataValueField = "Id"
        ddlValidacao.DataBind()
    End Sub

    Protected Sub ddlValidacao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlValidacao.SelectedIndexChanged
        LoadGridValidacao()
    End Sub

    Protected Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs)
        Dim check As CheckBox = DirectCast(sender, CheckBox)

        For Each row As GridViewRow In grdValidacao.Rows
            If (row.RowType = DataControlRowType.DataRow) Then

                Dim chkValidacao = DirectCast(row.FindControl("chkValidaHora"), CheckBox)
                chkValidacao.Checked = check.Checked

            End If
        Next


    End Sub

    Protected Sub chkValorTotal_CheckedChanged(sender As Object, e As EventArgs)
        Dim check As CheckBox = DirectCast(sender, CheckBox)

        For Each row As GridViewRow In grdValidacao.Rows
            If (row.RowType = DataControlRowType.DataRow) Then

                Dim chkValidacao = DirectCast(row.FindControl("chkValidaVT"), CheckBox)
                chkValidacao.Checked = check.Checked

            End If
        Next

    End Sub

    Protected Sub chkValidaHora_CheckedChanged(sender As Object, e As EventArgs)
        Dim check As CheckBox = DirectCast(sender, CheckBox)

        Dim validacao = DirectCast(grdValidacao.HeaderRow.FindControl("chkValorTotal"), CheckBox)

        If (validacao.Checked) Then
            validacao.Checked = False
        End If
    End Sub

    Protected Sub chkValidaHora_CheckedChanged1(sender As Object, e As EventArgs)
        Dim check As CheckBox = DirectCast(sender, CheckBox)

        Dim validacao = DirectCast(grdValidacao.HeaderRow.FindControl("chkHorasTotal"), CheckBox)

        If (validacao.Checked) Then
            validacao.Checked = False
        End If
    End Sub

    Protected Sub grdDetalhes_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        Dim grdDetalhe = CType(sender, GridView)
        Dim area = Session("c_Ccusto").ToString().Substring(0, 3)
        Dim ddlCentroCusto = CType(e.Row.FindControl("ddlCentroCusto"), DropDownList)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim db As New FrequenciaDocenteDataContext(conn)
            If (ddlValidacao.SelectedValue.Equals("Agenda Executada")) Then
                e.Row.FindControl("chkValidaHora").Visible = False
                grdDetalhe.Columns(5).Visible = False
                ddlCentroCusto.Enabled = False
            End If

            Dim lblUnidade As Label = DirectCast(e.Row.FindControl("lblUnidade"), Label)
            Dim unidade = db.vwUnidadePontoDocentes.FirstOrDefault(Function(u) u.IdUnidade.Equals(lblUnidade.ToolTip))


            lblUnidade.Text = unidade.Unidade



            If (Session("_centroCusto") Is Nothing) Then
                Session("_centroCusto") = From u In db.CentroCustoDocentes _
                                       Select u _
                                       Where u.Id.StartsWith(area) _
                                       Order By u.CentroCusto
            End If
            ddlCentroCusto.Items.Clear()
            ddlCentroCusto.DataSource = Session("_centroCusto")
            ddlCentroCusto.DataValueField = "Id"
            ddlCentroCusto.DataTextField = "Id"
            ddlCentroCusto.DataBind()

            Dim centroCustos = (From cc In db.CentroCustoDocentes _
                         Where cc.Id.StartsWith("-") _
                                 Select cc).ToList()

            For Each item In centroCustos
                ddlCentroCusto.Items.Add(New ListItem(item.Id.Replace("-", ""), item.Id.Replace("-", "")))
            Next


            ddlCentroCusto.SelectedValue = CType(e.Row.DataItem, vwApontamento).CentroCusto
            db.Dispose()
        End If




    End Sub
End Class
