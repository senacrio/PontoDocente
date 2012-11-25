<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MudarSenhaEmpresa.aspx.vb" Inherits="MudarSenhaEmpresa" title="Untitled Page" Theme="AdmClick" %>

<%@ Register assembly="AspNetMaskedEdit" namespace="AspNetMaskedEdit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
      <link href="App_Themes/Basico/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 52%;
        }
        .style2
        {
            height: 21px;
        }
        .style3
        {
            height: 21px;
            width: 128px;
        }
        .style4
        {
            width: 128px;
        }
    </style>
</head>
<body>

    
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Font-Bold="True" Font-Size="14px" 
        ForeColor="#0066CC" Font-Names="Verdana">
        Mudar senha d<span lang="pt-br">a Empresa no</span> Click<span lang="pt-br"> 
        Oportunidades<br />
        <br />
        <span lang="pt-br" 
            style="font-family: Verdana; font-size: 10px; font-weight: bold">Busca de empresa por:<br />
        </span>
        <span lang="pt-br">&nbsp;</span><span lang="pt-br">&nbsp;</span><table 
            cellpadding="0" cellspacing="0" class="style1" 
            style="font-size: 10px; font-weight: bold; font-family: Verdana">
            <tr>
                <td class="style3">
                    <span lang="pt-br">CNPJ:</span></td>
                <td class="style2">
                    <span lang="pt-br">
                    <asp:TextBox ID="txtCNPJ" runat="server" style="width: 128px" 
                        ToolTip="Entre o nº do CNPJ da empresa"></asp:TextBox>
                    <span lang="pt-br">
                    <asp:ImageButton ID="btnAprova" runat="server" ImageAlign="Top" 
                        ImageUrl="~/Icones/Standard/001_38.gif" style="width: 14px" Width="22px" />
                    </span></span>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <span lang="pt-br">Razão Social: </span>
                </td>
                <td>
                    <span lang="pt-br">
                    <asp:TextBox ID="txtRazao" runat="server" style="width: 128px" 
                        ToolTip="Entre a razão social da empresa" Width="300px"></asp:TextBox>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <span lang="pt-br">Nome Fantasia: </span>
                </td>
                <td>
                    <span lang="pt-br">
                    <asp:TextBox ID="txtNomeFantasia" runat="server" MaxLength="500" 
                        style="width: 128px" ToolTip="Entre o nº do Fantasia da empresa" 
                        Width="300px"></asp:TextBox>
                    </span>
                </td>
            </tr>
        </table>
        <br />
        </span>
        <asp:GridView ID="GridViewMudarSenha" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_empresa" 
            DataSourceID="SqlMudaSenha" ShowFooter="True" Width="600px">
            <PagerSettings Mode="NextPrevious" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" ImageUrl="~/Icones/Standard/001_39.gif" 
                            onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                            Text="Update" />
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" ImageUrl="~/Icones/Standard/001_11.gif" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" ImageUrl="~/icones/Standard/001_45.gif" Text="Edit" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:TemplateField>
                <asp:BoundField DataField="razao_social" HeaderText="Razão Social" 
                    SortExpression="razao_social" ReadOnly="True" >
                    <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="nome_fantasia" HeaderText="Nome Fantasia" 
                    SortExpression="nome_fantasia" ReadOnly="True" >
                    <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="cnpj" HeaderText="CNPJ" SortExpression="cnpj" >
                    <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Senha" SortExpression="senha">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSenha" runat="server" Text='<%# Bind("senha") %>' 
                            TextMode="Password"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("senha") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="200px" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <span lang="pt-br" 
                    style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                Nenhum registro foi encontrado.</span>
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlMudaSenha" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT nome_fantasia, cnpj, senha, razao_social, id_empresa FROM tblEmpresa WHERE (cnpj LIKE '' + @cnpj + '%') AND (razao_social LIKE '' + @razao_social + '%' OR razao_social IS NULL) AND (nome_fantasia LIKE '' + @nome_fantasia + '%' OR nome_fantasia IS NULL) ORDER BY nome_fantasia" 
            
            
            
            
            
            UpdateCommand="UPDATE [tblEmpresa] SET  [senha] = @senha WHERE [id_empresa] = @original_id_empresa ">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCNPJ" Name="cnpj" PropertyName="Text" 
                    DefaultValue="%" />
                <asp:ControlParameter ControlID="txtRazao" Name="razao_social" 
                    PropertyName="Text" DefaultValue="%" />
                <asp:ControlParameter ControlID="txtNomeFantasia" Name="nome_fantasia" 
                    PropertyName="Text" DefaultValue="%" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="senha" Type="String" />
                <asp:Parameter Name="original_id_empresa" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlTrocaSenha" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
            InsertCommand="INSERT INTO tblLogTrocaSenha(identificador, usuario) VALUES (@identificador, @usuario)" 
            SelectCommand="SELECT [id_trocaSenha], [identificador], [usuario] FROM [tblLogTrocaSenha]">
            <InsertParameters>
                <asp:SessionParameter Name="identificador" SessionField="cnpj" />
                <asp:SessionParameter Name="usuario" SessionField="c_nome" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:Panel ID="Panel2" runat="server" Font-Size="7pt" Height="16px" 
            Width="320px">
            <asp:Label ID="lblAviso" runat="server" Font-Bold="True" Font-Names="Verdana" 
                Font-Size="14px" ForeColor="#0066CC" 
                style="color: #FF3300; font-size: xx-small;"></asp:Label>
        </asp:Panel>
      

                       
    </asp:Panel>
       
  </form>
</body>
</html>




