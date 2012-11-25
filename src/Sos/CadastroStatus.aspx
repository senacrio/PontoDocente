<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroStatus.aspx.vb" Inherits="Sos_CadastroStatus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 203px;
        }
        .style3
        {
            width: 57px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span style="color: black; font-family: Arial; font-weight: bold;">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"
                Text="Cadastro de Status"></asp:Label>
        <br />
        </span>                                     
        <span style="color: black; font-family: Arial; ">
            <br />
        <table class="style1">
            <tr>
                <td class="style3">
                    Status:</td>
        </span>                                     
        <span style="color: black; font-family: Arial; font-weight: bold;">
                    <td class="style2">
                        <asp:TextBox ID="txtStatus" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            ImageUrl="~/Icones/001_03.gif" />
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
        </table>
                <asp:Label ID="lblErro" runat="server" Font-Names="Arial" Font-Size="Small" 
                                                                        ForeColor="Red"></asp:Label>
                                                        <asp:GridView ID="grdStatus" 
            runat="server" AllowPaging="True" 
                                                            
            AutoGenerateColumns="False" BorderColor="Silver" BorderStyle="Solid" 
                                                            BorderWidth="1px" 
            CellPadding="2" DataKeyNames="IDStatus" 
                                                            
            DataSourceID="sdsStatus" Font-Names="Arial" Font-Size="Small" 
                                                            ForeColor="#333333" 
            GridLines="None" PageSize="20" Width="200px" AllowSorting="True" 
        style="text-align: left">
                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                            <EmptyDataRowStyle BorderColor="White" BorderStyle="Solid" BorderWidth="1px" 
                                                                ForeColor="Black" />
                                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                            <EmptyDataTemplate>
                                                                <br />
                                                                Não existem Informações cadastradas.<br />
                                                                <br />
                                                            </EmptyDataTemplate>
                                                            <EditRowStyle BackColor="#999999" />
                                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                            <Columns>
                                                                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Icones/excluir.png" 
                                                                    CancelText="Cancelar" EditImageUrl="~/Icones/editar.jpg" EditText="Editar" 
                                                                    ShowEditButton="True" UpdateImageUrl="~/Icones/disquete.jpg" 
                                                                    UpdateText="Atualizar" />
                                                                <asp:BoundField DataField="Status" HeaderText="Status" 
                                                                    SortExpression="Status" />
                                                            </Columns>
                                                            <PagerStyle BackColor="SteelBlue" ForeColor="White" HorizontalAlign="Center" />
                                                            <HeaderStyle BackColor="SteelBlue" BorderColor="Gray" BorderStyle="Solid" 
                                                                BorderWidth="1px" Font-Bold="True" ForeColor="White" />
                                                            <AlternatingRowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                                                                BorderWidth="1px" ForeColor="#284775" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="sdsStatus" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
            DeleteCommand="DELETE FROM [sosStatus] WHERE [IDStatus] = @IDStatus" 
            InsertCommand="INSERT INTO [sosStatus] ([Status]) VALUES (@Status)" 
            SelectCommand="SELECT * FROM [sosStatus]" 
            UpdateCommand="UPDATE [sosStatus] SET [Status] = @Status WHERE [IDStatus] = @IDStatus">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="IDStatus" Type="Int32" />
                                                            </DeleteParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="Status" Type="String" />
                                                                <asp:Parameter Name="IDStatus" Type="Int32" />
                                                            </UpdateParameters>
                                                            <InsertParameters>
                                                                <asp:ControlParameter ControlID="txtStatus" Name="Status" PropertyName="Text" 
                                                                    Type="String" />
                                                            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        </span>                                     
    
    </div>
    </form>
</body>
</html>
