Imports CRUD
Partial Class BSC
    Inherits System.Web.UI.Page

    Protected Sub btnIncluirVisao_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIncluirVisao.Click
        MtvVisao.ActiveViewIndex = 0
        LblIncluirVisao.Text = "Incluir Visão"
        CRUD.Limpa(ViewIncluirVisao)
    End Sub

    Protected Sub btnGravar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGravar.Click
        MtvVisao.ActiveViewIndex = 0
        If LblIncluirVisao.Text = "Incluir Visão" Then
            SdsGridVisao.Insert()
        Else
            SdsGridVisao.Update()
        End If
        grdVisao.DataBind()
        MtvVisao.ActiveViewIndex = 1
    End Sub

    Protected Sub btnAlterarVisao_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterarVisao.Click
        If grdVisao.SelectedIndex >= 0 Then
            MtvVisao.ActiveViewIndex = 0
            LblIncluirVisao.Text = "Alterar Visão"
            CRUD.Popula(ViewIncluirVisao, sdsVisao)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim oFuncionario As New Funcionario
        oFuncionario.PegaUnidadeLotacao(Session("c_Matricula"))
        Session("CentroCusto") = oFuncionario.UnidadeNegocio
        oFuncionario.Close()
    End Sub

    Protected Sub grdVisao_Databound(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdVisao.DataBound
        For c = 0 To grdVisao.Rows.Count - 1
            grdVisao.Rows.Item(c).Cells.Item(7).Visible = False
            If grdVisao.Rows.Item(c).Cells.Item(7).Text = "ACHEI" Then
                grdVisao.Rows.Item(c).Cells.Item(8).Enabled = False
            Else
                grdVisao.Rows.Item(c).Cells.Item(8).Enabled = True
            End If
        Next
    End Sub

    Protected Sub btnVoltar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltar.Click
        grdVisao.DataBind()
        MtvVisao.ActiveViewIndex = Menu1.SelectedValue
    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        MtvVisao.ActiveViewIndex = Menu1.SelectedValue
    End Sub

    Protected Sub BtnOcultarCC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnOcultarCC.Click
        If GridGFCcusto.Visible = True Then
            BtnOcultarCC.Text = "Reexibir"
            GridGFCcusto.Visible = False
        Else
            BtnOcultarCC.Text = "Ocultar"
            GridGFCcusto.Visible = True
        End If
    End Sub

    Protected Sub BtnGravarCC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnGravarCC.Click
        'MsgBox(DDLColuna.Text)
        'MsgBox(DDLConta.Text)

        'cria e instancia uma variável do tipo StrinfBuilder para concatenar os registros

        Dim str As StringBuilder = New StringBuilder
        Dim i As Integer = 0

        'Laço que percorre todas as linhas do grid
        BtnGravarCC.Enabled = False
        LblProcesso.Text = "Aguarde término do processamento..."

        While i < GridGFCcusto.Rows.Count
            'Variável do tipo GridViewRow recebe a linha específica do GridView
            Dim row As GridViewRow = GridGFCcusto.Rows(i)
            'A variável booleana recebe true se o checkbox desse registro estiver marcado
            Dim isChecked As Boolean = CType(row.FindControl("chkSelect"), CheckBox).Checked

            If isChecked Then
                str.Append(GridGFCcusto.Rows(i).Cells(2).Text)
                str.Append(",")
                LblCcusto.Text = GridGFCcusto.Rows(i).Cells(2).Text
                'Gravando registro '
                SDSContaCC.Insert()
                GrdContaCC.DataBind()
            End If
            i += 1
        End While
        LblInfo.Text = str.ToString
        GridGFCcusto.DataBind()
        GrdVisaoGrupoFinanc.DataBind()
        LblProcesso.Text = "Registros atualizados com sucesso ..."
    End Sub

    Protected Sub GrdConta_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GrdContaCC.RowDeleting
        GrdContaCC.DataBind()
        GrdVisaoGrupoFinanc.DataBind()
        GridGFCcusto.DataBind()
    End Sub

    Protected Sub GrdVisaoGrupoFinanc_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GrdVisaoGrupoFinanc.DataBound
        LblProcesso.Text = "Escolha uma Conta Contábil !!!"
        BtnGravarCC.Enabled = True
        For c = 0 To GrdVisaoGrupoFinanc.Rows.Count - 1
            GrdVisaoGrupoFinanc.Rows.Item(c).Cells.Item(5).Visible = False
            If GrdVisaoGrupoFinanc.Rows.Item(c).Cells.Item(5).Text = "ACHEI" Then
                GrdVisaoGrupoFinanc.Rows.Item(c).Cells.Item(6).Enabled = False
            Else
                GrdVisaoGrupoFinanc.Rows.Item(c).Cells.Item(6).Enabled = True
            End If
        Next
    End Sub

    Protected Sub GrdVisaoGrupoFinanc_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GrdVisaoGrupoFinanc.RowCreated
        grdVisao.DataBind()
    End Sub

    Protected Sub GrdVisaoGrupoFinanc_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GrdVisaoGrupoFinanc.RowDeleted
        GrdVisaoGrupoFinanc.DataBind()
        grdVisao.DataBind()
    End Sub

    Protected Sub BtnGravarGF_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnGravarGF.Click
        If grdVisao.SelectedIndex >= 0 And Not txtGrupoGF.Text = "" Then
            SdsVisaoGrupoFinanc.Insert()
            GrdVisaoGrupoFinanc.DataBind()
        End If
    End Sub

    Protected Sub GrdVisaoGrupoFinanc_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GrdVisaoGrupoFinanc.SelectedIndexChanged
        BtnApagaConta.Visible = True
        If GrdVisaoGrupoFinanc.SelectedIndex >= 0 Then
            TxtIDGF.Text = GrdVisaoGrupoFinanc.SelectedRow.Cells.Item(3).Text
            GridConsultaContas.DataBind()
            GridGFCcusto.DataBind()
            grdVisao.DataBind()
            Session("IDVisao") = grdVisao.SelectedRow.Cells.Item(1).Text
            Session("IDGrupoFinanc") = GrdVisaoGrupoFinanc.SelectedRow.Cells.Item(3).Text
        End If
    End Sub

    Protected Sub SDSGrupoFinanceiro_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles SDSGrupoFinanceiro.DataBinding
        BtnGravarCC.Enabled = True
    End Sub

    Protected Sub DDLContaCC_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLContaCC.SelectedIndexChanged
        LblProcesso.Text = "Escolha um ou mais Centros de Custo !!!"
        BtnGravarCC.Enabled = True
    End Sub

    Protected Sub txtFiltroCta_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtFiltroCta.TextChanged
        LblProcesso.Text = "Escolha o(s) Centro(s) de Custo !!!"
        DDLContaCC.DataBind()
    End Sub

    Protected Sub btnIncluirGrpFin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIncluirGrpFin.Click
        MtvVisao.ActiveViewIndex = 5
        LblIncluirGrpFin.Text = "Incluir Grupo Financeiro"
        CRUD.Limpa(ViewIncluirGrupoFin)
    End Sub

    Protected Sub btnGravarGrpFin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGravarGrpFin.Click
        MtvVisao.ActiveViewIndex = 5
        If LblIncluirGrpFin.Text = "Incluir Grupo Financeiro" Then
            SdsGridGrpFinanc.Insert()
        Else
            SdsGridGrpFinanc.Update()
        End If
        grdVisao.DataBind()
        MtvVisao.ActiveViewIndex = Menu1.SelectedValue
    End Sub

    Protected Sub btnVoltarGrpFin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVoltarGrpFin.Click
        GrdGrupoFinanc.DataBind()
        MtvVisao.ActiveViewIndex = Menu1.SelectedValue
    End Sub

    Protected Sub GrdGrupoFinanc_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GrdGrupoFinanc.DataBound
        For c = 0 To GrdGrupoFinanc.Rows.Count - 1
            GrdGrupoFinanc.Rows.Item(c).Cells.Item(3).Visible = False
            If GrdGrupoFinanc.Rows.Item(c).Cells.Item(3).Text = "ACHEI" Then
                GrdGrupoFinanc.Rows.Item(c).Cells.Item(4).Enabled = False
            Else
                GrdGrupoFinanc.Rows.Item(c).Cells.Item(4).Enabled = True
            End If
        Next
    End Sub

    Protected Sub btnAlterarGrpFin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterarGrpFin.Click
        If GrdGrupoFinanc.SelectedIndex >= 0 Then
            MtvVisao.ActiveViewIndex = 5
            LblIncluirGrpFin.Text = "Alterar Grupo Financeiro"
            CRUD.Popula(ViewIncluirGrupoFin, SdsPopulaGrpFinanc)
        End If
    End Sub

    Protected Sub GrdGrupoFinanc_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GrdGrupoFinanc.RowDeleted
        SDSGrupoFinanceiro.DataBind()
        SdsGrupoFinancCC.DataBind()
    End Sub
    Protected Sub ImageButton1_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        GridConsultaContas.DataBind()
    End Sub

    Protected Sub BtnListaCc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnListaCc.Click
        GridConsultaCcusto.DataBind()
        TxtIDCt.Text = GridConsultaContas.SelectedRow.Cells.Item(5).Text
        GridConsultaCcusto.DataBind()
    End Sub

    Protected Sub GridConsultaContas_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridConsultaContas.RowDeleted
        GridConsultaCcusto.DataBind()
        GridConsultaContas.DataBind()
    End Sub
    Protected Sub GridConsultaContas_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridConsultaContas.SelectedIndexChanged
        BtnApagaConta.Visible = True
        TxtIDCt.Text = GridConsultaContas.SelectedRow.Cells.Item(5).Text
        GridConsultaCcusto.DataBind()
    End Sub

    Protected Sub BtnListaCt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnListaCt.Click
        GridConsultaContas.DataBind()
        TxtIDGF.Text = GrdVisaoGrupoFinanc.SelectedRow.Cells.Item(3).Text
        GridConsultaContas.DataBind()
    End Sub

    Protected Sub BtnApagaConta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnApagaConta.Click
        If GridConsultaContas.SelectedIndex >= 0 Then
            TxtIDGF.Text = GrdVisaoGrupoFinanc.SelectedRow.Cells.Item(3).Text
            TxtIDCt.Text = GridConsultaContas.SelectedRow.Cells.Item(5).Text
            SDSGridConta.Delete()
            TxtIDCt.Text = GridConsultaContas.SelectedRow.Cells.Item(5).Text
            GridConsultaContas.DataBind()
            GridConsultaCcusto.DataBind()
            BtnApagaConta.Visible = False
        End If
    End Sub

    Protected Sub chkSelect_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub grdVisao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdVisao.SelectedIndexChanged
        If grdVisao.SelectedIndex >= 0 Then
            txtVisaoGF.Text = grdVisao.SelectedRow.Cells.Item(3).Text
            txtVisaoGF0.Text = grdVisao.SelectedRow.Cells.Item(3).Text
        End If
        GrdVisaoGrupoFinanc.DataBind()
    End Sub

    Protected Sub GrdGrupoFinanc_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GrdGrupoFinanc.SelectedIndexChanged
        If GrdGrupoFinanc.SelectedIndex >= 0 Then
            txtGrupoGF.Text = GrdGrupoFinanc.SelectedRow.Cells.Item(2).Text
            txtGrupoGF0.Text = GrdGrupoFinanc.SelectedRow.Cells.Item(2).Text
            Session("IdGrupoFinanc") = GrdGrupoFinanc.SelectedRow.Cells.Item(1).Text
        End If
        GrdVisaoGrupoFinanc.DataBind()
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If GridConsultaContas.SelectedIndex >= 0 Then
            BtnApagaConta.Visible = True
        Else
            BtnApagaConta.Visible = False
        End If
    End Sub

    Protected Sub GrdContaCC_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GrdContaCC.SelectedIndexChanged
        GridConsultaContas.DataBind()
        GridConsultaCcusto.DataBind()
    End Sub
End Class