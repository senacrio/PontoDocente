 <textarea  name="Patrocinio" rows="2" cols="113" wrap="virtual" tabindex="90" onBlur="Patrociniox();" style="position:absolute;z-index:2006;left:7px;top:7px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=wPatrocinio%></textarea>

<script language="javascript">
function Patrociniox()
 {
  if (document.CadEventos.Patrocinio.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");               
    document.CadEventos.Patrocinio.focus()
    }
 }
</script>