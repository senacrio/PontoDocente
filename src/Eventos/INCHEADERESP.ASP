
<select name="Unidade" tabindex="1" 
style="position:absolute;z-index:216;left:125px;top:15px;width:461px;height:22px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;">
<% 
UnidadeResp.movefirst
While (NOT UnidadeResp.EOF)
%>
  <option value="<%=(UnidadeResp.Fields.Item("IDUNIDADE").Value)%>"
			  <%if cstr(UnidadeResp.Fields.Item("IDUNIDADE").Value) = wUnidade then%> selected >
  <%else%>
>
  <%end if%>
  <%=(UnidadeResp.Fields.Item("NOMEUNIDADE").Value)%></option>
  <%
  UnidadeResp.MoveNext()
Wend
If (UnidadeResp.CursorType > 0) Then
  UnidadeResp.MoveFirst
Else
  UnidadeResp.Requery
End If
%>
</select>
<div id="WFDObj81" style="position:absolute;z-index:81;left:16px;top:126px;width:82px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> 
  Nome do Evento:</div>
  
<div id="WFDObj82" style="position:absolute;z-index:82;left:17px;top:152px;width:29px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> Data:</div>
<div id="WFDObj82" style="position:absolute;z-index:82;left:75px;top:152px;width:22px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> M&ecirc;s:</div>
<div id="WFDObj82" style="position:absolute;z-index:82;left:75px;top:175px;width:23px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> Ano:</div>
<div id="WFDObj82" style="position:absolute;z-index:82;left:16px;top:200px;width:29px;height:15px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> Horário:</div>
<div id="responsavel" style="position:absolute;z-index:82;left:16px;top:45px;width:29px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;">Responsável:</div>
<div id="locatario" style="position:absolute;z-index:82;left:15px;top:74px;width:29px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;">Locat&aacute;rio::</div>
<div id="Telefones" style="position:absolute;z-index:82;left:15px;top:99px;width:29px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;">Telefones::</div>
<div id="WFDObj155" style="position:absolute;z-index:155;left:15px;top:20px;width:106px;height:14px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> 
  Unidade Locadora:</div>

<input name="Horario" type="text" style="position:absolute;z-index:80;left:125px;top:197px;width:462px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="9" value="<%=wHorario%>" size="40" maxlength="200">

<input name="Responsavel" type="text" style="position:absolute;z-index:80;left:125px;top:44px;width:462px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="2" value="<%=wResponsavel%>" size="40" maxlength="200">
  
<input name="Locatario" type="text" style="position:absolute;z-index:80;left:125px;top:70px;width:462px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="3" value="<%=wLocatario%>" size="40" maxlength="200">

<input name="Telefone" type="text" style="position:absolute;z-index:80;left:125px;top:97px;width:462px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="4" value="<%=wTelefone%>" size="40" maxlength="200">
<input type="text" name="nomeevento" value="<%=wnomeevento%>" size="40" maxlength="200" tabindex="5" style="position:absolute;z-index:79;left:125px;top:123px;width:463px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;">
<select name="Mes" size="1" 
style="position:absolute;z-index:216;left:124px;top:148px;width:48px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="6">

<option value="1" 
<%if wmes=1 then%> selected
<%end if%>
>1

<option value="2"
<%if wmes=2 then%> selected
<%end if%>
>2

<option value="3"
<%if wmes=3 then%> selected
<%end if%>
>3

<option value="4"
<%if wmes=4 then%> selected
<%end if%>
>4

<option value="5"
<%if wmes=5 then%> selected
<%end if%>
>5

<option value="6"
<%if wmes=6 then%> selected
<%end if%>
>6

<option value="7"
<%if wmes=7 then%> selected
<%end if%>
>7

<option value="8"
<%if wmes=8 then%> selected
<%end if%>
>8

<option value="9"
<%if wmes=9 then%> selected
<%end if%>
>9

<option value="10"
<%if wmes=10 then%> selected
<%end if%>
>10

<option value="11"
<%if wmes=11 then%> selected
<%end if%>
>11

<option value="12"
<%if wmes=12 then%> selected
<%end if%>
>12

</select>
<select name="Ano" size="1" style="position:absolute;z-index:216;left:125px;top:173px;width:48px;height:19px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="7">
  <option value="2008"
  <%if wano=2008 then%> selected
  <%end if%>
  >2008
  <option value="2009"
  <%if wano=2009 then%> selected
  <%end if%>
  >2009
  <option value="2010"
  <%if wano=2010 then%> selected
  <%end if%>
  >2010
  <option value="2011"
  <%if wano=2011 then%> selected
  <%end if%>
  >2011
  <option value="2012"
  <%if wano=2012 then%> selected
  <%end if%>
  >2012
  <option value="2013"
  <%if wano=2013 then%> selected
  <%end if%>
  >2013
</select>

<textarea  name="Data" rows="2" cols="113" wrap="virtual" tabindex="8"  onBlur="Data1()" style="position:absolute;z-index:2006;left:177px;top:149px;width:413px;height:42px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=wData%></textarea>

<script language="javascript">
function Data1()
 {
//  window.alert(document.CadEspaco.Data.value.length); 
  if (document.CadEspaco.Data.value.length>=800)
    {
	window.alert("Você não pode digitar mais que 800 caracteres!");               
    document.CadEspaco.Data.focus();
	return false;
	}
 }

</script>