<%@ Page Language="VB" AutoEventWireup="false" CodeFile="HorasExecutadas.aspx.vb" Inherits="Horas_Executadas_HorasExecutadas" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 898px">
    
        <br />
        <asp:Panel ID="Panel1" runat="server" Font-Size="Medium" Height="106px" 
            Width="619px">
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="16pt" 
                Text="Horas Executadas "></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Size="Medium" 
                Text="Aprendizagem" Height="40px" Width="170px" />
            <asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Size="Medium" 
                Text="Prática" Height="40px" Width="170px" />
            <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Size="Medium" 
                Text="PSG" Height="40px" Width="170px" />
            <br />
            <br />
            <br />
            <br />
            <br />
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel2" runat="server" Visible="False">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Aprendizagem" 
                Visible="False"></asp:Label>
            <br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                Font-Size="10pt" Height="400px" ProcessingMode="Remote" Width="1200px">
                <ServerReport ReportPath="/Aprendizagem/Aprendizagem" 
                    ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
            <br />
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel3" runat="server" Visible="False">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Prática" 
                Visible="False"></asp:Label>
            <rsweb:ReportViewer ID="ReportViewer4" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="400px" ProcessingMode="Remote" Width="1200px">
                <ServerReport ReportPath="/Praticas/Praticas" 
                    ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
            <br />
            <br />
        </asp:Panel>
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel4" runat="server" Visible="False">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="10pt" 
                Text="P S G" Visible="False"></asp:Label>
            <br />
            <rsweb:ReportViewer ID="ReportViewer5" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="400px" ProcessingMode="Remote" Width="1200px">
                <ServerReport ReportPath="/Horas PSG/Horas PSG" 
                    ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
            <br />
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
    
    </div>
    </form>
</body>
</html>
