<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="AdmVisitaEmpresa.aspx.vb" Inherits="AdmVisitaEmpresa" title="Untitled Page" Theme="Basico" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="AspNetMaskedEdit" namespace="AspNetMaskedEdit" tagprefix="cc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
          .modalBackground 
       {    
        background-color:Gray;    
        filter:alpha(opacity=70);    
        opacity:0.7;
        }
        
        .modalPopup    
        {
        	background-color:#FFFFDD;    
        	border-width:3px;    
        	border-style:solid;    
        	border-color:Gray;    
        	padding:3px;    
        	width:250px;}

       .style1
       {
           height: 15px;
       }
       .style2
       {
       }
       
        .style3
        {
        }
       
        .style4
        {
            width: 100%;
        }
       
    </style>
    </head>
<body>


    <form id="form1" runat="server">


    <br />

    <asp:Panel ID="Panel2" runat="server" Font-Size="7pt" 
        Width="690px">
       <table style="width: 99%">
                <tr>
                    <td style="text-align: left; ">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12px" 
                            ForeColor="#FF6600" 
                            Text="Agendamento de visita as empresas" 
                            Width="233px"></asp:Label>
                        &nbsp;
                        <br />
                        <asp:Label ID="lblEmpresalogado" runat="server" CssClass="labelLaranjaPequeno"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style3" style="text-align: left; ">
                        <asp:Label ID="Label2" runat="server" Text="Usuário logado:"></asp:Label>
                        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlUsuario" 
                            DataTextField="Nome" DataValueField="IdUsuario" 
                            style="margin-top: 11px; margin-bottom: 0px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlUsuario" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT [IdUsuario], [Nome] FROM [admPortalUsuario]
where nome = @nome">
                            <SelectParameters>
                                <asp:SessionParameter Name="nome" SessionField="c_nome" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; ">
                        <br />
                    </td>
                </tr>
            </table>
           
    </asp:Panel>
    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" 
        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="1em" 
        ForeColor="#284E98" Orientation="Horizontal" StaticSubMenuIndent="10px" 
        Width="275px">
        <StaticSelectedStyle BackColor="#507CD1" Height="25px" />
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
        <DynamicMenuStyle BackColor="#B5C7DE" />
        <DynamicSelectedStyle BackColor="#507CD1" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <StaticHoverStyle BackColor="#284E98" ForeColor="White" Height="25px" />
        <Items>
            <asp:MenuItem Text="1 - Dados Cadastrais" Selected="true" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="2 - Agendamento de visita" Value="1" 
                ToolTip="Agendamento de visita"></asp:MenuItem>
            <asp:MenuItem Text="3 - Todos agendamentos" Value="2"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <br />
    <table class="style1">
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="Label4" runat="server" Text="Busca por:"></asp:Label>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Nome da empresa:"></asp:Label>
            <td>
                <asp:TextBox ID="txtBuscaEmpresa" runat="server"></asp:TextBox>
&nbsp;<asp:ImageButton ID="btnpesquisar" runat="server" 
                            ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" 
                    CausesValidation="False" ImageAlign="Middle" />
                        &nbsp;<asp:Label ID="Label5" runat="server" Text="Procurar"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                CNPJ:<td>
                <asp:TextBox ID="txtBuscaCNPJ" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Buscar empresa:</td>
            <td>
                <asp:DropDownList ID="cbonome_fantasia" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlbuscaEmpresa" DataTextField="nome_fantasia" 
                    DataValueField="id_empresa">
                </asp:DropDownList>
                             <asp:ImageButton ID="ibtSalvar0" runat="server" 
                                 ImageUrl="~/icones/Standard/001_06.gif" 
                                 ToolTip="Buscar empresa" CausesValidation="False" 
                    ImageAlign="Middle" />
                             &nbsp;<asp:Label ID="Label6" runat="server" 
                    Text="Clique no botão verde para preencher o formulário"></asp:Label>
                <asp:SqlDataSource 
                    ID="SqlbuscaEmpresa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT id_empresa, cnpj, ISNULL(nome_fantasia, 'Nome da empresa não cadastrado') AS nome_fantasia FROM tblEmpresa WHERE (nome_fantasia LIKE @nome_fantasia + '%' OR nome_fantasia IS NULL) AND (cnpj LIKE @cnpj + '%') AND (aprovado = 'true') ORDER BY nome_fantasia">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtBuscaEmpresa" Name="nome_fantasia" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtBuscaCNPJ" Name="cnpj" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                Itens no Combo estão em branco porque o nome fantasia ou razão social da empresa 
                não foi cadastrado.<br />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" BorderColor="#0066CC" BorderStyle="Solid" 
        BorderWidth="1px" Width="746px">
        <asp:MultiView ID="MultiView1" runat="server" 
    ActiveViewIndex="0">
            <asp:View ID="ViewCandidato" runat="server">
               
                <table style="width:100%;">
                    <tr>
                        <td style="font-family: verdana; font-size: 10px; color: #0066FF;" 
                            colspan="3">
                            <asp:Label ID="lblFaltarepresentante1" runat="server" CssClass="labelLaranja"></asp:Label>
