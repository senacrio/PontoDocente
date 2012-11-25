<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CategUnidade.aspx.vb" Inherits="SubCategUnidade" Theme="aip"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
     <link href="aip.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .botao
        {
            height: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divPrincipal">
        <asp:Panel ID="Panel1" runat="server" CssClass="TabelaControlesTopo" 
            GroupingText="Cadastro de Categoria de Unidades">
            <asp:Label ID="lblUnidade" runat="server" 
                Text="Unidade:" Width="180px"></asp:Label>
            <asp:DropDownList ID="DDLUnidade" runat="server" 
                DataSourceID="SDSCategUnidade" DataTextField="Centro_Ccusto" 
                DataValueField="Cód_Ccusto" Width="500px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblTpCliente0" runat="server" Text="Tipo de Cliente:" 
                Width="180px"></asp:Label>
            <asp:DropDownList ID="DDLTpCliente" runat="server" DataSourceID="SDSTp_Cliente" 
                DataTextField="tipo" DataValueField="id" Width="500px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblCatCliente" runat="server" Text="Categoria do Cliente:" 
                Width="180px"></asp:Label>
            <asp:DropDownList ID="DDLCatCliente" runat="server" DataSourceID="SdsTpCliente" 
                DataTextField="CategoriaCliente" DataValueField="idTpCliente" 
                Width="500px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblAreaConhec" runat="server" Text="Área de Conhecimento:" 
                Width="180px"></asp:Label>
            <asp:DropDownList ID="DDLAreaConhec" runat="server" 
                DataSourceID="SDSAreaConhec" DataTextField="NomeAreaConhec" 
                DataValueField="IDAreaConhecimento" Height="22px" 
                style="height: 22px" Width="500px">
            </asp:DropDownList>
            <asp:ImageButton ID="ImInclui" runat="server" CssClass="botao" Height="21px" 
                ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir relacionamento" 
                Width="22px" />
            <br />
            <asp:SqlDataSource ID="SDSAreaConhec" runat="server" 
                ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                SelectCommand="SELECT [IDAreaConhecimento], [NomeAreaConhec] FROM [AreaConhecimento]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SdsTpCliente" runat="server" 
                ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                SelectCommand="SELECT [idTpCliente], [CategoriaCliente] FROM [TpCliente]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SDSCategUnidade" runat="server" 
                CacheExpirationPolicy="Sliding" 
                ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                DeleteCommand="DELETE FROM [Grupo_Orcto] WHERE [Ccusto] = @Ccusto" 
                
                InsertCommand="INSERT INTO Grupo_Orcto(Ccusto, IdTpCliente, PF_PJ, IdArea) VALUES (@Ccusto, @IdTpCliente, @PF_PJ, @IdArea)" 
                
                SelectCommand="SELECT cod_ccusto + ' - ' + des_tit_ctbl AS Centro_Ccusto, cod_ccusto AS Cód_Ccusto, des_tit_ctbl AS Nome_Ccusto FROM Ccusto WHERE (cod_ccusto NOT IN (SELECT Ccusto FROM Grupo_Orcto AS GO)) ORDER BY Cód_Ccusto">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridCategUnidade" Name="Ccusto" 
                        PropertyName="SelectedValue" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="DDLUnidade" Name="Ccusto" 
                        PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DDLCatCliente" Name="IdTpCliente" 
                        PropertyName="SelectedValue" Type="Int16" />
                    <asp:ControlParameter ControlID="DDLTpCliente" Name="PF_PJ" 
                        PropertyName="SelectedValue" Type="Char" />
                    <asp:ControlParameter ControlID="DDLAreaConhec" Name="IdArea" 
                        PropertyName="SelectedValue" Type="Int16" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SDSTp_Cliente" runat="server" 
                ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                SelectCommand="SELECT [id], [tipo] FROM [Tipo_Cli]"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridCategUnidade" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ccusto" 
                DataSourceID="SDSGridCategUnidade" CellPadding="4" EnableTheming="False" 
                ForeColor="#333333" GridLines="None" PageSize="100" Width="500">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:CommandField ButtonType="Image" 
                        SelectImageUrl="~/Icones/grid_selecionar.gif" ShowSelectButton="True" />
                    <asp:BoundField DataField="Ccusto" HeaderText="Centro Custo" 
                        SortExpression="Ccusto" />
                    <asp:BoundField DataField="Nome_Ccusto" HeaderText="Nome C.Custo" 
                        SortExpression="Nome_Ccusto" >
                        <ControlStyle Width="550px" />
                        <FooterStyle Width="550px" />
                        <HeaderStyle Width="550px" />
                        <ItemStyle Width="550px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NomeAreaConhec" HeaderText="Área Conhec." 
                        SortExpression="NomeAreaConhec" />
                    <asp:BoundField DataField="IdTpCliente" HeaderText="IdTpCliente" 
                        SortExpression="IdTpCliente" Visible="False" />
                    <asp:BoundField DataField="CategoriaCliente" HeaderText="Categoria de Cliente" 
                        SortExpression="CategoriaCliente" />
                    <asp:BoundField DataField="tipo" HeaderText="tipo" 
                        SortExpression="Tipo de Cliente" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                        ShowDeleteButton="True" />
                </Columns>
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            <asp:Label ID="txtAviso" runat="server" BorderStyle="None" 
                EnableTheming="False" Font-Bold="False" Height="19px" style="color: #FF3300" 
                Width="600px"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SDSGridCategUnidade" runat="server" 
                ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                
                
                SelectCommand="SELECT GO.Ccusto, Centro_Custo.des_tit_ctbl AS Nome_Ccusto, area.IDAreaConhecimento, area.NomeAreaConhec, GO.IdTpCliente, TpCliente.CategoriaCliente, Tipo_Cli.tipo FROM Grupo_Orcto AS GO INNER JOIN Ccusto AS Centro_Custo ON GO.Ccusto = Centro_Custo.cod_ccusto INNER JOIN AreaConhecimento AS area ON GO.IdArea = area.IDAreaConhecimento INNER JOIN TpCliente ON GO.IdTpCliente = TpCliente.idTpCliente INNER JOIN Tipo_Cli ON GO.PF_PJ = Tipo_Cli.id WHERE (GO.Ccusto IN (SELECT cod_ccusto FROM Ccusto AS CC)) ORDER BY GO.Ccusto" 
                DeleteCommand="DELETE FROM Grupo_Orcto WHERE (Ccusto = @Ccusto)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridCategUnidade" Name="Ccusto" 
                        PropertyName="SelectedValue" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
