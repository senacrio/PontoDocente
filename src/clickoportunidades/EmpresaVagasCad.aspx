<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EmpresaVagasCad.aspx.vb" Inherits="EmpresaVagasCad" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">

        .style3
        {
            width: 834px;
        }
        .style2
        {
            width: 466px;
            text-align: center;
        }
        .style4
        {
            width: 3078px;
        }
        .style5
        {
            width: 479px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 1969px">
    
        <table>
            <tr>
                <td class="style3">
                    <asp:Image ID="Image1" runat="server" Height="50px" 
                        ImageUrl="~/imagens/LogoTipoSenacRJ.gif" Width="75px" />
                </td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblTextoRelatorio" runat="server" 
                        Font-Size="Large" style="text-align: center" 
                        Text="Empresas por vagas" BorderWidth="0px" 
                        Font-Names="Verdana" ForeColor="Black" Width="405px"></asp:Label>
                </td>
                <td style="text-align: center" class="style4">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="600px" Width="1963px">
            <LocalReport ReportPath="EmpresaPorVagas.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                        Name="EmpresaVagasCad_DataTable1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetData" 
            TypeName="EmpresaVagasCadTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
