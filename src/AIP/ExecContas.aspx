<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ExecContas.aspx.vb" Inherits="aip_ExecContas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
     <link href="projeto.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="divPrincipal">
        <asp:Panel ID="Panel1" runat="server" CssClass="TabelaControlesTopo" 
            GroupingText="Cadastro deExecutivo de Contas">
            <br />
            Inclui Executivo de Contas:
            <asp:ImageButton ID="BtnIncluiEC" runat="server" CssClass="botao" 
                ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" />
&nbsp;<asp:Label ID="txtAviso" runat="server" BorderStyle="None" EnableTheming="False" 
                Font-Bold="False" Height="19px" style="color: #FF3300" Width="591px"></asp:Label>
            <br />
            <br />
            &nbsp;Funcionários do CSC:&nbsp;&nbsp;
            <br />
            <asp:GridView ID="GridViewFuncionCSC" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="cdn_funcionario" 
                DataSourceID="SqlEC" Width="594px">
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Icones/selecionar.png" 
                        ShowSelectButton="True" HeaderText="Selecionar" />
                    <asp:BoundField DataField="cdn_empresa" HeaderText="Empr" 
                        SortExpression="cdn_empresa" Visible="False" />
                    <asp:BoundField DataField="cdn_estab" HeaderText="Estab" 
                        SortExpression="cdn_estab" Visible="False" />
                    <asp:BoundField DataField="cdn_funcionario" HeaderText="Matrícula" 
                        SortExpression="cdn_funcionario" >
                        <ControlStyle Width="50px" />
                        <ItemStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cdn_plano_lotac" HeaderText="Plano Lotac" 
                        SortExpression="cdn_plano_lotac" Visible="False" />
                    <asp:BoundField DataField="cod_rh_ccusto" HeaderText="C.Custo" 
                        SortExpression="cod_rh_ccusto" Visible="False" />
                    <asp:BoundField DataField="cod_unid_lotac" HeaderText="Unid.Lotac" 
                        SortExpression="cod_unid_lotac" Visible="False" />
                    <asp:BoundField DataField="nom_abrev_pessoa_fisic" HeaderText="Nome Abrev" 
                        SortExpression="nom_abrev_pessoa_fisic" Visible="False" />
                    <asp:BoundField DataField="nom_pessoa_fisic" HeaderText="Nome" 
                        SortExpression="nom_pessoa_fisic" />
                    <asp:BoundField DataField="dat_admis_func" HeaderText="Data Admiss" 
                        SortExpression="dat_admis_func" Visible="False" />
                    <asp:BoundField DataField="dat_desligto_func" HeaderText="Data Demiss" 
                        SortExpression="dat_desligto_func" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlEC" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                InsertCommand="INSERT INTO aipExecutContas(cdn_matricula) VALUES (@cdn_funcionario)" 
                
                SelectCommand="SELECT cdn_empresa, cdn_estab, cdn_funcionario, cdn_plano_lotac, cod_rh_ccusto, cod_unid_lotac, nom_abrev_pessoa_fisic, nom_pessoa_fisic, dat_admis_func, dat_desligto_func FROM RHFuncionario WHERE (cdn_estab = @cdn_estab) AND (dat_desligto_func IS NULL) ORDER BY cdn_estab, nom_abrev_pessoa_fisic">
                <SelectParameters>
                    <asp:Parameter DefaultValue="070" Name="cdn_estab" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="GridViewFuncionCSC" Name="cdn_funcionario" 
                        PropertyName="SelectedValue" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            Executivos de Contas:<br />
            <asp:GridView ID="GridViewExecContas" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="cdn_matricula" 
                DataSourceID="SqlGridExecConta" Width="627px">
                <Columns>
                    <asp:BoundField DataField="cdn_matricula" HeaderText="Matrícula" 
                        ReadOnly="True" SortExpression="cdn_matricula">
                        <ControlStyle Width="50px" />
                        <ItemStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nom_pessoa_fisic" HeaderText="Nome" 
                        SortExpression="nom_pessoa_fisic" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                        HeaderText="Excluir" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlGridExecConta" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                DeleteCommand="DELETE FROM aipExecutContas WHERE (cdn_matricula = @cdn_matricula)" 
                SelectCommand="SELECT aipExecutContas.cdn_matricula, RHFuncionario.nom_pessoa_fisic FROM aipExecutContas INNER JOIN RHFuncionario ON aipExecutContas.cdn_matricula = RHFuncionario.cdn_funcionario AND RHFuncionario.dat_desligto_func IS NULL">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridViewExecContas" Name="cdn_matricula" 
                        PropertyName="SelectedValue" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
        </asp:Panel>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
