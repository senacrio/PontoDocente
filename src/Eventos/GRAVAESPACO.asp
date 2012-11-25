<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%  response.buffer = true 
    response.expires=0
    wSigla=Session("SIGLA")
%>
 <!--#include file="RECUPERAEDITAESP.asp" --> 
<%
if wEntrada="" then
   wEntrada="1"
end if

'   wmes,wano,,wUnidade,wResponsavel,,wTelefone
'   wObjetivo,wParticipante,,wHorario
'   wDefinicaoQual, wEquipamentoQual,wValor,wValorEntrada,wObs
'   wDefinicao,wForma,wEquipamento,wMobilia,wEntrada

WSQL="INSERT INTO ESPACO (NOMEEVENTO,DATA,HORA,LOCATARIO,UNIDADE,RESPONSAVEL,TELEFONE,"
WSQL= WSQL + "DEFINICAO,DEFINICAOQUAL,LOCAL,LOCALQUAL,EQUIPAMENTO,EQUIPAMENTOQUAL,MOBILIARIO,VALOR,OBS,ANO,MES,OBJETIVO,PARTICIPANTE,"
WSQL= WSQL + "FORMA,ENTRADA,VALORENTRADA,IDSTATUS,SIGLA,BENEFICIO,MOBILIADESC)"
WSQL= WSQL + " VALUES ('" + wNomeEvento + "','" + wData + "','" + wHorario + "','" + wLocatario + "'," + wUnidade + ",'" + wResponsavel + "','" + wTelefone + "','" + wDefinicao + "','" +	wDefinicaoQual  + "','" + wLocal + "','" + wLocalQual+  "','" + wEquipamento + "','" + wEquipamentoQual +"','" + wMobilia + "', '" + wValor + "','" + wOBS + "'," +WANO + "," + WMES + ",'" + WOBJETIVO + "','" + wPARTICIPANTE + "','"  + wFORMA  + "','" + wENTRADA + "','" + wVALORENTRADA + "',1,'" + WSIGLA + "','" + WBENEFICIO + "','" + WMOBILIADESC + "')"    

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
   'Mensagem= "Sr Analista. Cadastrado Novo evento. Obrigado!"
  ' retemail=EnviaEmail("Cadastro Evento","Analista de Eventos",NCriador, NAnalista, "", "", "", "Cadastro de novo evento", Mensagem)
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
            ESPA&Ccedil;O CADASTRADO ***</font></strong></div>
    </td>
  </tr>
  <tr>
    <td height="43" bgcolor="#FFFFFF"><div align="center"><strong><font color="#0033CC" size="2" face="Times New Roman, Times, serif">ENVIO
            DE EMAIL: <%=NANALISTA%> - <%'=RETEMAIL%></font></strong></div></td>
  </tr>
</table>
<p align="center">&nbsp;</p>
<p align="center"><a href="CadastrodeEspaco.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
<p align="center">&nbsp;</p>
</html>
<%
'   wmes,wano,wNomeEvento,wUnidade,wResponsavel,wLocatario,wTelefone
'   wObjetivo,wParticipante,wData,wHorario
'   wDefinicaoQual, wEquipamentoQual,wValor,wValorEntrada,wObs
'   wDefinicao,wForma,wEquipamento,wMobilia,wEntrada
%>