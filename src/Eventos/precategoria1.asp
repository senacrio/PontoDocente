<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%
Dim Categoria
Dim Categoria_numRows

Set Categoria = Server.CreateObject("ADODB.Recordset")
Categoria.ActiveConnection = MM_CXEVENTO_STRING
Categoria.Source = "SELECT *  FROM CATEGORIA WHERE STATUS='A'"
Categoria.CursorType = 0
Categoria.CursorLocation = 2
Categoria.LockType = 1
Categoria.Open()

Categoria_numRows = 0
%>
<html>
<head>
<title>Calend&aacute;rio Senac Rio</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
</head>

<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="calendariorel.asp">
  <div align="center"><img src="images/BANNER1.gif" width="800" height="70" align="absmiddle"><br>
    <br>
    <br>
  </div>
  <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="BordasLaterais">
    <tr>
      <td colspan="8" bgcolor="#0099FF"><div align="center"><font color="#FFFFFF" size="2" face="Times New Roman, Times, serif"><strong>CALEND&Aacute;RIO
              DE EVENTOS SENAC RIO</strong></font></div>
      </td>
    </tr>
    <tr>
      <td height="20">&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
      <td>&nbsp;</td>
      <td class="FormFont">&nbsp;</td>
      <td class="FormFont">&nbsp;</td>
    </tr>
    <tr>
      <td width="63"><div align="right" class="FormFont"><strong><font color="#0000CC">Categoria:</font><font color="#0000FF">&nbsp;&nbsp;</font></strong></div>
      </td>
      <td width="301"><select name="Categoria" size="1" class="formfont1">
          <%
While (NOT Categoria.EOF)
%>
          <option value="<%=(Categoria.Fields.Item("IDCATEGORIA").Value)%>"><%=(Categoria.Fields.Item("DESCCATEGORIA").Value)%></option>
          <%
  Categoria.MoveNext()
Wend
If (Categoria.CursorType > 0) Then
  Categoria.MoveFirst
Else
  Categoria.Requery
End If
%>
<option value="TODAS">TODAS</option>
<option value="SEM">SEM</option>
        </select>
      </td>
      <td width="55"><div align="right" class="FormFont"><strong><font color="#0000CC">Status:&nbsp;&nbsp;</font></strong></div>
      </td>
      <td width="99"><div align="center"><strong>
        <select name="status" class="formfont1">
          <option value="1" selected>CADASTRADO
          <option value="2">ANALISADO
          <option value="3">AVALIADO
          <option value="4">INCOMPLETO
          <option value="TODOS">TODOS
          </select>
      </strong></div></td>
      <td width="46"><div align="right" class="FormFont"><strong>          <font color="#0000CC">Ano:&nbsp;&nbsp;</font></strong></div>
      </td>
      <td width="80"><label class="formfont">
        <select name="Ano" class="formfont1">
          <option value="2008" selected>2008</option>
          <option value="2009">2009</option>
          <option value="2010">2010</option>
          <option value="2011">2011</option>
          <option value="2012">2012</option>
          <option value="2013">2013</option>
        </select>
        </label>
      </td>
      <td width="34" class="FormFont"><strong><font color="#0000CC">Excel:</font><font color="#0000FF">&nbsp;&nbsp;</font></strong></td>
      <td width="114" class="FormFont"><div align="left"></div>
          <div align="left">
            <label>
            <select name="excel" class="formfont1">
              <option value="S">SIM</option>
              <option value="N" selected>N&Atilde;O</option>
            </select>
            </label>
          </div>
      </td>
    </tr>
    <tr>
      <td height="19">&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td height="24" colspan="8"><div align="center">
        <input type="submit" name="Submit" value="Enviar pedido">
      </div></td>
    </tr>
  </table>
  <div align="center"><br>
    <br>
    <br>  
    <a href="MENUGE.ASP"><img src="images/seta03.gif" width="33" height="33" border="0"></a>
      <label></label>
  </div>
</form>
</body>
</html>
<%
Categoria.Close()
Set Categoria = Nothing
%>
