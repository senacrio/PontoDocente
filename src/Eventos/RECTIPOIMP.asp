
<%
  Sub Function Resposta(Resposta,CampoForm)
  RespTipo=""
  if resposta=1 then
     x1="Feira"
     x2="Congresso"
     x3="Seminário"
     x4="Desfile"
     x5="Participacao com estande"
     x6="Lancamento"
     x7="Palestra"
     x8="Apresentacao"
     x9="Outros"
  end if
  if resposta=2 then
     x1="Divulgacao do Portifolio"
     x2="Apoio Instituicao"
     x3="Fortalecimento da Marca"
     x4="Acao de Relacionamento"
     x5="Apoio Social"
     x6="Explorar novas oportunidades"
     x7="Geracao de Receita"
     x8="Outros"
     x9="Erro"
  end if
  
  If InStr(CampoForm,"-1-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo_";"_x1
     else
        RespTipo=x1
     end if	  
  end if
  If InStr(CampoForm,"-2-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo_";"_x2
     else
        RespTipo=x2
     end if	  
  end if
  
  If InStr(CampoForm,"-3-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo_";"_x3
     else
        RespTipo=x3
     end if	  
  end if
  
  If InStr(CampoForm,"-4-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo_";"_x4
     else
        RespTipo=x4
     end if	  
  end if
  
  If InStr(CampoForm,"-5-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo_";"_x5
     else
        RespTipo=x5
     end if	  
  end if
  
  If InStr(CampoForm,"-6-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo_";"_x6
     else
        RespTipo=x6
     end if	  
  end if
  
  If InStr(CampoForm,"-7-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo_";"_x7
     else
        RespTipo=x7
     end if	  
  end if
  
  If InStr(CampoForm,"-8-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo_";"_x8
     else
        RespTipo=x8
     end if	  
  end if
  
  If InStr(CampoForm,"-9-") > 0 then   
     if RespTipo<>"" then
        RespTipo=RespTipo_";"_x9
     else
        RespTipo=x9
     end if	  
  end if
  Responsta=RespTipo
  Return Resposta  
End Function
%>