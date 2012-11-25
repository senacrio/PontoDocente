<textarea  name="Parceito" rows="2" cols="113" wrap="virtual" tabindex="152"  onBlur="PP1()" style="position:absolute;z-index:2006;left:4px;top:6px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=PARCPATRO%></textarea>
<script language="javascript">
function PP1()
 {
  if (document.CadEventos.Parceito.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");     
	document.CadEventos.Parceito.focus();          
    }
 }
</script>
