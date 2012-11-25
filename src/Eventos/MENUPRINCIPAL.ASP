<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<% response.buffer = True 
 response.expires=0

 Dim login, senha, empresa, wsistema, wprocesso, whora, wcliente
 Dim instituicao__MMColParam
 Dim instituicao, ne
 
 sigla=cstr(trim(Request.form("sigla")))
 senha=cstr(trim(Request.form("senha")))
 sigla=replace(sigla,"'","")
 senha=replace(senha,"'","")

 if sigla<>"" then
    set Acesso = Server.CreateObject("ADODB.Recordset")
    Acesso.ActiveConnection = MM_CXEVENTO_STRING
    wsql ="SELECT * FROM VUSUARIO WHERE STATUS<>'I' AND idsigla= '" & SIGLA & "' AND senha= '" & senha & "'"
    Acesso.Source = wsql
    Acesso.CursorType = 2
    Acesso.CursorLocation = 2
    Acesso.LockType = 3
    Acesso.Open()
 
    if Acesso.BOF=TRUE AND ACESSO.EOF=TRUE then
      sigla=""
      Response.Redirect "NEGADO.asp"
    END IF

    Session("FUNCAO")=cstr(trim(Acesso.Fields.Item("FUNCAO").value))
	Session("SIGLA") = Sigla
'	RESPONSE.WRITE(Session("SIGLA"))
'	RESPONSE.END
   
    Acesso.close
ELSE
  IF SESSION("SIGLA")="" THEN
     RESPONSE.REDIRECT("NEGADO.ASP")
  END IF
end if
%>
<html>
<head>
<title>Sistema de Controle de Eventos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
</head>

<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"><br>
<br>
<br>

<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="800" height="450">
      <param name="movie" value="images/MENU%20principal.swf">
      <param name="quality" value="high">
      <embed src="images/MENU%20principal.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="800" height="450"></embed>
    </object></td>
  </tr>
</table>

<p>&nbsp;</p>
</body>
</html>
