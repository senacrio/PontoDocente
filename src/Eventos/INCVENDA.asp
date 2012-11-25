          <div id="WFDObj63" style="position:absolute;z-index:2006;left:28px;top:15px;width:21px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Sim</div>
          
<div id="WFDObj172" style="position:absolute;z-index:2006;left:102px;top:15px;width:23px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Não</div>
		  
<div id="WFDObj64" style="position:absolute;z-index:2006;left:136px;top:15px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Quais?</div>
          
<input type="radio" name="GVenda" value="1" tabindex="70" style="position:absolute; z-index:2006; left:8px; top:15px; width: 17px; height: 14px;"
<%if GVenda=1 then%>checked>
          <%ELSE%>
>
          <%End if%>
          
<input type="radio" name="GVenda" value="2" tabindex="71" style="position:absolute; z-index:2006; left:82px; top:15px; width: 17px; height: 14px;"
<%if GVenda=2 then%>checked>
          <%ELSE%>
>
          <%End if%>
          
          <textarea name="Venda" cols="40" style="position:absolute;z-index:2006;left:173px;top:6px;width:410px;height:34px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="72" onBlur="VE();"><%=Venda%></textarea>

<script language="javascript">
function VE()
 {
  if (document.CadEventos.Venda.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");   
	document.CadEventos.Venda.focus();            
    }
 }
</script>