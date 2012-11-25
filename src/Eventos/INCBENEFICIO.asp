  <textarea  name="Beneficio" rows="2" cols="113" wrap="virtual" tabindex="22" onBlur="BEN();" style="position:absolute;z-index:2006;left:4px;top:6px;width:585px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=WBENEFICIO%></textarea>

<script language="javascript">
function BEN()
 {
  if (document.CadEspaco.Beneficio.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!"); 
	document.CadEspaco.Beneficio.focus()              
    }
 }
</script>