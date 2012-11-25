Imports Dados
Imports Estudantes
Imports Cripto

Partial Class clickoportunidades_AdmCandidatoCadastro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Context.Session("c_Nome") Is Nothing Then
            Response.Redirect("Seguranca.htm")
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
            If ValidaCPF.CandidatoValidaCPF(txtIdentificador.Text) Then


                If oEstudantes.Cadastrado(txtIdentificador.Text) Then

                    'Se o estudante já está cadastrado, não pode se cadastrar novamente
                    lblaviso.Text = "Candidato já foi candidato."
                    chaveRedirect = 1

                Else
                    'O estudante pode usar o Click desde que formado em curso habilitador profissional
                    If oEstudantes.Habilitado(txtIdentificador.Text) Then
                        Session("usuarioIdentificador") = txtIdentificador.Text
                        lblaviso.Text = "Cadastro realizado."

                        'Se pegou os dados do estudante, fazer inclusão. Se não inclui sem dados.
                        If oEstudantes.PegaRegistroSGA(txtIdentificador.Text) Then

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
                            'If IsDBNull(oEstudantes.RegistroSGA("estado_civil")) Then
                            ' sqlIncluiEstudante.InsertParameters("id_estadocivil").DefaultValue = "O"
                            'Else
                            '    sqlIncluiEstudante.InsertParameters("id_estadocivil").DefaultValue = Mid(oEstudantes.RegistroSGA("estado_civil"), 1, 1)
                            'End If

                            'Estado civil não será carregado do SGA. Data da alteração: 29/09/2008
                            sqlIncluiEstudante.InsertParameters("id_estadocivil").DefaultValue = "S"
                            sqlIncluiEstudante.InsertParameters("id_nacionalidade").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("estado_fk").DefaultValue = "RJ"
                            sqlIncluiEstudante.InsertParameters("id_municipio").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("id_deficiente_fk").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("senha").DefaultValue = crplost(txtSenha.Text)
                            sqlIncluiEstudante.InsertParameters("id_descobriu_fk").DefaultValue = 2

                        Else

                            'Este caso acontece quando, por algum problema, não não foi possível ler os dados do SGA
                            lblaviso.Text = "Problemas no acesso aos dados. Currículo foi criado em branco."
                            sqlIncluiEstudante.InsertParameters("identificador").DefaultValue = txtIdentificador.Text
                            sqlIncluiEstudante.InsertParameters("identificador_tipo").DefaultValue = rblIdentificadorTipo.Text
                            sqlIncluiEstudante.InsertParameters("id_nacionalidade").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("estado_fk").DefaultValue = "RJ"
                            sqlIncluiEstudante.InsertParameters("id_municipio").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("senha").DefaultValue = crplost(txtSenha.Text)
                            sqlIncluiEstudante.InsertParameters("id_estadocivil").DefaultValue = "O"
                            sqlIncluiEstudante.InsertParameters("id_deficiente_fk").DefaultValue = 1
                            sqlIncluiEstudante.InsertParameters("id_descobriu_fk").DefaultValue = 2


                        End If

                        'Tendo ou não referências no SGA, faz a inclusão
                        sqlIncluiEstudante.Insert()

                        'Session para usuario logado

                        Session("usuarioLogado") = oEstudantes.RegistroSGA("nome")
                        Session("EstudanteIdentificador") = sqlIncluiEstudante.InsertParameters("identificador").DefaultValue
                        Session("id_candidato") = oEstudantes.PegaID(txtIdentificador.Text)

                        Response.Redirect("AdmIntermediarioEstudante.aspx")



                    Else
                        lblaviso.Text = "Apenas alunos do SENAC que fizeram cursos de habilitação profissional podem utilizar este serviço."

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

    Protected Sub rblIdentificadorTipo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblIdentificadorTipo.SelectedIndexChanged
        If rblIdentificadorTipo.SelectedValue = 1 Then
            txtIdentificador.Text = ""
            txtIdentificador.Mask = "##################"

        Else
            txtIdentificador.Text = ""
            txtIdentificador.Mask = "###.###.###-##"

        End If
    End Sub


End Class
