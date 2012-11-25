Imports System.Data.SqlClient
Partial Class Sos_PainelDeControle
    Inherits System.Web.UI.Page

    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
    Dim readerSOS As SqlDataReader
#Region " Funções "


    Private Function retornaNome(ByVal Matricula As String) As String
        Dim s As String = ""

        Dim cmd As SqlCommand = New SqlCommand("select nom_pessoa_fisic from viewSGT_RHFuncionario where cdn_funcionario=@Matricula", conn)

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "Matricula"
        PMatricula.Value = Matricula

        cmd.Parameters.Add(PMatricula)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()

        If reader.HasRows Then
            s = reader("nom_pessoa_fisic").ToString
        End If

        conn.Close()
        cmd.Dispose()
        reader.Close()


        Return s


    End Function

    Private Function retornaDescricao(ByVal IDChamado As Integer) As String
        Dim s As String = ""

        Dim cmd As SqlCommand = New SqlCommand("select descricao from sosChamado where idchamado=@idchamado", conn)

        Dim PIDChamado As SqlParameter = New SqlParameter
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado

        cmd.Parameters.Add(PIDChamado)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()

        If reader.HasRows Then
            s = reader("descricao").ToString
        End If

        conn.Close()
        cmd.Dispose()
        reader.Close()


        Return s


    End Function

    Private Function TempoMedio() As String
        Dim s As String = ""

        Dim cmd As SqlCommand = New SqlCommand("SELECT sum(DATEDIFF(n,datahoraabertura,getdate()))/count(*) as minutos from soschamado c inner join dbo.SGT_RHFuncionarioAtivo f on c.idsolicitante=f.cdn_funcionario where idstatus=1", conn)
        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()
        reader.Read()
        If reader.HasRows Then
            s = reader("minutos").ToString
        End If

        conn.Close()
        cmd.Dispose()
        reader.Close()


        Return s


    End Function

    Private Sub AlterarStatus(ByVal IDChamado As Integer, ByVal IDStatus As Integer)

        Dim cmd As SqlCommand = New SqlCommand("update sosChamado set IDStatus=@IDStatus where IDChamado=@IDChamado", conn)

        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado

        Dim PIDStatus As SqlParameter = New SqlParameter()
        PIDStatus.ParameterName = "IDStatus"
        PIDStatus.Value = IDStatus

        cmd.Parameters.Add(PIDChamado)
        cmd.Parameters.Add(PIDStatus)

        conn.Open()
        cmd.ExecuteNonQuery()
        conn.Close()

        cmd.Dispose()


    End Sub

    Private Function RetornaIDStatus(ByVal IDCHamado As Integer) As String
        Dim s As String = ""
        Dim cmd As SqlCommand = New SqlCommand("select IDStatus from sosChamado where IDChamado=@IDChamado", conn)

        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDCHamado

        cmd.Parameters.Add(PIDChamado)
        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()
        If reader.HasRows Then
            s = reader("IDStatus").ToString()
        End If

        conn.Close()
        cmd.Dispose()
        reader.Close()

        Return s
    End Function

    Private Function RetornaIDTecnico(ByVal IDChamado As Integer) As String
        Dim s As String = ""
        Dim cmd As SqlCommand = New SqlCommand("select IDTecnico from sosChamado where IDChamado=@IDChamado", conn)

        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado

        cmd.Parameters.Add(PIDChamado)
        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()
        If reader.HasRows Then
            s = reader("IDTecnico").ToString()
        End If

        conn.Close()
        cmd.Dispose()
        reader.Close()

        Return s

    End Function

    Private Function RetornaEmail(ByVal Matricula As String) As String
        Dim conex As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select login  from admPortalUsuario where matricula=@Matricula and ativo = 1", conex)
        Dim email As String = ""

        Dim oUsuarioAD As New UsuarioAD()


        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "Matricula"
        PMatricula.Value = Matricula

        cmd.Parameters.Add(PMatricula)
        conex.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        reader.Read()
        If reader.HasRows Then
            oUsuarioAD.PegaInfo(reader("Login").ToString)
            email = oUsuarioAD.c_Email


        End If

        cmd.Dispose()
        conex.Dispose()
        reader.Close()

        Return email
    End Function

    Private Function RetornaLogin(ByVal Matricula As String) As String
        Dim conex As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select login from admPortalUsuario where matricula=@Matricula and ativo = 1", conex)
        Dim email As String = ""

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "Matricula"
        PMatricula.Value = Matricula

        cmd.Parameters.Add(PMatricula)
        conex.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        reader.Read()
        If reader.HasRows Then
            email = reader("Login").ToString

        End If

        cmd.Dispose()
        conex.Dispose()
        reader.Close()

        Return email
    End Function

    Private Function NumSos(ByVal IDStatus As Integer) As String
        Dim cmd As SqlCommand = New SqlCommand("select count(*) as num from sosChamado c inner join dbo.SGT_RHFuncionarioAtivo f on c.idsolicitante=f.cdn_funcionario where IDStatus=@IDStatus", conn)

        Dim PIDStatus As SqlParameter = New SqlParameter()
        PIDStatus.ParameterName = "IDStatus"
        PIDStatus.Value = IDStatus

        cmd.Parameters.Add(PIDStatus)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()

        Dim s As String = reader("num").ToString()
        conn.Close()
        cmd.Dispose()

        Return s
    End Function

    Private Sub AnexoSOSACP(ByVal IDArquivo As Integer, ByVal IDAcompanhamento As Integer)
        Dim PIDArquivo As SqlParameter = New SqlParameter()

        PIDArquivo.ParameterName = "IDArquivo"
        PIDArquivo.Value = IDArquivo

        Dim PIDAcompanhamento As SqlParameter = New SqlParameter()
        PIDAcompanhamento.ParameterName = "IDAcompanhamento"
        PIDAcompanhamento.Value = IDAcompanhamento


        Dim cmd As SqlCommand = New SqlCommand("UPDATE sosArquivo SET IDAcompanhamento = @IDAcompanhamento WHERE (IDArquivo = @IDArquivo)", conn)

        cmd.Parameters.Add(PIDArquivo)
        cmd.Parameters.Add(PIDAcompanhamento)

        conn.Open()
        cmd.ExecuteNonQuery()

        cmd.Dispose()
        conn.Close()
    End Sub
    Private Function UltimoACP() As Integer
        Dim i As Integer
        Dim cmd As SqlCommand = New SqlCommand("select top 1 IDAcompanhamento from sosAcompanhamento where IDChamado=@IDChamado order by IDAcompanhamento desc", conn)

        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = Integer.Parse(lblCodigo.Text) 'Session("c_Matricula")

        cmd.Parameters.Add(PIDChamado)

        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)

        reader.Read()
        If reader.HasRows Then
            i = reader("IDAcompanhamento")
        End If

        reader.Close()

        Return i

        cmd.Dispose()

    End Function

    Public Function PegaUnidadeLotacao(ByVal sMatricula As String) As Integer
        Dim i As Integer

        Dim sSql As String = "SELECT cod_unid_lotac  FROM viewSGT_RHFuncionario where cdn_funcionario = '" + sMatricula + "' And dat_desligto_func is null"
        Dim oCmd As New SqlCommand(sSql, conn)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            i = oRd("cod_unid_lotac")
        End If

        oRd.Close()
        oCmd.Dispose()
        conn.Close()

        Return i
    End Function

    Public Function PegaUnidade(ByVal sLotacao As String) As Integer
        Dim i As Integer
        Dim sSql As String = "select id_unidade from viewSTG_RHUnidadeLotacao where(cod_unid_lotac =" + sLotacao + ")"
        Dim oCmd As New SqlCommand(sSql, conn)
        oCmd.Connection.Open()

        Dim oRd As SqlDataReader = oCmd.ExecuteReader()

        If oRd.HasRows Then
            oRd.Read()
            i = oRd("id_unidade")
        End If

        oRd.Close()
        oCmd.Dispose()
        conn.Close()

        Return i

    End Function
    Private Sub Alterar()
        MultiView2.ActiveViewIndex = 2
        readerSOS.Read()

        If readerSOS.HasRows Then
            ddlGrupoServico.SelectedValue = readerSOS("idGrupoServico")
            ddlGrupoServico.DataBind()
            ddlServico.DataBind()

            If ddlServico.Items.Count <> 0 Then
                ddlServico.SelectedValue = readerSOS("idServico")
            End If
            txtDescricao.Text = readerSOS("Descricao")
        End If
    End Sub

    Private Sub EditarSOS(ByVal IDChamado As Integer)
        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado

        Dim cmd As SqlCommand = New SqlCommand("select * from sosChamado where IDChamado = @IDChamado", conn)
        cmd.Parameters.Add(PIDChamado)
        conn.Open()

        readerSOS = cmd.ExecuteReader()



        Alterar()

        cmd.Dispose()
        conn.Dispose()
        readerSOS.Close()
    End Sub
    'Inclui acompanhamento
    'Retorna True ou False
    Private Function IncluirAcompanhamento(ByVal Historico As String, ByVal IDChamado As Integer, ByVal IDStatus As Integer) As Boolean
        Dim b As Boolean = False

        Dim PHistorico As SqlParameter = New SqlParameter()
        PHistorico.ParameterName = "Historico"
        PHistorico.Value = Historico

        Dim PIDChamado As SqlParameter = New SqlParameter("IDChamado", SqlDbType.Int, IDChamado)
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado

        Dim PIDStatus As SqlParameter = New SqlParameter()
        PIDStatus.ParameterName = "IDStatus"
        PIDStatus.Value = IDStatus

        Dim cmd As SqlCommand = New SqlCommand("insert into sosAcompanhamento(Historico,IDRegistrador,IDTecnico,DataHoraRegistro,IDChamado,IDStatus) values (@Historico,1,1,getdate(),@IDChamado,@IDStatus)", conn)

        cmd.Parameters.Add(PHistorico)
        cmd.Parameters.Add(PIDChamado)
        cmd.Parameters.Add(PIDStatus)

        conn.Open()
        Try
            cmd.ExecuteNonQuery()
            conn.Close()
            b = True
        Catch ex As Exception

            Response.Write(ex.Message.ToString())
            conn.Close()
            b = False
        End Try


        cmd.Dispose()

        Return b
    End Function

    Private Function ReclassificarSOS(ByVal IDGrupoServico As Integer, ByVal IDServico As Integer, ByVal IDChamado As Integer) As Boolean
        Dim b As Boolean = False

        Dim cmd As SqlCommand = New SqlCommand("UPDATE sosChamado SET IDGrupoServico = @IDGrupoServico, IDServico = @IDServico WHERE (IDChamado = @IDChamado)", conn)

        Dim PIDGrupoServico As SqlParameter = New SqlParameter()
        PIDGrupoServico.ParameterName = "IDGrupoServico"
        PIDGrupoServico.Value = IDGrupoServico

        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado





        Dim PIDServico As SqlParameter = New SqlParameter()
        PIDServico.ParameterName = "IDServico"
        PIDServico.Value = IDServico


        cmd.Parameters.Add(PIDChamado)
        cmd.Parameters.Add(PIDGrupoServico)
        cmd.Parameters.Add(PIDServico)


        conn.Open()

        cmd.ExecuteNonQuery()
        conn.Close()

        If IncluirAcompanhamento("Chamado foi reclassificado.", IDChamado, RetornaIDStatus(IDChamado)) Then
            b = True
        Else
            b = False
        End If

        cmd.Dispose()
        Return b

    End Function
