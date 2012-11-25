<textarea name="Patrocina" cols="40" style="position:absolute; z-index:2006; left:6px; top:6px; width:578px; height:42px; font-size:8pt; font-family:Arial; font-weight:normal; font-style:normal; color:#000000; background-color:#FFFFFF;" tabindex="148" onBlur="FFPatr();"><%=Patrocina%></textarea>

<script language="javascript">
function FFPatr()
 {
  if (document.CadEventos.Patrocina.value.length>=800)
    {
	window.alert("Você não pode digitar mais que 800 caracteres!");     
    document.CadEventos.Patrocina.focus();          
    }
 }
</script>