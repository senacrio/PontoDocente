<%
'Const strComponenteEmail = "CDOSYS"
'-----------------------------------------------------
'Funcao: EnviaEmail(p_strNomeFROM, p_strEmailFROM, p_strNomeTO, p_strEmailTO, p_strEmailCC, p_strEmailBCC, p_strTipoEmail, p_strAssuntoEmail, p_strMensagem)
'Sinopse: Envia um email utilizando o componente configurado
'Parametros:
'            p_strNomeFROM          : Contem o Nome do Remetente
'            p_strEmailFROM         : Contem o Email do Remetente
'            p_strNomeTO            : Contem o Nome do Destinatario
'            p_strEmailTO           : Contem o Email ou Emails de quem vai receber a mensagem
'            p_strEmailCC           : Contem o Email ou Emails de quem vai receber a copi da mensagem
'            p_strEmailBCC          : Contem o Email ou Emails de quem vai receber a copia oculta da mensagem
'            p_strTipoEmail         : Tipo de Mensagem que sera enviada ("HTML" ou "TEXTO")
'            p_strAssuntoEmail      : Contem o Assunto do Email
'            p_strMensagem          : Mensagem do Email
'Retorno: String ("OK" quando for executada com sucesso)
'Autor: Gabriel Fróes (www.codigofonte.com.br)
'-----------------------------------------------------
Function EnviaEmail(p_strNomeFROM, p_strEmailFROM, p_strNomeTO, p_strEmailTO, p_strEmailCC, p_strEmailBCC, p_strTipoEmail, p_strAssuntoEmail, p_strMensagem)
   '  On Error Resume Next
        Dim objCDOSYS
        Dim objCDOSYSConf
    
	    Set objCDOSYS        = Server.CreateObject("CDO.Message") 
        Set objCDOSYSConf    = Server.CreateObject ("CDO.Configuration") 
        'Configurando o envio de e-mail

        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver")="172.16.0.2"
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25 
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
        objCDOSYSConf.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout")=90 
        objCDOSYSConf.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl")=False 
		objCDOSYSConf.Fields.update 
        Set objCDOSYS.Configuration=objCDOSYSConf 
   '     Erroc=TRIM(cstr(err.number))
   '     EDesc=err.description
   '     ECont=cstr(err.helpcontext)
     '   ENat=cstr(err.nativeerror)
     '   ESou=err.source
     '   ESql=err.sqlstate
'         response.write(p_strEmailFROM)
'	     response.end   

        objCDOSYS.From      = p_strEmailFROM
		objCDOSYS.To        = p_strEmailTO
        objCDOSYS.CC        = p_strEmailCC
        objCDOSYS.BCC       = p_strEmailBCC
        objCDOSYS.Subject   = p_strAssuntoEmail

      '  RESPONSE.WRITE(" from ")
      '  RESPONSE.WRITE(objCDOSYS.From)
      '  RESPONSE.WRITE(" to ")
      '  RESPONSE.WRITE(objCDOSYS.To)
      '  RESPONSE.WRITE(" cc ")
      '  RESPONSE.WRITE(objCDOSYS.CC)
      '  RESPONSE.WRITE(" bccc")
	  '  RESPONSE.WRITE(objCDOSYS.BCC)
      '  RESPONSE.WRITE(" assunto ")
 	'	RESPONSE.WRITE(objCDOSYS.Subject)
     '   response.end 
	
        'Verificando o tipo de mensagem (default é TEXTO)
        If p_strTipoEmail = "HTML" Then
            objCDOSYS.HTMLBody    = p_strMensagem
        Else
            objCDOSYS.TextBody    = p_strMensagem
        End If
        
	'	rESPONSE.WRITE(objCDOSYS.TextBody)
  	'	RESPONSE.END

        'Verifica se a mensagem foi enviada com sucesso e retorna a funcao
       err.clear
       on error resume next
	   Call objCDOSYS.Send
       If Err.Number = 0 Then
            EnviaEmail = "OK"
        Else
            EnviaEmail = "Não foi possível enviar o email, informe aqui <a href='mailto:" & p_strEmailTO & "?subject=Erro%20ao%20enviar%20email%20pelo%20site'>" & p_strEmailTO & "</a> e envie."
        End If
        on error goto 0
        'Destruindo Objetos
        Set objCDOSYSConf = Nothing
        Set objCDOSYS = Nothing

        If Err.Number <> 0 Then
            EnviaEmail = EnviaEmail & "<br>Erro:" & Err.Description
        End If
        Exit Function
End Function
%>


