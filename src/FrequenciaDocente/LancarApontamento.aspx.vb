Imports Senac.ControleRHDocente
Imports System.Linq
Imports System.Collections.Generic


Partial Class FrequenciaDocente_LancarApontamento
    Inherits System.Web.UI.Page
    'Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"
    Dim btnSalvarI As Button
    Dim parametroAtivo As Parametro

    Dim listaAtividades As New List(Of AtividadeAcademica)
    Dim listaEad As New List(Of LancamentoEAD)
    Private _listaCoordenacao As List(Of Coordenacao)
    Private _currentCoordenacao As Coordenacao
    Private _currentEAD As Object
    Private _listaVT As List(Of LancamentoVT)
    Private _currentVT As LancamentoVT

    Public Function ExisteLancamento(id As String, matricula As String, entrada As String, saida As String, data As DateTime) As Boolean
        Dim db = New FrequenciaDocenteDataContext(conn)

        Dim retorno As Boolean = db.ValidarHoraDocente(matricula, entrada, saida, data, id).Any()

        Return retorno
    End Function

    Public Property CurrentAtividadeAcademica() As AtividadeAcademica
        Get
            Return CType(Session("_ATIVIDADEACADEMICA"), AtividadeAcademica)
        End Get
        Set(ByVal value As AtividadeAcademica)
            Session("_ATIVIDADEACADEMICA") = value
        End Set
    End Property

    Private Property listaCoordenacao As List(Of Coordenacao)
        Get
            Return _listaCoordenacao
        End Get
        Set(value As List(Of Coordenacao))
            _listaCoordenacao = value
        End Set
    End Property

    Private Property CurrentCoordenacao As Coordenacao
        Get
            Return CType(Session("_COORDENACAO"), Coordenacao)
        End Get
        Set(value As Coordenacao)
            Session("_COORDENACAO") = value
        End Set
    End Property

    Private Property CurrentEAD As LancamentoEAD
        Get
            Return CType(Session("_EAD"), LancamentoEAD)
        End Get
        Set(value As LancamentoEAD)
            Session("_EAD") = value
        End Set
    End Property

    Private Property listaVT As List(Of LancamentoVT)
        Get
            Return _listaVT
        End Get
        Set(value As List(Of LancamentoVT))
            _listaVT = value
        End Set
    End Property

    Private Property CurrentVT As LancamentoVT
        Get
            Return CType(Session("_VT"), LancamentoVT)
        End Get
        Set(value As LancamentoVT)
            Session("_VT") = value
        End Set
    End Property


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session("c_Matricula") = "14134"

        Me.parametroAtivo = GetParametroAtivo()

        If (Me.parametroAtivo Is Nothing) Then
            pnl.Enabled = False
        Else

            Menu1.Items(mvLancamento.ActiveViewIndex).Selected = True
            '    lblDataVT.Text = Me.parametroAtivo.
            If Not (Page.IsPostBack) Then
                LoadGridVT()
                LoadGridAtividadesAcademicas()
                LoadGridCoordenacao()
                LoadGridEAD()
                LoadGridLancamentoVT()

            End If

        End If
        LoadHoras()
        'rvValorVT.Text = "O valor de corte do VT é de: R$ " + Me.parametroAtivo.VL_CT_VT


        'rvValorVTCoord.Text = "O valor de corte do VT é de: R$ " + Me.parametroAtivo.VL_CT_VT



        'rvValorVTEAD.Text = "O valor de corte do VT é de: R$ " + Me.parametroAtivo.VL_CT_VT


        'rvValorVTVT.Text = "O valor de corte do VT é de: R$ " + Me.parametroAtivo.VL_CT_VT
        'lblValorCorte.Text = "O valor de corte do VT é de: R$ " + Me.parametroAtivo.VL_CT_VT


        Dim dataInicioAtv = DateTime.ParseExact(Me.parametroAtivo.PAI_VT_DE, "yy-MM-dd", Nothing)
        Dim dataFinalAtv = DateTime.ParseExact(Me.parametroAtivo.PAI_VT_ATE, "yy-MM-dd", Nothing)

        Dim dataInicioCoord = DateTime.ParseExact(Me.parametroAtivo.PCO_DE, "yy-MM-dd", Nothing)
        Dim dataFinalCoord = DateTime.ParseExact(Me.parametroAtivo.PCO_ATE, "yy-MM-dd", Nothing)


        rvData.ErrorMessage = "A data deve estar entre: " + dataInicioAtv.ToString("dd/MM/yyyy") + " e " + dataFinalAtv.ToString("dd/MM/yyyy")
        rvData.MinimumValue = dataInicioAtv.ToString("dd-MM-yyyy")
        rvData.MaximumValue = dataFinalAtv.ToString("dd-MM-yyyy")
        rvData.ControlToValidate = "txtData"

        rvDataCoord.ErrorMessage = "A data deve estar entre: " + dataInicioCoord.ToString("dd/MM/yyyy") + " e " + dataFinalCoord.ToString("dd/MM/yyyy")
        rvDataCoord.MinimumValue = dataInicioCoord.ToString("dd-MM-yyyy")
        rvDataCoord.MaximumValue = dataFinalCoord.ToString("dd-MM-yyyy")
        rvDataCoord.ControlToValidate = "txtDataCoord"

        rvDataEAD.ErrorMessage = "A data deve estar entre: " + dataInicioCoord.ToString("dd/MM/yyyy") + " e " + dataFinalCoord.ToString("dd/MM/yyyy")
        rvDataEAD.MinimumValue = dataInicioCoord.ToString("dd-MM-yyyy")
        rvDataEAD.MaximumValue = dataFinalCoord.ToString("dd-MM-yyyy")
        rvDataEAD.ControlToValidate = "txtDataEAD"

        rvDataVT.ErrorMessage = "A data deve estar entre: " + dataInicioCoord.ToString("dd/MM/yyyy") + " e " + dataFinalCoord.ToString("dd/MM/yyyy")
        rvDataVT.MinimumValue = dataInicioCoord.ToString("dd-MM-yyyy")
        rvDataVT.MaximumValue = dataFinalCoord.ToString("dd-MM-yyyy")
        rvDataVT.ControlToValidate = "txtDataVT"

    End Sub

    Private Sub LoadHoras()
        Dim db = New FrequenciaDocenteDataContext(conn)

        grdHoras.DataSource = db.GetHorasDocente(Convert.ToInt32(Session("c_Matricula")))
        grdHoras.DataBind()
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

        ' r.Matricula.Equals("00014134") _

        Dim listaVT = From r In db.AgendaExecutadaVTs _
                      Where r.Matricula.Equals(Session("c_Matricula").ToString().PadLeft(8, "0")) _
                      And r.IdParametro = Me.parametroAtivo.Id _
                      And Not r.Validacao _
                      Select r
        If listaVT Is Nothing Or listaVT.Count = 0 Then
            Menu1.Enabled = False
        Else
            Menu1.Enabled = True
            grdVT.DataSource = listaVT
            grdVT.DataBind()
        End If


    End Sub

    Protected Sub grdVT_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdVT.RowDataBound

        'If (e.Row.RowType = DataControlRowType.DataRow) Then
        '    Dim idAgendaExecutada = CType(e.Row.DataItem, AgendaExecutada).Id

        '    Dim registroVT As RegistroVT = GetRegistroVT(idAgendaExecutada)

        '    If Not (registroVT.Id Is Nothing) Then
        '        CType(e.Row.FindControl("txtIdaVolta"), TextBox).Text = registroVT.IdaVolta
        '        CType(e.Row.FindControl("txtValorVT"), TextBox).Text = registroVT.ValorVT
        '    End If

        'End If


    End Sub



    Private Sub SaveAgendaVT(id As String, valorVT As String, valorIdaVolta As String)
        Dim db = New FrequenciaDocenteDataContext(conn)

        Dim agendaVT = (From aevt In db.AgendaExecutadaVTs _
                       Where aevt.Id.Equals(id) _
                       Select aevt).FirstOrDefault()
        agendaVT.IdaVolta = valorIdaVolta
        agendaVT.ValorVT = Convert.ToDecimal(valorVT)

        db.SubmitChanges()

        lblMsg.Text = "Registro salvo com sucesso."
        lblMsg.ForeColor = Drawing.Color.Green
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Try
            btnSalvarI = sender

        Catch ex As Exception
            Response.Write(ex.Message)

        End Try
    End Sub

    Protected Sub grdVT_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdVT.RowCommand

    End Sub

    Protected Sub grdVT_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdVT.SelectedIndexChanged
        Dim row = grdVT.Rows(grdVT.SelectedIndex)

        Dim txtValorIdaVolta As TextBox = CType(row.FindControl("txtIdaVolta"), TextBox)
        Dim txtValorVT As TextBox = CType(row.FindControl("txtValorVT"), TextBox)

        Dim id As String = txtValorIdaVolta.Attributes("idagenda")

        SaveAgendaVT(id, txtValorVT.Text, txtValorIdaVolta.Text)

        grdVT.SelectedIndex = -1
    End Sub

    Protected Sub grdVT_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs) Handles grdVT.SelectedIndexChanging

    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvarAtv.Click
        Try
            SaveAtividadeAcademica()
            LoadGridAtividadesAcademicas()
            LimparCampos()
            grdAtividadesAcademicas.SelectedIndex = -1
            LoadHoras()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub SaveAtividadeAcademica()
        Dim db As New FrequenciaDocenteDataContext(conn)

        Dim atividadeAcademica As AtividadeAcademica = GetAtividadeAcademica(db)




        If (atividadeAcademica.Id Is Nothing) Then
            Me.CurrentAtividadeAcademica.Id = Guid.NewGuid().ToString()
            db.AtividadeAcademicas.InsertOnSubmit(Me.CurrentAtividadeAcademica)
        Else

        End If

        If (Not txtValorVT.Text.Equals(String.Empty) And String.IsNullOrEmpty(txtIdaVolta.Text)) Then
            lblMsgAA.Text = "Entre com o trajeto de ida e volta."
            lblMsgAA.ForeColor = Drawing.Color.Red
            db.Dispose()
            Me.CurrentAtividadeAcademica = Nothing
            Return
        End If

        If (ExisteLancamento(atividadeAcademica.Id, atividadeAcademica.Matricula, atividadeAcademica.Entrada, atividadeAcademica.Saida, atividadeAcademica.Data)) Then
            lblMsgAA.Text = "Já existe um lançamento nesse horário para esse dia."
            lblMsgAA.ForeColor = Drawing.Color.Red
            db.Dispose()
            Me.CurrentAtividadeAcademica = Nothing
            Return
        End If

        db.SubmitChanges()
        Me.CurrentAtividadeAcademica = Nothing

        lblMsgAA.Text = "Lançamento salvo com sucesso."
        lblMsgAA.ForeColor = Drawing.Color.Green

    End Sub


    Private Sub SaveEAD()
        Dim db As New FrequenciaDocenteDataContext(conn)

        Dim lancamentoEAD As LancamentoEAD = GetEAD(db)




        If (lancamentoEAD.Id Is Nothing) Then
            Me.CurrentEAD.Id = Guid.NewGuid().ToString()
            db.LancamentoEADs.InsertOnSubmit(Me.CurrentEAD)
        Else

        End If

        If (Not txtValorVTEAD.Text.Equals(String.Empty) And String.IsNullOrEmpty(txtIdaVoltaEAD.Text)) Then
            lblMsgEAD.Text = "Entre com o trajeto de ida e volta."
            lblMsgEAD.ForeColor = Drawing.Color.Red
            db.Dispose()
            Me.CurrentEAD = Nothing
            Return
        End If

        If (ExisteLancamento(lancamentoEAD.Id, lancamentoEAD.Matricula, lancamentoEAD.Entrada, lancamentoEAD.Saida, lancamentoEAD.Data)) Then
            lblMsgEAD.Text = "Já existe um lançamento nesse horário para esse dia."
            lblMsgEAD.ForeColor = Drawing.Color.Red
            db.Dispose()
            Me.CurrentEAD = Nothing
            Return
        End If

        db.SubmitChanges()
        Me.CurrentEAD = Nothing
        lblMsgEAD.Text = "Lançamento salvo com sucesso."
        lblMsgEAD.ForeColor = Drawing.Color.Green
    End Sub

    Private Sub SaveVT()
        Dim db As New FrequenciaDocenteDataContext(conn)

        Dim lancamentoVT As LancamentoVT = GetVT(db)




        If (lancamentoVT.Id Is Nothing) Then
            Me.CurrentVT.Id = Guid.NewGuid().ToString()
            db.LancamentoVTs.InsertOnSubmit(Me.CurrentVT)
        Else

        End If
        If (ExisteLancamento(lancamentoVT.Id, lancamentoVT.Matricula, lancamentoVT.Entrada, lancamentoVT.Saida, lancamentoVT.Data)) Then
            lblMsgVT.Text = "Já existe um lançamento nesse horário para esse dia."
            lblMsgVT.ForeColor = Drawing.Color.Red
            Me.CurrentVT = Nothing
            db.Dispose()
            Return
        End If
        db.SubmitChanges()
        Me.CurrentVT = Nothing

        lblMsgVT.Text = "Lançamento salvo com sucesso."
        lblMsgVT.ForeColor = Drawing.Color.Green

    End Sub

    Private Function GetEAD(db As FrequenciaDocenteDataContext) As LancamentoEAD
        If (Me.CurrentEAD Is Nothing) Then
            Me.CurrentEAD = New LancamentoEAD()
        Else
            Me.CurrentEAD = (From a In db.LancamentoEADs Where a.Id.Equals(Me.CurrentEAD.Id)).FirstOrDefault()

        End If
        Me.CurrentEAD.Matricula = Session("c_Matricula")
        Me.CurrentEAD.Area = ddlAreaEAD.SelectedValue
        Me.CurrentEAD.Categoria = "4" 'ddlCategoriaEAD.SelectedValue
        Me.CurrentEAD.Data = DateTime.ParseExact(txtDataEAD.Text, "dd/MM/yyyy", Nothing)
        Me.CurrentEAD.DataHoraRegistro = Date.Now
        Me.CurrentEAD.Entrada = EntradaSaidaEAD.SelectedValueDe
        Me.CurrentEAD.IdParametro = Me.parametroAtivo.Id
        Me.CurrentEAD.IdUnidade = ddlUnidadeEAD.SelectedValue
        Me.CurrentEAD.CentroCusto = GetCentroCusto(ddlAreaEAD.SelectedValue)
        Me.CurrentEAD.Saida = EntradaSaidaEAD.SelectedValueAte
        Me.CurrentEAD.TrajetoIdaVolta = txtIdaVoltaEAD.Text
        Me.CurrentEAD.Validacao = False
        Me.CurrentEAD.ValorVT = Convert.ToDecimal(txtValorVTEAD.Text)


        Return Me.CurrentEAD
    End Function

    Private Function GetVT(db As FrequenciaDocenteDataContext) As LancamentoVT
        If (Me.CurrentVT Is Nothing) Then
            Me.CurrentVT = New LancamentoVT()
        Else
            Me.CurrentVT = (From a In db.LancamentoVTs Where a.Id.Equals(Me.CurrentVT.Id)).FirstOrDefault()

        End If
        Me.CurrentVT.Atividade = ddlAtividade.SelectedValue
        Me.CurrentVT.Matricula = Session("c_Matricula")
        Me.CurrentVT.Area = ddlAreaVT.SelectedValue
        Me.CurrentVT.Categoria = ddlCategoriaVT.SelectedValue
        Me.CurrentVT.Data = DateTime.ParseExact(txtDataVT.Text, "dd/MM/yyyy", Nothing)
        Me.CurrentVT.DataHoraRegistro = Date.Now
        Me.CurrentVT.Entrada = EntradaSaidaVT.SelectedValueDe
        Me.CurrentVT.IdParametro = Me.parametroAtivo.Id
        Me.CurrentVT.IdUnidade = txtUnidadeVT.Text
        Me.CurrentVT.IdUnidade = txtUnidadeVT.Text
        Me.CurrentVT.Justificativas = txtJustificativaVT.Text
        Me.CurrentVT.Saida = EntradaSaidaVT.SelectedValueAte
        Me.CurrentVT.TrajetoIdaVolta = txtIdaVoltaVT.Text
        Me.CurrentVT.Validacao = False
        Me.CurrentVT.ValorVT = Convert.ToDecimal(txtValorVTVT.Text)


        Return Me.CurrentVT
    End Function

    Private Function GetAtividadeAcademica(db As FrequenciaDocenteDataContext) As AtividadeAcademica
        If (Me.CurrentAtividadeAcademica Is Nothing) Then
            Me.CurrentAtividadeAcademica = New AtividadeAcademica()
        Else
            Me.CurrentAtividadeAcademica = (From a In db.AtividadeAcademicas Where a.Id.Equals(Me.CurrentAtividadeAcademica.Id)).FirstOrDefault()

        End If
        Me.CurrentAtividadeAcademica.Matricula = Session("c_Matricula")
        Me.CurrentAtividadeAcademica.Area = ddlArea.SelectedValue
        Me.CurrentAtividadeAcademica.Categoria = ddlCategoria.SelectedValue
        Me.CurrentAtividadeAcademica.Data = DateTime.ParseExact(txtData.Text, "dd/MM/yyyy", Nothing)
        Me.CurrentAtividadeAcademica.DataHoraRegistro = Date.Now
        Me.CurrentAtividadeAcademica.Entrada = EntradaSaidaAA.SelectedValueDe
        Me.CurrentAtividadeAcademica.CentroCusto = GetCentroCusto(ddlArea.SelectedValue)
        Me.CurrentAtividadeAcademica.IdParametro = Me.parametroAtivo.Id
        Me.CurrentAtividadeAcademica.IdUnidade = ddlUnidadeAA.SelectedValue
        Me.CurrentAtividadeAcademica.Justificativas = txtJustificativa.Text
        Me.CurrentAtividadeAcademica.Saida = EntradaSaidaAA.SelectedValueAte
        Me.CurrentAtividadeAcademica.TrajetoIdaVolta = txtIdaVolta.Text
        Me.CurrentAtividadeAcademica.Validacao = False
        Me.CurrentAtividadeAcademica.ValorVT = Convert.ToDecimal(txtValorVT.Text)


        Return Me.CurrentAtividadeAcademica
    End Function

    Private Sub LoadGridAtividadesAcademicas()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.listaAtividades = (From a In db.AtividadeAcademicas _
                             Where a.Validacao = False _
                             And a.Matricula.Equals(Session("c_Matricula").ToString()) _
                             And Not a.Validacao _
                             Select a _
                             Order By a.Data Descending).ToList()

        grdAtividadesAcademicas.DataSource = Me.listaAtividades
        grdAtividadesAcademicas.DataBind()

    End Sub

    Private Sub LoadGridLancamentoVT()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.listaVT = (From a In db.LancamentoVTs _
                             Where a.Validacao = False _
                             And a.Matricula.Equals(Session("c_Matricula")) _
                             And Not a.Validacao _
                             Select a _
                             Order By a.Data Descending).ToList()

        grdLancamentoVT.DataSource = Me.listaVT
        grdLancamentoVT.DataBind()

    End Sub

    Private Sub LoadGridEAD()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.listaEad = (From a In db.LancamentoEADs _
                             Where a.Validacao = False _
                             And a.Matricula.Equals(Session("c_Matricula")) _
                             And Not a.Validacao _
                             Select a _
                             Order By a.Data Descending).ToList()

        grdEAD.DataSource = Me.listaEad
        grdEAD.DataBind()

    End Sub

    Private Sub LimparCampos()
        ddlArea.Limpar()
        ddlCategoria.SelectedIndex = 0
        txtData.Text = ""
        'txtEntrada.Text = ""
        'ddlUnidadeAA.
        txtJustificativa.Text = ""
        ' txtSaida.Text = ""
        txtIdaVolta.Text = ""
        txtValorVT.Text = ""
    End Sub

    Private Sub LimparCamposCoord()
        ddlAreaCoord.Limpar()
        ddlCategoriaCoord.SelectedIndex = 0
        txtDataCoord.Text = ""
        ' txtEntradaCoord.Text = ""
        'txtUnidadeCoord.Text = ""
        'txtJustificativaCoord.Text = ""
        ' txtSaidaCoord.Text = ""
        txtIdaVoltaCoord.Text = ""
        txtValorVTCoord.Text = ""
    End Sub

    Private Sub LimparCamposEAD()
        ddlAreaEAD.Limpar()
        'ddlCategoriaEAD.SelectedIndex = 0
        txtDataEAD.Text = ""
        'txtEntradaEAD.Text = ""
        ' txtUnidadeEAD.Text = ""

        'txtSaidaEAD.Text = ""
        txtIdaVoltaEAD.Text = ""
        txtValorVTEAD.Text = ""
    End Sub

    Private Sub LimparCamposVT()
        ddlAreaVT.SelectedIndex = 0
        ddlCategoriaVT.SelectedIndex = 0
        txtDataVT.Text = ""
        'txtEntradaVT.Text = ""
        txtUnidadeVT.Text = ""
        txtJustificativaVT.Text = ""
        'txtSaidaVT.Text = ""
        txtIdaVoltaVT.Text = ""
        txtValorVTVT.Text = ""
    End Sub


    Protected Sub grdAtividadesAcademicas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdAtividadesAcademicas.SelectedIndexChanged
        LoadAtividadeAcademica()
        LoadCampos()
    End Sub

    Private Sub LoadAtividadeAcademica()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.CurrentAtividadeAcademica = (From a In db.AtividadeAcademicas _
                                       Where a.Id.Equals(grdAtividadesAcademicas.SelectedValue)).FirstOrDefault()

    End Sub

    Private Sub LoadEAD()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.CurrentEAD = (From a In db.LancamentoEADs _
                                       Where a.Id.Equals(grdEAD.SelectedValue)).FirstOrDefault()

    End Sub

    Private Sub LoadVT()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.CurrentVT = (From a In db.LancamentoVTs _
                                       Where a.Id.Equals(grdVT.SelectedValue)).FirstOrDefault()

    End Sub

    Private Sub LoadCoordenacao()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.CurrentCoordenacao = (From a In db.Coordenacaos _
                                       Where a.Id.Equals(grdCoordenacao.SelectedValue)).FirstOrDefault()

    End Sub

    Private Sub LoadCampos()
        ddlArea.SelectedValue = Me.CurrentAtividadeAcademica.Area
        ddlCategoria.SelectedValue = Me.CurrentAtividadeAcademica.Categoria
        txtData.Text = Me.CurrentAtividadeAcademica.Data.ToString("dd/MM/yyyy")
        EntradaSaidaAA.SelectedValueDe = Me.CurrentAtividadeAcademica.Entrada
        EntradaSaidaAA.SelectedValueAte = Me.CurrentAtividadeAcademica.Saida
        ddlUnidadeAA.SelectedValue = Me.CurrentAtividadeAcademica.IdUnidade
        txtJustificativa.Text = Me.CurrentAtividadeAcademica.Justificativas

        txtIdaVolta.Text = Me.CurrentAtividadeAcademica.TrajetoIdaVolta
        txtValorVT.Text = Me.CurrentAtividadeAcademica.ValorVT

    End Sub

    Private Sub LoadCamposVT()
        ddlAreaVT.SelectedValue = Me.CurrentVT.Area
        ddlCategoriaVT.SelectedValue = Me.CurrentVT.Categoria
        txtDataVT.Text = Me.CurrentVT.Data.ToString("dd/MM/yyyy")
        EntradaSaidaVT.SelectedValueDe = Me.CurrentVT.Entrada
        EntradaSaidaVT.SelectedValueAte = Me.CurrentVT.Saida
        txtUnidadeVT.Text = Me.CurrentVT.IdUnidade
        txtJustificativaVT.Text = Me.CurrentVT.Justificativas

        txtIdaVoltaVT.Text = Me.CurrentVT.TrajetoIdaVolta
        txtValorVTVT.Text = Me.CurrentVT.ValorVT
        ddlAtividade.SelectedValue = Me.CurrentVT.Atividade
    End Sub


    Private Sub LoadCamposEAD()
        ddlAreaEAD.SelectedValue = Me.CurrentEAD.Area
        'ddlCategoriaEAD.SelectedValue = Me.CurrentEAD.Categoria
        txtDataEAD.Text = Me.CurrentEAD.Data.Value.ToString("dd/MM/yyyy")
        EntradaSaidaEAD.SelectedValueDe = Me.CurrentEAD.Entrada
        EntradaSaidaEAD.SelectedValueAte = Me.CurrentEAD.Saida
        ddlUnidadeEAD.SelectedValue = Me.CurrentEAD.IdUnidade

        txtIdaVoltaEAD.Text = Me.CurrentEAD.TrajetoIdaVolta
        txtValorVTEAD.Text = Me.CurrentEAD.ValorVT

    End Sub

    Private Sub LoadCamposCoord()
        ddlAreaCoord.SelectedValue = Me.CurrentCoordenacao.Area
        ddlCategoriaCoord.SelectedValue = Me.CurrentCoordenacao.Categoria
        txtDataCoord.Text = Me.CurrentCoordenacao.Data.ToString("dd/MM/yyyy")
        EntradaSaidaCoord.SelectedValueDe = Me.CurrentCoordenacao.Entrada
        EntradaSaidaCoord.SelectedValueAte = Me.CurrentCoordenacao.Saida
        ddlUnidadeCoord.SelectedValue = Me.CurrentCoordenacao.IdUnidade
        '  txtJustificativaCoord.Text = Me.CurrentCoordenacao.Justificativas
        txtIdaVoltaCoord.Text = Me.CurrentCoordenacao.TrajetoIdaVolta
        txtValorVTCoord.Text = Me.CurrentCoordenacao.ValorVT

    End Sub

    Protected Sub btnSalvarCoord_Click(sender As Object, e As EventArgs) Handles btnSalvarCoord.Click
        SaveCoordenacao()
        LoadGridCoordenacao()
        LimparCamposCoord()
        grdCoordenacao.SelectedIndex = -1
        LoadHoras()
    End Sub

    Private Sub LoadGridCoordenacao()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.listaCoordenacao = (From a In db.Coordenacaos _
                             Where a.Validacao = False _
                              And a.Matricula.Equals(Session("c_Matricula").ToString()) _
                              And Not a.Validacao _
                             Select a _
                             Order By a.Data Descending).ToList()

        grdCoordenacao.DataSource = Me.listaCoordenacao
        grdCoordenacao.DataBind()

    End Sub

    Private Sub SaveCoordenacao()
        Dim db As New FrequenciaDocenteDataContext(conn)

        Dim coordenacao As Coordenacao = GetCoordenacao(db)



        If (coordenacao.Id Is Nothing) Then


            Me.CurrentCoordenacao.Id = Guid.NewGuid().ToString()
            db.Coordenacaos.InsertOnSubmit(Me.CurrentCoordenacao)
        Else

        End If

        If (Not txtValorVTCoord.Text.Equals(String.Empty) And String.IsNullOrEmpty(txtIdaVoltaCoord.Text)) Then
            lblMsgCoord.Text = "Entre com o trajeto de ida e volta."
            lblMsgCoord.ForeColor = Drawing.Color.Red
            db.Dispose()
            Me.CurrentCoordenacao = Nothing
            Return
        End If

        If (ExisteLancamento(coordenacao.Id, coordenacao.Matricula, coordenacao.Entrada, coordenacao.Saida, coordenacao.Data)) Then
            lblMsgCoord.Text = "Já existe um lançamento nesse horário para esse dia."
            lblMsgCoord.ForeColor = Drawing.Color.Red
            db.Dispose()
            Me.CurrentCoordenacao = Nothing
            Return
        End If

        db.SubmitChanges()
        Me.CurrentCoordenacao = Nothing

        lblMsgCoord.Text = "Lançamento salvo com sucesso."
        lblMsgCoord.ForeColor = Drawing.Color.Green
    End Sub

    Private Function GetCoordenacao(db As FrequenciaDocenteDataContext) As Coordenacao
        If (Me.CurrentCoordenacao Is Nothing) Then
            Me.CurrentCoordenacao = New Coordenacao()
        Else
            Me.CurrentCoordenacao = (From a In db.Coordenacaos Where a.Id.Equals(Me.CurrentCoordenacao.Id)).FirstOrDefault()

        End If


        Me.CurrentCoordenacao.Matricula = Session("c_Matricula")
        Me.CurrentCoordenacao.Area = ddlAreaCoord.SelectedValue
        Me.CurrentCoordenacao.Categoria = ddlCategoriaCoord.SelectedValue
        Me.CurrentCoordenacao.Data = DateTime.ParseExact(txtDataCoord.Text, "dd/MM/yyyy", Nothing)
        Me.CurrentCoordenacao.DataHoraRegistro = Date.Now
        Me.CurrentCoordenacao.Entrada = EntradaSaidaCoord.SelectedValueDe
        Me.CurrentCoordenacao.IdParametro = Me.parametroAtivo.Id
        Me.CurrentCoordenacao.IdUnidade = ddlUnidadeCoord.SelectedValue
        Me.CurrentCoordenacao.CentroCusto = GetCentroCusto(ddlAreaCoord.SelectedValue)
        '  Me.CurrentCoordenacao.Justificativas = txtJustificativaCoord.Text
        Me.CurrentCoordenacao.Saida = EntradaSaidaCoord.SelectedValueAte
        Me.CurrentCoordenacao.TrajetoIdaVolta = txtIdaVoltaCoord.Text
        Me.CurrentCoordenacao.Validacao = False
        Me.CurrentCoordenacao.ValorVT = Convert.ToDecimal(txtValorVTCoord.Text)


        Return Me.CurrentCoordenacao
    End Function

    Protected Sub grdCoordenacao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdCoordenacao.SelectedIndexChanged
        LoadCoordenacao()
        LoadCamposCoord()
    End Sub

    Protected Sub Menu1_MenuItemClick(sender As Object, e As MenuEventArgs) Handles Menu1.MenuItemClick
        mvLancamento.ActiveViewIndex = Menu1.SelectedValue
    End Sub

    Protected Sub btnSalvarEAD_Click(sender As Object, e As EventArgs) Handles btnSalvarEAD.Click
        SaveEAD()
        LoadGridEAD()
        LimparCamposEAD()
        grdEAD.SelectedIndex = -1
        LoadHoras()
    End Sub

    Protected Sub grdEAD_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdEAD.SelectedIndexChanged
        LoadEAD()
        LoadCamposEAD()
    End Sub

    Protected Sub btnSalvarVT_Click(sender As Object, e As EventArgs) Handles btnSalvarVT.Click
        SaveVT()
        LoadGridLancamentoVT()
        LimparCamposVT()
        grdLancamentoVT.SelectedIndex = -1
    End Sub



    Protected Sub grdLancamentoVT_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdLancamentoVT.SelectedIndexChanged
        LoadVT()
        LoadCamposVT()
    End Sub

    Private Function GetCentroCusto(p1 As String) As String
        Dim db As New FrequenciaDocenteDataContext(conn)

        Dim area = (From cc In db.AreaDocentes _
                 Where cc.Id.Equals(p1) _
                 Select cc).FirstOrDefault()

        Return area.IdCentroCustoDefault
    End Function

End Class
