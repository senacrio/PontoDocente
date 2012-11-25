<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="AdmAlterarEmpresa.aspx.vb" Inherits="AdmAlterarEmpresa" title="Untitled Page" Theme="Basico" %>

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
            width: 65px;
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
                    <td style="text-align: left; " colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10px" 
                            ForeColor="#FF6600" 
                            Text="*Atenção: Qualquer operação efetuada nessa área é de responsabilidade única do Click Oportunidades, essas operações são registradas." 
                            Width="650px"></asp:Label>
                        &nbsp;
                        <asp:Label ID="lblEmpresalogado" runat="server" CssClass="labelLaranjaPequeno"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style3" style="text-align: left; ">
                        <asp:Label ID="Label2" runat="server" Text="Usuário logado:"></asp:Label>
                    </td>
                    <td style="text-align: left; ">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlUsuario" 
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
                    <td style="text-align: left; " colspan="2">
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
            <asp:MenuItem Text="1º - Dados Cadastrais" Selected="true" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="2º - Representante da Empresa" Value="1" 
                ToolTip="Representante"></asp:MenuItem>
            <asp:MenuItem Text="Administração de conta" Value="3"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <br />
    <table class="style1">
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="Label4" runat="server" Text="Busca por empresas aprovadas:"></asp:Label>
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
                             &nbsp;Clique no botão verde para preencher o formulário<asp:SqlDataSource 
                    ID="SqlbuscaEmpresa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT id_empresa, nome_fantasia, cnpj, razao_social FROM tblEmpresa WHERE (nome_fantasia LIKE '' + @nome_fantasia + '%' OR nome_fantasia IS NULL) and  (cnpj LIKE '' + @cnpj+ '%' OR cnpj IS NULL) AND (aprovado = 'true') ORDER BY nome_fantasia">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtBuscaEmpresa" Name="nome_fantasia" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtCNPJ" Name="cnpj" PropertyName="Text" />
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
            <asp:View ID="View1" runat="server">
               
                <table style="width:100%;">
                    <tr>
                        <td style="font-family: verdana; font-size: 10px; color: #0066FF;" 
                            colspan="3">
                            Preencha os campos a seguir, com as informações solicitadas.
                            <br />
                            <br />
                            Ao final, clique no botão verde abaixo da tela para salvar as informações, volte 
                            ao topo da página e siga para a próxima etapa – Representante da Empresa.<br />
                            <br />
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
                                 Width="200px" Enabled="False" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Razão Social:</td>
                        <td colspan="2">
                            <asp:TextBox ID="txtrazao_social" runat="server" MaxLength="300" 
                                Width="300px" />
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
                            <asp:TextBox ID="txtnome_fantasia" runat="server" MaxLength="150" Width="300px" 
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
                            <asp:TextBox ID="txtendereco" runat="server" MaxLength="200" Width="300px" />
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
                            <asp:TextBox ID="txtnumero" runat="server" MaxLength="20" />
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
                            <asp:TextBox ID="txtcomplemento" runat="server" MaxLength="50" />
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
                            <asp:TextBox ID="txtbairro" runat="server" MaxLength="50" Width="200px" />
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
                                
                                SelectCommand="SELECT nome, id_municipio FROM tblMunicipio WHERE (estado_fk = @estado_fk) AND (id_municipio &lt;&gt; 0)">
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
                        <td style="width: 151px">
                            CEP</td>
                        <td colspan="2">
                            <asp:TextBox ID="txtcep" runat="server" MaxLength="9" />
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator21" 
                                runat="server" ControlToValidate="txtcep" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,10}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtcep" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Site:</td>
                        <td colspan="2">
                            <asp:TextBox ID="txtsite" runat="server" MaxLength="150" Width="300px" />
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator22" 
                                runat="server" ControlToValidate="txtsite" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,150}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Porte:</td>
                        <td>
                            <asp:DropDownList ID="cboid_porte_fk" runat="server" 
                                DataSourceID="sqlPorteLista" DataTextField="porte" DataValueField="id_porte">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlPorteLista" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT [id_porte], [porte] FROM [tblEmpresaPorte] ORDER BY [id_porte]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            No.Funcionários:</td>
                        <td colspan="2">
                            <asp:TextBox ID="txttotal_funcionarios" runat="server" Width="60px" />
                            &nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" 
                                ControlToValidate="txttotal_funcionarios" 
                                ErrorMessage="Informe um número válido" Operator="GreaterThan" Type="Integer" 
                                ValueToCompare="0"></asp:CompareValidator>
                            &nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator23" 
                                runat="server" ControlToValidate="txttotal_funcionarios" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,10}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            CNAE:</td>
                        <td colspan="2">
                            <asp:DropDownList ID="cboid_cnae_fkPai" runat="server" 
                                DataSourceID="sqlCNAE" DataTextField="Denominacao" 
                                DataValueField="Codigo" AutoPostBack="True" Width="600px" Font-Size="10px">
                            </asp:DropDownList>
                            <br />
                            <asp:SqlDataSource ID="sqlCNAE" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                
                                
                                
                                
                                SelectCommand="SELECT NULL AS codigo, 'Selecione' AS denominacao UNION ALL SELECT codigoCNAE + divisao + grupo + classe AS Codigo, denominacao AS Denominacao FROM tblCNAE WHERE (Tipo = 'CNAEGrupo') ORDER BY denominacao">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            &nbsp;</td>
                        <td>
                            <asp:DropDownList ID="cboid_cnae_fk" runat="server" 
                                DataSourceID="sqlCNAEClasses" DataTextField="denominacao" 
                                DataValueField="id_cnae" Font-Size="10px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlCNAEClasses" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                
                                
                                SelectCommand="SELECT NULL AS id_cnae, 'Selecione' AS denominacao UNION ALL SELECT id_cnae, denominacao FROM tblCNAE WHERE (SUBSTRING(classe, 1, 4) = SUBSTRING(@grupo, 4, 7)) AND (Tipo IS NOT NULL)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cboid_cnae_fkPai" Name="grupo" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Label ID="lblAvisoCNAE" runat="server" 
                                style="color: #FF3300; font-size: xx-small"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Atividade:</td>
                        <td>
                            <br />
                            <asp:DropDownList ID="cboid_atividade_fk" runat="server" 
                                DataSourceID="sqlAtividadesLista" DataTextField="atividade" 
                                DataValueField="id_atividade">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlAtividadesLista" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                
                                SelectCommand="SELECT [id_atividade], [atividade] FROM [tblEmpresaAtividades] ORDER BY [id_atividade]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Afiliado à algum sindicato patronal?</td>
                        <td colspan="2">
                            <asp:DropDownList ID="cboid_sindicato_fk" runat="server" 
                                DataSourceID="sqlSindicatoLista" DataTextField="sindicato" 
                                DataValueField="id_sindicato" Font-Size="10px" Width="500px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlSindicatoLista" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT [id_sindicato], [sindicato] FROM [tblSindicatos] ORDER BY [id_sindicato]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            Como descobriu o Click?</td>
                        <td>
                            <asp:DropDownList ID="cboid_descobriu_fk" runat="server" 
                                DataSourceID="SqlDescobriuClick" DataTextField="descobriu" 
                                DataValueField="id_descobriu">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDescobriuClick" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT [descobriu], [id_descobriu] FROM [tblEmpresaDescobriu]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            E-mail:</td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator24" 
                                runat="server" ControlToValidate="txtEmail" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." 
                                ValidationExpression="^[\s\S]{0,50}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-size: 12px; color: #0066CC;">
                            DADOS PARA CONTATO NA EMPRESA:</td>
                        <td>
                            &nbsp;</td>
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
                            <asp:Label ID="lblcomentario0" runat="server" Font-Size="12px" 
                                Text="Nome do contato na empresa:" Width="170px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtnomecontato" runat="server" Width="300px"></asp:TextBox>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            <asp:Label ID="lblcomentario1" runat="server" Font-Size="12px" Text="Telefone:" 
                                Width="160px"></asp:Label>
                        </td>
                        <td>
                            <cc2:MaskedEditAspNet ID="txttelcontato" runat="server" BorderStyle="None" 
                                CssClass="input" Mask="(##)####-####" 
                                style="font-family: Arial, Helvetica, sans-serif; font-size: 9pt; color: #333333; border-left: 1px solid #006699; border-right:1px solid #006699; border-top:1px solid #006699; border-bottom:1px solid #006699" 
                                Width="100px"></cc2:MaskedEditAspNet>
                            &nbsp;<asp:Label ID="Label23" runat="server" Font-Size="10px" ForeColor="#0066CC" 
                                Text="* Formato apenas números Ex. 21 1234 5678"></asp:Label>
                            &nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator31" 
                                runat="server" ControlToValidate="txttelcontato" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." SetFocusOnError="True" 
                                ValidationExpression="^[\s\S]{0,100}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            <asp:Label ID="lblcomentario2" runat="server" Font-Size="12px" Text="Celular:"></asp:Label>
                        </td>
                        <td>
                            <cc2:MaskedEditAspNet ID="txtCelcontato" runat="server" CssClass="input" 
                                Mask="(##)####-####" 
                                style="font-family: Arial, Helvetica, sans-serif; font-size: 9pt; color: #333333; border-left: 1px solid #006699; border-right:1px solid #006699; border-top:1px solid #006699; border-bottom:1px solid #006699" 
                                Width="100px"></cc2:MaskedEditAspNet>
                            &nbsp;<asp:Label ID="Label24" runat="server" Font-Size="10px" ForeColor="#0066CC" 
                                Text="* Formato apenas números Ex. 21 1234 5678"></asp:Label>
                            &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator32" 
                                runat="server" ControlToValidate="txtcelcontato" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." SetFocusOnError="True" 
                                ValidationExpression="^[\s\S]{0,100}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 151px">
                            <asp:Label ID="lblcomentario3" runat="server" Font-Size="12px" Text="E-mail:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmailcontato" runat="server" Width="200px"></asp:TextBox>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator33" 
                                runat="server" ControlToValidate="txtEmailcontato" 
                                ErrorMessage="Valor máximo de dígitos foi atingido." SetFocusOnError="True" 
                                ValidationExpression="^[\s\S]{0,100}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                            &nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator34" 
                                runat="server" ControlToValidate="txtEmailcontato" 
                                ErrorMessage="Por favor, informe um email válido" SetFocusOnError="True" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            &nbsp;</td>
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
                            <asp:ImageButton ID="ibtSalvarEmpresa" runat="server" CommandName="update" 
                                ImageUrl="~/icones/Standard/001_06.gif" ToolTip="Salvar dados da empresa" />
                            &nbsp;<asp:ImageButton ID="ibtCancelar" runat="server" CausesValidation="False" 
                                CommandName="cancel" ImageUrl="~/icones/Standard/001_05.gif" 
                                ToolTip="Cancelar " />
                        </td>
                        <td>
                            &nbsp;</td>
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
                    SelectCommand="SELECT razao_social, nome_fantasia, cnpj, endereco, numero, complemento, id_empresa, bairro, id_municipio, estado, cep, site, id_porte_fk, total_funcionarios, id_sindicato_fk, id_atividade_fk, email, id_cnae_fk, id_cnae_fkPai, id_descobriu_fk, nomecontato, telcontato, celcontato, emailcontato FROM tblEmpresa WHERE (id_empresa = @id_empresa)" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE tblEmpresa SET razao_social = @razao_social, nome_fantasia = @nome_fantasia, cnpj = @cnpj, endereco = @endereco, numero = @numero, complemento = @complemento, bairro = @bairro, id_municipio = @id_municipio, estado = @estado, cep = @cep, site = @site, id_porte_fk = @id_porte_fk, total_funcionarios = @total_funcionarios, id_sindicato_fk = @id_sindicato_fk, id_atividade_fk = @id_atividade_fk, email = @email, id_cnae_fk = @id_cnae_fk, id_cnae_fkPai = @id_cnae_fkPai, id_descobriu_fk = @id_descobriu_fk, nomecontato = @nomecontato, telcontato = @telcontato, celcontato = @celcontato, emailcontato = @emailcontato WHERE (id_empresa = @id_empresa)" 
                    
                    
                    
                    
                    
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
                        <asp:ControlParameter ControlID="txtnomecontato" Name="nomecontato" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttelcontato" Name="telcontato" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtCelcontato" Name="celcontato" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtEmailcontato" Name="emailcontato" 
                            PropertyName="Text" />
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
                <asp:SqlDataSource ID="SqlAlteraEmpresa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    InsertCommand="INSERT INTO tblLogAlteraEmpresa(id_empresa, nome, dataAteracao, acao) VALUES (@id_empresa, @nome, GETDATE(), 'Atualizou empresa')" 
                    SelectCommand="SELECT [id_empresa], [id_alteraEmpresa], [nome], [dataAteracao] FROM [tblLogAlteraEmpresa]">
                    <InsertParameters>
                        <asp:SessionParameter Name="id_empresa" SessionField="EmpresaID" />
                        <asp:SessionParameter Name="nome" SessionField="c_nome" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </asp:View>
             <br />
            <asp:View ID="ViewListaRepresentantes" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td style="font-family: verdana; font-size: 10px; color: #0066FF;">
                            O preenchimento desse campo é fundamental, pois indica a (s) pessoa (s) que irá 
                            (ão) interagir com a Equipe do Click Oportunidades. É importante que seja 
                            indicado mais de um representante.
                            <br />
                            <br />
                            Se você preencheu devidamente os campos de todas as telas, completou, com 
                            sucesso, o cadastro de sua empresa no Click Oportunidades.
