﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Rel.Metas.aspx.vb" Inherits="Default4" Theme="" uiCulture="pt-BR" Culture="pt-BR" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: x-small; font-weight: 700; color: #000000; text-align: center; height: 14px; width: 934px;">
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <br />
    
    </div>
    <div style="margin-left: 40px; width: 1080px;">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Remote" 
        Width="1080px" BorderStyle="None" Height="565px">
            <ServerReport ReportPath="/Metas/Meta_reducao2009" 
            ReportServerUrl="http://banco01/reportserver" />
        </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
