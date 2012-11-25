 <textarea  name="material" rows="2" cols="113" wrap="virtual"  onBlur="MAT1()" tabindex="89" style="position:absolute;z-index:2006;left:5px;top:7px;width:577px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=MATERIAL%></textarea>
<script language="javascript">
function MAT1()
 {
  if (document.CadEventos.material.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");               
    }
 }
</script>
