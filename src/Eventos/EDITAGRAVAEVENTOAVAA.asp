<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<% response.buffer = true 
   response.expires=0
   wSigla="ACM"
   wHora= CSTR(Time)
   wAprova=trim(CStr(Request.Form("Aprova")))
   wCategoria=trim(CStr(Request.Form("Categoria")))
'   If wAprova="" then
'      response.write(wAprova)'
'	  response.end
'  end if

  IdEvento=trim(CStr(Request.Form("IdEvento")))
'   response.write(idevento)
'   response.end
   wNomeEvento=trim(CStr(Request.Form("nomeevento")))
   If wNomeEvento="" then
      response.write("1")
	  response.end
  end if
  wLocal=trim(CStr(Request.Form("mnu_local")))
  If WLocal="" then
      response.write("2")
	  response.end
  end if
  wUnidade=trim(CStr(Request.Form("mnu_unidade")))
  If wUnidade="" then
      response.write("3")
	  response.end
  end if
  wDiaData=trim(CStr(Request.Form("DiaData")))
  wMesData=trim(CStr(Request.Form("MesData")))
  wAnoData=trim(CStr(Request.Form("AnoData")))
  wDataEvento=wDiaData + "/" + wMesData + "/" + wAnoData
  If wDataEvento="" then
      response.write("4")
	  response.end
  end if

  wHorario=trim(CStr(Request.Form("Horario")))
  If wHorario="" then
      response.write("5")
	  response.end
  end if
  wTipoEvento=trim(CStr(Request.Form("OQUEE")))
   If wTipoEvento="" then
      response.write("6")
	  response.end
   end if
   wObjetivo=trim(CStr(Request.Form("Objetivo")))  
  If wObjetivo="" then
      response.write("7")
	  response.end
   end if

   wOutrosObjetivo=trim(CStr(Request.Form("OutrosObjetivo")))  
 '  If wOutrosObjetivo="" then
 '     response.write("8")
'	  response.end
'   end if
   wAreaCon=trim(CStr(Request.Form("Conhecimento")))
   If wAreaCon="" then
      response.write("9")
	  response.end
   end if

   wAcao=trim(CStr(Request.Form("Acao")))
   If wAcao="" then
      response.write("10")
	  response.end
   end if

   wAcaoQual=trim(CStr(Request.Form("AcaoQual")))
 '  If wAcaoQual="" then
 '     response.write("11")
'	  response.end
'   end if
 
   wGVenda=trim(CStr(Request.Form("GVenda")))
   If wGVenda="" then
      response.write("12")
	  response.end
   end if
 
   wVenda=trim(CStr(Request.Form("Venda")))
 '  If wVenda="" then
 '     response.write("13")
'	  response.end
'   end if
 
   wEntrada=trim(CStr(Request.Form("Entrada")))
  '  If wEntrada="" then
 '     response.write("14")
'	  response.end
'   end if
 
   wPartSenac=trim(CStr(Request.Form("PartSenac")))
 '  If wHorario="" then
 '     response.write("15")
'	  response.end
'   end if
 
   wPF=trim(CStr(Request.Form("PF")))
   If wPF="" then
      response.write("16")
	  response.end
   end if

   wPFQual=trim(CStr(Request.Form("PFQual")))
 '  If wPFQual="" then
 '     response.write("17")
'	  response.end
'   end if

   wPJ=trim(CStr(Request.Form("PJ")))
   If wPJ="" then
      response.write("18")
	  response.end
   end if


   wPJQual=trim(CStr(Request.Form("PJQual")))
 '  If wPJQual="" then
 '     response.write("19")
'	  response.end
'   end if


   wGOutraPar=trim(CStr(Request.Form("GOutraPar")))
   If wGOutraPar="" then
      response.write("20")
	  response.end
   end if

   wOutraQual=trim(CStr(Request.Form("OutraQual"))) 
 '  If wOutraQual="" then
 '     response.write("21")
'	  response.end
'   end if

   wEstimaPublico=trim(CStr(Request.Form("EstimaPublico")))
 '  If wEstimaPublico="" then
 '     response.write("22")
