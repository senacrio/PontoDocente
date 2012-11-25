Imports Microsoft.VisualBasic
Imports System.net.Mail
Imports System.Data.SqlClient



Public Class Comunicacao2

    Shared Function EnviaEmail(ByVal sOrigem As String, ByVal sDestino As String, ByVal sAssunto As String, ByVal sMensagem As String) As String

        Dim sRet As String = ""
        Dim objMail As New MailMessage
        objMail.IsBodyHtml = True
        objMail.From = New MailAddress(sOrigem)
        'objMail.ReplyTo = New MailAddress("Sua senha é:...")
        objMail.To.Add(sDestino)
        objMail.Subject = sAssunto
        objMail.Body = sMensagem

        Dim smtp As New SmtpClient
        smtp.Host = "172.16.0.3"
        smtp.Port = "25"

        Try
            'ESTE SERVIDOR NÃO EXIGE AUTENTICAÇÃO
           ' Dim oLogin As New System.Net.NetworkCredential
           ' oLogin.UserName = "admin.comunica@rj.senac.br"
           ' oLogin.Password = "admin@2008"
           ' smtp.UseDefaultCredentials = False
           ' smtp.Credentials = oLogin
            smtp.Send(objMail)

            'REGISTRA EM BANCO
            Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
            Dim cSql As String = "INSERT INTO logMensagem(origem, destino, assunto, mensagem) VALUES ('" + sOrigem + "', '" + sDestino + "', '" + sAssunto + "', '" + sMensagem + "')"

            Dim cmd As New SqlCommand(cSql, conn)
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()
            cmd.Dispose()
            conn.Dispose()
        Catch ex As Exception
            sRet = ex.Message.ToString
        End Try


        objMail.Dispose()

        Return sRet

    End Function


    'OBJETIVO: Obter o endereço de email de um colaborador
    'RECEBE: Código do usuario(integer)
    'DEVOLVE: Endereço de eMail (string)
    'AUTOR: André Campos
    'EM: Julho/2007
    Shared Function EmailColaborador(ByVal nUsuario As Integer) As String

        Dim sRet As String

        Dim conn As SqlConnection = New SqlConnection(Dados.StringConexao())
        Dim cSql As String = "SELECT email from colaboradores WHERE id_colaborador=" + Str(nUsuario)
        Dim cmd As New SqlCommand(cSql, conn)
        cmd.Connection.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            sRet = reader("email")
        Else
            sRet = ""
        End If

        reader.Close()
        cmd.Dispose()
        conn.Dispose()

        Return sRet

    End Function

End Class
