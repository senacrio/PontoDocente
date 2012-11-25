<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Solicitante.aspx.vb" Inherits="Solicitante" Theme="FDI"%>

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
            GroupingText="Cadastro de Solicitante" BorderColor="#3399FF" 
            BorderStyle="Solid">
            <br />
            <asp:Label ID="lblEmpresa" runat="server" Text="Empresa:" Width="150px"></asp:Label>
            <asp:DropDownList ID="DDLEmpresa" runat="server" AutoPostBack="True" 
                DataSourceID="SqlEmpresa" DataTextField="Empresa" DataValueField="Id_Empresa" 
                Width="500px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblMatric0" runat="server" Text="Matrícula:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtMatric" runat="server" MaxLength="10" 
                style="margin-left: 0px" ToolTip="Entre com a matrícula do Solicitante" 
                Width="64px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtMatric" 
                ErrorMessage="O campo Matrícula deve estar preenchido" Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblNome" runat="server" Text="Nome do Solicitante:" 
                Width="150px"></asp:Label>
            <asp:TextBox ID="txtNome" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o nome do Solicitante" 
                Width="350px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtNome" ErrorMessage="O campo Nome deve estar preenchido" 
                Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblLogin" runat="server" Text="Login do Solicitante:" 
                Width="150px"></asp:Label>
            <asp:TextBox ID="txtLogin" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o login do Solicitante" 
                Width="350px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtLogin" ErrorMessage="O campo Login deve estar preenchido" 
                Font-Size="Small"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblArea" runat="server" Text="Área do Solicitante:" 
                Width="150px"></asp:Label>
            <asp:DropDownList ID="DDLArea" runat="server" DataSourceID="SDSArea" 
                DataTextField="Area" DataValueField="Id_Area" Width="352px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblEmail" runat="server" Text="E-Mail:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtEMail" runat="server" MaxLength="50" 
                style="margin-left: 0px" ToolTip="Entre com o e-mail do Solicitante" 
                Width="498px"></asp:TextBox>
            <asp:ImageButton ID="ImIncSolic" runat="server" CssClass="botao" Height="20px" 
                ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir Novo Solicitante" 
                Width="20px" />
            <asp:ImageButton ID="botaoAlterarSolic" runat="server" Height="20px" 
                ImageUrl="~/Icones/editar.jpg" ToolTip="Alterar Dados do Solicitante" 
                Width="20px" />
            <asp:ImageButton ID="botaoVoltar" runat="server" CausesValidation="False" 
                Height="20px" ImageUrl="~/Icones/voltar.jpg" ToolTip="Limpar Dados da Área" 
                Width="20px" />
            <br />
            <br />
            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <asp:GridView ID="GridSolicitante" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="Id_Empresa,id_Solicitante" DataSourceID="SqlSolicitante" 
                ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:CommandField AccessibleHeaderText="Editar" ButtonType="Image" 
                        SelectImageUrl="~/Icones/grid_selecionar.gif" ShowSelectButton="True" />
                    <asp:BoundField DataField="Id_Empresa" HeaderText="Id_Empresa" 
                        SortExpression="Id_Empresa" />
                    <asp:BoundField DataField="Nome_Empresa" HeaderStyle-HorizontalAlign="Left" 
                        HeaderText="Empresa" SortExpression="Nome_Empresa">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Id_Area" HeaderText="Id_Area" InsertVisible="False" 
                        SortExpression="Id_Area" />
                    <asp:BoundField DataField="Area" HeaderText="Área" SortExpression="Area" />
                    <asp:BoundField DataField="Matric_Solicitante" 
                        HeaderStyle-HorizontalAlign="Left" HeaderText="Matrícula" 
                        SortExpression="Matric_Solicitante">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Nome_Solicitante" HeaderText="Nome" 
                        SortExpression="Nome_Solicitante" />
                    <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                    <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImDelSolic" runat="server" CausesValidation="False" 
                                CommandName="Delete" ImageUrl="~/Icones/excluir.png" onclick="ImDelSolic_Click" 
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
            <asp:SqlDataSource ID="SqlSolicitante" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                DeleteCommand="DELETE FROM fdiSolicitante WHERE (Id_Empresa = @Id_Empresa) AND (id_Solicitante = @id_Solicitante)" 
                InsertCommand="INSERT INTO fdiSolicitante(Matric_Solicitante, Nome_Solicitante, email, Id_Empresa, Id_Area, Login) VALUES (@Matric_Solicitante, @Nome_Solicitante, @email, @Id_Empresa,@Id_Area,@Login)" 
                SelectCommand="SELECT fdiSolicitante.id_Solicitante, fdiSolicitante.Matric_Solicitante, fdiSolicitante.Nome_Solicitante, fdiSolicitante.email, fdiSolicitante.Id_Empresa, fdiEmpresa.Nome_Empresa, fdiSolicitante.Login, fdiArea.Id_Area, fdiArea.Cod_Area, fdiArea.Area FROM fdiEmpresa INNER JOIN fdiSolicitante ON fdiEmpresa.Id_Empresa = fdiSolicitante.Id_Empresa INNER JOIN fdiArea ON fdiSolicitante.Id_Area = fdiArea.Id_Area AND fdiSolicitante.Id_Empresa = fdiArea.Id_Empresa WHERE (fdiSolicitante.Id_Empresa = @Id_Empresa) ORDER BY fdiEmpresa.Id_Empresa, fdiSolicitante.id_Solicitante" 
                
                
                
                UpdateCommand="UPDATE fdiSolicitante SET Matric_Solicitante = @Matric_Solicitante, Nome_Solicitante = @Nome_Solicitante, email = @email, Login = @Login, Id_Area = @Id_Area WHERE (Id_Empresa = @Id_Empresa) AND (id_Solicitante = @id_Solicitante)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLEmpresa" Name="Id_Empresa" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridSolicitante" Name="Id_Empresa" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridSolicitante" Name="id_Solicitante" 
                        PropertyName="SelectedValue" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtMatric" Name="Matric_Solicitante" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtNome" Name="Nome_Solicitante" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtEMail" Name="email" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridSolicitante" Name="Id_Empresa" 
                        PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="id_Solicitante" SessionField="Id_Solicitante" />
                    <asp:ControlParameter ControlID="txtLogin" Name="Login" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DDLArea" Name="Id_Area" 
                        PropertyName="SelectedValue" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtMatric" Name="Matric_Solicitante" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtNome" Name="Nome_Solicitante" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtEMail" Name="email" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DDLEmpresa" Name="Id_Empresa" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDLArea" Name="Id_Area" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtLogin" Name="Login" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                SelectCommand="SELECT [Id_Empresa], [Nome_Empresa] as Empresa, [CNPJ], [Endereco], [Cidade], [UF] FROM [fdiEmpresa]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SDSArea" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                SelectCommand="SELECT Id_Empresa, Id_Area, Cod_Area, Area FROM fdiArea WHERE (Id_Empresa = @Id_Empresa)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLEmpresa" Name="Id_Empresa" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
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
