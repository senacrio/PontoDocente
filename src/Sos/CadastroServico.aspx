<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroServico.aspx.vb" Inherits="Sos_CadastroServico" %>

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
            width: 120px;
        }
        .style3
        {
            width: 120px;
            height: 27px;
        }
        .style4
        {
            height: 27px;
        }
    </style>
</head>
<body>
<div>
    <form id="form1" runat="server">
    <p>
        <span style="color: black; font-family: Arial; font-weight: bold;">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"
                Text="Cadastro de Serviço"></asp:Label>
        </span>                                     
        </p>
    <table class="style1">
        <tr>
            <td class="style3" valign="top">
                Grupo de Serviço:</td>
            <td class="style4" valign="top">
                <asp:DropDownList ID="ddlGrupoServico" runat="server" 
                    DataSourceID="sdsGrupoServico" DataTextField="Nome" 
                    DataValueField="IDGrupoServico" Width="290px" 
                    style="font-family: Verdana; font-size: x-small">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                Nome:</td>
            <td valign="top">
                <asp:TextBox ID="txtNome" runat="server" Width="290px" 
                    style="font-family: Verdana; font-size: x-small"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtNome" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                Descrição:<br />
            </td>
            <td valign="top">
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
                    ImageUrl="~/Icones/001_03.gif" />
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblErro" runat="server" Font-Names="Arial" Font-Size="Small" 
                                                                        ForeColor="Red" 
                    style="font-family: Verdana; font-size: x-small"></asp:Label>
                                                                    </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
                                                        <asp:GridView ID="grdServico" runat="server" AllowPaging="True" 
                                                            
            AutoGenerateColumns="False" BorderColor="Silver" BorderStyle="Solid" 
                                                            BorderWidth="1px" 
            CellPadding="2" DataKeyNames="IDServico" 
                                                            
            DataSourceID="sdsServico" Font-Names="Arial" Font-Size="Small" 
                                                            ForeColor="#333333" 
            GridLines="None" PageSize="20" Width="740px" AllowSorting="True" 
        style="text-align: left; font-family: Verdana; font-size: x-small;">
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
                                                                <asp:TemplateField HeaderText="Grupo de Serviço">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Expr1") %>' 
                                                                            style="font-family: Verdana; font-size: x-small"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                                                            DataSourceID="sdsGrupoServico" DataTextField="Nome" 
                                                                            DataValueField="IDGrupoServico" SelectedValue='<%# Bind("IDGrupoServico") %>' 
                                                                            Width="200px" style="font-family: Verdana; font-size: x-small">
                                                                        </asp:DropDownList>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                                                                <asp:BoundField DataField="Descricao" HeaderText="Descrição" 
                                                                    SortExpression="Descricao" />
                                                                <asp:TemplateField HeaderText="Status">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label3" runat="server" 
                                                                            style="font-family: Verdana; font-size: x-small" Text='<%# Bind("Ativo") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:DropDownList ID="DropDownList2" runat="server" 
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
                                                        <asp:SqlDataSource ID="sdsServico" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
        DeleteCommand="DELETE FROM [sosServico] WHERE [IDServico] = @IDServico" 
        InsertCommand="INSERT INTO [sosServico] ([Nome], [Descricao], [IDGrupoServico],[Ativo]) VALUES (@Nome, @Descricao, @IDGrupoServico,@Ativo)" 
        SelectCommand="SELECT sosServico.IDServico, sosServico.Nome, sosServico.Descricao, sosServico.IDGrupoServico, sosGrupoServico.Nome AS Expr1, sosServico.Ativo AS Atv, CASE sosServico.Ativo WHEN 'True' THEN 'Ativado' ELSE 'Desativado' END AS Ativo FROM sosServico INNER JOIN sosGrupoServico ON sosServico.IDGrupoServico = sosGrupoServico.IDGrupoServico" 
        
        
        
        UpdateCommand="UPDATE sosServico SET Nome = @Nome, Descricao = @Descricao, IDGrupoServico = @IDGrupoServico, Ativo = @Atv WHERE (IDServico = @IDServico)">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="IDServico" Type="Int32" />
                                                            </DeleteParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="Nome" Type="String" />
                                                                <asp:Parameter Name="Descricao" Type="String" />
                                                                <asp:Parameter Name="IDGrupoServico" Type="Int32" />
                                                                <asp:Parameter Name="IDServico" Type="Int32" />
                                                                <asp:Parameter Name="Atv" />
                                                            </UpdateParameters>
                                                            <InsertParameters>
                                                                <asp:ControlParameter ControlID="txtNome" Name="Nome" PropertyName="Text" 
                                                                    Type="String" />
                                                                <asp:ControlParameter ControlID="txtDescricao" Name="Descricao" 
                                                                    PropertyName="Text" Type="String" />
                                                                <asp:ControlParameter ControlID="ddlGrupoServico" Name="IDGrupoServico" 
                                                                    PropertyName="SelectedValue" Type="Int32" />
                                                                <asp:Parameter DefaultValue="1" Name="Ativo" />
                                                            </InsertParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsGrupoServico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    
        SelectCommand="SELECT IDGrupoServico, Nome, Descricao, Ativo FROM sosGrupoServico WHERE (Ativo = 1)"></asp:SqlDataSource>
            <br />
    <br />
    <br />
    </div>
    </form>
</body>
</html>
