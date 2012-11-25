<% 
   wmes=trim(CStr(Request.Form("Mes")))
   wano=trim(CStr(Request.Form("Ano")))

   wNomeEvento=trim(CStr(Request.Form("nomeevento")))
   wNomeEvento=replace(wNomeEvento,"'","")
   If wNomeEvento="" then
      response.write("Nome de evento vazio")
	  response.end
   end if
 
  wUnidade=trim(CStr(Request.Form("unidade")))
  If wUnidade="" then
     response.write("Unidade Vazia")
	 response.end
  end if

  wResponsavel=trim(CStr(Request.Form("Responsavel")))
  wResponsavel=replace(wResponsavel,"'","")

  wTelefone=trim(CStr(Request.Form("Telefone")))
  wTelefone=replace(wTelefone,"'","")

  wLocatario=trim(CStr(Request.Form("Locatario")))
  wLocatario=replace(wLocatario,"'","")

  wTelefone=trim(CStr(Request.Form("Telefone")))
  wTelefone=replace(wTelefone,"'","")

  wObjetivo=trim(CStr(Request.Form("Objetivo")))
  wObjetivo=replace(wObjetivo,"'","")

  wParticipante=trim(CStr(Request.Form("Participante")))
  wParticipante=replace(wParticipante,"'","")

  wData=trim(CStr(Request.Form("Data")))
  wData=replace(wData,"'","")
 
  wHorario=trim(CStr(Request.Form("Horario")))
  wHorario=replace(wHorario,"'","")
 
  wDefinicaoQual=trim(CStr(Request.Form("DefinicaoQual")))
  wDefinicaoQual=replace(wDefinicaoQual,"'","")
 
  wEquipamentoQual=trim(CStr(Request.Form("EquipamentoQual")))
  wEquipamentoQual=replace(wEquipamentoQual,"'","")
 
  wLocal=trim(CStr(Request.Form("Local")))
  wLocal=TransLista(wLocal)

  wLocalQual=trim(CStr(Request.Form("LocalQual")))
  wLocalQual=replace(wLocalQual,"'","")

  wValor=trim(CStr(Request.Form("Valor")))
  wValor=replace(wValor,"'","")

  wValorEntrada=trim(CStr(Request.Form("ValorEntrada")))
  wValorEntrada=replace(wValorEntrada,"'","")

  wObs=trim(CStr(Request.Form("OBS")))
  wObs=replace(wOBS,"'","")
  
  wDefinicao=trim(CStr(Request.Form("Definicao")))
  wDefinicao=TransLista(wDefinicao)

  wForma=trim(CStr(Request.Form("Forma")))  
  wForma=TransLista(wForma)
  
  wEquipamento=trim(CStr(Request.Form("Equipamento")))
  wEquipamento=TransLista(wEquipamento)
 
  wMobilia=trim(CStr(Request.Form("Mobilia")))
  wMobilia=TransLista(wMobilia)
 
  wEntrada=trim(CStr(Request.Form("Entrada")))
  wEntrada=replace(wEntrada,"'","")

  wBeneficio=trim(CStr(Request.Form("Beneficio")))
  wBeneficio=replace(wBeneficio,"'","")
  
  wMobiliaDesc=trim(CStr(Request.Form("MobiliaDesc")))
  wMobiliaDesc=replace(wMobiliaDesc,"'","")

%> 
