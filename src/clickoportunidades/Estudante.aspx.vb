Imports Dados
Imports Estudantes
Imports Cripto


Partial Class Estudante
    Inherits System.Web.UI.Page


    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click

        'Entra com o padrão de navegabilidade ativado

        ibtAlterarCurriculo.Enabled = True
        ibtAlterarCurriculo.ImageUrl = "~/icones/Standard/001_43.gif"
        ibtBuscarVagas.Enabled = True
        ibtBuscarVagas.ImageUrl = "~/icones/Standard/001_38.gif"

        'While apenas para estruturar decisões. Não há repetições.
        Dim oEstudante As New Estudantes

        While True

            'Já tem um usuário logado: navegabilidade total
            If Len(Session("id_candidato")) > 0 Then
                Exit While
            End If

            'Se não pegou o registro, é porque o estudante não existe
            If Not oEstudante.PegaRegistroCLICK(txtIdentificador.Text) Then
                Panel4.Visible = False
                lblAviso.Text = "Identificador ou senha não conferem. Acesso negado."
                'Desabilita botões
                ibtAlterarCurriculo.Enabled = False
                ibtAlterarCurriculo.ImageUrl = "~/icones/Gray/001_43.gif"
                ibtBuscarVagas.Enabled = False
                ibtBuscarVagas.ImageUrl = "~/icones/Gray/001_38.gif"
                Exit While

            End If
            'colocar o not novamamente
            If Not oEstudante.RegistroCLICK("senha") = crplost(txtSenha.Text) Then

                lblAviso.Text = "Identificador ou senha não conferem. Acesso negado."
                'Desabilita botões
                ibtAlterarCurriculo.Enabled = False
                ibtAlterarCurriculo.ImageUrl = "~/icones/Gray/001_43.gif"
                ibtBuscarVagas.Enabled = False
                ibtBuscarVagas.ImageUrl = "~/icones/Gray/001_38.gif"
                Exit While

            End If


            'Se chegou aqui é porque o identficador e a senha são válidos
            Dim sNome As String = oEstudante.RegistroCLICK("nome")

            sNome = Mid(sNome, 1, InStr(sNome, " ") - 1)

            If UCase(oEstudante.RegistroCLICK("sexo")) = "F" Then
                lblAviso.Text = sNome + ", seja Bem-vinda. Utilize as opções acima."
            Else
                lblAviso.Text = sNome + ", seja Bem-vindo. Utilize as opções acima."
            End If

            Session("id_candidato") = oEstudante.RegistroCLICK("id_candidato")
            Session("EstudanteIdentificador") = oEstudante.RegistroCLICK("identificador")
            Session("UsuarioLogado") = oEstudante.RegistroCLICK("Nome")

            oEstudante.Close()

            'De qualquer maneira, sai
            Exit While

        End While
        oEstudante.Close()
        txtIdentificador.Text = ""


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Panel4.Visible = True
        PanelEntra.Visible = True
        Panel3.Visible = False
        panLogin.Visible = False
        Panel5.Visible = False
    End Sub


    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If RadioButtonList1.SelectedValue = 1 Then
            txtIdentificador.Text = ""
            txtIdentificador.Mask = "##################"

        Else
            txtIdentificador.Text = ""
            txtIdentificador.Mask = "###.###.###-##"

        End If

    End Sub



    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim chaveRedirect As Boolean
        Try
            Dim oEstudantes As New Estudantes

            'Ativa ícone de lega ou não legal
            imgAviso.ImageUrl = "~/icones/Standard/001_18.gif"
            imgAviso.Visible = True

            'Valido o CPF digitado pelo estudante: (True ou False)
            If ValidaCPF.CandidatoValidaCPF(txtIdentificadorCad.Text) Then


                If oEstudantes.Cadastrado(txtIdentificadorCad.Text) Then

                    'Se o estudante já está cadastrado, não pode se cadastrar novamente
                    lblAviso.Text = "Você já está cadastrado como candidato."
                    chaveRedirect = 1

                Else
                    'O estudante pode usar o Click desde que formado em curso habilitador profissional
                    If oEstudantes.Habilitado(txtIdentificadorCad.Text) Then
                        Session("usuarioIdentificador") = txtIdentificadorCad.Text
                        lblAviso.Text = "Cadastro realizado. Volte para a página de Cadastro de Currículo e faça logon."

                        'Se pegou os dados do estudante, fazer inclusão. Se não inclui sem dados.
                        If oEstudantes.PegaRegistroSGA(txtIdentificadorCad.Text) Then

                            'Copia dados do SGA para a inclusao - DADOS PESSOAIS
                            sqlIncluiEstudante.InsertParameters("nome").DefaultValue = oEstudantes.RegistroSGA("nome")
                            sqlIncluiEstudante.InsertParameters("identificador").DefaultValue = Trim(oEstudantes.RegistroSGA("identificador"))
                            sqlIncluiEstudante.InsertParameters("identificador_tipo").DefaultValue = rblIdentificadorTipo.Text
                            sqlIncluiEstudante.InsertParameters("sexo").DefaultValue = Mid(oEstudantes.RegistroSGA("sexo"), 1, 1)
                            sqlIncluiEstudante.InsertParameters("endereco").DefaultValue = Trim(oEstudantes.RegistroSGA("endereco"))
                            sqlIncluiEstudante.InsertParameters("bairro").DefaultValue = Trim(oEstudantes.RegistroSGA("bairro"))
                            sqlIncluiEstudante.InsertParameters("cep").DefaultValue = Trim(oEstudantes.RegistroSGA("cep"))
                            sqlIncluiEstudante.InsertParameters("telefone").DefaultValue = Trim(oEstudantes.RegistroSGA("telefones"))
                            sqlIncluiEstudante.InsertParameters("email").DefaultValue = Trim(oEstudantes.RegistroSGA("email"))
                            sqlIncluiEstudante.InsertParameters("nascimento").DefaultValue = Trim(oEstudantes.RegistroSGA("nascimento"))

                            'Coloca "Outros" quando estado civil no SGA estiver NULL
                            If IsDBNull(oEstudantes.RegistroSGA("estado_civil")) Then
                                sqlIncluiEstudante.InsertParameters("id_estadocivil").DefaultValue = "O"
                            Else
                                sqlIncluiEstudante.InsertParameters("id_estadocivil").DefaultValue = Mid(oEstudantes.RegistroSGA("estado_civil"), 1, 1)
                            End If

                            sqlIncluiEstudante.InsertParameters("id_nacionalidade").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("estado_fk").DefaultValue = "RJ"
                            sqlIncluiEstudante.InsertParameters("id_municipio").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("id_deficiente_fk").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("senha").DefaultValue = crplost(txtSenhaCad.Text)
                            sqlIncluiEstudante.InsertParameters("id_descobriu_fk").DefaultValue = 2




                        Else

                            'Este caso acontece quando, por algum problema, não não foi possível ler os dados do SGA
                            lblAviso.Text = "Problemas no acesso aos seus dados. Currículo foi criado em branco."
                            sqlIncluiEstudante.InsertParameters("identificador").DefaultValue = txtIdentificador.Text
                            sqlIncluiEstudante.InsertParameters("identificador_tipo").DefaultValue = rblIdentificadorTipo.Text
                            sqlIncluiEstudante.InsertParameters("id_nacionalidade").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("estado_fk").DefaultValue = "RJ"
                            sqlIncluiEstudante.InsertParameters("id_municipio").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("senha").DefaultValue = crplost(txtSenhaCad.Text)
                            sqlIncluiEstudante.InsertParameters("id_estadocivil").DefaultValue = "O"
                            sqlIncluiEstudante.InsertParameters("id_deficiente_fk").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("id_descobriu_fk").DefaultValue = 2


                        End If

                        'Tendo ou não referências no SGA, faz a inclusão
                        sqlIncluiEstudante.Insert()

                        'Session para usuario logado
                        Session("usuarioLogado") = oEstudantes.RegistroSGA("nome")
                        Session("EstudanteIdentificador") = sqlIncluiEstudante.InsertParameters("identificador").DefaultValue

                        Response.Redirect("IntermediarioEstudante.aspx")
                    Else
                        lblAviso.Text = "Apenas alunos do SENAC que fizeram cursos de habilitação profissional podem utilizar este serviço."

                        'Ativa ícone de lega ou não legal
                        imgAviso.ImageUrl = "~/icones/Standard/001_19.gif"
                        imgAviso.Visible = True

                    End If
                End If
            Else
                lblAviso.Text = "Cpf inválido. Por favor, digite novamente."
            End If
        Catch ex As Exception
            lblAviso.Text = "Não é possível acessar o banco. Por favor, tente mais tarde. " + ex.Message
        End Try




    End Sub

    Protected Sub ibtLogoff_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtLogoff.Click
        Response.Clear()
        FormsAuthentication.SignOut()
        Session.Abandon()
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub ibtAlterarCurriculo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibtAlterarCurriculo.Click
        Dim strUsuario As String
        strUsuario = Session("UsuarioLogado")
        Response.Redirect("CurriculoManter.aspx?Usuario=" + strUsuario + "")

    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        Dim aluno As String
        Dim email As String
        Dim oMsg As New Mensagem
        Dim lembrete As String
        Dim cpf As String
        Dim oEstudante As New Estudantes
        Dim sEstudante As String

        If oEstudante.PegaRegistroCLICK(txtIdentificador.Text) Then
            If oEstudante.RegistroCLICK("email") IsNot DBNull.Value Then
                aluno = oEstudante.RegistroCLICK("nome")
                lembrete = oEstudante.RegistroCLICK("lembrete")
                email = oEstudante.RegistroCLICK("email")
                sEstudante = oEstudante.RegistroCLICK("nome") + ", CPF " + oEstudante.RegistroCLICK("identificador") + " "
                oMsg.De = "rafael.vieira@rj.senac.br"
                oMsg.Para = email
                oMsg.Assunto = "ClickOportunidades - Lembrete de senha. "
                oMsg.Texto += "Lembrete solicitado pelo aluno " + sEstudante + ":   " + lembrete
                oMsg.Envia()
                oMsg.Close()

                lblAviso.Text = "Lembrete foi enviado com sucesso."
            Else
                'Manda email para central do ClickOportunidade caso o aluno não possua email.
                cpf = oEstudante.RegistroCLICK("identificador")
                aluno = oEstudante.RegistroCLICK("nome")
                'email = oEstudante.RegistroCLICK("email")
                lembrete = oEstudante.RegistroCLICK("lembrete")
                oMsg.De = "rafael.vieira@rj.senac.br"
                oMsg.Para = "rafael.vieira@rj.senac.br"
                sEstudante = oEstudante.RegistroCLICK("nome") + ", CPF " + oEstudante.RegistroCLICK("identificador") + " "
                oMsg.Assunto = "ClickOportunidades - Lembrete de senha. "
                oMsg.Texto += "O aluno " + sEstudante + " não possui email. Lembrete:  " + lembrete
                oMsg.Envia()
                oMsg.Close()
                'Mensagem na tela caso ela nao possua email.
                lblAviso.Text = "Entre em contato com o ClickOportunidades no telefone: 21 2582-5529/5565."
                txtIdentificadorCad.Text = ""
            End If
        End If
    End Sub

    Protected Sub rblIdentificadorTipo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblIdentificadorTipo.SelectedIndexChanged
        If rblIdentificadorTipo.SelectedValue = 1 Then
            txtIdentificadorCad.Text = ""
            txtIdentificadorCad.Mask = "##################"

        Else
            txtIdentificadorCad.Text = ""
            txtIdentificadorCad.Mask = "###.###.###-##"

        End If
    End Sub

    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        'Já tem um usuário logado: navegabilidade total
        If Len(Session("id_candidato")) > 0 Then

            'Entra com o padrão de navegabilidade ativado
            ibtAlterarCurriculo.Enabled = True
            ibtAlterarCurriculo.ImageUrl = "~/icones/Standard/001_43.gif"

            ibtBuscarVagas.Enabled = True
            ibtBuscarVagas.ImageUrl = "~/icones/Standard/001_38.gif"
            ibtLogoff.Visible = True
            lblLogoff.Visible = True
            'Panel5.Visible = False
            'Panel2.Visible = True
            'panLogin.Visible = False
            'Panel3.Visible = False
            PanelEntra.Visible = False

            ibtAlterarCurriculo.Visible = True
            lblAlterarCurriculo.Visible = True
            ibtBuscarVagas.Visible = True
            lblBuscarVagas.Visible = True
            ibtTrocarsenha.Visible = True
            lblTrocasenha.Visible = True

            ibtAlterarCurriculo.Visible = True
            lblAlterarCurriculo.Visible = True
            ibtBuscarVagas.Visible = True
            lblBuscarVagas.Visible = True
            ibtLogoff.Visible = True
            lblLogoff.Visible = True
            ibtTrocarsenha.Visible = True
            lblTrocasenha.Visible = True

            'panLogin.Visible = False
            'Panel3.Visible = False
            'Panel5.Visible = False
            'Panel4.Visible = True


            'Trata os casos de troca de senha
            If Request.QueryString("novo_pass") = 1 Then
                lblAviso.Text = "Troca de senha realizada com sucesso. Utilize as opções acima. "
            Else
                lblAviso.Text = "Usuário: " + Session("UsuarioLogado")
            End If

        Else

            'Entra com o padrão de navegabilidade ativado, porque não há usuário logado
            ibtAlterarCurriculo.Enabled = False
            ibtAlterarCurriculo.ImageUrl = "~/icones/Standard/001_43.gif"
            ibtTrocarsenha.Visible = False
            lblTrocasenha.Visible = False
            ibtBuscarVagas.Enabled = False
            ibtBuscarVagas.ImageUrl = "~/icones/Standard/001_38.gif"

            'panLogin.Visible = True
            'Panel4.Visible = False
            'Panel5.Visible = True

            'If Session("UsuarioLogado") Is Nothing Then
            'lblAviso.Text = "Identificador ou senha não conferem. Acesso negado."
            'Else
            'lblAviso.Text = "Cadastro realizado. Volte para a página de Cadastro de Currículo e faça logon."
            'End If

        End If
    End Sub

    Protected Sub botaoCliqueAqui_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles botaoCliqueAqui.Click
        panLogin.Visible = True
        Panel3.Visible = True
        Panel5.Visible = True
        PanelEntra.Visible = False
        Panel4.Visible = False
    End Sub
End Class
