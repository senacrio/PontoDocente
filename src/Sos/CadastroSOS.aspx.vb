Imports System.Data.SqlClient
Imports EmailVIP

Partial Class Sos_CadastroSOS
    Inherits System.Web.UI.Page

    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
    Dim readerSOS As SqlDataReader
#Region " Funções "

    Private Function IncluirAcompanhamentoAnexo(ByVal Historico As String, ByVal IDChamado As Integer, ByVal IDStatus As Integer) As Boolean
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


    Private Function IncluirAcompanhamentoStatus(ByVal Historico As String, ByVal IDChamado As Integer, ByVal IDStatus As Integer) As Boolean
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


    Private Sub AlteraStatus(ByVal IDChamado As Integer, ByVal IDStatus As Integer)

        Dim cmd As SqlCommand = New SqlCommand("update sosChamado set IDStatus=@IDStatus where IDChamado=@IDChamado", conn)

        Dim PIDchamado As SqlParameter = New SqlParameter()
        PIDchamado.ParameterName = "IDChamado"
        PIDchamado.Value = IDChamado

        Dim PIDstatus As SqlParameter = New SqlParameter()
        PIDstatus.ParameterName = "IDStatus"
        PIDstatus.Value = IDStatus

        cmd.Parameters.Add(PIDchamado)
        cmd.Parameters.Add(PIDstatus)
        conn.Open()
        cmd.ExecuteNonQuery()

        conn.Close()
        cmd.Dispose()

    End Sub

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

    Private Sub Alterar()
        MultiView1.ActiveViewIndex = 1

        readerSOS.Read()

        If readerSOS.HasRows Then

            cboIDGrupoServico.SelectedValue = readerSOS("idGrupoServico")
            cboIDGrupoServico.DataBind()
            cboIDServico.DataBind()

            If cboIDServico.Items.Count <> 0 Then
                cboIDServico.SelectedValue = readerSOS("idServico")
            End If

            txtDescricao.Text = readerSOS("Descricao")

        End If
    End Sub
    Private Sub AnexoSOS(ByVal IDArquivo As Integer, ByVal IDChamado As Integer)

        Dim PIDArquivo As SqlParameter = New SqlParameter()

        PIDArquivo.ParameterName = "IDArquivo"
        PIDArquivo.Value = IDArquivo

        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado


        Dim cmd As SqlCommand = New SqlCommand("UPDATE sosArquivo SET IDChamado = @IDChamado WHERE (IDArquivo = @IDArquivo)", conn)
        cmd.Parameters.Add(PIDArquivo)
        cmd.Parameters.Add(PIDChamado)
        conn.Open()
        cmd.ExecuteNonQuery()

        cmd.Dispose()
        conn.Close()



    End Sub
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
    'Retorna o id do ultimo chamado 
    Private Function UltimoChamado() As Integer
        Dim i As Integer
        Dim cmd As SqlCommand = New SqlCommand("select top 1 IDChamado from sosChamado where IDSolicitante=@IDSolicitante order by IDChamado desc", conn)

        Dim PIDsolicitante As SqlParameter = New SqlParameter()
        PIDsolicitante.ParameterName = "IDSolicitante"
        PIDsolicitante.Value = Session("c_Matricula")

        cmd.Parameters.Add(PIDsolicitante)


        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)

        reader.Read()
        If reader.HasRows Then
            i = reader("IDChamado")
        End If

        reader.Close()
        cmd.Dispose()

        Return i
    End Function

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
    'Inclui acompanhamento
    'Retorna True ou False
    Private Function IncluirAcompanhamento(ByVal Historico As String, ByVal IDChamado As Integer) As Boolean
        Dim b As Boolean = False

        Dim PHistorico As SqlParameter = New SqlParameter()
        PHistorico.ParameterName = "Historico"
        PHistorico.Value = Historico


        Dim PIDChamado As SqlParameter = New SqlParameter()
        PIDChamado.ParameterName = "IDChamado"
        PIDChamado.Value = IDChamado



        Dim cmd As SqlCommand = New SqlCommand("insert into sosAcompanhamento(Historico,IDRegistrador,IDTecnico,DataHoraRegistro,IDChamado,IDStatus) values (@Historico,1,NULL,getdate(),@IDChamado,1)", conn)

        cmd.Parameters.Add(PHistorico)
        cmd.Parameters.Add(PIDChamado)

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

    'Abri chamado e chama função IncluirAcompanhamento() com status Aberto
    'Retorna True ou False
    Private Function AbrirChamado(ByVal IDUnidade As Integer, ByVal Descricao As String, ByVal IDLotacao As Integer, ByVal IDTecnico As Integer, ByVal IDSolicitante As Integer, ByVal IDGrupoServico As Integer, ByVal IDStatus As Integer, ByVal IDServico As Integer, ByVal vnc As String, ByVal telefone As String) As Boolean
        Dim b As Boolean = False

        Dim PDescricao As SqlParameter = New SqlParameter()
        PDescricao.ParameterName = "Descricao"
        PDescricao.Value = Descricao

        Dim PIDGrupoServico As SqlParameter = New SqlParameter()
        PIDGrupoServico.ParameterName = "IDGrupoServico"
        PIDGrupoServico.Value = IDGrupoServico

        Dim PIDServico As SqlParameter = New SqlParameter()
        PIDServico.ParameterName = "IDServico"
        PIDServico.Value = IDServico

        Dim PIDLotacao As SqlParameter = New SqlParameter()
        PIDLotacao.ParameterName = "IDLotacao"
        PIDLotacao.Value = Session("IDLotacao")

        Dim PIDUnidade As SqlParameter = New SqlParameter()
        PIDUnidade.ParameterName = "IDUnidade"
        PIDUnidade.Value = Session("IDUnidade")

        Dim PVnc As SqlParameter = New SqlParameter()
        PVnc.ParameterName = "vnc"
        PVnc.Value = vnc

        Dim PTelefone As SqlParameter = New SqlParameter()
        PTelefone.ParameterName = "telefone"
        PTelefone.Value = telefone


        Dim cmd As SqlCommand = New SqlCommand("INSERT INTO sosChamado(IDUnidade,IDLotacao,IDTecnico,IDSolicitante,Descricao,DataHoraAbertura,IDGrupoServico,IDServico,IDStatus,vnc,telefone) values (@IDUnidade,@IDLotacao,NULL," + Context.Session("c_Matricula") + ",@Descricao,getdate(),@IDGrupoServico,@IDServico,1,@vnc,@telefone)", conn)
        cmd.Parameters.Add(PDescricao)
        cmd.Parameters.Add(PIDGrupoServico)
        cmd.Parameters.Add(PIDServico)
        cmd.Parameters.Add(PIDLotacao)
        cmd.Parameters.Add(PIDUnidade)
        cmd.Parameters.Add(PVnc)
        cmd.Parameters.Add(PTelefone)

        conn.Open()

        cmd.ExecuteNonQuery()

        conn.Close()

        If IncluirAcompanhamento("Chamado Aberto.", UltimoChamado()) Then
            b = True
        Else
            b = False
        End If

        cmd.Dispose()
        Return b


    End Function

