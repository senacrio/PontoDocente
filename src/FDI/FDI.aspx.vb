Imports System.Math
Partial Class FDI
    Inherits System.Web.UI.Page

#Region " Funções "

    Private Sub HabilitaChkClientes(ByVal b As Boolean)
        chkflagClienteInterno.Enabled = True
        chkflagClienteInterno.Checked = b
        chkflagEmpOrganizadas.Enabled = True
        chkflagEmpOrganizadas.Checked = b


        chkflagGovEmpPublicas.Enabled = True
        chkflagGovEmpPublicas.Checked = b


        chkflagGovOutros.Enabled = True
        chkflagGovOutros.Checked = b



        chkflagGovPrefeituras.Enabled = True
        chkflagGovPrefeituras.Checked = b



        chkflagGovSecretarias.Enabled = True
        chkflagGovSecretarias.Checked = b



        chkflagInicPrivada.Enabled = True
        chkflagInicPrivada.Checked = b



        chkflagPublicoGeral.Enabled = True
        chkflagPublicoGeral.Checked = b


        chkflagSindicatos.Enabled = True
        chkflagSindicatos.Checked = b


        chkflagSistemas.Enabled = True
        chkflagSistemas.Checked = b


        chkflagTercSetor.Enabled = True
        chkflagTercSetor.Checked = b
    End Sub

    Private Function calculaEntSaida(ByVal id_empresa As Integer, ByVal id_iniciativa As Integer, ByVal flag As Boolean) As String
        Dim i As String = "0,00"
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select CASE WHEN fdiReceitasDespesas.flagDespesaReceita = 0 THEN 'Entrada' WHEN fdiReceitasDespesas.flagDespesaReceita = 1 THEN 'Saída' END AS despinvest,sum(valordespesareceita) as total from dbo.fdiReceitasDespesas where id_iniciativa=@id_iniciativa and id_empresa=@id_empresa and flagDespesaReceita=@flag group by flagdespesareceita", conn)

        Dim PId_Iniciativa, PId_Empresa, PFlag As New SqlParameter()

        PId_Iniciativa.ParameterName = "id_iniciativa"
        PId_Iniciativa.Value = id_iniciativa

        PId_Empresa.ParameterName = "id_empresa"
        PId_Empresa.Value = id_empresa

        PFlag.ParameterName = "flag"
        PFlag.Value = flag

        cmd.Parameters.Add(PId_Iniciativa)
        cmd.Parameters.Add(PId_Empresa)
        cmd.Parameters.Add(PFlag)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then

            reader.Read()
            i = reader(1).ToString

        Else

        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return i
    End Function

    Private Sub retornaTaxa()
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSConnectionString").ToString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT [dbo].[fncTaxa] ()", conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()


        If reader.HasRows Then
            reader.Read()
            txttaxaselic.ReadOnly = False
            txttaxaselic.Text = reader(0).ToString
            txttaxaselic.ReadOnly = True
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

    End Sub

