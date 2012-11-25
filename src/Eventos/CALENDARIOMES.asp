<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/CXEVENTO.asp" -->

<%
Dim Categoria
Dim Ano
Dim Excel

Ano=trim(CStr(Request.form("Ano")))
Categoria=trim(CStr(Request.form("Categoria")))
Excel=trim(CStr(Request.form("Excel")))
'response.write(categoria)
'response.end
IF Categoria  <> "TODOS" then
   Set Categoria1 = Server.CreateObject("ADODB.Recordset")
   Categoria1.ActiveConnection = MM_CXEVENTO_STRING
   Categoria1.Source = "SELECT DESCCATEGORIA FROM CATEGORIA WHERE IDCATEGORIA= " + Categoria
   Categoria1.CursorType = 0
   Categoria1.CursorLocation = 2
   Categoria1.LockType = 1
   Categoria1.Open()
   Descricao=Categoria1.Fields.Item("DescCATEGORIA").Value
else
   Set Categoria1 = Server.CreateObject("ADODB.Recordset")
   Categoria1.ActiveConnection = MM_CXEVENTO_STRING
   Categoria1.Source = "SELECT DESCCATEGORIA FROM CATEGORIA" 
   Categoria1.CursorType = 0
   Categoria1.CursorLocation = 2
   Categoria1.LockType = 1
   Categoria1.Open()
   Descricao="TODAS"
end if

'Calendario1.Close()
'Set Calendario1 = Nothing

Dim Calendario
Dim Calendario_numRows
Dim c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12
Dim t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12
Dim Mes1(),Mes2(),Mes3(),Mes4(),Mes5(),Mes6()
Dim Mes7(),Mes8(),Mes9(),Mes10(),Mes11(),Mes12()
Dim M1(),M2(),M3(),M4(),M5(),M6()
Dim M7(),M8(),M9(),M10(),M11(),M12()
c1=0
c2=0
c3=0
c4=0
c5=0
c6=0
c7=0
c8=0
c9=0
c10=0
c11=0
c12=0

IF Categoria  <> "TODOS" then
   Set Calendario = Server.CreateObject("ADODB.Recordset")
   Calendario.ActiveConnection = MM_CXEVENTO_STRING
   Calendario.Source = "SELECT * FROM CALENDARIO1 WHERE CALENDARIO1.ANO = '" + ANO +"' AND    (CALENDARIO1.IDSTATUS=2 OR CALENDARIO1.IDSTATUS=3) AND IDCATEGORIA = " + CATEGORIA + " ORDER BY ANO,MES,DIA"
   Calendario.CursorType = 0
   Calendario.CursorLocation = 2
   Calendario.LockType = 1
   Calendario.Open()
ELSE
   Set Calendario = Server.CreateObject("ADODB.Recordset")
   Calendario.ActiveConnection = MM_CXEVENTO_STRING
   Calendario.Source = "SELECT * FROM CALENDARIO1 WHERE CALENDARIO1.ANO = '" + ANO +"' AND    (CALENDARIO1.IDSTATUS=2 OR CALENDARIO1.IDSTATUS=3) ORDER BY ANO,MES,DIA"
   Calendario.CursorType = 0
   Calendario.CursorLocation = 2
   Calendario.LockType = 1
   Calendario.Open()
END IF

if Calendario.bof and Calendario.eof then
   response.redirect("NREGISTRO1.asp")
end if

