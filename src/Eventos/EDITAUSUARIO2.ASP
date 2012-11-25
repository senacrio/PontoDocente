<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/CXEVENTO.asp" -->

<% IdCATEGORIA=Request.QueryString("IdCATEGORIA")
   wNOMEUSUARIO=trim(cstr(request.form("NOMEUSUARIO")))
   IdCATEGORIA1=Request.Form("IdCATEGORIA1")

Dim Cat
Dim Cat_numRows

if IdCATEGORIA1="" then
   Set Cat = Server.CreateObject("ADODB.Recordset")
   Cat.ActiveConnection = MM_CXEVENTO_STRING
   Cat.Source = "SELECT NOMEUSUARIO FROM CATEGORIA WHERE IDCATEGORIA=" + IdCATEGORIA
   Cat.CursorType = 0
   Cat.CursorLocation = 2
   Cat.LockType = 1
   Cat.Open()
   Cat_numRows = 0
   wNOMEUSUARIO=Cat.Fields.Item("NOMEUSUARIO").Value
else
   wsql="UPDATE CATEGORIA SET NOMEUSUARIO='" + wNOMEUSUARIO + "' WHERE IDCATEGORIA = " + IdCATEGORIA1 
   Set ObjServidor = Server.CreateObject("ADODB.Command")
   ObjServidor.ActiveConnection = MM_CXEVENTO_STRING
   ObjServidor.CommandText = Wsql
   ObjServidor.CommandType = 1
   ObjServidor.CommandTimeout = 0
   ObjServidor.Prepared = true
   ObjServidor.Execute()
   response.redirect("EDITACATEGORIA.asp")
end if
%>
<html>
<head>
<title>Edita CATEGORIA de Evento</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isCATEGORIA')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('Alguns erros ocorreram:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
</head>
<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <img src="images/BANNER1.gif" border="0" align="middle"><br>
<br>
<p align="center">&nbsp;</p>


<form method="post" action="EDItaCATEGORIA2.asp" name="form1">
<table width="640" align="center" bgcolor="#FFFFFF" class="BordasLaterais">
  <tr valign="baseline">
    <td width="137" align="right" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif">         Nome
        usu&aacute;rio: </font></td>
    <td width="485" nowrap>
      <input name="NOME USUÁRIO" type="text" value="<%=wNOMEUSUARIO%>" size="80" maxlength="100">
    </td>
  </tr>
  <tr valign="baseline">
    <td height="25" align="right" nowrap><input name="idCATEGORIA1" type="hidden" value="<%=IDCATEGORIA%>"></td>
    <td>
      <div align="right">
        <input name="submit" type="submit" onClick="MM_validateForm('NOMEUSUARIO','','R');return document.MM_returnValue" value="Atualizar o registro">
      </div></td>
  </tr>
</table>
</form>
<p align="center"><a href="EDITACATEGORIA.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
</body>
</html>
<%
if NOMEUSUARIO="" then
Cat.Close()
end if
Set Cat = Nothing
%>
