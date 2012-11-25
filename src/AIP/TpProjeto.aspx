<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TpProjeto.aspx.vb" Inherits="TpProjeto" Theme="aip"%>

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
          GroupingText="Cadastro de Tipo de Projetos">
          <asp:Label ID="lblTpProjeto" runat="server" Text="Tipo de Projetos:"></asp:Label>
          <asp:TextBox ID="txtTpProjeto" runat="server" Height="16px" Width="255px"></asp:TextBox>
          <asp:ImageButton ID="ImageButton1" runat="server" CssClass="botao" 
              ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" />
          <asp:RequiredFieldValidator ID="valTpCliente" runat="server" 
              ControlToValidate="txtTpProjeto" ErrorMessage="Campo obrigatório" 
              Width="180px"></asp:RequiredFieldValidator>
          <asp:GridView ID="GridTpProjeto" runat="server" AllowPaging="True" 
              AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
              DataKeyNames="id_TpProjeto" DataSourceID="SqlTpProjetoGrid" 
              EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
              GridLines="None">
              <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <RowStyle BackColor="#EFF3FB" />
              <Columns>
                  <asp:BoundField DataField="id_TpProjeto" HeaderText="id_TpProjeto" 
                      InsertVisible="False" ReadOnly="True" SortExpression="id_TpProjeto" />
                  <asp:BoundField DataField="NomeTpProjeto" HeaderText="NomeTpProjeto" 
                      SortExpression="NomeTpProjeto" />
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
    <asp:SqlDataSource ID="SqlTpProjetoGrid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        DeleteCommand="DELETE FROM aipTpProjeto WHERE (id_TpProjeto = @id_tpProjeto)" 
        InsertCommand="INSERT INTO aipTpProjeto(NomeTpProjeto) VALUES (@NomeTpProjeto)" 
        ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
        SelectCommand="SELECT id_TpProjeto, NomeTpProjeto FROM aipTpProjeto" 
        
          
          
          
          UpdateCommand="UPDATE aipTpProjeto SET NomeTpProjeto = @TpProjeto">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtTpProjeto" Name="NomeTpProjeto" 
                PropertyName="Text" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="id_tpProjeto" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TpProjeto" />
        </UpdateParameters>
    </asp:SqlDataSource>
     </div>
    </form>
</body>
</html>
