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
   DESCST="INCOMPLETA"
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
Responsavel=cstr(trim(EventoS.Fields.Item("Responsavel").Value))
Visitante=cstr(trim(EventoS.Fields.Item("Visitante").Value))
Fecomercio=cstr(trim(EventoS.Fields.Item("Fecomercio").Value))
Patrocina=cstr(trim(EventoS.Fields.Item("Patrocina").Value))

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
Responsavel=replace(Responsavel,chr(13),"<br>")

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
</head>
<body leftmargin="12" topmargin="0" marginwidth="0" marginheight="0">
<div align="left"><hr align="left" width="800" size="6" noshade>
<font color="#000000" size="3" face="Times New Roman, Times, serif">&nbsp;<img src="images/SENAC_horiz_cor.jpg" width="217" height="60" align="absmiddle"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<font size="4">SENAC RIO - FICHA
           DE EVENTO - <%=DESCST%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;(&nbsp;<a href="javascript:self.print();"><img src="images/ltr_print_icon.gif" width="17" height="11" border="0"></a>)</font>           <br>

   <hr align="left" width="800" size="6" noshade> 
   <font size="2" face="Times New Roman, Times, serif">NOME DO EVENTO:</FONT><br>
   <font size="1" face="Times New Roman, Times, serif"><%=nomeevento%><br><hr width="800" size="1">
   </font>
   <font size="2">DATA DO EVENTO:</font>
   <br>
   <%data1=DIA + "/" + MES + "/" + ANO%>
   <font size="1" face="Times New Roman, Times, serif">
   <%if data="" then%> 
      <%=Data1%>  
   <%ELSE%>
      <%=Data%>
   <%END IF%>
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
   <font size="2" face="Times New Roman, Times, serif">UNIDADE:<br>
</font>
   <font size="1" face="Times New Roman, Times, serif"><%=nOMEUnidade%></font>
  <hr width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">RESPONS&Aacute;VEL:<br>
</font>
   <font size="1" face="Times New Roman, Times, serif"><%=Responsavel%></font>

   <hr align="left" width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">1. O QUE &Eacute; O EVENTO:<br>
   </font>
   <hr align="left" width="800" size="1">
   <%rr=Resposta(1,IdTipoEvento)%>
   <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
   <br>
   <font size="1" face="Times New Roman, Times, serif"><%=TipoEventoOU%></FONT>
   <hr align="left" width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">&nbsp;1.1. OBJETIVO DA PARTICIPA&Ccedil;&Atilde;O DO SENAC RIO:
   <br>
   </font>
   <hr align="left" width="800" size="1">
   <%rr=Resposta(2,IdObjetivo)%>
   <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
   <br>
   <font size="1" face="Times New Roman, Times, serif"><%=ObjetivoOu%></FONT>
   <hr align="left" width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">2. &Aacute;REA DE CONHECIMENTO:</font>
   <br>
   <hr align="left" width="800" size="1">
   <%rr=Resposta(3,IdAreaCon)%>
   <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
   <br>
   <hr align="left" width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">&nbsp;3. A&Ccedil;&Otilde;ES
   DESENVOLVIDAS / PROGRAMA&Ccedil;&Otilde;ES SENAC RIO: <br>
   </font>
   <hr align="left" width="800" size="1">
   <%rr=Resposta(4,IdAcao)%>
   <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
   <br>
   <font size="1" face="Times New Roman, Times, serif"><%=AcaoQual%></FONT>
   <hr align="left" width="800" size="1">
   <font size="2" face="Times New Roman, Times, serif">3.1. PREVIS&Atilde;O DE
   VENDAS DE PRODUTOS:<br>
   </font>
   <hr align="left" width="800" size="1">
   <%IF GVenda=1 then
     rr="Sim"
   else
     rr="Não"
  end if
  %> 
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
  <BR>
  <font size="1" face="Times New Roman, Times, serif"><%=VENDA%></FONT>
  <br>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">3.2. ENTRADA: <br>
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
 <font size="2" face="Times New Roman, Times, serif">3.3. DESCRI&Ccedil;&Atilde;O
 DETALHADA DA PARTICIPA&Ccedil;&Atilde;O
