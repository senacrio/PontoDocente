Imports Dados
Imports CRUD2
Imports System.Web.UI.WebControls
Partial Class AdmVagaRetorno
    Inherits System.Web.UI.Page

    Protected Sub botaoAdmVagas_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botaoAdmVagas.Click

        Dim parempresa, parCnpj, parmodalidade, paridentificador, parAtivada As New Parameter
        Dim parvaga, parescolaridade, parmunicipio, pardata, pardata2 As New Parameter

        Sqlvagas.SelectParameters.Clear()

        parVaga.Name = "id_vaga"
        If txtvaga.Text.Length = 0 Then
            parVaga.DefaultValue = "%"
        Else
            parVaga.DefaultValue = txtvaga.Text
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
        If txtdatinicio.Text.Length = 0 Then
            pardata.DefaultValue = "%"
        Else
            pardata.DefaultValue = txtdatinicio.Text
        End If
        Sqlvagas.SelectParameters.Add(pardata)

        pardata2.Name = "dtfim"
        If txtdatfim.Text.Length = 0 Then
            pardata2.DefaultValue = "%"
        Else
            pardata2.DefaultValue = txtdatfim.Text
        End If
        Sqlvagas.SelectParameters.Add(pardata2)

        parAtivada.Name = "ativada"
        parAtivada.DefaultValue = rdAtivada.SelectedValue
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

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick

        Select Case e.Item.Value
            Case "0"
                MultiView1.ActiveViewIndex = 0
                Session("id_vaga") = GridVaga.SelectedValue
                Exit Select
            Case "1"


                If GridVaga.SelectedIndex < 0 Then
                    MultiView1.ActiveViewIndex = 0
                    lblaviso.Text = "Por favor, efetuar busca de vaga."
                Else
                    MultiView1.ActiveViewIndex = 1
                End If
                Exit Select
            Case "2"
                If DetailsView1.SelectedValue < 0 Then
                    MultiView1.ActiveViewIndex = 1
                    lblaviso.Text = "Por favor, selecionar a vaga."
                Else
                    MultiView1.ActiveViewIndex = 2
                End If
                Exit Select
            Case "3"
                If Gridcandidato.SelectedIndex < 0 Then
                    MultiView1.ActiveViewIndex = 2
                    lblaviso.Text = "Não há candidatos para essa vaga."
                Else
                    MultiView1.ActiveViewIndex = 3

                End If
                Exit Select
            Case "4"
                If GridEntrevista.SelectedIndex < 0 Then
                    MultiView1.ActiveViewIndex = 3
                    lblaviso.Text = "Por favor, selecionar uma entrevista."
                Else
                    MultiView1.ActiveViewIndex = 4
                    If cboid_statusEntrevista.SelectedIndex < 0 Then
                        cboid_statusEntrevista.SelectedValue = "Selecione"
                    End If
                End If

            Case "5"
                If GridEntrevistaEmp.SelectedIndex < 0 Then
                    MultiView1.ActiveViewIndex = 4
                    lblaviso.Text = "Por favor, selecionar a entrevista."
                Else
                    MultiView1.ActiveViewIndex = 5
                End If

                Exit Select


        End Select

    End Sub

    Protected Sub GridVaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridVaga.SelectedIndexChanged

        Session("id_vaga") = GridVaga.SelectedValue
        MultiView1.ActiveViewIndex = 2

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dteNow As Date = Now()

        datdataretorno.Text = dteNow

        Session("_modo") = "Incluir"

        If GridEntrevistaEmp.SelectedIndex < 1 Then
            PanelEntrevistaEmp.Visible = False
        Else
            PanelEntrevistaEmp.Visible = True
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

    Protected Sub btnCandidatos_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        Dim oVaga As New Vagas

        oVaga.Vaga(Session("id_vaga"))

        Session("id_vaga") = oVaga.Vaga(Session("id_vaga"))
        

        MultiView1.ActiveViewIndex = 3

        If Gridcandidato.SelectedIndex < 1 Then
            MultiView1.ActiveViewIndex = 3
        Else
            MultiView1.ActiveViewIndex = 4
        End If


    End Sub

    Protected Sub Gridcandidato_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridCandidato.SelectedIndexChanged
        Dim oVaga As New Vagas

        oVaga.PossuiVaga(Session("id_vagacandidato"))

        Session("id_vagacandidato") = oVaga.PossuiVaga(Session("id_vagacandidato"))

        MultiView1.ActiveViewIndex = 3

    End Sub

    Protected Sub btnViewCandidato_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim oEstudantes As New Estudantes
        Dim oRow As TableCellCollection

        If Gridcandidato.SelectedIndex < 0 Then
            lblaviso.Text = "Por favor selecione um candidato da lista"
        Else
            oRow = Gridcandidato.Rows(Gridcandidato.SelectedIndex).Cells
            Session("id_candidato") = Gridcandidato.SelectedValue
            Session("id_candidato") = oRow.Item(5).Text
            Session("Estudanteidentificador") = oRow.Item(3).Text

            oEstudantes.PegaRegistroCLICK(Session("EstudanteIdentificador"))

            Response.Redirect("candidatos.aspx")
        End If

    End Sub

    Protected Sub GridEntrevista_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevista.SelectedIndexChanged
        Session("_modo") = "Alterar"
        Session("id_entrevista") = GridEntrevista.SelectedIndex
        MultiView1.ActiveViewIndex = 4
        GridEntrevista.DataBind()
    End Sub

    Protected Sub btnInsereRetorno_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsereRetorno.Click

        SqlGridRetorno.Insert()

        GridRetorno.DataBind()

        MultiView1.ActiveViewIndex = 6

    End Sub

    Protected Sub GridRetorno_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridRetorno.SelectedIndexChanged

        Session("id_entrevista_fk") = GridEntrevistaEmp.SelectedValue

        Dim oRow As TableCellCollection

        If GridRetorno.SelectedIndex < 0 Then
            lblaviso.Text = "Por favor selecione um item da lista"
        Else
            oRow = GridRetorno.Rows(GridRetorno.SelectedIndex).Cells
            Session("id_retorno") = GridRetorno.SelectedValue
            Session("dataatualizacao") = oRow.Item(6).Text
            Session("dataRetorno") = oRow.Item(7).Text

            If Session("dataatualizacao") = Session("dataretorno") Then
                oRow.Item(7).Text = "Teste"
            End If

        End If

    End Sub

    Protected Sub RegsPag_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim _DropDownList As DropDownList = DirectCast(sender, DropDownList)

        Me.GridEntrevistaEmp.PageSize = Integer.Parse(_DropDownList.SelectedValue)
    End Sub

    Protected Sub GridEntrevista_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.Pager Then
            Dim _TotalPags As Label = e.Row.FindControl("lblTotalNumberOfPages")
            _TotalPags.Text = GridEntrevistaEmp.PageCount.ToString
            Dim _IraPag As TextBox = e.Row.FindControl("IraPag")
            _IraPag.Text = (Me.GridEntrevistaEmp.PageIndex + 1).ToString


            Dim _DropDownList As DropDownList = e.Row.FindControl("RegsPag")
            _DropDownList.SelectedValue = Me.GridEntrevistaEmp.PageSize.ToString

        End If
    End Sub
    Protected Sub IraPag(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim _IraPag As TextBox = DirectCast(sender, TextBox)
        Dim _NumPag As Integer

        If Integer.TryParse(_IraPag.Text.Trim, _NumPag) AndAlso _NumPag > 0 AndAlso _NumPag <= Me.GridEntrevistaEmp.PageCount Then
            If Integer.TryParse(_IraPag.Text.Trim, _NumPag) AndAlso _NumPag > 0 AndAlso _NumPag <= Me.GridEntrevistaEmp.PageCount Then
                Me.GridEntrevistaEmp.PageIndex = _NumPag - 1
            Else
                Me.GridEntrevistaEmp.PageIndex = 0
            End If
        End If
    End Sub

    Protected Sub btnInsereEntrevista_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsereEntrevista.Click
        Session("id_vagacandidato") = Gridcandidato.SelectedValue
        SqlGridEntrevista.Insert()
        MultiView1.ActiveViewIndex = 4
        GridEntrevista.DataBind()
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender



        If Session("_modo") = "Alterar" Then

            'ALTERAR
            CRUD.Popula(ViewEntrevistaClick, SqlEntrevistaForm)
            datdataclick.Enabled = False
            horhoraclick.Enabled = False
            cbocaptador.Enabled = False
            PanelEntrevistaEmp.Visible = True
            btnInsereEntrevista.Visible = False
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
            CRUD.Limpa(ViewEntrevistaEmp)
            'cboid_statusEntrevista.Items(1).Enabled = False

            cboid_statusEntrevista.SelectedValue = "9"
            PanelEntrevistaEmp.Visible = False
            datdataclick.Enabled = True
            horhoraclick.Enabled = True
            cbocaptador.Enabled = True
            btnAgendar.Visible = False
            btnInsereEntrevista.Visible = True
            btnatualizaEntrevista.Visible = False
            lblmensagemBotao.Text = "Clique para agendar entrevista"
            datdataclick.Text = ""
            horhoraclick.Text = ""

        End If

    End Sub

    Protected Sub btnatualizaEntrevista_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnatualizaEntrevista.Click
        Session("_modo") = "Alterar"
        If cboid_statusEntrevista.SelectedValue = "1" Then
            PanelEntrevistaEmp.Visible = True
        End If
        SqlEntrevistaForm.Update()

        MultiView1.ActiveViewIndex = 4
        GridEntrevista.DataBind()

    End Sub
    Protected Sub cboid_statusEntrevista_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_statusEntrevista.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 4

    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelar.Click
        Session("_modo") = "Incluir"
        MultiView1.ActiveViewIndex = 4
        GridEntrevista.DataBind()
    End Sub

    Protected Sub btnatualizaEntrevistaEmp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnatualizaEntrevistaEmp.Click
        Session("_modo") = "Alterar"
        SqlEntrevistaFormEmp.Update()
        MultiView1.ActiveViewIndex = 5

    End Sub

    Protected Sub GridEntrevistaEmp_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevistaEmp.SelectedIndexChanged
        Session("_modo") = "Alterar"
        MultiView1.ActiveViewIndex = 6
        PanelEntrevistaEmp.Visible = True
    End Sub

    Protected Sub btnAgendar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAgendar.Click
        Session("_modo") = "Alterar"
        Session("id_entrevista") = GridEntrevista.SelectedValue

        If cboid_statusEntrevista.SelectedValue = "1" Then

            MultiView1.ActiveViewIndex = 5
        Else
            MultiView1.ActiveViewIndex = 4
        End If
    End Sub

    Protected Sub btnAgendar1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("_modo") = "Incluir"
        Session("id_vagacandidato") = Gridcandidato.SelectedValue

        If Gridcandidato.SelectedIndex < 0 Then
            lblaviso.Text = "Por favor selecione um candidato da lista"
        Else
            MultiView1.ActiveViewIndex = 4
        End If

    End Sub


End Class
