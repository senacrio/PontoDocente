<%
'Contem o SMTP padrao para o Envio de Emails
Const strSMTP = "smtp.seusite.com.br"
'Contem o Componente que é utilizado para o envio de emails:
'    - "ASPMAIL" 
'    - "ASPEMAIL"
'    - "CDONTS"
'    - "CDOSYS"
Const strComponenteEmail = "CDOSYS"
%>
<%
'-----------------------------------------------------
'Funcao: EnviaEmail(p_strNomeFROM, p_strEmailFROM, p_strNomeTO, p_strEmailTO, p_strEmailCC, p_strEmailBCC, p_strTipoEmail, p_strAssuntoEmail, p_strMensagem)
'Sinopse: Envia um email utilizando o componente configurado
'Parametros:
'            p_strNomeFROM          : Contem o Nome do Remetente
'            p_strEmailFROM         : Contem o Email do Remetente
'            p_strNomeTO            : Contem o Nome do Destinatario
'            p_strEmailTO           : Contem o Email ou Emails de quem vai receber a mensagem
'            p_strEmailCC           : Contem o Email ou Emails de quem vai receber a copia da mensagem
'            p_strEmailBCC          : Contem o Email ou Emails de quem vai receber a copia oculta da mensagem
'            p_strTipoEmail         : Tipo de Mensagem que sera enviada ("HTML" ou "TEXTO")
'            p_strAssuntoEmail      : Contem o Assunto do Email
'            p_strMensagem          : Mensagem do Email
'Retorno: String ("OK" quando for executada com sucesso)
'Autor: Gabriel Fróes (www.codigofonte.com.br)
'-----------------------------------------------------
Function EnviaEmail(p_strNomeFROM, p_strEmailFROM, p_strNomeTO, p_strEmailTO, p_strEmailCC, p_strEmailBCC, p_strTipoEmail, p_strAssuntoEmail, p_strMensagem)
    'On Error Resume Next
    
    ' *********************
    ' Utilizando o ASPMAIL
    ' *********************
    If strComponenteEmail = "ASPMAIL" Then
        'Variáveis e Objetos
        Dim objASPMail
        Set objASPMail = Server.CreateObject ("SMTPsvg.Mailer")
                    
        objASPMail.FromName        = p_strNomeFROM
        objASPMail.FromAddress     = p_strEmailFROM
        objAspMail.RemoteHost      = strSMTP
        objAspMail.AddRecipient    p_strNomeTO, p_strEmailTO
        If Not p_strEmailCC = "" Then
            objAspMail.Addcc           "", p_strEmailCC
        End If
        If Not p_strEmailBCC = "" Then
            objAspMail.AddBcc          "", p_strEmailBCC
        End If
        objAspMail.Subject         =  p_strAssuntoEmail
        objAspMail.BodyText        = p_strMensagem
            
        'Verificando o tipo de mensagem (default é TEXTO)
        If p_strTipoEmail = "HTML" Then
            objAspMail.ContentType = "text/html"
        End If

        'Verifica se a mensagem foi enviada com sucesso e retorna a funcao
        If objAspMail.SendMail Then
            EnviaEmail = "OK"
        Else
            EnviaEmail = "Não foi possível enviar o email, por favor entre em contato com <a href='mailto:" & p_strEmailTO & "?subject=Erro%20ao%20enviar%20email%20pelo%20site'>" & p_strEmailTO & "</a> e escreva o erro abaixo."
        End If

        'Destruindo Objetos
        Set objAspMail = Nothing

        If Err.Number <> 0 Then
            EnviaEmail = EnviaEmail & "<br>Erro:" & Err.Description
        End If
        Exit Function
    End If 'Fim da Utilização do ASPMAIL

    ' *********************
    ' Utilizando o ASPEMAIL
    ' *********************
    If strComponenteEmail = "ASPEMAIL" Then
        'Variáveis e Objetos
        Dim objASPEMail
        Set objASPEMail = Server.CreateObject ("Persits.MailSender")
            
        objASPEMail.FromName        = p_strNomeFROM
        objASPEMail.From            = p_strEmailFROM
        objASPEMail.Host            = ServidorSMTP
        objASPEMail.AddAddress        p_strEmailTO, p_strNomeTO
        If Not p_strEmailCC = "" Then
            objASPEMail.AddCc           p_strEmailCC, ""
        End If
        If Not p_strEmailBCC = "" Then
            objASPEMail.AddBcc            p_strEmailBCC, ""
        End If
        objASPEMail.Subject         = p_strAssuntoEmail
        objASPEMail.Body            = p_strMensagem
                
        'Verificando o tipo de mensagem (default é TEXTO)
        If p_strTipoEmail = "HTML" Then
            objASPEMail.IsHTML = True
        End If

        'Verifica se a mensagem foi enviada com sucesso e retorna a funcao
        If objASPEMail.Send Then
            EnviaEmail = "OK"
        Else
            EnviaEmail = "Não foi possível enviar o email, por favor entre em contato com <a href='mailto:" & p_strEmailTO & "?subject=Erro%20ao%20enviar%20email%20pelo%20site'>" & p_strEmailTO & "</a> e escreva o erro abaixo."
        End If

        'Destruindo Objetos
        Set objASPEMail = Nothing

        If Err.Number <> 0 Then
            EnviaEmail = EnviaEmail & "<br>Erro:" & Err.Description
        End If
        Exit Function
    End If 'Fim da Utilização do ASPEMAIL
    
    ' *********************
    ' Utilizando o CDONTS
    ' *********************
    If strComponenteEmail = "CDONTS" Then
        'Variáveis e Objetos
        Dim objCDONTS
        Set objCDONTS = Server.CreateObject ("CDONTS.NewMail")

        objCDONTS.From        = p_strEmailFROM
        objCDONTS.To          = p_strEmailTO
        objCDONTS.CC          = p_strEmailCC
        objCDONTS.BCC         = p_strEmailBCC
        objCDONTS.Subject     = p_strAssuntoEmail
        objCDONTS.Body        = p_strMensagem

        'Verificando o tipo de mensagem (default é TEXTO)
        If p_strTipoEmail = "HTML" Then
            objCDONTS.BodyFormat = 0
            objCDONTS.MailFormat = 0
        End If

        'Verifica se a mensagem foi enviada com sucesso e retorna a funcao
        Call objCDONTS.Send
        If Err.Number = 0 Then
            EnviaEmail = "OK"
        Else
            EnviaEmail = "Não foi possível enviar o email, por favor entre em contato com <a href='mailto:" & p_strEmailTO & "?subject=Erro%20ao%20enviar%20email%20pelo%20site'>" & p_strEmailTO & "</a> e escreva o erro abaixo."
        End If

        'Destruindo Objetos
        Set objCDONTS = Nothing

        If Err.Number <> 0 Then
            EnviaEmail = EnviaEmail & "<br>Erro:" & Err.Description
        End If
        Exit Function
    End If 'Fim da Utilização do CDONTS
    
    ' *********************
    ' Utilizando o CDOSYS
    ' *********************
    If strComponenteEmail = "CDOSYS" Then
        Dim objCDOSYS
        Dim objCDOSYSConf
        Set objCDOSYS        = Server.CreateObject("CDO.Message") 
        Set objCDOSYSConf    = Server.CreateObject ("CDO.Configuration") 

        'Configurando o envio de e-mail
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = strSMTP
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30 
        objCDOSYSConf.Fields.update 
        Set objCDOSYS.Configuration = objCDOSYSConf 


        objCDOSYS.From        = p_strEmailFROM
        objCDOSYS.To        = p_strEmailTO
        objCDOSYS.CC        = p_strEmailCC
        objCDOSYS.BCC        = p_strEmailBCC
        objCDOSYS.Subject    = p_strAssuntoEmail

        'Verificando o tipo de mensagem (default é TEXTO)
        If p_strTipoEmail = "HTML" Then
            objCDOSYS.HTMLBody    = p_strMensagem
        Else
            objCDOSYS.TextBody    = p_strMensagem
        End If

        'Verifica se a mensagem foi enviada com sucesso e retorna a funcao
        Call objCDOSYS.Send
        If Err.Number = 0 Then
            EnviaEmail = "OK"
        Else
            EnviaEmail = "Não foi possível enviar o email, por favor entre em contato com <a href='mailto:" & p_strEmailTO & "?subject=Erro%20ao%20enviar%20email%20pelo%20site'>" & p_strEmailTO & "</a> e escreva o erro abaixo."
        End If

        'Destruindo Objetos
        Set objCDOSYSConf = Nothing
        Set objCDOSYS = Nothing

        If Err.Number <> 0 Then
            EnviaEmail = EnviaEmail & "<br>Erro:" & Err.Description
        End If
        Exit Function
    End If 'Fim da Utilização do CDOSYS
