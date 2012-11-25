<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Areas.aspx.vb" Inherits="Areas" Theme="FDI"%>

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
            GroupingText="Cadastro de Área" BorderColor="#3399FF" 
            BorderStyle="Solid">
            <br />
            <asp:Label ID="lblEmpresa" runat="server" Text="Empresa:" Width="150px"></asp:Label>
            <asp:DropDownList ID="DDLEmpresa" runat="server" AutoPostBack="True" 
                DataSourceID="SqlEmpresa" DataTextField="Empresa" DataValueField="Id_Empresa" 
                Width="500px">
            </asp:DropDownList>
            &nbsp;<br />
            <asp:Label ID="lblCodArea" runat="server" Text="Código Área:" 
                Width="150px"></asp:Label>
            <asp:TextBox ID="txtCodArea" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o código da Área Envolvida" 
                Width="123px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtCodArea" 
                ErrorMessage="O campo Código da Área deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblArea" runat="server" Text="Área:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtNomeArea" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o nome da Área Envolvida" 
                Width="497px"></asp:TextBox>
            <asp:ImageButton ID="ImIncArea" runat="server" CssClass="botao" Height="20px" 
                ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir Nova Área" 
                Width="20px" />
            <asp:ImageButton ID="botaoAlterarArea" runat="server" Height="20px" 
                ImageUrl="~/Icones/editar.jpg" ToolTip="Alterar Dados da Área" 
                Width="20px" />
            <asp:ImageButton ID="botaoVoltar" runat="server" CausesValidation="False" 
                Height="20px" ImageUrl="~/Icones/voltar.jpg" ToolTip="Limpar Dados da Área" 
                Width="20px" />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtNomeArea" 
                ErrorMessage="O campo Nome da Área deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <asp:GridView ID="GridArea" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="Id_Area" DataSourceID="SqlArea" 
                EmptyDataText="Nenhuma Área Cadastrada para a empresa selecionada" 
                ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:CommandField AccessibleHeaderText="Editar" ButtonType="Image" 
                        SelectImageUrl="~/Icones/grid_selecionar.gif" ShowSelectButton="True">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:CommandField>
                    <asp:BoundField DataField="Id_Empresa" HeaderText="Id_Empresa" ReadOnly="True" 
                        SortExpression="Id_Empresa" Visible="True">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Empresa" HeaderText="Empresa" 
                        SortExpression="Empresa">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Id_Area" HeaderStyle-HorizontalAlign="Left" 
                        HeaderText="Id Área" ReadOnly="True" SortExpression="Id_Area">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Cod_Area" HeaderText="Código Area" 
                        SortExpression="Cod_Area" />
                    <asp:BoundField DataField="Area" HeaderStyle-HorizontalAlign="Left" 
                        HeaderText="Área" SortExpression="Area">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImDelArea" runat="server" CausesValidation="False" 
                                CommandName="Delete" ImageUrl="~/Icones/excluir.png" onclick="ImDelArea_Click" 
                                Text="Delete" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                    HorizontalAlign="Left" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlArea" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                DeleteCommand="DELETE FROM fdiArea WHERE (Id_Area = @Id_Area)" 
                InsertCommand="INSERT INTO fdiArea(Area, Id_Empresa, Cod_Area, Id_Area) VALUES (@Area, @Id_Empresa, @Cod_Area, dbo.fnRetornaIdArea(@Id_Empresa))" 
                SelectCommand="SELECT fdiArea.Id_Area, fdiArea.Id_Empresa, fdiEmpresa.Nome_Empresa AS Empresa, fdiArea.Cod_Area, fdiArea.Area FROM fdiArea INNER JOIN fdiEmpresa ON fdiArea.Id_Empresa = fdiEmpresa.Id_Empresa ORDER BY fdiArea.Id_Empresa, fdiArea.Id_Area" 
                
                
                UpdateCommand="UPDATE fdiArea SET Area = @Area, Id_Empresa = @Id_Empresa, Cod_Area = @Cod_Area WHERE (Id_Area = @Id_Area)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridArea" Name="Id_Area" 
                        PropertyName="SelectedValue" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtNomeArea" Name="Area" PropertyName="Text" />
                    <asp:SessionParameter Name="Id_Empresa" SessionField="Id_Empresa" />
                    <asp:ControlParameter ControlID="GridArea" Name="Id_Area" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtCodArea" Name="Cod_Area" 
                        PropertyName="Text" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtNomeArea" Name="Area" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DDLEmpresa" Name="Id_Empresa" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtCodArea" Name="Cod_Area" 
                        PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                DeleteCommand="DELETE FROM [fdiEmpresa] WHERE [Id_Empresa] = @Id_Empresa" 
                InsertCommand="INSERT INTO [fdiEmpresa] ([Id_Empresa], [Nome_Empresa], [CNPJ], [Endereco], [Cidade], [UF]) VALUES (@Id_Empresa, @Nome_Empresa, @CNPJ, @Endereco, @Cidade, @UF)" 
                SelectCommand="SELECT [Id_Empresa], [Nome_Empresa] as Empresa, [CNPJ], [Endereco], [Cidade], [UF] FROM [fdiEmpresa]" 
                UpdateCommand="UPDATE [fdiEmpresa] SET [Nome_Empresa] = @Nome_Empresa, [CNPJ] = @CNPJ, [Endereco] = @Endereco, [Cidade] = @Cidade, [UF] = @UF WHERE [Id_Empresa] = @Id_Empresa">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nome_Empresa" Type="String" />
                    <asp:Parameter Name="CNPJ" Type="String" />
                    <asp:Parameter Name="Endereco" Type="String" />
                    <asp:Parameter Name="Cidade" Type="String" />
                    <asp:Parameter Name="UF" Type="String" />
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id_Empresa" Type="Int32" />
                    <asp:Parameter Name="Nome_Empresa" Type="String" />
                    <asp:Parameter Name="CNPJ" Type="String" />
                    <asp:Parameter Name="Endereco" Type="String" />
                    <asp:Parameter Name="Cidade" Type="String" />
                    <asp:Parameter Name="UF" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
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
