  <div id="WFDObj98" style="position:absolute;z-index:2006;left:380px;top:28px;width:149px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Explorar novas oportunidades</div>
  
<input type="checkbox" name="Objetivo" value="6" tabindex="14" style="position:absolute; z-index:2006; left:360px; top:28px; width: 17px; height: 14px;"
<%If InStr(IdObjetivo,"-6-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj100" style="position:absolute;z-index:2006;left:26px;top:48px;width:97px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Geração de receita</div>
  
<input type="checkbox" name="Objetivo" value="7" tabindex="15" style="position:absolute; z-index:2006; left:8px; top:48px; width: 17px; height: 14px;"
<%If InStr(IdObjetivo,"-7-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj102" style="position:absolute;z-index:2006;left:380px;top:8px;width:122px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Fortalecimento da marca</div>
  
<input type="checkbox" name="Objetivo" value="3" tabindex="16" style="position:absolute; z-index:2006; left:360px; top:8px; width: 17px; height: 14px;"
<%If InStr(IdObjetivo,"-3-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj104" style="position:absolute;z-index:2006;left:207px;top:28px;width:64px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Apoio Social</div>
  
<input type="checkbox" name="Objetivo" value="5" tabindex="17" style="position:absolute; z-index:2006; left:187px; top:28px; width: 17px; height: 14px;"
<%If InStr(IdObjetivo,"-5-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj106" style="position:absolute;z-index:2006;left:207px;top:8px;width:83px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Apoio Instituição</div>
  
<input type="checkbox" name="Objetivo" value="2" tabindex="18" style="position:absolute; z-index:2006; left:187px; top:8px; width: 17px; height: 14px;"
<%If InStr(IdObjetivo,"-2-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj108" style="position:absolute;z-index:2006;left:28px;top:28px;width:121px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Ação de relacionamento</div>
  
<input type="checkbox" name="Objetivo" value="1" tabindex="19" style="position:absolute; z-index:2006; left:8px; top:8px; width: 17px; height: 14px;"
<%If InStr(IdObjetivo,"-1-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<input type="checkbox" name="Objetivo" value="4" tabindex="20" style="position:absolute; z-index:2006; left:8px; top:28px; width: 17px; height: 14px;"
<%If InStr(IdObjetivo,"-4-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj111" style="position:absolute;z-index:2006;left:28px;top:8px;width:116px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Divulgação do portifólio</div>
  
<div id="WFDObj115" style="position:absolute;z-index:2006;left:207px;top:48px;width:37px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Outros</div>
  
<input type="checkbox" name="Objetivo" value="8" tabindex="23" style="position:absolute; z-index:2006; left:187px; top:48px; width: 17px; height: 14px;"
<%If InStr(IdObjetivo,"-8-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>

<script language="javascript">
function OO()
 {
  if (document.CadEventos.OutrosObjetivo.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");               
    }
 }
</script>
