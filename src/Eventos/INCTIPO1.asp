<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
  <div id="WFDObj86" style="position:absolute;z-index:89;left:509px;top:7px;width:37px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Desfile</div>
  
<input type="checkbox" name="OQUEE" value="9" tabindex="18" style="position:absolute; z-index:90; left:8px; top:49px; width: 17px; height: 14px;"
            <%If InStr(IdTipoEvento,"-9-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj88" style="position:absolute;z-index:91;left:208px;top:28px;width:63px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Lançamento</div>
  
<input type="checkbox" name="OQUEE" value="6" tabindex="15" style="position:absolute; z-index:92; left:188px; top:28px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-6-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj90" style="position:absolute;z-index:93;left:28px;top:28px;width:128px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Participação com estande</div>
  
<input type="checkbox" name="OQUEE" value="2" tabindex="11" style="position:absolute; z-index:94; left:188px; top:8px; width: 17px; height: 14px;"
 <%If InStr(IdTipoEvento,"-2-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj92" style="position:absolute;z-index:95;left:377px;top:28px;width:43px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Palestra</div>
  
<input type="checkbox" name="OQUEE" value="7" tabindex="16" style="position:absolute; z-index:96; left:357px; top:28px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-7-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj94" style="position:absolute;z-index:97;left:377px;top:8px;width:51px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Seminário</div>
  
<input type="checkbox" name="OQUEE" value="3" tabindex="12" style="position:absolute; z-index:98; left:357px; top:8px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-3-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj96" style="position:absolute;z-index:99;left:508px;top:28px;width:65px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Apresenta&ccedil;&atilde;o</div>
  
<input type="checkbox" name="OQUEE" value="8" tabindex="17" style="position:absolute; z-index:100; left:486px; top:29px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-8-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<input name="OQUEE" type="Checkbox" style="position:absolute; z-index:76; left:8px; top:8px; width: 17px; height: 14px;" tabindex="10" value="1"
   <%If InStr(IdTipoEvento,"-1-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<input type="checkbox" name="OQUEE" value="5" tabindex="14" style="position:absolute; z-index:77; left:8px; top:28px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-5-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
<div id="WFDObj75" style="position:absolute;z-index:78;left:28px;top:8px;width:28px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Feira</div>
  
<div id="WFDObj76" style="position:absolute;z-index:79;left:208px;top:8px;width:57px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Congresso</div>
  
<div id="WFDObj77" style="position:absolute;z-index:80;left:29px;top:50px;width:37px;height:14px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Outros:</div>
  
<input type="checkbox" name="OQUEE" value="4" tabindex="13" style="position:absolute; z-index:81; left:486px; top:9px; width: 17px; height: 14px;"
   <%If InStr(IdTipoEvento,"-4-") > 0 then %>checked>
  <%ELSE%>
>
  <%End if%>
  
  <textarea name="OutrosEvento" cols="40" style="position:absolute;z-index:115;left:77px;top:48px;width:505px;height:34px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="19" onBlur="OE()"><%=TipoEventoOU%></textarea>

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

