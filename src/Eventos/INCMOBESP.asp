<input type="checkbox" name="Mobilia" value="2" tabindex="91" style="position:absolute; z-index:2006; left:187px; top:8px; width: 17px; height: 14px;"
<%If InStr(wMobilia,"-2-") > 0 then %>checked>
<%ELSE%>>
<%End if%>
  
<div id="WFDObj162" style="position:absolute;z-index:2006;left:207px;top:8px;width:38px;height:9px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Mesas</div>
  
<div id="WFDObj163" style="position:absolute;z-index:2006;left:382px;top:9px;width:119px;height:13px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Cadeiras Universitárias</div>
   
<div id="WFDObj166" style="position:absolute;z-index:2006;left:28px;top:8px;width:32px;height:13px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Cadeiras</div>
  
<input type="checkbox" name="Mobilia" value="3" tabindex="92" style="position:absolute; z-index:2006; left:355px; top:8px; width: 17px; height: 14px;"
<%If InStr(wMobilia,"-3-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<input type="checkbox" name="Mobilia" value="1" tabindex="90" style="position:absolute; z-index:2006; left:8px; top:8px; width: 17px; height: 14px;"
<%If InStr(wMobilia,"-1-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
  <textarea  name="MobiliaDesc" rows="2" cols="403" wrap="virtual" tabindex="93" onBlur="MODESC()" style="position:absolute;z-index:2006;left:55px;top:30px;width:528px;height:39px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=WMobiliaDesc%></textarea>
<script language="javascript">
function MODESC()
 {
  if (document.CadEspaco.MobiliaDesc.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");           
	document.CadEspaco.MobiliaDesc.focus();    
    }
 }
</script>
<div id="WFDObj210" style="position:absolute;z-index:2006;left:11px;top:42px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> Quais?</div>

