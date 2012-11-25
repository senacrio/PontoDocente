<%@LANGUAGE="VBSCRIPT"%>
<% wErro=request.QueryString("erro")%>
<% wDescErro=request.QueryString("Derro")%>
<% wContexto=request.QueryString("ECont")%>
<% wEnativo=request.QueryString("ENat")%>
<% wESource=request.QueryString("ESou")%>
<% wESql=request.QueryString("ESql")%>

<% 'response.write("============>")%>
<% 'response.write(wErro)%>
<% 'response.write("============>")%>
<% 'response.write(wDescErro)%>

<html>
<head>
<title>Erro no processamento</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
@import url("css/Style.css");
-->
</style>
<body bgcolor="#FFFFFF" background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center"><img src="images/BANNER1.gif" width="800" height="70">
  <br>
  <br>
</div>
<div align="center">
  <p> <strong><font color="#000099" size="5" face="Arial">J&aacute; existe o usu&aacute;rio
        com a sigla informada.</font></strong></p>
  <p><strong><font color="#000099" size="5" face="Arial">Opera&ccedil;&atilde;o desfeita!</font></strong></p>
  <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p><a href="cadusuario.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></p>
</div>
<p align="center"><font size="1"></font></p>
</body>
</html>
