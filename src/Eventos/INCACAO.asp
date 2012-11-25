<input type="checkbox" name="Acao" value="2" tabindex="61" style="position:absolute; z-index:2006; left:187px; top:8px; width: 17px; height: 14px;"
<%If InStr(IdAcao,"-2-") > 0 then %>checked>
<%ELSE%>>
<%End if%>
<div id="outros" style="position:absolute;z-index:2006;left:384px;top:26px;width:37px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Outros</div>
<input type="checkbox" name="Acao" value="6" tabindex="65" style="position:absolute; z-index:2006; left:360px; top:28px; width: 17px; height: 14px;"
<%If InStr(IdAcao,"-6-") > 0 then %>checked>
<%ELSE%>>
<%End if%>
 
<div id="consultoria" style="position:absolute;z-index:2006;left:384px;top:8px;width:58px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Consultoria</div>
 
<input type="checkbox" name="Acao" value="3" tabindex="62" style="position:absolute; z-index:2006; left:360px; top:8px; width: 17px; height: 14px;"
<%If InStr(IdAcao,"-3-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<div id="WFDObj162" style="position:absolute;z-index:2006;left:207px;top:8px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Oficina</div>
  
<div id="WFDObj163" style="position:absolute;z-index:2006;left:207px;top:28px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Debate</div>
  
<input type="checkbox" name="Acao" value="5" tabindex="64" style="position:absolute; z-index:2006; left:187px; top:28px; width: 17px; height: 14px;"
<%If InStr(IdAcao,"-5-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<div id="WFDObj166" style="position:absolute;z-index:2006;left:28px;top:8px;width:32px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Quizz</div>
  
<input type="checkbox" name="Acao" value="4" tabindex="63" style="position:absolute; z-index:2006; left:8px; top:28px; width: 17px; height: 14px;"
<%If InStr(IdAcao,"-4-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<input type="checkbox" name="Acao" value="1" tabindex="60" style="position:absolute; z-index:2006; left:8px; top:8px; width: 17px; height: 14px;"
<%If InStr(IdAcao,"-1-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<div id="WFDObj169" style="position:absolute;z-index:2006;left:28px;top:28px;width:62px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Degustação</div>
  
<div id="WFDObj171" style="position:absolute;z-index:2006;left:28px;top:55px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Quais?</div>
  
<textarea name="AcaoQual" cols="40" onBlur="AC();" style="position:absolute;z-index:2006;left:67px;top:46px;width:515px;height:34px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="66"><%=AcaoQual%></textarea> 

<script language="javascript">
function AC()
 {
  if (document.CadEventos.AcaoQual.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");   
	document.CadEventos.AcaoQual.focus();            
    }
 }
</script>