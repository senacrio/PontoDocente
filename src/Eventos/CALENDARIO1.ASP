<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%response.buffer = true
  response.expires =0
Dim Calendario1
Dim Calendario1_numRows

Set Calendario1 = Server.CreateObject("ADODB.Recordset")
Calendario1.ActiveConnection = MM_CXEVENTO_STRING
Calendario1.Source = "SELECT *  FROM CALENDARIO1  WHERE (IDSTATUS=2 or IDSTATUS=3) AND ANO=2008"
Calendario1.CursorType = 0
Calendario1.CursorLocation = 2
Calendario1.LockType = 1
Calendario1.Open()
if Calendario1.bof and Calendario1.eof then
   response.redirect("menuca.asp")
end if

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
<head>
<title>Senac - Rio Calendario de Eventos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
</head>

<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p align="center"><br>
  <font color="#0000FF" size="3" face="Verdana, Arial, Helvetica, sans-serif"></font><br>
<font color="#0000FF" size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong><font face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("ANO").Value)%></font><br>
</strong></font></p>


<table width="656" height="57" border="0" align="center" cellpadding="2" cellspacing="2" bordercolor="#0000FF" class="BordasLaterais">
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
    <td width="45" height="35" bgcolor="#FFFFFF"><b><font color="#0000FF" size="1" face="Times New Roman, Times, serif">
	
	<%mes=Calendario1.Fields.Item("MES").Value%>
	<%  if mes =1 then 
	         mesdesc = "JANEIRO"
	   elseif mes=2 then 
	         mesdesc= "FEVEREIRO"
       elseif mes=3 then 
	         mesdesc= "MARCO"
	   elseif mes=4 then
	         mesdesc= "ABRIL"
	   elseif mes=5 then 
	         mesdesc= "MAIO"
       elseif mes=6 then
	         mesdesc= "JUNHO"
   	   elseif mes=7 then 
	         mesdesc= "JULHO"
       elseif mes=8 then
	         mesdesc= "AGOSTO"
   	   elseif mes=9 then 
	         mesdesc= "SETEMBRO"
   	   elseif mes=10 then
	         mesdesc= "OUTRUBRO"
	   elseif mes=11 then
	         mesdesc= "NOVEMBRO"
   	   elseif mes=12 then 
	         mesdesc= "DEZEMBRO"
	   else
	   end if
	   %>
	   <%=mesdesc%>
	</font></b></td>
    <td bgcolor="#99FFFF"><font size="1" face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("DESCCATEGORIA").Value)%></font></td>
    <td bgcolor="#99FFFF"><font size="1" face="Times New Roman, Times, serif"><b><%=replace(Calendario1.Fields.Item("DATA").Value,chr(13),"<Br>")%><br>
    <%=(Calendario1.Fields.Item("HORA").Value)%></b></font></td>
    <td bgcolor="#99FFFF"><b><font size="1" face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("NOMEEVENTO").Value)%></font></b></td>
    <td bgcolor="#99FFFF"><font size="1" face="Times New Roman, Times, serif"><%=replace(Calendario1.Fields.Item("IDLOCAL").Value,chr(13),"<BR>")%></font></td>
    <td bgcolor="#99FFFF"><font size="1" face="Times New Roman, Times, serif">
     <%IdObjetivo=Calendario1.Fields.Item("IDOBJETIVO").Value%>
	 <%rr=Resposta(2,IdObjetivo)%>
	 <%rr=replace(IdObjetivo,chr(13),"<br>")%>
	 <%=rr%>
	<BR>
	<%=(Calendario1.Fields.Item("OBJETIVOOU").Value)%></font></td>
    <td bgcolor="#99FFFF"><font size="1" face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("REALIZADOR").Value)%></font></td>
    <td bgcolor="#99FFFF"><font size="1" face="Times New Roman, Times, serif"><%=(Calendario1.Fields.Item("UPART").Value)%></font></td>
    <td bgcolor="#99FFFF"><font size="1" face="Times New Roman, Times, serif">
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
  <a href="MENUCA.ASP"><img src="images/seta03.gif" width="33" height="33" border="0"></a></div>
</body>
</html>
<%
Calendario1.Close()
Set Calendario1 = Nothing
%>
