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

<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Mapa%20Estratégico.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Financeiro%20Acumulado%20-%20Parte%2001.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Parte%2002%20-%20Financeiro%20-%20Acumulado%20-%20A.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Parte%2002%20-%20Financeiro%20-%20Acumulado%20-%20B.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Financeiro%20Acumulado%20-%20Parte%2003.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Financeiro%20Mes%20Atual%20-%20Parte%2001.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Parte%2002%20-%20Financeiro%20-%20Mês%20Atual%20-%20A.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Parte%2002%20-%20Financeiro%20-%20Mês%20Atual%20-%20B.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Financeiro%20Mes%20Atual%20-%20Parte%2003.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Despesas%20Correntes%20-%20Orçada%20x%20Realizada.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Despesas%20-%20Direta%20x%20Indireta.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Comparativo%202006%20x%202007%20x%202008%20-%20Receita%20Corrente%20Despesa%20Corrente%20e%20Inadimplencia.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/FAS%20-%20Fator%20de%20Auto-sustentabilidade.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Inadimplencia%20-%20Comparativo%202006%20x%202007%20x%202008.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Inadimplencia%20-%20Orçado%20x%20Realizado%20-%20mensal.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/RCL%20-%20Destaques%205mais.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/RCL%20-%20Destaques%205menos.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/RCL%20-%20Resultado%20Corrente%20Liquido.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Receita%20Operacional%20-%20Destaques%205mais.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Receita%20Operacional%20-%20Destaques%205menos.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Receita%20Operacional%20-%20Orçada%20x%20Realizada.aspx" rel="#iframe"></a></li>
<li><a href="http://bsc/PerformancePointDefault/Dashbord%20TV/Receita%20Operacional%20-%20PF%20x%20PJ.aspx" rel="#iframe"></a></li>

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