End Function
%>


<%
'Teste da função de enviar email
Dim strResultado
strResultado = EnviaEmail("NOME REMETENTE", "email@remetente.com.br", "NOME DESTINARARIO", "email@destinatario.com.br", "", "", "HTML", "Teste de Email", "<b>Alo <i>VOCÊ</i></b> isso é um teste de envio de email com <u>HTML</u>.")
Response.Write strComponenteEmail & "<br>" & strResultado
%><%
'Contem o SMTP padrao para o Envio de Emails
Const strSMTP = "smtp.seusite.com.br"

'Contem o Componente que é utilizado para o envio de emails:
'    - "ASPMAIL" 
'    - "ASPEMAIL"
'    - "CDONTS"
'    - "CDOSYS"
Const strComponenteEmail = "CDOSYS"
%>

<%
'-----------------------------------------------------
'Funcao: EnviaEmail(p_strNomeFROM, p_strEmailFROM, p_strNomeTO, p_strEmailTO, p_strEmailCC, p_strEmailBCC, p_strTipoEmail, p_strAssuntoEmail, p_strMensagem)
'Sinopse: Envia um email utilizando o componente configurado
'Parametros:
'            p_strNomeFROM          : Contem o Nome do Remetente
'            p_strEmailFROM         : Contem o Email do Remetente
'            p_strNomeTO            : Contem o Nome do Destinatario
'            p_strEmailTO           : Contem o Email ou Emails de quem vai receber a mensagem
'            p_strEmailCC           : Contem o Email ou Emails de quem vai receber a copia da mensagem
'            p_strEmailBCC          : Contem o Email ou Emails de quem vai receber a copia oculta da mensagem
'            p_strTipoEmail         : Tipo de Mensagem que sera enviada ("HTML" ou "TEXTO")
'            p_strAssuntoEmail      : Contem o Assunto do Email
'            p_strMensagem          : Mensagem do Email
'Retorno: String ("OK" quando for executada com sucesso)
'Autor: Gabriel Fróes (www.codigofonte.com.br)
'-----------------------------------------------------

