<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OutrosClientes.aspx.vb" Inherits="OutrosClientes" Theme="aip"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
      <link href="aip.css" rel="stylesheet" type="text/css" />
    </head>
<body>
    <form id="form1" runat="server">
   
  <div id="divPrincipal">
      <asp:Panel ID="Panel1" runat="server" CssClass="TabelaControlesTopo" 
          GroupingText="Cadastro de Outros Clientes">
          <asp:Label ID="lblClientes" runat="server" Text="Outros Clientes:"></asp:Label>
          <asp:TextBox ID="txtcliente" runat="server" Width="350px"></asp:TextBox>
          <asp:ImageButton ID="ImageButton1" runat="server" CssClass="botao" 
              ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" Height="20px" 
              Width="20px" />
          <asp:RequiredFieldValidator ID="valCompetencia" runat="server" 
              ControlToValidate="txtcliente" ErrorMessage="Campo obrigatório" 
              Width="180px"></asp:RequiredFieldValidator>
          <asp:GridView ID="GridClientes" runat="server" AllowPaging="True" 
              AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
              DataKeyNames="id_outros_clientes,Cliente" DataSourceID="SqlClientesGrid" 
              EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
              GridLines="None">
              <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <RowStyle BackColor="#EFF3FB" />
              <Columns>
                  <asp:BoundField DataField="id_outros_clientes" HeaderText="Código" 
                      SortExpression="id_outros_clientes" InsertVisible="False" 
                      ReadOnly="True" />
                  <asp:BoundField DataField="Cliente" HeaderText="Cliente" 
                      SortExpression="Cliente" />
                  <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                      ShowDeleteButton="True" />
              </Columns>
              <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
              <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <EditRowStyle BackColor="#2461BF" />
              <AlternatingRowStyle BackColor="White" />
          </asp:GridView>
      </asp:Panel>
    <asp:SqlDataSource ID="SqlClientesGrid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
        InsertCommand="INSERT INTO aipOutrosClientes(Cliente) VALUES (@Cliente)" 
        ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
        
          SelectCommand="SELECT [id_outros_clientes], [Cliente] FROM [aipOutrosClientes]">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtcliente" Name="Cliente" 
                PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
     </div>
    </form>
</body>
</html>
