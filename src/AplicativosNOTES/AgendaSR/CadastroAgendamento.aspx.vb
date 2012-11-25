Imports ClassesSR
Imports System.Collections.Generic





Partial Class AplicativosNOTES_AgendaSR_CadastroAgendamento
    Inherits System.Web.UI.Page

#Region " OBJETOS "
    Dim oTipo As New srTipo()
    Dim oAgendamentoArea As New srAgendamentoArea()
    Dim oAgendamentoRecurso As New srAgendamentoRecurso()
    Dim oAgendamentoParticipante As New srAgendamentoParticipante()
    Dim oAgendamento As srAgendamento = New srAgendamento()
    Dim oArea As viewSTG_RHUnidadeLotacao = New viewSTG_RHUnidadeLotacao()
    Dim oParticipante As New SGT_RHFuncionarioAtivo()
    Dim oLocal As New srLocal()
    Dim oHoraInicio As New BLLHorario()
    Dim oHoraFinal As New BLLHorario()
    Dim oRecurso As New srRecurso()
    Dim oStatus As New srStatus()
    Dim sIn As String = ""
    Dim popula As Boolean
    Dim oPermissao As New srPermissao()
    Dim oLog As New srLog()

#End Region
    

#Region " FUNÇÕES "

    Public Sub Voltar()
        'Response.Redirect("CadastroAgendamento.aspx")
        mvAgendamento.ActiveViewIndex = 0
    End Sub
    Private Sub PopulaLocal()
        ddlLocal.DataSource = oLocal.ListarTodos()

        ddlLocal.Items.Add(New ListItem("", ""))
        ddlLocal.Items.FindByValue("")

        ddlLocal.DataBind()

    End Sub

    Private Sub Limpar()
        txtData.Text = ""
        txtObservacao.Text = ""
        txtTelefone.Text = ""
        lblmsg.Text = ""
        ddlHoraFinal.SelectedIndex = 0
        ddlHoraInicial.SelectedIndex = 0
        ddlLocal.SelectedIndex = 0
        sIn = ""
        chkConvite.Checked = False

        btnCancelar.Visible = True
        Label12.Visible = True
        pnlAgenda.Enabled = True

        For Each item As ListItem In chkArea.Items
            item.Selected = False
        Next

        For Each item As ListItem In chkRecurso.Items
            item.Selected = False
        Next

        For Each item As ListItem In chkParticipante.Items
            item.Selected = False
        Next

        PopulaParticipante()

    End Sub

    Private Sub setAgendamento()
        oAgendamento.Cd_Agendamento = Session("Cd_Agendamento")
        oAgendamento.Cd_Usuario = Session("c_Matricula")

        oAgendamento.Dt_Utilizacao = Convert.ToDateTime(txtData.Text)

        oAgendamento.Hr_Inicio = ddlHoraInicial.SelectedItem.Text
        oAgendamento.Hr_Final = ddlHoraFinal.SelectedItem.Text

        oAgendamento.Cd_Tipo_FK = ddlTipo.SelectedValue
        oAgendamento.Cd_Local_FK = ddlLocal.SelectedValue
        oAgendamento.Tx_Telefone = txtTelefone.Text
        oAgendamento.Tx_Observacao = txtObservacao.Text 
        oAgendamento.Cd_Status_FK = 1
        oAgendamento.Dt_Registro = Date.Now
        oAgendamento.Bt_Convite = chkConvite.Checked
    End Sub


    Private Sub GetAgendamento()

        ddlHoraFinal.DataSource = oHoraFinal.ListarTodos()
        ddlHoraFinal.DataBind()

        ddlHoraInicial.DataSource = oHoraInicio.ListarTodos()
        ddlHoraInicial.DataBind()

        oAgendamento.Matricula = Integer.Parse(Session("C_Matricula"))

        oAgendamento.Cd_Agendamento = Integer.Parse(Session("Cd_Agendamento"))
        oAgendamento.Listar()

        ddlTipo.SelectedValue = oAgendamento.Cd_Tipo_FK
        ddlLocal.SelectedValue = oAgendamento.Cd_Local_FK
        txtTelefone.Text = oAgendamento.Tx_Telefone
        txtObservacao.Text = oAgendamento.Tx_Observacao
        txtData.Text = oAgendamento.Dt_Utilizacao
        ddlHoraInicial.SelectedValue = oAgendamento.Hr_Inicio
        ddlHoraFinal.SelectedValue = oAgendamento.Hr_Final

        'MARCA AS AREAS SELECIONADAS
        oAgendamentoArea.Cd_Agendamento_FK = Integer.Parse(Session("Cd_Agendamento"))
        Dim area As List(Of Integer) = oAgendamentoArea.ListarAgendamentoArea()

        For x As Integer = 0 To area.Count - 1
            For i As Integer = 0 To chkArea.Items.Count - 1
                If chkArea.Items(i).Value = area.Item(x) Then
                    chkArea.Items(i).Selected = True
                End If
            Next
        Next

        PopulaParticipante()


        'MARCA OS PARTICIPANTES SELECIONADOS
        oAgendamentoParticipante.Cd_Agendamento_FK = Integer.Parse(Session("Cd_Agendamento"))
        Dim participante As List(Of Integer) = oAgendamentoParticipante.ListarAgendamentoParticipante()

        For x As Integer = 0 To participante.Count - 1
            For i As Integer = 0 To chkParticipante.Items.Count - 1
                If chkParticipante.Items(i).Value = participante.Item(x) Then
                    chkParticipante.Items(i).Selected = True
                End If
            Next
        Next

        'MARCA OS RECURSOS SELECIONADOS
        oAgendamentoRecurso.Cd_Agendamento_FK = Integer.Parse(Session("Cd_Agendamento"))
        Dim recurso As List(Of Integer) = oAgendamentoRecurso.ListarAgendamentoRecurso()

        For x As Integer = 0 To recurso.Count - 1
            For i As Integer = 0 To chkRecurso.Items.Count - 1
                If chkRecurso.Items(i).Value = recurso.Item(x) Then
                    chkRecurso.Items(i).Selected = True
                End If
            Next
        Next

        If oAgendamento.HabilitaEditar Then
            btnCancelar.Visible = True
            Label12.Visible = True
            pnlAgenda.Enabled = True

        Else
            btnCancelar.Enabled = False
            Label12.Visible = False
            pnlAgenda.Enabled = False
        End If

    End Sub

    Private Sub PopulaTipo()
        ddlTipo.DataSource = oTipo.ListarTodos()
        ddlTipo.DataBind()
    End Sub

    Private Sub PopulaArea()
        chkArea.DataSource = oArea.ListarTodos()
        chkArea.DataBind()
    End Sub

    Private Sub PopulaHorario()


        ddlHoraInicial.DataSource = oHoraInicio.ListarTodos()
        ddlHoraInicial.DataBind()


        ddlHoraFinal.DataSource = oHoraFinal.ListarTodos()
        ddlHoraFinal.DataBind()



    End Sub

    Private Sub PopulaAgenda()
        ' lstAgenda.DataSource = oAgendamento.ListarDatas()
        'lstAgenda.DataBind()
        'GridView1.DataSource = oAgendamento.ListarDatas()
        'GridView1.DataBind()

    End Sub

    Private Sub PopulaParticipante()

        For i As Integer = 0 To chkArea.Items.Count - 1
            If chkArea.Items(i).Selected Then
                If sIn = "" Then
                    sIn = chkArea.Items(i).Value
                Else
                    sIn += "," + chkArea.Items(i).Value
                End If
            End If
        Next

        oParticipante.sIn = sIn
        chkParticipante.DataSource = oParticipante.ListarFuncionario()
        chkParticipante.DataBind()

    End Sub

    Private Sub PopulaRecurso()
        chkRecurso.DataSource = oRecurso.ListarTodos()
        chkRecurso.DataBind()
    End Sub

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        oPermissao.Cd_Usuario_FK = Integer.Parse(Session("c_matricula"))

        If oPermissao.PermissaoAgendar() Then
            btnIncluir.Visible = True
            lblIncluiragd.Visible = True
        Else
            lblIncluiragd.Visible = False
            btnIncluir.Visible = False
        End If

        If Not Page.IsPostBack Then

            PopulaTipo()
            PopulaArea()
            PopulaParticipante()
            PopulaLocal()
            PopulaRecurso()
            PopulaAgenda()
            PopulaHorario()

            If Request.QueryString.Count > 0 Then
                If Request.QueryString("id") <> 0 Then
                    Session("Cd_Agendamento") = Request.QueryString("id")
                    GetAgendamento()
                    mvAgendamento.ActiveViewIndex = 1
                ElseIf Request.QueryString("id") = 0 Then
                    mvAgendamento.ActiveViewIndex = 1
                    Session("Cd_Agendamento") = 0
                    btnCancelar.Visible = False
                    Label12.Visible = False
                End If
            Else
                mvAgendamento.ActiveViewIndex = 0
            End If
        End If
    End Sub
    Protected Sub chkArea_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkArea.SelectedIndexChanged
        PopulaParticipante()
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvar.Click
        Session("_modo") = "Salvando"
        Try

            setAgendamento()

            If oAgendamento.Cd_Agendamento <> 0 Then
                oAgendamentoArea.Cd_Agendamento_FK = oAgendamento.Cd_Agendamento
                oAgendamentoParticipante.Cd_Agendamento_FK = oAgendamento.Cd_Agendamento
                oAgendamentoRecurso.Cd_Agendamento_FK = oAgendamento.Cd_Agendamento

                oAgendamentoArea.ExcluirTodos()
                oAgendamentoParticipante.ExcluirTodos()
                oAgendamentoRecurso.ExcluirTodos()
            End If

            oAgendamento.Matricula = Session("c_Matricula")
            oAgendamento.Salvar()

            Dim uID As Integer = oAgendamento.UltimoID()

            For i As Integer = 0 To chkArea.Items.Count - 1
                If chkArea.Items(i).Selected Then
                    Dim oAgendamentoArea As New srAgendamentoArea()
                    oAgendamentoArea.Cd_Agendamento_FK = uID
                    oAgendamentoArea.Cd_Area_FK = chkArea.Items(i).Value
                    oAgendamentoArea.Salvar()
                End If
            Next

            For i As Integer = 0 To chkParticipante.Items.Count - 1
                If chkParticipante.Items(i).Selected Then
                    Dim oAgendamentoPartipante As New srAgendamentoParticipante()
                    oAgendamentoPartipante.Cd_Agendamento_FK = uID
                    oAgendamentoPartipante.Cd_Participante_FK = chkParticipante.Items(i).Value
                    oAgendamentoPartipante.Salvar()
                End If
            Next

            For i As Integer = 0 To chkRecurso.Items.Count - 1
                If chkRecurso.Items(i).Selected Then
                    Dim oAgendamentoRecurso As New srAgendamentoRecurso()
                    oAgendamentoRecurso.Cd_Agendamento_FK = uID
                    oAgendamentoRecurso.Cd_Recurso_FK = chkRecurso.Items(i).Value
                    oAgendamentoRecurso.Salvar()
                End If
            Next





            If chkConvite.Checked Then
                Dim obj2 As AppointmentBLL = New AppointmentBLL(Convert.ToDateTime(txtData.Text + " " + ddlHoraInicial.SelectedItem.Text), Convert.ToDateTime(txtData.Text + " " + ddlHoraFinal.SelectedItem.Text), ddlTipo.SelectedItem.Text, txtObservacao.Text, ddlLocal.SelectedItem.Text, Session("c_Nome"), Utilitario.RetornaEmail(Session("c_Matricula")), Session("c_Nome"), Utilitario.RetornaEmail(Session("c_Matricula")))
                Try
                    obj2.EmailAppointment()
                Catch ex As Exception
                    lblEmail.Text += "* Email não foi enviado para: " + Session("c_Nome") + " <br />"
                End Try


                For i As Integer = 0 To chkParticipante.Items.Count - 1
                    If chkParticipante.Items(i).Selected Then
                        Dim obj As AppointmentBLL = New AppointmentBLL(Convert.ToDateTime(txtData.Text + " " + ddlHoraInicial.SelectedItem.Text), Convert.ToDateTime(txtData.Text + " " + ddlHoraFinal.SelectedItem.Text), ddlTipo.SelectedItem.Text, txtObservacao.Text, ddlLocal.SelectedItem.Text, Session("c_Nome"), Utilitario.RetornaEmail(chkParticipante.Items(i).Value), Session("c_Nome"), Utilitario.RetornaEmail(Session("c_Matricula")))
                        
                        Try
                            obj.EmailAppointment()
                        Catch ex As Exception
                            Dim oColaborador As New Colaborador()

                            oColaborador.Matricula = chkParticipante.Items(i).Value
                            oColaborador.Nome = ""
                            oColaborador.Buscar()

                            lblEmail.Text += "* Email não foi enviado para: " + oColaborador.Nome + " <br />"

                        End Try

                    End If
                Next
            End If

            Limpar()

            Voltar()


        Catch ex As Exception
            lblmsg.Text = ex.Message.ToString
        Finally
            
        End Try


    End Sub
    Protected Sub btnIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnIncluir.Click
        Session("Cd_Agendamento") = 0
        'mvAgendamento.ActiveViewIndex = 1
        Response.Redirect("CadastroAgendamento.aspx?id=0")
        Limpar()

    End Sub

    Protected Sub ddlLocal_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlLocal.SelectedIndexChanged


    End Sub

    Protected Sub btnVoltar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnVoltar0.Click

        Voltar()
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnVoltar.Click
        Voltar()


    End Sub

    Protected Sub txtData_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtData.TextChanged

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)


    End Sub

    Public Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("Cd_Agendamento") = CType(sender, ImageButton).AlternateText
        GetAgendamento()
        Response.Redirect("CadastroAgendamento.aspx?id=" + Session("Cd_Agendamento"))

    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs)

    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim btn As ImageButton = e.Row.FindControl("ImageButton1")
            ScriptManager1.RegisterPostBackControl(btn)

        End If
    End Sub

    Protected Sub ddlHoraInicial_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHoraInicial.SelectedIndexChanged
        Session("Hr_Inicio") = ddlHoraInicial.SelectedValue

    End Sub

    Protected Sub ddlHoraFinal_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHoraFinal.SelectedIndexChanged
        Session("Hr_Fim") = ddlHoraFinal.SelectedValue
    End Sub

    Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender

        Dim oAgendamentos As New srAgendamento()

        Dim grid As GridView = New GridView()
        Dim btnSelect As New CommandField()

        btnSelect.ButtonType = ButtonType.Link
        'btnSelect.SelectText = "<a href='#'><img src='../../Icones/clock.png'></img></a>"
        'btnSelect.SelectImageUrl = "~/Icones/clock.png"
        btnSelect.ShowSelectButton = True


        grid.AutoGenerateColumns = False





        AddHandler grid.RowDataBound, AddressOf Grid_RowDatabound




        grid.ID = "grid1"
        Dim hora As BoundField = New BoundField()

        'grid.AutoGenerateSelectButton = True

        grid.ShowHeader = False
        grid.ShowFooter = False

        Dim t As New TemplateField()
        Dim b As New Button()
        Dim a As New Control()

        a.Controls.Add(b)

        't.ItemTemplate = New IMGTemplate

        oAgendamentos.Dt_Utilizacao = e.Day.Date
        oAgendamentos.Matricula = Session("c_Matricula")
        grid.DataSource = oAgendamentos.ListarAgendamentoCalendario()

        hora.DataField = "Hora"


        grid.Columns.Add(btnSelect)
        'grid.Columns.Add(t)
        grid.Columns.Add(hora)

        AddHandler grid.SelectedIndexChanged, AddressOf Grid_SelectedIndex

        grid.SelectedRowStyle.BackColor = Drawing.Color.Azure

        grid.DataBind()


        Dim s() As String = {"Cd_Agendamento", "Nm_Local", "Nm_Tipo", "Nm_Status", "Dt_Utilizacao", "Tx_Observacao"}

        grid.DataKeyNames = s

        grid.Width = 100

        grid.GridLines = GridLines.Horizontal


        grid.Font.Size = 8

        e.Cell.Controls.Add(grid)

    End Sub
    Public Sub Grid_RowDatabound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onMouseOver", "showhint('<strong>Local: </strong> " + DataBinder.Eval(e.Row.DataItem, "Nm_Local") + "<br /><strong>Evento: </strong>" + DataBinder.Eval(e.Row.DataItem, "Nm_Tipo").ToString + "<br /><strong>Status: </strong>" + DataBinder.Eval(e.Row.DataItem, "Nm_Status").ToString + "<br /><strong>Observação: </strong>" + DataBinder.Eval(e.Row.DataItem, "Tx_Observacao").ToString() + " ', this, event, '200px')")

            Dim btnSelect As LinkButton = CType(e.Row.Cells(0).Controls(0), LinkButton)

            Dim img As String = ""

            If DataBinder.Eval(e.Row.DataItem, "Nm_Status") = "Ativo" And DataBinder.Eval(e.Row.DataItem, "Dt_Utilizacao") = Date.Now.Date Then
                img = "clock_add.png"
            ElseIf DataBinder.Eval(e.Row.DataItem, "Nm_Status") = "Ativo" Then
                img = "clock.png"
            Else
                img = "clock_stop.png"
            End If



            btnSelect.Text = "<a href='CadastroAgendamento.aspx?id=" + DataBinder.Eval(e.Row.DataItem, "Cd_Agendamento").ToString + "'><img border='0' src='../../Icones/" + img + "'></img></a>"



        End If

    End Sub
    Protected Sub Grid_SelectedIndex(ByVal sender As Object, ByVal e As System.EventArgs)



    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged

    End Sub

    Protected Sub GridView1_Disposed(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)



    End Sub
    Protected Sub Grid_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)

    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)

    End Sub

    Protected Sub GridView1_RowCreated1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
       
    End Sub

   

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelar.Click
        Dim cAgendamento As New srAgendamento()

        cAgendamento.Cd_Agendamento = Session("Cd_Agendamento")
        cAgendamento.Listar()
        cAgendamento.Matricula = Integer.Parse(Session("c_matricula"))
        cAgendamento.Cancelar()

       

        oAgendamentoParticipante.Cd_Agendamento_FK = Session("Cd_Agendamento")


        If cAgendamento.Bt_Convite Then
            Dim lParticipante As List(Of Integer) = oAgendamentoParticipante.ListarAgendamentoParticipante()
            Try
                Comunicacao.EnviaEmail("agenda@rj.senac.br", Utilitario.RetornaEmail(cAgendamento.Cd_Usuario), "Cancelamento de Reunião", "Reunião cancelada.<br /><br />Data: " + cAgendamento.Dt_Utilizacao.ToString + "<br/>Hora Inicio: " + cAgendamento.Hr_Inicio + "<br />Hora Final: " + cAgendamento.Hr_Final + "<br />Local: " + cAgendamento.srLocal.Nm_Local)
            Catch ex As Exception

            End Try


            For Each i As Integer In lParticipante
                Try
                    Comunicacao.EnviaEmail("agenda@rj.senac.br", Utilitario.RetornaEmail(i), "Cancelamento de Reunião", "Reunião cancelada.<br /><br />Data: " + cAgendamento.Dt_Utilizacao.ToString + "<br/>Hora Inicio: " + cAgendamento.Hr_Inicio + "<br />Hora Final: " + cAgendamento.Hr_Final + "<br />Local: " + cAgendamento.srLocal.Nm_Local)
                Catch ex As Exception

                End Try

                '
            Next
        End If
        Voltar()
    End Sub

    
End Class