</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            CNPJ:</td>
                        <td>
                            <asp:TextBox ID="txtCNPJ" runat="server" MaxLength="19" 
                                 Width="200px" Enabled="False" ReadOnly="True" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Razão Social:</td>
                        <td colspan="2">
                            <asp:TextBox ID="txtrazao_social" runat="server" MaxLength="300" 
                                Width="300px" ReadOnly="True" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator15" 
                                runat="server" ControlToValidate="txtrazao_social" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,300}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtrazao_social" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Nome Fantasia:</td>
                        <td colspan="2">
                            <asp:TextBox ID="txtnome_fantasia" runat="server" MaxLength="150" Width="300px" ReadOnly="True" 
                               />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator16" 
                                runat="server" ControlToValidate="txtnome_fantasia" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,150}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtnome_fantasia" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Endereço:</td>
                        <td colspan="2">
                            <asp:TextBox ID="txtendereco" runat="server" MaxLength="200" Width="300px" 
                                ReadOnly="True" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator17" 
                                runat="server" ControlToValidate="txtendereco" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,200}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtendereco" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Número:</td>
                        <td colspan="2">
                            <asp:TextBox ID="txtnumero" runat="server" MaxLength="20" ReadOnly="True" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator18" 
                                runat="server" ControlToValidate="txtnumero" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,50}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtnumero" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Complemento:</td>
                        <td>
                            <asp:TextBox ID="txtcomplemento" runat="server" MaxLength="50" 
                                ReadOnly="True" />
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator19" 
                                runat="server" ControlToValidate="txtcomplemento" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,50}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Bairro:</td>
                        <td colspan="2">
                            <asp:TextBox ID="txtbairro" runat="server" MaxLength="50" Width="200px" 
                                ReadOnly="True" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator20" 
                                runat="server" ControlToValidate="txtbairro" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,50}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtbairro" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Estado:</td>
                        <td>
                            <asp:DropDownList ID="cboestado" runat="server" 
                                DataSourceID="sqlEstadosLista" DataTextField="estado" 
                                DataValueField="estado" AutoPostBack="True" 
                                onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlEstadosLista" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT * FROM tblEstados">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Municipio:</td>
                        <td>
                            <asp:DropDownList ID="cboid_municipio" runat="server" 
                                DataSourceID="sqlMunicipioLista" DataTextField="nome" 
                                DataValueField="id_municipio">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlMunicipioLista" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT id_municipio, nome FROM tblMunicipio WHERE (estado_fk = @estado_fk)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cboestado" Name="estado_fk" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblEmpresaAviso" runat="server" CssClass="labelLaranja"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="sqlEmpresa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    DeleteCommand="DELETE FROM [tblEmpresa] WHERE [id_empresa] = @id_empresa" 
                    InsertCommand="INSERT INTO tblEmpresa(razao_social, nome_fantasia, cnpj, endereco, numero, complemento, bairro, id_municipio, estado, cep, site, id_porte_fk, total_funcionarios, id_sindicato_fk, id_atividade_fk, ultima_atualizacao, senha, id_cnae_fk, id_cnae_fkPai, id_descobriu_fk) VALUES (@razao_social, @nome_fantasia, @cnpj, @endereco, @numero, @complemento, @bairro, @id_municipio, @estado, @cep, @site, @id_porte_fk, @total_funcionarios, @id_sindicato_fk, @id_atividade_fk, @ultima_atualizacao, @senha, @cnae, @id_cnae_fkPai, @id_descobriu_fk)" 
                    SelectCommand="SELECT razao_social, nome_fantasia, cnpj, endereco, numero, complemento, id_empresa, bairro, id_municipio, estado, cep, site, id_porte_fk, total_funcionarios, id_sindicato_fk, id_atividade_fk, email, id_cnae_fk, id_cnae_fkPai, id_descobriu_fk FROM tblEmpresa WHERE (id_empresa = @id_empresa)" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE tblEmpresa SET razao_social = @razao_social, nome_fantasia = @nome_fantasia, cnpj = @cnpj, endereco = @endereco, numero = @numero, complemento = @complemento, bairro = @bairro, id_municipio = @id_municipio, estado = @estado, cep = @cep, site = @site, id_porte_fk = @id_porte_fk, total_funcionarios = @total_funcionarios, id_sindicato_fk = @id_sindicato_fk, id_atividade_fk = @id_atividade_fk, email = @email, id_cnae_fk = @id_cnae_fk, id_cnae_fkPai = @id_cnae_fkPai, id_descobriu_fk = @id_descobriu_fk WHERE (id_empresa = @id_empresa)" 
                    
                    
                    
                    
                    ProviderName="<%$ ConnectionStrings:SENACRJConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_empresa" SessionField="empresaID" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id_empresa" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="id_empresa" SessionField="EmpresaID" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtrazao_social" Name="razao_social" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtnome_fantasia" Name="nome_fantasia" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtCNPJ" Name="cnpj" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtendereco" Name="endereco" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtnumero" Name="numero" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtcomplemento" Name="complemento" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtbairro" Name="bairro" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="cboid_municipio" Name="id_municipio" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="cboestado" Name="estado" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtcep" Name="cep" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtsite" Name="site" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="cboid_porte_fk" Name="id_porte_fk" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txttotal_funcionarios" 
                            Name="total_funcionarios" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="cboid_sindicato_fk" Name="id_sindicato_fk" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="cboid_atividade_fk" Name="id_atividade_fk" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
                        <asp:ControlParameter ControlID="cboid_cnae_fk" Name="id_cnae_fk" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="cboid_cnae_fkPai" Name="id_cnae_fkPai" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="cboid_descobriu_fk" Name="id_descobriu_fk" 
                            PropertyName="SelectedValue" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="razao_social" Type="String" />
                        <asp:Parameter Name="nome_fantasia" Type="String" />
                        <asp:Parameter Name="cnpj" Type="String" />
                        <asp:Parameter Name="endereco" Type="String" />
                        <asp:Parameter Name="numero" Type="String" />
                        <asp:Parameter Name="complemento" Type="String" />
                        <asp:Parameter Name="bairro" Type="String" />
                        <asp:Parameter Name="id_municipio" Type="Int32" />
                        <asp:Parameter Name="estado" Type="String" />
                        <asp:Parameter Name="cep" Type="String" />
                        <asp:Parameter Name="site" Type="String" />
                        <asp:Parameter Name="id_porte_fk" Type="Int32" />
                        <asp:Parameter Name="total_funcionarios" Type="Int32" />
                        <asp:Parameter Name="id_sindicato_fk" Type="Int32" />
                        <asp:Parameter Name="id_atividade_fk" Type="Int32" />
                        <asp:Parameter Name="ultima_atualizacao" Type="DateTime" />
                        <asp:Parameter Name="senha" Type="String" />
                        <asp:Parameter Name="cnae" />
                        <asp:Parameter Name="id_cnae_fkPai" />
                        <asp:Parameter Name="id_descobriu_fk" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gridRepresentantes" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="id_representante" 
                    DataSourceID="SqlRepresentantesGrid">
                    <Columns>
                        <asp:BoundField DataField="representante" HeaderText="Representante" 
                            SortExpression="representante" />
                        <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                        <asp:BoundField DataField="telefones" HeaderText="Telefones" 
                            SortExpression="telefones" />
                        <asp:BoundField DataField="celular" HeaderText="Celular" 
                            SortExpression="celular" />
                        <asp:BoundField DataField="emailrep" HeaderText="E-mail" 
                            SortExpression="email" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlRepresentantesGrid" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    DeleteCommand="DELETE FROM tblEmpresaRepresentantes WHERE (id_representante = @id_representante)" 
                    InsertCommand="INSERT INTO tblEmpresaRepresentantes(id_empresa_fk, representante, cargo, telefones, celular, emailrep) VALUES (@id_empresa_fk, @representante, @cargo, @telefones, @celular, @email)" 
                    SelectCommand="SELECT id_empresa_fk, representante, cargo, telefones, celular, emailrep, id_representante FROM tblEmpresaRepresentantes WHERE (id_empresa_fk = @id_empresa_fk)" 
                    UpdateCommand="UPDATE tblEmpresaRepresentantes SET id_empresa_fk = @id_empresa_fk, representante = @representante, cargo = @cargo, telefones = @telefones, emailrep = @emailrep, celular = @celular WHERE (id_representante = @id_representante)">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_empresa_fk" SessionField="EmpresaID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="id_empresa_fk" SessionField="EmpresaID" />
                        <asp:ControlParameter ControlID="txtRepresentante" Name="representante" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtCargo" Name="cargo" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTelefones" Name="telefones" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtEmailrep" Name="emailrep" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtCelular" Name="celular" 
                            PropertyName="Text" />
                        <asp:SessionParameter Name="id_representante" SessionField="id_representante" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="id_empresa_fk" SessionField="EmpresaID" />
                        <asp:ControlParameter ControlID="txtRepresentante" Name="representante" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtCargo" Name="cargo" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTelefones" Name="telefones" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtCelular" Name="celular" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtEmailrep" Name="email" 
                            PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </asp:View>
             <br />
            <asp:View ID="ViewVisita" runat="server">
                <table class="style4">
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Data da visita:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="datdatavisita" runat="server" Width="80px"></asp:TextBox>
                            <cc1:CalendarExtender ID="visita_CalendarExtender" runat="server" 
                                TargetControlID="datdatavisita">
                            </cc1:CalendarExtender>
                            &nbsp;<asp:Label ID="lblmensagemBotao" runat="server" ForeColor="#FF6600"></asp:Label>
                            <asp:ScriptManager ID="ScriptManager1" runat="server" 
                                EnableScriptGlobalization="True">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Hora da visita:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txthoravisita" runat="server" AutoPostBack="True" Width="60px" 
                                ToolTip="Formato de hora 00:00"></asp:TextBox>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator21" 
                                runat="server" ControlToValidate="txthoravisita" 
                                ErrorMessage="Horário inválido" 
                                ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$"></asp:RegularExpressionValidator>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="txthoravisita" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Label ID="Label9" runat="server" Text="Assunto:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="cboid_assunto_fk" runat="server" 
                                DataSourceID="SqlAssunto" DataTextField="assunto" 
                                DataValueField="id_assuntovisita">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlAssunto" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT [id_assuntovisita], [assunto] FROM [tblVisitaAssunto]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Captador 1:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="cboid_captador1" runat="server" DataSourceID="SqlUsuario0" 
                                DataTextField="Nome" DataValueField="IdUsuario">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlUsuario0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                                SelectCommand="SELECT admPortalUsuario.Nome, admPortalPerfil.Descricao, admPortalUsuario.IdUsuario FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario INNER JOIN admPortalPerfil ON admPortalPerfilUsuario.IdPerfil = admPortalPerfil.IdPerfil WHERE (admPortalPerfil.Descricao = 'Click Adm')">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="Captador 2:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="cboid_captador2" runat="server" 
                                DataSourceID="SqlUsuario0" DataTextField="Nome" DataValueField="IdUsuario">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Label ID="Label10" runat="server" Text="Observação:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:TextBox ID="txtobservacao" runat="server" AutoCompleteType="Disabled" 
                                Rows="3" TextMode="MultiLine" Width="300px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtobservacao" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text="Cadastrou vaga?"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="cbocadastrouVaga" runat="server">
                                <asp:ListItem Value="2">Sim</asp:ListItem>
                                <asp:ListItem Value="1">Não</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" colspan="2">
                            <asp:SqlDataSource ID="SqlVisitaForm" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                InsertCommand="INSERT INTO tblEmpresaVisita(id_empresa_fk, datavisita, horavisita, id_assunto_fk, id_captador1, id_captador2, observacao, cadastrouVaga) VALUES (@id_empresa_fk, @datavisita, @horavisita, @id_assunto_fk, @id_captador1, @id_captador2, @observacao, @cadastrouVaga)" 
                                SelectCommand="SELECT [id_visita], [id_empresa_fk], [datavisita], [horavisita], [id_assunto_fk], [id_captador1], [id_captador2], [observacao], [cadastrouVaga] FROM [tblEmpresaVisita]
