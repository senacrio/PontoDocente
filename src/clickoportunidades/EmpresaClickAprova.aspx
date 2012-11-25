<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="EmpresaClickAprova.aspx.vb" Inherits="EmpresaClickAprova" title="Untitled Page" Theme="AdmClick" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
  <link href="Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 94%;
        }
        .style2
        {
            margin-left: 0px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    
    <asp:Panel ID="Panel2" runat="server" Font-Size="7pt" 
        Width="775px">
        <asp:ScriptManager ID="ScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ScriptManager>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
            Visible="False">
            <asp:View ID="View1" runat="server">
                <asp:Panel ID="panAprovacao" runat="server" Font-Bold="True" 
                    Font-Names="Verdana" Font-Size="10px" ForeColor="#0066CC" 
                    ToolTip="Buscar pelo CNPJ da Empresa">
                   
               
                    <p style="font-size: 14px; font-family: verdana">Aprovação de empresas</p>
                    <span lang="pt-br">Clique na seta azul para selecionar a empresa, e depois nos 
                    botões para aprovar uma empresa. Após aprovação, uma mensagem
                    <br />
                    é enviada automaticamente para a empresa com dados de sua aprovação.<br />
                    <br />
                    Busca de empresa por:<br />
                    </span><br />
					<span lang="pt-br">&nbsp;</span><span lang="pt-br">&nbsp;</span><table 
                        cellpadding="0" cellspacing="0" class="style1">
                        <tr>
                            <td>
                                <span lang="pt-br">CNPJ:</span></td>
                            <td>
                                <asp:TextBox ID="txtCNPJ" runat="server" style="width: 128px" 
                                    ToolTip="Entre o nº do CNPJ da empresa"></asp:TextBox>
                                <asp:ImageButton ID="btnAprova" runat="server" ImageAlign="Top" 
                                    ImageUrl="~/Icones/Standard/001_38.gif" style="width: 14px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span lang="pt-br">Razão Social:</span></td>
                            <td>
                                <span lang="pt-br">
                                <asp:TextBox ID="txtRazao" runat="server" style="width: 128px" 
                                    ToolTip="Entre a razão social da empresa" Width="300px"></asp:TextBox>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span lang="pt-br">Nome Fantasia: </span>
                            </td>
                            <td>
                                <span lang="pt-br">
                                <asp:TextBox ID="txtNomeFantasia" runat="server" MaxLength="500" 
                                    style="width: 128px" ToolTip="Entre o nº do Fantasia da empresa" Width="300px"></asp:TextBox>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:RadioButtonList ID="rdAprovada" runat="server" AutoPostBack="True" 
                                    RepeatDirection="Horizontal" CssClass="style2">
                                    <asp:ListItem Value="2">Aprovada</asp:ListItem>
                                    <asp:ListItem Value="1">Não aprovada</asp:ListItem>
                                    <asp:ListItem Value="0">Em análise</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                     <asp:updatepanel ID="Up2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <br />
                    <asp:gridview ID="gridAprovacao" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_empresa" 
                        DataSourceID="sqlAprovacaoGrid" CellPadding="6" 
                        Font-Size="10px" ForeColor="#333333">
						<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerSettings FirstPageText="" LastPageText="" 
                            NextPageText="" PreviousPageText="" />
                        <RowStyle BackColor="#EFF3FB" />
						<Columns>
							<asp:CommandField ButtonType="Image" 
                                SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                ShowSelectButton="True" HeaderText="Selecione uma empresa" SelectText="" 
                                ShowHeader="True">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" /></asp:CommandField>
							<asp:TemplateField ShowHeader="False" HeaderText="Modificar Status"><ItemTemplate><asp:ImageButton ID="btnativar" runat="server" CausesValidation="False" 
                                        Enabled='<%# Eval("status") <> 2 %>' 
                                        ImageUrl="~/clickoportunidades/icones/Standard/power.png" 
                                        onclick="btnativar_Click" 
                                        onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                        ToolTip="Ativar Empresa" /><asp:ImageButton ID="btnInativar" runat="server" CausesValidation="False" 
                                        Enabled='<%# Eval("status") <> 1 %>' 
                                        ImageUrl="~/clickoportunidades/icones/Standard/close.png" 
                                        onclick="btnInativar_Click" 
                                        onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                        ToolTip="Desativar Empresa" /><asp:ImageButton ID="btnAnalisa" runat="server" CausesValidation="False" 
                                        Enabled='<%# Eval("status") <> 0 %>' 
                                        ImageUrl="~/clickoportunidades/icones/Standard/about.png" 
                                        onclick="btnAnalisa_Click" 
                                        onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                        ToolTip="Empresa em análise" /></ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle ForeColor="#0066FF" HorizontalAlign="Center" Width="150px" /></asp:TemplateField>
                            <asp:TemplateField HeaderText="Status " ShowHeader="False"><ItemTemplate><asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                        CommandName="Select" ImageUrl="~/icones/Standard/001_18.gif" Text="Select" 
                                        Visible='<%# Eval("status") = 2 %>' ToolTip="Empresa aprovada" /><asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                        ImageUrl="~/Icones/Standard/001_19.gif" 
                                        Visible='<%# Eval("status") = 1 %>' ToolTip="Empresa não aprovada" /><asp:ImageButton ID="ImageButton3" runat="server" 
                                        ImageUrl="~/clickoportunidades/icones/Standard/001_11.gif" 
                                        Visible='<%# Eval("status") = 0 %>' ToolTip="Empresa em análise" /></ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="100px" /></asp:TemplateField>
							<asp:boundfield DataField="id_empresa" HeaderText="Código" 
                                InsertVisible="False" ReadOnly="True" SortExpression="id_empresa" >
							<HeaderStyle HorizontalAlign="Center" />
                            </asp:boundfield>
							<asp:boundfield DataField="cnpj" HeaderText="CNPJ" SortExpression="cnpj" >
							<HeaderStyle HorizontalAlign="Center" />
                            </asp:boundfield>
							<asp:BoundField DataField="razao_social" HeaderText="Razão Social" 
                                SortExpression="razao_social">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="120px" /></asp:BoundField>
                            <asp:BoundField DataField="nome_fantasia" HeaderText="Nome fantasia" 
                                SortExpression="nome_fantasia" >
							<HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
							<asp:boundfield DataField="municipio" HeaderText="Municipio" 
                                SortExpression="municipio" >
							<HeaderStyle HorizontalAlign="Center" />
                            </asp:boundfield>
							<asp:TemplateField HeaderText="Representante" SortExpression="representante">
                                <ItemTemplate>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="Sqlrepresentantes" ShowHeader="False" GridLines="None" 
                                        Width="300px">
                                        <Columns>
                                            <asp:BoundField DataField="representante" HeaderText="representante" 
                                                SortExpression="representante" >
                                            <ItemStyle Width="150px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="telefones" SortExpression="telefones">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("telefones", "{0}") %>'></asp:Label>
                                                    /<asp:Label ID="Label2" runat="server" Text='<%# Bind("celular") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("emailrep", "{0}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("telefones") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="Sqlrepresentantes" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" SelectCommand="SELECT [representante], [telefones], [celular], [emailrep] FROM [tblEmpresaRepresentantes]
where id_empresa_fk=@id_empresa_fk">
                                        <SelectParameters>
                                            <asp:Parameter Name="id_empresa_fk" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("representante") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
						    <asp:TemplateField HeaderText="Nome de contato" SortExpression="nomecontato">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("nomecontato", "{0}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("nomecontato") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dados para contato" SortExpression="telcontato">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("telcontato") %>'></asp:Label>
                                    /
                                    <asp:Label ID="Label112" runat="server" Text='<%# Bind("celcontato", "{0}") %>'></asp:Label>
                                    &nbsp;<br />
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("emailcontato") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("telcontato") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
						    <asp:TemplateField HeaderText="Cancelada" SortExpression="Cancelada"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Cancelada") %>'></asp:TextBox></EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnCanceladaOK" runat="server" CausesValidation="False" 
                                        CommandName="Select" ImageUrl="~/icones/Standard/001_18.gif" Text="Select" 
                                        ToolTip="Empresa Cancelada" Visible='<%# Eval("cancelada") = 2 %>' />
                                    <asp:ImageButton ID="btnCanceladaNO" runat="server" CausesValidation="False" 
                                        ImageUrl="~/Icones/Standard/001_19.gif" ToolTip="Empresa não cancelada" 
                                        Visible='<%# Eval("cancelada") = 1 %>' />
                                    <asp:ImageButton ID="btnCanceladaAnalise" runat="server" 
                                        ImageUrl="~/clickoportunidades/icones/Standard/001_11.gif" 
                                        ToolTip="Empresa em análise" Visible='<%# Eval("cancelada") = 0 %>' />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
						</Columns>
						
					    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <span lang="pt-br" 
                                style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                            Nenhum registro foi encontrado.</span>
                        </EmptyDataTemplate>
                        <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
					</asp:gridview>
					 </ContentTemplate>
                </asp:updatepanel>
                    <br />
                    <asp:Label ID="lblAviso" runat="server"></asp:Label>
                    <br />
                   
               
                    <asp:SqlDataSource ID="sqlAprovacaoGrid" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        
                        
                        
                        
                        
                        
                        SelectCommand="SELECT tblEmpresa.id_empresa, tblEmpresa.razao_social, tblEmpresa.nome_fantasia, tblEmpresa.cnpj, tblMunicipio.nome AS municipio, tblEmpresa.aprovado, tblEmpresa.email, CASE tblempresa.aprovado WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END AS status, tblEmpresaRepresentantes.representante, tblEmpresaRepresentantes.telefones, tblEmpresaRepresentantes.id_empresa_fk, CASE tblempresa.cancelamento WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END AS Cancelada, tblEmpresa.ultima_atualizacao, tblEmpresa.nomecontato, tblEmpresa.telcontato, tblEmpresa.celcontato, tblEmpresa.emailcontato FROM tblEmpresa LEFT OUTER JOIN tblEmpresaRepresentantes ON tblEmpresa.id_empresa = tblEmpresaRepresentantes.id_empresa_fk LEFT OUTER JOIN tblMunicipio ON tblEmpresa.id_municipio = tblMunicipio.id_municipio WHERE (tblEmpresa.cnpj LIKE '' + @cnpj + '%') AND (tblEmpresa.razao_social LIKE '' + @razao_social + '%' OR tblEmpresa.razao_social IS NULL) AND (tblEmpresa.nome_fantasia LIKE '' + @nome_fantasia + '%' OR tblEmpresa.nome_fantasia IS NULL) AND (CASE tblempresa.aprovado WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END = @aprovado) ORDER BY tblEmpresa.ultima_atualizacao DESC" 
                        
                        
                        InsertCommand="INSERT INTO tblLogAprovacao(id_empresa_fk, usuario, status) VALUES (@id_empresa_fk, @usuario, @status)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtCNPJ" Name="cnpj" PropertyName="Text" 
                                DefaultValue="%" />
                            <asp:ControlParameter ControlID="txtRazao" Name="razao_social" 
                                PropertyName="Text" DefaultValue="%" />
                            <asp:ControlParameter ControlID="txtNomeFantasia" Name="nome_fantasia" 
                                PropertyName="Text" DefaultValue="%" />
                            <asp:ControlParameter ControlID="rdAprovada" DefaultValue="" Name="aprovado" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="id_empresa_fk" SessionField="id_empresa" />
                            <asp:SessionParameter Name="usuario" SessionField="c_nome" />
                            <asp:SessionParameter Name="status" SessionField="aprovado" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlAprovaEmp" runat="server" 
                        
                        UpdateCommand="UPDATE tblEmpresa SET aprovado = 'True', ultima_atualizacao = GETDATE() WHERE (id_empresa = @id_empresa)" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        SelectCommand="SELECT id_empresa FROM tblEmpresa">
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="gridAprovacao" Name="id_empresa" 
                                PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlInativaEmp" runat="server" 
                        
                        UpdateCommand="UPDATE [tblEmpresa] SET [aprovado] = 'False' WHERE [id_empresa] = @id_empresa" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" SelectCommand="SELECT     id_empresa
FROM         tblEmpresa">
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="gridAprovacao" Name="id_empresa" 
                                PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlAnaliseEmp" runat="server" 
                        
                        UpdateCommand="UPDATE [tblEmpresa] SET [aprovado] = NULL WHERE [id_empresa] = @id_empresa" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" SelectCommand="SELECT     id_empresa
FROM         tblEmpresa">
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="gridAprovacao" Name="id_empresa" 
                                PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlLogEmpresa" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        InsertCommand="INSERT INTO tblLogAprovacao(id_empresa_fk, usuario, status) VALUES (@id_empresa_fk, @usuario, @status)" 
                        SelectCommand="SELECT [id_empresa_fk], [usuario], [status], [id_logAprovacao] FROM [tblLogAprovacao]">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="gridAprovacao" Name="id_empresa_fk" 
                                PropertyName="SelectedValue" />
                            <asp:SessionParameter DefaultValue="" Name="usuario" SessionField="c_nome" />
                            <asp:SessionParameter DefaultValue="" Name="status" SessionField="aprovado" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <br />
                </asp:Panel>
            </asp:View>
        </asp:MultiView>
    </asp:Panel>

  </form>
</body>
</html>
