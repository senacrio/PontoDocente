<textarea  name="NovoProduto" rows="2" cols="113" wrap="virtual" tabindex="90" onBlur="NPROO();" style="position:absolute;z-index:2006;left:5px;top:5px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=wNOVOPRODUTO%></textarea>

<script language="javascript">
function NPROO()
 {
  if (document.CadEventos.NovoProduto.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");               
    document.CadEventos.NovoProduto.focus();
    }
 }
</script>