<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%response.buffer = true
response.Expires = 0
IdEvento=trim(CStr(Request.QueryString("IDEVENTO")))

Set EventoS = Server.CreateObject("ADODB.Recordset")
EventoS.ActiveConnection = MM_CXEVENTO_STRING
EventoS.Source = "SELECT * FROM EVENTO WHERE IDEVENTO= " + IdEvento
EventoS.CursorType = 0
EventoS.CursorLocation = 2
EventoS.LockType = 1

EventoS.Open()
Situacao=cstr(EventoS.Fields.Item("IDSTATUS").Value)

'RESPONSE.WRITE(STATUS)
'RESPONSE.END
DESCSTATUS=""

IF Situacao="1" THEN
   DESCST="NÃO PUBLICADA"
END IF
IF Situacao="2" THEN
   DESCST="PUBLICADA"
END IF
IF Situacao="3" THEN
   DESCST="AVALIADA"
END IF
IF Situacao="4" THEN
   DESCST="REJEITADA"
END IF
'RESPONSE.WRITE(Situacao)
'RESPONSE.WRITE("--")
'RESPONSE.WRITE(Descst)
'RESPONSE.END

NomeEvento=cstr(trim(EventoS.Fields.Item("NOMEEVENTO").Value))
Data=cstr(trim(EventoS.Fields.Item("DATA").value))
Horario=cstr(trim(EventoS.Fields.Item("HORA").Value))
IdLocal=EventoS.Fields.Item("IDLOCAL").Value
IdUnidade=EventoS.Fields.Item("IDUNIDADE").Value
IdSigla=EventoS.Fields.Item("IDSIGLA").Value
IdAreaCon=EventoS.Fields.Item("IDAREACON").Value
GVenda=EventoS.Fields.Item("GVENDA").Value
Entrada=cstr(trim(EventoS.Fields.Item("ENTRADA").Value))
IdTipoEvento=EventoS.Fields.Item("IDTIPOEVENTO").Value
PartSenac=EventoS.Fields.Item("PARTSENAC").Value
IdPF=EventoS.Fields.Item("IDPUBLICOPF").Value
IdPJ=EventoS.Fields.Item("IDPUBLICOPJ").Value
IdOu=EventoS.Fields.Item("IDPUBLICOOUT").Value
IdObjetivo=EventoS.Fields.Item("IDOBJETIVO").Value
EstimaPublico=cstr(trim(EventoS.Fields.Item("ESTIMAPUBLICO").Value))
Avalia=cstr(trim(EventoS.Fields.Item("AVALIA").Value))
IdAcao=EventoS.Fields.Item("IDACAO").Value
Material=cstr(trim(EventoS.Fields.Item("MATERIAL").Value))
FilmeFoto=cstr(trim(EventoS.Fields.Item("FILMEFOTO").Value))
Custo=cstr(trim(EventoS.Fields.Item("CUSTO").Value))
Investimento=cstr(trim(EventoS.Fields.Item("INVESTIMENTO").Value))
Orcamento=cstr(trim(EventoS.Fields.Item("ORCAMENTO").Value))
Receita=EventoS.Fields.Item("RECEITA").Value
ParcPatro=cstr(trim(EventoS.Fields.Item("PARC_PATRO").Value))
GDivulgacao=EventoS.Fields.Item("IDDIVULGACAO").Value
IdStatus=EventoS.Fields.Item("IDSTATUS").Value
TipoEventoOU=cstr(trim(EventoS.Fields.Item("TIPOEVENTOOU").Value))
AcaoQual=cstr(trim(EventoS.Fields.Item("ACAOQUAL").Value))
ObjetivoOu=cstr(trim(EventoS.Fields.Item("OBJETIVOOU").Value))
Venda=cstr(trim(EventoS.Fields.Item("VENDA").Value))
AvaliaQual=cstr(trim(EventoS.Fields.Item("AVALIAQUAL").Value))
ValorEntrada=cstr(trim(EventoS.Fields.Item("VALORENTRADA").Value))
PFOutro=cstr(trim(EventoS.Fields.Item("PFOUTRO").Value))
PJOutro=cstr(trim(EventoS.Fields.Item("PJOUTRO").Value))
POOutro=cstr(trim(EventoS.Fields.Item("POOUTRO").Value))
DivulgaQual=cstr(trim(EventoS.Fields.Item("DIVULGAQUAL").Value))
Ano=cstr(trim(EventoS.Fields.Item("Ano").Value))
Mes=cstr(trim(EventoS.Fields.Item("Mes").Value))
Dia=cstr(trim(EventoS.Fields.Item("Dia").Value))
Realizador=cstr(trim(EventoS.Fields.Item("Realizador").Value))
UP=(trim(EventoS.Fields.Item("UPart").Value))
FecObs=cstr(trim(EventoS.Fields.Item("OBS").Value))
GFec=cstr(trim(EventoS.Fields.Item("FECO").Value))
IdLocal=replace(IdLocal,chr(13),"<br>")
Data=replace(Data,chr(13),"<br>")
Horario=replace(Horario,chr(13),"<br>")
nomeevento=replace(nomeevento,chr(13),"<br>")
PartSenac=replace(PartSenac,chr(13),"<br>")
ObjetivoOu=replace(ObjetivoOu,chr(13),"<br>")
TipoEventoOU=replace(TipoEventoOu,chr(13),"<br>")
AcaoQual=replace(AcaoQual,chr(13),"<br>")
Venda=replace(Venda,chr(13),"<br>")
PFOutro=replace(PFOutro,chr(13),"<br>")
PJOutro=replace(PJOutro,chr(13),"<br>")
POOutro=replace(POOutro,chr(13),"<br>")
EstimaPublico=replace(EstimaPublico,chr(13),"<br>")
DivulgaQual=replace(DivulgaQual,chr(13),"<br>")
AvaliaQual=replace(AvaliaQual,chr(13),"<br>")
Material=replace(Material,chr(13),"<br>")
FilmeFoto=replace(FilmeFoto,chr(13),"<br>")
ParcPatro=replace(ParcPatro,chr(13),"<br>")
Realizador=replace(Realizador,chr(13),"<br>")
UP=replace(UP,chr(13),"<br>")
FecObs=replace(FecObs,chr(13),"<br>")

