            <input type="checkbox" name="PF" value="1" tabindex="94" style="position:absolute; z-index:2006; left:8px; top:8px; width: 17px; height: 15px;"
            <%If InStr(IdPF,"-1-") > 0 then %>checked>
            <%ELSE%>
            >
            <%End if%>
          
<div id="WFDObj178" style="position:absolute;z-index:2006;left:28px;top:8px;width:52px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Estudante</div>
          
<input type="checkbox" name="PF" value="2" tabindex="95" style="position:absolute; z-index:2006; left:175px; top:8px; width: 17px; height: 14px;"
            <%If InStr(IdPF,"-2-") > 0 then %>checked>
           <%ELSE%>>
          <%End if%>
          
<input type="checkbox" name="PF" value="4" tabindex="97" style="position:absolute; z-index:2006; left:8px; top:28px; width: 17; height: 14px;"
           <%If InStr(IdPF,"-4-") > 0 then %>checked>
          <%ELSE%>
>
          <%End if%>
          
<div id="WFDObj181" style="position:absolute;z-index:2006;left:28px;top:28px;width:95px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Profissional Liberal</div>
          
<div id="WFDObj182" style="position:absolute;z-index:2006;left:195px;top:8px;width:74px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Empreendedor</div>
          
<input type="checkbox" name="PF" value="5" tabindex="98" style="position:absolute; z-index:2006; left:175px; top:28px; width: 17px; height: 14px;"
            <%If InStr(IdPF,"-5-") > 0 then %>checked>
          <%ELSE%>
>
          <%End if%>
          
<input type="checkbox" name="PF" value="3" tabindex="96" style="position:absolute; z-index:2006; left:334px; top:8px; width: 17px; height: 14px;"
            <%If InStr(IdPF,"-3-") > 0 then %>checked>

          <%ELSE%>
>
          <%End if%>
          
<div id="WFDObj186" style="position:absolute;z-index:2006;left:354px;top:8px;width:86px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  CLT / Temporário</div>
<div id="WFDObj186" style="position:absolute;z-index:2006;left:195px;top:28px;width:42px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Outros 
</div>
          
<div id="WFDObj176" style="position:absolute;z-index:2006;left:35px;top:50px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Quais?</div>
          
<input type="text" name="PFQual" value="<%=PFOutro%>" size="99" onBlur="PF1();"maxlength="800" tabindex="56" style="position:absolute;z-index:2006;left:72px;top:50px;width:510px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;">

<script language="javascript">
function PF1()
 {
  if (document.CadEventos.PFQual.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");    
	document.CadEventos.PFQual.focus();   	
    }
 }
</script>