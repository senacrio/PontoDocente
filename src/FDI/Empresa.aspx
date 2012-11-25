<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Empresa.aspx.vb" Inherits="Empresa" Theme="FDI"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
     <link href="projeto.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="divPrincipal">
        <asp:Panel ID="Panel1" runat="server" CssClass="TabelaControlesTopo" 
            GroupingText="Cadastro de Empresa" BorderColor="#3399FF" 
            BorderStyle="Solid" EnableTheming="True">
            <asp:Label ID="lblCodEmpresa" runat="server" 
                Text="Código da Empresa:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtIdEmpresa" runat="server" style="margin-left: 0px" 
                Width="77px" MaxLength="3" ToolTip="Entre com o Código da Empresa"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtIdEmpresa" 
                ErrorMessage="O campo Código da Empresa deve estar preenchido" 
                Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblNomeEmpresa" runat="server" Text="Nome da Empresa:" 
                Width="150px"></asp:Label>
            <asp:TextBox ID="txtNomeEmpresa" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o nome da Empresa" 
                Width="350px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtNomeEmpresa" 
                ErrorMessage="O campo Nomde da Empresa deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblCNPJEmpresa" runat="server" Text="CNPJ da Empresa:" 
                Width="150px"></asp:Label>
            <asp:TextBox ID="txtCNPJEmpresa" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o nome da Empresa" 
                Width="167px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtCNPJEmpresa" 
                ErrorMessage="O campo CNPJ deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblEnderecoEmpresa" runat="server" Text="Endereço da Empresa:" 
                Width="150px"></asp:Label>
            <asp:TextBox ID="txtEnderecoEmpresa" runat="server" MaxLength="500" 
                style="margin-left: 0px" TextMode="MultiLine" 
                ToolTip="Entre com o endereco da Empresa" Width="347px" 
                BorderColor="#006699" BorderStyle="Solid" EnableTheming="False" 
                Font-Names="Verdana" Font-Size="Small" ForeColor="#333333" Height="75px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtEnderecoEmpresa" 
                ErrorMessage="O campo Endereço deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblCidadeEmpresa" runat="server" Text="Nome da Cidade:" 
                Width="150px"></asp:Label>
            <asp:TextBox ID="txtCidadeEmpresa" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o nome da Cidade" 
                Width="350px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtCidadeEmpresa" 
                ErrorMessage="O campo Cidade deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblUFEmpresa" runat="server" Text="Estado:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtUFEmpresa" runat="server" MaxLength="2" 
                style="margin-left: 0px" ToolTip="Entre com a sigla do Estado da Empresa" 
                Width="28px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtUFEmpresa" 
                ErrorMessage="O campo Estado deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:ImageButton ID="ImIncEmpresa" runat="server" CssClass="botao" 
                Height="20px" ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir Nova Empresa" 
                Width="20px" />
            &nbsp;&nbsp;
            <asp:ImageButton ID="botaoAlterarEmpresa" runat="server" Height="20px" 
                ImageUrl="~/Icones/editar.jpg" ToolTip="Alterar Dados da Empresa" 
                Width="20px" />
            &nbsp;&nbsp;
            <asp:ImageButton ID="botaoVoltar" runat="server" CausesValidation="False" 
                Height="20px" ImageUrl="~/Icones/voltar.jpg" ToolTip="Limpar Dados da Empresa" 
                Width="20px" />
            <br />
            <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                DeleteCommand="DELETE FROM [fdiEmpresa] WHERE [Id_Empresa] = @Id_Empresa" 
                InsertCommand="INSERT INTO [fdiEmpresa] ([Id_Empresa], [Nome_Empresa], [CNPJ], [Endereco], [Cidade], [UF]) VALUES (@Id_Empresa, @Nome_Empresa, @CNPJ, @Endereco, @Cidade, @UF)" 
                SelectCommand="SELECT [Id_Empresa], [Nome_Empresa], [CNPJ], [Endereco], [Cidade], [UF] FROM [fdiEmpresa]" 
                UpdateCommand="UPDATE [fdiEmpresa] SET [Nome_Empresa] = @Nome_Empresa, [CNPJ] = @CNPJ, [Endereco] = @Endereco, [Cidade] = @Cidade, [UF] = @UF WHERE [Id_Empresa] = @Id_Empresa">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtNomeEmpresa" Name="Nome_Empresa" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtCNPJEmpresa" Name="CNPJ" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtEnderecoEmpresa" Name="Endereco" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtCidadeEmpresa" Name="Cidade" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtUFEmpresa" Name="UF" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtIdEmpresa" Name="Id_Empresa" 
                        PropertyName="Text" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtIdEmpresa" Name="Id_Empresa" 
                        PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtNomeEmpresa" Name="Nome_Empresa" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtCNPJEmpresa" Name="CNPJ" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtEnderecoEmpresa" Name="Endereco" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtCidadeEmpresa" Name="Cidade" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtUFEmpresa" Name="UF" PropertyName="Text" 
                        Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="txtAviso" runat="server" BorderStyle="None" 
                EnableTheming="False" Font-Bold="False" Height="19px" style="color: #FF3300" 
                Width="600px"></asp:Label>
            <br />
            <asp:GridView ID="GridEmpresa" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="Id_Empresa" DataSourceID="SqlEmpresa" CellPadding="4" 
                ForeColor="#333333" GridLines="None" Width="781px">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:CommandField ButtonType="Image" 
                        SelectImageUrl="~/Icones/grid_selecionar.gif" 
                        ShowSelectButton="True" AccessibleHeaderText="Editar" />
                    <asp:BoundField DataField="Id_Empresa" HeaderText="Código" ReadOnly="True" 
                        SortExpression="Id_Empresa" HeaderStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Nome_Empresa" HeaderText="Empresa" 
                        SortExpression="Nome_Empresa" HeaderStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" SortExpression="CNPJ" 
                        HeaderStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Endereco" HeaderText="Endereço" 
                        SortExpression="Endereco" HeaderStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Cidade" HeaderText="Cidade" 
                        SortExpression="Cidade" HeaderStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UF" HeaderText="UF" SortExpression="UF" 
                        HeaderStyle-HorizontalAlign="Left" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImDelEmpresa" runat="server" CausesValidation="False" 
                                CommandName="Delete" ImageUrl="~/Icones/excluir.png" onclick="ImDelEmpresa_Click" 
                                Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            <br />
        </asp:Panel>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
