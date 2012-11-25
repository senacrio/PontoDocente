  <textarea  name="FilmeFoto" rows="2" cols="113" wrap="virtual" tabindex="140" onBlur="FFOT();" style="position:absolute;z-index:2006;left:5px;top:5px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=FILMEFOTO%></textarea>

<script language="javascript">
function FFOT()
 {
  if (document.CadEventos.FilmeFoto.value.length>=800)
    {
	window.alert("Você não pode digitar mais que 800 caracteres!");     
    document.CadEventos.FilmeFoto.focus();          
    }
 }
</script>