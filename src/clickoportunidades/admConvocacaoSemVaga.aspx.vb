Imports System.Drawing
Imports Encryption64

Partial Class admVagasEdit
    Inherits System.Web.UI.Page
    Dim oCrud As New CRUD
    Dim todo As New DataView()


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
    
    Protected Sub ibtCancela_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Gridcandidato0.DataBind()
        End If


        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
        End If

        If Not IsPostBack Then
            Session("empresavagasPopulado") = False
        End If
        If Not IsPostBack Then
            lblerro.Text = ""
            lblfechamento.Text = ""
            lblfechamento0.Text = ""
            lblMsg0.Text = ""
            lblMsg.Text = ""
            lblerro1.Text = ""
            lblalteraEnt.Visible = False
            lblcancelaEnt.Visible = False

        End If

        If Not IsPostBack Then
            Panel18.Visible = False
            lblunidade.Visible = False
            cboid_unidade_fk.Visible = False
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender


        If Session("_modo") = "Alterar" Then


        ElseIf Session("_modo") = "Incluir" Then

            'INCLUIR



        ElseIf Session("_modo") = "IncluirEmp" Then
            lblerro.Visible = False
            Panel14.Visible = False
            btnInserirEntEmp.Visible = True
            lblsalvaEnt.Visible = True
            lblalteraEnt.Visible = False
            btnatualizaEntrevistaEmp1.Visible = False
            btnCancelarEmp.Visible = False
            lblcancelaEnt.Visible = False
            GridEntrevistaRelac.DataBind()

        ElseIf Session("_modo") = "AlterarEntClick" Then

            'ALTERAR




        ElseIf Session("_modo") = "AlterarEmp" Then


            btnInserirEntEmp.Visible = False
            lblsalvaEnt.Visible = False
            lblcancelaEnt.Visible = True
            btnatualizaEntrevistaEmp1.Visible = True
            btnCancelarEmp.Visible = True
            lblalteraEnt.Visible = True

        End If


    End Sub

    Protected Sub btnViewCandidato_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        Dim Idcursos As String
        Dim btn As ImageButton = sender

        Session("id_candidato") = btn.CommandArgument.ToString

        Idcursos = Session("id_candidato")

        Dim strURL As String = "Curriculo.aspx?id_candidato=" & encryptQueryString(Idcursos)

        Response.Redirect(strURL)


    End Sub


    Protected Sub btnAgendar1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub


    Protected Sub GridEntrevistaRelac_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEntrevistaRelac.SelectedIndexChanged

        Session("id_entrevista") = GridEntrevistaRelac.SelectedValue
        Gridcandidato0.DataBind()

        Panel14.Visible = True
        If GridEntrevistaRelac.SelectedIndex <> -1 Then

            Session("codigo") = LTrim(RTrim(GridEntrevistaRelac.DataKeys(GridEntrevistaRelac.SelectedIndex).Values("codigo") + ""))
            Chkoferta0.DataBind()
            Session("_modo") = "AlterarEmp"

            getEntrevista(GridEntrevistaRelac.SelectedValue)
            MarcaCaptadores(GridEntrevistaRelac.SelectedValue)
            MarcaProgramacao(GridEntrevistaRelac.SelectedValue)


        Else

            lblerro.Text = "Não existe entrevistas agendadas no momento."

            LimpaEntrevista()

        End If


    End Sub



    Protected Sub Chkoferta_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chkoferta.SelectedIndexChanged
        lblSelecionada.Text = "Oferta selecionada: " + Chkoferta.SelectedItem.ToString
    End Sub

    Protected Sub GridEntrevistaRelac_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then


            CType(e.Row.FindControl("sqlprogramacaoent"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(1).Text
            CType(e.Row.FindControl("sqlcaptadores0"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(1).Text


        End If
    End Sub

    Protected Sub ImageButton9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        sqlEntrevistaRelac.UpdateParameters(0).DefaultValue = CType(sender, ImageButton).CommandArgument

        sqlEntrevistaRelac.Update()
        GridEntrevistaRelac.DataBind()
    End Sub

    Protected Sub ImageButton9_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton9.Click
        Dim parOferta, parArea, parUnidade As New Parameter

        SqlCursoSenac.SelectParameters.Clear()

        parUnidade.Name = "razao_social"
        If cboid_local_fk.Text.Length = 0 Then
            parUnidade.DefaultValue = "%"
        Else
            parUnidade.DefaultValue = cboid_local_fk.Text
        End If
        SqlCursoSenac.SelectParameters.Add(parUnidade)

        parArea.Name = "codigo"
        If cbocodigo.Text.Length = 0 Then
            parArea.DefaultValue = "%"
        Else
            parArea.DefaultValue = cbocodigo.Text
        End If
        SqlCursoSenac.SelectParameters.Add(parArea)

        parOferta.Name = "nome"
        If busca.Text.Length = 0 Then
            parOferta.DefaultValue = "%"
        Else
            parOferta.DefaultValue = busca.Text
        End If
        SqlCursoSenac.SelectParameters.Add(parOferta)

        busca.Text = ""
    End Sub


    Public Function UltimaEntrevista() As Integer
        Dim i As Integer = 0
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SENACRJConnectionString").ToString)
        Dim cSql As String = "select isnull (max(id_entrevista),0) as id_entrevista from tblentrevista"

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


            datdataClick.Text = reader("dataclick") + ""
            horhoraclick.Text = reader("horaClick") + ""
            datdatacaptacao.Text = reader("dataCaptacao") + ""
            txtquantcandidatos.Text = reader("quantcandidatos") + 0
            cbocaptador2.SelectedValue = reader("captador") + ""
            cboid_statusEntrevistaClick.SelectedValue = reader("id_statusEntrevista") + 0
        Else

            datdataClick.Text = ""
            horhoraclick.Text = ""
            datdatacaptacao.Text = ""
            txtquantcandidatos.Text = ""
            cboid_local_fk.SelectedIndex = -1
            cbocaptador2.SelectedIndex = -1
            cboid_statusEntrevistaClick.SelectedIndex = -1
        End If


        conn.Dispose()
        cmd.Dispose()
        reader.Close()


    End Sub

    Private Sub LimpaEntrevista()

        datdataClick.Text = ""
        horhoraclick.Text = ""
         txtquantcandidatos.Text = ""
        datdatacaptacao.Text = ""
        cbocaptador2.SelectedIndex = -1
        cboid_statusEntrevistaClick.SelectedIndex = -1

        For i As Integer = 0 To chkCaptadores.Items.Count - 1
            chkCaptadores.Items(i).Selected = False
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

            For i As Integer = 0 To chkCaptadores.Items.Count - 1
                While reader.Read()
                    If chkCaptadores.Items(i).Text = reader("captador") Then
                        chkCaptadores.Items(i).Selected = True
                        Exit While
                    Else
                        chkCaptadores.Items(i).Selected = False
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



    Protected Sub GridEntrevistaRelac_RowDataBound1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEntrevistaRelac.RowDataBound
        Dim captador As String

        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.FindControl("sqlprogramacaoent"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(1).Text

        End If

        If e.Row.RowType = DataControlRowType.DataRow Then



        Else

            captador = DirectCast(DataBinder.Eval(e.Row.DataItem, "captador"), String) + ""
            e.Row.BackColor = coresGrid.GetColor(captador)
        End If



    End Sub

    Protected Sub btnInserirEntEmp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInserirEntEmp.Click


        Try
            sqlEntrevistaRelac.Insert()

            For i As Integer = 0 To chkCaptadores.Items.Count - 1
                Dim idEntrevista As Integer = UltimaEntrevista()
                If chkCaptadores.Items(i).Selected Then
                    sqlIncluirCaptadores.InsertParameters("id_entrevista_fk").DefaultValue = idEntrevista
                    sqlIncluirCaptadores.InsertParameters("captador").DefaultValue = chkCaptadores.Items(i).Value
                    sqlIncluirCaptadores.Insert()
                End If
            Next


            For i As Integer = 0 To Chkoferta.Items.Count - 1
                Dim idEntrevista As Integer = UltimaEntrevista()

                If Chkoferta.Items(i).Selected Then
                    SqlrelacionaInserir.InsertParameters("id_entrevista_fk").DefaultValue = idEntrevista
                    SqlrelacionaInserir.InsertParameters("codigo").DefaultValue = cbocodigo.SelectedValue
                    SqlrelacionaInserir.InsertParameters("id_oferta_fk").DefaultValue = Chkoferta.Items(i).Value
                    SqlrelacionaInserir.Insert()
                End If
            Next

        Catch ex As Exception

        End Try
        LimpaEntrevista()

        Chkoferta.DataBind()
        GridEntrevistaRelac.DataBind()


    End Sub

    Protected Sub btnatualizaEntrevistaEmp1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnatualizaEntrevistaEmp1.Click

        sqlEntrevistaEmp.Update()
        sqlDeletaCaptadores.Delete()
        sqlprogramacaoEnt.Delete()

        Try

            ' GridEntrevistaRelac.DataBind()

            For i As Integer = 0 To chkCaptadores.Items.Count - 1
                Dim idEntrevista As Integer = UltimaEntrevista()
                If chkCaptadores.Items(i).Selected Then
                    sqlIncluirCaptadores.InsertParameters("id_entrevista_fk").DefaultValue = idEntrevista
                    sqlIncluirCaptadores.InsertParameters("captador").DefaultValue = chkCaptadores.Items(i).Value
                    sqlIncluirCaptadores.Insert()
                End If
            Next


            For i As Integer = 0 To Chkoferta0.Items.Count - 1
                Dim idEntrevista As Integer = UltimaEntrevista()
                If Chkoferta0.Items(i).Selected Then
                    sqlprogramacaoEnt.InsertParameters("id_entrevista_fk").DefaultValue = idEntrevista
                    sqlprogramacaoEnt.InsertParameters("codigo").DefaultValue = LTrim(RTrim(GridEntrevistaRelac.DataKeys(GridEntrevistaRelac.SelectedIndex).Values("codigo") + ""))
                    sqlprogramacaoEnt.InsertParameters("id_oferta_fk").DefaultValue = Chkoferta0.Items(i).Value
                    sqlprogramacaoEnt.Insert()
                End If
            Next

        Catch ex As Exception


        End Try


        GridEntrevistaRelac.DataBind()


    End Sub



    Protected Sub cboid_local_fk_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboid_local_fk.DataBound
        cbocodigo.DataBind()

    End Sub

    Protected Sub btnCancelarEmp_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelarEmp.Click

        Session("_modo") = "IncluirEmp"
        horhoraclick.Text = ""
        GridEntrevistaRelac.SelectedIndex = -1
        LimpaEntrevista()
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        Gridcandidato0.DataBind()
    End Sub

    Protected Sub ImageButton7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton7.Click
        If Gridcandidato0.SelectedIndex <> -1 Then
            lblMsg.Text = "Selecione um candidato na lista."
        Else

            If GridEntrevistaRelac.SelectedIndex <> -1 Then

                Session("id_entrevista") = GridEntrevistaRelac.DataKeys(GridEntrevistaRelac.SelectedIndex).Values("id_entrevista")


                Dim total As Integer = 0

                If GridEntrevistaRelac.SelectedIndex = -1 Then
                    lblMsg.Text = "Selecione uma entrevista."
                Else
                    For i As Integer = 0 To Gridcandidato0.Rows.Count - 1

                        If Gridcandidato0.Rows(i).RowType = DataControlRowType.DataRow Then
                            If CType(Gridcandidato0.Rows(i).FindControl("Checkbox1"), CheckBox).Checked Then

                                sqlConvocacaoForm.InsertParameters("formaenc").DefaultValue = 9
                                sqlConvocacaoForm.InsertParameters("id_cadidato_fk").DefaultValue = Gridcandidato0.Rows(i).Cells(1).Text
                                Try
                                    sqlConvocacaoForm.Insert()

                                    total = total + 1
                                Catch ex As Exception
                                    lblMsg.Text = "Candidato e entrevista já foram agendados."
                                Finally
                                    lblMsg0.Text = "Você encaminhou: " + total.ToString + " candidato(s)."
                                    lblerro1.Text = "Você encaminhou: " + total.ToString + " candidato(s)."
                                End Try

                            End If
                        End If
                    Next

                    Gridcandidato0.DataBind()
                    GridEncaminhadosExtra.DataBind()
                    gridorientados.DataBind()
                    GridorientadosOK.DataBind()
                End If

            Else
                lblMsg0.Text = "*Selecione uma entrevista."
            End If

        End If


    End Sub

    Protected Sub btnIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnIncluir.Click

        Try

            sqlNovosCandidatosForm.Insert()
            'sqlEncaminharExtra.Insert()

            Limpar()
            GridNovosCandidatos.DataBind()
            lblmsgcandidatoextra.Text = "Candidato cadastrado."



        Catch ex As Exception

            lblmsgcandidatoextra.Text = "Erro: " + ex.Message.ToString
        End Try


    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvar.Click
        If GridEncaminhadosExtra.SelectedIndex <> -1 Then
            lblmsgcandidatoextra.Text = "Selecione um candidato."
        Else

            Try
                sqlNovosCandidatosForm.Update()
                GridNovosCandidatos.DataBind()
                GridNovosCandidatos.SelectedIndex = -1

                Limpar()
                desativarButao(False)
                lblmsgcandidatoextra.Text = "Candidato Alterado."
            Catch ex As Exception
                lblmsgcandidatoextra.Text = "Erro: " + ex.Message.ToString

            End Try

        End If
    End Sub

    Protected Sub ImageButton13_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton13.Click
        Limpar()
        desativarButao(False)
        lblmsgcandidatoextra.Text = ""
    End Sub

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

    Public Sub desativarButao(ByVal ativar As Boolean)
        btnIncluir.Visible = Not ativar
        btnSalvar.Visible = ativar

    End Sub

    Public Sub Limpar()
        txtnome.Text = ""
        txtDataNascimento.Text = ""
        txtidentificador.Text = ""
        txtbairro.Text = ""
        txttelefone.Text = ""
        cboid_formaenc_fk.SelectedValue = 0
    End Sub

    Public Function UltimoCandidatoExtra() As Integer
        Dim S As String = ""
        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "select max(id_candidato) as id_candidato_extra from tblcandidato where id_tipo_fk=2"

        Dim oCmd As SqlCommand = New SqlCommand(sSql, oCon)

        oCon.Open()

        Dim reader As SqlDataReader = oCmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            S = reader(0).ToString
        Else
            S = ""
        End If

        Return S

    End Function

    Protected Sub GridNovosCandidatos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridNovosCandidatos.SelectedIndexChanged
        desativarButao(True)
        getDados(GridNovosCandidatos.SelectedValue)
        lblmsgcandidatoextra.Text = ""
    End Sub

    Public Sub getDados(ByVal id As Integer)
        Dim oCon As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim sSql As String = "SELECT     c.id_candidato, c.nome, c.identificador_tipo, c.identificador, c.rg, c.id_nacionalidade, c.nascimento, c.sexo, c.id_estadocivil, c.endereco, c.numero,c.complemento, c.bairro, c.id_municipio, c.estado_fk, c.cep, c.telefone, c.celular, c.telefone_recado, c.email, c.dependentes, c.observacao, c.id_contato,c.ultima_atualizacao, c.id_descobriu_fk, c.descobriu_outros, c.observacoes, c.senha, c.id_deficiente_fk, c.emailnao, c.nomePai, c.nomeMae, c.cidade,c.lembrete, c.id_evento, c.tiposistema, c.id_tipo_fk, ce.id_candidatoentr, ce.id_cadidato_fk, ce.id_entrevista_fk, ce.Captador, ce.DataCaptacao,isnull(ce.FormaEnc,0) as FormaEnc FROM         tblCandidato AS c LEFT OUTER JOIN tblCandidatoEntrevista AS ce ON c.id_candidato = ce.id_cadidato_fk where c.id_candidato=@id"

        Dim oCmd As SqlCommand = New SqlCommand(sSql, oCon)

        Dim Pid As SqlParameter = New SqlParameter()
        Pid.ParameterName = "id"
        Pid.Value = id

        oCmd.Parameters.Add(Pid)

        oCon.Open()

        Dim reader As SqlDataReader = oCmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            txtnome.Text = reader("nome").ToString
            txtDataNascimento.Text = reader("nascimento")
            rdtiposistema.SelectedValue = reader("tipoSistema")
            cboid_sexo_fk.SelectedValue = reader("sexo")
            txtidentificador.Text = reader("identificador")
            cboid_municipio_fk.SelectedValue = reader("id_municipio")
            txtbairro.Text = reader("bairro") + ""
            txttelefone.Text = reader("telefone") + ""
            cboid_formaenc_fk.SelectedValue = reader("FormaEnc")

        Else
            txtnome.Text = ""
            txtDataNascimento.Text = ""
            txtidentificador.Text = ""
            txtbairro.Text = ""
            txttelefone.Text = ""
            cboid_formaenc_fk.SelectedValue = 0
        End If

        oCon.Dispose()
        oCmd.Dispose()
        reader.Close()
    End Sub

    Protected Sub GridNovosCandidatos_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridNovosCandidatos.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.FindControl("sqlprogramacaoent"), SqlDataSource).SelectParameters("identificador").DefaultValue = e.Row.Cells(2).Text

        End If
    End Sub


    Protected Sub rdSistema_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdtiposistema.SelectedIndexChanged
        If rdtiposistema.SelectedValue = 1 Then

            Panel18.Visible = True
            lblunidade.Visible = True
            cboid_unidade_fk.Visible = True

        Else

            Panel18.Visible = False
            lblunidade.Visible = False
            cboid_unidade_fk.Visible = False
        End If
    End Sub



    Protected Sub ImageButton16_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton16.Click
        If gridorientados.SelectedIndex <> -1 Then
            lblMsg.Text = "Selecione um candidato na lista."
        Else

            If GridEntrevistaRelac.SelectedIndex <> -1 Then

                Session("id_entrevista") = GridEntrevistaRelac.DataKeys(GridEntrevistaRelac.SelectedIndex).Values("id_entrevista")


                Dim total As Integer = 0

                If GridEntrevistaRelac.SelectedIndex = -1 Then
                    lblMsg.Text = "Selecione uma entrevista."
                Else
                    For i As Integer = 0 To gridorientados.Rows.Count - 1

                        If gridorientados.Rows(i).RowType = DataControlRowType.DataRow Then
                            If CType(gridorientados.Rows(i).FindControl("rdid_statusOrient"), RadioButtonList).SelectedIndex <> -1 And CType(gridorientados.Rows(i).FindControl("rdid_aptoEncam"), RadioButtonList).SelectedIndex <> -1 And CType(gridorientados.Rows(i).FindControl("txtorientacaocandidato"), TextBox).Text <> "" Then
                                SqlorientadosSemVaga.InsertParameters("id_statusOrient").DefaultValue = CType(gridorientados.Rows(i).FindControl("rdid_statusOrient"), RadioButtonList).SelectedValue
                                SqlorientadosSemVaga.InsertParameters("id_aptoEncam").DefaultValue = CType(gridorientados.Rows(i).FindControl("rdid_aptoEncam"), RadioButtonList).SelectedValue
                                SqlorientadosSemVaga.InsertParameters("id_candidato_fk").DefaultValue = CType(gridorientados.Rows(i).FindControl("lblcandidato"), Label).Text
                                SqlorientadosSemVaga.InsertParameters("id_entrevista_fk").DefaultValue = CType(gridorientados.Rows(i).FindControl("lblentrevista"), Label).Text

                                SqlorientadosSemVaga.InsertParameters("orientacaocandidato").DefaultValue = CType(gridorientados.Rows(i).FindControl("txtorientacaocandidato"), TextBox).Text
                                Try
                                    SqlorientadosSemVaga.Insert()

                                    total = total + 1
                                Catch ex As Exception

                                    lblfechamento.Text = "Você já inseriu esses candidatos para a entrevista selecionada."
                                Finally
                                    lblfechamento0.Text = "Você orientou: " + total.ToString + " candidato(s)."

                                End Try

                            End If
                        End If
                    Next

                    gridorientados.DataBind()
                    GridorientadosOK.DataBind()

                End If

            Else
                lblfechamento.Text = "*Selecione uma entrevista."
            End If

        End If

    End Sub

  
    Protected Sub Chkoferta0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Chkoferta0.SelectedIndexChanged
        If Chkoferta0.SelectedIndex = -1 Then
            lblerro.Text = "Seleção de ofertas não pode ser em branco."
        End If
    End Sub



    Protected Sub GridorientadosOK_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridorientadosOK.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.FindControl("sqlprogramacaoent0"), SqlDataSource).SelectParameters("id_entrevista_fk").DefaultValue = e.Row.Cells(0).Text

        End If
    End Sub

    Protected Sub GridEncaminhadosExtra_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridEncaminhadosExtra.SelectedIndexChanged
        Session("id_candidato") = GridEncaminhadosExtra.SelectedValue
        sqlEncaminhados0.Delete()
        SqlorientadosSemVaga.Delete()
        GridEncaminhadosExtra.DataBind()
        GridorientadosOK.DataBind()
        gridorientados.DataBind()
        Gridcandidato0.DataBind()
    End Sub

    Protected Sub GridEncaminhadosExtra_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridEncaminhadosExtra.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.FindControl("sqlprogramacaoent0"), SqlDataSource).SelectParameters("identificador").DefaultValue = e.Row.Cells(4).Text

        End If
    End Sub


End Class

