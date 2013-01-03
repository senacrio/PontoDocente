Imports Senac.ControleRHDocente
Imports System.Linq
Imports System.Collections.Generic


Partial Class FrequenciaDocente_LancarApontamento
    Inherits System.Web.UI.Page
    ' Dim conn As String = "Data Source=banco01homologa;Initial Catalog=Senac;User ID=usrSenac;Password=TPMBSASKIWY"
    Dim conn As String = "Data Source=localhost;Initial Catalog=Senac;User ID=sa;Password=senha"
    Dim btnSalvarI As Button
    Dim parametroAtivo As Parametro

    Dim listaAtividades As New List(Of AtividadeAcademica)
    Private _listaCoordenacao As List(Of Coordenacao)
    Private _currentCoordenacao As Coordenacao


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


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Me.parametroAtivo = GetParametroAtivo()

        If (Me.parametroAtivo Is Nothing) Then
            grdVT.Enabled = False
        Else
            '    lblDataVT.Text = Me.parametroAtivo.
            If Not (Page.IsPostBack) Then
                LoadGridVT()
                LoadGridAtividadesAcademicas()
                LoadGridCoordenacao()
            End If

        End If

        rvValorVT.ErrorMessage = "O valor do VT deve ser maior ou igual a: R$ " + Me.parametroAtivo.VL_CT_VT
        rvValorVT.MaximumValue = Me.parametroAtivo.VL_CT_VT

        rvValorVTCoord.ErrorMessage = "O valor do VT deve ser maior ou igual a: R$ " + Me.parametroAtivo.VL_CT_VT
        rvValorVTCoord.MaximumValue = Me.parametroAtivo.VL_CT_VT

        Dim dataInicioAtv = DateTime.ParseExact(Me.parametroAtivo.PAI_VT_DE, "yy-MM-dd", Nothing)
        Dim dataFinalAtv = DateTime.ParseExact(Me.parametroAtivo.PAI_VT_ATE, "yy-MM-dd", Nothing)

        rvData.ErrorMessage = "A data deve estar entre: " + dataInicioAtv.ToString("dd/MM/yyyy") + " e " + dataFinalAtv.ToString("dd/MM/yyyy")
        rvData.MinimumValue = dataInicioAtv.ToString("dd-MM-yy")
        rvData.MaximumValue = dataFinalAtv.ToString("dd-MM-yy")

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

        Dim listaVT = From r In db.AgendaExecutadaVTs _
                      Where r.Matricula.Equals("00014134") _
                      And r.IdParametro = Me.parametroAtivo.Id _
                      Select r


        grdVT.DataSource = listaVT
        grdVT.DataBind()


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

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Try
            SaveAtividadeAcademica()
            LoadGridAtividadesAcademicas()
            LimparCampos()
            grdAtividadesAcademicas.SelectedIndex = -1
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

        db.SubmitChanges()
        Me.CurrentAtividadeAcademica = Nothing

    End Sub

    Private Function GetAtividadeAcademica(db As FrequenciaDocenteDataContext) As AtividadeAcademica
        If (Me.CurrentAtividadeAcademica Is Nothing) Then
            Me.CurrentAtividadeAcademica = New AtividadeAcademica()
        Else
            Me.CurrentAtividadeAcademica = (From a In db.AtividadeAcademicas Where a.Id.Equals(Me.CurrentAtividadeAcademica.Id)).FirstOrDefault()

        End If



        Me.CurrentAtividadeAcademica.Area = ddlArea.SelectedValue
        Me.CurrentAtividadeAcademica.Categoria = ddlCategoria.SelectedValue
        Me.CurrentAtividadeAcademica.Data = DateTime.ParseExact(txtData.Text, "dd/MM/yyyy", Nothing)
        Me.CurrentAtividadeAcademica.DataHoraRegistro = Date.Now
        Me.CurrentAtividadeAcademica.Entrada = txtEntrada.Text
        Me.CurrentAtividadeAcademica.IdParametro = Me.parametroAtivo.Id
        Me.CurrentAtividadeAcademica.IdUnidade = txtUnidade.Text
        Me.CurrentAtividadeAcademica.Justificativas = txtJustificativa.Text
        Me.CurrentAtividadeAcademica.Saida = txtSaida.Text
        Me.CurrentAtividadeAcademica.TrajetoIdaVolta = txtIdaVolta.Text
        Me.CurrentAtividadeAcademica.Validacao = False
        Me.CurrentAtividadeAcademica.ValorVT = Convert.ToDecimal(txtValorVT.Text)


        Return Me.CurrentAtividadeAcademica
    End Function

    Private Sub LoadGridAtividadesAcademicas()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.listaAtividades = (From a In db.AtividadeAcademicas _
                             Where a.Validacao = False _
                             Select a _
                             Order By a.Data Descending).ToList()

        grdAtividadesAcademicas.DataSource = Me.listaAtividades
        grdAtividadesAcademicas.DataBind()

    End Sub

    Private Sub LimparCampos()
        ddlArea.SelectedIndex = 0
        ddlCategoria.SelectedIndex = 0
        txtData.Text = ""
        txtEntrada.Text = ""
        txtUnidade.Text = ""
        txtJustificativa.Text = ""
        txtSaida.Text = ""
        txtIdaVolta.Text = ""
        txtValorVT.Text = ""
    End Sub

    Private Sub LimparCamposCoord()
        ddlAreaCoord.SelectedIndex = 0
        ddlCategoriaCoord.SelectedIndex = 0
        txtDataCoord.Text = ""
        txtEntradaCoord.Text = ""
        txtUnidadeCoord.Text = ""
        txtJustificativaCoord.Text = ""
        txtSaidaCoord.Text = ""
        txtIdaVoltaCoord.Text = ""
        txtValorVTCoord.Text = ""
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

    Private Sub LoadCoordenacao()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.CurrentCoordenacao = (From a In db.Coordenacaos _
                                       Where a.Id.Equals(grdCoordenacao.SelectedValue)).FirstOrDefault()

    End Sub

    Private Sub LoadCampos()
        ddlArea.SelectedValue = Me.CurrentAtividadeAcademica.Area
        ddlCategoria.SelectedValue = Me.CurrentAtividadeAcademica.Categoria
        txtData.Text = Me.CurrentAtividadeAcademica.Data.ToString("dd/MM/yyyy")
        txtEntrada.Text = Me.CurrentAtividadeAcademica.Entrada
        txtUnidade.Text = Me.CurrentAtividadeAcademica.IdUnidade
        txtJustificativa.Text = Me.CurrentAtividadeAcademica.Justificativas
        txtSaida.Text = Me.CurrentAtividadeAcademica.Saida
        txtIdaVolta.Text = Me.CurrentAtividadeAcademica.TrajetoIdaVolta
        txtValorVT.Text = Me.CurrentAtividadeAcademica.ValorVT

    End Sub

    Private Sub LoadCamposCoord()
        ddlAreaCoord.SelectedValue = Me.CurrentCoordenacao.Area
        ddlCategoriaCoord.SelectedValue = Me.CurrentCoordenacao.Categoria
        txtDataCoord.Text = Me.CurrentCoordenacao.Data.ToString("dd/MM/yyyy")
        txtEntradaCoord.Text = Me.CurrentCoordenacao.Entrada
        txtUnidadeCoord.Text = Me.CurrentCoordenacao.IdUnidade
        txtJustificativaCoord.Text = Me.CurrentCoordenacao.Justificativas
        txtSaidaCoord.Text = Me.CurrentCoordenacao.Saida
        txtIdaVoltaCoord.Text = Me.CurrentCoordenacao.TrajetoIdaVolta
        txtValorVTCoord.Text = Me.CurrentCoordenacao.ValorVT

    End Sub

    Protected Sub btnSalvarCoord_Click(sender As Object, e As EventArgs) Handles btnSalvarCoord.Click
        SaveCoordenacao()
        LoadGridCoordenacao()
        LimparCamposCoord()
        grdCoordenacao.SelectedIndex = -1
    End Sub

    Private Sub LoadGridCoordenacao()
        Dim db = New FrequenciaDocenteDataContext(conn)

        Me.listaCoordenacao = (From a In db.Coordenacaos _
                             Where a.Validacao = False _
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

        db.SubmitChanges()
        Me.CurrentCoordenacao = Nothing
    End Sub

    Private Function GetCoordenacao(db As FrequenciaDocenteDataContext) As Coordenacao
        If (Me.CurrentCoordenacao Is Nothing) Then
            Me.CurrentCoordenacao = New Coordenacao()
        Else
            Me.CurrentCoordenacao = (From a In db.Coordenacaos Where a.Id.Equals(Me.CurrentCoordenacao.Id)).FirstOrDefault()

        End If



        Me.CurrentCoordenacao.Area = ddlAreaCoord.SelectedValue
        Me.CurrentCoordenacao.Categoria = ddlCategoriaCoord.SelectedValue
        Me.CurrentCoordenacao.Data = DateTime.ParseExact(txtDataCoord.Text, "dd/MM/yyyy", Nothing)
        Me.CurrentCoordenacao.DataHoraRegistro = Date.Now
        Me.CurrentCoordenacao.Entrada = txtEntradaCoord.Text
        Me.CurrentCoordenacao.IdParametro = Me.parametroAtivo.Id
        Me.CurrentCoordenacao.IdUnidade = txtUnidadeCoord.Text
        Me.CurrentCoordenacao.Justificativas = txtJustificativaCoord.Text
        Me.CurrentCoordenacao.Saida = txtSaidaCoord.Text
        Me.CurrentCoordenacao.TrajetoIdaVolta = txtIdaVoltaCoord.Text
        Me.CurrentCoordenacao.Validacao = False
        Me.CurrentCoordenacao.ValorVT = Convert.ToDecimal(txtValorVTCoord.Text)


        Return Me.CurrentCoordenacao
    End Function

    Protected Sub grdCoordenacao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grdCoordenacao.SelectedIndexChanged
        LoadCoordenacao()
        LoadCamposCoord()
    End Sub
End Class
