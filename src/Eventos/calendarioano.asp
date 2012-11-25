<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<html>
<head>
<META NAME="ROBOTS" CONTENT="INDEX,NOFOLLOW">
<meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
<script language="javascript">
<!--

function ChangeBox() {
for (var i = 0; i < document.fmNextPrev.typ.length; i++) {
if (document.fmNextPrev.typ.options[i].selected == true) {
	document.location.href = "diary_viewC.asp?view_date=&cat="+document.fmNextPrev.typ[i].value;
}
}
return null
}

//-->
</script>
<link rel="stylesheet" type="text/css" href="diary.css">
</head>
<body>
<form name="fmNextPrev" action="default.asp?cat=all" method="post">
<table cellpadding="3" cellspacing="1" width="95%" border="0" align="center">
	<tr valign="middle">
		<td>&nbsp;</td>
		<td colspan="6" align="right">Selecione a categoria do Evento 
<select name="typ" onchange="javascript:ChangeBox();" id="Select1"><option value=1>Select...</option><option value='720'>Amateur Nite</option>
<option value='739'>Available</option>
<option value='724'>Employee of the Month</option>
<option value='718'>Examination</option>
<option value='740'>Fixtues</option>
<option value='714'>Holidays</option>
<option value='742'>Internal Audit</option>
<option value='732'>Jonn's Class</option>
<option value='723'>jsf was here</option>
<option value='725'>kumakato</option>
<option value='735'>Lecture Room 1</option>
<option value='734'>Meeting Room 1</option>
<option value='731'>No Background Co</option>
<option value='736'>Raid</option>
<option value='733'>Room234</option>
<option value='712'>Sündmused</option>
<option value='743'>test26</option>
<option value='730'>Testing</option>
</select></td>
	</tr>
</table>
<table cellpadding="3" cellspacing="1" width="95%" border="0" class="maintble" align="center">
  <tr valign="middle" align="center">
    <td colspan="7" class="Item">
      <table cellpadding="0" cellspacing="0" width="100%" border="0">
        <tr valign="middle" align="center">
          <td width="30%" align="right">
            <input type="image" name="subPrev" src="images/Left.gif" width="18" height="20">
          </td>
          <td width="40%" class="heading2"> Ano 2008 </td>
          <td width="30%" align="LEFT">
            <input type="image" name="subNext" src="images/Right.gif" width="18" height="20">
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr valign="top">
    <!-- Start Day of the calendar can be change here  -->
    <td width="14%" class="titlebar">Janeiro</td>
    <td width="14%" class="titlebar">Fevereiro</td>
    <td width="14%" class="titlebar">Mar&ccedil;o</td>
    <td width="14%" class="titlebar">Abril</td>
    <td width="14%" class="titlebar">Maio</td>
    <td width="14%" class="titlebar">Junho</td>
    <td width="14%" class="titlebar">Julho</td>
    <td width="14%" class="titlebar">Agosto</td>
    <td width="14%" class="titlebar">Setembro</td>
    <td width="14%" class="titlebar">Outubro</td>
    <td width="14%" class="titlebar">Novembro</td>
    <td width="14%" class="titlebar">Dezembro</td>
  </tr>
  <tr valign=top>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'>1<br>
        <br>
    </td>
    <td height=50 class='cell'>2<br>
        <br>
    </td>
    <td height=50 class='cell'>3<br>
        <br>
    </td>
  </tr>
  <tr valign=top>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'></td>
    <td height=50 class='cell'></td>
  </tr>
</table>
<div align="center">
<select name="CURDATE_month">
<option value='January'>January</option>
<option value='February'>February</option>
<option value='March'>March</option>
<option value='April'>April</option>
<option value='May' Selected>May</option>
<option value='June'>June</option>
<option value='July'>July</option>
<option value='August'>August</option>
<option value='September'>September</option>
<option value='October'>October</option>
<option value='November'>November</option>
<option value='December'>December</option>

</select>
<input type="hidden" Name="CURDATE" Value="5/1/2008">
<input type=submit value="Envia" name="subGO">
</form>
</font>
</center>
	<!-- This footer is required by the license terms,  removing it is illegal! --><br />
</body>
</html>