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
  <p><font color="#000099" size="5" face="Arial"><strong> Falha no Processamento</strong></font> 
  </p>
    <p><font color="#990066">Processamento n&atilde;o foi completado</font></p>
    <p><font color="#990066">Relate o problema o suporte.</font></p>
</div><blockquote>
    <p align="justify"><font color="#0000FF" size="2" face="Courier" align="justify">Esta
        página interpreta
                  alguns erros que podem ser de script,de banco de dados ou outro
        n&atilde;o especificado. Aconselhamos sempre a gravar esta pagina, com estas
        informa&ccedil;&otilde;es em disco. Depois de salvar, repassar o arquivo com os erros
        ao suporte do sistema,
        para as
                  devidas
                  corre&ccedil;&otilde;es. Obrigado!<br>
    <br>
    </font><font color="#660000" size="2" face="Courier" align="justify">    <% If wErro <> 0 then %></font></p>
  </blockquote>
<p><font color="#000000" size="2" face="Courier"> &nbsp;
    <font color="#FF0000">Ocorreram Erros no Script:</font></font><font color="#FF0000"
size="2" face="Courier"><br>
&nbsp; Número
  do erro=<%=wErro%><br>
&nbsp; Decrição
  do erro=<%=wDescErro%><br>
&nbsp; Help
  Contexto=<%=wContexto%><br>
 &nbsp; Nativo
  Erro=<%=wEnativo%><br>
&nbsp; Origem=<%=ESource%><br>
&nbsp; SQL Estado=<%=ESql%><br>
<%end if%>
<br>
</font></p>
<p align="center"><img src="images/seta03.gif" width="33" height="33"></p>
<p align="center"><font size="1"></font></p>
</body>
</html>