#End Region


    Protected Sub MenuProjeto_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles MenuProjeto.MenuItemClick
        'If Session("CentroCusto") = "" Then
        '    Dim oFuncionario As New Funcionario
        '    oFuncionario.PegaUnidadeLotacao(Session("c_Matricula"))
        '    Session("CentroCusto") = oFuncionario.UnidadeNegocio
        '    LabelMatric.Text = Session("c_Matricula")
        '    LabelUnidLotac.Text = Session("CentroCusto")
        '    oFuncionario.Close()
        'End If
        botaoIncluir.Visible = True
        Select Case e.Item.Value
            Case "0"
                botaoIncluir.Visible = True
                MultiView1.ActiveViewIndex = 0
                GridViewIniciativa.SelectedIndex = -1
                DDLStatus.Enabled = False
                BtnAlteraStatusAprovacao.Enabled = False
                DDL_Empresa.Enabled = True
                Session("_modo") = "Incluir"
                Exit Select
            Case "1"
                Session("_modo") = "Alterar"
                botaoIncluir.Visible = False
                MultiView1.ActiveViewIndex = 1
                DDL_Empresa.Enabled = False
                Exit Select
            Case "2"
                botaoIncluir.Visible = False
                MultiView1.ActiveViewIndex = 2
                DDL_Empresa.Enabled = False
                Exit Select
            Case "3"
                botaoIncluir.Visible = False
                MultiView1.ActiveViewIndex = 3
                DDL_Empresa.Enabled = False
            Case "4"
                botaoIncluir.Visible = False
                MultiView1.ActiveViewIndex = 4
                DDL_Empresa.Enabled = False
                Exit Select
        End Select
        GridViewIniciativa.DataBind()

    End Sub
    Protected Sub GridViewProjetos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewIniciativa.SelectedIndexChanged
        'SqlGridIniciativa.DataBind()
        Session("id_Iniciativa") = GridViewIniciativa.SelectedValue
        Session("id_empresa") = GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("id_Empresa")
        Session("ValorInvestimento") = GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("ValorInvestimento")
        Session("Status") = GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("Sigla_Status")

       
        
       

        'DDLEmpresa.SelectedValue = Session("id_empresa")
        'DDLEmpresa0.SelectedValue = Session("id_empresa")
        'DDLEmpresa1.SelectedValue = Session("id_empresa")
        Session("_modo") = "Alterar"
        txbtaxaselic.Text = GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("TaxaSelic")
        txbentrada.Text = IIf(FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 0).ToString, 2, TriState.False, TriState.False).Replace("R$ ", "") = ",00", "0,00", FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 0).ToString, 2, TriState.True, TriState.False).Replace("R$ ", ""))
        txbsaida.Text = IIf(FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 1).ToString, 2, TriState.False, TriState.False).Replace("R$ ", "") = ",00", "0,00", FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 1).ToString, 2, TriState.True, TriState.False).Replace("R$ ", ""))
        txtId_Iniciativa1.Text = GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("Codigo")

        txtnMesesEntrada.Text = IIf(IsDBNull(GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("nMesesEntrada")), "", GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("nMesesEntrada"))
        txtnMesesSaida.Text = IIf(IsDBNull(GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("nMesesSaida")), "", GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("nMesesSaida"))

        HabilitaChkClientes(False)

        Select Case IIf(IsDBNull(GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("ClienteAlvo")), "", GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("ClienteAlvo"))
            Case "Cliente Interno"
                HabilitaChkClientes(False)
                chkflagClienteInterno.Enabled = False
                chkflagClienteInterno.Checked = False

                Exit Select
            Case "Empresas Organizadas (Filiadas aos Sindicatos)"
                HabilitaChkClientes(False)
                chkflagEmpOrganizadas.Enabled = False
                chkflagEmpOrganizadas.Checked = False
                Exit Select
            Case "Governo - Empresas Públicas"
                HabilitaChkClientes(False)
                chkflagGovEmpPublicas.Enabled = False
                chkflagGovEmpPublicas.Checked = False
                Exit Select
            Case "Governo - Outros"
                HabilitaChkClientes(False)
                chkflagGovOutros.Enabled = False
                chkflagGovOutros.Checked = False
                Exit Select

            Case "Governo - Prefeituras"
                HabilitaChkClientes(False)
                chkflagGovPrefeituras.Enabled = False
                chkflagGovPrefeituras.Checked = False
                Exit Select

            Case "Governo - Secretarias"
                HabilitaChkClientes(False)
                chkflagGovSecretarias.Enabled = False
                chkflagGovSecretarias.Checked = False
                Exit Select

            Case "Iniciativa Privada"
                HabilitaChkClientes(False)
                chkflagInicPrivada.Enabled = False
                chkflagInicPrivada.Checked = False
                Exit Select

            Case "Público Geral"
                HabilitaChkClientes(False)
                chkflagPublicoGeral.Enabled = False
                chkflagPublicoGeral.Checked = False
                Exit Select
            Case "Sindicatos"
                HabilitaChkClientes(False)
                chkflagSindicatos.Enabled = False
                chkflagSindicatos.Checked = False
                Exit Select
            Case "Sistema S"
                HabilitaChkClientes(False)
                chkflagSistemas.Enabled = False
                chkflagSistemas.Checked = False
                Exit Select
            Case "Terceiro Setor"
                HabilitaChkClientes(False)
                chkflagTercSetor.Enabled = False
                chkflagTercSetor.Checked = False
                Exit Select
            Case Else
                cboid_clientealvo.SelectedIndex = -1
                Exit Select

        End Select


        If GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("SENAC") Then
            curvalorSENAC.Enabled = True
        Else
            curvalorSENAC.Enabled = False
        End If

        If GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("SESC") Then
            curvalorSESC.Enabled = True
        Else
            curvalorSESC.Enabled = False
        End If
        If GridViewIniciativa.DataKeys(GridViewIniciativa.SelectedIndex).Values("FECOMERCIO") Then
            curvalorFECOMERCIO.Enabled = True
        Else
            curvalorFECOMERCIO.Enabled = False

        End If


        ddlid_receitadespesa.SelectedIndex = 0
        DDLMesDespesa.Items.Clear()


        cboid_Solicitante.DataBind()


        CRUD.Limpa(ViewDetalhes)

        CRUD.Popula(ViewDetalhes, SqlIniciativa)
        CRUD.Limpa(View4)

        CRUD.Popula(View4, sqlatualizainiciativa)

        lblmsg.Text = ""

        gridDespesas.DataBind()
        GridAreasEnvolvidas.DataBind()
        GridUnidadesEnvolvidas.DataBind()

        DDLStatus.Enabled = True
        BtnAlteraStatusAprovacao.Enabled = True


        txtTituloIniciativa1.Text = txtTituloIniciativa.Text
        'lblmensagemProjeto.Text = ""
        'lblmensagemProjeto0.Text = ""
        cboempresa.DataBind()
        cboempresa0.DataBind()
        DDLArea.DataBind()
        DDLUnidade.DataBind()

    End Sub
    Protected Sub botaoIncluirProjeto_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluir.Click
        CRUD.Limpa(ViewDetalhes)
        Session("_modo") = "Incluir"

        cboid_clientealvo.SelectedIndex = -1

        HabilitaChkClientes(False)
        Select Case Session("EmpresaGlobal")
            Case "2"
                chksesc.Checked = True
                chksenac.Checked = False
                chkfecomercio.Checked = False
                chksesc.Enabled = False
                chksesc.ForeColor = Drawing.Color.Silver
                chksenac.Enabled = True
                chksenac.ForeColor = Drawing.Color.Black
                chkfecomercio.Enabled = True
                chkfecomercio.ForeColor = Drawing.Color.Black
                curvalorSESC.Enabled = True
                curvalorFECOMERCIO.Enabled = False
                curvalorSENAC.Enabled = False


                Exit Select
            Case "3"
                chksesc.Checked = False
                chksenac.Checked = True
                chkfecomercio.Checked = False

                chksesc.Enabled = True
                chksesc.ForeColor = Drawing.Color.Black
                chksenac.Enabled = False
                chksenac.ForeColor = Drawing.Color.Silver
                chkfecomercio.Enabled = True
                chkfecomercio.ForeColor = Drawing.Color.Black
                curvalorSESC.Enabled = False
                curvalorFECOMERCIO.Enabled = False
                curvalorSENAC.Enabled = True


                Exit Select
            Case "4"
                chksesc.Checked = False
                chksenac.Checked = False
                chkfecomercio.Checked = True

                chksesc.Enabled = True
                chksesc.ForeColor = Drawing.Color.Black
                chksenac.Enabled = True
                chksenac.ForeColor = Drawing.Color.Black
                chkfecomercio.Enabled = False
                chkfecomercio.ForeColor = Drawing.Color.Silver

                curvalorSESC.Enabled = False
                curvalorFECOMERCIO.Enabled = True
                curvalorSENAC.Enabled = False

                Exit Select
            Case Else
                chksesc.Checked = False
                chksenac.Checked = False
                chkfecomercio.Checked = False
                chksesc.Enabled = False
                chksesc.ForeColor = Drawing.Color.Black
                chksenac.Enabled = False
                chksenac.ForeColor = Drawing.Color.Black
                chkfecomercio.Enabled = False
                chkfecomercio.ForeColor = Drawing.Color.Black
                curvalorSESC.Enabled = False
                curvalorFECOMERCIO.Enabled = False
                curvalorSENAC.Enabled = False
        End Select
        retornaTaxa()
    End Sub

    Protected Sub botaoAlterarProjeto_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAlterarIniciativa.Click
        'ALTERAR
        If cboid_clientealvo.SelectedItem.Text = "" Then
            lblmensagemProjeto.Text = "Selecione um cliente alvo."
            lblmensagemProjeto1.Text = "Selecione um cliente alvo."
            Exit Sub
        Else
            lblmensagemProjeto.Text = ""
            lblmensagemProjeto1.Text = ""
        End If
        If (chkflagClienteInterno.Checked Or chkflagEmpOrganizadas.Checked Or chkflagGovEmpPublicas.Checked Or chkflagGovOutros.Checked Or chkflagGovPrefeituras.Checked Or chkflagGovSecretarias.Checked Or chkflagInicPrivada.Checked Or chkflagPublicoGeral.Checked Or chkflagSindicatos.Checked Or chkflagSistemas.Checked Or chkflagTercSetor.Checked) And txtDescClienteSec.Text = "" Then
            lblmensagemProjeto.Text = "Coloque uma descrição para o cliente secundário."
            lblmensagemProjeto1.Text = "Coloque uma descrição para o cliente secundário."
        Else
            lblmensagemProjeto.Text = ""
            lblmensagemProjeto1.Text = ""
            Try

                MultiView1.ActiveViewIndex = 1
                SqlIniciativa.Update()
                SqlGridIniciativa.DataBind()
                GridViewIniciativa.DataBind()
                GridViewIniciativa.SelectedIndex = -1
                MultiView1.ActiveViewIndex = 0
                MenuProjeto.Items(0).Selected = True


               

            Catch ex As Exception
                lblmensagemProjeto.Text = "Não foi possível alterar o projeto, favor verificar todos os campos obrigatórios. Erro: " & ex.ToString
            End Try

        End If
        Session("_modo") = "Incluir"
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("EmpresaGlobal") = ConfigurationManager.AppSettings("Empresa")


        



        If (Session("EmpresaGlobal") = 1 Or Session("Status") <> "ED") And Session("_modo") = "Alterar" Then
            Panel14.Enabled = False
            Panel9.Enabled = False
            Panel13.Enabled = False
            Panel15.Enabled = False
            Panel18.Enabled = False
        Else
            Panel14.Enabled = True
            Panel9.Enabled = True
            Panel13.Enabled = True
            Panel15.Enabled = True
            Panel18.Enabled = True
        End If



        lblmensagemProjeto.Text = ""
        lblmensagemProjeto0.Text = ""

        If Session("c_Nome") = "" Then
            Response.Redirect("Default.aspx")
        Else
            If Not Page.IsPostBack Then
                If Not FDIUsuario.UsuarioExiste(Session("c_Login"), Session("EmpresaGlobal")) Then
                    MultiView1.ActiveViewIndex = 5
                    txtLogin.Text = Session("c_Login")
                    txtMatric.Text = Session("c_Matricula")
                    If Session("c_Nome") <> "" Then
                        txtNome.Enabled = False
                        txtNome.Text = Session("c_Nome")
                    Else
                        txtNome.Enabled = True
                        txtNome.Text = ""
                    End If

                    If Session("c_Email") = "" Then
                        lblmsgemail.Text = "Atualize o campo email no AD."
                        txtEMail.Enabled = True
                        txtEMail.Text = ""
                    Else
                        txtEMail.Text = Session("c_Email")
                        txtEMail.Enabled = False

                    End If


                    ImIncSolic.Visible = True
                    botaoAlterarSolic.Visible = False
                Else
                    lblmsgemail.Text = ""
                End If
                Session("id_usuario") = FDIUsuario.retornaid(Session("c_Login"), Session("EmpresaGlobal"))

            End If
        End If

       

    End Sub
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'If Session("CentroCusto") = "" Then
        '    Dim oFuncionario As New Funcionario
        '    oFuncionario.PegaUnidadeLotacao(Session("c_Matricula"))
        '    Session("CentroCusto") = oFuncionario.UnidadeNegocio
        '    LabelMatric.Text = Session("c_Matricula")
        '    LabelUnidLotac.Text = Session("CentroCusto")
        '    oFuncionario.Close()
        'End If


        

        botaoAlterarIniciativa.Visible = False
        botaoIncluirIniciativa.Visible = False

        'Desabilita os dois botões, para depois habilitar o necessáripo
        botaoAlterarIniciativa.Visible = False
        botaoIncluirIniciativa.Visible = False

        Session("id_Iniciativa") = GridViewIniciativa.SelectedValue
        If Page.IsPostBack Then
            If Session("_modo") = "Alterar" Then

                'ALTERAR
                'CRUD.Popula(ViewDetalhes, SqlIniciativa)
                botaoAlterarIniciativa.Visible = True
                botaoIncluirIniciativa.Visible = False
                If Session("Status") = "ED" Then
                    DDLStatus.Enabled = True
                    BtnAlteraStatusAprovacao.Enabled = True
                Else
                    DDLStatus.Enabled = False
                    BtnAlteraStatusAprovacao.Enabled = False
                End If




            ElseIf Session("_modo") = "Incluir" Then

                'INCLUIR()


                retornaTaxa()
                curvalorFECOMERCIO.Text = "0,00"
                curvalorSESC.Text = "0,00"
                curvalorSENAC.Text = "0,00"
                curvalorinvestimento.Text = "0,00"
                curfinancexterno.Text = "0,00"
                DDLStatus.Enabled = False
                BtnAlteraStatusAprovacao.Enabled = False
                cboid_Solicitante.SelectedValue = Session("id_usuario")
                botaoIncluir.Visible = True
                botaoIncluirIniciativa.Visible = True
                botaoAlterarIniciativa.Visible = False


            End If
        End If


        If GridViewIniciativa.SelectedIndex >= 0 Then
            MenuProjeto.Enabled = True
        Else
            MenuProjeto.Enabled = False
        End If

    End Sub

    Protected Sub botaoVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoVoltar.Click
        botaoIncluir.Visible = True
        MultiView1.ActiveViewIndex = 0
        GridViewIniciativa.SelectedIndex = -1
        DDLStatus.Enabled = False
        BtnAlteraStatusAprovacao.Enabled = False
        DDL_Empresa.Enabled = True
        MenuProjeto.Items(0).Selected = True
        GridViewIniciativa.SelectedIndex = -1
        Session("_modo") = "Incluir"
    End Sub

    Protected Sub botaoIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluir.Click
        Session("_modo") = "Incluir"
        MultiView1.ActiveViewIndex = 1
        LabelUnidLotac.Text = Session("CentroCusto")
        txtId_Iniciativa1.Text = ""
        txtTituloIniciativa1.Text = ""
        GridViewIniciativa.SelectedIndex = -1
        chkFlagDesenvOrgan.Checked = False
        chkFlagInovacao.Checked = False
        chkFlagInstitucional.Checked = False

    End Sub

    Protected Sub ImageButton1_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            SqlGridIniciativa.Delete()
            SqlGridIniciativa.DataBind()
        Catch ex As Exception
            lblmensagemProjeto0.Text = "Projeto não pode ser excluído, antes dos itens relacionados"
        End Try
    End Sub

    Protected Sub botaoIncluirIniciativa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirIniciativa.Click
        'INCLUIR

        If cboid_clientealvo.SelectedItem.Text = "" Then
            lblmensagemProjeto.Text = "Selecione um cliente alvo."
            lblmensagemProjeto1.Text = "Selecione um cliente alvo."
            Exit Sub
        Else
            lblmensagemProjeto.Text = ""
            lblmensagemProjeto1.Text = ""
        End If

        If (chkflagClienteInterno.Checked Or chkflagEmpOrganizadas.Checked Or chkflagGovEmpPublicas.Checked Or chkflagGovOutros.Checked Or chkflagGovPrefeituras.Checked Or chkflagGovSecretarias.Checked Or chkflagInicPrivada.Checked Or chkflagPublicoGeral.Checked Or chkflagSindicatos.Checked Or chkflagSistemas.Checked Or chkflagTercSetor.Checked) And txtDescClienteSec.Text = "" Then
            lblmensagemProjeto.Text = "Coloque uma descrição para o cliente secundário."
            lblmensagemProjeto1.Text = "Coloque uma descrição para o cliente secundário."
        Else
            lblmensagemProjeto.Text = ""
            lblmensagemProjeto1.Text = ""

            If Not chkFlagInstitucional.Checked And Not chkFlagDesenvOrgan.Checked And Not chkFlagInovacao.Checked Then
                lblmensagemProjeto.Text = "Selecione pelos menos um tipo de iniciativa."
                lblmensagemProjeto1.Text = "Selecione pelos menos um tipo de iniciativa."
            Else
                lblmensagemProjeto.Text = ""
                lblmensagemProjeto1.Text = ""
                Try

                    botaoIncluir.Visible = True
                    SqlIniciativa.Insert()
                    SqlGridIniciativa.DataBind()
                    GridViewIniciativa.DataBind()
                    MultiView1.ActiveViewIndex = 0
                Catch ex As Exception
                    lblmensagemProjeto.Text = "Iniciativa já inserido com este nome, favor escolher outro nome. Erro: " & ex.ToString
                    ' lblmensagemProjeto.Text = ex.Message.ToString
                End Try
            End If
        End If
        


    End Sub

    Protected Sub DDL_Empresa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_Empresa.SelectedIndexChanged

        cboid_Solicitante.DataBind()
        cboid_AreaSolicitante.DataBind()

    End Sub

    Protected Sub botaoIncluirAreaEnvolvida_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirAreaEnvolvida.Click
        Try
            sqlareasenvolvidas.Insert()
            GridAreasEnvolvidas.DataBind()
            lblmsgarea.Text = ""
        Catch
            lblmsgarea.Text = "Área/Núcleo repetida."
        End Try

        cboempresa.SelectedIndex = -1
        DDLArea.SelectedIndex = -1


    End Sub

    Protected Sub botaoIncluirDespesa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirDespesa.Click
        If (ddlid_receitadespesa.SelectedValue = 1 And DDLMesDespesa.SelectedValue = FDICalculos.retornaTotalSaida(GridViewIniciativa.SelectedValue, Session("id_empresa")) And Decimal.Parse(txbValorDespesa.Text) = 0) Or (ddlid_receitadespesa.SelectedValue = 0 And DDLMesDespesa.SelectedValue = FDICalculos.retornaTotalEntrada(GridViewIniciativa.SelectedValue, Session("id_empresa")) And Decimal.Parse(txbValorDespesa.Text) = 0) Then
            lblmensagemRetorno.Text = "A última Entrada/Saída não pode ser 0."
        Else
            Try


                If chkperpetuidade.Checked And ddlid_receitadespesa.SelectedValue = 0 Then
                    For i As Integer = DDLMesDespesa.SelectedValue To Integer.Parse(txtnMesesEntrada.Text)
                        FDIUtilitario.IncluiPerpetuidade(GridViewIniciativa.SelectedValue, Session("id_empresa"), i, txbDescricaoDesp.Text, txbValorDespesa.Text)
                    Next
                    lblmensagemRetorno.Text = ""
                    chkperpetuidade.Checked = False
                    ddlid_receitadespesa.SelectedIndex = -1


                Else
                    Try
                        SqlGridDespesas.Insert()
                        SqlGridDespesas.DataBind()
                        lblmensagemRetorno.Text = ""
                    Catch ex As Exception
                        lblmensagemRetorno.Text = "Você não pode incluir mais de um registro para esse mês."

                    End Try
                End If

            Catch ex As Exception
                lblmensagemRetorno.Text = "Você não pode incluir mais de um registro para esse mês."
            End Try


            txbValorDespesa.Text = ""
            txbDescricaoDesp.Text = ""




            txbentrada.Text = IIf(FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 0).ToString, 2, TriState.False, TriState.False).Replace("R$ ", "") = ",00", "0,00", FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 0).ToString, 2, TriState.True, TriState.False).Replace("R$ ", ""))
            txbsaida.Text = IIf(FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 1).ToString, 2, TriState.False, TriState.False).Replace("R$ ", "") = ",00", "0,00", FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 1).ToString, 2, TriState.True, TriState.False).Replace("R$ ", ""))

            Dim oFDICalculo As New FDICalculos()

            oFDICalculo.TestIRR((txttaxaselic.Text / 100), curvalorinvestimento.Text, GridViewIniciativa.SelectedValue, Session("id_empresa"))
            curVPL.Text = FormatCurrency(Round(oFDICalculo.fluxocaixa, 2).ToString, 2, TriState.True, TriState.False).Replace("R$ ", "")
            txttir.Text = Round(oFDICalculo.tir, 2).ToString

            If oFDICalculo.fluxocaixa > 0 Then
                txtpayback.Text = oFDICalculo.anos.ToString + " ano(s) e " + oFDICalculo.meses.ToString + " meses."
            Else
                txtpayback.Text = "0 ano e 0 meses"
            End If
            Try
                sqlatualizainiciativa.Update()
                lblmsg.Text = "Registro Atualizado."
                lblmsg.ForeColor = Drawing.Color.Green
            Catch ex As Exception
                lblmsg.Text = ex.Message.ToString
                lblmsg.ForeColor = Drawing.Color.Red
            End Try

            gridDespesas.DataBind()
        End If

        


    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Dim oFDICalculo As New FDICalculos()

        oFDICalculo.TestIRR((txttaxaselic.Text / 100), curvalorinvestimento.Text, GridViewIniciativa.SelectedValue, Session("id_empresa"))
        curVPL.Text = IIf(FormatCurrency(Round(oFDICalculo.fluxocaixa, 2).ToString, 2, TriState.False, TriState.False).Replace("R$ ", "") = ",00", "0,00", FormatCurrency(Round(oFDICalculo.fluxocaixa, 2).ToString, 2, TriState.True, TriState.False).Replace("R$ ", ""))
        txttir.Text = Round(oFDICalculo.tir, 2).ToString

        If oFDICalculo.fluxocaixa > 0 Then
            txtpayback.Text = oFDICalculo.anos.ToString + " ano(s) e " + oFDICalculo.meses.ToString + " meses."
        Else
            txtpayback.Text = "0 ano e 0 meses"
        End If
        Try
            sqlatualizainiciativa.Update()
            lblmsg.Text = "Registro Atualizado."
            lblmsg.ForeColor = Drawing.Color.Green
        Catch ex As Exception
            lblmsg.Text = ex.Message.ToString
            lblmsg.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub botaoIncluirAreaEnvolvida0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirAreaEnvolvida0.Click
        Try
            sqlunidadesenvolvidas.Insert()
            GridUnidadesEnvolvidas.DataBind()
            lblmsgunidade.Text = ""

        Catch
            lblmsgunidade.Text = "Unidade Repetida."
        End Try
        cboempresa0.SelectedIndex = -1
        DDLUnidade.SelectedIndex = -1


    End Sub



    Protected Sub btnIncluirSolicitante_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnIncluirSolicitante.Click
        MultiView1.ActiveViewIndex = 5
        txtLogin.Text = Session("c_Login")
        txtMatric.Text = Session("c_Matricula")
        txtNome.Text = Session("c_Nome")
        txtEMail.Text = Session("c_Email")

    End Sub

    Protected Sub ImDelSolic_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub botaoVoltar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoVoltar0.Click
        MultiView1.ActiveViewIndex = 1
        txtMatric.Text = ""
        txtEMail.Text = ""
        txtNome.Text = ""
    End Sub

    Protected Sub ImIncSolic_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImIncSolic.Click
        If txtMatric.Text <> "" Then

            Try
                SqlSolicitante0.Insert()
                GridSolicitante.DataBind()
                txtAviso.Text = "Solicitante incluído com sucesso"
                Session("id_usuario") = FDIUsuario.retornaid(Session("c_Login"), Session("EmpresaGlobal"))
                txtMatric.Text = ""
                txtEMail.Text = ""
                txtNome.Text = ""
                txtLogin.Text = ""
                MultiView1.ActiveViewIndex = 0
            Catch ex As Exception
                txtAviso.Text = "Não foi possível incluir novo solicitante. Já existe solicitante com o código ou nome cadastrado "
            End Try
        End If
    End Sub

    Protected Sub GridSolicitante_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridSolicitante.RowDeleted
        cboid_Solicitante.DataBind()

    End Sub

    Protected Sub BtnAlteraStatusAprovacao_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles BtnAlteraStatusAprovacao.Click
        If FDICalculos.Finaliza(GridViewIniciativa.SelectedValue, Session("id_empresa")) Then
            lblmensagemProjeto0.Text = ""
            If ((DDLStatus.SelectedValue = "SL" And txbsaida.Text.ToString.Replace(".", "") = Session("ValorInvestimento").ToString) Or DDLStatus.SelectedValue = "ED") Then
                sqlStatus.Update()
                GridViewIniciativa.DataBind()
                lblmensagemProjeto0.Text = "Status Alterado."
                GridViewIniciativa.SelectedIndex = -1
            Else
                lblmensagemProjeto0.Text = "Status não foi alterado. Total de saída diferente do total do investimento."
            End If
        Else
            lblmensagemProjeto0.Text = "A última entrada ou ultima saída não pode ser igual a zero."
        End If
        




    End Sub

    Protected Sub gridDespesas_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gridDespesas.RowDeleted
        Dim oFDICalculo As New FDICalculos()

        oFDICalculo.TestIRR((txttaxaselic.Text / 100), curvalorinvestimento.Text, GridViewIniciativa.SelectedValue, Session("id_empresa"))
        curVPL.Text = Round(oFDICalculo.fluxocaixa, 2).ToString
        txttir.Text = Round(oFDICalculo.tir, 2).ToString

        txbentrada.Text = IIf(FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 0), 2, TriState.False, TriState.False).Replace("R$ ", "") = ",00", "0,00", FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 0), 2, TriState.True, TriState.False).Replace("R$ ", ""))
        txbsaida.Text = IIf(FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 1), 2, TriState.False, TriState.False).Replace("R$ ", "") = ",00", "0,00", FormatCurrency(calculaEntSaida(Session("id_empresa"), Session("id_Iniciativa"), 1), 2, TriState.True, TriState.False).Replace("R$ ", ""))


        If oFDICalculo.fluxocaixa > 0 Then
            txtpayback.Text = oFDICalculo.anos.ToString + " ano(s) e " + oFDICalculo.meses.ToString + " meses."
        Else
            txtpayback.Text = "0 ano e 0 meses"
        End If
        Try
            sqlatualizainiciativa.Update()
            lblmsg.Text = "Registro Atualizado."
            lblmsg.ForeColor = Drawing.Color.Green
        Catch ex As Exception
            lblmsg.Text = ex.Message.ToString
            lblmsg.ForeColor = Drawing.Color.Red
        End Try
    End Sub


    Protected Sub gridDespesas_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridDespesas.SelectedIndexChanged

    End Sub

    Protected Sub botaoAlterarSolic_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAlterarSolic.Click
        Try
            SqlSolicitante0.Update()
            GridSolicitante.DataBind()
            txtAviso.Text = "Dados do solicitante alterados com sucesso"
        Catch ex As Exception
            txtAviso.Text = "Não foi possível alterar dados do solicitante. Favor verificar mensagem de erro abaixo:  " & ex.ToString
        End Try
    End Sub

    Protected Sub GridSolicitante_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridSolicitante.SelectedIndexChanged
        txtAviso.Text = ""
        txtMatric.Text = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(5).Text)
        txtNome.Text = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(6).Text)
        txtEMail.Text = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(7).Text)
        txtLogin.Text = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(8).Text)

        DDLArea0.SelectedValue = Server.HtmlDecode(GridSolicitante.SelectedRow.Cells(3).Text)
        Session("Id_Solicitante") = GridSolicitante.DataKeys(GridSolicitante.SelectedIndex).Values("id_Solicitante")
        botaoAlterarSolic.Visible = True
    End Sub

    Protected Sub botaoVoltar1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoVoltar1.Click

        botaoIncluir.Visible = True
        MultiView1.ActiveViewIndex = 0
        GridViewIniciativa.SelectedIndex = -1
        DDLStatus.Enabled = False
        BtnAlteraStatusAprovacao.Enabled = False
        DDL_Empresa.Enabled = True
        MenuProjeto.Items(0).Selected = True
        GridViewIniciativa.SelectedIndex = -1
        Session("_modo") = "Incluir"

    End Sub

    Protected Sub chksenac_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chksenac.CheckedChanged
        Dim a As CheckBox = sender
        curvalorSENAC.Enabled = a.Checked
        cboempresa.DataBind()
        cboempresa0.DataBind()
        DDLArea.DataBind()
        DDLUnidade.DataBind()
    End Sub

    Protected Sub chksesc_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chksesc.CheckedChanged
        Dim a As CheckBox = sender
        curvalorSESC.Enabled = a.Checked
        cboempresa.DataBind()
        cboempresa0.DataBind()
        DDLArea.DataBind()
        DDLUnidade.DataBind()
    End Sub

    Protected Sub chkfecomercio_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkfecomercio.CheckedChanged
        Dim a As CheckBox = sender
        curvalorFECOMERCIO.Enabled = a.Checked
        cboempresa.DataBind()
        cboempresa0.DataBind()
        DDLArea.DataBind()
        DDLUnidade.DataBind()
    End Sub

    Protected Sub btnAtulizaMeses_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAtulizaMeses.Click
        sqlAtualizaMeses.Update()
        ddlid_receitadespesa.SelectedIndex = 0
        DDLMesDespesa.Items.Clear()
    End Sub

    Protected Sub ddlid_receitadespesa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlid_receitadespesa.SelectedIndexChanged
        Dim totalEntrada, totalsaida As Integer
        totalEntrada = FDICalculos.retornaTotalEntrada(GridViewIniciativa.SelectedValue, Session("id_empresa"))
        totalsaida = FDICalculos.retornaTotalSaida(GridViewIniciativa.SelectedValue, Session("id_empresa"))

        If totalEntrada <> 0 And totalsaida <> 0 Then

            If ddlid_receitadespesa.SelectedValue = 1 Then
                DDLMesDespesa.Items.Clear()
                For i As Integer = 1 To totalsaida

                    DDLMesDespesa.Items.Add(New ListItem(i, i))
                Next
                chkperpetuidade.Visible = False
            ElseIf ddlid_receitadespesa.SelectedValue = 0 Then
                DDLMesDespesa.Items.Clear()
                For i As Integer = 1 To totalEntrada

                    DDLMesDespesa.Items.Add(New ListItem(i, i))
                Next
                chkperpetuidade.Visible = True
            ElseIf ddlid_receitadespesa.SelectedValue = 100 Then
                DDLMesDespesa.Items.Clear()
                chkperpetuidade.Visible = False

            End If
        End If
    End Sub

    Protected Sub cboid_clientealvo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_clientealvo.SelectedIndexChanged
        Select Case cboid_clientealvo.SelectedItem.Text
            Case ""
                HabilitaChkClientes(False)
                Exit Select
            Case "Cliente Interno"
                HabilitaChkClientes(False)
                chkflagClienteInterno.Enabled = False
                chkflagClienteInterno.Checked = False

                Exit Select
            Case "Empresas Organizadas (Filiadas aos Sindicatos)"
                HabilitaChkClientes(False)
                chkflagEmpOrganizadas.Enabled = False
                chkflagEmpOrganizadas.Checked = False
                Exit Select
            Case "Governo - Empresas Públicas"
                HabilitaChkClientes(False)
                chkflagGovEmpPublicas.Enabled = False
                chkflagGovEmpPublicas.Checked = False
                Exit Select
            Case "Governo - Outros"
                HabilitaChkClientes(False)
                chkflagGovOutros.Enabled = False
                chkflagGovOutros.Checked = False
                Exit Select

            Case "Governo - Prefeituras"
                HabilitaChkClientes(False)
                chkflagGovPrefeituras.Enabled = False
                chkflagGovPrefeituras.Checked = False
                Exit Select

            Case "Governo - Secretarias"
                HabilitaChkClientes(False)
                chkflagGovSecretarias.Enabled = False
                chkflagGovSecretarias.Checked = False
                Exit Select

            Case "Iniciativa Privada"
                HabilitaChkClientes(False)
                chkflagInicPrivada.Enabled = False
                chkflagInicPrivada.Checked = False
                Exit Select

            Case "Público Geral"
                HabilitaChkClientes(False)
                chkflagPublicoGeral.Enabled = False
                chkflagPublicoGeral.Checked = False
                Exit Select
            Case "Sindicatos"
                HabilitaChkClientes(False)
                chkflagSindicatos.Enabled = False
                chkflagSindicatos.Checked = False
                Exit Select
            Case "Sistema S"
                HabilitaChkClientes(False)
                chkflagSistemas.Enabled = False
                chkflagSistemas.Checked = False
                Exit Select
            Case "Terceiro Setor"
                HabilitaChkClientes(False)
                chkflagTercSetor.Enabled = False
                chkflagTercSetor.Checked = False
                Exit Select

        End Select
    End Sub

    Protected Sub cboempresa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboempresa.SelectedIndexChanged
        DDLArea.DataBind()

    End Sub

    Protected Sub cboempresa0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboempresa0.SelectedIndexChanged
        DDLUnidade.DataBind()

    End Sub

    Protected Sub cboidUnidadeSolicitante_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboidUnidadeSolicitante.SelectedIndexChanged
        cboid_AreaSolicitante.SelectedIndex = -1

    End Sub

    Protected Sub cboid_AreaSolicitante_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_AreaSolicitante.SelectedIndexChanged
        cboidUnidadeSolicitante.SelectedIndex = -1
    End Sub
End Class
