<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%response.buffer = true
  response.expires =0
  Ano=trim(CStr(Request.form("Ano")))
  Categoria=trim(CStr(Request.form("Categoria")))
  Excel=trim(CStr(Request.form("Excel")))
'  Status=trim(CStr(Request.form("Status")))
'RESPONSE.WRITE(CATEGORIA)
'RESPONSE.END

Dim Calendario1
Dim Calendario1_numRows

Set Calendario1 = Server.CreateObject("ADODB.Recordset")
Calendario1.ActiveConnection = MM_CXEVENTO_STRING

Calendario1.Source = "SELECT *  FROM CALENDARIO2 WHERE ANO='" + ANO + "' AND (IDSTATUS=2 OR IDSTATUS=3) ORDER BY ANO,MES,DIA"

if categoria<>"TODOS" then
   Calendario1.Source="SELECT * FROM CALENDARIO2 WHERE (IDSTATUS=2 OR IDSTATUS=3) AND ANO='" + ANO + "' AND IDCATEGORIA =" + CATEGORIA + " ORDER BY ANO,MES,DIA"
end if
'response.write(calendario1.source)
'response.end

Calendario1.CursorType = 0
Calendario1.CursorLocation = 2
Calendario1.LockType = 1
Calendario1.Open()
'if Calendario1.bof and Calendario1.eof then
'   response.redirect("menuca.asp")
'end if

Calendario1_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 1000
Repeat1__index = 0
Calendario1_numRows = Calendario1_numRows + Repeat1__numRows
%>
<!--#include file="RECRESPOSTAS.ASP" -->
<html>
<% IF EXCEL="S" THEN%>
<%Response.ContentType="application/vnd.ms-excel"%>
<% END IF %>
<head>
<title>Senac - Rio Calendario de Eventos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
</head>
<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%if Calendario1.bof and Calendario1.eof then
     response.redirect("NREGISTRO.asp")
end if%>
<div align="center"><img src="images/BANNER1.gif" width="800" height="70" border="0" align="middle"></div>
 <div align="center"><font color="#0000FF" size="3" face="Verdana, Arial, Helvetica, sans-serif"></font><br>
     <font color="#0000FF" size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong><font face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("ANO").Value)%></font><br>
     </strong></font>
   </p>
  

 </div>
 <table width="656" height="65" border="0" align="center" cellpadding="2" cellspacing="2" bordercolor="#0000FF" class="BordasLaterais">
  <tr align="center">
    <td nowrap><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">M&ecirc;s</font></td>
    <td width="25" nowrap bgcolor="#FFFFFF"><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Categoria</font></td>
    <td width="25" nowrap bgcolor="#FFFFFF"><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Data</font></td>
    <td width="63" nowrap bgcolor="#FFFFFF"><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Evento</font></td>
    <td width="72" nowrap bgcolor="#FFFFFF"><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Local</font></td>
    <td width="113" nowrap bgcolor="#FFFFFF"><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Objetivo</font></td>
    <td width="92" nowrap bgcolor="#FFFFFF"><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Realizador</font></td>
    <td width="105" nowrap bgcolor="#FFFFFF"><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Unidade
        Participante</font></td>
    <td width="60" nowrap bgcolor="#FFFFFF"><font color="#0000FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Fecom&eacute;rcio</font></td>
  </tr>
  <% 
While ((Repeat1__numRows <> 0) AND (NOT Calendario1.EOF)) 
%>
  <tr align="center">
    <td width="45" height="35" nowrap bgcolor="#FFFFFF"><b><font color="#0000CC" size="1" face="Times New Roman, Times, serif">
	<%mes=Calendario1.Fields.Item("MES").Value%>
	<%  if mes =1 then 
	         mesdesc = "Janeiro"
	   elseif mes=2 then 
	         mesdesc= "Fevereiro"
       elseif mes=3 then 
	         mesdesc= "Março"
	   elseif mes=4 then
	         mesdesc= "Abril"
	   elseif mes=5 then 
	         mesdesc= "Maio"
       elseif mes=6 then
	         mesdesc= "Junho"
   	   elseif mes=7 then 
	         mesdesc= "Julho"
       elseif mes=8 then
	         mesdesc= "Agosto"
   	   elseif mes=9 then 
	         mesdesc= "Setembro"
   	   elseif mes=10 then
	         mesdesc= "Outubro"
	   elseif mes=11 then
	         mesdesc= "Novembro"
   	   elseif mes=12 then 
	         mesdesc= "Dezembro"
	   else
	   end if
	   %>
	   <%=mesdesc%>
	</font></b></td>
    <td nowrap bgcolor="#FFFFCC"><font color="#000000" size="1" face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("DESCCATEGORIA").Value)%></font></td>
    <td nowrap bgcolor="#FFFFCC"><font color="#000000" size="1" face="Times New Roman, Times, serif"><b><%=replace(Calendario1.Fields.Item("DATA").Value,chr(13),"<Br>")%><br>
      <%=(Calendario1.Fields.Item("HORA").Value)%></b></font></td>
    <td nowrap bgcolor="#FFFFCC"><b><font color="#000000" size="1" face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("NOMEEVENTO").Value)%></font></b></td>
    <td nowrap bgcolor="#FFFFCC"><font color="#000000" size="1" face="Times New Roman, Times, serif"><%=replace(Calendario1.Fields.Item("IDLOCAL").Value,chr(13),"<BR>")%></font></td>
    <td nowrap bgcolor="#FFFFCC"><font color="#000000" size="1" face="Times New Roman, Times, serif">
     <%IdObjetivo=Calendario1.Fields.Item("IDOBJETIVO").Value%>
   	 <%rr=Resposta(2,IdObjetivo)%>
	 <%=rr%>
	 <BR>
	 <%=(Calendario1.Fields.Item("OBJETIVOOU").Value)%></font></td>
    <td nowrap bgcolor="#FFFFCC"><font color="#000000" size="1" face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("REALIZADOR").Value)%></font></td>
    <td nowrap bgcolor="#FFFFCC"><font color="#000000" size="1" face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("UPART").Value)%></font></td>
    <td nowrap bgcolor="#FFFFCC"><font color="#000000" size="1" face="Times New Roman, Times, serif">
	<%Feco=cstr((Calendario1.Fields.Item("FECO").Value))
	  if Feco="1" then 
	    Feco="SIM"
	  else
	    Feco="Não"
	  end if 
	%>
	<%=feco%>
	</font>	</td>
  </tr>
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Calendario1.MoveNext()
Wend
%>
</table>
<div align="center"><br>
  <br>
  <br>
  <style type="text/css">
<!--
table { 
border-collapse:collapse; 
border:2px solid #FF0000; 
background-color:#FFFFFF;
}
td {border:1px solid #003366; 
color:#cccccc;
}
td div {
color:#FF0000; 
padding:5px; 
width:150px; 
height:80px; 
overflow:auto; 
}
-->
</style>

  <a href="MENUGE.ASP"><img src="images/seta03.gif" width="33" height="33" border="0"></a></div>
</body>
</html>
<%
Calendario1.Close()
Set Calendario1 = Nothing
%>
