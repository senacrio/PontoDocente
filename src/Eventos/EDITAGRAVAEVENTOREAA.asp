<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<% response.buffer = true 
   response.expires=0
   wSigla="ACM"
   wHora= CSTR(Time)
   IdEvento=trim(CStr(Request.QueryString("IdEvento")))

WSQL="UPDATE EVENTO SET IDSTATUS=2 WHERE IDEVENTO = " + IDEVENTO

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
<div align="center"><img src="images/BANNER1.gif" width="800" height="70" align="middle">
</div>
<p>&nbsp;</p>
<p align="center">&nbsp;</p>
<table width="800" height="73" border="0" align="center">
  <tr>
    <td height="69" bgcolor="#FFFFFF" class="BordasLaterais"><div align="center"><strong>	<font color="#0033CC" size="4">
  	***  EVENTO PUBLICADO REATIVADO  ***</font></strong></div></td>
</table>

<p align="center">&nbsp;</p>
<p align="center"><a href="EDITAEVENTOREAA.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
<p align="center">&nbsp;</p>
</html>
