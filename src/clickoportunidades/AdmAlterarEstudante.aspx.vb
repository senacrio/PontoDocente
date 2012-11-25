
Partial Class clickoportunidades_AdmAlterarEstudante
    Inherits System.Web.UI.Page

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        Select Case e.Item.Value
            Case "0"

                MultiView1.ActiveViewIndex = 0
    
                Session("id_view") = "Alterou dados do candidato"

            Case "1"

                MultiView1.ActiveViewIndex = 1

            Case "2"

                MultiView1.ActiveViewIndex = 2
                Session("id_view") = "Alterou outros cursos"

            Case "3"

                MultiView1.ActiveViewIndex = 3
                Session("id_view") = "Alterou formação"
            Case "4"

                MultiView1.ActiveViewIndex = 4
                Session("id_view") = "Alterou objetivo"
            Case "5"

                MultiView1.ActiveViewIndex = 5
                Session("id_view") = "Alterou histórico"
            Case "6"

                MultiView1.ActiveViewIndex = 6
                Session("id_view") = "Alterou conhecimento"
            
        End Select
    End Sub

    Protected Sub Page_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.DataBinding
    End Sub

    Protected Sub Page_InitComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.InitComplete

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        Session("id_candidato") = cboEstudante.SelectedValue
        Session("id_candidato_fk") = cboEstudante.SelectedValue


        'ALTERAR
        If Not IsPostBack Then
            CRUD.Popula(viewCandidato, sqlCurriculo)
        End If

        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        'ATIVA E DESATIVA EXIGÊNCIA DE EMAIL

        If chkEmailNao.Checked Then
            valEmail.Enabled = False
            txtEmail.Text = ""
            txtEmail.Enabled = False
        Else
            valEmail.Enabled = True
            txtEmail.Enabled = True
        End If


    End Sub

    Protected Sub sqlCursosSenac_Deleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqlCursosSenac.Deleting
    End Sub

    Protected Sub ibtAdicionarCursosOutros_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtAdicionarCursosOutros.Click
        Try
            sqlCursosOutros.Insert()
            gvCursosOutros.DataBind()
            lblCursosOutrosAviso.Text = "Seus dados foram salvos, cadastro realizado com sucesso."
        Catch ex As Exception
            lblCursosOutrosAviso.Text = "Cada curso pode ser adicionado apenas uma vez."
        End Try
        SqlLogAlteraCandidato.Insert()
    End Sub

    Protected Sub ibtFormacaoAdicionar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtFormacaoAdicionar.Click
        Try
            'Verifico se a data inicio escolaridade e menor do que a data final da escolaridade.
            Dim datFormInicio As Date = Convert.ToDateTime(txtFormacaoInicio.Text)
            Dim datFormFim As Date = Convert.ToDateTime(txtFormacaoFim.Text)
            If datFormInicio < datFormFim And datFormInicio < DateValue(Now) Then
                sqlFormacao.Insert()
                gvFormacao.DataBind()
                lblFormacaoAviso.Text = "Seus dados foram salvos, favor prosseguir."
            Else
                lblFormacaoAviso.Text = "Data inválida."
            End If
        Catch ex As Exception
            lblFormacaoAviso.Text = "Não foi possível incluir esta formação." + ex.Message.ToString
        End Try
        SqlLogAlteraCandidato.Insert()
    End Sub

    Protected Sub ibtHistoricoAdicionar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtHistoricoAdicionar.Click
        Try
            Dim datHistInicio As Date
            Dim datHistFim As Date
            'Verifico se a data fim está em branco e a data inicial é maior que a data corrente.
            If Convert.ToDateTime(txtHisInicio.Text) < DateValue(Now) Then
                If txtHisFim.Text = "" Then

                    sqlHistorico.Insert()
                    gvHistorico.DataBind()
                    lblHistoricoAviso.Text = "Seus dados foram salvos, favor prosseguir."
                Else
                    'Converto o conteudo do txts em data.
                    datHistInicio = Convert.ToDateTime(txtHisInicio.Text)
                    datHistFim = Convert.ToDateTime(txtHisFim.Text)

                    If datHistInicio < datHistFim And datHistInicio < Now() Then
                        sqlHistorico.Insert()
                        gvHistorico.DataBind()
                        lblHistoricoAviso.Text = "Seus dados foram salvos, favor prosseguir."
                    Else
                        lblHistoricoAviso.Text = "Data inicial maior que data final."
                    End If
                End If
            Else
                lblHistoricoAviso.Text = "Data inicial inválida."
            End If

        Catch ex As Exception
            lblHistoricoAviso.Text = "Não foi possível incluir este histórico."
        End Try
        SqlLogAlteraCandidato.Insert()
    End Sub

    Protected Sub ibtConhecimentoAdicionar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtConhecimentoAdicionar.Click
        Try
            sqlConhecimento.Insert()
            gvConhecimento.DataBind()
            ddlConhecimento.DataBind()
            'sqlConhecimentoLista.DataBind()
            lblConhecimentoAviso.Text = "Seus dados foram salvos, favor prosseguir..."
        Catch ex As Exception
            lblConhecimentoAviso.Text = "Não foi possível incluir este histórico." + ex.Message.ToString
        End Try
        SqlLogAlteraCandidato.Insert()
    End Sub

    Protected Sub gvConhecimento_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gvConhecimento.RowDeleted
        ddlConhecimento.DataBind()
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim rqOutros As New RequiredFieldValidator
        Dim ddlOutros As New DropDownList

        rqOutros = fvOutros.FindControl("rqOutros")
        ddlOutros = fvOutros.FindControl("ddlOutros")

        If ddlOutros.Text = 99 Then
            rqOutros.Enabled = True
        Else
            rqOutros.Enabled = False
        End If

    End Sub

    Protected Sub chkEmailNao_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkEmailNao.CheckedChanged


    End Sub

    Protected Sub ibtObjetivoAdicionar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtObjetivoAdicionar.Click

        Try
            sqlObjetivo.Insert()
            ddlObjetivoArea.DataBind()
            'gvObjetivo.DataBind()
            lblObjetivoAviso.Text = "Seus dados foram salvos, favor prosseguir."
        Catch ex As Exception
            lblObjetivoAviso.Text = "Não foi possível incluir este histórico. Área pretendida já cadastrada para o cargo selecionado."
        End Try
        SqlLogAlteraCandidato.Insert()

    End Sub

    Protected Sub ddlConhecimentoArea_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlConhecimentoArea.SelectedIndexChanged
        ddlConhecimento.DataBind()
    End Sub

    Protected Sub cboEstado_fk_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboEstado_fk.Load

    End Sub

    Protected Sub cboEstado_fk_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboEstado_fk.PreRender

    End Sub

    Protected Sub DropDownEstado_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboEstado_fk.SelectedIndexChanged

        cboId_Municipio.DataBind()

    End Sub
    Protected Sub ddlFormacaoNivel_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlFormacaoNivel.SelectedIndexChanged
        If ddlFormacaoNivel.SelectedValue() > 3 Then
            txtFormacaoCurso.Enabled = True
        Else
            txtFormacaoCurso.Enabled = False
        End If
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Session("_modo") = "Alterar"
        sqlCurriculo.Update()
        lblDadosPessoais.Text = "Seus dados foram salvos, favor prosseguir."
        SqlLogAlteraCandidato.Insert()
    End Sub

    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Session("id_candidato") = cboEstudante.SelectedValue
        Session("id_candidato_fk") = cboEstudante.SelectedValue
        Session("EstudanteIdentificador") = txtIdentificador.Text
        gvCursosOutros.DataBind()
        gvFormacao.DataBind()
        gvHistorico.DataBind()
        gvConhecimento.DataBind()
        GridView1.DataBind()

    End Sub

    Protected Sub ibtObjetivoAdicionar_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ibtObjetivoAdicionar.Load
        lblDadosPessoais.Text = ""
        lblCursosOutrosAviso.Text = ""
        lblFormacaoAviso.Text = ""
        lblHistoricoAviso.Text = ""
        lblConhecimentoAviso.Text = ""
        lblObjetivoAviso.Text = ""

    End Sub

    Protected Sub ibtObjetivoAdicionar_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ibtObjetivoAdicionar.PreRender

    End Sub

    Protected Sub Page_SaveStateComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.SaveStateComplete

    End Sub

    Protected Sub DropDownTrabalhando_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownTrabalhando.SelectedIndexChanged
        'ATIVA E DESATIVA EXIGÊNCIA DA DATA FIM
        'Dim valFim As RequiredFieldValidator
        'Dim txtHisFim As TextBox



        'valFim = viewCandidato.FindControl("valFim")
        'txtHisFim = viewCandidato.FindControl("txtHisFim")


        chkEmailNao = viewCandidato.FindControl("chkEmailNao")
        'DESABILITA O CAMPO DATA FIM CASO O COMBO = SIM
        If DropDownTrabalhando.SelectedValue() = "Sim" Then
            lblDataDim.Enabled = False
            txtHisFim.Enabled = False
            Reqdatafim.Visible = False
            'valFim.Enabled = True
        Else
            lblDataDim.Enabled = True
            txtHisFim.Enabled = True
            Reqdatafim.Visible = True
            'valFim.Enabled = False
        End If

    End Sub


    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        Dim parNome, parCPF As New Parameter

        SqlBuscaCandidato.SelectParameters.Clear()

        parNome.Name = "nome"
        If txtnomecandidato.Text.Length = 0 Then
            parNome.DefaultValue = "%"
        Else
            parNome.DefaultValue = txtnomecandidato.Text
        End If
        SqlBuscaCandidato.SelectParameters.Add(parNome)

        parCPF.Name = "identificador"
        If txtcpfcandidato.Text.Length = 0 Then
            parCPF.DefaultValue = "%"
        Else
            parCPF.DefaultValue = txtcpfcandidato.Text
        End If
        SqlBuscaCandidato.SelectParameters.Add(parCPF)

        txtcpfcandidato.Text = ""
        txtnomecandidato.Text = ""
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click

        Session("id_candidato") = cboEstudante.SelectedValue
        Session("id_candidato_fk") = cboEstudante.SelectedValue
        MultiView1.ActiveViewIndex = 0

        CRUD.Popula(viewCandidato, sqlCurriculo)
        Session("id_view") = "Alterou dados do candidato"
    End Sub

    Protected Sub btnExcluirConhecimentos_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("id_view") = "Deletou Conhecimentos"
        SqlLogAlteraCandidato.Insert()
    End Sub

    Protected Sub btnExcluirHist_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("id_view") = "Deletou Histórico"
        SqlLogAlteraCandidato.Insert()
    End Sub

    Protected Sub btnExcluirOutros_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("id_view") = "Deletou Outros cursos"
        SqlLogAlteraCandidato.Insert()
    End Sub

    Protected Sub btnExcluirFormacao_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("id_view") = "Deletou Formação"
        SqlLogAlteraCandidato.Insert()
    End Sub

    Protected Sub btndeletarOutros_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("id_view") = "Deletou Outros"
        SqlLogAlteraCandidato.Insert()
    End Sub

End Class


