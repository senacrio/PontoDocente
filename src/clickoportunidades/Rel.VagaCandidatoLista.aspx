<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Rel.VagaCandidatoLista.aspx.vb" Inherits="clickoportunidades_RelatorioVagaCandidatoLista" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="585px" ProcessingMode="Remote" Width="1054px">
            <ServerReport ReportPath="/Click Oportunidades/VagasPorCandidatoLista" 
                ReportServerUrl="http://banco01/reportserver" />
        </rsweb:ReportViewer>
    
    </div>
    </form>
</body>
</html>
