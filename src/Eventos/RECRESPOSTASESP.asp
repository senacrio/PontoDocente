
<%
  Function Resposta(resp,CampoForm)
  RespTipo=""
  if resp=1 then
     x1="Aluguel"
     x2="Patrocinio"
     x3="Cessão"
     x4="Permuta/Parceria"
     x5="Erro"
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
  if resp=2 then
     x1="Treinamento"
     x2="Palestra"
     x3="Debate"
     x4="Confraternização"
     x5="Lançamento"
     x6="Apresentação"
     x7="Seminário"
     x8="Desfile"
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
  if resp=3 then
     x1="Auditório"
     x2="Ambientes de Aprendizagens convencionais"
     x3="Espaço Térreo"
     x4="Ambientes de Aprendizagem específico (laboratórios)"
     x5="Praça de alimentação"
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
  end if 
 if resp=4 then
     x1="TV"
     x2="Flip Chart"
     x3="Vídeo"
     x4="DataShow"
     x5="Som"
     x6="Telão"
     x7="DVDE"
     x8="NoteBoot"
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
  if resp=5 then
     x1="Cadeiras"
     x2="Mesas"
     x3="Cadeiras Universitárias"
     x4="Erro"
     x5="Erro"
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
  Resposta=RespTipo

  If InStr(CampoForm,"-20-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo+";"+x20
     else
        RespTipo=x20
     end if	  
  end if
  Resposta=RespTipo

End Function
%>