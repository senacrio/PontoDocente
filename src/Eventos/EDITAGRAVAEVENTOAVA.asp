<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<% response.buffer = true 
   response.expires= 0
  Function TransLista(lista)
      lista1 = lista
      lista1 = Replace(lista1, " ", "")
      lista1 = Replace(lista1, ",", "-")
      TransLista = "-" & lista1 & "-"
   End Function
   wSigla=Session("SIGLA")
   wHora= CSTR(Time)
   wAprova=trim(CStr(Request.Form("Aprova")))
   wCategoria=trim(CStr(Request.Form("Categoria")))
   IdEvento=trim(CStr(Request.Form("IdEvento")))
   wObjAtingido=trim(CStr(Request.Form("ObjAtingido")))
   wImprensa=trim(CStr(Request.Form("Imprensa")))
   wApoio1=trim(CStr(Request.Form("Troca")))
  
   wPatrocinio=trim(CStr(Request.Form("Patrocinio")))
   wAceitapub=trim(CStr(Request.Form("AceitaPub")))
   wOportunidade=trim(CStr(Request.Form("Oportunidade")))
   wNp=trim(CStr(Request.Form("NovoProduto")))
'   RESPONSE.WRITE(WAceitapub)
'   RESPONSE.END
' wTipoEvento=trim(CStr(Request.Form("OQUEE")))
' RESPONSE.WRITE(wtipoevento)
' response.end   
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
if wFec="" then
   wFec="2"
end if


'RESPONSE.WRITE(WDATAEVENTO)
'RESPONSE.END	  

WSQL="INSERT INTO EVENTOANALISADO (NOMEEVENTO,DATA,HORA,IDLOCAL,IDUNIDADE,IDSIGLA,IDAREACON,GVENDA, "
WSQL = WSQL + "ENTRADA,IDTIPOEVENTO,PARTSENAC,IDPUBLICOPF,IDPUBLICOPJ,IDPUBLICOOUT,IDOBJETIVO,ESTIMAPUBLICO,AVALIA,"
WSQL= WSQL + "IDACAO,MATERIAL,FILMEFOTO,CUSTO,INVESTIMENTO,ORCAMENTO,RECEITA,PARC_PATRO,"
WSQL= WSQL + "IDDIVULGACAO,IDSTATUS,TIPOEVENTOOU,ACAOQUAL,OBJETIVOOU,"
'WSQL= WSQL + "VENDA,AVALIAQUAL,VALORENTRADA,PFOUTRO,PJOUTRO,POOUTRO,DIVULGAQUAL,IDCATEGORIA,IDEVENTO,"	
WSQL= WSQL + "VENDA,AVALIAQUAL,VALORENTRADA,PFOUTRO,PJOUTRO,POOUTRO,DIVULGAQUAL,IDEVENTO,"	
WSQL= WSQL + "OBJATINGIDO,IMPRENSA,APOIOPERMUTA,PATROCINIO,ACEITACAOPUB,OPORTUNIDADE,NOVOSPRODUTOS,ANO,MES,REALIZADOR,UPART,OBS,FECO,RESPONSAVEL,DIA,DIAF,MESF,ANOF)"
WSQL= WSQL + " VALUES ('" + wNomeEvento + "','" + wDataEvento + "','" + wHorario + "','" + wLocal + "'," + wUnidade + ",'" + wSigla + "','" + wAreaCon + "',"+ wGVenda + "," + wEntrada + ",'" + wTipoEvento + "','" + wPartSenac + "','" + wPF + "','" + wPJ + "','" + wGOutraPar  + "','" + 	wObjetivo  + "','" + wEstimaPublico + "', 1,'" + wAcao + "', '" + wMaterial + "', '" + wFilmeFoto + "',1,1,'" + wOrcamento + "','" + wReceita + "','" + wParceiro + "','" + wDivulgacao + "',3,'" + wTipoEventoOutro + "','" + wAcaoQual + "','" + wOutrosObjetivo + "','" + wVenda + "','" + wAvaliaQual + "','" + wValorEntrada + "','"+ wPFQual + "','" +wPJQual + "','" + wOutraQual + "','" + wDivulgacaoQual +  "'," + IdEvento + ",'" + wObjAtingido + "','" + wImprensa + "','" + wApoio1 + "','" + wPatrocinio + "','" + wAceitaPub + "','" + wOportunidade + "','" + wNP + "'," + WANO + "," + WMES +  ",'" + wREALIZADOR + "','" + wUPart + "','" + wObs + "'," + wFec +  ",'" + wResponsavel  + "'," + WDIA + "," + WDIAF + "," + WMESF + "," + WANOF + ")"      
'WSQL= WSQL + " VALUES ('" + wNomeEvento + "','" + wDataEvento + "','" + wHorario + "','" + wLocal + "'," + wUnidade + ",'" + wSigla + "','" + wAreaCon + "',"+ wGVenda + "," + wEntrada + ",'" + wTipoEvento + "','" + wPartSenac + "','" + wPF + "','" + wPJ + "','" + wGOutraPar  + "','" + 	wObjetivo  + "','" + wEstimaPublico + "', 1,'" + wAcao + "', '" + wMaterial + "', '" + wFilmeFoto + "',1,1,'" + wOrcamento + "','" + wReceita + "','" + wParceiro + "','" + wDivulgacao + "',3,'" + wTipoEventoOutro + "','" + wAcaoQual + "','" + wOutrosObjetivo + "','" + wVenda + "','" + wAvaliaQual + "','" + wValorEntrada + "','"+ wPFQual + "','" +wPJQual + "','" + wOutraQual + "','" + wDivulgacaoQual +  "'," + wCategoria + "," + IdEvento + ",'" + wObjAtingido + "','" + wImprensa + "','" + wApoio1 + "','" + wPatrocinio + "','" + wAceitacao + "','" + wOportunidade + "','" + wNP + "'," + WANO + "," + WMES +  ",'" + wREALIZADOR + "','" + wUPart + "','" + wObs + "'," + wFec +  ",'" + wResponsavel  + "'," + WDIA +  ")"      

