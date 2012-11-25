<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%
  Function TransLista(lista)
      lista1 = lista
      lista1 = Replace(lista1, " ", "")
      lista1 = Replace(lista1, ",", "-")
      TransLista = "-" & lista1 & "-"
  End Function

   response.buffer = true 
   response.expires=0
   wSigla=Session("SIGLA")
  
   Dim ANALISTA
   Dim NAnalista
   Dim NCriador

   Set ANALISTA = Server.CreateObject("ADODB.Recordset")
   ANALISTA.ActiveConnection = MM_CXEVENTO_STRING
   ANALISTA.Source = "SELECT top 1 * FROM EMAIL"
   ANALISTA.CursorType = 0
   ANALISTA.CursorLocation = 2
   ANALISTA.LockType = 1
   ANALISTA.Open()
   NAnalista=cstr(trim(ANALISTA.Fields.Item("DESCEMAIL").Value))
   ANALISTA.Close() 
  
  
   wHora= CSTR(Time)
   wAprova=trim(CStr(Request.Form("Aprova")))
   wCategoria=trim(CStr(Request.Form("Categoria")))
   IdEvento=trim(CStr(Request.Form("IdEvento")))
   Criador=trim(CStr(Request.Form("IdSigla")))
'   response.write(criador)
'   response.end
   Ncriador= CSTR(WSIGLA + "@rj.senac.br")
%>
 <!--#include file="RECUPERAEDITA.asp" --> 
 <!--#include file="INCEMAIL.asp" --> 
<%
   IF wAprova=1 then
      status="2"
      desc11="aprovado"
   else
	  status="4"
      desc11="incompleto"
	  wCategoria= "NULL"
end if
 
'WSQL="UPDATE EVENTO SET (NOMEEVENTO,DATA,HORA,IDLOCAL,IDUNIDADE,IDSIGLA,IDAREACON,GVENDA,ENTRADA,"
'WSQL= WSQL + "IDTIPOEVENTO,PARTSENAC,IDPUBLICOPF,IDPUBLICOPJ,IDPUBLICOOUT,IDOBJETIVO,ESTIMAPUBLICO,AVALIA,"
'WSQL= WSQL + "IDACAO,MATERIAL,FILMEFOTO,CUSTO,INVESTIMENTO,ORCAMENTO,RECEITA,PARC_PATRO,"
'WSQL= WSQL + "IDDIVUGACAO,IDSTATUS,TIPOEVENTOOU,ACAOQUAL,OBJETIVOOU,"
'WSQL= WSQL + "VENDA,AVALIAQUAL,VALORENTRADA,PFOUTRO,PJOUTRO,POOUTRO,DIVULGAQUAL) "	
'WSQL= WSQL + " VALUES ('" + wNomeEvento + "','" + wDataEvento + "','" + wHorario + "'," + wLocal + "," + wUnidade + ",'" + wSigla + "'," + wAreaCon + ","+ wGVenda + "," + wEntrada + "," + wTipoEvento + ",'" + wPartSenac + "', " + wPF + ", " + wPJ + ", " + wGOutraPar  + "," + 	wObjetivo  + ",'" + wEstimaPublico + "', " + wGAvaliacao +  "," + wAcao + ", '" + wMaterial + "', '" + wFilmeFoto + "'," + wGCustos + ", " +  wInvestimento + ", '" + wOrcamento + "','" + wReceita + "','" + wParceiro + "'," + wDivulgacao + ",1,'" + wTipoEventoOutro + "','" + wAcaoQual + "','" + wOutrosObjetivo + "','" + wVenda + "','" + wAvaliaQual + "','" + wValorEntrada + "','"+ wPFQual + "','" +wPJQual + "','" + wOutraQual + "','" + wDivulgacaoQual + "') "    
'WSQL= WSQL + "WHERE IDEVENTO = " + IDEVENTO

