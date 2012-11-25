Imports Dados
Imports CRUD
Imports System.Web.UI.WebControls

Partial Class clickoportunidades_AdmVagas
    Inherits System.Web.UI.Page

    Function verificaHoraExiste(ByVal captador As String, ByVal data As String, ByVal hora As String) As Boolean
        Dim b As Boolean = False
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SENACRJConnectionString").ToString)
        Dim cSql As String = "select * from tblentrevista where captador=@captador and dataClick=@data and dbo.fnHora2Decimal(horaclick)<=(dbo.fnHora2Decimal(@hora)+1800)	and dbo.fnHora2Decimal(horaclick)>=(dbo.fnHora2Decimal(@hora)-1800)"

        Dim cmd As SqlCommand = New SqlCommand(cSql, conn)

        Dim PCaptador As SqlParameter = New SqlParameter()
        PCaptador.ParameterName = "captador"
        PCaptador.Value = captador

        Dim PData As SqlParameter = New SqlParameter()
        PData.ParameterName = "data"
        PData.Value = data

        Dim PHOra As SqlParameter = New SqlParameter()
        PHOra.ParameterName = "hora"
        PHOra.Value = hora

        cmd.Parameters.Add(PCaptador)
        cmd.Parameters.Add(PData)
        cmd.Parameters.Add(PHOra)

        conn.Open()


        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            b = True
        Else
            b = False
        End If

        conn.Dispose()
        cmd.Dispose()


        Return b


    End Function

    Protected Sub botaoAdmVagas_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAdmVagas.Click

        Dim parempresa, parCnpj, parmodalidade, paridentificador, parAtivada As New Parameter
        Dim parvaga, parescolaridade, parmunicipio, pardata, pardata2 As New Parameter

        Sqlvagas.SelectParameters.Clear()
        lblMsg.Text = ""
        Gridcandidato.SelectedIndex = -1

        parvaga.Name = "id_vaga"
        If txtvaga.Text.Length = 0 Then
            parvaga.DefaultValue = "%"
        Else
            parvaga.DefaultValue = txtvaga.Text
        End If
        Sqlvagas.SelectParameters.Add(parvaga)

        parempresa.Name = "nome_fantasia"
        If txtempresa.Text.Length = 0 Then
            parempresa.DefaultValue = "%"
        Else
            parempresa.DefaultValue = txtempresa.Text
        End If
        Sqlvagas.SelectParameters.Add(parempresa)

        parCnpj.Name = "cnpj"
        If txtcnpj.Text.Length = 0 Then
            parCnpj.DefaultValue = "%"
        Else
            parCnpj.DefaultValue = txtcnpj.Text
        End If
        Sqlvagas.SelectParameters.Add(parCnpj)

        parmodalidade.Name = "modalidade"
        If cbomodalidade.Text.Length = 0 Then
            parmodalidade.DefaultValue = "%"
        Else
            parmodalidade.DefaultValue = cbomodalidade.Text
        End If
        Sqlvagas.SelectParameters.Add(parmodalidade)

        parmunicipio.Name = "nome"
        If cbomunicipio.Text.Length = 0 Then
            parmunicipio.DefaultValue = "%"
        Else
            parmunicipio.DefaultValue = cbomunicipio.Text
        End If
        Sqlvagas.SelectParameters.Add(parmunicipio)

        pardata.Name = "dtinicio"

        pardata.DefaultValue = txtdatinicio.Text

        Sqlvagas.SelectParameters.Add(pardata)

        pardata2.Name = "dtfim"

        pardata2.DefaultValue = txtdatfim.Text

        Sqlvagas.SelectParameters.Add(pardata2)

        parAtivada.Name = "ativada"
        If rdAtivada.SelectedValue = 2 Then
            parAtivada.DefaultValue = 2

        End If
        If rdAtivada.SelectedValue = 1 Then
            parAtivada.DefaultValue = 1

        End If
        If rdAtivada.SelectedValue = 0 Then
            parAtivada.DefaultValue = 0
        End If

        Sqlvagas.SelectParameters.Add(parAtivada)

        MultiView1.ActiveViewIndex = 1


    End Sub


    Protected Sub btnativar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)


        Sqlativar.Update()

        Dim oVaga As New Vagas

        oVaga.vagaLog(Session("id_vaga"))

        Session("ativada") = oVaga.vagaLog(Session("id_vaga"))

        SqlLogAlteracao.Insert()

        MultiView1.ActiveViewIndex = 1
        GridVaga.DataBind()


    End Sub

    Protected Sub btnInativar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)



        SqlInativar.Update()


        Dim oVaga As New Vagas

        oVaga.vagaLog(Session("id_vaga"))


        Session("ativada") = oVaga.vagaLog(Session("id_vaga"))

        SqlLogAlteracao.Insert()

        MultiView1.ActiveViewIndex = 1

        GridVaga.DataBind()




    End Sub

    Protected Sub btnAnalisa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        SqlAnalise.Update()


        Dim oVaga As New Vagas

        oVaga.vagaLog(Session("id_vaga"))


        Session("ativada") = oVaga.vagaLog(Session("id_vaga"))


        SqlLogAlteracao.Insert()

        MultiView1.ActiveViewIndex = 1
        GridVaga.DataBind()

    End Sub

    Protected Sub GridVaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridVaga.SelectedIndexChanged
        DetailsView1.Visible = True
        Session("id_vaga") = GridVaga.SelectedValue
        'MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dteNow As Date = Now()


        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        lblaviso.Text = ""

        Dim oVaga As New Vagas

        oVaga.Vaga(Session("id_vaga"))

        Session("id_vaga") = oVaga.Vaga(Session("id_vaga"))

        oVaga.PossuiVaga(Session("id_vaga"))

        Session("id_vagacandidato") = oVaga.PossuiVaga(Session("id_vaga"))

        lblmensagemBotao.Text = ""
    End Sub

    Protected Sub btnvoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnvoltar.Click
        MultiView1.ActiveViewIndex = 0
    End Sub


    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim btn As ImageButton = sender

        Session("id_vaga") = btn.CommandArgument
        'MultiView1.ActiveViewIndex = 2
        Gridcandidato.DataBind()
        btn.Dispose()



    End Sub

    Protected Sub btnViewCandidato_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim btn As ImageButton = sender
        Session("id_candidato") = btn.CommandArgument.ToString
        Response.Redirect("Curriculo.aspx")
        btn.Dispose()

    End Sub

   
    'Protected Sub btnInsereEntrevista_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsereEntrevista.Click
    '    'Session("id_vagacandidato") = Gridcandidato.SelectedValue
    '    Dim data As Date = datdataClick.Text

    '    If verificaHoraExiste(Session("c_Nome"), Format(data, "yyyy-MM-dd").ToString, horhoraClick.Text) Then
    '        lblmensagemBotao.Text = "Já existe uma entrevista marcada para esse horário."
    '    Else
    '        SqlGridEntrevista.Insert()
    '    End If

    '    'MultiView1.ActiveViewIndex = 4
    '    GridEntrevista.DataBind()
    'End Sub

    Protected Sub btnatualizaEntrevista_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnatualizaEntrevista.Click
        If GridEntrevista.SelectedIndex = -1 Then
            lblmensagemBotao.Text = "Selecione um agendamento."
        Else
            Session("_modo") = "Alterar"
            Dim data As Date = datdataClick.Text

            If verificaHoraExiste(Session("c_Nome"), Format(data, "yyyy-MM-dd").ToString, horhoraclick.Text) Then
                lblmensagemBotao.Text = "Já existe uma entrevista marcada para esse horário."
            Else
                SqlGridEntrevista.Insert()
            End If

            'MultiView1.ActiveViewIndex = 4
            GridEntrevista.DataBind()

            'If cboid_statusEntrevista.SelectedValue = "1" Then

            'End If
            SqlEntrevistaForm.Update()
            lblmensagemBotao.Text = "Agendamento salvo."
            'MultiView1.ActiveViewIndex = 4
            GridEntrevista.DataBind()
        End If

    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelar.Click
        Session("_modo") = "Incluir"
        'MultiView1.ActiveViewIndex = 4
        GridEntrevista.SelectedIndex = -1
        cboid_statusEntrevista.SelectedIndex = 0
        GridEntrevista.DataBind()
    End Sub

    Protected Sub btnAgendar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAgendar.Click
        MultiView1.ActiveViewIndex = 3
    End Sub

    Protected Sub cboid_statusEntrevista_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_statusEntrevista.SelectedIndexChanged

    End Sub

    Protected Sub RegsPag_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dteNow As Date = Now()

        'datdataretorno.Text = dteNow

        Session("_modo") = "Incluir"

        If GridEntrevistaEmp0.SelectedIndex < 1 Then
            'PanelEntrevistaEmp0.Visible = False
        Else
            ' PanelEntrevistaEmp0.Visible = True
        End If

        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        lblaviso.Text = ""

        Dim oVaga As New Vagas

        oVaga.Vaga(Session("id_vaga"))

        Session("id_vaga") = oVaga.Vaga(Session("id_vaga"))

        oVaga.PossuiVaga(Session("id_vaga"))

        Session("id_vagacandidato") = oVaga.PossuiVaga(Session("id_vaga"))
    End Sub

    Protected Sub IraPag(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim _IraPag As TextBox = DirectCast(sender, TextBox)
        Dim _NumPag As Integer

        If Integer.TryParse(_IraPag.Text.Trim, _NumPag) AndAlso _NumPag > 0 AndAlso _NumPag <= Me.GridEntrevistaEmp0.PageCount Then
            If Integer.TryParse(_IraPag.Text.Trim, _NumPag) AndAlso _NumPag > 0 AndAlso _NumPag <= Me.GridEntrevistaEmp0.PageCount Then
                Me.GridEntrevistaEmp0.PageIndex = _NumPag - 1
            Else
                Me.GridEntrevistaEmp0.PageIndex = 0
            End If
        End If
    End Sub

    Protected Sub Gridcandidato_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Gridcandidato.SelectedIndexChanged
        Session("id_vagacandidato") = Gridcandidato.SelectedValue
        datdataempresa.Enabled = True
        horhoraempresa.Enabled = True
        cboid_statusEntrevistaEmp.Enabled = True
        btnInserirEntEmp.Enabled = True
        btnAgendar0.Enabled = True
        MultiView1.ActiveViewIndex = 3
        lblMsg.Text = ""
    End Sub

    Protected Sub btnAtualizar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim cboId_ConvStatus As DropDownList = DetailsView1.FindControl("cboId_ConvStatus")
        Session("id_convstatus") = cboId_ConvStatus.SelectedValue
        cboId_ConvStatus.Dispose()

        SqlDetalheVaga.Update()


    End Sub

    Protected Sub GridEntrevista_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevista.SelectedIndexChanged
        Session("_modo") = "Alterar"
        lblCodEntrevista.Text = GridEntrevista.SelectedValue
        'GridEntrevista.DataBind()

    End Sub

    Protected Sub GridEntrevistaGeral_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevistaGeral.SelectedIndexChanged

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Session("_modo") = "Alterar" Then

            'ALTERAR
            CRUD.Popula(ViewEntrevistaClick, SqlEntrevistaForm)


            btnatualizaEntrevista.Visible = True

            If cboid_statusEntrevista.SelectedValue = "1" Then
                btnAgendar.Visible = True
                lblmensagemBotao.Text = "Clique para agendar entrevista na Empresa"
            Else
                btnAgendar.Visible = False
                lblmensagemBotao.Text = "Clique para alterar status da entrevista"
            End If

        ElseIf Session("_modo") = "Incluir" Then

            'INCLUIR
            'GridEntrevista.DataBind()
            CRUD.Limpa(ViewEntrevistaClick)

            'cboid_statusEntrevista.Items(1).Enabled = False

            cboid_statusEntrevista.SelectedValue = "9"

            datdataClick.Enabled = True
            horhoraClick.Enabled = True
            cbocaptador.Enabled = True
            btnAgendar.Visible = False

            'btnatualizaEntrevista.Visible = False
            lblmensagemBotao.Text = "Clique para agendar entrevista"
            datdataClick.Text = ""
            horhoraclick.Text = ""
        ElseIf Session("_modo") = "IncluirEmp" Then

            CRUD.Limpa(View1)
            btnInserirEntEmp.Visible = True
            btnatualizaEntrevistaEmp1.Visible = False
            btnCancelarEmp.Visible = False

        ElseIf Session("_modo") = "AlterarEmp" Then

            CRUD.Popula(View1, sqlEntrevistaEmpForm)
            btnInserirEntEmp.Visible = False
            btnatualizaEntrevistaEmp1.Visible = True
            btnCancelarEmp.Visible = True
        End If

    End Sub

    Protected Sub Sqloperador_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles Sqloperador.Selected

    End Sub




    Protected Sub btnatualizaEntrevistaEmp1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnatualizaEntrevistaEmp1.Click
        sqlEntrevistaEmp.Update()
        GridEntrevistaEmp0.DataBind()
        GridEntrevistaGeral.DataBind()
    End Sub

    Protected Sub GridEntrevistaEmp0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevistaEmp0.SelectedIndexChanged
        Session("_modo") = "AlterarEmp"
    End Sub

    Protected Sub btnInserirEntEmp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInserirEntEmp.Click

        sqlEntrevistaEmp.Insert()
        GridEntrevistaEmp0.DataBind()
        GridEntrevista.DataBind()
        GridEntrevistaGeral.DataBind()

        If cboid_statusEntrevistaEmp.SelectedValue = 9 Then
            MultiView1.ActiveViewIndex = 2

        End If

    End Sub

    Protected Sub btnCancelarEmp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelarEmp.Click
        Session("_modo") = "IncluirEmp"
        horhoraempresa.Text = ""
        GridEntrevistaEmp0.SelectedIndex = -1

    End Sub

    'Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
    '    'Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SENACRJConnectionString").ToString)
    '    'Dim cSql As String = "select dataClick from tblentrevista"
    '    'Dim cmd As SqlCommand = New SqlCommand(cSql, conn)
    '    'conn.Open()
    '    'Dim reader As SqlDataReader = cmd.ExecuteReader()

    '    'If reader.HasRows Then
    '    '    While reader.Read()
    '    '        If reader(0).ToString = e.Day.Date Then
    '    '            e.Cell.BackColor = Drawing.Color.Blue
    '    '        End If
    '    '    End While

    '    'End If

    '    'conn.Close()
    '    'cmd.Dispose()
    '    'reader.Close()


    'End Sub

    
    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        MultiView1.ActiveViewIndex = Menu1.SelectedValue
    End Sub

    Protected Sub btnAgendar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAgendar0.Click
        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub View1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles View1.Load
        If Gridcandidato.SelectedIndex = -1 Then
            datdataempresa.Enabled = False
            horhoraempresa.Enabled = False
            cboid_statusEntrevistaEmp.Enabled = False
            btnInserirEntEmp.Enabled = False
            btnAgendar0.Enabled = False
            lblMsg.Text = "Selecione um candidato."
        Else
            btnAgendar0.Enabled = True
            datdataempresa.Enabled = True
            horhoraempresa.Enabled = True
            cboid_statusEntrevistaEmp.Enabled = True
            btnInserirEntEmp.Enabled = True
            lblMsg.Text = ""
        End If
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        MultiView1.ActiveViewIndex = 3

    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        MultiView1.ActiveViewIndex = 1
    End Sub
End Class

