Imports System
Imports System.Data
Imports System.Drawing
Imports System.Net
Imports System.Text
'Imports System.Windows.Forms
Imports System.Web
Imports System.Web.Services.Protocols
Imports System.Threading
Imports PSLibrary = Microsoft.Office.Project.Server.Library


Partial Class Aprovacao
    Inherits System.Web.UI.Page
    Dim NomeProjeto As String
    Dim CodProjeto As String
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
    Private Const URLPREFIX As String = "http://epm/pwa/"
    Private Const PROJECTWEBSERVICE As String = "_vti_bin/PSI/Project.asmx"
    Private Const ADMINWEBSERVICE As String = "_vti_bin/PSI/Admin.asmx"
    Private baseUrl As String
    Private serverName As String


    'Private serverName As String

    Protected Sub GridAprovacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridAprovacao.SelectedIndexChanged
        GridViewDespesas.DataBind()
        GridViewReceita.DataBind()

        Dim idproj As String

        Session("id_projeto") = GridAprovacao.SelectedValue
        idproj = Session("id_projeto")
        Session("_modo") = "Alterar"

        If GridAprovacao.SelectedIndex >= 0 Then
            MenuProjeto.Enabled = True
        Else
            MenuProjeto.Enabled = False
        End If

        If Not Page.IsPostBack Then CRUD.Limpa(View2)

        CRUD.Limpa(View2)
        CRUD.Popula(View2, SqlProjeto)
        txtId_projeto.Text = GridAprovacao.SelectedValue
        txtnome_projeto.Text = txtCodigoprojeto.Text
        'lblmensagemProjeto.Text = ""
        'lblmensagemProjeto0.Text = ""
        LblLogin.Text = ""
        LblMsg.Text = ""

        If GridAprovacao.SelectedIndex <> 0 Then
            If RTrim(GridAprovacao.SelectedRow.Cells(10).Text) <> RTrim(LblAprovacao.SelectedValue) Then
                BtnAlteraStatusAprovacao.Visible = True
            End If
            If (RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Aprovado" Or (RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Rejeitado")) Then
                BtnAlteraStatusAprovacao.Visible = False
                BtnAlteraStatusAprovacao.ImageUrl = "~/Icones/001_06.gif"
                LblMsg.Text = "O Projeto já está com status Aprovado ou Reprovado, alteração não permitida."

            End If
            If RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Validado Gestor" And RTrim(LblAprovacao.SelectedValue) = "Em Análise" Then
                BtnAlteraStatusAprovacao.Visible = False
            Else
                LblLogin.Text = ""
            End If
        End If

        'BtnAlteraStatusAprovacao.Visible = False
        GridAprovacao.DataBind()
    End Sub

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
        GridAprovacao.DataBind()
        Select Case e.Item.Value
            Case "0"
                MultiView1.ActiveViewIndex = 0
                Exit Select
            Case "1"
                Session("_modo") = "Alterar"
                MultiView1.ActiveViewIndex = 1
                Exit Select
            Case "2"
                MultiView1.ActiveViewIndex = 2
                Exit Select
            Case "3"
                MultiView1.ActiveViewIndex = 3
                Exit Select
            Case "4"
                MultiView1.ActiveViewIndex = 5
                Exit Select
            Case "5"
                MultiView1.ActiveViewIndex = 4
                Exit Select
            Case "6"
                MultiView1.ActiveViewIndex = 6
                Exit Select
        End Select
        GridCidade.DataBind()
        GridCidade0.DataBind()
        GridEstabelec.DataBind()
        GridEstabelec0.DataBind()
        GridCompetencia.DataBind()
        GridCompetencia0.DataBind()
        LblMsg.Text = ""
        LblLogin.Text = ""
    End Sub
    Public Shared project As New WebSvcProject.Project()
    Public Shared admin As WebSvcAdmin.Admin = New WebSvcAdmin.Admin()
    Private userName As String
    Private password As String
    '   Private BaseURL As String
    Private winLogon As Boolean = True
    Private containsUrl As Boolean = False
    Private loggedOn As Boolean = False
    Private nomeservidor As String
    Private Shared loginUtils As New LoginUtils()
    Private Shared adminUtils As New AdminUtils()

    Protected Sub BtnAlteraStatusAprovacao_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles BtnAlteraStatusAprovacao.Click
        LblLogin.Text = ""

        If GridAprovacao.SelectedIndex >= 0 Then
            If (RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Aprovado" Or (RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Rejeitado")) Then
                BtnAlteraStatusAprovacao.Enabled = False
                LblMsg.Text = "O Projeto já está com status Aprovado ou Reprovado, alteração não permitida."
            Else
                BtnAlteraStatusAprovacao.Enabled = True
                SDSStatus.Update()
                Cria_Historico(Int(Session("id_projeto")), "Alterado Status da Aprovação do projeto para " + RTrim(LblAprovacao.SelectedValue), Session("c_nome"))
                If RTrim(LblAprovacao.SelectedValue) = "Aprovado" Then
                    BtnIntegra_Click(BtnAlteraStatusAprovacao, e)
                End If
                If RTrim(GridAprovacao.SelectedRow.Cells(10).Text) <> RTrim(LblAprovacao.SelectedValue) Then
                    LblLogin.Text = "Alteração de status efetuada com sucesso."
                Else
                    LblLogin.Text = ""
                End If
                '        If RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Validado Gestor" And RTrim(LblAprovacao.SelectedValue) = "Em Análise" Then
                '            LblLogin.Text = "Você não pode voltar o status de [Validado Gestor] para em [Em Análise]."
                '            LblAprovacao.SelectedIndex = 1
                '            LblAprovacao.DataBind()
                '        Else
                '            LblLogin.Text = ""
                '        End If
                '        GridAprovacao.DataBind()
            End If
        End If
    End Sub
    Private Function ResetWorkspaceUrl() As String
        Dim workspace As String
        workspace = ("http://" & serverName & "/" & CodProjeto)
        Return workspace
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        MultiView1.ActiveViewIndex = 0
        If Len(RTrim(txtUnidLotac.Text)) = 0 Then
            Dim oFuncionario As New Funcionario
            oFuncionario.PegaUnidadeLotacao(Session("c_Matricula"))
            Session("CentroCusto") = oFuncionario.UnidadeNegocio
            LabelMatric.Text = Session("c_Matricula")
            LabelUnidLotac.Text = Session("CentroCusto")
            txtUnidLotac.Text = Session("CentroCusto")
            oFuncionario.Close()
        End If
        GridAprovacao.DataBind()
    End Sub

    Public Sub AddContextInfo()
        ' Add the Url property first. 
        admin.Url = loginUtils.BaseUrl + ADMINWEBSERVICE
        project.Url = loginUtils.BaseUrl + PROJECTWEBSERVICE

        If winLogon Then
            ' Add Windows credentials 
            admin.Credentials = CredentialCache.DefaultCredentials
            project.Credentials = CredentialCache.DefaultCredentials
        Else
            ' Add Project Server logon cookie for Forms logon 
            admin.CookieContainer = loginUtils.Cookies
            project.CookieContainer = loginUtils.Cookies
        End If
    End Sub

    Protected Sub BtnIntegra_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnIntegra.Click
        ' Rotina de LOGON


        '  Private Sub btnLogon_Click(ByVal sender As Object, ByVal e As EventArgs)
        '   baseUrl = ProjectServerUrl
        baseUrl = URLPREFIX
        LblUrl.Text = ""
        'lblLoggedOn.Visible = False
        Dim errMess As String = ""
        nomeservidor = loginUtils.GetServerName(baseUrl)

        'Me.Cursor = Cursors.WaitCursor
        Try
            loggedOn = loginUtils.LogonPS(winLogon, baseUrl, userName, password)
        Catch ex As SoapException
            errMess = ex.Message.ToString()
        Catch ex As WebException
            errMess = ex.Message.ToString()
        End Try
        'Me.Cursor = Cursors.[Default]

        'servername = nomeservidor

        If loggedOn Then
            AddContextInfo()
            'LblLogin.Text = "Logon bem sucedido!"
            'lblLoggedOn.ForeColor = Color.Green
            'btnLogoff.Enabled = True

            Dim version As String = adminUtils.ProjectServerVersion(admin)
            If version.StartsWith("Error") Then
                LblMsg.Text = "Admin Web service error"
                '                MessageBox.Show(version, "Admin Web service error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
            Else
                LblMsg.Text = "Project Server Version: " & version
            End If
        Else
            'MessageBox.Show(errMess, "Logon Error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
            LblLogin.Text = "Logon Error"
            LblLogin.Text = "Logon Failed!"
            'lblLoggedOn.ForeColor = Color.Red
        End If

        'lblLoggedOn.Visible = True

        serverName = nomeservidor

        ' Rotina de Criação

        Dim projectCreatedLabel As String = "Projeto criado no EPM : " '+ NomeProjeto.ToString
        Dim wssUrl As String
        Dim projectWorkspace As String = ResetWorkspaceUrl()
        Dim created As Boolean = False
        'Dim servername As String
        Dim ProjectServerUrl As String
        ProjectServerUrl = "Http://epm/pwa/"
        winLogon = True
        loggedOn = False

        baseUrl = ProjectServerUrl
        'lblLoggedOn.Visible = False
        'Dim errMess As String = ""
        errMess = ""
        serverName = loginUtils.GetServerName(baseUrl)

        'Me.Cursor = Cursors.WaitCursor
        Try
            loggedOn = loginUtils.LogonPS(winLogon, baseUrl, userName, password)
        Catch ex As SoapException
            errMess = ex.Message.ToString()
        Catch ex As WebException
            errMess = ex.Message.ToString()
        End Try
        'Me.Cursor = Cursors.[Default]

        If loggedOn Then
            AddContextInfo()
            LblMsg.Text = "Logon bem sucedido!"
            'lblLoggedOn.ForeColor = Color.Green
            'btnLogoff.Enabled = True

            Dim version As String = adminUtils.ProjectServerVersion(admin)
            If version.StartsWith("Error") Then
                LblMsg.Text = "Admin Web service error"
                '                MessageBox.Show(version, "Admin Web service error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
            Else
                LblMsg.Text = "Project Server Version: " & version
            End If
        Else
            'MessageBox.Show(errMess, "Logon Error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
            LblMsg.Text = "Logon Error"
            LblMsg.Text = "Logon Failed!"
            'lblLoggedOn.ForeColor = Color.Red
        End If

        'lblLoggedOn.Visible = True


        serverName = "Http://epm/pwa/"
        LblMsg.Text = ""
        'lblWorkspaceUrl.Text = projectWorkspace
        ' Me.Cursor = Cursors.WaitCursor

        Try
            Dim dsProject As New WebSvcProject.ProjectDataSet()
            Dim projectRow As WebSvcProject.ProjectDataSet.ProjectRow = dsProject.Project.NewProjectRow()

            Dim projectGuid As Guid = System.Guid.NewGuid()
            projectRow.PROJ_UID = projectGuid
            'projectRow.PROJ_NAME = Server.HtmlDecode(GridAprovacao.SelectedRow.Cells(1).Text) + " - " + LTrim(Left(Server.HtmlDecode(GridAprovacao.SelectedRow.Cells(2).Text), 254))
            projectRow.PROJ_NAME = Server.HtmlDecode(CType(GridAprovacao.Rows(GridAprovacao.SelectedIndex).FindControl("HyperLink1"), HyperLink).Text) + " - " + LTrim(Left(Server.HtmlDecode(GridAprovacao.SelectedRow.Cells(2).Text), 254))
            NomeProjeto = projectRow.PROJ_NAME
            projectCreatedLabel = "Projeto criado no EPM : " + NomeProjeto.ToString
            projectRow.PROJ_TYPE = Convert.ToInt32(PSLibrary.Project.ProjectType.Project)
            projectRow.PROJ_PROP_AUTHOR = Session("c_nome")
            projectRow.PROJ_PROP_CATEGORY = Left(Server.HtmlDecode(GridAprovacao.SelectedRow.Cells(6).Text), 254)
            projectRow.PROJ_PROP_COMPANY = Left(Server.HtmlDecode(GridAprovacao.SelectedRow.Cells(7).Text), 254)
            projectRow.PROJ_PROP_MANAGER = Left(Server.HtmlDecode(GridAprovacao.SelectedRow.Cells(4).Text), 254)
            projectRow.PROJ_PROP_SUBJECT = Left(Server.HtmlDecode(GridAprovacao.SelectedRow.Cells(2).Text), 254)
            projectRow.PROJ_PROP_TITLE = Left(Server.HtmlDecode(GridAprovacao.SelectedRow.Cells(2).Text), 254)

            dsProject.Project.AddProjectRow(projectRow)

            Dim jobGuid As System.Guid = System.Guid.NewGuid
            Dim validateOnly As Boolean = False
            ' Create and save project to the Draft db 
            project.QueueCreateProject(jobGuid, dsProject, validateOnly)

            ' Wait 3 seconds (more or less) for Queue job to complete. 
            ' Or, add a routine that checks the QueueSystem for job completion. 
            System.Threading.Thread.Sleep(3000)

            Dim dsProjectRelations As New WebSvcProject.ProjectRelationsDataSet()
            jobGuid = System.Guid.NewGuid()

            CodProjeto = Server.HtmlDecode(GridAprovacao.SelectedRow.Cells(1).Text)
            'wssUrl = projectWorkspace + CodProjeto + "/"
            wssUrl = ""

            Dim fullPublish As Boolean = True
            ' Publishes project to the Published db 
            dsProjectRelations = project.QueuePublish(jobGuid, projectGuid, fullPublish, wssUrl)
            created = True
        Catch ex As SoapException
            'Dim errMess As String = ""
            ' Pass the exception to the PSClientError constructor to get 
            ' all error information. 
            Dim [error] As New PSLibrary.PSClientError(ex)
            Dim errors As PSLibrary.PSErrorInfo() = [error].GetAllErrors()

            For j As Integer = 0 To errors.Length - 1
                errMess += errors(j).ErrId.ToString() & vbLf
            Next
            errMess += vbLf & ex.Message.ToString()

            'MessageBox.Show(errMess, "Erro: ", MessageBoxButtons.OK, MessageBoxIcon.[Error])
            LblMsg.Text = "Erro: " & vbLf & ex.Message.ToString()
        Catch ex As WebException
            'Dim message As String = ex.Message.ToString() & vbLf & vbLf & "Já Logado, ou verifique a fila de serviços de projetos."
            'MessageBox.Show(message, "Erro na Criação do Projeto: ", MessageBoxButtons.OK, MessageBoxIcon.[Error])
            LblMsg.Text = ex.Message.ToString() & vbLf & vbLf & "Usuário Já Logado, ou verifique a fila de serviços de projetos."
        End Try
        '  Me.Cursor = Cursors.[Default]

        Try
            'lblProjectCreated.ForeColor = Color.Green
            'lblWorkspaceUrl.Visible = True
            'lblWorkspaceLabel.Visible = True   
            LblMsg.Text = projectCreatedLabel
            LblUrl.Text = Replace(URLPREFIX + NomeProjeto, " ", "%20")
            'lblProjectCreated.Visible = True
            SDSAprovacao.Update()
            GridAprovacao.DataBind()

        Catch ex As Exception
            LblMsg.Text = "Projeto já existe ou não pode ser criado, favor verificar..."
            LblMsg.Text = ex.Message.ToString
            'lblProjectCreated.ForeColor = Color.Red
            'lblWorkspaceUrl.Visible = False
            'lblWorkspaceLabel.Visible = True
        End Try

        'Private Sub btnLogOff_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim loggedOff As Boolean = False
        Try
            loggedOff = loginUtils.LogoffPS(winLogon)
        Catch ex As SoapException
            errMess = ex.Message.ToString()
        Catch ex As WebException
            errMess = ex.Message.ToString()
        End Try
        If loggedOff Then
            RemoveContextInfo()
            'LblLogin.Text = "Logged Off bem sucedido!"
            'lblLoggedOn.ForeColor = Color.Black
            'lblLoggedOn.Visible = True
            'lblProjectCreated.Text = ""
            'lblVersion.Text = ""
            'lblWorkspaceLabel.Visible = False
            'lblWorkspaceUrl.Text = ""
        Else
            'MessageBox.Show(errMess, "Logoff Error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
            LblLogin.Text = "Erro no Logoff !"
        End If
    End Sub
    Public Sub RemoveContextInfo()
        If winLogon Then
            admin.Credentials = Nothing
            project.Credentials = Nothing
        Else
            admin.CookieContainer = Nothing
            project.CookieContainer = Nothing
        End If
    End Sub

    Protected Sub LbxAprovacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles LblAprovacao.SelectedIndexChanged
        LblLogin.Text = ""
        BtnAlteraStatusAprovacao.Visible = False
        If GridAprovacao.SelectedIndex >= 0 Then
            If RTrim(GridAprovacao.SelectedRow.Cells(10).Text) <> RTrim(LblAprovacao.SelectedValue) Then
                BtnAlteraStatusAprovacao.Visible = True
            End If
            If (RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Aprovado" Or (RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Rejeitado")) Then
                BtnAlteraStatusAprovacao.Visible = False
                LblMsg.Text = "O Projeto já está com status Aprovado ou Reprovado, alteração não permitida."
            End If
            If RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Validado Gestor" And RTrim(LblAprovacao.SelectedValue) = "Em Análise" Then
                BtnAlteraStatusAprovacao.Visible = False
                LblLogin.Text = "Você não pode voltar o status de [Validado Gestor] para em [Em Análise]."
            Else
                LblLogin.Text = ""
            End If
            GridAprovacao.DataBind()
        End If

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        LblLogin.Text = ""
        BtnAlteraStatusAprovacao.Visible = False
        If Len(RTrim(txtUnidLotac.Text)) = 0 Then
            Dim oFuncionario As New Funcionario
            oFuncionario.PegaUnidadeLotacao(Session("c_Matricula"))
            Session("CentroCusto") = oFuncionario.UnidadeNegocio
            LabelMatric.Text = Session("c_Matricula")
            LabelUnidLotac.Text = Session("CentroCusto")
            txtUnidLotac.Text = Session("CentroCusto")
            oFuncionario.Close()
        End If
        GridAprovacao.DataBind()

        If GridAprovacao.SelectedIndex >= 0 Then
            If RTrim(GridAprovacao.SelectedRow.Cells(10).Text) <> RTrim(LblAprovacao.SelectedValue) Then
                BtnAlteraStatusAprovacao.Visible = True
            End If
            If (RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Aprovado" Or (RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Rejeitado")) Then
                BtnAlteraStatusAprovacao.Visible = False
            End If
            If RTrim(GridAprovacao.SelectedRow.Cells(10).Text) = "Validado Gestor" And RTrim(LblAprovacao.SelectedValue) = "Em Análise" Then
                BtnAlteraStatusAprovacao.Visible = False
            Else
                LblLogin.Text = ""
            End If
            GridAprovacao.DataBind()
        End If
    End Sub


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
            lblCompet = e.Row.FindControl("LblTotalPercentCompet")
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
            Dim lblreceita As Label
            lblreceita = e.Row.FindControl("LblTotalReceita")
            lblreceita.Text = String.Format("{0:c}", totalReceita)
        End If
    End Sub

    Protected Sub GridViewDespesas_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewDespesas.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not CalculadoDespesa Then
                totalDespesa += DirectCast(e.Row.DataItem, Data.DataRowView).DataView.Table.Compute("sum(ValorDespesa)", "")
                CalculadoDespesa = True
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim lbldespesa As Label
            lbldespesa = e.Row.FindControl("LblTotalDespesa")
            lbldespesa.Text = String.Format("{0:c}", totalDespesa)
        End If

    End Sub

    Protected Sub txtCodProj_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCodProj.TextChanged
        GridAprovacao.DataBind()
    End Sub

    Protected Sub txtTitProj_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtTitProj.TextChanged
        GridAprovacao.DataBind()
    End Sub

    Protected Sub txtCCustoProj_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCCustoProj.TextChanged
        GridAprovacao.DataBind()
    End Sub

    Protected Sub txtUnidLotac_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtUnidLotac.TextChanged
        GridAprovacao.DataBind()
    End Sub

    Protected Sub CboStatusProj_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CboStatusProj.SelectedIndexChanged
        GridAprovacao.DataBind()
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

    'Protected Sub ImageButton1_Click2(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    '    Cria_Historico(Int(Session("id_projeto")), "Exclusão de estabelecimento do projeto.", Session("c_nome"))
    'End Sub
End Class
