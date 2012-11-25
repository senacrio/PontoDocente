  <textarea  name="Participante" rows="2" cols="113" wrap="virtual" tabindex="24" onBlur="PART();" style="position:absolute;z-index:2006;left:4px;top:5px;width:587px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=WParticipante%></textarea>

<script language="javascript">
function PART()
 {
  if (document.CadEspaco.Participante.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");               
    document.CadEspaco.Participante.focus()
    }
 }
</script>