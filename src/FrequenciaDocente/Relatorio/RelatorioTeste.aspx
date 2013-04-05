<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RelatorioTeste.aspx.cs" Inherits="FrequenciaDocente_Relatorio_RelatorioTeste" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <rsweb:ReportViewer ID="ReportViewer1" runat="server"  
        Width="1000px" BorderStyle="None" Height="1000px" Font-Names="Verdana" 
            Font-Size="8pt">
         <LocalReport ReportPath="FrequenciaDocente\Relatorio\RelNaovalidados.rdlc">
             <DataSources>
                 <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                     Name="dsRelatorioDocente_vwRealtorioNaoValidados" />
             </DataSources>
         </LocalReport>
           
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetData" 
            TypeName="dsRelatorioDocenteTableAdapters.vwRealtorioNaoValidadosTableAdapter">
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
