<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%
  Function TransLista(lista)
      lista1 = lista
      lista1 = Replace(lista1, " ", "")
      lista1 = Replace(lista1, ",", "-")
      TransLista = "-" & lista1 & "-"
  End Function
%>

<% response.buffer = true 
   response.expires=0
  
   wSigla="ACM"
   wHora= CSTR(Time)
   USUARIO=trim(CStr(Request.form("SIGLA")))
   FUNCAO=trim(Cstr(request.form("funcao")))
   FUNCAO=TransLista(FUNCAO)
'   response.write(SIGLA)
'   response.write(funcao)
'   response.end
      
   WSQL="UPDATE USUARIOFUNCAO SET FUNCAO='" + FUNCAO +"' WHERE USUARIO = '" + USUARIO + "'"


'RESPONSE.WRITE(WSQL)
'RESPONSE.END 
 
   err.clear
   on error resume next
   Set ObjServidor = Server.CreateObject("ADODB.Command")
   ObjServidor.ActiveConnection = MM_CXEVENTO_STRING
   ObjServidor.CommandText = Wsql
   ObjServidor.CommandType = 1
   ObjServidor.CommandTimeout = 0
   ObjServidor.Prepared = true
   ObjServidor.Execute()
 
   Erroc=TRIM(cstr(err.number))
   EDesc=err.description
   ECont=cstr(err.helpcontext)
   ENat=cstr(err.nativeerror)
   ESou=err.source
   ESql=err.sqlstate
      
   if Erroc <> "0" then
	  response.redirect("erroc.asp?erro=" + Erroc + "&Derro=" + EDesc + "Econt=" + ECont + "ENat=" + ENat + "ESou=" + ESou + "ESql=" + ESql)
   end if
   on error GOTO 0

 '  Wsql= "INSERT INTO LogSistema (Empresa, CodCliente, Sigla, Data,  Hora, Processo, Registro) VALUES ('" + CodInst + "', '" + wCodigo + "', '" + Login + "', { d '" + wSistema + "' } ,'" + wHora + "'," + wProcesso + ",'" +  wregistro + "')"    
 '   ERR.CLEAR
  ' RESPONSE.WRITE(WSQL)
  ' RESPONSE.END 
  ' on error resume next
  ' Set ObjServidor = Server.CreateObject("ADODB.Command")
  ' ObjServidor.ActiveConnection =  MM_ConFidel_STRING
  ' ObjServidor.CommandText = Wsql
  ' ObjServidor.CommandType = 1
  ' ObjServidor.CommandTimeout = 0
  ' ObjServidor.Prepared = true
  ' ObjServidor.Execute()
  ' Erroc=TRIM(cstr(err.number))
  ' EDesc=err.description
  ' ECont=cstr(err.helpcontext)
  ' ENat=cstr(err.nativeerror)
  ' ESou=err.source
  ' ESql=err.sqlstate
  ' if Erroc <> "0" then
'	  response.redirect("erroc.asp?erro=" + Erroc + "&Derro=" + EDesc + "Econt=" + ECont + "ENat=" + ENat + "ESou=" + ESou + "ESql=" + ESql)
 '  end if
  ' on error goto 0
%>
<html><title>CONTROLE DE EVENTOS</title>
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center"><img src="images/BANNER1.gif" width="800" height="70">
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="800" height="66" border="0" align="center" class="BordasLaterais">
  <tr>
    <td height="23" bgcolor="#FFFFFF"><div align="center"><strong>	<font color="#0033CC" size="4">
  	***  FUN&Ccedil;&Atilde;O DO USU&Aacute;RIO EDITADA ***</font></strong></div></td>
</table>

<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center"><a href="EDITAUSUARIO.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
</html>
