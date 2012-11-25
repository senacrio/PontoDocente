              <div id="MD" style="position:absolute;z-index:2006;left:28px;top:8px;width:57px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> 
  Mala Direta</div>
              
<div id="FOLHETO" style="position:absolute;z-index:2006;left:28px;top:28px;width:45px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> 
  Folhetos</div>
              
<div id="WFDObj18" style="position:absolute;z-index:2006;left:194px;top:8px;width:63px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> 
  Panfletagem</div>
              
<div id="WFDObj19" style="position:absolute;z-index:2006;left:193px;top:28px;width:46px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> 
  Catálogo</div>
              
<div id="WFDObj25" style="position:absolute;z-index:2006;left:332px;top:8px;width:81px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> 
  E-mail Marketing</div>
              
<div id="WFDObj201" style="position:absolute;z-index:2006;left:332px;top:28px;width:31px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> 
  Portal</div>
              
<div id="Ou" style="position:absolute;z-index:2006;left:332px;top:48px;width:37px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> 
  Outros</div>
              
<div id="Campanha" style="position:absolute;z-index:2006;left:193px;top:48px;width:55px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;">Campanha</div>
              
<div id="AP" style="position:absolute;z-index:2006;left:28px;top:48px;width:122px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;">Assessoria 
  de Imprensa</div>
              
<input type="checkbox" name="GDivulgacao" value="4" tabindex="128" style="position:absolute; z-index:2006; left:8px; top:28px; width: 17px; height: 14px;"
<%If InStr(GDIVULGACAO,"-4-") > 0 then %>checked>
              <%ELSE%>
>
            <%End if%>
            
<input type="checkbox" name="GDivulgacao" value="5" tabindex="129" style="position:absolute; z-index:2006; left:173px; top:28px; width: 17px; height: 14px;"
<%If InStr(GDIVULGACAO,"-5-") > 0 then %>checked>
            <%ELSE%>
>
            <%End if%>
            
<input type="checkbox" name="GDivulgacao" value="1" tabindex="125" style="position:absolute; z-index:2006; left:8px; top:8px; width: 17px; height: 14px;"
<%If InStr(GDIVULGACAO,"-1-") > 0 then %>checked>
            <%ELSE%>
>
            <%End if%>
            
<input type="checkbox" name="GDivulgacao" value="2" tabindex="126" style="position:absolute; z-index:2006; left:173px; top:8px; width: 17px; height: 14px;"
<%If InStr(GDIVULGACAO,"-2-") > 0 then %>checked>
            <%ELSE%>
>
            <%End if%>
            
<input type="checkbox" name="GDivulgacao" value="7" tabindex="131" style="position:absolute; z-index:2006; left:8px; top:48px; width: 17px; height: 14px;"
<%If InStr(GDIVULGACAO,"-7-") > 0 then %>checked>
            <%ELSE%>
>
            <%End if%>
            
<input type="checkbox" name="GDivulgacao" value="8" tabindex="132" style="position:absolute; z-index:2006; left:173px; top:48px; width: 17px; height: 14px;"
<%If InStr(GDIVULGACAO,"-8-") > 0 then %>checked >
            <%ELSE%>
>
            <%End if%>
            
<input type="checkbox" name="GDivulgacao" value="3" tabindex="127" style="position:absolute; z-index:2006; left:312px; top:8px; width: 17px; height: 14px;"
<%If InStr(GDIVULGACAO,"-3-") > 0 then %>checked>
            <%ELSE%>
>
            <%End if%>
            
<input type="checkbox" name="GDivulgacao" value="9" tabindex="133" style="position:absolute; z-index:2006; left:312px; top:48px; width: 17px; height: 14px;"
<%If InStr(GDIVULGACAO,"-9-") > 0 then %>checked>
            <%ELSE%>
>
            <%End if%>
            
<input type="checkbox" name="GDivulgacao" value="6" tabindex="130" style="position:absolute; z-index:2006; left:312px; top:28px; width: 17px; height: 14px;"
<%If InStr(GDIVULGACAO,"-8-") > 0 then %>checked>
            <%ELSE%>
>
            <%End if%>
            
            <textarea name="DivulgacaoQual" cols="40"  onBlur="Divulga()" style="position:absolute;z-index:2006;left:70px;top:67px;width:509px;height:33px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;border-color:#000000;border-width:1px;border-style:solid" tabindex="134"><%=DivulgaQual%></textarea>
           
<div id="WFDObj210" style="position:absolute;z-index:2006;left:28px;top:73px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> 
  Quais?</div>
           
<script language="javascript">
function Divulga()
 {
  if (document.CadEventos.DivulgacaoQual.value.length>=800)
    {
    window.alert("Você nÃO pode digitar mais que 800 caracteres!");       
	document.CadEventos.DivulgaQual.focus();        
    }
 }
</script>