<textarea  name="OBS" rows="2" cols="113" onBlur="OBSx();" wrap="virtual" tabindex="105"  title="" style="position:absolute;z-index:2006;left:6px;top:5px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=wOBS%></textarea>

<script language="javascript">
function OBSx()
 {
  if (document.CadEspaco.OBS.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");               
    document.CadEspaco.OBS.focus();
	}
 }
</script>