          <div id="WFDObj63" style="position:absolute;z-index:2006;left:107px;top:97px;width:21px;height:12px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Sim</div>
          
<div id="WFDObj172" style="position:absolute;z-index:2006;left:214px;top:96px;width:23px;height:12px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Não</div>
		  
<div id="Ralizador" style="position:absolute;z-index:2006;left:13px;top:28px;width:54px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Realizador</div>

<div id="UP" style="position:absolute;z-index:2006;left:10px;top:59px;width:54px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">
  <div align="center">Unidade Participante</div>
</div>

<div id="Fecormercio" style="position:absolute;z-index:2006;left:11px;top:95px;width:54px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Fecomércio</div>

<div id="OBS" style="position:absolute;z-index:2006;left:38px;top:125px;width:27px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Obs:</div>

<input type="radio" name="GFec" value="2" tabindex="163" style="position:absolute; z-index:2006; left:185px; top:97px; width: 17px; height: 14px;"
<%if GFec=2 then%>checked>
          <%ELSE%>
>
          <%End if%>
          
<input type="radio" name="GFec" value="1" tabindex="162" style="position:absolute; z-index:2006; left:78px; top:98px; width: 17px; height: 14px;"
<%if GFec=1 then%>checked>
          <%ELSE%>
>
          <%End if%>
          
<textarea name="Realizador" cols="40" style="position:absolute;z-index:2006;left:75px;top:17px;width:506px;height:34px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="160" onBlur="Real();"><%=Realizador%></textarea>

<textarea name="UP" cols="40" style="position:absolute;z-index:2006;left:75px;top:58px;width:506px;height:33px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="161" onBlur="UPx();"><%=UP%></textarea>

<textarea name="FecObs" cols="40" style="position:absolute;z-index:2006;left:75px;top:113px;width:506px;height:44px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="164








































































" onBlur="FecObsx();"><%=FecObs%></textarea>

<script language="javascript">
function Real()
 {
  if (document.CadEventos.Realizador.value.length>=800)
    {
    window.alert("Você não pode digitar mais que 800 caracteres!");     
	document.CadEventos.Realizador.focus();          
    }
 }

function UPx()
 {
  if (document.CadEventos.UP.value.length>=800)
    {
    window.alert("Você nÃO pode digitar mais que 800 caracteres!");               
	document.CadEventos.UP.focus();
    }
 }

function FecObsx()
 {
  if (document.CadEventos.FecObs.value.length>=800)
    {
    window.alert("Você nÃO pode digitar mais que 800 caracteres!");               
	document.CadEventos.FecObs.focus();
    }
 }
</script>
<div id="Layer1" style="position:absolute; width:589px; height:10px; background-color:#FFFFFF; layer-background-color:#FFFFFF; border:1px none #000000; z-index:2007; left: 0px; top: -1px;">
  <div align="left"> <font size="1" face="Times New Roman, Times, serif"><strong>** INFORMA&Ccedil;&Otilde;ES
  COMPLEMENTARES</strong></font></div>
</div>
