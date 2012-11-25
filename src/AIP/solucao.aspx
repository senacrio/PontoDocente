<%@ Page Language="VB" AutoEventWireup="false" CodeFile="solucao.aspx.vb" Inherits="solucao" Theme="aip"%>

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
          GroupingText="Cadastro de soluções">
          <asp:Label ID="lblsolucao" runat="server" Text="Solução:"></asp:Label>
          <asp:TextBox ID="txtsolucao" runat="server" Height="16px"></asp:TextBox>
          <asp:ImageButton ID="ImageButton1" runat="server" CssClass="botao" 
              ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" />
          <asp:RequiredFieldValidator ID="valsolucao" runat="server" 
              ControlToValidate="txtsolucao" ErrorMessage="Campo obrigatório" 
              Width="180px"></asp:RequiredFieldValidator>
          <asp:GridView ID="Gridsolucao" runat="server" AllowPaging="True" 
              AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
              DataKeyNames="idSolucao" DataSourceID="SqlsolucaoGrid" 
              EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
              GridLines="None">
              <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <RowStyle BackColor="#EFF3FB" />
              <Columns>
                  <asp:BoundField DataField="idSolucao" HeaderText="idSolucao" 
                      InsertVisible="False" ReadOnly="True" SortExpression="idSolucao" />
                  <asp:BoundField DataField="Solucao" HeaderText="Solucao" 
                      SortExpression="Solucao" />
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
    <asp:SqlDataSource ID="SqlsolucaoGrid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        DeleteCommand="DELETE FROM aipSolucao WHERE (idSolucao = @idsolucao)" 
        InsertCommand="INSERT INTO aipSolucao(Solucao) VALUES (@solucao)" 
        ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
        SelectCommand="SELECT idSolucao, Solucao FROM aipSolucao" 
        
          
          
          UpdateCommand="UPDATE aipSolucao SET Solucao = @solucao WHERE (id_solucao = @id_solucao)">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtsolucao" Name="solucao" 
                PropertyName="Text" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="idsolucao" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtsolucao" Name="solucao" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="Gridsolucao" Name="id_solucao" 
                PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        InsertCommand="INSERT INTO aipsolucao(solucao) VALUES (@solucao)" 
        SelectCommand="SELECT id_solucao, solucao FROM aipsolucao">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtsolucao" Name="solucao" 
                PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
     </div>
    </form>
</body>
</html>