While NOT Calendario.EOF 
  Mes=Calendario.Fields.Item("MES")
  IDEVENTO=CSTR(Calendario.Fields.Item("IDEVENTO"))
  NomeEvento=CSTR(Calendario.Fields.Item("NomeEvento"))
  DataEvento=CSTR(Calendario.Fields.Item("Data"))
  HoraEvento=CSTR(Calendario.Fields.Item("Hora"))
  if DataEvento="" then
    DataEvento=CSTR(Calendario.Fields.Item("Mes")) + "/" + CSTR(Calendario.Fields.Item("Ano"))
  end if
  IDEVENTO1=IDEVENTO
  IDEVENTO=NOMEEVENTO + "<BR>" + DATAEVENTO + "<br>" + HORAEVENTO
 
  IF Mes=1 then
     c1=c1+1
	 redim preserve Mes1(c1)
     redim preserve M1(c1)
     Mes1(c1)=IdEvento
     M1(c1)=IdEvento1
  end if 

  IF Mes=2 then
     c2=c2+1
	 redim preserve Mes2(c2)
     redim preserve M2(c2)
     Mes2(c2)=IdEvento
     M2(c2)=IdEvento1
  end if 

  IF Mes=3 then
     c3=c3+1
	 redim preserve Mes3(c3)
     redim preserve M3(c3)
     Mes3(c3)=IdEvento
     M3(c3)=IdEvento1
  end if 

  IF Mes=4 then
     c4=c4+1
	 redim preserve Mes4(c4)
     redim preserve M4(c4)
     Mes4(c4)=IdEvento
     M4(c4)=IdEvento1
  end if 
  
  IF Mes=5 then
     c5=c5+1
	 redim preserve Mes5(c5)
     redim preserve M5(c5)
     Mes5(c5)=IdEvento
     M5(c5)=IdEvento1
  end if 

  IF Mes=6 then
     c6=c6+1
	 redim preserve Mes6(c6)
     redim preserve M6(c6)
     Mes6(c6)=IdEvento
     M6(c6)=IdEvento1
  end if 
  
  IF Mes=7 then
     c7=c7+1
	 redim preserve Mes7(c7)
     redim preserve M7(c7)
     Mes7(c7)=IdEvento
     M7(c7)=IdEvento1
  end if 
  
  IF Mes=8 then
     c8=c8+1
	 redim preserve Mes8(c8)
     redim preserve M8(c8)
     Mes8(c8)=IdEvento
     M8(c8)=IdEvento1
  end if 

  IF Mes=9 then
     c9=c9+1
	 redim preserve Mes9(c9)
     redim preserve M9(c9)
     Mes9(c9)=IdEvento
     M9(c9)=IdEvento1
  end if 

  IF Mes=10 then
     c10=c10+1
	 redim preserve Mes10(c10)
     redim preserve M10(c10)
     Mes10(c10)=IdEvento
     M10(c10)=IdEvento1
  end if 

  IF Mes=11 then
     c11=c11+1
	 redim preserve Mes11(c11)
     redim preserve M11(c11)
     Mes11(c11)=IdEvento
     M11(c11)=IdEvento1
  end if 

  IF Mes=12 then
     c12=c12+1
	 redim preserve Mes12(c12)
     redim preserve M12(c12)
     Mes12(c12)=IdEvento
     M12(c12)=IdEvento1
  end if 
  Calendario.MoveNext()
Wend
%>

<%
Linhas=0
If c1>Linhas then
   Linhas=c1
end if   
If c2>Linhas then
   Linhas=c2
end if   
If c3>Linhas then
   Linhas=c3
end if   
If c4>Linhas then
   Linhas=c4
end if   
If c5>Linhas then
   Linhas=c5
end if   
If c6>Linhas then
   Linhas=c6
end if   
If c7>Linhas then
   Linhas=c7
end if   
If c8>Linhas then
   Linhas=c8
end if   
If c9>Linhas then
   Linhas=c9
end if   
If c10>Linhas then
   Linhas=c10
end if   
If c11>Linhas then
   Linhas=c11
end if   
If c12>Linhas then
   Linhas=c12
end if   

Dim Linhas
cv=0

function retevento(ievento)
  Set Calendario1 = Server.CreateObject("ADODB.Recordset")
  Calendario1.ActiveConnection = MM_CXEVENTO_STRING
  Calendario1.Source = "SELECT *  FROM EVENTOCONDENSADO WHERE IDEVENTO=" + cstr(ievento)
  Calendario1.CursorType = 0
  Calendario1.CursorLocation = 2
  Calendario1.LockType = 1
  Calendario1.Open()
  NomeEvento=Calendario1.Fields.Item("NomeEvento")
  DataEvento=Calendario1.Fields.Item("Data")
  HoraEvento=Calendario1.Fields.Item("Hora")
  retevento=NomeEvento
  Calendario1.Close()
  Set Calendario1 = Nothing
End Function
%>
<html>
<% IF EXCEL="S" THEN%>
<%Response.ContentType = "application/vnd.ms-excel"%>
<% END IF %>

<head>
<title>Calend&aacute;rio de Eventos Senac</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body text="#000000" link="#333333" vlink="#000000" alink="#333333" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center">
<div align="center"><img src="images/BANNER1.gif" width="800" height="70" border="0" align="texttop">  <font color="#CC6600"><br>
   
    <font size="2" face="Times New Roman, Times, serif"><strong><font color="#0000FF">ANO:<font color="#CC6600"> <%=ano%> </font></font><font color="#CC6600">&nbsp;&nbsp; </font><font color="#0000FF">CATEGORIA:</font > <%=descricao%></strong></font><strong><br>
    </strong></font>
 
