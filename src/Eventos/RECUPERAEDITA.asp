<% 
   wdia=trim(CStr(Request.Form("Dia")))
   wmes=trim(CStr(Request.Form("Mes")))
   wano=trim(CStr(Request.Form("Ano")))
  
   wdiaf=trim(CStr(Request.Form("Diaf")))
   wmesf=trim(CStr(Request.Form("Mesf")))
   wanof=trim(CStr(Request.Form("Anof")))


'   RESPONSE.WRITE(WMES)
'   RESPONSE.END


   wNomeEvento=trim(CStr(Request.Form("nomeevento")))
   wNomeEvento=replace(wNomeEvento,"'","")
   If wNomeEvento="" then
      response.write("Nome de evento vazio")
	  response.end
  end if
 
   wLocal=trim(CStr(Request.Form("Local")))
   wLocal=replace(wLocal,"'","")

   wUnidade=trim(CStr(Request.Form("mnu_unidade")))
   If wUnidade="" then
      response.write("Unidade Vazia")
	  response.end
  end if

  wDataEvento=trim(CStr(Request.Form("Data")))
  wDataEvento=replace(wDataEvento,"'","")
 
  wHorario=trim(CStr(Request.Form("Horario")))
  wHorario=replace(wHorario,"'","")
  'If wHorario="" then
  '    response.write("Horario vazio")
'	  response.end
'   end if

   wTipoEvento=trim(CStr(Request.Form("OQUEE")))
   wTipoEvento=TransLista(wTipoEvento)

'   If wTipoEvento="--" then
'      response.write("Erro no Tipo evento")
'	  response.end
'   end if

   wObjetivo=trim(CStr(Request.Form("Objetivo")))  
   wObjetivo=TransLista(wObjetivo)
 '  If wObjetivo="--" then
 '     response.write("Erro no Objetivo")
'	  response.end
'   end if

   wOutrosObjetivo=trim(CStr(Request.Form("OutrosObjetivo")))  
   wOutrosObjetivo=replace(wOutrosObjetivo,"'","")
 '  If wOutrosObjetivo="" then
 '     response.write("8")
'	  response.end
'   end if
   wAreaCon=trim(CStr(Request.Form("Conhecimento")))
   wAreaCon=TransLista(wAreaCon)

'   If wAreaCon="--" then
'      response.write("Area de conheicmento vazia")'
'	  response.end
'   end if

   wAcao=trim(CStr(Request.Form("Acao")))
   wAcao=TransLista(wAcao)
 '  If wAcao="--" then
 '     response.write("Erro na Acao")
'	  response.end
'   end if

   wAcaoQual=trim(CStr(Request.Form("AcaoQual")))
   wAcaoQual=replace(wAcaoQual,"'","")
 '  If wAcaoQual="" then
 '     response.write("11")
'	  response.end
'   end if
 
   wGVenda=trim(CStr(Request.Form("GVenda")))
 '  If wGVenda="" then
 '     response.write("12")
'	  response.end
'   end if
 
   wVenda=trim(CStr(Request.Form("Venda")))
   wVenda=replace(wVenda,"'","")
 '  If wVenda="" then
 '     response.write("13")
'	  response.end
'   end if
 
   wEntrada=trim(CStr(Request.Form("Entrada")))
   wEntrada=replace(wEntrada,"'","")
'   If wEntrada="" then
'      response.write("14")'
'	  response.end
'   end if
 
   wPartSenac=trim(CStr(Request.Form("PartSenac")))
   wPartSenac=replace(wPartSenac,"'","")
'   If wParSenac="" then
'      response.write("15")
'	  response.end
'   end if
 
   wPF=trim(CStr(Request.Form("PF")))
   wPF=TransLista(wPF)
 '  If wPF="--" then
 '     response.write("Erro alvo Pessoa F�sica")
'	  response.end
'   end if

   wPFQual=trim(CStr(Request.Form("PFQual")))
   wPFQual=replace(wPFQual,"'","")
 '  If wPFQual="" then
 '     response.write("17")
'	  response.end
'   end if

   wPJ=trim(CStr(Request.Form("PJ")))
   wPJ=TransLista(wPJ)
 '  If wPJ="--" then
 '     response.write("Erro alvo Pessoa Jur�dica")
'	  response.end
'   end if


   wPJQual=trim(CStr(Request.Form("PJQual")))
   wPJQual=replace(wPJQual,"'","")
 '  If wPJQual="" then
 '     response.write("19")
'	  response.end
'   end if
 
   wGOutraPar=trim(CStr(Request.Form("GOutraPar")))
   wGOutraPar=TransLista(wGOutraPar)
 '  If wGOutraPar="--" then
 '     response.write("Erro alvo Outras participa��es")
