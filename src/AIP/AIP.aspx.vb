Partial Class AIP
    Inherits System.Web.UI.Page
    Dim CalculadoEstab As Boolean
    Dim CalculadoCompet As Boolean
    Dim CalculadoMunic As Boolean
    Dim CalculadoReceita As Boolean
    Dim CalculadoDespesa As Boolean
    Dim CalculadoArea As Boolean
    Dim totalEstab As Decimal
    Dim totalCompet As Decimal
    Dim totalMunic As Decimal
    Dim totalReceita As Decimal
    Dim totalDespesa As Decimal
    Dim totalAreaConhec As Decimal
    Dim MargemContrib As Decimal
    Dim Resultado As Decimal

    Protected Sub MenuProjeto_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles MenuProjeto.MenuItemClick
        If Len(RTrim(txtUnidLotac.Text)) = 0 Then
            Dim oFuncionario As New Funcionario
            oFuncionario.PegaUnidadeLotacao(Session("c_Matricula"))
            Session("CentroCusto") = oFuncionario.UnidadeNegocio
            LabelMatric.Text = Session("c_Matricula")
            LabelUnidLotac.Text = Session("CentroCusto")
            txtUnidLotac.Text = Session("CentroCusto")
            oFuncionario.Close()
        End If

        Select Case e.Item.Value
            Case "0"
                botaoIncluir.Visible = True
                MultiView1.ActiveViewIndex = 0
                txtCodigoprojeto.Enabled = True
                Exit Select
            Case "1"
                Session("_modo") = "Alterar"
                txtCodigoprojeto.Enabled = False
                botaoIncluir.Visible = False
                MultiView1.ActiveViewIndex = 1
                Exit Select
            Case "2"
                botaoIncluir.Visible = False
                MultiView1.ActiveViewIndex = 2
                Exit Select
            Case "3"
                botaoIncluir.Visible = False
                MultiView1.ActiveViewIndex = 3
                lblMargem.Text = FormatPercent((0).ToString)
                lblResult.Text = FormatCurrency((0).ToString)
                Exit Select
            Case "4"
                botaoIncluir.Visible = False
                MultiView1.ActiveViewIndex = 5
                Exit Select
            Case "5"
                botaoIncluir.Visible = False
                MultiView1.ActiveViewIndex = 4
                Exit Select
        End Select
        GridCidade.DataBind()
        GridCidade0.DataBind()
        GridEstabelec.DataBind()
        GridEstabelec0.DataBind()
        GridCompetencia.DataBind()
        GridCompetencia0.DataBind()
        GridAreaConhec.DataBind()
        GridAreaConhec0.DataBind()
        GridViewDespesas.DataBind()
        GridViewReceita.DataBind()
        GridInterdepend.DataBind()
        GridRisco.DataBind()
        GridViewCronograma.DataBind()
        GridViewProjetos.DataBind()
    End Sub

    Protected Sub GridViewProjetos_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewProjetos.RowDataBound
        botaoIncluir.Enabled = True
        For c = 0 To GridViewProjetos.Rows.Count - 1
            If CType(GridViewProjetos.Rows(c).FindControl("ImageButton4"), Image).ImageUrl = "~/Icones/cancela_desligado.png" Then
                GridViewProjetos.Rows.Item(c).Cells.Item(10).Enabled = False
                GridViewProjetos.Rows.Item(c).Cells.Item(10).ToolTip = "Projeto não integrado ao EPM"
            Else
                GridViewProjetos.Rows.Item(c).Cells.Item(10).Enabled = True
                GridViewProjetos.Rows.Item(c).Cells.Item(10).ToolTip = "Clique no link para abrir o projeto dentro do EPM"
            End If

            If GridViewProjetos.Rows.Item(c).Cells.Item(12).Text = "SIM" Then
                GridViewProjetos.Rows.Item(c).Cells.Item(9).Enabled = False
                CType(GridViewProjetos.Rows(c).FindControl("BtnIntegra"), ImageButton).ImageUrl = "~/Icones/confirmar.png"
                GridViewProjetos.Rows.Item(c).Cells.Item(9).ToolTip = "Projeto já integrado ao Datasul"
            Else
                GridViewProjetos.Rows.Item(c).Cells.Item(9).Enabled = True
                CType(GridViewProjetos.Rows(c).FindControl("BtnIntegra"), ImageButton).ImageUrl = "~/Icones/grid_salvar.gif"
                GridViewProjetos.Rows.Item(c).Cells.Item(9).ToolTip = "Clique no link para integrar o projeto ao Datasul"
            End If
            GridViewProjetos.Rows.Item(c).Cells.Item(12).Visible = False
        Next
    End Sub
    Protected Sub GridViewProjetos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewProjetos.SelectedIndexChanged

        Dim idproj As String
        Session("id_projeto") = GridViewProjetos.SelectedValue
        idproj = Session("id_projeto")

        If GridViewProjetos.SelectedIndex >= 0 Then
            MenuProjeto.Enabled = True
        Else
            MenuProjeto.Enabled = False
        End If

        If Not Page.IsPostBack Then CRUD.Limpa(View2)        

        CRUD.Popula(View2, SqlProjeto)
        txtId_projeto0.Text = txtCodigoprojeto.Text
        txtnomeprojeto0.Text = txtTituloprojeto.Text

        'lblmensagemProjeto.Text = ""
        'lblmensagemProjeto0.Text = ""
    End Sub
    Protected Sub botaoIncluirProjeto_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirProjeto.Click
        'INCLUIR
        Try
            botaoIncluirProjeto.Visible = True
            SqlProjeto.Insert()
            Cria_Historico(Int(Session("id_projeto")), "Inclusão de novo projeto.", Session("c_nome"))
            txtId_projeto0.Visible = True
            txtnomeprojeto0.Visible = True
            botaoIncluir.Visible = True
            Label1.Visible = True
            SqlGridProjetos.DataBind()
            GridViewProjetos.DataBind()
            MultiView1.ActiveViewIndex = 0
        Catch ex As Exception
            'lblmensagemProjeto.Text = "Projeto já inserido com este nome, favor escolher outro nome"
            lblmensagemProjeto.Text = ex.Message.ToString
        End Try
        txtId_projeto0.Visible = True
        txtnomeprojeto0.Visible = True
        botaoIncluir.Visible = True
        Label1.Visible = True
    End Sub

    Protected Sub botaoAlterarProjeto_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAlterarProjeto.Click
        'ALTERAR
        Try
            MultiView1.ActiveViewIndex = 1
            SqlProjeto.Update()
            Cria_Historico(Int(Session("id_projeto")), "Alteração dos dados do projeto.", Session("c_Nome"))
            txtId_projeto0.Visible = True
            txtnomeprojeto0.Visible = True
            botaoIncluir.Visible = True
            Label1.Visible = True
            SqlGridProjetos.DataBind()
            GridViewProjetos.DataBind()
            MultiView1.ActiveViewIndex = 0
        Catch ex As Exception
            'lblmensagemProjeto.Text = "Não foi possível alterar o projeto, favor verificar todos os campos obrigatórios"
            lblmensagemProjeto.Text = ex.Message.ToString
        End Try
        txtId_projeto0.Visible = True
        txtnomeprojeto0.Visible = True
        botaoIncluir.Visible = True
        Label1.Visible = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblmensagemProjeto.Text = ""
        lblmensagemProjeto0.Text = ""
        If Len(RTrim(txtUnidLotac.Text)) = 0 Then
            Dim oFuncionario As New Funcionario
            oFuncionario.PegaUnidadeLotacao(Session("c_Matricula"))
            Session("CentroCusto") = oFuncionario.UnidadeNegocio
            LabelMatric.Text = Session("c_Matricula")
            LabelUnidLotac.Text = Session("CentroCusto")
            txtUnidLotac.Text = Session("CentroCusto")
            oFuncionario.Close()
        End If

    End Sub
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Len(RTrim(txtUnidLotac.Text)) = 0 Then
            Dim oFuncionario As New Funcionario
            oFuncionario.PegaUnidadeLotacao(Session("c_Matricula"))
            Session("CentroCusto") = oFuncionario.UnidadeNegocio
            LabelMatric.Text = Session("c_Matricula")
            LabelUnidLotac.Text = Session("CentroCusto")
            txtUnidLotac.Text = Session("CentroCusto")
            oFuncionario.Close()
        End If

        If GridViewProjetos.SelectedIndex >= 0 Then
            MenuProjeto.Enabled = True
        Else
            MenuProjeto.Enabled = False
        End If

        GridViewProjetos.DataBind()

        'Desabilita os dois botões, para depois habilitar o necessário
        botaoAlterarProjeto.Visible = False
        botaoIncluirProjeto.Visible = False
        If Session("_modo") = "Alterar" Then
            'ALTERAR
            Session("id_projeto") = GridViewProjetos.SelectedValue
            CRUD.Popula(View2, SqlProjeto)
            botaoAlterarProjeto.Visible = True
        ElseIf Session("_modo") = "Incluir" Then
            'INCLUIR()
            If Not Page.IsPostBack Then CRUD.Limpa(View2)
            botaoIncluirProjeto.Visible = True
        End If
    End Sub
    Protected Sub botaoVoltar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoVoltar.Click
        botaoIncluirProjeto.Visible = True
        txtId_projeto0.Visible = True
        txtnomeprojeto0.Visible = True
        botaoIncluir.Visible = True
        Label1.Visible = True
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub botaoIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluir.Click
        Session("_modo") = "Incluir"
        Session("Id_Projeto") = "0"
        MultiView1.ActiveViewIndex = 1
        txtUnidLotac.Text = Session("CentroCusto")
        CRUD.Limpa(View2)
        txtId_projeto0.Visible = False
        txtnomeprojeto0.Visible = False
        botaoIncluir.Visible = False
        Label1.Visible = False
    End Sub
    Protected Sub ImageButton1_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            SqlGridProjetos.Delete()
            SqlGridProjetos.DataBind()
        Catch ex As Exception
            lblmensagemProjeto0.Text = "Projeto não pode ser excluído, antes dos itens relacionados"
        End Try
    End Sub
    Protected Sub botaoIncluirReceita_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirReceita.Click
        SdsReceitas.Insert()
        GridViewReceita.DataBind()
        Cria_Historico(Int(Session("id_projeto")), "Inclusão de dados de receitas do projeto.", Session("c_nome"))
        CRUD.Limpa(View3)
    End Sub
    Protected Sub botaoIncluirDespesas_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirDespesas.Click
        SdsDespesas.Insert()
        GridViewDespesas.DataBind()
        Cria_Historico(Int(Session("id_projeto")), "Inclusão de dados de despesas do projeto.", Session("c_nome"))
        CRUD.Limpa(View4)
    End Sub
    Protected Sub botaoIncluirCalendario_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirCalendario.Click
        SdsCronograma.Insert()
        GridViewCronograma.DataBind()
        Cria_Historico(Int(Session("id_projeto")), "Inclusão de dados do cronograma do projeto.", Session("c_nome"))
        CRUD.Limpa(View5)
    End Sub
    Protected Sub cboId_Estado_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlId_Estado.SelectedIndexChanged
        ddlId_Municipio.DataBind()
    End Sub
    Protected Sub cboId_Estado_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlId_Estado.TextChanged
        ddlId_Municipio.DataBind()
    End Sub
    Protected Sub BtnIncluiRisco_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles BtnIncluiRisco.Click
        SqlRisco.Insert()
        GridRisco.DataBind()
        Cria_Historico(Int(Session("id_projeto")), "Inclusão de dados de riscos do projeto.", Session("c_nome"))
        CRUD.Limpa(View6)
    End Sub
    Protected Sub BtnIncluiInterdepend_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles BtnIncluiInterdepend.Click
        SqlInterdepend.Insert()
        GridInterdepend.DataBind()
        Cria_Historico(Int(Session("id_projeto")), "Inclusão de dados de interdependências com outro projeto.", Session("c_nome"))
        CRUD.Limpa(View6)
    End Sub

    Protected Sub botaoIncluirEstab_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirEstab.Click
        txtCodigoprojeto.Enabled = True
        Try
            lblEstabelecErro.Text = ""
            SdsEstabelec.Insert()
            Cria_Historico(Int(Session("id_projeto")), "Inclusão de novo estabelecimento para o projeto.", Session("c_nome"))
        Catch ex As Exception
            lblEstabelecErro.Text = ex.Message
            lblEstabelecErro.Text = "Estabelecimento já amarrado a este projeto."
        End Try
        GridEstabelec.DataBind()
        GridEstabelec0.DataBind()
    End Sub

    Protected Sub ddlId_Estabelec_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlId_Estabelec.SelectedIndexChanged
        lblEstabelecErro.Text = ""
    End Sub

    Protected Sub botaoIncluirCompetencia_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirCompetencia.Click
        Try
            lblCompetenciaErro.Text = ""
            SqlCompetencia.Insert()
            Cria_Historico(Int(Session("id_projeto")), "Inclusão de competência do projeto.", Session("c_nome"))
        Catch ex As Exception
            lblCompetenciaErro.Text = ex.Message
            lblCompetenciaErro.Text = "Competência já amarrada a este projeto."
        End Try
        GridCompetencia.DataBind()
        GridCompetencia0.DataBind()
    End Sub

    Protected Sub ddlId_competencia_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlId_competencia.SelectedIndexChanged
        lblCompetenciaErro.Text = ""
    End Sub

    Protected Sub botaoIncluirCidade_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirCidade.Click
        Try
            lblCidadeErro.Text = ""
            SqlGridMunicipio.Insert()
            Cria_Historico(Int(Session("id_projeto")), "Inclusão de município do projeto.", Session("c_nome"))
        Catch ex As Exception
            lblCidadeErro.Text = ex.Message
            lblCidadeErro.Text = "Cidade já amarrada a este projeto."
        End Try
        GridCidade.DataBind()
        GridCidade0.DataBind()
    End Sub

    Protected Sub cboId_Municipio_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlId_Municipio.SelectedIndexChanged
        lblCidadeErro.Text = ""
    End Sub

    Dim TotalPercent As Decimal = 0.0
    Function GetPercentTotal(ByVal Percent As Decimal) As Decimal
        TotalPercent += Percent
        Return Percent
    End Function
    Function GetTotal() As Decimal
        Return TotalPercent
    End Function

    Protected Sub GridCidade_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridCidade.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoMunic Then
                totalMunic += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(Percentual)", "")
                CalculadoMunic = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lblMunic As Label
            lblMunic = e.Row.FindControl("lblTotalPercentMunic")
            lblMunic.Text = String.Format("{0:n}", totalMunic)
        End If

    End Sub

    Protected Sub GridCompetencia_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridCompetencia.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoCompet Then
                totalCompet += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(Percentual)", "")
                CalculadoCompet = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lblCompet As Label
            lblCompet = e.Row.FindControl("LblTotalCompet")
            lblCompet.Text = String.Format("{0:n}", totalCompet)
        End If

    End Sub

    Protected Sub GridEstabelec_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEstabelec.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoEstab Then
                totalEstab += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(Percentual)", "")
                CalculadoEstab = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lblEstab As Label
            lblEstab = e.Row.FindControl("LblTotalEstabelec")
            lblEstab.Text = String.Format("{0:n}", totalEstab)
        End If

    End Sub

    Protected Sub GridCidade0_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridCidade0.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoMunic Then
                totalMunic += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(Percentual)", "")
                CalculadoMunic = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lblMunic As Label
            lblMunic = e.Row.FindControl("lblTotalPercCidade")
            lblMunic.Text = String.Format("{0:n}", totalMunic)
        End If

    End Sub

    Protected Sub GridCompetencia0_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridCompetencia0.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoCompet Then
                totalCompet += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(Percentual)", "")
                CalculadoCompet = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lblCompet As Label
            lblCompet = e.Row.FindControl("lblTotalCompet")
            lblCompet.Text = String.Format("{0:n}", totalCompet)
        End If

    End Sub

    Protected Sub GridEstabelec0_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEstabelec0.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoEstab Then
                totalEstab += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(Percentual)", "")
                CalculadoEstab = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lblEstab As Label
            lblEstab = e.Row.FindControl("LblTotPercEstab")
            lblEstab.Text = String.Format("{0:n}", totalEstab)
        End If

    End Sub

    Protected Sub GridViewReceita_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewReceita.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoReceita Then
                totalReceita += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(ValorReceita)", "")
                CalculadoReceita = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            lblMargem.Text = FormatPercent((0).ToString)
            lblResult.Text = FormatCurrency((0).ToString)
            Dim lblreceita As Label
            lblreceita = e.Row.FindControl("LblTotalReceita")
            lblreceita.Text = String.Format("{0:c}", totalReceita)
        End If
        lblResult.Text = FormatCurrency((totalReceita - totalDespesa).ToString)

        If (totalReceita > 0) Then
            lblMargem.Text = FormatPercent((totalReceita - totalDespesa) / totalReceita, 2)
        ElseIf totalReceita = 0 Then
            lblMargem.Text = FormatPercent("0", 2)
        End If

    End Sub

    Protected Sub GridViewDespesas_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewDespesas.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblMargem.Text = FormatPercent((0).ToString)
            lblResult.Text = FormatCurrency((0).ToString)
            If Not CalculadoDespesa Then
                totalDespesa += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(ValorDespesa)", "")
                CalculadoDespesa = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lbldespesa As Label
            lbldespesa = e.Row.FindControl("LblTotalDespesa")
            lbldespesa.Text = String.Format("{0:c}", totalDespesa)
        End If
        lblResult.Text = FormatCurrency((totalReceita - totalDespesa).ToString)
        If (totalReceita > 0) Then
            lblMargem.Text = FormatPercent((totalReceita - totalDespesa) / totalReceita, 2)
        ElseIf totalReceita = 0 Then
            lblMargem.Text = FormatPercent("0", 2)
        End If
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        sdsIntegracao.Insert()
        GridViewProjetos.DataBind()
    End Sub

    Protected Sub botaoIncluirAreaConhec_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoIncluirAreaConhec.Click
        Try
            lblAreaConhec0.Text = ""
            SqlGridAreaConhec.Insert()
        Catch ex As Exception
            lblAreaConhec0.Text = ex.Message
            lblAreaConhec0.Text = "Área de Conhecimento já amarrada a este projeto."
        End Try
        GridAreaConhec.DataBind()
        GridAreaConhec0.DataBind()
    End Sub

    Protected Sub GridAreaConhec0_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridAreaConhec0.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoArea Then
                totalAreaConhec += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(Percentual)", "")
                CalculadoArea = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lblAreaConhec As Label
            lblAreaConhec = e.Row.FindControl("LblTotalAreaConhec")
            lblAreaConhec.Text = String.Format("{0:n}", totalAreaConhec)
        End If
    End Sub

    Protected Sub GridAreaConhec_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridAreaConhec.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoArea Then
                totalAreaConhec += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(Percentual)", "")
                CalculadoArea = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lblAreaConhec As Label
            lblAreaConhec = e.Row.FindControl("LblTotalAreaConhecim")
            lblAreaConhec.Text = String.Format("{0:n}", totalAreaConhec)
        End If
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            Cria_Historico(Int(Session("id_projeto")), "Exclusão do projeto.", Session("c_usuario"))
            SqlGridProjetos.Delete()
            txtId_projeto0.Text = ""
            txtnomeprojeto0.Text = ""
        Catch ex As Exception
            lblmensagemProjeto0.Text = "Projeto não pode ser excluído, antes dos itens relacionados"
        End Try
        SqlGridProjetos.DataBind()
        GridCidade.DataBind()
        GridCidade0.DataBind()
        GridEstabelec.DataBind()
        GridEstabelec0.DataBind()
        GridCompetencia.DataBind()
        GridCompetencia0.DataBind()
        GridAreaConhec.DataBind()
        GridAreaConhec0.DataBind()
        GridViewDespesas.DataBind()
        GridViewReceita.DataBind()
        GridInterdepend.DataBind()
        GridRisco.DataBind()
        GridViewCronograma.DataBind()
    End Sub

    Protected Sub txtCodProj_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCodProj.TextChanged
        GridViewProjetos.DataBind()
    End Sub

    Protected Sub txtTitProj_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtTitProj.TextChanged
        GridViewProjetos.DataBind()
    End Sub

    Protected Sub txtCCustoProj_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCCustoProj.TextChanged
        GridViewProjetos.DataBind()
    End Sub

    Protected Sub CboStatusProj_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CboStatusProj.SelectedIndexChanged
        SqlGridProjetos.DataBind()
    End Sub
    Public Sub Cria_Historico(ByVal pid_Projeto As Integer, ByVal pAcao As String, ByVal pUsuario As String)
        Dim Vid_projeto As SqlParameter = New SqlParameter
        Dim VAcao As SqlParameter = New SqlParameter
        Dim vUsuario As SqlParameter = New SqlParameter
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
        Dim s As String = ""
        Dim sSql As String = "EXECUTE cria_historico_aip @pid_Projeto,@pAcao,@pUsuario"
        Dim oCmd As New SqlCommand(sSql, conn)

        Vid_projeto.ParameterName = "pid_Projeto"
        VAcao.ParameterName = "pAcao"
        vUsuario.ParameterName = "pUsuario"

        Vid_projeto.Value = pid_Projeto
        Vid_projeto.DbType = DbType.Int32

        VAcao.Value = pAcao
        VAcao.DbType = DbType.String

        vUsuario.Value = pUsuario
        vUsuario.DbType = DbType.String

        oCmd.Parameters.Add(Vid_projeto)
        oCmd.Parameters.Add(VAcao)
        oCmd.Parameters.Add(vUsuario)
        oCmd.Connection.Open()


        oCmd.ExecuteNonQuery()

        oCmd.Dispose()
        conn.Close()

        Return
    End Sub

    Protected Sub ImageButton1_Click2(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Cria_Historico(Int(Session("id_projeto")), "Exclusão de estabelecimento do projeto.", Session("c_nome"))
    End Sub

    Protected Sub ImageButton1_Click3(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Cria_Historico(Int(Session("id_projeto")), "Exclusão de competência do projeto.", Session("c_nome"))
    End Sub

    Protected Sub ImageButton1_Click4(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Cria_Historico(Int(Session("id_projeto")), "Exclusão de município do projeto.", Session("c_nome"))
    End Sub

    Protected Sub ImageButton1_Click5(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Cria_Historico(Int(Session("id_projeto")), "Exclusão de dados de receitas do projeto.", Session("c_nome"))
    End Sub

    Protected Sub ImageButton1_Click6(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Cria_Historico(Int(Session("id_projeto")), "Exclusão de dados de despesas do projeto.", Session("c_nome"))
    End Sub

    Protected Sub ImageButton1_Click7(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Cria_Historico(Int(Session("id_projeto")), "Exclusão de dados do cronograma do projeto.", Session("c_nome"))
    End Sub

    Protected Sub ImageButton1_Click8(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Cria_Historico(Int(Session("id_projeto")), "Exclusão de dados de riscos do projeto.", Session("c_nome"))
    End Sub

    Protected Sub ImageButton1_Click9(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Cria_Historico(Int(Session("id_projeto")), "Exclusão de dados de interdependências com outro projeto.", Session("c_nome"))
    End Sub
End Class
