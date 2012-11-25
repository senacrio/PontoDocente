<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Taxas.aspx.vb" Inherits="Taxas" Theme="FDI"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
     <link href="projeto.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 71px;
        }
        .style3
        {
            width: 136px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divPrincipal">
        <asp:Panel ID="Panel1" runat="server" CssClass="TabelaControlesTopo" 
            GroupingText="Taxa Selic" BorderColor="#3399FF" 
            BorderStyle="Solid">
            <table class="style1">
                <tr>
                    <td class="style2">
                        <asp:Label ID="lblTaxaselic" runat="server" Text="Taxa Selic:"></asp:Label>
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtTaxa" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="ImIncArea" runat="server" CssClass="botao" Height="20px" 
                            ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir Nova Área" Width="20px" />
                    </td>
                </tr>
            </table>
            <br />
            &nbsp;<br />
            &nbsp;<br />
            <br />
            <asp:SqlDataSource ID="sqlTaxa" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                DeleteCommand="DELETE FROM [fdiTaxa] WHERE [Id_Taxa] = @Id_Taxa" 
                InsertCommand="INSERT INTO [fdiTaxa] ([Taxa], [Usuario]) VALUES (@Taxa,  @Usuario)" 
                SelectCommand="SELECT * FROM [fdiTaxa]" 
                UpdateCommand="UPDATE [fdiTaxa] SET [Taxa] = @Taxa, [DataHoraRegistro] = @DataHoraRegistro, [Usuario] = @Usuario WHERE [Id_Taxa] = @Id_Taxa">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Taxa" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Taxa" Type="Decimal" />
                    <asp:Parameter Name="DataHoraRegistro" Type="DateTime" />
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Id_Taxa" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtTaxa" Name="Taxa" PropertyName="Text" 
                        Type="Decimal" />
                    <asp:SessionParameter Name="Usuario" SessionField="c_Login" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:Label ID="txtAviso" runat="server" BorderStyle="None" 
                EnableTheming="False" Font-Bold="False" Height="19px" style="color: #FF3300" 
                Width="600px"></asp:Label>
            <br />
            <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