Dim Unidade
Dim Unidade_numRows

Set Unidade = Server.CreateObject("ADODB.Recordset")
Unidade.ActiveConnection = MM_CXEVENTO_STRING
Unidade.Source = "SELECT IDUNIDADE, NOMEUNIDADE FROM UNIDADERESP WHERE IDUNIDADE =" + CSTR(IdUnidade)
Unidade.CursorType = 0
Unidade.CursorLocation = 2
Unidade.LockType = 1
Unidade.Open()
Unidade_numRows = 0
NOMEUNIDADE=(trim(Unidade.Fields.Item("NOMEUNIDADE").Value))
%>


<!--#include file="RECRESPOSTAS.ASP" -->
<html>
<head>
<title>SENAC - RIO - Imprime Ficha de Eventos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
//-->
</script>
</head>
<body leftmargin="12" topmargin="0" marginwidth="0" marginheight="0">
<div align="left"><hr align="left" width="800" size="6" noshade>
<font color="#000000" size="3" face="Times New Roman, Times, serif">&nbsp;<img src="images/SENAC_horiz_cor.jpg" width="217" height="60" align="absmiddle"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<font size="4">SENAC
RIO - FICHA DE EVENTO RESUMIDA - <%=DESCST%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;(&nbsp;<a href="javascript:self.print();"><img src="images/ltr_print_icon.gif" width="17" height="11" border="0"></a>)</font>           <br>

   <hr align="left" width="800" size="6" noshade> 
   <font size="2" face="Times New Roman, Times, serif">NOME DO EVENTO:</FONT><br>
   <font size="1" face="Times New Roman, Times, serif"><%=nomeevento%><br><hr width="800" size="1">
   </font>
   <font size="2">DATA DO EVENTO:</font>
   <br>
   <% if Data="" then
      Data= Dia + "/" + Mes + "/" + Ano
      end if
   %> 
   <font size="1" face="Times New Roman, Times, serif"><%=Data%>
   </FONT>
   <br>
   <hr width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">LOCAL DO EVENTO:</font>
   <br>
   <font size="1" face="Times New Roman, Times, serif"><%=idlocal%><br></font>
   <hr width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">HOR&Aacute;RIO DO EVENTO:</font>
   <br>
   <font size="1" face="Times New Roman, Times, serif"><%=horario%></font>
   <br>
   <hr width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">UNIDADE RESPONS&Aacute;VEL:<br></font>
   <font size="1" face="Times New Roman, Times, serif"><%=nOMEUnidade%></font>
   <hr align="left" width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">.O QUE &Eacute; O EVENTO:<br>
</font>
   <hr align="left" width="800" size="1">
   <%rr=Resposta(1,IdTipoEvento)%>
   <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
   <br>
   <font size="1" face="Times New Roman, Times, serif"><%=TipoEventoOU%></FONT>
   <hr align="left" width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif"> OBJETIVO DA PARTICIPA&Ccedil;&Atilde;O DO SENAC RIO:
   <br>
</font>
   <hr align="left" width="800" size="1">
   <%rr=Resposta(2,IdObjetivo)%>
   <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
   <br>
<font size="1" face="Times New Roman, Times, serif"><%=ObjetivoOu%></FONT>
   <font size="2" face="Times New Roman, Times, serif"> .ENTRADA: <br>
</font>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">
  <%IF Entrada=1 then
     rr="Gratuita"
  else
     rr="Paga"
  end if
%> 
 <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
 <hr align="left" width="800" size="1">
 <font size="2" face="Times New Roman, Times, serif">.DESCRI&Ccedil;&Atilde;O DETALHADA DA PARTICIPA&Ccedil;&Atilde;O
DO SENAC RIO: <br>
</font>
  <hr align="left" width="800" size="1">
  <%rr=PartSenac%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
  <br>
  <hr align="left" width="800" size="1">
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">** REALIZADOR?<br>
</FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif"><%=REALIZADOR%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">UNIDADE PARTICIPANTE<br>
</FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif"><%=UP%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">** FECOMERCIO?<br>
</FONT>
  <hr align="left" width="800" size="1">
  <div align="center"><font size="1" face="Times New Roman, Times, serif">
  <%if GFEC=1 then%>
  SIM
  <%ELSE%>
  NÃO
  <%END IF%>
  </FONT><BR>
  <br>
  <br>
  <br>
    <font size="1" face="Times New Roman, Times, serif"><a href="javascript:history.back(0)"><img src="images/seta03.gif" width="33" height="33" border="0"></a><%=FECOBS%></FONT>
  </div>
</BODY>
</html>
<%
Unidade.Close()
Set Unidade = Nothing
EventoS.Close()
Set EventoS = Nothing
%>
  