</div>
<table border="1" align="center" cellpadding="1" cellspacing="1">
  <tr bgcolor="#CCFFFF">
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">JANEIRO</font></th>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">FEVEREIRO</font></th>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">MARÇO</font></th>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">ABRIL</font></tH>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">MAIO</font></th>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">JUNHO</font></th>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">JULHO</font></th>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">AGOSTO</font></th>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">SETEMBRO</font></th>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">OUTUBRO</font></tH>
  <th bordercolor="#000000"><font color="#0033CC" size="1" face="Times New Roman, Times, serif">NOVEMBRO</font></th>
  <th><font color="#0033CC" size="1" face="Times New Roman, Times, serif">DEZEMBRO</font></th>
  </tr>
<% 
While Linhas <> 0
cv=cv+1
%>
<tr>
<td height="31"  bgcolor="#F8F8FF"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
        <%if cv<=c1 then%>
        <a href="EventoResumo.asp?IdEvento=<%=M1(cv)%>">
         <%=Mes1(cv)%>
         <%'iid=Mes1(cv)%>
         <%'rr=retevento(iid)%>
         <%'=rr%>
        </a>
        <%end if%>  
      </font></div></td>
<td bgcolor="#FFEFD5" ><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
            <%if cv<=c2 then%>
            <a href="EventoResumo.asp?IdEvento=<%=M2(cv)%>">
			<%=Mes2(cv)%>
            <%'iid=Mes2(cv)%>
            <%'rr=retevento(iid)%>
            <%'=rr%>
            </a>
			<%end if%>
      </font></div></td>
<td bgcolor="#F8F8FF"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c3 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M3(cv)%>">
          <%=Mes3(cv)%>
          <%'iid=Mes3(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a>
          <%end if%>
      </font></div></td>
<td bgcolor="#FFEFD5"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c4 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M4(cv)%>">
          <%=Mes4(cv)%>
          <%'iid=Mes4(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a> 
          <%end if%>
      </font></div></td>
<td bgcolor="#F8F8FF"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c5 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M5(cv)%>">
          <%=Mes5(cv)%>
          <%'iid=Mes5(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a>
          <%end if%>
      </font></div></td>
<td bgcolor="#FFEFD5"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c6 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M6(cv)%>">
          <%=Mes6(cv)%>
          <%'iid=Mes6(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a>
          <%end if%>
      </font></div></td>
<td bgcolor="#F8F8FF"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c7 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M7(cv)%>">
          <%=Mes7(cv)%>
          <%'iid=Mes7(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a>
		  <%end if%>
      </font></div></td>
<td bgcolor="#FFEFD5"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c8 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M8(cv)%>">
		  <%=Mes8(cv)%>
          <%'iid=Mes8(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a>
		  <%end if%>
      </font></div></td>
<td bgcolor="#F8F8FC"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c9 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M9(cv)%>">
          <%=Mes9(cv)%>
          <%'iid=Mes9(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a>      
          <%end if%>
    </font></div></td>
<td bgcolor="#FFEFD5"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c10 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M10(cv)%>">
          <%=Mes10(cv)%>
          <%'iid=Mes10(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a>
		  <%end if%>
      </font></div></td>
<td bgcolor="#F8F8FF"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c11 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M11(cv)%>">
          <%=Mes11(cv)%>
          <%'iid=Mes11(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a>
          <%end if%>
      </font></div></td>
<td bgcolor="#FFEFD5"><div align="center"><font color="#000000" size="1" face="Times New Roman, Times, serif">
          <%if cv<=c12 then%>
          <a href="EventoResumo.asp?IdEvento=<%=M12(cv)%>">
          <%=Mes12(cv)%>
          <%'iid=Mes12(cv)%>
          <%'rr=retevento(iid)%>
          <%'=rr%>
          </a>
          <%end if%>
      </font></div></td>
</tr>
    <% 
  Linhas=Linhas-1
Wend
  %>
</table>
  <br>
  <style type="text/css">
<!--
table { 
border-collapse:collapse; 
border:1px solid #000099; 
background-color:#FFFFFF;
}
th {border:1px solid #003366; 
color:#cccccc;
}
th div {
color:#FF0000; 
padding:5px; 
width:150px; 
height:50px; 
overflow:auto; 
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
table caption {
text-align: center;
color:#0000CC;
font-weight: bold;
}
-->
</style>
</body>
</html>
<%
Calendario.Close()
Set Calendario = Nothing
%>