#End Region

    Protected Sub btnFiltrar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnFiltrar.Click
        Timer2.Interval = txtTempo.Text + "000"
        grdSOS.SelectedIndex = -1
        grdSOS.DataBind()


    End Sub

    Protected Sub grdSOS_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSOS.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim sdsAnexos As SqlDataSource = e.Row.FindControl("sdsAnexos")
            sdsAnexos.SelectParameters("IDChamado").DefaultValue = e.Row.Cells(1).Text
            sdsAnexos.DataBind()

        End If

    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick

        MultiView2.ActiveViewIndex = Menu1.SelectedValue
        grdAcompanhamento.DataBind()

    End Sub

    Protected Sub grdSOS_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdSOS.SelectedIndexChanged
        lblCodigo.Text = grdSOS.SelectedValue
        Session("IDSolicitante") = grdSOS.DataKeys(grdSOS.SelectedIndex).Values("IDSolicitante")
        Session("IDStatus") = grdSOS.DataKeys(grdSOS.SelectedIndex).Values("IDStatus")
        Session("IDTecnico") = grdSOS.DataKeys(grdSOS.SelectedIndex).Values("IDTecnico")
        grdAcompanhamento.DataBind()
        'MultiView2.ActiveViewIndex = 1
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click



        Dim descricao As String = retornaDescricao(lblCodigo.Text)


        Dim email As String = RetornaEmail(Session("IDSolicitante"))

        'AJUSTE ATÉ A MIGRAÇÃO DE EMAIL PARA O SQL SERVER 
        'If RetornaLogin(Session("c_Matricula")) = "flavia.oliveira" Then
        '    email = "flavia.cabral@rj.senac.br"

        'ElseIf RetornaLogin(Session("c_Matricula")) = "flavia.moreira" Then
        '    email = "flavia.oliveira@rj.senac.br"
        'End If

        'Pegar chamado para o técnico
        If IsDBNull(Session("IDTecnico")) Then

            sdsAlteraTecnico.Update()
            Session("IDTecnico") = RetornaIDTecnico(lblCodigo.Text)
            IncluirAcompanhamento("Chamado está em andamento.", lblCodigo.Text, 2)
            grdSOS.DataBind()
            Session("IDTecnico") = RetornaIDTecnico(lblCodigo.Text)
            Session("IDStatus") = RetornaIDStatus(lblCodigo.Text)
            'Comunicacao.EnviaEmail("sos@rj.senac.br", email, "Sistema SOS", "Sua sos código " + lblCodigo.Text + ", com a descrição: <br /><br />'" + descricao + "', está em andamento.")
        End If

        'Finalizar chamado
        If cboFinalizar.SelectedValue = "sim" Then

            IncluirAcompanhamento("Chamado finalizado pelo técnico.", lblCodigo.Text, 3)
            AlterarStatus(lblCodigo.Text, 3)
            try
            Comunicacao.EnviaEmail("sos@rj.senac.br", email, "Sistema SOS", "Sua sos de número: " + lblCodigo.Text + ", com a descrição: <br /><br />'" + descricao + "', foi finalizada Por favor, nos ajude a melhorar a qualidade de nosso atendimento respondendo uma breve pesquisa de satisfação <a href='http://intranet.rj.senac.br/sos/PesquisaSatisfacao.aspx?id=" + lblCodigo.Text.ToString + "'>Quero responder a pesquisa.</a>")
			Catch
			end try 
			
            cboFinalizar.SelectedIndex = 0
            Session("IDStatus") = 3
            grdSOS.DataBind()
            MultiView2.ActiveViewIndex = 0
            Menu1.Items(0).Selected = True
            Session("IDTecnico") = RetornaIDTecnico(lblCodigo.Text)
            Session("IDStatus") = RetornaIDStatus(lblCodigo.Text)
            grdSOS.SelectedIndex = -1
            lblErro.Text = "Chamado finalizado."
        End If

        'Cancelar chamado
        If cboFinalizar.SelectedValue = "cancel" Then

            IncluirAcompanhamento("Chamado cancelado pelo técnico.", lblCodigo.Text, 7)
            AlterarStatus(lblCodigo.Text, 8)
            try
            Comunicacao.EnviaEmail("sos@rj.senac.br", email, "Sistema SOS", "Sua sos de número: " + lblCodigo.Text + ", com a descrição: <br /><br />'" + descricao + "', foi cancelada.")
			Catch
			end try 
            cboFinalizar.SelectedIndex = 0
            Session("IDStatus") = 8
            grdSOS.DataBind()
            MultiView2.ActiveViewIndex = 0
            Menu1.Items(0).Selected = True
            Session("IDTecnico") = RetornaIDTecnico(lblCodigo.Text)
            Session("IDStatus") = RetornaIDStatus(lblCodigo.Text)
            grdSOS.SelectedIndex = -1
            lblErro.Text = "Chamado cancelado."
        End If

        'Transferir chamado
        If ddlTecnicos.SelectedValue.Length <> 0 Then

            sdsTransferir.Update()
            Session("IDTecnico") = RetornaIDTecnico(lblCodigo.Text)
            grdSOS.DataBind()

            IncluirAcompanhamento("Técnico alterado de: " + retornaNome(Session("c_Matricula")) + " para: " + ddlTecnicos.SelectedItem.ToString, lblCodigo.Text, Session("IDStatus"))
			try
            Comunicacao.EnviaEmail("sos@rj.senac.br", RetornaEmail(ddlTecnicos.SelectedValue), "Sistema SOS", "SOS código: " + lblCodigo.Text + ", com a descrição: <br /><br />'" + descricao + "', foi transferida para você.")
			Catch
			end try
            ddlTecnicos.SelectedIndex = 0
            MultiView2.ActiveViewIndex = 0
            Menu1.Items(0).Selected = True
            Session("IDTecnico") = RetornaIDTecnico(lblCodigo.Text)
            Session("IDStatus") = RetornaIDStatus(lblCodigo.Text)
            lblErro.Text = "Chamado foi transferido."
        End If

		try
        Comunicacao.EnviaEmail("sos@rj.senac.br", email, "Acompanhamento SOS", "Código da SOS: " + lblCodigo.Text + ", com a descrição: <br /><br />'" + descricao + "'<br /><br />Acompanhamento: " + txtTexto.Text + "<br/> <br /> Responda esse acompanhamento via sistema. <br /> <br /> Registrado por: " + retornaNome(Session("c_Matricula")))
		Catch
		end try


        sdsAcompanhamento.Insert()
        sdsAcompanhamento.DataBind()


        ddlTecnicos.DataBind()

        txtDescricaoAcp.Text = ""

        txtTexto.Text = ""
    End Sub

    Protected Sub btnCancelarAc_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelarAc.Click
        MultiView1.ActiveViewIndex = 0
    End Sub



    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim btn As Button = sender
        EditarSOS(btn.CommandArgument)
        Session("IDChamado") = btn.CommandArgument
        lblCodigoE.Text = btn.CommandArgument
        btn.Dispose()
    End Sub

    Protected Sub btnResolver_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnResolver.Click
        grdSOS.SelectedIndex = -1
        If ReclassificarSOS(ddlGrupoServico.SelectedValue, ddlServico.SelectedValue, Integer.Parse(lblCodigoE.Text)) Then
            lblErro.Text = "Registro alterado."
            grdSOS.DataBind()
            Menu1.Items(0).Selected = True
            MultiView2.ActiveViewIndex = 0
        End If


    End Sub

    Protected Sub View3_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles View3.Load
        Dim status As String = ""
        Dim idtecnico As String = ""
        Timer1.Enabled = True
        Try
            status = RetornaIDStatus(Integer.Parse(lblCodigo.Text))
            idtecnico = RetornaIDTecnico(Integer.Parse(lblCodigo.Text))
        Catch

        End Try





        Dim matricula As String = Trim(Session("c_Matricula"))


        If idtecnico = "" Then
            pnlAcp.Visible = True
        Else
            If idtecnico = matricula Then

                If status = "2" Or status = "1" Then
                    pnlAcp.Visible = True
                Else
                    pnlAcp.Visible = False
                End If
            Else
                pnlAcp.Visible = False
            End If
        End If






        If lblCodigo.Text = "" Then
            pnlAcp.Visible = False
        End If

    End Sub



    Protected Sub Timer_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        grdAcompanhamento.DataBind()


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblErro.Text = ""


        lblTempo.Text = TempoMedio() + " min"
        lblSOSAberta.Text = NumSos(1)
        lblAndamento.Text = NumSos(2)
        lblTotalSOS.Text = UtilitariosSOS.totalSos()

        Session("sIDLotacao") = PegaUnidadeLotacao(Session("c_Matricula"))
        Session("sIDUnidade") = PegaUnidade(Session("sIDLotacao"))

        If ddlSOSC.SelectedValue = 0 Then
            sdsPainelSOS.SelectParameters("IDUnidade").DefaultValue = Session("sIDUnidade")
            sdsPainelSOS.SelectParameters("IDTecnico").DefaultValue = "%"
        ElseIf ddlSOSC.SelectedValue = 1 Then
            sdsPainelSOS.SelectParameters("IDTecnico").DefaultValue = "%"
            sdsPainelSOS.SelectParameters("IDUnidade").DefaultValue = "%"
        ElseIf ddlSOSC.SelectedValue = 2 Then
            sdsPainelSOS.SelectParameters("IDUnidade").DefaultValue = "%"
            sdsPainelSOS.SelectParameters("IDTecnico").DefaultValue = Integer.Parse(Session("c_Matricula"))


        End If



    End Sub

    Protected Sub btnRejeitar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRejeitar.Click
        sdsRejeitar.Update()
        grdSOS.DataBind()
        IncluirAcompanhamento("Chamado rejeitado. Motivo: " + txtJustificativa.Text, lblCodigoE.Text, 5)
		try
        Comunicacao.EnviaEmail("sos@rj.senac.br", RetornaEmail(RetornaIDTecnico(lblCodigoE.Text)), "SOS rejeitada.", "Sua SOS código: " + lblCodigoE.Text + " foi rejeitada." + Chr(13) + "Motivo: " + txtJustificativa.Text)
		Catch
		end try
        MultiView2.ActiveViewIndex = 0
    End Sub

    Protected Sub grdAcompanhamento_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdAcompanhamento.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim sdsAnexos As SqlDataSource = e.Row.FindControl("sdsAnexos")
            sdsAnexos.SelectParameters("IDAcompanhamento").DefaultValue = grdAcompanhamento.DataKeys(e.Row.RowIndex).Values("IDAcompanhamento")
            sdsAnexos.DataBind()

        End If
    End Sub



    Protected Sub View2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles View2.Load

    End Sub



    Protected Sub ImageButton7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton7.Click
        MultiView2.ActiveViewIndex = 0
        Menu1.Items(0).Selected = True

    End Sub

    Protected Sub ImageButton8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton8.Click
        MultiView2.ActiveViewIndex = 0
        Menu1.Items(0).Selected = True
    End Sub



    Protected Sub btnAdcionar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAdcionar.Click
        Dim cfile, cpath As String

        If FileUpload2.HasFile Then

            cfile = FileUpload2.FileName
            cpath = MapPath("~/Sos/Anexos/")
            FileUpload2.SaveAs(cpath + cfile)
            IncluirAcompanhamento(txtDescricaoAcp.Text, Integer.Parse(lblCodigo.Text), RetornaIDStatus(lblCodigo.Text))

            sdsAnexosACP.InsertParameters("IDAcompanhamento").DefaultValue = UltimoACP()
            sdsAnexosACP.Insert()

        End If



       


        grdAcompanhamento.DataBind()

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim btn As Button = sender

        Session("stIDChamado") = btn.CommandArgument

        btn.Dispose()

        MultiView2.ActiveViewIndex = 4

    End Sub

    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad

    End Sub


    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

    End Sub



    Protected Sub ddlStatusC_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlStatusC.DataBound
        ddlStatusC.SelectedIndex = 1
    End Sub


    Protected Sub Timer2_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        grdSOS.DataBind()

    End Sub

    Protected Sub grdSOS_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSOS.RowCreated

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim btn As Button = e.Row.FindControl("Button2")
            ScriptManager1.RegisterPostBackControl(btn)
        End If

    End Sub

    Protected Sub sdsPainelSOS_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sdsPainelSOS.Selected
        lblTotal.Text = "Total listado abaixo: " + e.AffectedRows.ToString
    End Sub

    Protected Sub Timer3_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer3.Tick
        lblTempo.Text = TempoMedio() + " min"
        lblSOSAberta.Text = NumSos(1)
        lblAndamento.Text = NumSos(2)
        lblTotalSOS.Text = UtilitariosSOS.totalSos()
    End Sub

    Protected Sub sdsAcompanhamento_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sdsAcompanhamento.Selecting

    End Sub
End Class
