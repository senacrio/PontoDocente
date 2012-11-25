<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SISTEC.aspx.vb" Inherits="SISTEC_SISTEC" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="16pt" 
            Text="Relatórios para SISTEC"></asp:Label>
    
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="70px" Width="488px">
            <asp:Button ID="button1" runat="server" Text="Clientes por Data Inicial" Height="27px" 
                BackColor="Silver" Width="200px" Font-Bold="True" />
            <asp:Button ID="Button2" runat="server" Height="27px" Text="Cursos por Data Inicial" 
                Width="200px" BackColor="Silver" Font-Bold="True" />
            <br />
            <asp:Button ID="Button4" runat="server" BackColor="Silver" Height="27px" 
                Text="Clientes por Data Final" Width="200px" Font-Bold="True" />
            <asp:Button ID="Button3" runat="server" BackColor="Silver" Height="27px" 
                Text="Cursos por Data Final" Width="200px" Font-Bold="True" />
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel5" runat="server" Height="116px" Width="792px" 
            Visible="False">
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                Text="Relação de Clintes por Data Final" Visible="False"></asp:Label>
            <br />
            <rsweb:ReportViewer ID="ReportViewer4" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="500px" ProcessingMode="Remote" Width="1001px"><ServerReport ReportPath="/sistec - clientes/sistecclifinal" 
                    ReportServerUrl="http://banco01/reportserver" /></rsweb:ReportViewer>
            <br />
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel4" runat="server" Height="119px" Visible="False" 
            Width="819px">
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                Text="Relação de Cursos por Data Final" Visible="False"></asp:Label>
            <rsweb:ReportViewer ID="ReportViewer3" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="500px" ProcessingMode="Remote" Width="1007px"><serverreport reportpath="/sistec cursos/sistec cursos final" 
                    reportserverurl="http://banco01/reportserver" /></rsweb:ReportViewer>
            <br />
            <br />
            <br />
        </asp:Panel>
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel2" runat="server" Visible="False" Height="84px" 
            Width="829px">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" 
                Text="Relação de Clientes por Data Inicial" Visible="False"></asp:Label>
            <br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="500px" ProcessingMode="Remote" Width="1000px"><ServerReport ReportPath="/sistec - clientes/sisteccli" 
                    ReportServerUrl="http://banco01/reportserver" /></rsweb:ReportViewer>
        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="Panel3" runat="server" Visible="False" Height="95px" 
            Width="832px">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                Text="Relação de Cursos por Data Inicial" Visible="False"></asp:Label>
            <br />
            <br />
            <rsweb:ReportViewer ID="ReportViewer2" runat="server" 
    Font-Names="Verdana" Font-Size="8pt" Height="500px" ProcessingMode="Remote" 
    Width="1000px"><ServerReport ReportPath="/sistec cursos/sistec cursos" 
        ReportServerUrl="http://banco01/reportserver" /></rsweb:ReportViewer>
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
