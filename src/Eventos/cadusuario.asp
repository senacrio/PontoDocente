<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%
' *** Edit Operations: declare variables

Dim MM_editAction
Dim MM_abortEdit
Dim MM_editQuery
Dim MM_editCmd

Dim MM_editConnection
Dim MM_editTable
Dim MM_editRedirectUrl
Dim MM_editColumn
Dim MM_recordId

Dim MM_fieldsStr
Dim MM_columnsStr
Dim MM_fields
Dim MM_columns
Dim MM_typeArray
Dim MM_formVal
Dim MM_delim
Dim MM_altVal
Dim MM_emptyVal
Dim MM_i

MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Request.QueryString
End If

' boolean to abort record edit
MM_abortEdit = false

' query string to execute
MM_editQuery = ""
%>
<%
' *** Insert Record: set variables

If (CStr(Request("MM_insert")) = "form1") Then

  MM_editConnection = MM_CXEVENTO_STRING
  MM_editTable = "USUARIO"
  MM_editRedirectUrl = "CADFUNCUSUARIO.ASP?SIGLA="+WSIGLA
  MM_fieldsStr  = "IDSIGLA|value|SENHA|value|NOMEUSUARIO|value|STATUS|value"
  MM_columnsStr = "IDSIGLA|',none,''|SENHA|',none,''|NOMEUSUARIO|',none,'',''|STATUS|',none,''"

  ' create the MM_fields and MM_columns arrays
  MM_fields = Split(MM_fieldsStr, "|")
  MM_columns = Split(MM_columnsStr, "|")
  
  ' set the form values
  For MM_i = LBound(MM_fields) To UBound(MM_fields) Step 2
    MM_fields(MM_i+1) = CStr(Request.Form(MM_fields(MM_i)))
  Next

  ' append the query string to the redirect URL
  If (MM_editRedirectUrl <> "" And Request.QueryString <> "") Then
    If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0 And Request.QueryString <> "") Then
      MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
    Else
      MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
    End If
  End If

End If
%>
<%
' *** Insert Record: construct a sql insert statement and execute it

Dim MM_tableValues
Dim MM_dbValues

If (CStr(Request("MM_insert")) <> "") Then

  ' create the sql insert statement
  MM_tableValues = ""
  MM_dbValues = ""
  wsigla = MM_fields(1)
'  response.write(wsigla)
'  response.end
  For MM_i = LBound(MM_fields) To UBound(MM_fields) Step 2
	   'RESPONSE.WRITE(MM_i)
	   'RESPONSE.END

    MM_formVal = MM_fields(MM_i+1)
	
    MM_typeArray = Split(MM_columns(MM_i+1),",")
    MM_delim = MM_typeArray(0)
    If (MM_delim = "none") Then MM_delim = ""
    MM_altVal = MM_typeArray(1)
    If (MM_altVal = "none") Then MM_altVal = ""
    MM_emptyVal = MM_typeArray(2)
    If (MM_emptyVal = "none") Then MM_emptyVal = ""
    If (MM_formVal = "") Then
      MM_formVal = MM_emptyVal
    Else
      If (MM_altVal <> "") Then
        MM_formVal = MM_altVal
      ElseIf (MM_delim = "'") Then  ' escape quotes
        MM_formVal = "'" & Replace(MM_formVal,"'","''") & "'"
      Else
        MM_formVal = MM_delim + MM_formVal + MM_delim
      End If
    End If
    If (MM_i <> LBound(MM_fields)) Then
      MM_tableValues = MM_tableValues & ","
      MM_dbValues = MM_dbValues & ","
    End If
    MM_tableValues = MM_tableValues & MM_columns(MM_i)
    MM_dbValues = MM_dbValues & MM_formVal
  Next
  MM_editQuery = "insert into " & MM_editTable & " (" & MM_tableValues & ") values (" & MM_dbValues & ")"

   err.clear
   on error resume next
    
  If (Not MM_abortEdit) Then
    ' execute the insert
    Set MM_editCmd = Server.CreateObject("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_editConnection
    MM_editCmd.CommandText = MM_editQuery
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close
   
    Erroc=TRIM(cstr(err.number))
    EDesc=err.description
    ECont=cstr(err.helpcontext)
    ENat=cstr(err.nativeerror)
    ESou=err.source
    ESql=err.sqlstate
    
	
	if erroc = "-2147217900" then
	   Response.Redirect("ErroCadUsu.asp")
	end if
        
    if Erroc <> "0" then
	   response.redirect("erroc.asp?erro=" + Erroc + "&Derro=" + EDesc + "Econt=" + ECont + "ENat=" + ENat + "ESou=" + ESou + "ESql=" + ESql)
   end if
   on error GOTO 0
'    RESPONSE.WRITE(wsigla)
'	RESPONSE.END
	If (MM_editRedirectUrl <> "") Then
      Response.Redirect("CADFUNCAOUSU.ASP?SIGLA="+WSIGLA)
    End If
  End If

End If
%>
<html>
<head>
<title>Documento sem t&iacute;tulo</title>
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
   else {alert('Usuário incluído!')}
  document.MM_returnValue = (errors == '');
}
//-->
</script>
</head>

<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center"><img src="images/BANNER1.gif" width="800" height="70"><br>
  <br>
  <br>
</div>
<form method="post" action="<%=MM_editAction%>" name="form1">
  <table width="804" align="center" bgcolor="#FFFFFF" class="BordasLaterais">
    <tr valign="baseline">
      <td width="110" align="right" nowrap><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Nome Usuário</font></td>
      <td width="676">
        <input name="IDSIGLA" type="text" value="" size="80" maxlength="200">
      </td>
    </tr>
    <tr valign="baseline">
      <td nowrap align="right"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Senha:</font></td>
      <td>
        <input name="SENHA" type="text" value="" size="20" maxlength="10">
      </td>
    </tr>
    <tr valign="baseline">
      <td height="29" align="right" nowrap>&nbsp;</td>
      <td>
        <input name="NOMEUSUARIO" type="hidden" disabled="true" size="100">
      </td>
    </tr>
    <tr valign="baseline">
      <td nowrap align="right">&nbsp;</td>
      <td>
        <div align="right">
          <input name="STATUS" type="hidden" value="A">
          <input type="submit" onClick="MM_validateForm('IDSIGLA','','R','SENHA','','R');return document.MM_returnValue" value="Inserir registro">
        </div></td>
    </tr>
	<input type="hidden" name="MM_insert" value="form1">
  </table>
</form>
<div align="center"><br>
  <a href="MENUAA.ASP"><img src="images/seta03.gif" width="33" height="33" border="0"></a>  
  
</div>
<p>&nbsp;</p>
</body>
</html>
