<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MudarSenha.aspx.vb" Inherits="MudarSenha" title="Untitled Page" Theme="AdmClick" %>

<%@ Register assembly="AspNetMaskedEdit" namespace="AspNetMaskedEdit" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
      <link href="App_Themes/Basico/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 51%;
        }
        .style2
        {
            margin-left: 0px;
        }
    </style>
</head>
<body>

    
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Font-Bold="True" Font-Size="14px" 
        ForeColor="#0066CC" Font-Names="Verdana">
        Mudar senha de Estudante <span lang="pt-br">no Click Oportunidades</span><br />
        <br />
        <span lang="pt-br" 
            style="font-family: verdana; font-size: 10px; font-weight: bold">Busca por:<br />
        <br />
        <table cellpadding="0" cellspacing="0" class="style1" 
            style="font-family: verdana; font-size: 10px; font-weight: bold">
            <tr>
                <td>
                    <span lang="pt-br">Nome: </span>
                </td>
                <td>
                    <span lang="pt-br">
                    <asp:TextBox ID="txtNome" runat="server" CssClass="style2" 
                        ToolTip="Digite o nome ou letras iniciais do nome do Estudante" Width="300px"></asp:TextBox>
                    <span lang="pt-br">
                    <asp:ImageButton ID="btnBuscar" runat="server" ImageAlign="Top" 
                        ImageUrl="~/Icones/Standard/001_38.gif" 
                        ToolTip="Clique aqui para efetuar a busca" />
                    </span></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span lang="pt-br">CPF:</span></td>
                <td>
                    <asp:TextBox ID="txtCPF" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        </span>
        <br />
        <asp:GridView ID="GridViewMudarSenha" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_candidato" 
            DataSourceID="SqlMudaSenha" GridLines="None" Width="600px">
            <PagerSettings Mode="NextPrevious" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" ImageUrl="~/Icones/Standard/001_39.gif" 
                            onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                            Text="Update" ToolTip="Atualizar dados" />
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" ImageUrl="~/Icones/Standard/001_11.gif" Text="Cancel" 
                            ToolTip="Cancelar " />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" ImageUrl="~/icones/Standard/001_45.gif" Text="Edit" 
                            ToolTip="Clique aqui para alterar Senha" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nome" SortExpression="nome">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNome" runat="server" Text='<%# Bind("nome") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("nome") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:BoundField DataField="identificador" HeaderText="Identificador" 
                    ReadOnly="True" SortExpression="identificador" >
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
            DeleteCommand="DELETE FROM [tblCandidato] WHERE [id_candidato] = @original_id_candidato AND [nome] = @original_nome AND [identificador] = @original_identificador AND [senha] = @original_senha" 
            InsertCommand="INSERT INTO [tblCandidato] ([nome], [identificador], [senha]) VALUES (@nome, @identificador, @senha)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT nome, identificador, senha, id_candidato FROM tblCandidato WHERE (nome LIKE '' + @nome + '%' OR nome IS NULL) AND (identificador LIKE '' + @identificador + '%' OR identificador IS NULL)" 
            
            
            
            UpdateCommand="UPDATE [tblCandidato] SET  [senha] = @senha WHERE [id_candidato] = @original_id_candidato ">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtNome" Name="nome" PropertyName="Text" 
                    DefaultValue="%" />
                <asp:ControlParameter ControlID="txtCPF" Name="identificador" 
                    PropertyName="Text" DefaultValue="%" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_id_candidato" Type="Int32" />
                <asp:Parameter Name="original_nome" Type="String" />
                <asp:Parameter Name="original_identificador" Type="String" />
                <asp:Parameter Name="original_senha" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="senha" Type="String" />
                <asp:Parameter Name="original_id_candidato" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="identificador" Type="String" />
                <asp:Parameter Name="senha" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlLogVaga" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
            DeleteCommand="DELETE FROM [tblLogTrocaSenha] WHERE [id_trocaSenha] = @original_id_trocaSenha AND [identificador] = @original_identificador AND [usuario] = @original_usuario AND [dataTroca] = @original_dataTroca" 
            InsertCommand="INSERT INTO [tblLogTrocaSenha] ([identificador], [usuario]) VALUES (@identificador, @usuario)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [id_trocaSenha], [identificador], [usuario], [dataTroca] FROM [tblLogTrocaSenha]" 
            UpdateCommand="UPDATE [tblLogTrocaSenha] SET [identificador] = @identificador, [usuario] = @usuario, [dataTroca] = @dataTroca WHERE [id_trocaSenha] = @original_id_trocaSenha AND [identificador] = @original_identificador AND [usuario] = @original_usuario AND [dataTroca] = @original_dataTroca">
            <DeleteParameters>
                <asp:Parameter Name="original_id_trocaSenha" Type="Int32" />
                <asp:Parameter Name="original_identificador" Type="String" />
                <asp:Parameter Name="original_usuario" Type="String" />
                <asp:Parameter Name="original_dataTroca" Type="DateTime" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="identificador" Type="String" />
                <asp:Parameter Name="usuario" Type="String" />
                <asp:Parameter Name="dataTroca" Type="DateTime" />
                <asp:Parameter Name="original_id_trocaSenha" Type="Int32" />
                <asp:Parameter Name="original_identificador" Type="String" />
                <asp:Parameter Name="original_usuario" Type="String" />
                <asp:Parameter Name="original_dataTroca" Type="DateTime" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter Name="identificador" SessionField="nome" />
                <asp:SessionParameter Name="usuario" SessionField="c_nome" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:Panel ID="Panel2" runat="server" Font-Size="7pt" Height="19px" 
            Width="225px">
            <asp:Label ID="lblAviso" runat="server" Font-Bold="True" Font-Names="Verdana" 
                Font-Size="14px" ForeColor="#0066CC" 
                style="color: #FF3300; font-size: xx-small;"></asp:Label>
        </asp:Panel>
      

                       
    </asp:Panel>
       
  </form>
</body>
</html>




