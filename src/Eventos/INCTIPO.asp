  <div id="WFDObj86" style="position:absolute;z-index:89;left:513px;top:8px;width:37px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Desfile</div>
  
<input type="checkbox" name="OQUEE" value="9" tabindex="8" style="position:absolute; z-index:90; left:188px; top:48px; width: 17px; height: 14px;"
            <%If InStr(IdTipoEvento,"-9-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj88" style="position:absolute;z-index:91;left:208px;top:28px;width:63px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Lançamento</div>
  
<input type="checkbox" name="OQUEE" value="6" tabindex="9" style="position:absolute; z-index:92; left:188px; top:28px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-6-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj90" style="position:absolute;z-index:93;left:28px;top:28px;width:128px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Participação com estande</div>
  
<input type="checkbox" name="OQUEE" value="2" tabindex="10" style="position:absolute; z-index:94; left:188px; top:8px; width: 17px; height: 14px;"
 <%If InStr(IdTipoEvento,"-2-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj92" style="position:absolute;z-index:95;left:380px;top:28px;width:43px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Palestra</div>
  
<input type="checkbox" name="OQUEE" value="7" tabindex="11" style="position:absolute; z-index:96; left:360px; top:28px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-7-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj94" style="position:absolute;z-index:97;left:380px;top:8px;width:51px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Seminário</div>
  
<input type="checkbox" name="OQUEE" value="3" tabindex="12" style="position:absolute; z-index:98; left:360px; top:8px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-3-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj96" style="position:absolute;z-index:99;left:28px;top:48px;width:73px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Apresentacao</div>
  
<input type="checkbox" name="OQUEE" value="8" tabindex="13" style="position:absolute; z-index:100; left:8px; top:48px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-8-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<input name="OQUEE" type="Checkbox" style="position:absolute; z-index:76; left:8px; top:8px; width: 17px; height: 14px;" tabindex="5" value="1"
   <%If InStr(IdTipoEvento,"-1-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<input type="checkbox" name="OQUEE" value="5" tabindex="6" style="position:absolute; z-index:77; left:8px; top:28px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-5-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj75" style="position:absolute;z-index:78;left:28px;top:8px;width:28px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Feira</div>
  
<div id="WFDObj76" style="position:absolute;z-index:79;left:208px;top:8px;width:57px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Congresso</div>
  
<div id="WFDObj77" style="position:absolute;z-index:80;left:208px;top:48px;width:37px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Outros:</div>
  
<input type="checkbox" name="OQUEE" value="4" tabindex="7" style="position:absolute; z-index:81; left:493px; top:8px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-4-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<input type="text" name="OutrosEvento" value="<%=TipoEventoOU%>" onBlur="OE();"  size="40" maxlength="200" tabindex="21" style="position:absolute;z-index:115;left:254px;top:45px;width:328px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;">

<script language="javascript">
function OE()
 {
  if (document.CadEventos.OutrosEvento.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");
	document.CadEventos.OutrosEvento.focus();   	               
    }
 }
</script>
