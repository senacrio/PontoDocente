<input type="checkbox" name="Local" value="2" tabindex="61" style="position:absolute; z-index:2006; left:187px; top:8px; width: 17px; height: 14px;"
<%If InStr(wLocal,"-2-") > 0 then %>checked>
<%ELSE%>>
<%End if%>
 
<div id="WFDObj162" style="position:absolute;z-index:2006;left:207px;top:8px;width:256px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Ambientes de Aprendizagens convecionais</div>
  
<div id="WFDObj163" style="position:absolute;z-index:2006;left:207px;top:28px;width:363px;height:15px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Ambientes de Aprendizagens específico (laboratórios)</div>

<div id="yy" style="position:absolute;z-index:2006;left:207px;top:47px;width:38px;height:12px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Outros</div>
  
<input type="checkbox" name="Local" value="4" tabindex="63" style="position:absolute; z-index:2006; left:187px; top:28px; width: 17px; height: 14px;"
<%If InStr(wLocal,"-4-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<input type="checkbox" name="Local" value="6" tabindex="65" style="position:absolute; z-index:2006; left:187px; top:47px; width: 17px; height: 14px;"
<%If InStr(wLocal,"-6-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>  
  
<div id="WFDObj166" style="position:absolute;z-index:2006;left:28px;top:8px;width:32px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Auditório</div>

<input type="checkbox" name="Local" value="3" tabindex="62" style="position:absolute; z-index:2006; left:8px; top:28px; width: 17px; height: 14px;"
<%If InStr(WLocal,"-3-") > 0 then %>checked>  
<%ELSE%>>
<%End if%>
  
<input type="checkbox" name="Local" value="5" tabindex="64" style="position:absolute; z-index:2006; left:8px; top:49px; width: 17px; height: 14px;"
<%If InStr(wLocal,"-5-") > 0 then %>checked>
<%ELSE%>>
<%End if%>

<input type="checkbox" name="Local" value="1" tabindex="60" style="position:absolute; z-index:2006; left:8px; top:8px; width: 17px; height: 14px;"
<%If InStr(wLocal,"-1-") > 0 then %>checked>
<%ELSE%>>
<%End if%>
  
<div id="WFDObj169" style="position:absolute;z-index:2006;left:28px;top:28px;width:155px;height:12px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Espaço Térreo</div>

<div id="xx" style="position:absolute;z-index:2006;left:28px;top:48px;width:149px;height:14px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Praça de alimentação</div>
  
<div id="WFDObj210" style="position:absolute;z-index:2006;left:28px;top:73px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> Quais?</div>
<textarea name="LocalQual" cols="31"  onBlur="LocalX()" style="position:absolute;z-index:2006;left:70px;top:67px;width:509px;height:33px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;border-color:#000000;border-width:1px;border-style:solid" tabindex="66"><%=wLocalQual%></textarea>

<script language="javascript">
function LocalX()
    {
  if (document.CadEspaco.LocalQual.value.length>=800)
    {
    window.alert("Você nÃO pode digitar mais que 800 caracteres!");               
    document.CadEspaco.LocalQual.focus();
	}
 }
</script>