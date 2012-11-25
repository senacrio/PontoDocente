<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frequencia.aspx.vb" Inherits="_frequencia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/Imagens/LogoTipoSenacRJ.gif" />
    
        <asp:TextBox ID="txt" runat="server" EnableTheming="True" Width="500px" 
            Font-Size="Larger" style="text-align: center">Controle de Frequência</asp:TextBox>
    
        <br />
        <br />
    
    </div>
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
        Text="Tempo de Atualização dos dados (Segundos) :  "></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="50px">30</asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Data :  "></asp:Label>
    <asp:TextBox ID="txtData" runat="server" EnableTheming="False" Width="75px"></asp:TextBox>
    <ajaxToolkit:CalendarExtender ID="txtData_CalendarExtender" runat="server" 
        TargetControlID="txtData">
    </ajaxToolkit:CalendarExtender>
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/Icones/confirmar.gif" ToolTip="Atualiza Dados" />
    <br />
    <br />
    <asp:SqlDataSource ID="SDSGridPonto" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        
        
        
        
        
        SelectCommand="SELECT plnUnidade.id_unidade AS Cod_unidade, plnUnidade.Sigla AS Unidade, Ponto.Matric, SGT_RHFuncionarioAtivo.nom_pessoa_fisic AS nome, CONVERT (varchar, Ponto.Data, 105) AS Data, Ponto.Hora, Unidade_Lotacao.cod_unid_lotac, Unidade_Lotacao.des_unid_lotac, SGT_RHFuncionarioAtivo.cod_rh_ccusto FROM plnUnidade INNER JOIN SGT_RHFuncionarioAtivo ON plnUnidade.id_unidade = SGT_RHFuncionarioAtivo.cdn_estab INNER JOIN Ponto ON SGT_RHFuncionarioAtivo.cdn_funcionario = Ponto.Matric INNER JOIN Unidade_Lotacao ON SGT_RHFuncionarioAtivo.cod_unid_lotac = Unidade_Lotacao.cod_unid_lotac COLLATE Latin1_General_CI_AS WHERE (Ponto.Data = @Data) ORDER BY Cod_unidade, SGT_RHFuncionarioAtivo.cod_unid_lotac, Data DESC, Ponto.Hora DESC, Ponto.Matric">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtData" Name="Data" PropertyName="Text" 
                Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SDSGridPonto" AllowSorting="True" CellPadding="4" 
        EmptyDataText="Não existem dados a serem exibidos nesta data" 
        EnableTheming="False" ForeColor="#333333" Width="814px">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Cod_unidade" HeaderText="Cod_unidade" 
                ReadOnly="True" SortExpression="Cod_unidade" />
            <asp:BoundField DataField="Unidade" HeaderText="Unidade" 
                SortExpression="Unidade" />
            <asp:BoundField DataField="Matric" HeaderText="Matric" 
                SortExpression="Matric" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="Data" HeaderText="Data" 
                SortExpression="Data" />
            <asp:BoundField DataField="Hora" HeaderText="Hora" 
                SortExpression="Hora" />
            <asp:BoundField DataField="des_unid_lotac" HeaderText="Unid_Lotac" 
                SortExpression="des_unid_lotac" />
            <asp:BoundField DataField="cod_rh_ccusto" HeaderText="C_custo" 
                SortExpression="cod_rh_ccusto" />
            <asp:BoundField DataField="Unidade" HeaderText="Sigla" 
                SortExpression="Unidade" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <asp:Timer ID="Timer1" runat="server" Interval="15000">
    </asp:Timer>
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <br />
    <br />
    <br />
    </form>
</body>
</html>
