<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%response.buffer = true
response.Expires = 0
IdEspaco=trim(CStr(Request.QueryString("IDESPACO")))

Set EventoS = Server.CreateObject("ADODB.Recordset")
EventoS.ActiveConnection = MM_CXEVENTO_STRING
EventoS.Source = "SELECT * FROM ESPACO WHERE IDESPACO= " + IdEspaco
EventoS.CursorType = 0
EventoS.CursorLocation = 2
EventoS.LockType = 1

EventoS.Open()
Situacao=cstr(EventoS.Fields.Item("IDSTATUS").Value)

'RESPONSE.WRITE(STATUS)
'RESPONSE.END
DESCSTATUS=""

IF Situacao="1" THEN
   DESCST="ATIVA"
END IF
IF Situacao="2" THEN
   DESCST="INATIVA"
END IF

wmes=cstr(trim(EventoS.Fields.Item("MES").Value))
wano=cstr(trim(EventoS.Fields.Item("ANO").Value))
wNomeEvento=cstr(trim(EventoS.Fields.Item("NOMEEVENTO").Value))
wUnidade=cstr(trim(EventoS.Fields.Item("UNIDADE").Value))
wResponsavel=cstr(trim(EventoS.Fields.Item("RESPONSAVEL").Value))
wLocatario=cstr(trim(EventoS.Fields.Item("LOCATARIO").Value))
wTelefone=cstr(trim(EventoS.Fields.Item("TELEFONE").Value))
wObjetivo=cstr(trim(EventoS.Fields.Item("OBJETIVO").Value))
wParticipante=cstr(trim(EventoS.Fields.Item("PARTICIPANTE").Value))
wData=cstr(trim(EventoS.Fields.Item("DATA").Value))
wHorario=cstr(trim(EventoS.Fields.Item("HORA").Value))
wDefinicaoQual=cstr(trim(EventoS.Fields.Item("DEFINICAOQUAL").Value))
wEquipamentoQual=cstr(trim(EventoS.Fields.Item("EQUIPAMENTOQUAL").Value))
wLocalQual=cstr(trim(EventoS.Fields.Item("LOCALQUAL").Value))
wValor=cstr(trim(EventoS.Fields.Item("VALOR").Value))
wValorEntrada=cstr(trim(EventoS.Fields.Item("VALORENTRADA").Value))
wObs=cstr(trim(EventoS.Fields.Item("OBS").Value))
wDefinicao=cstr(trim(EventoS.Fields.Item("DEFINICAO").Value))
wForma=cstr(trim(EventoS.Fields.Item("FORMA").Value))
wEquipamento=cstr(trim(EventoS.Fields.Item("EQUIPAMENTO").Value))
wMobilia=cstr(trim(EventoS.Fields.Item("MOBILIARIO").Value))
wEntrada=cstr(trim(EventoS.Fields.Item("ENTRADA").Value))
wLocal=cstr(trim(EventoS.Fields.Item("LOCAL").Value))
wBeneficio=cstr(trim(EventoS.Fields.Item("BENEFICIO").Value))
wMobiliaDesc=cstr(trim(EventoS.Fields.Item("MOBILIADESC").Value))

Dim Unidade
Dim Unidade_numRows

Set Unidade = Server.CreateObject("ADODB.Recordset")
Unidade.ActiveConnection = MM_CXEVENTO_STRING
Unidade.Source = "SELECT IDUNIDADE, NOMEUNIDADE FROM UNIDADERESP WHERE IDUNIDADE =" + CSTR(wUnidade)
Unidade.CursorType = 0
Unidade.CursorLocation = 2
Unidade.LockType = 1
Unidade.Open()
Unidade_numRows = 0
wNOMEUNIDADE=(trim(Unidade.Fields.Item("NOMEUNIDADE").Value))
%>
<!--#include file="RECRESPOSTASESP.ASP" -->
<html>
<head>
<title>SENAC - RIO - Imprime Ficha de Cessão de Espaço</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body leftmargin="12" topmargin="0" marginwidth="0" marginheight="0">
<div align="left"><hr align="left" width="800" size="6" noshade>
<font color="#000000" size="3" face="Times New Roman, Times, serif">&nbsp;<img src="images/SENAC_horiz_cor.jpg" width="217" height="60" align="absmiddle"> &nbsp;<font size="4">SENAC
RIO - FICHA DE CESS&Atilde;O DE ESPA&Ccedil;O - <%=DESCST%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;(&nbsp;<a href="javascript:self.print();"><img src="images/ltr_print_icon.gif" width="17" height="11" border="0"></a>)</font>           <br>

   <hr align="left" width="800" size="6" noshade> 
   <font size="2" face="Times New Roman, Times, serif">UNIDADE LOCADORA<br>