Function EnviaEmail(p_strNomeFROM, p_strEmailFROM, p_strNomeTO, p_strEmailTO, p_strEmailCC, p_strEmailBCC, p_strTipoEmail, p_strAssuntoEmail, p_strMensagem)
    'On Error Resume Next
    
    ' *********************
    ' Utilizando o ASPMAIL
    ' *********************
    If strComponenteEmail = "ASPMAIL" Then
        'Variáveis e Objetos
        Dim objASPMail
        Set objASPMail = Server.CreateObject ("SMTPsvg.Mailer")
                    
        objASPMail.FromName        = p_strNomeFROM
        objASPMail.FromAddress     = p_strEmailFROM
        objAspMail.RemoteHost      = strSMTP
        objAspMail.AddRecipient    p_strNomeTO, p_strEmailTO
        If Not p_strEmailCC = "" Then
            objAspMail.Addcc           "", p_strEmailCC
        End If
        If Not p_strEmailBCC = "" Then
            objAspMail.AddBcc          "", p_strEmailBCC
        End If
        objAspMail.Subject         =  p_strAssuntoEmail
        objAspMail.BodyText        = p_strMensagem
            
        'Verificando o tipo de mensagem (default é TEXTO)
        If p_strTipoEmail = "HTML" Then
            objAspMail.ContentType = "text/html"
        End If

        'Verifica se a mensagem foi enviada com sucesso e retorna a funcao
        If objAspMail.SendMail Then
            EnviaEmail = "OK"
        Else
            EnviaEmail = "Não foi possível enviar o email, por favor entre em contato com <a href='mailto:" & p_strEmailTO & "?subject=Erro%20ao%20enviar%20email%20pelo%20site'>" & p_strEmailTO & "</a> e escreva o erro abaixo."
        End If

        'Destruindo Objetos
        Set objAspMail = Nothing

        If Err.Number <> 0 Then
            EnviaEmail = EnviaEmail & "<br>Erro:" & Err.Description
        End If
        Exit Function
    End If 'Fim da Utilização do ASPMAIL

    ' *********************
    ' Utilizando o ASPEMAIL
    ' *********************
    If strComponenteEmail = "ASPEMAIL" Then
        'Variáveis e Objetos
        Dim objASPEMail
        Set objASPEMail = Server.CreateObject ("Persits.MailSender")
            
        objASPEMail.FromName        = p_strNomeFROM
        objASPEMail.From            = p_strEmailFROM
        objASPEMail.Host            = ServidorSMTP
        objASPEMail.AddAddress        p_strEmailTO, p_strNomeTO
        If Not p_strEmailCC = "" Then
            objASPEMail.AddCc           p_strEmailCC, ""
        End If
        If Not p_strEmailBCC = "" Then
            objASPEMail.AddBcc            p_strEmailBCC, ""
        End If
        objASPEMail.Subject         = p_strAssuntoEmail
        objASPEMail.Body            = p_strMensagem
                
        'Verificando o tipo de mensagem (default é TEXTO)
        If p_strTipoEmail = "HTML" Then
            objASPEMail.IsHTML = True
        End If

        'Verifica se a mensagem foi enviada com sucesso e retorna a funcao
        If objASPEMail.Send Then
            EnviaEmail = "OK"
        Else
            EnviaEmail = "Não foi possível enviar o email, por favor entre em contato com <a href='mailto:" & p_strEmailTO & "?subject=Erro%20ao%20enviar%20email%20pelo%20site'>" & p_strEmailTO & "</a> e escreva o erro abaixo."
        End If

        'Destruindo Objetos
        Set objASPEMail = Nothing

        If Err.Number <> 0 Then
            EnviaEmail = EnviaEmail & "<br>Erro:" & Err.Description
        End If
        Exit Function
    End If 'Fim da Utilização do ASPEMAIL
    
    ' *********************
    ' Utilizando o CDONTS
    ' *********************
    If strComponenteEmail = "CDONTS" Then
        'Variáveis e Objetos
        Dim objCDONTS
        Set objCDONTS = Server.CreateObject ("CDONTS.NewMail")

        objCDONTS.From        = p_strEmailFROM
        objCDONTS.To          = p_strEmailTO
        objCDONTS.CC          = p_strEmailCC
        objCDONTS.BCC         = p_strEmailBCC
        objCDONTS.Subject     = p_strAssuntoEmail
        objCDONTS.Body        = p_strMensagem

        'Verificando o tipo de mensagem (default é TEXTO)
        If p_strTipoEmail = "HTML" Then
            objCDONTS.BodyFormat = 0
            objCDONTS.MailFormat = 0
        End If

        'Verifica se a mensagem foi enviada com sucesso e retorna a funcao
        Call objCDONTS.Send
        If Err.Number = 0 Then
            EnviaEmail = "OK"
        Else
            EnviaEmail = "Não foi possível enviar o email, por favor entre em contato com <a href='mailto:" & p_strEmailTO & "?subject=Erro%20ao%20enviar%20email%20pelo%20site'>" & p_strEmailTO & "</a> e escreva o erro abaixo."
        End If

        'Destruindo Objetos
        Set objCDONTS = Nothing

        If Err.Number <> 0 Then
            EnviaEmail = EnviaEmail & "<br>Erro:" & Err.Description
        End If
        Exit Function
    End If 'Fim da Utilização do CDONTS
    
    ' *********************
    ' Utilizando o CDOSYS
    ' *********************
    If strComponenteEmail = "CDOSYS" Then
        Dim objCDOSYS
        Dim objCDOSYSConf
        Set objCDOSYS        = Server.CreateObject("CDO.Message") 
        Set objCDOSYSConf    = Server.CreateObject ("CDO.Configuration") 

        'Configurando o envio de e-mail
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = strSMTP
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30 
        objCDOSYSConf.Fields.update 
        Set objCDOSYS.Configuration = objCDOSYSConf 


        objCDOSYS.From        = p_strEmailFROM
        objCDOSYS.To        = p_strEmailTO
        objCDOSYS.CC        = p_strEmailCC
        objCDOSYS.BCC        = p_strEmailBCC
        objCDOSYS.Subject    = p_strAssuntoEmail

        'Verificando o tipo de mensagem (default é TEXTO)
        If p_strTipoEmail = "HTML" Then
            objCDOSYS.HTMLBody    = p_strMensagem
        Else
            objCDOSYS.TextBody    = p_strMensagem
        End If

        'Verifica se a mensagem foi enviada com sucesso e retorna a funcao
        Call objCDOSYS.Send
        If Err.Number = 0 Then
            EnviaEmail = "OK"
        Else
            EnviaEmail = "Não foi possível enviar o email, por favor entre em contato com <a href='mailto:" & p_strEmailTO & "?subject=Erro%20ao%20enviar%20email%20pelo%20site'>" & p_strEmailTO & "</a> e escreva o erro abaixo."
        End If

        'Destruindo Objetos
        Set objCDOSYSConf = Nothing
        Set objCDOSYS = Nothing

        If Err.Number <> 0 Then
            EnviaEmail = EnviaEmail & "<br>Erro:" & Err.Description
        End If
        Exit Function
    End If 'Fim da Utilização do CDOSYS
End Function
%>


<%
'Teste da função de enviar email
Dim strResultado
strResultado = EnviaEmail("NOME REMETENTE", "email@remetente.com.br", "NOME DESTINARARIO", "email@destinatario.com.br", "", "", "HTML", "Teste de Email", "<b>Alo <i>VOCÊ</i></b> isso é um teste de envio de email com <u>HTML</u>.")
Response.Write strComponenteEmail & "<br>" & strResultado
%> 
