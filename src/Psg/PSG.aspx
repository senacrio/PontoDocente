<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PSG.aspx.vb" Inherits="PSG_PSG" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
    
      function pageLoad() {
      }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" 
            Text="Relação de Grupos com Vagas PSG e Aprendizagem"></asp:Label>
    </div>
    <br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Remote" 
        Width="1100px">
        <ServerReport ReportPath="/PSG/PSG" 
            ReportServerUrl="http://banco01/reportserver" />
    </rsweb:ReportViewer>
    </form>
</body>
</html>