DO SENAC RIO: <br>
 </font>
  <hr align="left" width="800" size="1">
  <%rr=PartSenac%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
  <br>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">3.4. EST&Aacute; PREVISTA:A PARTICIPA&Ccedil;&Atilde;O
  DO FECOM&Eacute;RICO? COMO PODERIA SER ESSA PARTICIPA&Ccedil;&Atilde;O?<br>
  </font>
  <hr align="left" width="800" size="1">
  <%rr=fecomercio%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT> <br>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">4.1. QUAL O P&Uacute;BLICO
  ALVO PESSOA F&Iacute;SICA:<br> </font>
  <%rr=Resposta(5,IdPF)%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
  <br>
  <font size="1" face="Times New Roman, Times, serif"><%=PFOutro%></FONT>
  <BR>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">4.2. QUAL O P&Uacute;BLICO
  ALVO PESSOA JUR&Iacute;DICA</font>
  <br>
  <hr align="left" width="800" size="1">
  <%rr=Resposta(6,IdPJ)%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
  <br>
  <font size="1" face="Times New Roman, Times, serif"><%=PJOUTRO%></FONT>
  <BR>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">4.3. HAVER&Aacute; OUTRAS PARTICIPA&Ccedil;&Otilde;ES:<br></font>
  <hr align="left" width="800" size="1">
  <%rr=Resposta(7,IdOu)%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
  <br>
  <font size="1" face="Times New Roman, Times, serif"><%=POOUTRO%></FONT>
  <br>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">4.4. INFORMAR OS PATROCINADORES
  DO EVENTO:<br>
  </font>
  <hr align="left" width="800" size="1">
  <%rr=PATROCINA%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT> <br>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">&nbsp;4.5. QUAL A ESTIMATIVA
  DE P&Uacute;BLICO: <br>
  </FONT>
  <hr align="left" width="800" size="1"> 
  <font size="1" face="Times New Roman, Times, serif"><%=EstimaPublico%></font>
  <br>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">&nbsp;4.6. SER&Aacute; FEITA
  AVALIA&Ccedil;&Atilde;O DE REA&Ccedil;&Atilde;O: <br>
</FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif">
  <%if GAvaliacao=1 then%>
  SIM
  <%ELSE%>
  NÃO
  <%END IF%>
  </FONT>
  <br>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">.4.7. SER&Aacute; FEITO
  O CADASTRO DE VISITANTES (MAILING LIST)?<br>
  </font>
  <hr align="left" width="800" size="1">
  <%rr=VISITANTES%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT> <br>
  <font size="1" face="Times New Roman, Times, serif"><%=AvaliaQual%></font>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">5.1. QUAL O PLANO DE
  DIVULGA&Ccedil;&Atilde;O: <br>
  </FONT>
  <hr align="left" width="800" size="1">
  <%rr=Resposta(8,GDIVULGACAO)%>
  <font size="1" face="Times New Roman, Times, serif"><%=rr%></FONT>
  <br>
  <font size="1" face="Times New Roman, Times, serif"><%=DIVULGAqual%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">&nbsp;5.2. INFORMAR QUANTIDADE
  ESTIMADA DE MATERIAL A SER USADO (folhetos,panfletos,etc)<br>
  </FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif"><%=MATERIAL%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">&nbsp;5.3. O EVENTO SERA
  FOTOGRAFADO E FILMADO?<br>
  </FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif"><%=FILMEFOTO%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">6.1. CUSTOS FORAM LAN&Ccedil;ADOS
  PREVIAMENTE NO OR&Ccedil;AMENTO DE SUA UNIDADE<br>
  </FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif">
  <%if Custo=1 then%>SIM
  <%ELSE%>
  NÃO
  <%END IF%>
  </FONT>
  <hr align="left" width="800" size="1">
  <Font size="2" face="Times New Roman, Times, serif">6.2. O EVENTO EM QUEST&Atilde;O
  CONTA COM INVESTIMENTO INTANG&Iacute;VEL (da Sede)<br>
  </FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif">
  <%if Investimento=1 then%>SIM
  <%ELSE%>
  NÃO
  <%END IF%>
  </FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">6.3. OR&Ccedil;AMENTO TOTAL
  PREVISTO?<br>
  </FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif"><%=ORCAMENTO%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">6.4. RECEITA TOTAL PREVISTA?<br>
  </FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif"><%=RECEITA%></FONT>
 <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">6.5. &Eacute; POSSIVEL
  BUSCAR PARCEIROS E/OU PATROCINADORES PARA O EVENTO.<br>
</FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif"><%=PARCPATRO%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">** REALIZADOR?<br>
</FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif"><%=REALIZADOR%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">6.6. UNIDADE PARTICIPANTE<br>
</FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif"><%=UP%></FONT>
  <hr align="left" width="800" size="1">
  <font size="2" face="Times New Roman, Times, serif">** FECOMERCIO?<br>
</FONT>
  <hr align="left" width="800" size="1">
  <font size="1" face="Times New Roman, Times, serif">
  <%if GFEC=1 then%>
  SIM
  <%ELSE%>
  NÃO
  <%END IF%>
  </FONT><BR>
  <font size="1" face="Times New Roman, Times, serif"><%=FECOBS%></FONT>
</BODY>
</html>
<%
Unidade.Close()
Set Unidade = Nothing
EventoS.Close()
Set EventoS = Nothing
%>
  
