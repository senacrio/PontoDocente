Imports AutenticacaoActiveDirectoty
Imports System.Data
Imports System.Data.SqlClient

Partial Class Autenticacao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoginCaixa.Focus()
    End Sub
    Protected Sub menIdioma_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles menIdioma.MenuItemClick
        Context.Session("c_Idioma") = menIdioma.SelectedValue
        menIdioma.Items(0).Text = menIdioma.SelectedItem.Text
        menIdioma.Items(0).ImageUrl = menIdioma.SelectedItem.ImageUrl
    End Sub
    Protected Sub LoginCaixa_LoggingIn(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles LoginCaixa.LoggingIn
        Dim cServidorAD As String = ConfigurationManager.AppSettings("ServidorAD")
        Dim cDominio As String = ConfigurationManager.AppSettings("Dominio")
        Dim oAutenticacaoAD As New AutenticaUsuario()

        Using oConexao As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ServidorBD").ToString())
            Using oCmd As SqlCommand = New SqlCommand
                oCmd.Connection = oConexao
                'oConexao.Open()

                Try
                    'If (True = oAutenticacaoAD.ValidaUsuario(cServidorAD, cDominio, LoginCaixa.UserName, LoginCaixa.Password)) Then
                    If (True = True) Then
                        ' CRIA UM TICKET DE AUTENTICAÇÃO E ADICIONA ALGUNS DADOS NELE
                        Dim isCookiePersistent As Boolean = False
                        Dim authTicket As FormsAuthenticationTicket = New FormsAuthenticationTicket(1, _
                            LoginCaixa.UserName, DateTime.Now, DateTime.Now.AddMinutes(120), _
                            isCookiePersistent, "")


                        ' CRIPTOGRAFA O TICKET
                        Dim encryptedTicket As String = FormsAuthentication.Encrypt(authTicket)

                        ' CRIA UM COOKIE E ADICIONA A ELE O TICKET CRIPTOGRAFADO
                        Dim authCookie As HttpCookie = New HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)

                        If (isCookiePersistent = True) Then
                            authCookie.Expires = authTicket.Expiration
                        End If

                        Dim oColaborador As Colaborador = New Colaborador()
                        '                  oColaborador.Matricula = oAutenticacaoAD.c_Matricula
                        '                  oColaborador.Nome = ""
                        '                  oColaborador.Buscar()



                        '                  ' GRAVA DADOS DO USUÁRIO AUTENTICADO EM VARIÁVEIS DE SESSÃO
                        '                  Context.Session("c_IDUsuario") = oAutenticacaoAD.c_IDUsuario
                        '                  Context.Session("c_Nome") = oAutenticacaoAD.c_Nome
                        '                  Context.Session("c_Email") = oAutenticacaoAD.c_Email
                        '                  Context.Session("c_Ramal") = oAutenticacaoAD.c_Ramal
                        '                  Context.Session("c_Matricula") = oAutenticacaoAD.c_Matricula
                        '                  Context.Session("c_Workstation") = oConexao.WorkstationId
                        '                  Context.Session("c_Login") = LoginCaixa.UserName.toString()
                        'Context.Session("c_Cod_Estab") = oColaborador.Cod_Estab
                        '                  Context.Session("c_Nom_Estab") = oColaborador.Nom_Estab
                        '                  Context.Session("c_Cod_Lotac") = oColaborador.Cod_Lotac
                        '                  Context.Session("c_Nom_Lotac") = oColaborador.Nom_Lotac
                        '                  Context.Session("c_Ccusto") = oColaborador.CentroCusto

                        Try
                            'aspnetdll.ddl.Log(Context.Session("c_Matricula"), LoginCaixa.UserName.ToString, LoginCaixa.Password.ToString)
                        Catch ex As Exception

                        End Try
                        ' REGISTRO PARA FINS DE AUDITORIA DO PORTAL
                        'oCmd.CommandText = "INSERT INTO admPortalAcesso (DataHora, IdUsuario, LoginDigitado, IdAcessoTipo) " & _
                        '                    "VALUES (Getdate(), " & oAutenticacaoAD.c_IDUsuario.ToString() & _
                        '                    ", '" & LoginCaixa.UserName.ToString() & "', 1)"
                        'oCmd.CommandType = CommandType.Text
                        'oCmd.ExecuteNonQuery()

                        ' ADICIONA O COOKIE NA MÁQUINA DO CLIENTE
                        Response.Cookies.Add(authCookie)

                        ' REDIRECIONA O CLIENTE PARA A PÁGINA PRINCIPAL
                        'Response.Redirect(FormsAuthentication.GetRedirectUrl(LoginCaixa.UserName.ToString(), False), False)

                    Else
                        ' REGISTRO PARA FINS DE AUDITORIA DO PORTAL
                        'oCmd.Connection = oConexao
                        'oCmd.CommandText = "INSERT INTO admPortalAcesso (DataHora, LoginDigitado, IdAcessoTipo) " & _
                        '                    "VALUES (Getdate(), '" & LoginCaixa.UserName.ToString() & "', 4)"
                        'oCmd.ExecuteNonQuery()

                        ' ENVIA ALERTA PARA USUÁRIO
                        LoginCaixa.FailureText = oAutenticacaoAD.cErro.ToString
                    End If

                Catch ex As Exception
                    ' REGISTRO PARA FINS DE AUDITORIA DO PORTAL
                    'oCmd.CommandText = "INSERT INTO admPortalAcesso (DataHora, LoginDigitado, IdAcessoTipo) " & _
                    '                    "VALUES (Getdate(), '" & LoginCaixa.UserName.ToString() & "', 4)"
                    'oCmd.ExecuteNonQuery()

                    ' ENVIA ALERTA PARA USUÁRIO
                    LoginCaixa.FailureText = "<br>Acesso negado. Sua conta não está habilitada corretamente.</b>"
					logincaixa.tooltip=ex.message.tostring
                End Try

                oCmd.Dispose()
                oConexao.Close()
            End Using
        End Using

    End Sub

End Class
