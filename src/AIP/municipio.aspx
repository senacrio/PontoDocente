<%@ Page Language="VB" AutoEventWireup="false" CodeFile="municipio.aspx.vb" Inherits="Municipio" Theme="Projeto"%>

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
            GroupingText="Cadastro de Municípios">
            <br />
            <asp:Label ID="lblEstado" runat="server" Text="Estado:" Width="96px"></asp:Label>
            <asp:DropDownList ID="DDLEstado" runat="server" DataSourceID="SqlEstado" 
                DataTextField="Estado" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblMunicipio" runat="server" 
                Text="Municipio:"></asp:Label>
            <asp:TextBox ID="txtMunicipio" runat="server" style="margin-left: 44px; height: 22px;" 
                Width="406px" MaxLength="50"></asp:TextBox>
            <asp:ImageButton ID="ImageButton2" runat="server" CssClass="botao" 
                ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" />
            <br />
            <asp:Label ID="txtAviso" runat="server" BorderStyle="None" 
                EnableTheming="False" Font-Bold="False" Height="19px" style="color: #FF3300" 
                Width="600px"></asp:Label>
            <asp:GridView ID="GridMunicipio" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="id_municipio" DataSourceID="SqlGridMunicipio" 
                EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
                GridLines="None" Width="212px">
                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/Icones/seta_direita.gif" 
                    PreviousPageImageUrl="~/Icones/seta_esq.gif" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/Icones/voltar.jpg" 
                        EditImageUrl="~/Icones/editar.jpg" ShowEditButton="True" 
                        UpdateImageUrl="~/Icones/confirmar.gif" />
                    <asp:BoundField DataField="id_municipio" HeaderText="id_municipio" ReadOnly="True" 
                        SortExpression="id_municipio" InsertVisible="False" Visible="False" >
                    </asp:BoundField>
                    <asp:BoundField DataField="nome" HeaderText="Município" SortExpression="nome">
                        <ControlStyle Width="300px" />
                        <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Estado" HeaderText="UF" 
                        SortExpression="Estado" />
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
            <br />
            <br />
            <br />
        </asp:Panel>
        <br />
        <asp:SqlDataSource ID="SqlEstado" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            SelectCommand="SELECT * FROM plnEstado"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlGridMunicipio" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            DeleteCommand="DELETE FROM plnMunicipio WHERE (ID_Municipio = @ID_Municipio)" 
            InsertCommand="INSERT INTO plnMunicipio(nome, Estado_fk) VALUES (@Nome, @Estado)" 
            ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
            SelectCommand="SELECT PlnMunicipio.ID_Municipio, PlnMunicipio.Nome, PlnMunicipio.Estado FROM PlnMunicipio INNER JOIN plnEstado ON PlnMunicipio.Estado = plnEstado.Estado ORDER BY PlnMunicipio.Estado, PlnMunicipio.Nome" 
            
            
            
            UpdateCommand="UPDATE plnMunicipio SET nome = @nome WHERE (id_municipio = @id_municipio)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridMunicipio" Name="ID_Municipio" 
                    PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtMunicipio" Name="Nome" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="DDLEstado" Name="Estado" 
                    PropertyName="SelectedValue" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="txtMunicipio" Name="nome" 
                    PropertyName="Text" />
                <asp:Parameter Name="id_municipio" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlMunicipio" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            InsertCommand="INSERT INTO plnMunicipio(nome, estado) VALUES (@nome, @UF)" 
            
            
            SelectCommand="SELECT PlnMunicipio.ID_Municipio, PlnMunicipio.Nome, PlnMunicipio.Estado, plnEstado.Estado AS Expr1 FROM PlnMunicipio INNER JOIN plnEstado ON PlnMunicipio.Estado = plnEstado.Estado ORDER BY Expr1, PlnMunicipio.Nome">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtMunicipio" Name="nome" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="DDLEstado" Name="UF" 
                    PropertyName="SelectedValue" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
