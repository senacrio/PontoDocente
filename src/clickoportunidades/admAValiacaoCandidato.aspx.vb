
Partial Class admVagasEdit
    Inherits System.Web.UI.Page
    Dim oCrud As New CRUD

#Region " Funções "
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

    Public Shared Sub Desabilitar(ByVal oContainer As View, ByVal ativar As Boolean)

        Dim oDataView As New System.Data.DataView

        For n = 0 To oContainer.Controls.Count - 1

            Dim oTxt As TextBox
            Dim oChk As CheckBox
            Dim oCbo As DropDownList
            Dim oGrid As GridView
            Dim oBtnImg As ImageButton


            Dim sCmp As String = Mid(oContainer.Controls(n).ID, 1, 3)

            If sCmp = "txt" Or sCmp = "moe" Or sCmp = "dat" Then
                oTxt = oContainer.Controls(n)
                oTxt.Enabled = ativar
            End If

            If sCmp = "chk" Then

                oChk = oContainer.Controls(n)
                oChk.Enabled = ativar

            End If

            If sCmp = "grid" Then
                oGrid = oContainer.Controls(n)
                oGrid.Enabled = ativar
                oGrid.DataBind()

            End If

            If sCmp = "cbo" Then
                oCbo = oContainer.Controls(n)
                oCbo.Enabled = ativar
            End If

            If sCmp = "btn" Then
                oBtnImg = oContainer.Controls(n)
                oBtnImg.Enabled = ativar
            End If


        Next

    End Sub

    'Public Shared Sub Atualizar(ByVal oContainer As HtmlForm)

    '    Dim oDataView As New System.Data.DataView

    '    For n = 0 To oContainer.Controls.Count - 1

    '        Dim oCbo As DropDownList


    '        Dim sCmp As String = Mid(oContainer.Controls(n).ID, 1, 3)

    '        If sCmp = "DDL" Then
    '            oCbo = oContainer.Controls(n)
    '            oCbo.DataBind()
    '        End If



    '    Next

    'End Sub


   
#End Region

    Protected Sub RegsPag_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dteNow As Date = Now()

        'datdataretorno.Text = dteNow

        Session("_modo") = "Incluir"



        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        lblAviso.Text = ""

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
        'MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblAviso.Text = ""
        ' Session("id_vaga") = cboid_vaga.SelectedValue


        'Session("c_Nome") = "Leandro Conceição"
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
        ElseIf Session("_modo") = "AlterarAvaliacao" Then

            oCrud.Popula(ViewAvaliacao, sqlFormAvaliacao)


        ElseIf Session("_modo") = "IncluirAvaliacao" Then
            ' txtnome.Text = GridAvaliacao.DataKeys(GridAvaliacao.SelectedIndex).Values("nome")
            txtid_vaga_fk.Text = Session("id_vaga")

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

        'cbonome_fantasia.SelectedIndex = 0
        cbonome_fantasia.DataBind()
        cboid_vaga.DataBind()

    End Sub

    Protected Sub btnViewCandidato_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim btn As ImageButton = sender
        Session("id_candidato") = btn.CommandArgument.ToString
        Response.Redirect("Curriculo.aspx")
        btn.Dispose()
    End Sub

    Protected Sub btnAgendar1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub cboid_vaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_vaga.SelectedIndexChanged
        

    End Sub

   
    Protected Sub IraPag(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
    Protected Sub cboid_vaga_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_vaga.DataBound

    End Sub

    Protected Sub cbonome_fantasia_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbonome_fantasia.SelectedIndexChanged
        cboid_vaga.DataBind()

    End Sub

    Protected Sub ibtSalvarAlterar0_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarAlterar0.Click

        txtDtInicial.Text = ""
        txtDtFinal.Text = ""

        GridVaga.SelectedIndex = -1
        GridVaga.DataBind()

        Session("id_vaga") = cboid_vaga.SelectedValue
        txtid_vaga_fk.Text = cboid_vaga.SelectedValue
        Session("_modo") = "Alterar"
        GridAvaliacao.DataBind()

      
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click

        GridVaga.DataBind()
        Session("cargo") = ""

    End Sub

    Protected Sub GridVaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridVaga.SelectedIndexChanged
        'lblEmpresa.Text = cbonome_fantasia.SelectedItem.ToString

        Session("id_vaga") = GridVaga.SelectedValue
        Session("_modo") = "Alterar"
        txtid_vaga_fk.Text = GridVaga.SelectedValue
        GridAvaliacao.DataBind()

       

    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim txt As TextBox = GridVaga.HeaderRow.FindControl("txtBuscaCargo")
        Session("cargo") = txt.Text
    End Sub

  
   

    Protected Sub GridAvaliacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridAvaliacao.SelectedIndexChanged
        Session("id_candidatoentr") = GridAvaliacao.DataKeys(GridAvaliacao.SelectedIndex).Values("id_candidatoentr")

        If Not IsDBNull(GridAvaliacao.DataKeys(GridAvaliacao.SelectedIndex).Values("avaliacao_click")) Then
            Session("_modo") = "AlterarAvaliacao"

        Else
            Session("_modo") = "IncluirAvaliacao"
            CRUD.Limpa(ViewAvaliacao)
            txtnome.Text = GridAvaliacao.DataKeys(GridAvaliacao.SelectedIndex).Values("nome")
        End If



    End Sub

    Protected Sub btnAlterar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAlterar.Click

        If Session("_modo") = "AlterarAvaliacao" Then
            sqlFormAvaliacao.Update()
        Else
            sqlFormAvaliacao.Insert()
            CRUD.Limpa(ViewAvaliacao)
            GridAvaliacao.SelectedIndex = -1
        End If


        GridAvaliacao.DataBind()

    End Sub

    Protected Sub GridAvaliacao_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridAvaliacao.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            If IsDBNull(GridAvaliacao.DataKeys(e.Row.RowIndex).Values("avaliacao_click")) Then
                CType(e.Row.FindControl("btnSelecionar"), ImageButton).Enabled = True
                CType(e.Row.FindControl("btnExcluir"), ImageButton).Enabled = False
            Else
                CType(e.Row.FindControl("btnSelecionar"), ImageButton).Enabled = False
                CType(e.Row.FindControl("btnExcluir"), ImageButton).Enabled = True
            End If

        End If
    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelar.Click
        GridAvaliacao.SelectedIndex = -1
        CRUD.Limpa(ViewAvaliacao)
        txtid_vaga_fk.Text = GridVaga.SelectedValue
    End Sub
End Class
