  <textarea  name="Objetivo" rows="2" cols="113" wrap="virtual" tabindex="20" onBlur="OBJ();" style="position:absolute;z-index:2006;left:5px;top:5px;width:585px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=WOBJETIVO%></textarea>

<script language="javascript">
function OBJ()
 {
  if (document.CadEspaco.Objetivo.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");    
	document.CadEspaco.Objetivo.focus();           
    }
 }
</script>