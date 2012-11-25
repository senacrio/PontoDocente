<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Relatorio1.aspx.vb" Inherits="BSC_Relatorio1" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 593px;
        }
        .style2
        {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SDSEstabel" runat="server" 
            ConnectionString="Data Source=s2khomologacao;Initial Catalog=BI;Integrated Security=True" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT cod_estab AS Estab, nom_pessoa AS Nome_Estab, cod_estab + ' - ' + nom_pessoa AS Estabelecimento FROM View_Estabelecimento ORDER BY Estab">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSUnidNegoc" runat="server" 
            ConnectionString="Data Source=s2khomologacao;Initial Catalog=BI;Integrated Security=True" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT cod_unid_negoc AS Unid_Negoc, des_unid_negoc AS Nome_Unid_Negoc, cod_unid_negoc + ' - ' + des_unid_negoc AS Unidade_Negocio FROM View_Unid_Negocio">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSVisao" runat="server" 
            ConnectionString="Data Source=s2khomologacao;Initial Catalog=BI;Integrated Security=True" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT [IDVisao], [NomeVisao] FROM [Visao]">
        </asp:SqlDataSource>
        <table class="style1">
            <tr>
                <td colspan="2">
                    <asp:Label ID="LblVisao" runat="server" Text="Visão: " Width="150px"></asp:Label>
                    <asp:DropDownList ID="DDLVisao" runat="server" DataSourceID="SDSVisao" 
                        DataTextField="NomeVisao" DataValueField="IDVisao">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LblEstab" runat="server" Text="Estabelecimento: " Width="150px"></asp:Label>
                    <asp:DropDownList ID="DDLEstab" runat="server" DataSourceID="SDSEstabel" 
                        DataTextField="Estabelecimento" DataValueField="Estab">
                    </asp:DropDownList>
                    <asp:Button ID="BtExecuta" runat="server" Text="Executa" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LblUnidNegoc" runat="server" Text="Unidade de Negócio: " 
                        Width="150px"></asp:Label>
                    <asp:DropDownList ID="DDLUnidNegoc" runat="server" DataSourceID="SDSUnidNegoc" 
                        DataTextField="Unidade_Negocio" DataValueField="Unid_Negoc">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LblAno" runat="server" Text="Ano: " Width="150px"></asp:Label>
                    <asp:DropDownList ID="DDLAno" runat="server">
                        <asp:ListItem>2007</asp:ListItem>
                        <asp:ListItem>2008</asp:ListItem>
                        <asp:ListItem>2009</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LblMes" runat="server" Text="Mês: " Width="150px"></asp:Label>
                    <asp:DropDownList ID="DDLMes" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                        Font-Size="8pt" Height="935px" PromptAreaCollapsed="True" ShowBackButton="True" 
                        SizeToReportContent="True" Width="3000px">
                        <LocalReport ReportPath="BSC\Reports\Report.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                                    Name="DataSet2_View_Saldo_Ctbl_DW" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="DataSet2TableAdapters.View_Saldo_Ctbl_DWTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDLAno" Name="Ano" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DDLMes" Name="mes" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DDLEstab" Name="Estabel" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DDLUnidNegoc" Name="UnidNegoc" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DDLVisao" Name="IDVisao" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
