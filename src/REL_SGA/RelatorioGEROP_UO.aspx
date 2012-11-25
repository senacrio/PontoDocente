<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RelatorioGEROP_UO.aspx.vb" Inherits="relatorios_sga_RelatorioGEROP_UO" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
            <asp:ListItem Value="0" Selected="True">Por Grupo GEROP</asp:ListItem>
            <asp:ListItem Value="1">Por Unidade</asp:ListItem>
        </asp:RadioButtonList>
    <rsweb:ReportViewer ID="reportGEROP" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="590px" ProcessingMode="Remote" Width="1111px">
            <ServerReport ReportPath="/report_sga/POR_GEROP" 
                ReportServerUrl="http://banco01/reportserver" />
        </rsweb:ReportViewer>
        <br />
        <br />
       
    
    </div>
    <rsweb:ReportViewer ID="reportUO" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="590px" ProcessingMode="Remote" Width="1111px">
            <ServerReport ReportPath="/report_sga/POR_UNIDADE" 
                ReportServerUrl="http://banco01/reportserver" />
        </rsweb:ReportViewer>
    </form>
</body>
</html>
