 <textarea  name="Imprensa" rows="2" cols="113" wrap="virtual" tabindex="90" onBlur="ImprensaX();" style="position:absolute;z-index:2006;left:7px;top:7px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=wImprensa%></textarea>

<script language="javascript">

function ImprensaX()
 {
  if (document.CadEventos.Imprensa.value.length>=800)
    {
    window.alert("Voc� n�o pode digitar mais que 800 caracteres!");               
    document.CadEventos.Imprensa.focus();
    }
 }
</script>