<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%
  Function TransLista(lista)
      lista1 = lista
      lista1 = Replace(lista1, " ", "")
      lista1 = Replace(lista1, ",", "-")
      TransLista = "-" & lista1 & "-"
  End Function
%>
<% response.buffer = true 
   response.expires=0
   wSigla="ACM"
   wHora= CSTR(Time)
   wAprova=trim(CStr(Request.Form("Aprova")))
   wCategoria=trim(CStr(Request.Form("Categoria")))
   IdEvento=trim(CStr(Request.Form("IdEvento")))
%>
 <!--#include file="RECUPERAEDITA.asp" --> 
<%
   IF wAprova=1 then
      status="2"
   else
	  status="4"
      wCategoria= "NULL"
	end if
 
'WSQL="UPDATE EVENTO SET (NOMEEVENTO,DATA,HORA,IDLOCAL,IDUNIDADE,IDSIGLA,IDAREACON,GVENDA,ENTRADA,"
'WSQL= WSQL + "IDTIPOEVENTO,PARTSENAC,IDPUBLICOPF,IDPUBLICOPJ,IDPUBLICOOUT,IDOBJETIVO,ESTIMAPUBLICO,AVALIA,"
'WSQL= WSQL + "IDACAO,MATERIAL,FILMEFOTO,CUSTO,INVESTIMENTO,ORCAMENTO,RECEITA,PARC_PATRO,"
'WSQL= WSQL + "IDDIVUGACAO,IDSTATUS,TIPOEVENTOOU,ACAOQUAL,OBJETIVOOU,"
'WSQL= WSQL + "VENDA,AVALIAQUAL,VALORENTRADA,PFOUTRO,PJOUTRO,POOUTRO,DIVULGAQUAL) "	
'WSQL= WSQL + " VALUES ('" + wNomeEvento + "','" + wDataEvento + "','" + wHorario + "'," + wLocal + "," + wUnidade + ",'" + wSigla + "'," + wAreaCon + ","+ wGVenda + "," + wEntrada + "," + wTipoEvento + ",'" + wPartSenac + "', " + wPF + ", " + wPJ + ", " + wGOutraPar  + "," + 	wObjetivo  + ",'" + wEstimaPublico + "', " + wGAvaliacao +  "," + wAcao + ", '" + wMaterial + "', '" + wFilmeFoto + "'," + wGCustos + ", " +  wInvestimento + ", '" + wOrcamento + "','" + wReceita + "','" + wParceiro + "'," + wDivulgacao + ",1,'" + wTipoEventoOutro + "','" + wAcaoQual + "','" + wOutrosObjetivo + "','" + wVenda + "','" + wAvaliaQual + "','" + wValorEntrada + "','"+ wPFQual + "','" +wPJQual + "','" + wOutraQual + "','" + wDivulgacaoQual + "') "    
'WSQL= WSQL + "WHERE IDEVENTO = " + IDEVENTO

WSQL="UPDATE EVENTO SET NOMEEVENTO='" + wNomeEvento + "',DATA='" + wDataEvento + "',HORA='" + wHorario + "',IDLOCAL=" + wLocal + ",IDUNIDADE=" + wUnidade + ",IDSIGLA='" + wSigla + "',IDAREACON='" + wAreaCon + "',GVENDA="+ wGVenda + ",ENTRADA=" + wEntrada + ", IDCATEGORIA=" + wCategoria + ","
WSQL= WSQL + "IDTIPOEVENTO='" + wTipoEvento + "',PARTSENAC='" + wPartSenac + "',IDPUBLICOPF='" + wPF + "',IDPUBLICOPJ='" + wPJ + "',IDPUBLICOOUT='" + wGOutraPar  + "',IDOBJETIVO='" + wObjetivo  + "',ESTIMAPUBLICO='" + wEstimaPublico + "',AVALIA=" + wGAvaliacao + ","
WSQL= WSQL + "IDACAO='" + wAcao + "',MATERIAL= '" + wMaterial + "',FILMEFOTO='" + wFilmeFoto + "',CUSTO=" + wGCustos + ",INVESTIMENTO=" +  wInvestimento + ",ORCAMENTO= '" + wOrcamento + "',RECEITA='" + wReceita + "',PARC_PATRO='" + wParceiro + "',"
WSQL= WSQL + "IDDIVULGACAO='" + wDivulgacao + "',IDSTATUS=" + status + ",TIPOEVENTOOU='" + wTipoEventoOutro + "',ACAOQUAL='" + wAcaoQual + "',OBJETIVOOU='" + wOutrosObjetivo + "',"
WSQL= WSQL + "VENDA='" + wVenda + "',AVALIAQUAL='" + wAvaliaQual + "',VALORENTRADA='" + wValorEntrada + "',PFOUTRO='"+ wPFQual + "',PJOUTRO='" +wPJQual + "',POOUTRO='" + wOutraQual + "',DIVULGAQUAL='" + wDivulgacaoQual + "'"	
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
%>
<html><title>CONTROLE DE EVENTOS</title>
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<img src="images/BANNER1.gif" width="800" height="70" align="middle">
<p align="center">&nbsp;</p>
<p>&nbsp;</p>
<table width="800" height="88" border="0" align="center" class="BordasLaterais">
  <tr>
    <td height="23" bgcolor="#FFFFFF"><div align="center"><strong>
	<font color="#0033CC" size="4">
    <%IF wAprova=1 then%>
	***  EVENTO PUBLICADO E ANALISADO ***</font></strong></div></td>
    <%else%>
	***  EVENTO REJEITADO RETORNANDO AO CADASTRO ***
	<%end if%>
  </tr>
</table>

<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center"><a href="EDITAEVENTOANAL.asp"><strong><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif">NOVA
          AN&Aacute;LISE</font></strong></a></p>
</html>
