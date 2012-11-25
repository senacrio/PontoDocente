<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server" />
    <title>BSC Senac Rio</title>
    
    <link rel="stylesheet" type="text/css" href="ajaxtabs\ajaxtabs.css" />

    <script type="text/javascript" src="ajaxtabs\ajaxtabs.js"></script>
</head>
<body>   
 
   <ul id="countrytabs" class="shadetabs">

<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Scorecard%20Financeiro%20Acumulado.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Scorecard%20Financeiro%20Mes%20Atual.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Gráfico%20Receita%20Operacional%20PF%20x%20PJ.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Gráfico%20Despesas%20Correntes%20Orcadas%20x%20Realizada.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Gráfico%20Despesa%20Corrente%20Orcada%20x%20Realizada.aspx" rel="#iframe"></a></li>       
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Gráfico%20Despesas%20Direta%20x%20Indireta.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Gráfico%20Receita%20Operacional%20PF%20x%20PJ.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Gráfico%20Receita%20Operacional%20Orcada%20x%20Realizada.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Gráfico%20Inadimplencia%20Comparativo%202008%20x%202009.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Gráfico%20RCL%20Resultado%20Corrente%20Liquido.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20Receita%20Operacional%202008%20x%202009%20-%20Especializadas.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20Receita%20Operacional%202008%20x%202009%20-%20Polivalentes.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20Receita%20Operacional%202008%20x%202009%20-%20Regionais.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20Receita%20Operacional%202009%20-%20Especializadas.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20Receita%20Operacional%202009%20-%20Polivalentes.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20Receita%20Operacional%202009%20-%20Regionais.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20RCL%202008%20x%202009%20-%20Especializadas.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20RCL%202008%20x%202009%20-%20Polivalentes.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20RCL%202008%20x%202009%20-%20Regionais.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20RCL%202009%20-%20Especializadas.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20RCL%202009%20-%20Polivalentes.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformacePoint/Dashboard%20Producao/Relatório%20RCL%202009%20-%20Regionais.aspx" rel="#iframe"></a></li>





</ul>

<div id="countrydivcontainer"  style="border:0px solid gray; width:755px; height:530px; margin-right:1em; padding: 5px">
//Optional default content here.
</div>

<script type="text/javascript">

var countries=new ddajaxtabs("countrytabs", "countrydivcontainer")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init(30000)

</script>
</body>
</html>
