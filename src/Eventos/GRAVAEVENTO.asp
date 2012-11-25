<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%  response.buffer = true 
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

Ncriador= CSTR(wsigla + "@rj.senac.br")
'RESPONSE.WRITE(NCRIADOR)
'RESPONSE.END
wHora= CSTR(Time)
wNomeEvento=trim(CStr(Request.Form("nomeevento")))
 If wNomeEvento="" then
     response.write("Nome de evento vazio")
    response.end
  end if
%>
 <!--#include file="RECUPERAEDITA.asp" --> 
 <!--#include file="INCEMAIL.asp" --> 
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
 
WSQL="INSERT INTO EVENTO (NOMEEVENTO,DATA,HORA,IDLOCAL,IDUNIDADE,IDSIGLA,IDAREACON,GVENDA,ENTRADA,"
WSQL= WSQL + "IDTIPOEVENTO,PARTSENAC,IDPUBLICOPF,IDPUBLICOPJ,IDPUBLICOOUT,IDOBJETIVO,ESTIMAPUBLICO,AVALIA,"
WSQL= WSQL + "IDACAO,MATERIAL,FILMEFOTO,CUSTO,INVESTIMENTO,ORCAMENTO,RECEITA,PARC_PATRO,"
WSQL= WSQL + "IDDIVULGACAO,IDSTATUS,TIPOEVENTOOU,ACAOQUAL,OBJETIVOOU,"
WSQL= WSQL + "VENDA,AVALIAQUAL,VALORENTRADA,PFOUTRO,PJOUTRO,POOUTRO,DIVULGAQUAL,ANO,MES,REALIZADOR,UPART,OBS,RESPONSAVEL,FECO,DIA,FECOMERCIO,PATROCINA,VISITANTE,DIAF,MESF,ANOF)"	
WSQL= WSQL + " VALUES ('" + wNomeEvento + "','" + wDataEvento + "','" + wHorario + "','" + wLocal + "'," + wUnidade + ",'" + wSigla + "','" + wAreaCon + "',"+ wGVenda + "," + wEntrada + ",'" + wTipoEvento + "','" + wPartSenac + "','" + wPF + "','" + wPJ + "','" + wGOutraPar  + "','" + 	wObjetivo  + "','" + wEstimaPublico + "', " + wGAvaliacao +  ",'" + wAcao + "', '" + wMaterial + "', '" + wFilmeFoto + "'," + wGCustos + ", " +  wInvestimento + ", '" + wOrcamento + "','" + wReceita + "','" + wParceiro + "','" + wDivulgacao + "',1,'" + wTipoEventoOutro + "','" + wAcaoQual + "','" + wOutrosObjetivo + "','" + wVenda + "','" + wAvaliaQual + "','" + wValorEntrada + "','"+ wPFQual + "','" +wPJQual + "','" + wOutraQual + "','" + wDivulgacaoQual + "'," +WANO + "," + WMES + ",'" + wREALIZADOR + "','" + wUPart + "','" + wObs + "','" + wResponsavel + "'," + wFec + "," + WDIA + ",'" + wFecomercio + "','" + wPatrocina + "','" +  wVisitante + "'," + WdiaF + "," + WmesF +  "," + WanoF +  ")"    
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
   Mensagem= "Sr Analista, foi cadastrado um novo evento. Obrigado!"
   retemail=EnviaEmail("Usuario", NCriador , "Analista de Eventos", NAnalista, "", "", "", "Cadastro de novo evento", Mensagem)
'   response.write(retemail)
'   response.end

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
<% Function TransLista(lista)
      lista1 = lista
      lista1 = Replace(lista1, " ", "")
      lista1 = Replace(lista1, ",", "-")
      TransLista = "-" & lista1 & "-"
  End Function %>
</head>
<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center"><img src="images/BANNER1.gif" width="800" height="70" align="middle">
</div>
<p align="center">&nbsp;</p>
<p>&nbsp;</p>
<table width="800" height="90" border="0" align="center" class="BordasLaterais">
  <tr>
    <td height="38" bgcolor="#FFFFFF"><div align="center"><strong> <font color="#0033CC" size="4"> ***
            EVENTO CADASTRADO ***</font></strong></div>
    </td>
  </tr>
  <tr>
    <td height="43" bgcolor="#FFFFFF"><div align="center"><strong><font color="#0033CC" size="2" face="Times New Roman, Times, serif">ENVIO
            DE EMAIL: <%=NANALISTA%> - <%=RETEMAIL%></font></strong></div></td>
  </tr>
</table>
<p align="center">&nbsp;</p>
<p align="center"><a href="CadastrodeEventoxx.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
<p align="center">&nbsp;</p>
</html>
<%RESPONSE.REDIRECT("CadastrodeEventoxx.asp")%>

