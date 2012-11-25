<textarea  name="ObjAtingido" rows="2" cols="113" onBlur="OBJATG();" wrap="virtual" tabindex="92"  title="" style="position:absolute;z-index:2006;left:6px;top:5px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=wObjAtingido%></textarea>

<script language="javascript">
function OBJATG()
 {
  if (document.CadEventos.ObjAtingido.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");   
	document.CadEventos.ObjAtingido.focus();            
    }
 }
</script>