</td>
                    </tr>
                    <tr>
                        <td style="font-family: verdana; font-size: 10px; font-weight: bold; color: #0066FF;">
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:GridView ID="gridRepresentantes" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="id_representante" 
                    DataSourceID="SqlRepresentantesGrid">
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            SelectImageUrl="~/icones/Standard/001_58.gif" 
                            SelectText="Selecione um representante" ShowSelectButton="True" />
                        <asp:BoundField DataField="representante" HeaderText="Representante" 
                            SortExpression="representante" />
                        <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                        <asp:BoundField DataField="telefones" HeaderText="Telefones" 
                            SortExpression="telefones" />
                        <asp:BoundField DataField="celular" HeaderText="Celular" 
                            SortExpression="celular" />
                        <asp:BoundField DataField="emailrep" HeaderText="E-mail" 
                            SortExpression="email" />
                        <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" ImageUrl="~/icones/Standard/001_05.gif" 
                                    onclick="ImageButton1_Click1" 
                                    onclientclick="if(confirm('Deseja confirmar a exclusão? ')){return true}else{return false}" 
                                    Text="Excluir representante" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:ImageButton ID="ibtRepresentanteIncluir" runat="server" 
                    ImageUrl="~/icones/Standard/001_01.gif" 
                    ToolTip="Adicionar novo representante" ImageAlign="Middle" />
                <asp:Label ID="lblAvisoRepresentante" runat="server" CssClass="labelLaranja"></asp:Label>
                &nbsp; <asp:Label ID="lblFaltarepresentante2" runat="server" CssClass="labelLaranja"></asp:Label>
                <br />
                <br />
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
                <br />
            </asp:View>
            <br />
             <asp:View ID="View2" runat="server">
                <h6>Representante</h6>
                 <table style="width:126%;">
                     <tr>
                         <td colspan="2">
                             <asp:Label ID="lblFaltarepresentante3" runat="server" CssClass="labelLaranja"></asp:Label>
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td style="width: 103px">
                             &nbsp;</td>
                         <td style="width: 291px">
                             &nbsp;</td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td style="width: 103px">
                             Representante:</td>
                         <td colspan="2">
                             <asp:TextBox ID="txtRepresentante" runat="server" 
                                 ToolTip="Informe representante" Width="300px" />
                             &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator25" 
                                 runat="server" ControlToValidate="txtcep" 
                                 ErrorMessage="Valor máximo de dígitos foi atingido." 
                                 ValidationExpression="^[\s\S]{0,100}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                             &nbsp;<asp:RequiredFieldValidator ID="valRepresentante" runat="server" 
                                 ControlToValidate="txtRepresentante" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td style="width: 103px">
                             Cargo:</td>
                         <td colspan="2">
                             <asp:TextBox ID="txtCargo" runat="server" ToolTip="Informe o cargo" 
                                 Width="200px" />
                             &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator26" 
                                 runat="server" ControlToValidate="txtcep" 
                                 ErrorMessage="Valor máximo de dígitos foi atingido." 
                                 ValidationExpression="^[\s\S]{0,50}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                             &nbsp;<asp:RequiredFieldValidator ID="valCargo" runat="server" 
                                 ControlToValidate="txtCargo" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td style="width: 103px">
                             Telefones:</td>
                         <td colspan="2">
                             <cc2:MaskedEditAspNet ID="txtTelefones" runat="server" 
                                 style="font-family: Arial, Helvetica, sans-serif; font-size: 9pt; color: #333333; border-left: 1px solid #006699; border-right:1px solid #006699; border-top:1px solid #006699; border-bottom:1px solid #006699" 
                                 Mask="(##)####-####" Width="100px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </cc2:MaskedEditAspNet>
                             &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator27" 
                                 runat="server" ControlToValidate="txtcep" 
                                 ErrorMessage="Valor máximo de dígitos foi atingido." 
                                 ValidationExpression="^[\s\S]{0,100}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                             &nbsp;<asp:RequiredFieldValidator ID="valTelefones" runat="server" 
                                 ControlToValidate="txtTelefones" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td style="width: 103px">
                             Celular:</td>
                         <td colspan="2">
                             <cc2:MaskedEditAspNet ID="txtCelular" runat="server" Mask="(##)####-####" 
                                 style="font-family: Arial, Helvetica, sans-serif; font-size: 9pt; color: #333333; border-left: 1px solid #006699; border-right:1px solid #006699; border-top:1px solid #006699; border-bottom:1px solid #006699" 
                                 Width="100px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </cc2:MaskedEditAspNet>
                             &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator28" 
                                 runat="server" ControlToValidate="txtcep" 
                                 ErrorMessage="Valor máximo de dígitos foi atingido." 
                                 ValidationExpression="^[\s\S]{0,50}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                         </td>
                     </tr>
                     <tr>
                         <td style="width: 103px">
                             E-mail:</td>
                         <td colspan="2">
                             <asp:TextBox ID="txtEmailrep" runat="server" ToolTip="Informe o email" 
                                 Width="300px" />
                             &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator29" 
                                 runat="server" ControlToValidate="txtcep" 
                                 ErrorMessage="Valor máximo de dígitos foi atingido." 
                                 ValidationExpression="^[\s\S]{0,100}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                             &nbsp;<asp:RequiredFieldValidator ID="valEmail" runat="server" 
                                 ControlToValidate="txtEmailrep" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                             <br />
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                 ControlToValidate="txtEmailrep" 
                                 ErrorMessage="Por favor, informe um email válido" 
                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                         </td>
                     </tr>
                     <tr>
                         <td colspan="3">
                             <asp:ImageButton ID="ibtSalvar" runat="server" CommandName="Update" 
                                 ImageUrl="~/icones/Standard/001_06.gif" onclick="ibtSalvar_Click" 
                                 ToolTip="Alterar dados do representante" />
                             &nbsp;<asp:ImageButton ID="ibtIncluir" runat="server" 
                                 ImageUrl="~/icones/Standard/001_01.gif" ToolTip="Incluir " />
                             &nbsp;<asp:ImageButton ID="btnCancelar" runat="server" CausesValidation="False" 
                                 ImageUrl="~/icones/Standard/001_02.gif" 
                                 ToolTip="Cancelar a alteração de dados" />
                             &nbsp;<asp:Label ID="lblAvisoRepresentante0" runat="server" 
                                 CssClass="labelLaranja"></asp:Label>
                             &nbsp;</td>
                     </tr>
                 </table>
                <table style="width:700px;">
                    <tr>
                        <td align="left" valign="top" width="700">
                            <asp:SqlDataSource ID="sqlRepresentantes" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                DeleteCommand="DELETE FROM [tblEmpresaRepresentantes] WHERE [id_empresa_fk] = @id_empresa_fk AND [representante] = @representante" 
                                InsertCommand="INSERT INTO tblEmpresaRepresentantes(id_empresa_fk, representante, cargo, telefones, celular, email) VALUES (@id_empresa_fk, @representante, @cargo, @telefones, @celular, @email)" 
                                SelectCommand="SELECT id_empresa_fk, representante, cargo, telefones, celular, emailrep, id_representante FROM tblEmpresaRepresentantes WHERE (id_representante = @id_representante)" 
                                
                                
                                UpdateCommand="UPDATE tblEmpresaRepresentantes SET representante = @representante, cargo = @cargo, telefones = @telefones, celular = @celular, emailrep = @email, id_empresa_fk = @id_empresa_fk WHERE (id_representante = @id_representante)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_representante" SessionField="id_representante" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="id_empresa_fk" Type="Int32" />
                                    <asp:Parameter Name="representante" Type="String" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="txtRepresentante" Name="representante" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtCargo" Name="cargo" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtTelefones" Name="telefones" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtCelular" Name="celular" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtEmailrep" Name="email" 
                                        PropertyName="Text" />
                                    <asp:SessionParameter Name="id_representante" 
                                        SessionField=" id_representante" Type="Int32" />
                                    <asp:SessionParameter Name="id_empresa_fk" SessionField="EmpresaID" 
                                        Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:SessionParameter Name="id_empresa_fk" SessionField="EmpresaID" 
                                        Type="Int32" />
                                    <asp:Parameter Name="representante" Type="String" />
                                    <asp:Parameter Name="cargo" Type="String" />
                                    <asp:Parameter Name="telefones" Type="String" />
                                    <asp:Parameter Name="celular" Type="String" />
                                    <asp:Parameter Name="email" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" width="500">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                </table>
            </asp:View>
           
            <asp:View ID="View3" runat="server">
                <asp:Label ID="lbltitulocancela" runat="server" Font-Bold="True" 
                    Font-Size="10px" ForeColor="#0066FF" 
                    Text="Área para administração de conta. Por favor informar abaixo, razão do cancelamento."></asp:Label>
                <br />
                <br />
                <asp:Panel ID="Panel3" runat="server">
                    <asp:UpdatePanel ID="cancelPanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td style="width: 80px">
                                        <asp:Label ID="lblcomentario" runat="server" Text="Comentário:"></asp:Label>
                                        <br />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtComentario" runat="server" Rows="2" TextMode="MultiLine" 
                                            Width="300px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator30" 
                                            runat="server" ControlToValidate="txtcep" 
                                            ErrorMessage="Valor máximo de dígitos foi atingido." 
                                            ValidationExpression="^[\s\S]{0,1000}$" ValidationGroup="empresa"></asp:RegularExpressionValidator>
                                        &nbsp;<asp:RequiredFieldValidator ID="rqcancela" runat="server" 
                                            ControlToValidate="txtComentario" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">
                                        &nbsp;</td>
                                    <td>
                                        <asp:ImageButton ID="btnCancelarEmpresa" runat="server" 
                                            ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" 
                                            
                                            onclientclick="if(confirm('Deseja confirmar o cancelamento? ')){return true}else{return false}" />
                                    </td>
                                </tr>
                            </table>
                            <asp:SqlDataSource ID="Sqlcancelamento" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT * FROM [tblEmpresa]" 
                                
                                
                                UpdateCommand="UPDATE tblEmpresa SET cancelamento = 'True', comentariocancela = @comentariocancela, aprovado = 'False' WHERE (id_empresa = @id_empresa)" 
                                InsertCommand="INSERT INTO tblLogAlteraEmpresa(id_empresa, acao, nome, dataAteracao) VALUES (@id_empresa, 'Cancelou empresa', @nome, GETDATE())">
                                <UpdateParameters>
                                    <asp:SessionParameter Name="id_empresa" SessionField="EmpresaID" />
                                    <asp:Parameter Name="cancelamento" />
                                    <asp:ControlParameter ControlID="txtComentario" Name="comentariocancela" 
                                        PropertyName="Text" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:SessionParameter Name="id_empresa" SessionField="EmpresaID" />
                                    <asp:SessionParameter Name="nome" SessionField="c_nome" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                            AssociatedUpdatePanelID="cancelPanel">
                            <ProgressTemplate>
                                &nbsp;<asp:Image ID="Image1" runat="server" 
                                    ImageUrl="~/imagens/Carregando2.gif" Width="32px" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        </ContentTemplate>
                       
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnCancelarEmpresa" EventName="Click" />
                        </Triggers>
                       
                    </asp:UpdatePanel>
                    
                    
                </asp:Panel>
                <br />
                 
                <br />
            </asp:View>
       
        </asp:MultiView>
    </asp:Panel>
</div>
   </form>
    </body>
</html>




