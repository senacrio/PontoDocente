<input type="checkbox" name="Equipamento" value="2" tabindex="81" style="position:absolute; z-index:2006; left:187px; top:8px; width: 17px; height: 14px;"
<%If InStr(wEquipamento,"-2-") > 0 then %>checked>
<%ELSE%>>
<%End if%>
<div id="outros" style="position:absolute;z-index:2006;left:384px;top:27px;width:37px;height:15px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">  Tel&atilde;o</div>
<div id="outros" style="position:absolute;z-index:2006;left:384px;top:46px;width:37px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
 Outros</div>

<input type="checkbox" name="Equipamento" value="6" tabindex="85" style="position:absolute; z-index:2006; left:360px; top:28px; width: 17px; height: 14px;"
<%If InStr(wEquipamento,"-6-") > 0 then %>checked>
<%ELSE%>>
<%End if%>
 
<input type="checkbox" name="Equipamento" value="9" tabindex="88" style="position:absolute; z-index:2006; left:360px; top:47px; width: 17px; height: 14px;"
<%If InStr(wEquipamento,"-9-") > 0 then %>checked>
<%ELSE%>>
<%End if%>

<div id="consultoria" style="position:absolute;z-index:2006;left:384px;top:8px;width:58px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  V&iacute;deo</div>
 
<input type="checkbox" name="Equipamento" value="3" tabindex="82" style="position:absolute; z-index:2006; left:360px; top:8px; width: 17px; height: 14px;"
<%If InStr(wEquipamento,"-3-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<div id="WFDObj162" style="position:absolute;z-index:2006;left:207px;top:9px;width:97px;height:13px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Flip Chart</div>
  
<div id="WFDObj163" style="position:absolute;z-index:2006;left:207px;top:28px;width:76px;height:15px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Som</div>

<div id="yy" style="position:absolute;z-index:2006;left:207px;top:47px;width:56px;height:12px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">NoteBool</div>
  
<input type="checkbox" name="Equipamento" value="5" tabindex="84" style="position:absolute; z-index:2006; left:187px; top:28px; width: 17px; height: 14px;"
<%If InStr(wEquipamento,"-5-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<input type="checkbox" name="Equipamento" value="8" tabindex="87" style="position:absolute; z-index:2006; left:187px; top:47px; width: 17px; height: 14px;"
<%If InStr(wEquipamento,"-8-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>  
  
<div id="WFDObj166" style="position:absolute;z-index:2006;left:28px;top:8px;width:32px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">TV</div>
<input type="checkbox" name="Equipamento" value="4" tabindex="83" style="position:absolute; z-index:2006; left:8px; top:28px; width: 17px; height: 14px;"
<%If InStr(wEquipamento,"-4-") > 0 then %>checked>  
<%ELSE%>>
  <%End if%>
  
  <input type="checkbox" name="Equipamento" value="7" tabindex="86" style="position:absolute; z-index:2006; left:8px; top:49px; width: 17px; height: 14px;"
<%If InStr(wEquipamento,"-7-") > 0 then %>checked>
<%ELSE%>>
  <%End if%>

<input type="checkbox" name="Equipamento" value="1" tabindex="80" style="position:absolute; z-index:2006; left:8px; top:8px; width: 17px; height: 14px;"
<%If InStr(wEquipamento,"-1-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<div id="WFDObj169" style="position:absolute;z-index:2006;left:28px;top:28px;width:62px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">  DataShow</div>

<div id="xx" style="position:absolute;z-index:2006;left:28px;top:48px;width:62px;height:14px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">  DVDE</div>
  
<div id="WFDObj210" style="position:absolute;z-index:2006;left:28px;top:73px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> Quais?</div>
<textarea name="EquipamentoQual" cols="40"  onBlur="Equipamentox()" style="position:absolute;z-index:2006;left:70px;top:67px;width:509px;height:33px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;border-color:#000000;border-width:1px;border-style:solid" tabindex="89"><%=wEquipamentoQual%></textarea>

<script language="javascript">
function Equipamentox()
 {
  if (document.CadEspaco.EquipamentoQual.value.length>=800)
    {
    window.alert("Você nÃO pode digitar mais que 800 caracteres!");               
    document.CadEspaco.EquipamentoQual.focus();
	}
 }
</script>