WSQL="UPDATE EVENTO SET NOMEEVENTO='" + wNomeEvento + "',DATA='" + wDataEvento + "',HORA='" + wHorario + "',IDLOCAL='" + wLocal + "',IDUNIDADE=" + wUnidade + ",IDSIGLA='" + wSigla + "',IDAREACON='" + wAreaCon + "',GVENDA="+ wGVenda + ",ENTRADA=" + wEntrada + ", IDCATEGORIA=" + wCategoria + ","
WSQL= WSQL + "IDTIPOEVENTO='" + wTipoEvento + "',PARTSENAC='" + wPartSenac + "',IDPUBLICOPF='" + wPF + "',IDPUBLICOPJ='" + wPJ + "',IDPUBLICOOUT='" + wGOutraPar  + "',IDOBJETIVO='" + wObjetivo  + "',ESTIMAPUBLICO='" + wEstimaPublico + "',AVALIA=" + wGAvaliacao + ","
WSQL= WSQL + "IDACAO='" + wAcao + "',MATERIAL= '" + wMaterial + "',FILMEFOTO='" + wFilmeFoto + "',CUSTO=" + wGCustos + ",INVESTIMENTO=" +  wInvestimento + ",ORCAMENTO= '" + wOrcamento + "',RECEITA='" + wReceita + "',PARC_PATRO='" + wParceiro + "',"
WSQL= WSQL + "IDDIVULGACAO='" + wDivulgacao + "',IDSTATUS=" + status + ",TIPOEVENTOOU='" + wTipoEventoOutro + "',ACAOQUAL='" + wAcaoQual + "',OBJETIVOOU='" + wOutrosObjetivo + "',"
WSQL= WSQL + "VENDA='" + wVenda + "',AVALIAQUAL='" + wAvaliaQual + "',VALORENTRADA='" + wValorEntrada + "',PFOUTRO='"+ wPFQual + "',PJOUTRO='" +wPJQual + "',POOUTRO='" + wOutraQual + "',DIVULGAQUAL='" + wDivulgacaoQual + "',ANO= " + WANO + ",MES=" + WMES + ",REALIZADOR='" + wRealizador + "',UPART='" + WUPART + "',OBS='" + WOBS + "',FECO=" + WFEC + ",DIA=" + WDIA	
WSQL=WSQL + ",RESPONSAVEL='" + wResponsavel
WSQL = WSQL + "',FECOMERCIO='" + WFECOMERCIO + "',PATROCINA='" + WPATROCINA + "',VISITANTE='" + WVISITAMTE + "',DIAF=" + WdiaF + ",MESF=" + wMesF + ",ANOF=" + wAnoF  
WSQL= WSQL + " WHERE IDEVENTO = " + IDEVENTO

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
'  RESPONSE.WRITE(NANALISTA)
'  RESPONSE.WRITE("-")
'  RESPONSE.WRITE(NCRIADOR)
'  RESPONSE.END
 
   Mensagem= "Sr Proponente o evento foi analisado. Resultado= " + desc11 + ". Obrigado!"
   retemail=EnviaEmail("Analista", NAnalista,"Proponente",NCriador, "", "", "", "Análise do evento", Mensagem)
%>
<html><title>CONTROLE DE EVENTOS</title>
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center"><img src="images/BANNER1.gif" width="800" height="70" align="middle">
</div>
<p align="center">&nbsp;</p>
<p>&nbsp;</p>
<table width="800" height="78" border="0" align="center" class="BordasLaterais">
  <tr>
    <td height="34" bgcolor="#FFFFFF"><div align="center"><strong>
	<font color="#0033CC" size="4">
    <%IF wAprova=1 then%>
	***  EVENTO PUBLICADO E ANALISADO ***</font></strong></div></td>
    <%else%>
	***  EVENTO INCOMPLETO RETORNANDO AO CADASTRO ***
	<%end if%>
  </tr>
  <tr>
    <td height="29" bgcolor="#FFFFFF"><div align="center"><strong><font color="#0033CC" size="2" face="Times New Roman, Times, serif">ENVIO
            DE EMAIL:  <%=NCRIADOR%> - <%=RETEMAIL%></font></strong></div></td>
  </tr>
</table>

<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center"><a href="EDITAEVENTOANAL.asp"><strong><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><img src="images/seta03.gif" width="33" height="33" border="0"></font></strong></a></p>
</html>
