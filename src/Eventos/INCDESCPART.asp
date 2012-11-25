<textarea  name="PartSenac" rows="2" cols="113" onBlur="PS();" wrap="virtual" tabindex="90"  title="" style="position:absolute;z-index:2006;left:6px;top:5px;width:577px;height:54px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=PartSenac%></textarea>

<script language="javascript">
function PS()
 {
  if (document.CadEventos.PartSenac.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");   
	document.CadEventos.PartSenac.focus();            
    }
 }
</script>