<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RelatorioVTForaLimite.aspx.vb" Inherits="FrequenciaDocente_Relatorio_RelatorioVTForaLimite" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="400px" Width="914px">
            <LocalReport ReportPath="FrequenciaDocente\Relatorio\RelForaLimiteVT.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                        Name="dsRelatorioDocente_ForaLimiteVT" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsRelatorioDocenteTableAdapters.ForaLimiteVTTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="valorVT" SessionField="c_ValorVT" Type="Decimal" />
                <asp:SessionParameter Name="idparametro" SessionField="c_Parametro" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
