<%@LANGUAGE="VBSCRIPT"%>
<% response.buffer = true 
   response.expires=0
   wSigla=Session("SIGLA")
   wHora= CSTR(Time)
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
   If wOutrosObjetivo="" then
      response.write("8")
	  response.end
   end if
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
   If wAcaoQual="" then
      response.write("11")
	  response.end
   end if
   wGVenda=trim(CStr(Request.Form("GVenda")))
   If wGVenda="" then
      response.write("12")
	  response.end
   end if
   wVenda=trim(CStr(Request.Form("Venda")))
   If wVenda="" then
      response.write("13")
	  response.end
   end if
   wEntrada=trim(CStr(Request.Form("Entrada")))
   If wEntrada="" then
      response.write("14")
	  response.end
   end if
   wPartSenac=trim(CStr(Request.Form("PartSenac")))
   If wHorario="" then
      response.write("15")
	  response.end
   end if
   wPF=trim(CStr(Request.Form("PF")))
   If wPF="" then
      response.write("16")
	  response.end
   end if

   wPFQual=trim(CStr(Request.Form("PFQual")))
   If wPFQual="" then
      response.write("17")
	  response.end
   end if

   wPJ=trim(CStr(Request.Form("PJ")))
   If wPJ="" then
      response.write("18")
	  response.end
   end if


   wPJQual=trim(CStr(Request.Form("PJQual")))
   If wPJQual="" then
      response.write("19")
	  response.end
   end if


   wGOutraPar=trim(CStr(Request.Form("GOutraPar")))
   If wGOutraPar="" then
      response.write("20")
	  response.end
   end if

   wOutraQual=trim(CStr(Request.Form("OutraQual"))) 
   If wOutraQual="" then
      response.write("21")
	  response.end
   end if

   wEstimaPublico=trim(CStr(Request.Form("EstimaPublico")))
   If wEstimaPublico="" then
      response.write("22")
	  response.end
   end if
      
   wGAvaliacao=trim(CStr(Request.Form("GAvaliacao")))
   If wGAvaliacao="" then
      response.write("23")
	  response.end
   end if

   wAvaliaQual=trim(CStr(Request.Form("AvaliaQual")))
   If wAvaliaQual="" then
      response.write("24")
	  response.end
   end if
   
   wDivulgacao=trim(CStr(Request.Form("GDivulgacao")))
   If wDivulgacao="" then
      response.write("25")
	  response.end
   end if
   wDivulgacaoQual=trim(CStr(Request.Form("DivulgacaoQual")))
   If wDivulgacaoQual="" then
      response.write("26")
	  response.end
   end if

   wMaterial=trim(CStr(Request.Form("Material")))
   If wMaterial="" then
      response.write("27")
	  response.end
   end if


   wFilmeFoto=trim(CStr(Request.Form("FilmeFoto")))
   If wFilmeFoto="" then
      response.write("28")
	  response.end
   end if

   wGCustos=trim(CStr(Request.Form("GCustos")))
   If wGCustos="" then
      response.write("29")
	  response.end
   end if

   wInvestimento=trim(CStr(Request.Form("GInvestimento")))
   If wInvestimento="" then
      response.write("30")
	  response.end
   end if

   wOrcamento=trim(CStr(Request.Form("Orcamento")))
   If wOrcamento="" then
      response.write("31")
	  response.end
   end if

   wReceita=trim(CStr(Request.Form("Receita")))
   If wReceita="" then
      response.write("32")
	  response.end
   end if

   wParceiro=trim(CStr(Request.Form("Parceito")))
   If wParceiro="" then
      response.write("33")
	  response.end
   end if

   wValorEntrada=trim(CStr(Request.Form("ValorEntrada")))
   If wValorEntrada="" then
      response.write("34")
	  response.end
   end if

   wTipoEventoOutro=trim(CStr(Request.Form("OutrosEvento")))
   If wTipoEventoOutro="" then
      response.write("35")
	  response.end
   end if
 
   if WtipoConv="0" and ((wCodigoPai=wCodigo) or (wCodigoPai="")) then
      Response.redirect("MATD.asp?CodInst=" + CodInst)
   end if


WSQL="INSERT INTO EVENTO (NOMEEVENTO,DATA,HORA,IDLOCAL,IDUNIDADE,IDSIGLA,IDAREACON,GVENDA,ENTRADA,"
WSQL= WSQL + "IDTIPOEVENTO,PARTSENAC,IDPUBLICOPF,IDPUBLICOPJ,IDPUBLICOOUT,IDOBJETIVO,ESTIMAPUBLICO,AVALIA,"
WSQL= WSQL + "IDACAO,MATERIAL,FILMEFOTO,CUSTO,INVESTIMENTO,ORCAMENTO,RECEITA,PARC_PATRO,"
WSQL= WSQL + "IDDIVUGACAO,IDSTATUS,TIPOEVENTOOU,ACAOQUAL,OBJETIVOOU,"
WSQL= WSQL + "VENDA,AVALIAQUAL,VALORENTRADA,PFOUTRO,PJOUTRO,POOUTRO,DIVULGAQUAL)"	
WSQL= WSQL + " VALUES ('" + wNomeEvento + "','" + wDataEvento + "','" + wHorario + "'," + wLocal + "," + wUnidade + ",'" + wSigla + "'," + wAreaCon + ","+ wGVenda + "," + wEntrada + "," + wTipoEvento + ",'" + wPartSenac + "', " + wPF + ", " + wPJ + ", " + wGOutraPar  + "," + 	wObjetivo  + ",'" + wEstimaPublico + "', " + wGAvaliacao +  "," + wAcao + ", '" + wMaterial + "', '" + wFilmeFoto + "'," + wGCustos + ", " +  wInvestimento + ", '" + wOrcamento + "','" + wReceita + "','" + wParceiro + "'," + wDivulgacao + ",1,'" + wTipoEventoOutro + "','" + wAcaoQual + "','" + wOutrosObjetivo + "','" + wVenda + "','" + wAvaliaQual + "','" + wValorEntrada + "','"+ wPFQual + "','" +wPJQual + "','" + wOutraQual + "','" + wDivulgacaoQual + "')"    
'RESPONSE.WRITE(WSQL)
'RESPONSE.END
   err.clear
   on error resume next
   Set ObjServidor = Server.CreateObject("ADODB.Command")
   ObjServidor.ActiveConnection = MM_ConFidel_STRING
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
   wregistro="Inclus�o " + WCodbarra + " " + WNome
   Wsql= "INSERT INTO LogSistema (Empresa, CodCliente, Sigla, Data,  Hora, Processo, Registro) VALUES ('" + CodInst + "', '" + wCodigo + "', '" + Login + "', { d '" + wSistema + "' } ,'" + wHora + "'," + wProcesso + ",'" +  wregistro + "')"    
   ERR.CLEAR
  ' RESPONSE.WRITE(WSQL)
  ' RESPONSE.END 
   on error resume next
   Set ObjServidor = Server.CreateObject("ADODB.Command")
   ObjServidor.ActiveConnection =  MM_ConFidel_STRING
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
   on error goto 0
%>
<html>
</html>