'RESPONSE.WRITE(WSQL)
'RESPONSE.END 

'WSQL="UPDATE EVENTO SET NOMEEVENTO='" + wNomeEvento + "',DATA='" + wDataEvento + "',HORA='" + wHorario + "',IDLOCAL=" + wLocal + ",IDUNIDADE=" + wUnidade + ",IDSIGLA='" + wSigla + "',IDAREACON='" + wAreaCon + "',GVENDA="+ wGVenda + ",ENTRADA=" + wEntrada + ", IDCATEGORIA=" + wCategoria + ","
'WSQL= WSQL + "IDTIPOEVENTO='" + wTipoEvento + "',PARTSENAC='" + wPartSenac + "',IDPUBLICOPF='" + wPF + "',IDPUBLICOPJ='" + wPJ + "',IDPUBLICOOUT='" + wGOutraPar  + "',IDOBJETIVO='" + wObjetivo  + "',ESTIMAPUBLICO='" + wEstimaPublico + "',AVALIA=" + wGAvaliacao + ","
'WSQL= WSQL + "IDACAO='" + wAcao + "',MATERIAL= '" + wMaterial + "',FILMEFOTO='" + wFilmeFoto + "',CUSTO=" + wGCustos + ",INVESTIMENTO=" +  wInvestimento + ",ORCAMENTO= '" + wOrcamento + "',RECEITA='" + wReceita + "',PARC_PATRO='" + wParceiro + "',"
'WSQL= WSQL + "IDDIVULGACAO='" + wDivulgacao + "',IDSTATUS=" + status + ",TIPOEVENTOOU='" + wTipoEventoOutro + "',ACAOQUAL='" + wAcaoQual + "',OBJETIVOOU='" + wOutrosObjetivo + "',"
'WSQL= WSQL + "VENDA='" + wVenda + "',AVALIAQUAL='" + wAvaliaQual + "',VALORENTRADA='" + wValorEntrada + "',PFOUTRO='"+ wPFQual + "',PJOUTRO='" +wPJQual + "',POOUTRO='" + wOutraQual + "',DIVULGAQUAL='" + wDivulgacaoQual + "'"	
'WSQL= WSQL + " WHERE IDEVENTO = " + IDEVENTO

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



    WSQL="UPDATE EVENTO SET IDSTATUS=3 WHERE IDEVENTO = " + IDEVENTO

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
<head>



 </script>
<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center"><img src="images/BANNER1.gif" width="800" height="70" align="middle"><br>
  <br>
  <br>
  <br>
  <br>
  <br>
</div>
<table width="800" height="53" border="0" align="center" cellpadding="0" cellspacing="0" class="BordasLaterais">
  <tr>
    <td height="45" bgcolor="#FFFFFF"><div align="center"><strong>
	<font color="#0033CC" size="4">
 	***  EVENTO AVALIADO ***</font></strong></div></td>
  </tr>
</table>

<p align="center">&nbsp;</p>
<p align="center"><a href="EDITAEVENTOAVAL.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
<p align="center">&nbsp;</p>
</html>
