  <textarea  name="Material" rows="2" cols="113" wrap="virtual" tabindex="138" onBlur="MATER()" style="position:absolute;z-index:2006;left:5px;top:7px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=MATERIAL%></textarea>
<script language="javascript">
function MATER()
 {
  if (document.CadEventos.Material.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");           
	document.CadEventos.Material.focus();    
    }
 }
</script>

