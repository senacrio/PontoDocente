
Partial Class admVagasEdit
    Inherits System.Web.UI.Page
    Dim oCrud As New CRUD
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

    Protected Sub IraPag(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim _IraPag As TextBox = DirectCast(sender, TextBox)
        Dim _NumPag As Integer

        If Integer.TryParse(_IraPag.Text.Trim, _NumPag) AndAlso _NumPag > 0 AndAlso _NumPag <= Me.GridEntrevista.PageCount Then
            If Integer.TryParse(_IraPag.Text.Trim, _NumPag) AndAlso _NumPag > 0 AndAlso _NumPag <= Me.GridEntrevista.PageCount Then
                Me.GridEntrevista.PageIndex = _NumPag - 1
            Else
                Me.GridEntrevista.PageIndex = 0

            End If
        End If
    End Sub
    Protected Sub RegsPag_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dteNow As Date = Now()



        Session("_modo") = "Incluir"

       

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
    
    Protected Sub ddlModalidade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CBOModalidade.SelectedIndexChanged
        If CBOModalidade.SelectedValue() = "E" Then
            txtmodalidade_fim.Enabled = False
        Else
            txtmodalidade_fim.Enabled = True
        End If
    End Sub

    Protected Sub ibtCancela_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblAviso.Text = ""

        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        If Not IsPostBack Then
            Session("empresavagasPopulado") = False
        End If

        cboresp_vaga.SelectedValue = Session("c_Nome")

        lblareaEdicao.Visible = False
        lbltituloVagas.Visible = False

       

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender




        If Session("_modo") = "Alterar" Then

            oCrud.Popula(View1, sqlVagaForm)

            If cboresp_vaga.SelectedValue = "Empresa" Then

                cboresp_vaga.Enabled = False
            Else
                cboresp_vaga.Enabled = True

            End If

            
            lblareaEdicao.Visible = True
            cboativada.Enabled = True
            txtativada_obs.Enabled = True

        ElseIf Session("_modo") = "Incluir" Then

            'INCLUIR
            cboresp_vaga.Enabled = False
            cboresp_vaga.SelectedValue = Session("c_Nome")
            cboativada.SelectedIndex = 0
            cboativada.Enabled = False
            txtativada_obs.Enabled = False
            lbltituloVagas.Visible = False
            
            lblareaEdicao.Visible = True
            oCrud.Limpa(View1)
            cboFaixaetariainicial.SelectedIndex = 0
            cboFaixaetariaFinal.SelectedIndex = 0
        ElseIf Session("_modo") = "IncluirEmp" Then

            CRUD.Limpa(ViewEntrevistaEmpresa)
            btnInserirEntEmp.Visible = True
            btnatualizaEntrevistaEmp1.Visible = False
            btnCancelarEmp.Visible = False

        ElseIf Session("_modo") = "AlterarEntClick" Then

            'ALTERAR
            CRUD.Popula(ViewEntrevistaClick, SqlEntrevistaForm)
            btnatualizaEntrevista.Visible = True

            
        ElseIf Session("_modo") = "AlterarEmp" Then

            oCrud.Popula(ViewEntrevistaEmpresa, sqlEntrevistaEmpForm)
            btnInserirEntEmp.Visible = False
            btnatualizaEntrevistaEmp1.Visible = True
            btnCancelarEmp.Visible = True

        End If
    End Sub

   

   
    Protected Sub cboid_cargo_fkPai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_cargo_fkPai.SelectedIndexChanged
        cboid_cargo_fk.DataBind()
    End Sub


    

    Protected Sub cboid_cargo_fkPai_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_cargo_fkPai.DataBound
        cboid_cargo_fk.DataBind()

    End Sub

    Protected Sub View1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles View1.PreRender

        If txtmodalidade_inicio.Text <> "" Then
            modalidade_inicio_MaskedEditExtender.Enabled = False
        Else
            modalidade_inicio_MaskedEditExtender.Enabled = True
        End If

        If txtmodalidade_fim.Text <> "" Then
            modalidade_fim_MaskedEditExtender.Enabled = False
        Else
            modalidade_fim_MaskedEditExtender.Enabled = True
        End If

    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        cbonome_fantasia.DataBind()
        cboid_vaga.DataBind()
    End Sub

    Protected Sub btnViewCandidato_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim btn As ImageButton = sender
        Response.Redirect("Curriculo.aspx?id_candidato=" + btn.CommandArgument.ToString)
    End Sub

    Protected Sub btnAgendar1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub cboid_vaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_vaga.SelectedIndexChanged
        
    End Sub

  

    Protected Sub GridEntrevista_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevista.SelectedIndexChanged
        lblCodEntrevista.Text = GridEntrevista.SelectedValue
        Session("_modo") = "AlterarEntClick"

    End Sub

    Protected Sub btnatualizaEntrevistaEmp1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnatualizaEntrevistaEmp1.Click
        sqlEntrevistaEmp.Update()

        If cboid_statusEntrevistaClick.SelectedValue = 10 Then
            sqlUpdateEntrevistas.Update()
            sqlupdatevaga.Update()

        End If
        GridEntrevistaEmp0.DataBind()
        GridEntrevista.DataBind()
        CRUD.Popula(View1, sqlVagaForm)
    End Sub

    Protected Sub btnInserirEntEmp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInserirEntEmp.Click

        sqlEntrevistaEmp.Insert()
        GridEntrevistaEmp0.DataBind()
        GridEntrevista.DataBind()


    End Sub

    Protected Sub GridEntrevistaEmp0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevistaEmp0.SelectedIndexChanged
        Session("_modo") = "AlterarEmp"
    End Sub

    Protected Sub btnCancelarEmp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelarEmp.Click
        Session("_modo") = "IncluirEmp"
        horhoraempresa.Text = ""
        GridEntrevistaEmp0.SelectedIndex = -1
    End Sub

    Protected Sub btnatualizaEntrevista_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnatualizaEntrevista.Click
        If GridEntrevista.SelectedIndex = -1 Then
            lblmensagemBotao.Text = "Selecione um agendamento."
        Else

            Session("_modo") = "Alterar"
            Dim data As Date = datdataClick.Text

            If verificaHoraExiste(Session("c_Nome"), Format(data, "yyyy-MM-dd").ToString, horhoraclick.Text) Then
                lblmensagemBotao.Text = "Já existe uma entrevista marcada para esse horário."
            Else
                SqlEntrevistaForm.Update()
                If cboid_statusEntrevista.SelectedValue = 10 Then
                    sqlUpdateEntrevistas.Update()
                    sqlupdatevaga.Update()

                End If
            End If

            GridEntrevista.DataBind()

            lblmensagemBotao.Text = "Agendamento salvo."
            CRUD.Popula(View1, sqlVagaForm)
            GridEntrevista.DataBind()
        End If
    End Sub

    
    
    Protected Sub cbonome_fantasia_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbonome_fantasia.SelectedIndexChanged
        cboid_vaga.DataBind()

    End Sub

    Protected Sub cboid_vaga_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_vaga.DataBound
        
    End Sub

    Protected Sub ibtSalvarAlterar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarAlterar0.Click
      
        Session("id_vaga") = cboid_vaga.SelectedValue
        Session("_modo") = "Alterar"
        ' lblEmpresa.Text = cbonome_fantasia.SelectedItem.ToString

        txtDtFinal.Text = ""
        txtDtInicial.Text = ""
        GridVaga.DataBind()

        GridEntrevista.DataBind()
        GridEntrevistaEmp0.DataBind()
    End Sub

    Protected Sub GridEntrevista_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridEntrevista.RowDeleted
        GridEntrevistaEmp0.DataBind()


    End Sub

    Protected Sub GridEntrevistaEmp0_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridEntrevistaEmp0.RowDeleted
        GridEntrevista.DataBind()

    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        GridVaga.DataBind()
        Session("cargo") = ""
    End Sub

    Protected Sub GridVaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridVaga.SelectedIndexChanged
        Session("id_vaga") = GridVaga.SelectedValue
        Session("_modo") = "Alterar"

        GridEntrevistaGeral0.DataBind()

        GridEntrevista.DataBind()
        GridEntrevistaEmp0.DataBind()


    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim txt As TextBox = GridVaga.HeaderRow.FindControl("txtBuscaCargo")
        Session("cargo") = txt.Text
    End Sub
    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelar.Click
        oCrud.Limpa(ViewEntrevistaClick)
        GridEntrevista.SelectedIndex = -1
    End Sub

    Protected Sub ibtSalvarAlterar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarAlterar.Click
        Session("_modo") = "Alterar"
        Try
            sqlVagaForm.Update()
            lblAviso.Text = "As alterações foram salvas."
        Catch ex As Exception
            lblAviso.Text = ex.Message
        Finally
            cboid_vaga.DataBind()
            cbonome_fantasia.DataBind()
            GridVaga.DataBind()
            GridEntrevistaEmp0.DataBind()
            GridEntrevista.DataBind()

        End Try

        SqlLogAlteracao.Insert()
    End Sub

   

    Protected Sub GridEntrevista_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEntrevista.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.Cells(7).Text = "VAGA CANCELADA PELA EMPRESA" Then
                e.Row.Enabled = False
            Else
                e.Row.Enabled = True
            End If

        End If
    End Sub

    Protected Sub GridEntrevista_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevista.DataBound


    End Sub

    Protected Sub GridEntrevistaEmp0_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEntrevistaEmp0.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.Cells(5).Text = "VAGA CANCELADA PELA EMPRESA" Then
                e.Row.Enabled = False
            Else
                e.Row.Enabled = True
            End If

        End If
    End Sub
End Class
