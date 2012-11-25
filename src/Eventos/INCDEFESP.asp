<input type="checkbox" name="Definicao" value="2" tabindex="46" style="position:absolute; z-index:2006; left:187px; top:8px; width: 17px; height: 14px;"
<%If InStr(wDefinicao,"-2-") > 0 then %>checked>
<%ELSE%>>
<%End if%>
<div id="outros" style="position:absolute;z-index:2006;left:384px;top:27px;width:37px;height:15px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Apresenta&ccedil;&atilde;o</div>
<div id="outros" style="position:absolute;z-index:2006;left:384px;top:46px;width:37px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
 Outros</div>

<input type="checkbox" name="Definicao" value="6" tabindex="50" style="position:absolute; z-index:2006; left:360px; top:28px; width: 17px; height: 14px;"
<%If InStr(wDefinicao,"-6-") > 0 then %>checked>
<%ELSE%>>
<%End if%>
 
<input type="checkbox" name="Definicao" value="9" tabindex="53" style="position:absolute; z-index:2006; left:360px; top:47px; width: 17px; height: 14px;"
<%If InStr(wDefinicao,"-9-") > 0 then %>checked>
<%ELSE%>>
<%End if%>



<div id="consultoria" style="position:absolute;z-index:2006;left:384px;top:8px;width:58px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Debate</div>
 
<input type="checkbox" name="Definicao" value="3" tabindex="47" style="position:absolute; z-index:2006; left:360px; top:8px; width: 17px; height: 14px;"
<%If InStr(wDefinicao,"-3-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<div id="WFDObj162" style="position:absolute;z-index:2006;left:207px;top:8px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Palestra</div>
  
<div id="WFDObj163" style="position:absolute;z-index:2006;left:207px;top:28px;width:38px;height:15px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Lan&ccedil;amento</div>

<div id="yy" style="position:absolute;z-index:2006;left:207px;top:47px;width:38px;height:12px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Desfile</div>

  
<input type="checkbox" name="Definicao" value="5" tabindex="49" style="position:absolute; z-index:2006; left:187px; top:28px; width: 17px; height: 14px;"
<%If InStr(wDefinicao,"-5-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<input type="checkbox" name="Definicao" value="8" tabindex="52" style="position:absolute; z-index:2006; left:187px; top:47px; width: 17px; height: 14px;"
<%If InStr(wDefinicao,"-8-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>  
  
<div id="WFDObj166" style="position:absolute;z-index:2006;left:28px;top:8px;width:32px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">Treinamento</div>
<input type="checkbox" name="Definicao" value="4" tabindex="48" style="position:absolute; z-index:2006; left:8px; top:28px; width: 17px; height: 14px;"
<%If InStr(wDefinicao,"-4-") > 0 then %>checked>  
<%ELSE%>>
  <%End if%>
  
  <input type="checkbox" name="Definicao" value="7" tabindex="51" style="position:absolute; z-index:2006; left:8px; top:49px; width: 17px; height: 14px;"
<%If InStr(wDefinicao,"-7-") > 0 then %>checked>
<%ELSE%>>
  <%End if%>



<input type="checkbox" name="Definicao" value="1" tabindex="45" style="position:absolute; z-index:2006; left:8px; top:8px; width: 17px; height: 14px;"
<%If InStr(wDefinicao,"-1-") > 0 then %>checked>
  <%ELSE%>>
  <%End if%>
  
<div id="WFDObj169" style="position:absolute;z-index:2006;left:28px;top:28px;width:62px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> 
  Confraterniza&ccedil;&atilde;o</div>

<div id="xx" style="position:absolute;z-index:2006;left:28px;top:48px;width:62px;height:14px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000000;">  Semin&aacute;rio</div>
  
<div id="WFDObj210" style="position:absolute;z-index:2006;left:28px;top:73px;width:38px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#000040;"> Quais?</div>
<textarea name="DefinicaoQual" cols="40"  onBlur="DefinicaoX()" style="position:absolute;z-index:2006;left:70px;top:67px;width:509px;height:33px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;border-color:#000000;border-width:1px;border-style:solid" tabindex="54"><%=wDefinicaoQual%></textarea>

<script language="javascript">
function DefinicaoX()
 {
  if (document.CadEspaco.DefinicaoQual.value.length>=800)
    {
    window.alert("Você nÃO pode digitar mais que 800 caracteres!");               
    document.CadEspaco.DefinicaoQual.focus();
	}
 }
</script>