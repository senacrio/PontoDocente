<textarea  name="Valor" rows="2" cols="113" onBlur="VC();" wrap="virtual" tabindex="100"  title="" style="position:absolute;z-index:2006;left:6px;top:5px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=wValor%></textarea>

<script language="javascript">
function VC()
 {
  if (document.CadEspaco.Valor.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");               
    document.CadEspaco.Valor.focus();
	}
 }
</script>