'	  response.end
'   end if  

   wOutraQual=trim(CStr(Request.Form("OutraQual"))) 
   wOutraQual=replace(wOutraQual,"'","")
 '  If wOutraQual="" then
'      response.write("21")
'	  response.end
 '  end if

   wEstimaPublico=trim(CStr(Request.Form("EstimaPublico")))
   wEstimaPublico=replace(wEstimaPublico,"'","")
 '  If wEstimaPublico="" then
 '     response.write("22")
'	  response.end
'   end if
      
   wGAvaliacao=trim(CStr(Request.Form("GAvaliacao")))
 '  If wGAvaliacao="" then
 '     response.write("23")
'	  response.end
'   end if


   wAvaliaQual=trim(CStr(Request.Form("AvaliaQual")))
   wAvaliaQual=replace(wAvaliaQual,"'","")
 '  If wAvaliaQual="" then
 '     response.write("24")
'	  response.end
'   end if
   
   wDivulgacao=trim(CStr(Request.Form("GDivulgacao")))
   wDivulgacao=TransLista(wDivulgacao)
 '  If wDivulgacao="--" then
 '     response.write("Erro na Divulgacao")
'	  response.end
'   end if
 
   wDivulgacaoQual=trim(CStr(Request.Form("DivulgacaoQual")))
   wDivulgacaoQual=replace(wDivulgacaoQual,"'","")
 '  If wDivulgacaoQual="" then
 '     response.write("26")
'	  response.end
'   end if

   wMaterial=trim(CStr(Request.Form("Material")))
   wMaterial=replace(wMaterial,"'","")
 '  If wMaterial="" then
 '     response.write("27")
'	  response.end
'   end if


   wFilmeFoto=trim(CStr(Request.Form("FilmeFoto")))
   wFilmeFoto=replace(wFilmeFoto,"'","")
 '  If wFilmeFoto="" then
 '     response.write("28")
'	  response.end
'   end if

   wGCustos=trim(CStr(Request.Form("GCustos")))
   wGCustos=replace(wGCustos,"'","")
 '  If wGCustos="" then
 '     response.write("29")
'	  response.end
'   end if

   wInvestimento=trim(CStr(Request.Form("GInvestimento")))
   wInvestimento=replace(wInvestimento,"'","")
 '  If wInvestimento="" then
 '     response.write("30")
'	  response.end
'   end if

   wOrcamento=trim(CStr(Request.Form("Orcamento")))
   wOrcamento=replace(wOrcamento,"'","")
'   If wOrcamento="" then
'      response.write("31")'
'	  response.end
'   end if

   wReceita=trim(CStr(Request.Form("Receita")))
   wReceita=replace(wReceita,"'","")
 '  If wReceita="" then
 '     response.write("32")
'	  response.end
'   end if

   wParceiro=trim(CStr(Request.Form("Parceito")))
   wParceiro=replace(wParceiro,"'","")
 '  If wParceiro="" then
 '     response.write("33")
'	  response.end
'   end if

   wValorEntrada=trim(CStr(Request.Form("ValorEntrada")))
   wValorEntrada=replace(wValorEntrada,"'","")
 '  If wValorEntrada="" then
 '     response.write("34")
'	  response.end
'   end if

   wTipoEventoOutro=trim(CStr(Request.Form("OutrosEvento")))
   wTipoEvento=replace(wTipoEvento,"'","")
   
   wRealizador=trim(CStr(Request.Form("Realizador")))
   wRealizador=replace(wRealizador,"'","")
   
   wUPart=trim(CStr(Request.Form("UP")))
   wUpart=replace(wUPart,"'","")
   
   wObs=trim(CStr(Request.Form("FecObs")))
   wObs=replace(wObs,"'","")
   
   wFec=trim(CStr(Request.Form("GFec")))
   wFec=replace(wFec,"'","")
   
   wResponsavel=trim(CStr(Request.Form("Responsavel")))
   wResponsavel=replace(wResponsavel,"'","")
  
   wFecomercio=trim(CStr(Request.Form("Fecomercio")))
   wFecomercio=replace(wFecomercio,"'","")
  
   wFecomercio=trim(CStr(Request.Form("Fecomercio")))
   wFecomercio=replace(wFecomercio,"'","")
   
   wVisitante=trim(CStr(Request.Form("Visitante")))
   wVisitante=replace(wVisitante,"'","")
   
   wPatrocina=trim(CStr(Request.Form("Visitante")))
   wPatrocina=replace(wPatrocina,"'","")
 
%> 
