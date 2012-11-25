
Partial Class admVagasEdit
    Inherits System.Web.UI.Page
    Dim oCrud As New CRUD
    Dim todo As New DataView()

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
    'Private Sub colorirDropProgramacao(ByVal id_vaga As Integer, ByVal x As Integer)
    '    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("Senacrjconnectionstring").ToString)
    '    Dim sql As String = "SELECT  cast(isnull(ativada,NULL) as varchar) as ativada FROM tblvaga WHERE id_vaga=@id_vaga"

    '    Dim Pid_vaga As SqlParameter = New SqlParameter()
    '    Pid_vaga.ParameterName = "id_vaga"
    '    Pid_vaga.Value = id_vaga

    '    Dim cmd As SqlCommand = New SqlCommand(sql, conn)

    '    cmd.Parameters.Add(Pid_vaga)

    '    conn.Open()

    '    Dim reader As SqlDataReader = cmd.ExecuteReader()

    '    While reader.Read()

    '        If reader.HasRows Then
    '            If reader("ativada").Equals("1") Then
    '                cboid_vaga.Items(x).Attributes.Add("style", "background-color: #AFEEEE")
    '            ElseIf IsDBNull(reader("ativada")) Then
    '                cboid_vaga.Items(x).Attributes.Add("style", "background-color: #EEE8AA")
    '            ElseIf reader("ativada").Equals("0") Then
    '                cboid_vaga.Items(x).Attributes.Add("style", "background-color: #CDCDB4")
    '            End If
    '        End If

    '    End While

    '    conn.Dispose()
    '    cmd.Dispose()
    '    reader.Close()




    'End Sub

    Function UltimaEntrevista() As Integer
        Dim i As Integer = 0
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SENACRJConnectionString").ToString)
        Dim cSql As String = "select max(id_entrevista) as id_entrevista from tblentrevista"

        Dim cmd As SqlCommand = New SqlCommand(cSql, conn)


        conn.Open()


        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            i = Integer.Parse(reader(0))
        Else
            i = 0
        End If

        conn.Dispose()
        cmd.Dispose()


        Return i


    End Function

    Private Sub getEntrevista(ByVal id_entrevista As Integer)
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SENACRJConnectionString").ToString)
        Dim cSql As String = "select * from dbo.tblEntrevista where id_entrevista=@id_entrevista"

        Dim PId_Entrevista As New SqlParameter()
        PId_Entrevista.ParameterName = "id_entrevista"
        PId_Entrevista.Value = id_entrevista

        Dim cmd As SqlCommand = New SqlCommand(cSql, conn)

        cmd.Parameters.Add(PId_Entrevista)

        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()

            datdataempresa.Text = reader("dataEmpresa") + ""
            horhoraempresa.Text = reader("horaEmpresa") + ""
            datdataClick.Text = reader("dataclick") + ""
            horhoraclick.Text = reader("horaClick") + ""
            datdatacaptacao.Text = reader("dataCaptacao") + ""
            cbocaptador.SelectedValue = reader("captador") + ""
            cboid_statusEntrevistaClick.SelectedValue = reader("id_statusEntrevista") + 0
            txtcomentario.Text = reader("comentario") + ""
        Else
            datdataempresa.Text = ""
            horhoraempresa.Text = ""
            datdataClick.Text = ""
            horhoraclick.Text = ""
            datdatacaptacao.Text = ""
            cbocaptador.SelectedIndex = -1
            cboid_statusEntrevistaClick.SelectedIndex = -1
            txtcomentario.Text = ""
        End If


        conn.Dispose()
        cmd.Dispose()
        reader.Close()





    End Sub

    Private Sub LimpaEntrevista()

        datdataempresa.Text = ""
        horhoraempresa.Text = ""
        datdataClick.Text = ""
        horhoraclick.Text = ""
        datdatacaptacao.Text = ""
        cbocaptador.SelectedIndex = -1
        cboid_statusEntrevistaClick.SelectedIndex = -1
        txtcomentario.Text = ""

        For i As Integer = 0 To chCaptadores.Items.Count - 1
            chCaptadores.Items(i).Selected = False
        Next

    End Sub

    Private Sub MarcaCaptadores(ByVal id_entrevista As Integer)
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SENACRJConnectionString").ToString)
        Dim cSql As String = "SELECT id_entrevista_fk, captador, id_captador_entrevista FROM tblCaptadorEntrevista WHERE (id_entrevista_fk = @id_entrevista_fk)"

        Dim PId_Entrevista As New SqlParameter()
        PId_Entrevista.ParameterName = "id_entrevista_fk"
        PId_Entrevista.Value = id_entrevista

        Dim cmd As SqlCommand = New SqlCommand(cSql, conn)

        cmd.Parameters.Add(PId_Entrevista)

        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then

            For i As Integer = 0 To chCaptadores.Items.Count - 1
                While reader.Read()
                    If chCaptadores.Items(i).Text = reader("captador") Then
                        chCaptadores.Items(i).Selected = True
                        Exit While
                    Else
                        chCaptadores.Items(i).Selected = False
                    End If
                End While
                reader.Close()

                reader = cmd.ExecuteReader()

            Next

        End If


        conn.Dispose()
        cmd.Dispose()
        reader.Close()


    End Sub


   
