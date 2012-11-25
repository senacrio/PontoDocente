Imports Microsoft.VisualBasic
'Imports smsHuman

Public Class EmailVIP
    Shared Function RetornaLogin(ByVal Matricula As String) As String
        Dim login As String = ""
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)
        Dim cmd As SqlCommand = New SqlCommand("select login from senac.dbo.admPortalUsuario where matricula=@Matricula", conn)

        Dim PMatricula As SqlParameter = New SqlParameter()
        PMatricula.ParameterName = "Matricula"
        PMatricula.Value = Matricula

        cmd.Parameters.Add(PMatricula)
        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()
        reader.Read()

        If reader.HasRows Then
            login = reader("login").ToString
        End If

        conn.Dispose()
        reader.Close()
        cmd.Dispose()

        Return login


    End Function


    'Shared Function EnviarSMS(ByVal Celular As String, ByVal Msg As String, ByVal De As String) As String
    '    Dim sms As smsHuman.smsStructure = New smsHuman.smsStructure()

    '    sms.account = "senacrio"
    '    sms.code = "T8q9HUoqS4"
    '    sms.mobile = Celular
    '    sms.msg = Msg
    '    sms.from = De

    '    Dim retorno As String = "" 'smsHuman.EnviaSMS(sms)


    '    Return retorno

    'End Function


    Shared Function LoginVip(ByVal login As String) As Boolean
        Dim b As Boolean = False
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)

        Dim cmd As SqlCommand = New SqlCommand("select login from sosVip where login=@login", conn)

        Dim PLogin As SqlParameter = New SqlParameter()
        PLogin.ParameterName = "login"
        PLogin.Value = login

        cmd.Parameters.Add(PLogin)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        reader.Read()

        If reader.HasRows Then
            b = True
        Else
            b = False
        End If

        conn.Dispose()
        cmd.Dispose()
        reader.Close()

        Return b

    End Function


    Shared Sub EnviaEmailVip(ByVal Solicitante As String, ByVal Msg As String)


        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SistemaSOS").ToString)

        Dim cmd As SqlCommand = New SqlCommand("select login from sosVipContato", conn)

        conn.Open()

        Dim reader As SqlDataReader = cmd.ExecuteReader()

        If reader.HasRows Then

            While reader.Read()

                Comunicacao.EnviaEmail("admin.comunica@rj.senac.br", reader(0).ToString() + "@rj.senac.br", "Prontidão: " + Solicitante, Msg)


            End While

        End If


        conn.Close()
        reader.Close()



    End Sub

End Class