'	  response.end
'   end if
      
   wGAvaliacao=trim(CStr(Request.Form("GAvaliacao")))
   If wGAvaliacao="" then
      response.write("23")
	  response.end
   end if


  wAvaliaQual=trim(CStr(Request.Form("AvaliaQual")))
 '  If wAvaliaQual="" then
 '     response.write("24")
'	  response.end
'   end if
   
   wDivulgacao=trim(CStr(Request.Form("GDivulgacao")))
   If wDivulgacao="" then
      response.write("25")
     response.end
  end if
 
   wDivulgacaoQual=trim(CStr(Request.Form("DivulgacaoQual")))
 '  If wDivulgacaoQual="" then
 '     response.write("26")
'	  response.end
'   end if

   wMaterial=trim(CStr(Request.Form("Material")))
 '  If wMaterial="" then
 '     response.write("27")
'	  response.end
 '  end if


   wFilmeFoto=trim(CStr(Request.Form("FilmeFoto")))
 '  If wFilmeFoto="" then
 '     response.write("28")
'	  response.end
'   end if

   wGCustos=trim(CStr(Request.Form("GCustos")))
 '  If wGCustos="" then
 '     response.write("29")
'	  response.end
'   end if

   wInvestimento=trim(CStr(Request.Form("GInvestimento")))
 '  If wInvestimento="" then
 '     response.write("30")
'	  response.end
'   end if

   wOrcamento=trim(CStr(Request.Form("Orcamento")))
 '  If wOrcamento="" then
 '     response.write("31")
'	  response.end
'   end if

   wReceita=trim(CStr(Request.Form("Receita")))
 '  If wReceita="" then
 '     response.write("32")
'	  response.end
'   end if

   wParceiro=trim(CStr(Request.Form("Parceito")))
 '  If wParceiro="" then
 '     response.write("33")
'	  response.end
'   end if

   wValorEntrada=trim(CStr(Request.Form("ValorEntrada")))
 '  If wValorEntrada="" then
 '     response.write("34")
'	  response.end
'   end if

   wTipoEventoOutro=trim(CStr(Request.Form("OutrosEvento")))
 '  If wTipoEventoOutro="" then
 '     response.write("35")
'	  response.end
'   end if
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

WSQL="UPDATE EVENTO SET NOMEEVENTO='" + wNomeEvento + "',DATA='" + wDataEvento + "',HORA='" + wHorario + "',IDLOCAL=" + wLocal + ",IDUNIDADE=" + wUnidade + ",IDSIGLA='" + wSigla + "',IDAREACON=" + wAreaCon + ",GVENDA="+ wGVenda + ",ENTRADA=" + wEntrada + ", IDCATEGORIA=" + wCategoria + ","
WSQL= WSQL + "IDTIPOEVENTO=" + wTipoEvento + ",PARTSENAC='" + wPartSenac + "',IDPUBLICOPF= " + wPF + ",IDPUBLICOPJ= " + wPJ + ",IDPUBLICOOUT=" + wGOutraPar  + ",IDOBJETIVO=" + wObjetivo  + ",ESTIMAPUBLICO='" + wEstimaPublico + "',AVALIA=" + wGAvaliacao + ","
WSQL= WSQL + "IDACAO=" + wAcao + ",MATERIAL= '" + wMaterial + "',FILMEFOTO='" + wFilmeFoto + "',CUSTO=" + wGCustos + ",INVESTIMENTO=" +  wInvestimento + ",ORCAMENTO= '" + wOrcamento + "',RECEITA='" + wReceita + "',PARC_PATRO='" + wParceiro + "',"
WSQL= WSQL + "IDDIVUGACAO=" + wDivulgacao + ",IDSTATUS=" + status + ",TIPOEVENTOOU='" + wTipoEventoOutro + "',ACAOQUAL='" + wAcaoQual + "',OBJETIVOOU='" + wOutrosObjetivo + "',"
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
<p align="center"><a href="EDITAEVENTOANAL.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
<p align="center">&nbsp;</p>
</html>