#End Region

    Protected Sub RegsPag_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dteNow As Date = Now()



        Session("_modo") = "Incluir"



        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        Dim oVaga As New Vagas

        oVaga.Vaga(Session("id_vaga"))

        Session("id_vaga") = oVaga.Vaga(Session("id_vaga"))

        oVaga.PossuiVaga(Session("id_vaga"))

        Session("id_vagacandidato") = oVaga.PossuiVaga(Session("id_vaga"))
    End Sub

    Protected Sub cbomodalidade_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbomodalidade.PreRender
        todo = DirectCast(sqlVagaClick0.[Select](DataSourceSelectArguments.Empty), DataView)
        todo.Sort = "dataclick"

    End Sub

    Protected Sub ddlModalidade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbomodalidade.SelectedIndexChanged
        If cbomodalidade.SelectedValue() = "E" Then
            txtmodalidade_fim.Enabled = False
        Else
            txtmodalidade_fim.Enabled = True
        End If
    End Sub

    Protected Sub ibtCancela_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        lblaviso.Text = ""

        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        If Not IsPostBack Then
            Session("empresavagasPopulado") = False
        End If

        lblcomentario.Visible = False
        txtcomentario.Visible = False


        cboresp_vaga.SelectedValue = Session("c_Nome")

        lblareaedicao.Visible = False
        'lbltituloVagas.Visible = False

        If Calendar1.SelectedDate = DateTime.MinValue Then
            Calendar1.SelectedDate = Calendar1.TodaysDate
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        

        If Session("_modo") = "Alterar" Then


            lblareaedicao.Visible = True
            cboativada.Enabled = True
            txtativada_obs.Enabled = True

        ElseIf Session("_modo") = "Incluir" Then

            'INCLUIR
            Panel14.Visible = False
            cboresp_vaga.Enabled = False
            cboresp_vaga.SelectedValue = Session("c_Nome")
            cboativada.SelectedIndex = 0
            cboativada.Enabled = False
            txtativada_obs.Enabled = False
            lbltituloVagas.Visible = False

            lblareaedicao.Visible = True
            CRUD.Limpa(View1)
            cboFaixaetariainicial.SelectedIndex = 0
            cboFaixaetariaFinal.SelectedIndex = 0

        ElseIf Session("_modo") = "IncluirEmp" Then
            Panel14.Visible = False
            LimpaEntrevista()
            'CRUD.Limpa(ViewEntrevistaEmpresa)
            btnInserirEntEmp.Visible = True
            btnatualizaEntrevistaEmp1.Visible = False
            btnCancelarEmp.Visible = False
            GridEntrevistaEmp0.DataBind()

        ElseIf Session("_modo") = "AlterarEntClick" Then

            'ALTERAR




        ElseIf Session("_modo") = "AlterarEmp" Then

            ' CRUD.Popula(ViewEntrevistaEmpresa, sqlEntrevistaEmp)
            'CRUD.Popula(ViewEntrevistaEmpresa, sqlEntrevistaEmp)
            'CRUD.Popula(ViewEntrevistaEmpresa, sqlprogramacaoEnt)
            Panel14.Visible = True
            btnInserirEntEmp.Visible = False
            btnatualizaEntrevistaEmp1.Visible = True
            btnCancelarEmp.Visible = True

        End If


    End Sub

    Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
        Dim dt As DataTable = GetDates()
        Dim eventDate As DateTime
        Dim eventHora As String

        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                'Where ColumnFieldForDate and ColumnFieldForEventType are the field names from your database 
                If IsDBNull(dt.Rows(i)("dataclick")) Or IsDBNull(dt.Rows(i)("horaclick")) Then
                    eventDate = "1900-01-01"
                    eventHora = ""
                Else
                    eventDate = Convert.ToDateTime(dt.Rows(i)("dataclick"))
                    eventHora = Convert.ToString(dt.Rows(i)("horaclick").ToString)
                End If
                If e.Day.[Date] = eventDate Then

                    e.Cell.BackColor = System.Drawing.Color.LightSkyBlue
                    e.Cell.BorderColor = System.Drawing.Color.Red
                    e.Cell.BorderWidth = 1
                    e.Cell.ToolTip = eventHora.ToString
                    e.Cell.BorderColor = System.Drawing.Color.OrangeRed

                    Dim lbl As New Label()
                    lbl.Text = "<br>" + eventHora.ToString
                    e.Cell.Controls.Add(lbl)
                    e.Cell.Width = 100
                    e.Cell.Height = 50


                End If

            Next
        End If

    End Sub

    Public Function GetDates() As DataTable
        Dim dt As New DataTable()
        Dim connection As New SqlConnection(ConfigurationManager.ConnectionStrings("senacRJConnectionString").ToString)

        Try
            connection.Open()
            Dim sqlCmd As New SqlCommand("select * from tblentrevista where id_entrevista = id_entrevista and cancelamento =0", connection)
            Dim sqlDa As New SqlDataAdapter(sqlCmd)

            sqlDa.Fill(dt)
        Catch ex As Data.SqlClient.SqlException
            Dim msg As String = "Fetch Error:"
            msg += ex.Message
            Throw New Exception(msg)
        Finally
            connection.Close()
        End Try
        Return dt
    End Function



    ' Protected Sub cboid_cargo_fkPai_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_cargo_fkPai.SelectedIndexChanged
    '    cboid_cargo_fk.DataBind()
    'End Sub




    ' Protected Sub cboid_cargo_fkPai_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_cargo_fkPai.DataBound
    '    cboid_cargo_fk.DataBind()

    'End Sub


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



    Protected Sub btnViewCandidato_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim btn As ImageButton = sender
        Response.Redirect("Curriculo.aspx?id_candidato=" + btn.CommandArgument.ToString)
    End Sub

    Protected Sub btnAgendar1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub btnatualizaEntrevistaEmp1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnatualizaEntrevistaEmp1.Click
        sqlEntrevistaEmp.Update()
        sqlDeletaCaptadores.Delete()
        sqlprogramacaoEnt.Delete()

        Try

            For i As Integer = 0 To chCaptadores.Items.Count - 1
                Dim idEntrevista As Integer = UltimaEntrevista()

                If chCaptadores.Items(i).Selected Then
                    sqlIncluirCaptadores.InsertParameters("id_entrevista_fk").DefaultValue = idEntrevista
                    sqlIncluirCaptadores.InsertParameters("captador").DefaultValue = chCaptadores.Items(i).Value
                    sqlIncluirCaptadores.Insert()
                End If
            Next


            GridEntrevistaEmp0.DataBind()



            For i As Integer = 0 To Chkoferta0.Items.Count - 1
                Dim idEntrevista As Integer = UltimaEntrevista()
                If Chkoferta0.Items(i).Selected Then
                    sqlprogramacaoEnt.InsertParameters("id_entrevista_fk").DefaultValue = idEntrevista
                    sqlprogramacaoEnt.InsertParameters("codigo").DefaultValue = LTrim(RTrim(GridEntrevistaGeral.DataKeys(GridEntrevistaGeral.SelectedIndex).Values("codigo") + ""))
                    sqlprogramacaoEnt.InsertParameters("id_oferta_fk").DefaultValue = Chkoferta0.Items(i).Value
                    sqlprogramacaoEnt.Insert()
                End If
            Next

        Catch ex As Exception

            lblerro.Text = "Escolha uma vaga"

        End Try
        GridEntrevistaEmp0.DataBind()

    End Sub

    Protected Sub btnInserirEntEmp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInserirEntEmp.Click
        If GridVaga.SelectedIndex <> -1 Then

            Try
                sqlEntrevistaEmp.Insert()

                For i As Integer = 0 To chCaptadores.Items.Count - 1
                    Dim idEntrevista As Integer = UltimaEntrevista()
                    If chCaptadores.Items(i).Selected Then
                        sqlIncluirCaptadores.InsertParameters("id_entrevista_fk").DefaultValue = idEntrevista
                        sqlIncluirCaptadores.InsertParameters("captador").DefaultValue = chCaptadores.Items(i).Value
                        sqlIncluirCaptadores.Insert()
                    End If
                Next

                For i As Integer = 0 To Chkoferta.Items.Count - 1
                    'Label6.Text += ArrayCargo(i).ToString + " "
                    Dim idEntrevista As Integer = UltimaEntrevista()
                    If Chkoferta.Items(i).Selected Then

                        SqlrelacionaInserir.InsertParameters("id_entrevista_fk").DefaultValue = idEntrevista
                        SqlrelacionaInserir.InsertParameters("codigo").DefaultValue = cbocodigo.SelectedValue
                        SqlrelacionaInserir.InsertParameters("id_oferta_fk").DefaultValue = Chkoferta.Items(i).Value
                        SqlrelacionaInserir.Insert()
                    End If
                Next

            Catch ex As Exception
                lblerro.Text = "Selecione uma vaga."
            End Try

            LimpaEntrevista()

        Else
            lblerro.Text = "Não existe entrevista agendada no momento."
        End If

        Chkoferta.DataBind()
        GridEntrevistaEmp0.DataBind()


        CRUD.Limpa(ViewEntrevistaEmpresa)
    End Sub


    Protected Sub GridEntrevistaEmp0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevistaEmp0.SelectedIndexChanged

        Panel14.Visible = True
        If GridEntrevistaEmp0.SelectedIndex <> -1 Then
            Session("id_entrevista") = GridEntrevistaEmp0.SelectedValue
            Session("codigo") = LTrim(RTrim(GridEntrevistaEmp0.DataKeys(GridEntrevistaEmp0.SelectedIndex).Values("codigo")))
            Chkoferta0.DataBind()
            Session("_modo") = "AlterarEmp"

            getEntrevista(GridEntrevistaEmp0.SelectedValue)
            MarcaCaptadores(GridEntrevistaEmp0.SelectedValue)
            MarcaProgramacao(GridEntrevistaEmp0.SelectedValue)
        Else

            lblerro.Text = "Não existe entrevistas agendadas no momento."

            LimpaEntrevista()

        End If
    End Sub

    Protected Sub btnCancelarEmp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelarEmp.Click
        Session("_modo") = "IncluirEmp"
        horhoraempresa.Text = ""
        GridEntrevistaEmp0.SelectedIndex = -1
        lblerro.Text = ""

    End Sub

    Protected Sub GridEntrevistaEmp0_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridEntrevistaEmp0.RowDeleted


    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        SqlBuscaVagas.DataBind()
        GridVaga.DataBind()

    End Sub

    Protected Sub GridVaga_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridVaga.SelectedIndexChanged
        Session("id_vaga") = LTrim(RTrim(GridVaga.DataKeys(GridVaga.SelectedIndex).Values("id_vaga")))
        Session("_modo") = "Alterar"

        CRUD.Popula(View1, sqlVagaForm)

        GridEntrevistaGeral0.DataBind()

        GridEntrevistaEmp0.SelectedIndex = -1

        btnInserirEntEmp.Visible = True
        btnatualizaEntrevistaEmp1.Visible = False
        btnCancelarEmp.Visible = False
        LimpaEntrevista()

    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim txt As TextBox = GridVaga.HeaderRow.FindControl("txtBuscaCargo")
        Session("cargo") = txt.Text
    End Sub


    Protected Sub ibtSalvarAlterar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtSalvarAlterar.Click
        Session("_modo") = "Alterar"

        Try
            sqlVagaForm.Update()
            lblaviso.Text = "As alterações foram salvas."
        Catch ex As Exception
            lblaviso.Text = ex.Message
        Finally
            GridVaga.DataBind()
            GridEntrevistaEmp0.DataBind()
        End Try

        SqlLogAlteracao.Insert()
    End Sub
    Protected Sub GridEntrevistaEmp0_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEntrevistaEmp0.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.FindControl("sqlprogramacaoent"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(2).Text

        End If


        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.Cells(6).Text = "VAGA CANCELADA PELA EMPRESA" Then
                e.Row.Enabled = False
            Else
                e.Row.Enabled = True
            End If

            CType(e.Row.FindControl("sqlCaptadores"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(2).Text


        End If
    End Sub


    Protected Sub GridVaga_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridVaga.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            CType(e.Row.FindControl("sqlRepresentantes"), SqlDataSource).SelectParameters("id_empresa").DefaultValue = cboempresabusca1.SelectedValue

        End If
    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Session("dataclick") = Calendar1.SelectedDate

    End Sub



    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton6.Click
        SqlGridEntrevistaGeral.DataBind()
    End Sub

    Protected Sub ImageButton7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton7.Click
        SqlGridEntrevistacaptacao.DataBind()
    End Sub

    Protected Sub GridEntrevistaGeral1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEntrevistaGeral1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim captador As String = DirectCast(DataBinder.Eval(e.Row.DataItem, "captador"), String)
            e.Row.BackColor = coresGrid.GetColor(captador)
        End If
    End Sub
    Protected Sub ImageButton15_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Panel1.Visible = False
    End Sub


    Protected Sub chkCaptadores_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles chCaptadores.DataBound

    End Sub

    Protected Sub GridEntrevistaGeral_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEntrevistaGeral.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then


            CType(e.Row.FindControl("sqlgrupocaptadores"), SqlDataSource).SelectParameters("id_entrevista").DefaultValue = e.Row.Cells(0).Text


        End If
    End Sub

    Protected Sub cboid_statusEntrevistaClick_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_statusEntrevistaClick.SelectedIndexChanged
        If cboid_statusEntrevistaClick.SelectedValue <> 12 Then
            lblcomentario.Visible = False
            txtcomentario.Visible = False
        Else
            lblcomentario.Visible = True
            txtcomentario.Visible = True
        End If
    End Sub


    Protected Sub ImageButton8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        sqlEntrevistacancela.UpdateParameters(0).DefaultValue = CType(sender, ImageButton).CommandArgument

        sqlEntrevistacancela.Update()
        GridEntrevistaEmp0.DataBind()
    End Sub

    Private Sub MarcaProgramacao(ByVal id_entrevista As Integer)
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SENACRJConnectionString").ToString)
        Dim cSql As String = "SELECT id_programaentrevista, id_entrevista_fk, id_oferta_fk, codigo FROM tblProgramacaoentrevista WHERE (id_entrevista_fk = @id_entrevista_fk)"

        Dim PId_Entrevista As New SqlParameter()
        PId_Entrevista.ParameterName = "id_entrevista_fk"
        PId_Entrevista.Value = id_entrevista

        Dim cmd As SqlCommand = New SqlCommand(cSql, conn)

        cmd.Parameters.Add(PId_Entrevista)

        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then

            For i As Integer = 0 To Chkoferta0.Items.Count - 1
                While reader.Read()
                    ' Session("codigo") = PId_area
                    If RTrim(LTrim(Chkoferta0.Items(i).Value)) = RTrim(LTrim(reader("id_oferta_fk"))) Then
                        Chkoferta0.Items(i).Selected = True
                        Exit While
                    Else
                        Chkoferta0.Items(i).Selected = False
                    End If

                End While
                reader.Close()

                reader = cmd.ExecuteReader()

            Next

        End If


        conn.Dispose()
        cmd.Dispose()
        reader.Close()


    End Sub



End Class

