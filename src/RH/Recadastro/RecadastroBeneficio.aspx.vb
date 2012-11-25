
Partial Class Beneficio_RecadastroBeneficio
    Inherits System.Web.UI.Page
#Region " Função "
    Private Function Cadastrado(ByVal Matricula As Integer, ByVal IDDependente As Integer) As Boolean
        Dim b As Boolean = False

        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select * from ansBeneficio where matricula=@matricula and iddependente=@iddependente", conn)

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "matricula"
        PMatricula.Value = Matricula
        PMatricula.DbType = DbType.Int32

        Dim PIDDependente As SqlParameter = New SqlParameter()
        PIDDependente.ParameterName = "iddependente"
        PIDDependente.Value = IDDependente
        PIDDependente.DbType = DbType.Int32

        cmd.Parameters.Add(PMatricula)
        cmd.Parameters.Add(PIDDependente)

        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            b = True
        Else
            b = False
        End If

        conn.Dispose()
        reader.Close()
        cmd.Dispose()

        Return b

    End Function

    Private Function PegaIdade(ByVal Matricula As Integer, ByVal IDDependente As Integer) As String
        Dim d As String = ""

        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select dat_nascimento from dbo.SGT_RHDependFunc where cdn_funcionario=@matricula and cdn_depend_func=@iddependente", conn)

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "matricula"
        PMatricula.Value = Matricula
        PMatricula.DbType = DbType.Int32

        Dim PIDDependente As SqlParameter = New SqlParameter()
        PIDDependente.ParameterName = "iddependente"
        PIDDependente.Value = IDDependente
        PIDDependente.DbType = DbType.Int32

        cmd.Parameters.Add(PMatricula)
        cmd.Parameters.Add(PIDDependente)

        conn.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            If IsDBNull(reader(0)) Then
                d = ""
            Else
                d = reader(0)
            End If

        End If

        conn.Dispose()
        reader.Close()
        cmd.Dispose()

        Return d

    End Function

    Private Function CalculaIdade(ByVal dtNascimento As Date) As Integer

        Dim idade As Integer = DateTime.Now.Year - dtNascimento.Year

        If DateTime.Now.Month < dtNascimento.Month Or (DateTime.Now.Month = dtNascimento.Month And DateTime.Now.Day < dtNascimento.Day) Then

            idade -= 1

        End If

        Return idade

    End Function
