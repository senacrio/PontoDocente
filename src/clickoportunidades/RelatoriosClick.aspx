<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RelatoriosClick.aspx.vb" Inherits="RelatoriosClick" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 120%;
        }
        .style2
        {
            width: 493px;
        }
        .style3
        {
            width: 159px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <table class="style1">
            <tr>
                <td class="style3">
                    <asp:Image ID="Image1" runat="server" Height="50px" 
                        ImageUrl="~/imagens/LogoTipoSenacRJ.gif" Width="75px" />
                </td>
                <td class="style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblTextoRelatorio" runat="server" BorderStyle="Solid" 
                        Font-Size="Large" style="font-weight: 700; text-align: center" 
                        Text="Click Oportunidades - Vagas disponíveis" BorderWidth="1px" 
                        Font-Names="Verdana" ForeColor="#0066FF"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="517px" Width="800px">
            <LocalReport ReportPath="EmpresaVaga.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                        Name="DataSet1_DataTable1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetData" TypeName="DataSet1TableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