where id_visita=@id_visita" 
                                
                                UpdateCommand="UPDATE tblEmpresaVisita SET datavisita = @datavisita, horavisita = @horavisita, id_assunto_fk = @id_assunto_fk, id_captador1 = @id_captador1, id_captador2 = @id_captador2, observacao = @observacao, cadastrouVaga = @cadastrouVaga WHERE (id_visita = @id_visita)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="id_visita" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="datdatavisita" DbType="DateTime" 
                                        Name="datavisita" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txthoravisita" Name="horavisita" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cboid_assunto_fk" Name="id_assunto_fk" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="cboid_captador1" Name="id_captador1" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="cboid_captador2" Name="id_captador2" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtobservacao" Name="observacao" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cbocadastrouVaga" Name="cadastrouVaga" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="GridView1" Name="id_visita" 
                                        PropertyName="SelectedValue" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:SessionParameter Name="id_empresa_fk" SessionField="empresaID" />
                                    <asp:ControlParameter ControlID="datdatavisita" Name="datavisita" 
                                        PropertyName="Text" DbType="DateTime" />
                                    <asp:ControlParameter ControlID="txthoravisita" Name="horavisita" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter Name="id_assunto_fk" ControlID="cboid_assunto_fk" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter Name="id_captador1" ControlID="cboid_captador1" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="cboid_captador2" Name="id_captador2" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtobservacao" Name="observacao" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cbocadastrouVaga" Name="cadastrouVaga" 
                                        PropertyName="SelectedValue" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style4" colspan="2">
                            <asp:ImageButton ID="ImageButton6" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" />
                            &nbsp;<asp:Label ID="Label16" runat="server" Text="Adicionar visita"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" colspan="2">
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                ValidationGroup="insereEvento" />
                            &nbsp;<asp:Label ID="Label14" runat="server" Text="Alterar dados da visita"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" colspan="2">
                            <asp:ImageButton ID="ImageButton5" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                                ValidationGroup="insereEvento" />
                            &nbsp;<asp:Label ID="Label15" runat="server" Text="Cancelar operação"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" colspan="2">
                            &nbsp;Lista de todas as visitas agendadas:<br />
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_visita" 
                                DataSourceID="SqlVisita">
                                <Columns>
                                    <asp:CommandField ButtonType="Image" HeaderText="Selecionar" 
                                        SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                        ShowSelectButton="True">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="id_visita" HeaderText="Código da visita" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="id_visita" />
                                    <asp:TemplateField HeaderText="Data da visita" SortExpression="datavisita">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("datavisita") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("datavisita", "{0:D}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="horavisita" HeaderText="Horário" 
                                        SortExpression="horavisita" />
                                    <asp:BoundField DataField="observacao" HeaderText="Observação" 
                                        SortExpression="observacao" />
                                    <asp:BoundField DataField="cadastrouVaga" HeaderText="Cadastrou vaga?" 
                                        SortExpression="cadastrouVaga" />
                                    <asp:BoundField DataField="Nome" HeaderText="Captador 1" 
                                        SortExpression="Nome" />
                                    <asp:BoundField DataField="captador2" HeaderText="Captador 2" 
                                        SortExpression="captador2" />
                                    <asp:BoundField DataField="assunto" HeaderText="Assunto" 
                                        SortExpression="assunto" />
                                    <asp:BoundField DataField="nome_fantasia" HeaderText="Empresa" 
                                        SortExpression="nome_fantasia" />
                                    <asp:CommandField ButtonType="Image" 
                                        DeleteImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                        HeaderText="Excluir" ShowDeleteButton="True">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" colspan="2">
                            <asp:SqlDataSource ID="SqlVisita" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                
                                SelectCommand="SELECT tblEmpresaVisita.id_visita, tblEmpresaVisita.datavisita, tblEmpresaVisita.horavisita, tblEmpresaVisita.observacao, tblEmpresaVisita.cadastrouVaga, View_IntranetUsuario.Nome, View_IntranetUsuario_1.Nome AS captador2, tblVisitaAssunto.assunto, tblEmpresa.nome_fantasia, tblEmpresaVisita.id_empresa_fk FROM tblEmpresaVisita INNER JOIN View_IntranetUsuario ON tblEmpresaVisita.id_captador1 = View_IntranetUsuario.IdUsuario INNER JOIN View_IntranetUsuario AS View_IntranetUsuario_1 ON tblEmpresaVisita.id_captador2 = View_IntranetUsuario_1.IdUsuario INNER JOIN tblVisitaAssunto ON tblEmpresaVisita.id_assunto_fk = tblVisitaAssunto.id_assuntovisita LEFT OUTER JOIN tblEmpresa ON tblEmpresaVisita.id_empresa_fk = tblEmpresa.id_empresa WHERE (tblEmpresaVisita.id_empresa_fk = @id_empresa_fk) ORDER BY tblEmpresaVisita.datavisita" 
                                DeleteCommand="DELETE FROM tblEmpresaVisita WHERE (id_visita = @id_visita)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_empresa_fk" SessionField="EmpresaId" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="id_visita" 
                                        PropertyName="SelectedValue" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:View>
            
            <asp:View ID="View1" runat="server">
                Todas visitas agendadas:<br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_visita" 
                    DataSourceID="SqlVisita0">
                    <Columns>
                        <asp:CommandField ButtonType="Image" HeaderText="Selecionar" 
                            SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                            ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:BoundField DataField="id_visita" HeaderText="Código da visita" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_visita" />
                        <asp:TemplateField HeaderText="Data da visita" SortExpression="datavisita">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("datavisita") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label17" runat="server" 
                                    Text='<%# Bind("datavisita", "{0:D}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="horavisita" HeaderText="Horário" 
                            SortExpression="horavisita" />
                        <asp:BoundField DataField="observacao" HeaderText="Observação" 
                            SortExpression="observacao" />
                        <asp:BoundField DataField="cadastrouVaga" HeaderText="Cadastrou vaga?" 
                            SortExpression="cadastrouVaga" />
                        <asp:BoundField DataField="Nome" HeaderText="Captador 1" 
                            SortExpression="Nome" />
                        <asp:BoundField DataField="captador2" HeaderText="Captador 2" 
                            SortExpression="captador2" />
                        <asp:BoundField DataField="assunto" HeaderText="Assunto" 
                            SortExpression="assunto" />
                        <asp:BoundField DataField="nome_fantasia" HeaderText="Empresa" 
                            SortExpression="nome_fantasia" />
                        <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                            HeaderText="Excluir" ShowDeleteButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlVisita0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    DeleteCommand="DELETE FROM tblEmpresaVisita WHERE (id_visita = @id_visita)" 
                    SelectCommand="SELECT tblEmpresaVisita.id_visita, tblEmpresaVisita.datavisita, tblEmpresaVisita.horavisita, tblEmpresaVisita.observacao, tblEmpresaVisita.cadastrouVaga, View_IntranetUsuario.Nome, View_IntranetUsuario_1.Nome AS captador2, tblVisitaAssunto.assunto, tblEmpresa.nome_fantasia, tblEmpresaVisita.id_empresa_fk FROM tblEmpresaVisita INNER JOIN View_IntranetUsuario ON tblEmpresaVisita.id_captador1 = View_IntranetUsuario.IdUsuario INNER JOIN View_IntranetUsuario AS View_IntranetUsuario_1 ON tblEmpresaVisita.id_captador2 = View_IntranetUsuario_1.IdUsuario INNER JOIN tblVisitaAssunto ON tblEmpresaVisita.id_assunto_fk = tblVisitaAssunto.id_assuntovisita LEFT OUTER JOIN tblEmpresa ON tblEmpresaVisita.id_empresa_fk = tblEmpresa.id_empresa  ORDER BY tblEmpresaVisita.datavisita">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="id_visita" 
                            PropertyName="SelectedValue" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </asp:View>
            
            <br />
       
        </asp:MultiView>
    </asp:Panel>
</div>
   </form>
    </body>
</html>