#End Region

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click

        Try

            If btnSalvar.CommandName = "Inserir" Then
                If Not Cadastrado(Session("c_matricula"), ddlDependentes.SelectedValue) Then
                    If txtDataNascimento.Text = "" And txtCPF.Text = "" Then
                        lblmsg.ForeColor = Drawing.Color.Red
                        lblmsg.Text = "Informe o CPF ou a Data de Nascimento."
                    Else
                        If (txtCPF.Text <> "" And txtDataNascimento.Text = "") Then
                            If ValidaCPF.CandidatoValidaCPF(txtCPF.Text) Then


                                If ddlDependentes.SelectedValue = 0 Then
                                    lblmsg.ForeColor = Drawing.Color.Red
                                    lblmsg.Text = "Selecione um dependente."
                                Else
                                    sqlRecadastro.Insert()
                                End If
                            Else
                                lblmsg.ForeColor = Drawing.Color.Red
                                lblmsg.Text = "CPF inválido."
                            End If
                        ElseIf (txtCPF.Text <> "" And txtDataNascimento.Text <> "") Then
                            If ValidaCPF.CandidatoValidaCPF(txtCPF.Text) Then
                                If ddlDependentes.SelectedValue = 0 Then
                                    lblmsg.ForeColor = Drawing.Color.Red
                                    lblmsg.Text = "Selecione um dependente."
                                Else
                                    sqlRecadastro.Insert()

                                End If
                            Else
                                lblmsg.ForeColor = Drawing.Color.Red
                                lblmsg.Text = "CPF inválido."
                            End If
                        ElseIf (txtCPF.Text = "" And txtDataNascimento.Text <> "") Then
                            If ddlDependentes.SelectedValue = 0 Then
                                lblmsg.ForeColor = Drawing.Color.Red
                                lblmsg.Text = "Selecione um dependente."
                            Else

                                If CalculaIdade(txtDataNascimento.Text) >= 18 Then
                                    lblmsg.ForeColor = Drawing.Color.Red
                                    lblmsg.Text = "Informe o CPF."
                                Else
                                    sqlRecadastro.Insert()
                                End If

                            End If


                        End If
                    End If
                Else
                    lblmsg.ForeColor = Drawing.Color.Red
                    lblmsg.Text = "Erro."
                End If
            Else
                If txtDataNascimento.Text = "" And txtCPF.Text = "" Then
                    lblmsg.ForeColor = Drawing.Color.Red
                    lblmsg.Text = "Informe pelo menos o CPF ou a Data de Nascimento."
                Else
                    If (txtCPF.Text <> "" And txtDataNascimento.Text = "") Then
                        If ValidaCPF.CandidatoValidaCPF(txtCPF.Text) Then


                            If ddlDependentes.SelectedValue = 0 Then
                                lblmsg.ForeColor = Drawing.Color.Red
                                lblmsg.Text = "Selecione um dependente."
                            Else
                                sqlRecadastro.Update()

                            End If
                        Else
                            lblmsg.ForeColor = Drawing.Color.Red
                            lblmsg.Text = "CPF inválido."
                        End If
                    ElseIf (txtCPF.Text <> "" And txtDataNascimento.Text <> "") Then
                        If ValidaCPF.CandidatoValidaCPF(txtCPF.Text) Then


                            If ddlDependentes.SelectedValue = 0 Then
                                lblmsg.ForeColor = Drawing.Color.Red
                                lblmsg.Text = "Selecione um dependente."
                            Else
                                sqlRecadastro.Update()
                            End If
                        Else
                            lblmsg.ForeColor = Drawing.Color.Red
                            lblmsg.Text = "CPF inválido."
                        End If
                    ElseIf (txtCPF.Text = "" And txtDataNascimento.Text <> "") Then
                        If ddlDependentes.SelectedValue = 0 Then
                            lblmsg.ForeColor = Drawing.Color.Red
                            lblmsg.Text = "Selecione um dependente."
                        Else
                            If CalculaIdade(txtDataNascimento.Text) >= 18 Then
                                lblmsg.ForeColor = Drawing.Color.Red
                                lblmsg.Text = "Informe o CPF."
                            Else
                                sqlRecadastro.Update()
                            End If

                        End If

                    End If
                End If
            End If

        Catch ex As Exception
            lblmsg.ForeColor = Drawing.Color.Red
            lblmsg.Text = "Erro: " + ex.Message.ToString
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Session("c_Matricula") = 2473
        If Page.IsPostBack Then
            lblmsg.Text = ""

        End If

        If Cadastrado(Session("c_matricula"), ddlDependentes.SelectedValue) Then
            btnSalvar.CommandName = "Editar"
        Else
            btnSalvar.CommandName = "Inserir"
        End If
    End Sub

    Protected Sub ddlDependentes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDependentes.SelectedIndexChanged
        If Cadastrado(Session("c_matricula"), ddlDependentes.SelectedValue) Then
            CRUD.Popula(ViewRecadastro, sqlRecadastro)
            btnSalvar.CommandName = "Editar"
        Else
            CRUD.Limpa(ViewRecadastro)
            txtnom_depend_func.Text = ddlDependentes.SelectedItem.ToString
            txtDataNascimento.Text = PegaIdade(Session("c_Matricula"), ddlDependentes.SelectedValue)
            btnSalvar.CommandName = "Inserir"
        End If
    End Sub

    Protected Sub sqlRecadastro_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqlRecadastro.Inserted
        lblmsg.ForeColor = Drawing.Color.Green
        lblmsg.Text = "Cadastro realizado com sucesso."
    End Sub

    Protected Sub sqlRecadastro_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqlRecadastro.Updated
        lblmsg.ForeColor = Drawing.Color.Green
        lblmsg.Text = "Cadastro realizado com sucesso."
    End Sub
End Class
