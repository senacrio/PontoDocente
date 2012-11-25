
Partial Class admVagasEdit
    Inherits System.Web.UI.Page
    Dim oCrud As New CRUD
    Private Sub colorirDropProgramacao(ByVal id_vaga As Integer, ByVal x As Integer)
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("Senacrjconnectionstring").ToString)
        Dim sql As String = "SELECT  cast(isnull(ativada,NULL) as varchar) as ativada FROM tblvaga WHERE id_vaga=@id_vaga"

        Dim Pid_vaga As SqlParameter = New SqlParameter()
        Pid_vaga.ParameterName = "id_vaga"
        Pid_vaga.Value = id_vaga

        Dim cmd As SqlCommand = New SqlCommand(sql, conn)

        cmd.Parameters.Add(Pid_vaga)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        While reader.Read()

            If reader.HasRows Then
                If reader("ativada").Equals("1") Then
                    cboid_vaga.Items(x).Attributes.Add("style", "background-color: #AFEEEE")
                ElseIf IsDBNull(reader("ativada")) Then
                    cboid_vaga.Items(x).Attributes.Add("style", "background-color: #EEE8AA")
                ElseIf reader("ativada").Equals("0") Then
                    cboid_vaga.Items(x).Attributes.Add("style", "background-color: #CDCDB4")
                End If
            End If

        End While

        conn.Dispose()
        cmd.Dispose()
        reader.Close()




    End Sub



    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Session("empresavagasPopulado") = False


        Session("_modo") = "Incluir"

        'MultiView1.ActiveViewIndex = 1

        ibtSalvarAlterar.Visible = False


    End Sub

    Protected Sub ddlModalidade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CBOModalidade.SelectedIndexChanged
        If CBOModalidade.SelectedValue() = "E" Then
            txtmodalidade_fim.Enabled = False
        Else
            txtmodalidade_fim.Enabled = True
        End If
    End Sub

    Protected Sub ibtCancela_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblAviso.Text = ""
        'Session("id_vaga") = cboid_vaga.SelectedValue



        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        If Not IsPostBack Then
            Session("empresavagasPopulado") = False
        End If

        cboresp_vaga.SelectedValue = Session("c_Nome")

        'lblAvisoCadastro.Visible = False
        'ImageButton1.Visible = False
        lblareaEdicao.Visible = False
        'lbltituloEmpresas.Visible = False
        lbltituloVagas.Visible = False




    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        'Session("id_vaga") = cboid_vaga.SelectedValue


        If Session("_modo") = "Alterar" Then



            If cboresp_vaga.SelectedValue = "Empresa" Then
                cboresp_vaga.Enabled = False
            Else
                cboresp_vaga.Enabled = True
            End If

            ibtSalvarAlterar.Visible = True
            lblAlterar.Visible = True
            lblIncluir.Visible = False
            ibtSalvarInclusao.Visible = False
            lblareaEdicao.Visible = True
            cboativada.Enabled = True
            txtativada_obs.Enabled = True

            For i As Integer = 0 To cboid_vaga.Items.Count - 1
                colorirDropProgramacao(cboid_vaga.Items(i).Value, i)
                'colorirDropProgramacao(1022, i)
            Next
        ElseIf Session("_modo") = "Incluir" Then

            'INCLUIR
            cboresp_vaga.Enabled = False
            cboresp_vaga.SelectedValue = Session("c_Nome")
            cboativada.SelectedIndex = 0
            cboativada.Enabled = False
            txtativada_obs.Enabled = False
            lbltituloVagas.Visible = False
            ibtSalvarAlterar.Visible = False
            ibtSalvarInclusao.Visible = True
            lblAlterar.Visible = False
            lblIncluir.Visible = True
            lblareaEdicao.Visible = True
            oCrud.Limpa(View1)
            cboFaixaetariainicial.SelectedIndex = 0
            cboFaixaetariaFinal.SelectedIndex = 0
            For i As Integer = 0 To cboid_vaga.Items.Count - 1
                colorirDropProgramacao(cboid_vaga.Items(i).Value, i)
                'colorirDropProgramacao(1022, i)
            Next


        End If
    End Sub

    Protected Sub ibtSalvar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarInclusao.Click
        Try

            sqlVagaForm.Insert()

            'MultiView1.ActiveViewIndex = 1
            lblAviso.Text = "A vaga foi cadastrda com sucesso."
        Catch ex As Exception
            lblAviso.Text = ex.Message
        End Try
        SqlLogAlteracao.Insert()
        cboid_vaga.DataBind()

    End Sub

    Protected Sub ibtAlterar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarAlterar.Click
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
        End Try

        SqlLogAlteracao.Insert()
    End Sub
    Protected Sub cboid_cargo_fkPai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_cargo_fkPai.SelectedIndexChanged
        cboid_cargo_fk.DataBind()
    End Sub


    Protected Sub ibtSalvarAlterar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarAlterar0.Click
        'modalidade_fim_MaskedEditExtender.Enabled = False
        'modalidade_inicio_MaskedEditExtender.Enabled = False

        '        Gridcandidato.DataBind()
        txtDtFinal.Text = ""
        txtDtInicial.Text = ""
        GridVaga.DataBind()


        Session("id_vaga") = cboid_vaga.SelectedValue
        Session("_modo") = "Alterar"
        oCrud.Popula(View1, sqlVagaForm)
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

        'cbonome_fantasia.SelectedIndex = 0
        'cbonome_fantasia.DataBind()
        cboid_vaga.DataBind()

    End Sub

    Protected Sub btnViewCandidato_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim btn As ImageButton = sender
        Response.Redirect("Curriculo.aspx?id_candidato=" + btn.CommandArgument.ToString)
    End Sub

    Protected Sub btnAgendar1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub cboid_vaga_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_vaga.DataBound
        For i As Integer = 0 To cboid_vaga.Items.Count - 1
            colorirDropProgramacao(cboid_vaga.Items(i).Value, i)
            'colorirDropProgramacao(1022, i)
        Next


    End Sub

    Protected Sub cboid_vaga_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_vaga.DataBinding

        
    End Sub

    Protected Sub cboid_vaga_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_vaga.Load
        

    End Sub

    Protected Sub SqlEmpresa_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlEmpresa.Deleted
        
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        Session("cargo") = ""
        GridVaga.DataBind()

    End Sub

    Protected Sub GridVaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridVaga.SelectedIndexChanged
        'lblEmpresa.Text = cbonome_fantasia.SelectedItem.ToString
        '        Gridcandidato.DataBind()

        Session("id_vaga") = GridVaga.SelectedValue
        Session("_modo") = "Alterar"
        oCrud.Popula(View1, sqlVagaForm)
    End Sub

    Protected Sub cbonome_fantasia_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbonome_fantasia.SelectedIndexChanged
        cboid_vaga.DataBind()

    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim txt As TextBox = GridVaga.HeaderRow.FindControl("txtBuscaCargo")
        Session("cargo") = txt.Text
    End Sub
End Class
