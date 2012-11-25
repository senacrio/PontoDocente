<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VagasPorCandidato.aspx.vb" Inherits="VagasPorCandidato" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 254%;
        }
        .style3
        {
            width: 359px;
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
    <div>
    
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
                        Text="Candidatos por vaga" BorderWidth="0px" 
                        Font-Names="Verdana" ForeColor="Black" Width="282px"></asp:Label>
                </td>
                <td style="text-align: center">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="776px" Width="1427px" style="margin-right: 0px">
            <LocalReport ReportPath="VagasPorCandidado.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                        Name="VagasPor_Candidatos_DataTable1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetData" 
            TypeName="VagasPor_CandidatosTableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