</font>
     <font size="1" face="Times New Roman, Times, serif"><%=wNomeUnidade%><br>
     </font>
      <hr align="left" width="800" size="1">
   
   <font size="2" face="Times New Roman, Times, serif">RESPONS&Aacute;VEL:</FONT><br>
       <font size="1" face="Times New Roman, Times, serif"><%=wResponsavel%><br>
       </font><font size="1" face="Times New Roman, Times, serif">
   <hr width="800" size="1"></font>

   <font size="2" face="Times New Roman, Times, serif">LOCAT&Aacute;RIO:</FONT><br>
       <font size="1" face="Times New Roman, Times, serif"><%=Wlocatario%><br>
       </font>
   <font size="1" face="Times New Roman, Times, serif">
   <hr width="800" size="1"></font>
   
    <font size="2" face="Times New Roman, Times, serif">TELEFONES:</FONT><br>
       <font size="1" face="Times New Roman, Times, serif"><%=wtelefone%><br>
       </font>
   <font size="1" face="Times New Roman, Times, serif">
   <hr width="800" size="1">
   </font>
   
   <font size="2" face="Times New Roman, Times, serif">NOME DO EVENTO:</FONT><br>
   <font size="1" face="Times New Roman, Times, serif"><%=wnomeevento%><br>
  </font><hr width="800" size="1">

   <font size="2">DATA DO EVENTO:</font>
   <% if wData="" then
         wData= wmes + "/" + wano
      end if
   %>
   <br><font size="1" face="Times New Roman, Times, serif"><%=wData%></FONT>
   <br><hr width="800" size="1">

   <font size="2" face="Times New Roman, Times, serif">HOR&Aacute;RIO DO EVENTO:</font>
   <br>
   <font size="1" face="Times New Roman, Times, serif"><%=whorario%></font>
   <br>  
   <hr align="left" width="800" size="1">
<font size="2" face="Times New Roman, Times, serif">1.OBJETIVO DO LOCAT&Aacute;RIO
COM A CESS&Atilde;O DO ESPA&Ccedil;O:
<br>
</font>
   <hr align="left" width="800" size="1">
   <font size="1" face="Times New Roman, Times, serif"><%=WObjetivo%></FONT>
 <br>  
   <hr align="left" width="800" size="1">
<font size="2" face="Times New Roman, Times, serif">2.OBJETIVO DA CESS&Atilde;O
PARA O SENAC:  QUAL O BENEF&Iacute;CIO DO SENAC COM ESSA CESS&Atilde;O?<br>
</font>
   <hr align="left" width="800" size="1">
   <font size="1" face="Times New Roman, Times, serif"><%=WBENEFICIO%></FONT>
   <hr align="left" width="800" size="1">

<font size="2" face="Times New Roman, Times, serif">3 .PARTICIPANTES<br>
</font>
   <hr align="left" width="800" size="1">
   <font size="1" face="Times New Roman, Times, serif"><%=WPARTICIPANTE%></FONT>
   <hr align="left" width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">4. FORMA DE EXECU&Ccedil;&Atilde;O
   DA CESS&Atilde;O DE ESPA&Ccedil;OS:</font>
   <br>
   <hr align="left" width="800" size="1">
   <%rr=Resposta(1,wForma)%>
   <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
   <br>
   <hr align="left" width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">5. DEFINI&Ccedil;&Atilde;O
   DO EVENTO: <br>
</font>
   <hr align="left" width="800" size="1">
   <%rr=Resposta(2,wDefinicao)%>
   <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
   <br>
   <font size="1" face="Times New Roman, Times, serif"><%=wDefinicaoQual%></FONT>
   <hr align="left" width="800" size="1">

  <font size="2" face="Times New Roman, Times, serif">6.&nbsp;LOCAL: <br>
</font>
   <hr align="left" width="800" size="1">
   <%rr=Resposta(3,wlOCAL)%>
   <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
   <br>
<font size="1" face="Times New Roman, Times, serif"><%=wlOCALQual%></FONT>
   <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">7. ENTRADA: <br>
</font>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">
  <%IF WEntrada=1 then
     rr="Gratuita"
  else
     Wrr="Paga"
  end if
%> 
<font size="1" face="Times New Roman, Times, serif"><%=rr%> ..  VALOR: <%=wvalorEntrada%></FONT>

 
 <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">8. EQUIPAMENTO:<br> 
</font>
  <%rr=Resposta(4,wEquipamento)%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
  <br>
  <font size="1" face="Times New Roman, Times, serif"><%=wEquipamentoQual%></FONT>
  <BR>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">9. MOBILI&Aacute;RIO:</font><br>
  <hr align="left" width="800" size="1">
  <%rr=Resposta(5,wMobilia)%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
  <br>
  <font size="1" face="Times New Roman, Times, serif"><%=wMobiliaDesc%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">10. QUAL O VALOR DE CONTRATO?<br>
</font>
  <hr align="left" width="800" size="1">
<font size="1" face="Times New Roman, Times, serif"><%=WVALOR%></FONT>
  
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">&nbsp;11. OBSERVA&Ccedil;&Otilde;ES
  FINAIS: <br>
</FONT>
  <hr align="left" width="800" size="1"> 
  <font size="1" face="Times New Roman, Times, serif"><%=WOBS%></font>
  <br>
</BODY>
</html>
<%
Unidade.Close()
Set Unidade = Nothing
EventoS.Close()
Set EventoS = Nothing
%>
  
