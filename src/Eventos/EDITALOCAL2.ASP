<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/CXEVENTO.asp" -->

<% IdLocal=Request.QueryString("IdLocal")
   wNomeLocal=trim(cstr(request.form("NomeLocal")))
   IdLocal1=Request.Form("IdLocal1")

Dim Cat
Dim Cat_numRows

if IdLocal1="" then
   Set Cat = Server.CreateObject("ADODB.Recordset")
   Cat.ActiveConnection = MM_CXEVENTO_STRING
   Cat.Source = "SELECT NOMELOCAL FROM LOCAL WHERE IDLOCAL=" + IdLocal
   Cat.CursorType = 0
   Cat.CursorLocation = 2
   Cat.LockType = 1
   Cat.Open()
   Cat_numRows = 0
   wNomeLocal=Cat.Fields.Item("NOMELOCAL").Value
else
   wsql="UPDATE LOCAL SET NOMELOCAL='" + wNOMELOCAL + "' WHERE IDLOCAL = " + IdLocal1 
   Set ObjServidor = Server.CreateObject("ADODB.Command")
   ObjServidor.ActiveConnection = MM_CXEVENTO_STRING
   ObjServidor.CommandText = Wsql
   ObjServidor.CommandType = 1
   ObjServidor.CommandTimeout = 0
   ObjServidor.Prepared = true
   ObjServidor.Execute()
   response.redirect("edilocal.asp")
end if
%>
<html>
<head>
<title>Edita Local de Evento</title>
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
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
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
 <div align="center"><img src="images/BANNER1.gif" border="0" align="middle"><br>
   <br>
 </div>
 <p>&nbsp;</p>


<form method="post" action="EDItaLOCAL2.asp" name="form1">
<table width="800" align="center" bgcolor="#FFFFFF" class="BordasLaterais">
  <tr valign="baseline">
    <td width="137" align="right" nowrap><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Descri&ccedil;&atilde;o
        Local</font></td>
    <td width="485" nowrap>
      <input name="NOMElocal" type="text" value="<%=wnomelocal%>" size="80" maxlength="100">
    </td>
  </tr>
  <tr valign="baseline">
    <td height="25" align="right" nowrap><input name="idlocal1" type="hidden" value="<%=IDLOCAL%>"></td>
    <td>
      <div align="right">
        <input name="submit" type="submit" onClick="MM_validateForm('NOMElocal','','R');return document.MM_returnValue" value="Atualizar o registro">
      </div></td>
  </tr>
</table>
</form>
<p align="center"><a href="EDIlocal.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
</body>
</html>
<%
if nomelocal="" then
Cat.Close()
end if
Set Cat = Nothing
%>
