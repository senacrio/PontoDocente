<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RelatorioAtendimento.aspx.vb" Inherits="relatorios_sga_RelatorioGEROP_UO" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <br />
       
    
    </div>
    <rsweb:ReportViewer ID="reportATD" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="590px" ProcessingMode="Remote" Width="1111px">
            <ServerReport ReportPath="/report_sga/sga-atendimento" 
                ReportServerUrl="http://banco01/reportserver" />
        </rsweb:ReportViewer>
    </form>
</body>
</html>
