<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Divergencia.aspx.vb" Inherits="FrequenciaDocente_Relatorio_Divergencia" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 237px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Tipo<br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            <asp:ListItem>Dia</asp:ListItem>
            <asp:ListItem>Semana</asp:ListItem>
            <asp:ListItem>Mês</asp:ListItem>
        </asp:DropDownList>
&nbsp;<br />
        <table class="style1">
            <tr>
                <td class="style2">
                    <br />
                    Data:<br />
                </td>
                <td>
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Calendar ID="dataInical" runat="server"></asp:Calendar>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnGerar" runat="server" Text="Gerar" />
        <br />
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="639px" Width="983px" Visible="False">
            <LocalReport ReportPath="FrequenciaDocente\Relatorio\DivergenciasHoras.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                        Name="dsRelatorioDocente_DivergenciaHora" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetData" 
            TypeName="dsRelatorioDocenteTableAdapters.DivergenciaHoraTableAdapter" 
            OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter Name="datainicio" Type="DateTime" />
                <asp:Parameter Name="datafim" Type="DateTime" />
                <asp:Parameter Name="horas" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
