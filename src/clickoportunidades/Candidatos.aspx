<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Candidatos.aspx.vb" Inherits="Candidatos" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 150%;
        }
        .style3
        {
            width: 224px;
        }
        .style2
        {
            width: 316px;
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 800px">
    
        <table class="style1">
            <tr>
                <td class="style3">
                    <asp:Image ID="Image1" runat="server" Height="50px" 
                        ImageUrl="~/imagens/LogoTipoSenacRJ.gif" Width="75px" />
                </td>
                <td class="style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblTextoRelatorio" runat="server" 
                        Font-Size="Large" style="text-align: center" 
                        Text="Relatório de candidatos cadastrados" BorderWidth="0px" 
                        Font-Names="Verdana" ForeColor="Black" Width="282px"></asp:Label>
                </td>
                <td style="text-align: center">
                    &nbsp;</td>
            </tr>
        </table>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="600px" Width="800px">
            <LocalReport ReportPath="Candidatos.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                        Name="ClickDataSet_tblCandidato" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="ClickDataSetTableAdapters.tblCandidatoTableAdapter">
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
