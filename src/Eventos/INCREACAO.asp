          <div id="WFDObj63" style="position:absolute;z-index:2006;left:28px;top:13px;width:21px;height:13px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Sim</div>
          
<div id="WFDObj172" style="position:absolute;z-index:2006;left:102px;top:13px;width:23px;height:14px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Não</div>
		  
<div id="WFDObj64" style="position:absolute;z-index:2006;left:133px;top:13px;width:33px;height:13px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Qual?</div>
          
<input type="radio" name="GAvaliacao" value="1" tabindex="120" style="position:absolute; z-index:2006; left:8px; top:13px; width: 17px; height: 14px;"
<%if GVenda=1 then%>checked>
          <%ELSE%>
>
          <%End if%>
          
<input type="radio" name="GAvaliacao" value="2" tabindex="121" style="position:absolute; z-index:2006; left:82px; top:14px; width: 17px; height: 14px;"
<%if GVenda=2 then%>checked>
          <%ELSE%>
>
          <%End if%>
          
          <textarea name="AvaliaQual" cols="40" onBlur="AVALIA()" style="position:absolute;z-index:2006;left:171px;top:6px;width:410px;height:30px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="122"><%=AvaliaQual%></textarea>
		  <script language="javascript">
function AVALIA()
 {
  if (document.CadEventos.AvaliaQual.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");           
	document.CadEventos.AvaliaQual.focus();    
    }
 }
</script>
