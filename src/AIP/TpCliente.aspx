<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TpCliente.aspx.vb" Inherits="TpCliente" Theme="aip"%>

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
          GroupingText="Cadastro de Tipo de Clientes">
          <asp:Label ID="lblTpCliente" runat="server" Text="Tipo de Cliente:"></asp:Label>
          <asp:TextBox ID="txtTpCliente" runat="server" Height="16px"></asp:TextBox>
          <asp:ImageButton ID="ImageButton1" runat="server" CssClass="botao" 
              ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" />
          <asp:RequiredFieldValidator ID="valTpCliente" runat="server" 
              ControlToValidate="txtTpCliente" ErrorMessage="Campo obrigatório" 
              Width="180px"></asp:RequiredFieldValidator>
          <asp:GridView ID="GridTpCliente" runat="server" AllowPaging="True" 
              AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
              DataKeyNames="id_TpCliente" DataSourceID="SqlTpClienteGrid" 
              EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
              GridLines="None">
              <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <RowStyle BackColor="#EFF3FB" />
              <Columns>
                  <asp:BoundField DataField="id_TpCliente" HeaderText="id_TpCliente" 
                      InsertVisible="False" ReadOnly="True" SortExpression="id_TpCliente" />
                  <asp:BoundField DataField="NomeTpCliente" HeaderText="NomeTpCliente" 
                      SortExpression="NomeTpCliente" />
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
    <asp:SqlDataSource ID="SqlTpClienteGrid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        DeleteCommand="DELETE FROM aipTpCliente WHERE (id_TpCliente = @id_TpCliente)" 
        InsertCommand="INSERT INTO aipTpCliente(NomeTpCliente) VALUES (@NomeTpCliente)" 
        ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
        SelectCommand="SELECT id_TpCliente, NomeTpCliente FROM aipTpCliente" 
        
          
          
          
          UpdateCommand="UPDATE aipTpCliente SET NomeTpCliente = @NomeTpCliente WHERE (id_TpCliente = @id_TpCliente)">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtTpCliente" Name="NomeTpCliente" 
                PropertyName="Text" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="id_TpCliente" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtTpCliente" Name="NomeTpCliente" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="GridTpCliente" Name="id_TpCliente" 
                PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        InsertCommand="INSERT INTO aipTpCliente(TpCliente) VALUES (@TpCliente)" 
        SelectCommand="SELECT id_TpCliente, NomeTpCliente FROM aipTpCliente">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtTpCliente" Name="TpCliente" 
                PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
     </div>
    </form>
</body>
</html>