#End Region


    Protected Sub tabMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles tabMenu.MenuItemClick
        MultiView2.ActiveViewIndex = tabMenu.SelectedValue
        If grdSOS.SelectedIndex <> -1 Then
            pnlAnexo.Enabled = True
        Else
            pnlAnexo.Enabled = False
        End If


        grdAcompanhamento.DataBind()

    End Sub

    Protected Sub ddlGrupoServico_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboIDGrupoServico.DataBound
        Dim reader As SqlDataReader = ToolTip.retornaDescricaoGrupoServico()
        Dim ddl As DropDownList = sender

        If reader.HasRows Then
            'Coloca a descrição no tooltip de cada item 
            Try
                For i As Integer = 0 To ddl.Items.Count - 1
                    reader.Read()
                    ddl.Items(i).Attributes.Add("title", reader("descricao"))
                Next
            Catch
            Finally
                reader.Close()
            End Try
        End If

    End Sub

    Protected Sub ddlServico_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboIDServico.DataBound
        'Dim reader As SqlDataReader = ToolTip.retornaDescricaoServico(cboIDGrupoServico.SelectedValue)
        'Dim ddl As DropDownList = sender

        'If reader.HasRows Then
        '    'Coloca a descrição no tooltip de cada item 
        '    For i As Integer = 0 To ddl.Items.Count - 1
        '        reader.Read()
        '        ddl.Items(i).Attributes.Add("title", reader("descricao"))
        '    Next

        '    reader.Close()

        'End If
    End Sub

    Protected Sub btnIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnIncluir.Click

        If btnIncluir.CommandName = "Incluir" Then
            If AbrirChamado(1, txtDescricao.Text, 1, 1, 1, cboIDGrupoServico.SelectedValue, 1, IIf(cboIDGrupoServico.SelectedValue = 5, 33, cboIDServico.SelectedValue), txtVNC.Text, txttelefone.Text) Then
                Session("SIDChamado") = UltimoChamado()

                'ENVIA SMS PARA OS TÉCNICOS CADASTRADOS NO SOSVIP
                'If SosVip.LoginVip(SosVip.RetornaLogin(Session("c_Matricula"))) Then

                '    SosVip.EnviaSmsVip(Session("c_Nome"), txtDescricao.Text)

                'End If

                Dim ramal As SOSRamal = New SOSRamal()
                ramal.Matricula = Session("c_Matricula")
                ramal.PegaRamal()

                If ramal.Ramal <> "" Then
                    If ramal.Ramal <> txttelefone.Text Then
                        ramal.Matricula = Session("c_matricula")
                        ramal.Ramal = txttelefone.Text
                        ramal.AtualizaRamal()
                    End If
                Else
                    If txttelefone.Text <> "" Then
                        ramal.Matricula = Session("c_Matricula")
                        ramal.Ramal = txttelefone.Text
                        ramal.CadastrarRamal()
                    End If
                End If


                'ENVIA EMAILS PARA OS TÉCNICOS CADASTRADOS NO SOSVIP
                If EmailVIP.LoginVip(EmailVIP.RetornaLogin(Session("c_Matricula"))) Then
                    EmailVIP.EnviaEmailVip(Context.Session("c_Nome"), cboIDServico.SelectedItem.ToString + " - " + txtDescricao.Text)

                End If


                'ENVIA EMAIL PARA EQUIPE GESIST INFORMANDO O DESLIGAMENTO
                'If (cboIDServico.SelectedValue = 33) Then
                '    Comunicacao.EnviaEmail("sos@rj.senac.br", "tecnologias@rj.senac.br", "Prontidão: Desligamento", txtDescricao.Text)
                '    Comunicacao.EnviaEmail("sos@rj.senac.br", "sistemas@rj.senac.br", "Prontidão: Desligamento", txtDescricao.Text)
                'End If

                'ENVIA EMAIL PARA KLEMAR E MAX (SOLICITAÇÃO DE SENHA PARA RAMAL)

                If cboIDGrupoServico.SelectedValue <> 5 Then

                    If (cboIDServico.SelectedValue = 37) Then
                        Comunicacao.EnviaEmail("sos@rj.senac.br", "Klemar.Wanzeller@rj.senac.br", "Prontidão: Solicitação de senha para Ramal", txtDescricao.Text)
                        Comunicacao.EnviaEmail("sos@rj.senac.br", "max.borsoi@rj.senac.br", "Prontidão: Solicitação de senha para Ramal", txtDescricao.Text)
                        'Comunicacao.EnviaEmail("sos@rj.senac.br", "tiago.marques@rj.senac.br", "Prontidão: Solicitação de senha para Ramal", txtDescricao.Text)
                    End If

                End If

                'AJUSTE ATÉ A MIGRAÇÃO DE EMAIL PARA O SQL SERVER 
                'If RetornaLogin(Session("c_Matricula")) = "flavia.oliveira" Then
                '    Comunicacao.EnviaEmail("sos@rj.senac.br", "flavia.cabral@rj.senac.br", "Sistema SOS", "Seu chamado foi aberto. Código: " + Session("SIDChamado").ToString + "<br /><br /> Descrição: " + txtDescricao.Text)
                'ElseIf RetornaLogin(Session("c_Matricula")) = "flavia.moreira" Then
                '    Comunicacao.EnviaEmail("sos@rj.senac.br", "flavia.oliveira@rj.senac.br", "Sistema SOS", "Seu chamado foi aberto. Código: " + Session("SIDChamado").ToString + "<br /><br /> Descrição: " + txtDescricao.Text)
                'Else

                'End If
                Try
                    Comunicacao.EnviaEmail("sos@rj.senac.br", Session("sEmail").ToString, "Sistema SOS", "Seu chamado foi aberto. Código: " + Session("SIDChamado").ToString + "<br /><br /> Descrição: " + txtDescricao.Text)
                Catch
                End Try


                cboIDGrupoServico.SelectedIndex = 0
                cboIDGrupoServico.DataBind()
                txtDescricao.Text = ""
                txtVNC.Text = ""
                txttelefone.Text = ""
                'MultiView1.ActiveViewIndex = 0

                grdArquivo.DataBind()
                lblErro.Text = "Chamado aberto."
                lblSOS.Text = "Chamado Aberto. Agora você pode anexar arquivos clicando na aba 'Anexo'."
                tabMenu2.Items(1).Enabled = True



            End If

        ElseIf btnIncluir.CommandName = "Alterar" Then

            Try
                sdsChamadoInc.Update()
                For i As Integer = 0 To grdArquivo.Rows.Count - 1
                    AnexoSOS(grdArquivo.DataKeys(i).Values("IDArquivo"), Session("SIDChamado"))
                Next
                lblErro.Text = "Registro alterado."
            Catch ex As Exception
                lblErro.Text = "Erro: " + ex.Message.ToString()
            Finally
                MultiView1.ActiveViewIndex = 0
                grdSOS.DataBind()

            End Try

        End If

        grdSOS.DataBind()

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        btnIncluir.CommandName = "Incluir"
        grdSOS.SelectedIndex = -1
        Session("SIDChamado") = ""
        tabMenu2.Items(1).Enabled = False
        tabMenu2.Items(0).Selected = True
        MultiView3.ActiveViewIndex = 0
        Try
            cboIDGrupoServico.SelectedIndex = 0
            cboIDGrupoServico.DataBind()
            cboIDServico.DataBind()
            cboIDServico.SelectedIndex = 0

        Catch
        End Try
        txtDescricao.Text = ""
        MultiView1.ActiveViewIndex = 1

        Dim ramal As SOSRamal = New SOSRamal()
        ramal.Matricula = Session("c_Matricula")
        ramal.PegaRamal()

        If ramal.Ramal <> "" Then
            txttelefone.Text = ramal.Ramal
            Session("RamalAntigo") = ramal.Ramal
        Else
            txttelefone.Text = ""
        End If
        lblservico.Visible = True
        cboIDServico.Visible = True
        RequiredFieldValidator7.Enabled = True
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelar.Click
        MultiView1.ActiveViewIndex = 0
        grdSOS.DataBind()
    End Sub

    Protected Sub grdSOS_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdSOS.SelectedIndexChanged
        Session("IDStatus") = grdSOS.DataKeys(grdSOS.SelectedIndex).Values("IDStatus")
        Session("IDTecnico") = grdSOS.DataKeys(grdSOS.SelectedIndex).Values("IDTecnico")
        Session("IDChamado") = grdSOS.SelectedValue

        grdAcompanhamento.DataBind()
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        If IsDBNull(Session("IDTecnico")) Then
            Session("IDTecnico") = "1"
        End If
        sdsAcompanhamento.Insert()
      
        txtDescricaoAcp.Text = ""

        grdAcompanhamento.DataBind()
        txtTexto.Text = ""

    End Sub

    Protected Sub View2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles View2.Load
        lblCodigo.Text = grdSOS.SelectedValue
        If grdSOS.SelectedIndex <> -1 Then
            pnlACP.Enabled = True
        Else
            pnlACP.Enabled = False
        End If

    End Sub

    Protected Sub btnFiltrar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnFiltrar.Click
        grdSOS.DataBind()
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim btn As ImageButton = sender
        Session("SIDChamado") = btn.CommandArgument

        tabMenu2.Items(1).Enabled = True

        grdArquivo.DataBind()

        'CRUD.Popula(View6, sdsChamadoEdt)
        MultiView1.ActiveViewIndex = 1

        EditarSOS(btn.CommandArgument)

        btnIncluir.CommandName = "Alterar"
        btnIncluir.CausesValidation = False
        btn.Dispose()


    End Sub

    Protected Sub ImageButton5_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        Dim cfile, cpath As String


        If btnIncluir.CommandName = "Incluir" Then
            If FileUpload1.HasFile Then

                cfile = FileUpload1.FileName
                cpath = MapPath("~/Sos/Anexos/")
                FileUpload1.SaveAs(cpath + cfile)
                lblErroArq.Text = "Arquivo salvo."
                Session("IDUltimoChamado") = UltimoChamado()
                sdsArquivo.Insert()
            End If
        Else
            If FileUpload1.HasFile Then

                cfile = FileUpload1.FileName
                cpath = MapPath("~/Sos/Anexos/")
                FileUpload1.SaveAs(cpath + cfile)
                lblErroArq.Text = "Arquivo salvo."
                Session("IDUltimoChamado") = Session("SIDChamado")
                sdsArquivo.Insert()
            End If
        End If
        grdArquivo.DataBind()

    End Sub

    Protected Sub tabMenu2_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles tabMenu2.MenuItemClick
        MultiView3.ActiveViewIndex = tabMenu2.SelectedValue
    End Sub

    Protected Sub grdSOS_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSOS.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim sdsAnexos As SqlDataSource = e.Row.FindControl("sdsArquivosLinha")
            sdsAnexos.SelectParameters("IDChamado").DefaultValue = e.Row.Cells(1).Text
            sdsAnexos.DataBind()
        End If

    End Sub


    Protected Sub grdSOS_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdSOS.RowCommand
        lblErro.Text = ""

    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        grdAcompanhamento.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Session("c_Matricula") = "9987"

        lblErro.Text = ""
        lblErroArq.Text = ""
        lblSOS.Text = ""


        Session("sEmail") = RetornaEmail(Session("c_Matricula"))
        Session("IDLotacao") = PegaUnidadeLotacao(Session("c_Matricula"))
        Session("IDUnidade") = PegaUnidade(Session("IDLotacao"))

        If ddlSOSC.SelectedValue = 0 Then
            sdsChamado.SelectParameters("IDUnidade").DefaultValue = "%"
            sdsChamado.SelectParameters("IDSolicitante").DefaultValue = Integer.Parse(Session("c_Matricula"))
        Else
            sdsChamado.SelectParameters("IDSolicitante").DefaultValue = "%"
            sdsChamado.SelectParameters("IDUnidade").DefaultValue = Session("IDUnidade")

        End If


    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

    End Sub

    Protected Sub btnAdcionar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAdcionar.Click
        Dim cfile, cpath As String

        If FileUpload2.HasFile Then

            cfile = FileUpload2.FileName
            cpath = MapPath("~/Sos/Anexos/")
            FileUpload2.SaveAs(cpath + cfile)
            IncluirAcompanhamentoAnexo(txtDescricaoAcp.Text, Integer.Parse(lblCodigo.Text), RetornaIDStatus(lblCodigo.Text))
            sdsAnexosAcp.InsertParameters("IDAcompanhamento").DefaultValue = UltimoACP()
            sdsAnexosAcp.Insert()
        End If

        txtDescricaoAcp.Text = ""

        grdAcompanhamento.DataBind()
    End Sub

    Protected Sub grdAcompanhamento_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAcompanhamento.DataBound

    End Sub

    Protected Sub grdAcompanhamento_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdAcompanhamento.RowDataBound



        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim sdsAnexo As SqlDataSource = e.Row.FindControl("sdsAnexosLinhaACP")
            sdsAnexo.SelectParameters("IDAcompanhamento").DefaultValue = grdAcompanhamento.DataKeys(e.Row.RowIndex).Values("IDAcompanhamento")
            sdsAnexo.DataBind()
        End If

    End Sub

    Protected Sub btnCancelarAc_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelarAc.Click

    End Sub

    Protected Sub ImageButton8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton8.Click
        MultiView1.ActiveViewIndex = 0
        grdSOS.DataBind()
    End Sub

    Protected Sub ImageButton9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton9.Click
        MultiView1.ActiveViewIndex = 0
        grdSOS.DataBind()
    End Sub

    Protected Sub btnAdcionar_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdcionar.Load



    End Sub

    Protected Sub ImageButton10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim btn As ImageButton = sender

        AlteraStatus(btn.CommandArgument, 6)

        IncluirAcompanhamentoStatus("Chamado excluído pelo usuário", btn.CommandArgument, 6)
        grdSOS.DataBind()


    End Sub

    Protected Sub cboIDGrupoServico_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboIDGrupoServico.SelectedIndexChanged
        Dim ramal As SOSRamal = New SOSRamal()
        ramal.Matricula = Session("c_Matricula")
        ramal.PegaRamal()

        If cboIDGrupoServico.SelectedValue = 5 Then
            lblservico.Visible = False
            cboIDServico.Visible = False
            RequiredFieldValidator7.Enabled = False
        Else
            lblservico.Visible = True
            cboIDServico.Visible = True
            RequiredFieldValidator7.Enabled = True
        End If

        If ramal.Ramal <> "" Then
            txttelefone.Text = ramal.Ramal

        Else
            txttelefone.Text = ""
        End If
    End Sub
End Class
