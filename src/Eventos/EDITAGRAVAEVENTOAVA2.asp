<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<% response.buffer = true 
   response.expires=0
  Function TransLista(lista)
      lista1 = lista
      lista1 = Replace(lista1, " ", "")
      lista1 = Replace(lista1, ",", "-")
      TransLista = "-" & lista1 & "-"
  End Function
%>
<% wHora= CSTR(Time)
   wAprova=trim(CStr(Request.Form("Aprova")))
 '  wCategoria=trim(CStr(Request.Form("Categoria")))
   IdEvento=trim(CStr(Request.Form("IdEvento")))
   wSigla=Session("SIGLA")
   wHora= CSTR(Time)
   IdEvento=trim(CStr(Request.Form("IdEvento")))
   wObjAtingido=trim(CStr(Request.Form("ObjAtingido")))
   wImprensa=trim(CStr(Request.Form("Imprensa")))
   wApoio=trim(CStr(Request.Form("Troca")))
   wPatrocinio=trim(CStr(Request.Form("Patrocinio")))

   wAceitacao=trim(CStr(Request.Form("AceitaPub")))
'   response.write(wAceitacao)
'   response.end
   wOportunidade=trim(CStr(Request.Form("Oportunidade")))

   wNp=trim(CStr(Request.Form("NovoProduto")))
'   response.write(wNP)
'   response.end
 %>
 <!--#include file="RECUPERAEDITA.asp" --> 
<%
if wEntrada="" then
   wEntrada="1"
end if

if wGVenda="" then
   wGVenda="2"
end if
if wInvestimento="" then
   wInvestimento="2"
end if
if wGCustos="" then
   wGCustos="2"
end if
if wGAvaliacao="" then
   wGAvaliacao="2"
end if  
Status="3"

WSQL="UPDATE EVENTOANALISADO SET NOMEEVENTO='" + wNomeEvento + "',DATA='" + wDataEvento + "',HORA='" + wHorario + "',IDLOCAL='" + wLocal + "',IDUNIDADE=" + wUnidade + ",IDSIGLA='" + wSigla + "',IDAREACON='" + wAreaCon + "',GVENDA="+ wGVenda + ",ENTRADA=" + wEntrada + "," 
WSQL= WSQL + "IDTIPOEVENTO='" + wTipoEvento + "',PARTSENAC='" + wPartSenac + "',IDPUBLICOPF='" + wPF + "',IDPUBLICOPJ='" + wPJ + "',IDPUBLICOOUT='" + wGOutraPar  + "',IDOBJETIVO='" + wObjetivo  + "',ESTIMAPUBLICO='" + wEstimaPublico + "',AVALIA=" + wGAvaliacao + ","
WSQL= WSQL + "IDACAO='" + wAcao + "',MATERIAL= '" + wMaterial + "',FILMEFOTO='" + wFilmeFoto + "',CUSTO=" + wGCustos + ",INVESTIMENTO=" +  wInvestimento + ",ORCAMENTO= '" + wOrcamento + "',RECEITA='" + wReceita + "',PARC_PATRO='" + wParceiro + "',"
WSQL= WSQL + "IDDIVULGACAO='" + wDivulgacao + "',IDSTATUS=" + status + ",TIPOEVENTOOU='" + wTipoEventoOutro + "',ACAOQUAL='" + wAcaoQual + "',OBJETIVOOU='" + wOutrosObjetivo + "',"
WSQL= WSQL + "VENDA='" + wVenda + "',AVALIAQUAL='" + wAvaliaQual + "',VALORENTRADA='" + wValorEntrada + "',PFOUTRO='"+ wPFQual + "',PJOUTRO='" +wPJQual + "',POOUTRO='" + wOutraQual + "',DIVULGAQUAL='" + wDivulgacaoQual + "',IMPRENSA='" + wImprensa + "',OBJATINGIDO='" + wObjAtingido + "',APOIOPERMUTA='" + wAPOIO + "',PATROCINIO='"+ wPatrocinio + "',ACEITACAOPUB='" +wAceitacao + "',OPORTUNIDADE='" + wOportunidade + "',NOVOSPRODUTOS='" + wNP + "',ANO=" + WANO + ",MES=" + WMES + ",REALIZADOR='" + wRealizador + "',UPART='" + WUPART + "',OBS='" + WOBS + "',FECO=" + WFEC + ",DIA=" + WDIA
WSQL=WSQL + ",RESPONSAVEL='" + wResponsavel + "',DIAF=" + WdiaF + ",MESF=" + wMesF + ",ANOF=" + wAnoF  
WSQL=WSQL + " WHERE IDEVENTO = " + IDEVENTO

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
%>
<html><title>CONTROLE DE EVENTOS</title>
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center"><img src="images/BANNER1.gif" width="800" height="70" align="middle">
</div>
<p align="center">&nbsp;</p>
<p>&nbsp;</p>
<table width="800" height="63" border="0" align="center" class="BordasLaterais">
  <tr>
    <td height="51" bgcolor="#FFFFFF"><div align="center"><strong>
	<font color="#0033CC" size="4">

	***  EVENTO AVALIADO EDITADO ***</font></strong></div></td>
  </tr>
</table>

<p align="center">&nbsp;</p>
<p align="center"><a href="EDITAEVENTOAVA.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
<p align="center">&nbsp;</p>
</html>
