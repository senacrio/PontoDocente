<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Unidades.aspx.vb" Inherits="Unidades" Theme="FDI"%>

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
            GroupingText="Cadastro das Unidades Envolvidas" BorderColor="#3399FF" 
            BorderStyle="Solid">
            <br />
            <asp:Label ID="lblEmpresa" runat="server" Text="Empresa:" Width="150px"></asp:Label>
            <asp:DropDownList ID="DDLEmpresa" runat="server" AutoPostBack="True" 
                DataSourceID="SqlEmpresa" DataTextField="Empresa" DataValueField="Id_Empresa" 
                Width="500px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblCodUnidade" runat="server" Text="Cód.Unidade:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtCodUnidade" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o nome da Unidade Envolvida" 
                Width="215px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtCodUnidade" 
                ErrorMessage="O campo Código da Unidade deve estar preenchido" 
                Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblSigla" runat="server" Text="SiglaUnidade:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtSiglaUnidade" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o nome da Unidade Envolvida" 
                Width="217px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtSiglaUnidade" 
                ErrorMessage="O campo Sigla da Unidade deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblUnidade" runat="server" Text="Unidade:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtNomeUnidade" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o nome da Unidade Envolvida" 
                Width="497px"></asp:TextBox>
            <asp:ImageButton ID="ImIncUnidade" runat="server" CssClass="botao" Height="20px" 
                ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir Nova Unidade" 
                Width="20px" />
            <asp:ImageButton ID="botaoAlterarUnidade" runat="server" Height="20px" 
                ImageUrl="~/Icones/editar.jpg" ToolTip="Alterar Dados da Unidade" 
                Width="20px" />
            <asp:ImageButton ID="botaoVoltar" runat="server" CausesValidation="False" 
                Height="20px" ImageUrl="~/Icones/voltar.jpg" ToolTip="Limpar Dados da Área" 
                Width="20px" />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtNomeUnidade" 
                ErrorMessage="O campo Nome da Unidade deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <br />
            <asp:SqlDataSource ID="SqlUnidade" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                DeleteCommand="DELETE FROM fdiUnidade WHERE (Id_Unidade = @Id_Unidade) and (Id_Empresa = @Id_Empresa)" 
                InsertCommand="INSERT INTO fdiUnidade(Unidade, Id_Empresa, Cod_Unidade, Sigla_Unidade, Id_Unidade) VALUES (@Unidade, @Id_Empresa, @Cod_Unidade, @Sigla_Unidade, dbo.fnRetornaIdUnidade(@Id_Empresa))" 
                SelectCommand="SELECT fdiEmpresa.Nome_Empresa AS Empresa, fdiUnidade.Id_Empresa, fdiUnidade.Id_Unidade, fdiUnidade.Unidade, fdiUnidade.Cod_Unidade, fdiUnidade.Sigla_Unidade FROM fdiEmpresa INNER JOIN fdiUnidade ON fdiEmpresa.Id_Empresa = fdiUnidade.Id_Empresa
" 
                
                
                
                
                
                UpdateCommand="UPDATE fdiUnidade SET Unidade = @Unidade, Id_Empresa = @Id_Empresa, Cod_Unidade = @Cod_Unidade, Sigla_Unidade = @Sigla_Unidade WHERE (Id_Unidade = @Id_Unidade) AND (Id_Empresa = @Id_Empresa)">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Unidade" />
                    <asp:Parameter Name="Id_Empresa" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtNomeUnidade" Name="Unidade" 
                        PropertyName="Text" />
                    <asp:SessionParameter Name="Id_Empresa" SessionField="Id_Empresa" />
                    <asp:ControlParameter ControlID="GridUnidade" Name="Id_Unidade" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtCodUnidade" Name="Cod_Unidade" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtSiglaUnidade" Name="Sigla_Unidade" 
                        PropertyName="Text" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtNomeUnidade" Name="Unidade" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="DDLEmpresa" Name="Id_Empresa" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtCodUnidade" Name="Cod_Unidade" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtSiglaUnidade" Name="Sigla_Unidade" 
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
            <asp:GridView ID="GridUnidade" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="Id_Unidade" DataSourceID="SqlUnidade" 
                EmptyDataText="Nenhuma Unidade Cadastrada para a empresa selecionada" ForeColor="#333333" 
                GridLines="None">
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
                    <asp:BoundField DataField="Id_Unidade" HeaderText="Id_Unidade" 
                        InsertVisible="False" ReadOnly="True" SortExpression="Id_Unidade" />
                    <asp:BoundField DataField="Cod_Unidade" HeaderText="Cod_Unidade" 
                        SortExpression="Cod_Unidade" />
                    <asp:BoundField DataField="Sigla_Unidade" HeaderText="Sigla_Unidade" 
                        SortExpression="Sigla_Unidade" />
                    <asp:BoundField DataField="Unidade" HeaderText="Unidade" 
                        SortExpression="Unidade" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImDelUnidade" runat="server" CausesValidation="False" 
                                CommandName="Delete" ImageUrl="~/Icones/excluir.png" onclick="ImDelUnidade_Click" 
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
            <asp:Label ID="txtAviso" runat="server" BorderStyle="None" 
                EnableTheming="False" Font-Bold="False" Height="19px" style="color: #FF3300" 
                Width="600px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="txtErro" runat="server" BorderStyle="None" EnableTheming="False" 
                Font-Bold="False" Height="19px" style="color: #FF3300" Width="600px"></asp:Label>
            <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
