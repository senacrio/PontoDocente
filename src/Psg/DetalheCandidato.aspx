<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DetalheCandidato.aspx.vb" Inherits="Psg_DetalheCandidato" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="dtvCandidato" runat="server" AutoGenerateRows="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="sdsDetalheCandidato" GridLines="Vertical" 
            Height="50px" Width="125px">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Sexo" HeaderText="Sexo" SortExpression="Sexo" />
                <asp:BoundField DataField="RG" HeaderText="RG" SortExpression="RG" />
                <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
                <asp:BoundField DataField="TelefoneFixoDDD" HeaderText="Fixo DDD" 
                    SortExpression="TelefoneFixoDDD" />
                <asp:BoundField DataField="TelefoneFixo" HeaderText="Telefone Fixo" 
                    SortExpression="TelefoneFixo" />
                <asp:BoundField DataField="CelularDDD" HeaderText="Celular DDD" 
                    SortExpression="CelularDDD" />
                <asp:BoundField DataField="Celular" HeaderText="Celular" 
                    SortExpression="Celular" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Endereco" HeaderText="Endereço" 
                    SortExpression="Endereco" />
                <asp:BoundField DataField="EnderecoNumero" HeaderText="Número" 
                    SortExpression="EnderecoNumero" />
                <asp:BoundField DataField="EnderecoComplemento" HeaderText="Complemento" 
                    SortExpression="EnderecoComplemento" />
                <asp:BoundField DataField="Bairro" HeaderText="Bairro" 
                    SortExpression="Bairro" />
                <asp:BoundField DataField="Cidade" HeaderText="Cidade" 
                    SortExpression="Cidade" />
                <asp:BoundField DataField="CEP" HeaderText="CEP" SortExpression="CEP" />
            </Fields>
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#DCDCDC" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="sdsDetalheCandidato" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            SelectCommand="SELECT Nome, Sexo, RG, CPF, TelefoneFixoDDD, TelefoneFixo, CelularDDD, Celular, Email, Endereco, EnderecoNumero, EnderecoComplemento, Bairro, Cidade, CEP FROM psgCandidato WHERE (IDCandidato = @IDCandidato)">
            <SelectParameters>
                <asp:QueryStringParameter Name="IDCandidato" QueryStringField="idcandidato" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
