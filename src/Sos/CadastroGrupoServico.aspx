<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroGrupoServico.aspx.vb" Inherits="Sos_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            font-family: Verdana;
            font-size: x-small;
        }
        .style2
        {
            width: 46px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span style="color: black; font-family: Arial; font-weight: bold;">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"
                Text="Cadastro de Grupo de Serviço"></asp:Label>
        <br />
        <br />
        </span>                                     
        <table class="style1">
            <tr>
                <td class="style2">
                    Nome:</td>
                <td>
                    <asp:TextBox ID="txtNome" runat="server" Width="290px" 
                        style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtNome" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2" valign="top">
                    Descrição:</td>
                <td>
                    <asp:TextBox ID="txtDescricao" runat="server" Height="202px" 
                        TextMode="MultiLine" Width="290px" 
                        style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/Icones/001_03.gif" ToolTip="Adicionar Grupo de Serviço" />
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
                                                        <asp:Label ID="lblErro" 
            runat="server" Font-Names="Arial" Font-Size="Small" 
                                                                        
            ForeColor="Red" style="font-family: Verdana; font-size: x-small"></asp:Label>
                                                        <asp:GridView ID="grdGrupoServico" runat="server" AllowPaging="True" 
                                                            
            AutoGenerateColumns="False" BorderColor="Silver" BorderStyle="Solid" 
                                                            BorderWidth="1px" 
            CellPadding="2" DataKeyNames="IDGrupoServico" 
                                                            
            DataSourceID="sdsGrupoServico" Font-Names="Arial" Font-Size="Small" 
                                                            ForeColor="#333333" 
            GridLines="None" PageSize="20" Width="740px" AllowSorting="True" 
            style="font-family: Verdana; font-size: x-small">
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
                                                                    CancelText="Cancelar" CausesValidation="False" 
                                                                    EditImageUrl="~/Icones/editar.jpg" EditText="Editar" ShowEditButton="True" 
                                                                    UpdateImageUrl="~/Icones/disquete.jpg" UpdateText="Atualizar" />
                                                                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                                                                <asp:BoundField DataField="Descricao" HeaderText="Descricao" 
                                                                    SortExpression="Descricao" />
                                                                <asp:TemplateField HeaderText="Status">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2" runat="server" 
                                                                            style="font-family: Verdana; font-size: x-small" Text='<%# Bind("Ativo") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                                                            SelectedValue='<%# Bind("Atv") %>' 
                                                                            style="font-family: Verdana; font-size: x-small">
                                                                            <asp:ListItem Value="True">Ativado</asp:ListItem>
                                                                            <asp:ListItem Value="False">Desativado</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle BackColor="SteelBlue" ForeColor="White" HorizontalAlign="Center" />
                                                            <HeaderStyle BackColor="SteelBlue" BorderColor="Gray" BorderStyle="Solid" 
                                                                BorderWidth="1px" Font-Bold="True" ForeColor="White" />
                                                            <AlternatingRowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                                                                BorderWidth="1px" ForeColor="#284775" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="sdsGrupoServico" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
            DeleteCommand="DELETE FROM [sosGrupoServico] WHERE [IDGrupoServico] = @IDGrupoServico" 
            InsertCommand="INSERT INTO [sosGrupoServico] ([Nome], [Descricao],[Ativo]) VALUES (@Nome, @Descricao,@Ativo)" 
            SelectCommand="SELECT IDGrupoServico, Nome, Descricao, CASE Ativo WHEN 'True' THEN 'Ativo' ELSE 'Desativado' END AS Ativo, Ativo AS Atv FROM sosGrupoServico" 
            
            UpdateCommand="UPDATE sosGrupoServico SET Nome = @Nome, Descricao = @Descricao, Ativo = @Atv WHERE (IDGrupoServico = @IDGrupoServico)">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="IDGrupoServico" Type="Int32" />
                                                            </DeleteParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="Nome" Type="String" />
                                                                <asp:Parameter Name="Descricao" Type="String" />
                                                                <asp:Parameter Name="IDGrupoServico" Type="Int32" />
                                                                <asp:Parameter Name="Atv" />
                                                            </UpdateParameters>
                                                            <InsertParameters>
                                                                <asp:ControlParameter ControlID="txtNome" Name="Nome" PropertyName="Text" 
                                                                    Type="String" />
                                                                <asp:ControlParameter ControlID="txtDescricao" Name="Descricao" 
                                                                    PropertyName="Text" Type="String" />
                                                                <asp:Parameter DefaultValue="1" Name="Ativo" />
                                                            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
