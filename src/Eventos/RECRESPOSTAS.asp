
<%
  Function Resposta(resp,CampoForm)
  RespTipo=""
  if resp=1 then
     x1="Feira"
     x2="Congresso"
     x3="Seminário"
     x4="Desfile"
     x5="Participacao com estande"
     x6="Lancamento"
     x7="Palestra"
     x8="Apresentacao"
     x9="Outros"
	 x10="Erro"
	 x11="Erro"
	 x12="Erro"	 
     x13="Erro"  
	 x14="Erro"
	 x15="Erro"
	 x16="Erro"	 
     x17="Erro"
	 x18="Erro"
	 x19="Erro"
	 x20="Erro"	 
     x21="Erro"
  end if
  if resp=2 then
     x1="Divulgacao Portifolio"
     x2="Apoio Instituicao"
     x3="Fortalecimento Marca"
     x4="Acao Relacionamento"
     x5="Apoio Social"
     x6="Explorar novas oportunidades"
     x7="Geracao Receita"
     x8="Outros"
     x9="Erro"
	 x10="Erro"
	 x11="Erro"
	 x12="Erro"	 
     x13="Erro"  
	 x14="Erro"
	 x15="Erro"
	 x16="Erro"	 
     x17="Erro"
	 x18="Erro"
	 x19="Erro"
	 x20="Erro"	 
     x21="Erro"
  end if
  if resp=3 then
     x1="Entretenimento"
     x2="Turismo e Hotelaria"
     x3="Terceiro Setor"
     x4="Esportes"
     x5="Idiomas"
     x6="Meio Ambiente"
     x7="Gastronomia"
     x8="Informática"
     x9="Moda"
     x10="Atividade com animais"
     x11="Gestao Educacional"
	 x12="Design" 
     x13="Petroleo e Gas"
	 x14="Saúde"
	 x15="Telecomunicações"
	 x16="Comércio"
	 x17="Tecnologia Educacional"
	 x18="Cultura e Comunicação"
	 x19="Beleza"
	 x20="Administração e Desenvolvimento Empresarial"
	 x21="Editora Senac Rio"
  end if 
 if resp=4 then
     x1="Quizz"
     x2="Oficina"
     x3="Consultoria"
     x4="Degustação"
     x5="Debate"
     x6="Outros"
     x7="Erro"
     x8="Erro"
     x9="Erro"
	 x10="Erro"
	 x11="Erro"
	 x12="Erro"	 
     x13="Erro"  
	 x14="Erro"
	 x15="Erro"
	 x16="Erro"	 
     x17="Erro"
	 x18="Erro"
	 x19="Erro"
	 x20="Erro"	 
     x21="Erro"
  end if
  if resp=5 then
     x1="Estudante"
     x2="Empreendedor"
     x3="CLT/Temporário "
     x4="Profissional Liberal"
     x5="Outros"
     x6="Erro"
     x7="Erro"
     x8="Erro"
     x9="Erro"
	 x10="Erro"
	 x11="Erro"
	 x12="Erro"	 
     x13="Erro"  
	 x14="Erro"
	 x15="Erro"
	 x16="Erro"	 
     x17="Erro"
	 x18="Erro"
	 x19="Erro"
	 x20="Erro"	 
     x21="Erro"
  end if
  if resp=6 then
     x1="MPE"
     x2="Corporações"
     x3="Fornecedores"
     x4="Setor Publico"
     x5="Empresarios"
     x6="Outros"
     x7="Erro"
     x8="Erro"
     x9="Erro"
	 x10="Erro"
	 x11="Erro"
	 x12="Erro"	 
     x13="Erro"  
	 x14="Erro"
	 x15="Erro"
	 x16="Erro"	 
     x17="Erro"
	 x18="Erro"
	 x19="Erro"
	 x20="Erro"	 
     x21="Erro"
  end if
  if resp=7 then
     x1="Sindicatos"
     x2="CDLs"
     x3="Terceiro Setor"
     x4="Associações Comerciais"
     x5="Outros"
     x6="Erro"
     x7="Erro"
     x8="Erro"
     x9="Erro"
	 x10="Erro"
	 x11="Erro"
	 x12="Erro"	 
     x13="Erro"  
	 x14="Erro"
	 x15="Erro"
	 x16="Erro"	 
     x17="Erro"
	 x18="Erro"
	 x19="Erro"
	 x20="Erro"	 
     x21="Erro"
  end if
  if resp=8 then
     x1="Mala Direta"
     x2="Panfletagem"
     x3="E-mail Marketing"
     x4="Folhetos"
     x5="Catalogo"
     x6="Portal"
     x7="Assessoria de Imprensa"
     x8="Campanha"
     x9="Outros"
	 x10="Erro"
	 x11="Erro"
	 x12="Erro"	 
     x13="Erro"  
	 x14="Erro"
	 x15="Erro"
	 x16="Erro"	 
     x17="Erro"
	 x18="Erro"
	 x19="Erro"
	 x20="Erro"	 
     x21="Erro"
  end if

  If InStr(CampoForm,"-1-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x1
     else
        RespTipo=x1
     end if	  
  end if
  If InStr(CampoForm,"-2-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x2
     else
        RespTipo=x2
     end if	  
  end if
    If InStr(CampoForm,"-3-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x3
     else
        RespTipo=x3
     end if	  
  end if
    If InStr(CampoForm,"-4-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x4
     else
        RespTipo=x4
     end if	  
  end if
    If InStr(CampoForm,"-5-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x5
     else
        RespTipo=x5
     end if	  
  end if
    If InStr(CampoForm,"-6-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x6
     else
        RespTipo=x6
     end if	  
  end if
    If InStr(CampoForm,"-7-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x7
     else
        RespTipo=x7
     end if	  
  end if
    If InStr(CampoForm,"-8-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x8
     else
        RespTipo=x8
     end if	  
  end if
  If InStr(CampoForm,"-9-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x9
     else
        RespTipo=x9
     end if	  
  end if
  Resposta=RespTipo

  If InStr(CampoForm,"-10-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x10
     else
        RespTipo=x10
     end if	  
  end if
  
  If InStr(CampoForm,"-11-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x11
     else
        RespTipo=x11
     end if	  
  end if
  If InStr(CampoForm,"-12-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x12
     else
        RespTipo=x12
     end if	  
  end if
    If InStr(CampoForm,"-13-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x13
     else
        RespTipo=x13
     end if	  
  end if
    If InStr(CampoForm,"-14-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x14
     else
        RespTipo=x14
     end if	  
  end if
    If InStr(CampoForm,"-15-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x15
     else
        RespTipo=x15
     end if	  
  end if
    If InStr(CampoForm,"-16-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x16
     else
        RespTipo=x16
     end if	  
  end if
    If InStr(CampoForm,"-17-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x17
     else
        RespTipo=x17
     end if	  
  end if
    If InStr(CampoForm,"-18-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x18
     else
        RespTipo=x18
     end if	  
  end if
  If InStr(CampoForm,"-19-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x19
     else
        RespTipo=x19
     end if	  
  end if

  If InStr(CampoForm,"-20-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x20
     else
        RespTipo=x20
     end if	  
  end if

  If InStr(CampoForm,"-21-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x21
     else
        RespTipo=x21
     end if	  
  end if
  Resposta=RespTipo
End Function
%>