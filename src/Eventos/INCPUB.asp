  <textarea  name="EstimaPublico" rows="2" cols="113" wrap="virtual" tabindex="118"   onBlur="PUBLI()" style="position:absolute;z-index:2006;left:6px;top:5px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=ESTIMAPUBLICO%></textarea>
<script language="javascript">
function PUBLI()
 {
  if (document.CadEventos.EstimaPublico.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");   
	document.CadEventos.EstimaPublico.focus();            
    }
 }
</script>


