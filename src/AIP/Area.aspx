<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Area.aspx.vb" Inherits="Area" Theme="aip"%>

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
          GroupingText="Cadastro de Unidades/Áreas Executoras">
          <asp:Label ID="lblArea" runat="server" Text="Unidade/Área Executora:"></asp:Label>
          <asp:TextBox ID="txtArea" runat="server" Height="16px" Width="255px"></asp:TextBox>
          <asp:ImageButton ID="ImageButton1" runat="server" CssClass="botao" 
              ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" />
          <asp:RequiredFieldValidator ID="valTpCliente" runat="server" 
              ControlToValidate="txtArea" ErrorMessage="Campo obrigatório" 
              Width="180px"></asp:RequiredFieldValidator>
      </asp:Panel>
          <asp:GridView ID="GridArea" runat="server" AllowPaging="True" 
              AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
              DataKeyNames="Id_Area,Nome_Area" DataSourceID="SqlArea" 
              EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
              GridLines="None">
              <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <RowStyle BackColor="#EFF3FB" />
              <Columns>
                  <asp:BoundField DataField="Id_Area" HeaderText="Id_Area" 
                      InsertVisible="False" ReadOnly="True" SortExpression="Id_Area" />
                  <asp:BoundField DataField="Nome_Area" HeaderText="Nome_Area" 
                      SortExpression="Nome_Area" />
                  <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                      ShowDeleteButton="True" />
              </Columns>
              <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
              <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <EditRowStyle BackColor="#2461BF" />
              <AlternatingRowStyle BackColor="White" />
          </asp:GridView>
    <asp:SqlDataSource ID="SqlArea" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        DeleteCommand="DELETE FROM aipArea WHERE (Id_Area = @Id_Area)" 
        InsertCommand="INSERT INTO aipArea(Nome_Area) VALUES (@Nome_Area)" 
        ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
        SelectCommand="SELECT Id_Area, Nome_Area FROM aipArea order by Id_Area" 
        
          
          
          
          UpdateCommand="UPDATE aipArea SET Nome_Area = @Nome_Area">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtArea" Name="Nome_Area" 
                PropertyName="Text" />
        </InsertParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridArea" Name="Id_Area" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridArea" Name="Nome_Area" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
     </div>
    </form>
</body>
</html>
