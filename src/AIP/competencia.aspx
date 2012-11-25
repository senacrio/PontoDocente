<%@ Page Language="VB" AutoEventWireup="false" CodeFile="competencia.aspx.vb" Inherits="competencia" Theme="aip"%>

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
          GroupingText="Cadastro de competências">
          <asp:Label ID="lblCompetencia" runat="server" Text="Competência:"></asp:Label>
          <asp:TextBox ID="txtcompetencia" runat="server" Height="16px"></asp:TextBox>
          <asp:ImageButton ID="ImageButton1" runat="server" CssClass="botao" 
              ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" />
          <asp:RequiredFieldValidator ID="valCompetencia" runat="server" 
              ControlToValidate="txtcompetencia" ErrorMessage="Campo obrigatório" 
              Width="180px"></asp:RequiredFieldValidator>
          <asp:GridView ID="GridCompetencia" runat="server" AllowPaging="True" 
              AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
              DataKeyNames="id_competencia" DataSourceID="SqlCompetenciaGrid" 
              EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
              GridLines="None">
              <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <RowStyle BackColor="#EFF3FB" />
              <Columns>
                  <asp:CommandField ButtonType="Image" 
                      CancelImageUrl="~/Icones/cancela_desligado.png" CausesValidation="False" 
                      EditImageUrl="~/Icones/editar.jpg" EditText="Editar" HeaderText="Editar" 
                      ShowEditButton="True" UpdateImageUrl="~/Icones/refresh.png">
                      <ItemStyle HorizontalAlign="Center" />
                  </asp:CommandField>
                  <asp:BoundField DataField="competencia" HeaderText="Competência" 
                      SortExpression="competencia" />
                  <asp:CommandField ButtonType="Image" CausesValidation="False" 
                      DeleteImageUrl="~/Icones/excluir.png" HeaderText="Excluir" 
                      ShowDeleteButton="True">
                      <ItemStyle HorizontalAlign="Center" Width="50px" />
                  </asp:CommandField>
              </Columns>
              <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
              <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <EditRowStyle BackColor="#2461BF" />
              <AlternatingRowStyle BackColor="White" />
          </asp:GridView>
      </asp:Panel>
    <asp:SqlDataSource ID="SqlCompetenciaGrid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        DeleteCommand="DELETE FROM [aipCompetencia] WHERE [id_competencia] = @id_competencia" 
        InsertCommand="INSERT INTO [aipCompetencia] ([competencia]) VALUES (@competencia)" 
        ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
        SelectCommand="SELECT [id_competencia], [competencia] FROM [aipCompetencia]" 
        
          UpdateCommand="UPDATE [aipCompetencia] SET [competencia] = @competencia WHERE [id_competencia] = @id_competencia">
        <DeleteParameters>
            <asp:Parameter Name="id_competencia" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtcompetencia" Name="competencia" 
                PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="competencia" Type="String" />
            <asp:Parameter Name="id_competencia" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        InsertCommand="INSERT INTO aipCompetencia(competencia) VALUES (@competencia)" 
        SelectCommand="SELECT id_competencia, competencia FROM aipCompetencia">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtcompetencia" Name="competencia" 
                PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
     </div>
    </form>
</body>
</html>
