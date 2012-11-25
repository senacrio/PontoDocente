<textarea  name="Receita" rows="2" cols="113" wrap="virtual" onBlur="Receitax();" tabindex="75" style="position:absolute;z-index:2006;left:6px;top:5px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=Receita%></textarea>

<script language="javascript">

function Receitax()
  { 
  if (document.CadEventos.Receita.value.length>=800)
     {
    window.alert("Você não pode digitar mais que 800 caracteres!");               
	document.CadEventos.Receita.focus();   
    }
 }
</script>