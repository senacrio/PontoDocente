<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdmAlterarEstudante.aspx.vb" Inherits="clickoportunidades_AdmAlterarEstudante" Theme="Basico" %>

<%@ Register assembly="AspNetMaskedEdit" namespace="AspNetMaskedEdit" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .style1
        {
            width: 109px;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 128px;
        }
    </style>
</head>

<form id="form1" runat="server">

     <asp:ScriptManager ID="ScriptManager1" runat="server" />
     <table style="width: 96%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="10px" 
                            ForeColor="#FF6600" 
                            Text="*Atenção: Qualquer operação efetuada nessa área é de responsabilidade única do Click Oportunidades, essas operações são registradas." 
                            Width="650px"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td colspan="2" style="font-family: verdana; font-size: 11px">
                        Área de edição de candidatos:</td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label3" runat="server" Text="Usuário/Captador responsável:" 
                            Width="189px" Font-Names="Verdana" Font-Size="11px"></asp:Label>
                    </td>
                    <td style="text-align: left; width: 480px;">
                        <asp:DropDownList ID="cbousuario" runat="server" DataSourceID="SqlUsuario" 
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
                </table>
        
            <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" 
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" 
                Orientation="Horizontal" StaticSubMenuIndent="" Height="25px" 
        Width="749px" position="static" CssClass="SimpleEntertainmentMenu">
                <StaticSelectedStyle BackColor="#507CD1" ForeColor="White" Height="25px"  />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" ForeColor="White"  />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#507CD1" ForeColor="White" Height="25px" />
                <Items>
                    <asp:MenuItem Text="Dados Pessoais" Value="0" ToolTip="Dados Pessoais" 
                        Selected="True"></asp:MenuItem>
                    <asp:MenuItem Text="Cursos Senac Rio" Value="1" ToolTip="Cursos Senac Rio"></asp:MenuItem>
                    <asp:MenuItem Text="Escolaridade" Value="3" 
                        ToolTip="Escolaridade"></asp:MenuItem>            
                    <asp:MenuItem Text="Histórico Profissional" Value="5" 
                        ToolTip="Histórico Profissional "></asp:MenuItem>
                    <asp:MenuItem Text="Objetivo Profissional" Value="4" 
                        ToolTip="Objetivo Profissional"></asp:MenuItem>
                    <asp:MenuItem Text="Conhecimentos" Value="6" ToolTip="Conhecimentos"></asp:MenuItem>
                    <asp:MenuItem Text="Outros Cursos " Value="2" ToolTip="Outros Cursos"></asp:MenuItem>
                </Items>
            </asp:Menu>
     <table class="style2">
         <tr>
             <td class="style3">
                 &nbsp;</td>
             <td>
                                    &nbsp;</td>
         </tr>
         <tr>
             <td class="style3" style="font-family: Verdana; font-size: 11px">
                        <asp:Label ID="Label1" runat="server" Text="Cpf do candidato:"></asp:Label>
                    </td>
             <td>
                        <asp:TextBox ID="txtcpfcandidato" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton3" runat="server" 
                            ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" 
                            CausesValidation="False" />
                    &nbsp;<asp:Label ID="Label6" runat="server" Text="Procurar"></asp:Label>
                    </td>
         </tr>
         <tr>
             <td class="style3" style="font-family: Verdana; font-size: 11px">
                        <asp:Label ID="Label2" runat="server" Text="Nome do candidato:"></asp:Label>
                    </td>
             <td>
                        <asp:TextBox ID="txtnomecandidato" runat="server" Width="300px" 
                     style="margin-left: 0px"></asp:TextBox>
                        <asp:SqlDataSource ID="SqlBuscaCandidato" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT id_candidato, nome, identificador FROM tblCandidato WHERE (nome LIKE '' + @nome + '%' OR nome IS NULL) AND (identificador LIKE '' + @identificador + '%' OR identificador IS NULL)
order by nome">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtnomecandidato" Name="nome" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtcpfcandidato" Name="identificador" 
                                    PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </td>
         </tr>
         <tr>
             <td class="style3" style="font-family: Verdana; font-size: 11px">
                        <asp:Label ID="Label4" runat="server" Text="Buscar candidato:"></asp:Label>
                    </td>
             <td>
                        <asp:DropDownList ID="cboEstudante" runat="server" 
                            DataSourceID="SqlBuscaCandidato" DataTextField="nome" 
                            DataValueField="id_candidato">
                        </asp:DropDownList>
&nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" 
                            ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" />
                        &nbsp;</td>
         </tr>
         <tr>
             <td class="style3">
                        &nbsp;</td>
             <td>
                        Clique no botão verde para preencher o formulário</td>
         </tr>
     </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
            <asp:panel ID="Panel1" runat="server"  BorderColor="#284E98"  
                BorderStyle="Solid" BorderWidth="1px" Width="746px" >
                <asp:MultiView id="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View id="viewCandidato" runat="server">
                        <table>
                            <tr>
                                <td colspan="5" 
                                    style="font-family: verdana; font-size: 11px; ">
                                    O primeiro item de um currículo refere-se a seus dados pessoais. Preencha os 
                                    campos a seguir, com as informações solicitadas. Ao final, clique no botão verde 
                                    abaixo da tela para salvar as informações, volte ao topo da página e siga para a 
                                    próxima etapa – <b>Cursos Senac Rio.</b></td>
                            </tr>
                            <tr>
                                <td colspan="5" 
                                    
                                    
                                    
                                    
                                    
                                    style="font-size: 11px; font-family: verdana; ">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Nome Completo:</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtNome" runat="server" Text='<%# Bind("nome") %>' 
                                        Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valNome" runat="server" 
                                        ControlToValidate="txtNome" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    CPF:</td>
                                <td colspan="2" style="margin-left: 40px">
                                    <asp:TextBox ID="txtIdentificador" runat="server" 
                                        Text='<%# Bind("identificador") %>' 
                                        
                                        ToolTip="Informe seu CPF no formato nnn.nnn.nnn-nn. Digite os pontos e o traço." 
                                        ForeColor="#999999" ReadOnly="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valCpf" runat="server" 
                                        ControlToValidate="txtIdentificador" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                </td>
                                <td style="margin-left: 40px">
                                    &nbsp;</td>
                                <td style="margin-left: 40px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    RG:</td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtRG" runat="server" Text="<%# Bind('rg') %>"></asp:TextBox>
                                    <cc2:MaskedEditExtender ID="RG_MaskedEditExtender" runat="server" 
                                        Mask="999,999,999-99" TargetControlID="txtRG"></cc2:MaskedEditExtender>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Data de Nascimento: &nbsp;</td>
                                <td colspan="2">
                                    <asp:TextBox ID="datNascimento" runat="server" Font-Names="arial" 
                                        Font-Size="8pt" Text='<%# Bind("nascimento", "{0:d}") %>' 
                                        ToolTip="Informe a data no forma mm/dd/aa, digitando inclusive as barras."></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valData" runat="server" 
                                        ControlToValidate="datNascimento" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Número de Dependentes:</td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtDependentes" runat="server" MaxLength="2" Width="50px"></asp:TextBox>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Estado Civil:</td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cboid_estadoCivil" runat="server" 
                                        DataSourceID="SqlEstadoCivil" DataTextField="estadocivil" 
                                        DataValueField="id_estadocivil">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="valEstadoCivil" runat="server" 
                                        ControlToValidate="cboid_estadoCivil" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="SqlEstadoCivil" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        SelectCommand="SELECT id_estadocivil, estadocivil FROM tblEstadoCivil WHERE (id_estadocivil &lt;&gt; 'I')">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Pessoa com Deficiência:
                                </td>
                                <td colspan="2" style="width: 100px">
                                    <asp:DropDownList ID="cboid_deficiente_fk" runat="server" 
                                        DataSourceID="SqlDeficiencia" DataTextField="deficiente" 
                                        DataValueField="id_deficiente">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDeficiencia" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT [id_deficiente], [deficiente] FROM [tblDeficiente]">
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 100px">
                                    &nbsp;</td>
                                <td style="width: 100px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Nome do Pai:</td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtNomePai" runat="server" Width="300px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Nome da Mãe:</td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtNomeMae" runat="server" Width="300px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    E-mail:</td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valEmail" runat="server" 
                                        ControlToValidate="txtEmail" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    &nbsp;</td>
                                <td colspan="2">
                                    <asp:CheckBox ID="chkEmailNao" runat="server" AutoPostBack="True" 
                                        oncheckedchanged="chkEmailNao_CheckedChanged" Text="Não tenho e-mail" 
                                        Width="200px" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    <span style="width: 200px">Telefone Res:</span></td>
                                <td colspan="2">
                                    <span style="width: 100px">
                                    <asp:TextBox ID="txtTelefone" runat="server"></asp:TextBox>
                                    </span>
                                    <asp:RequiredFieldValidator ID="valTelefoneRes" runat="server" 
                                        ControlToValidate="txtTelefone" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    <span>Telefone Celular: </span>
                                </td>
                                <td colspan="2">
                                    <span style="width: 100px">
                                    <asp:TextBox ID="txtCelular" runat="server" 
                                        ToolTip="Informe o telefone com DDD"></asp:TextBox>
                                    <cc2:MaskedEditExtender ID="Celular_MaskedEditExtender" runat="server" 
                                        Mask="(99)9999-9999 " TargetControlID="txtCelular"></cc2:MaskedEditExtender>
                                    </span>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    <span style="width: 120px">Telefone Recado:</span></td>
                                <td colspan="2">
                                    <span style="width: 100px"><span style="width: 120px">
                                    <asp:TextBox ID="txtTelefone_recado" runat="server" 
                                        ToolTip="Informe o telefone com DDD"></asp:TextBox>
                                    <cc2:MaskedEditExtender ID="Telefone_recado_MaskedEditExtender" runat="server" 
                                        Mask="(99)9999-9999 " TargetControlID="txtTelefone_recado"></cc2:MaskedEditExtender>
                                    </span></span>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Sexo:</td>
                                <td colspan="2" style="height: 26px">
                                    <span style="width: 100px">
                                    <asp:RadioButtonList ID="rdbSexo" runat="server" RepeatDirection="Horizontal" 
                                        Width="180px">
                                        <asp:ListItem Selected="True" Value="M">Masculino</asp:ListItem>
                                        <asp:ListItem Value="F">Feminino</asp:ListItem>
                                    </asp:RadioButtonList>
                                    </span>
                                </td>
                                <td colspan="2" style="height: 26px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Endereço:</td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtEndereco" runat="server" Width="328px"></asp:TextBox>
                                </td>
                                <td colspan="2">
                                    <asp:RequiredFieldValidator ID="valEndereco" runat="server" 
                                        ControlToValidate="txtEndereco" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    <span style="height: 26px">Número:</span></td>
                                <td colspan="2" style="height: 26px">
                                    <asp:TextBox ID="txtNumero" runat="server" MaxLength="5" Width="84px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valNumero" runat="server" 
                                        ControlToValidate="txtNumero" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                </td>
                                <td style="height: 26px">
                                    &nbsp;</td>
                                <td style="height: 26px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    <span style="width: 120px; height: 26px">Complemento:</span></td>
                                <td colspan="2" style="height: 26px">
                                    <span style="width: 120px; height: 26px;">
                                    <asp:TextBox ID="txtComplemento" runat="server" Width="100px"></asp:TextBox>
                                    </span>
                                    <br />
                                </td>
                                <td style="height: 26px">
                                    &nbsp;</td>
                                <td style="height: 26px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Bairro:</td>
                                <td colspan="2">
                                    <span style="width: 100px; ">
                                    <asp:TextBox ID="txtBairro" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valBairro" runat="server" 
                                        ControlToValidate="txtBairro" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    Estado:</td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cboEstado_fk" runat="server" AutoPostBack="True" 
                                        DataSourceID="SqlEstado" DataTextField="estado" DataValueField="estado" 
                                        onselectedindexchanged="DropDownEstado_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlEstado" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT * FROM [tblEstados]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    <span style="height: 26px; width: 120px;">Município:</span></td>
                                <td colspan="2" style="height: 27px;">
                                    <asp:DropDownList ID="cboId_Municipio" runat="server" 
                                        DataSourceID="sqlMunicipio" DataTextField="nome" DataValueField="id_municipio">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlMunicipio" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT id_municipio, nome FROM tblMunicipio WHERE (estado_fk = @estado_fk)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboEstado_fk" Name="estado_fk" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="font-family: verdana; font-size: 11px;">
                                    <span style="height: 26px; ">CEP:</span></td>
                                <td colspan="2">
                                    <span style="width: 120px; ">
                                    <asp:TextBox ID="txtCEP" runat="server"></asp:TextBox>
                                    </span>
                                    <asp:RequiredFieldValidator ID="valCep" runat="server" 
                                        ControlToValidate="txtCEP" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="font-family: verdana; font-size: 11px">
                                    Nacionalidade:</td>
                                <td class="labelLaranja">
                                    <asp:DropDownList ID="cboId_Nacionalidade" runat="server" 
                                        DataSourceID="sqlNacionalidade" DataTextField="descricao" 
                                        DataValueField="id_nacionalidade">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlNacionalidade" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT id_nacionalidade, descricao FROM tblNacionalidade WHERE (visivel = 1)">
                                    </asp:SqlDataSource>
                                </td>
                                <td class="labelLaranja">
                                    &nbsp;</td>
                                <td class="labelLaranja">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="labelLaranja" colspan="3" 
                                    style="font-family: verdana; font-size: 11px">
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="update" 
                                        ImageUrl="~/icones/Standard/001_01.gif" ToolTip="Gravar informações" 
                                        onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" />
                                    &nbsp; Clique aqui para gravar os seus dados.&nbsp;
                                    <asp:Label ID="lblDadosPessoais" runat="server" CssClass="labelLaranja" 
                                        style="color: #FF6600"></asp:Label>
                                    </td>
                                <td class="labelLaranja">
                                    &nbsp;</td>
                                <td class="labelLaranja">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="sqlCurriculo" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT tblCandidato.id_candidato, tblCandidato.nome, tblCandidato.identificador, tblCandidato.endereco, tblCandidato.numero, tblCandidato.complemento, tblCandidato.bairro, tblCandidato.email, tblCandidato.id_nacionalidade, tblCandidato.nascimento, tblCandidato.sexo, tblCandidato.id_estadocivil, tblCandidato.id_municipio, tblCandidato.estado_fk, tblCandidato.cep, tblCandidato.telefone, tblCandidato.celular, tblCandidato.telefone_recado, tblCandidato.observacao, tblCandidato.ultima_atualizacao, tblCandidato.senha, tblCandidato.id_deficiente_fk, tblCandidato.emailnao, tblCandidato.dependentes, tblCandidato.rg, tblCandidato.nomePai, tblCandidato.nomeMae, tblMunicipio.nome AS municipio FROM tblCandidato INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio WHERE (tblCandidato.id_candidato = @id_candidato)" 
                            UpdateCommand="UPDATE tblCandidato SET nome = @nome, identificador = @identificador, id_estadocivil = @id_estadocivil, endereco = @endereco, numero = @numero, complemento = @complemento, bairro = @bairro, email = @email, id_nacionalidade = @id_nacionalidade, nascimento = @nascimento, sexo = @sexo, id_municipio = @id_municipio, cep = @cep, telefone = @telefone, celular = @celular, telefone_recado = @telefone_recado, emailnao = @emailnao, dependentes = @dependentes, id_deficiente_fk = @id_deficiente_fk, rg = @rg, nomePai = @nomePai, nomeMae = @nomeMae, estado_fk = @estado_fk WHERE (id_candidato = @id_candidato)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="id_candidato" 
                                    SessionField="id_candidato" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txtNome" Name="nome" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtIdentificador" Name="identificador" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboid_estadoCivil" Name="id_estadocivil" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtEndereco" Name="endereco" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtNumero" Name="numero" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtComplemento" Name="complemento" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtBairro" Name="bairro" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboId_Nacionalidade" Name="id_nacionalidade" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="datNascimento" Name="nascimento" 
                                    PropertyName="Text" Type="DateTime" />
                                <asp:ControlParameter ControlID="rdbSexo" Name="sexo" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="cboId_Municipio" Name="id_municipio" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtCEP" Name="cep" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtTelefone" Name="telefone" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtCelular" Name="celular" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtTelefone_recado" Name="telefone_recado" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="chkEmailNao" Name="emailnao" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="txtDependentes" Name="dependentes" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboid_deficiente_fk" Name="id_deficiente_fk" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtRG" Name="rg" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtNomePai" Name="nomePai" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtNomeMae" Name="nomeMae" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboEstado_fk" Name="estado_fk" 
                                    PropertyName="SelectedValue" />
                                <asp:SessionParameter DefaultValue="" Name="id_candidato" 
                                    SessionField="id_candidato" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlLogAlteraCandidato" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            InsertCommand="INSERT INTO tblLogAlteraCandidato(id_candidato, nome, acao) VALUES (@id_candidato, @nome, @acao)" 
                            SelectCommand="SELECT [id_candidato] FROM [tblCandidato]">
                            <InsertParameters>
                                <asp:SessionParameter Name="id_candidato" SessionField="id_candidato" />
                               <asp:SessionParameter Name="nome" SessionField="c_nome" />
                                <asp:SessionParameter Name="acao" SessionField="id_view" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                    
                    <br />
                    
                    <asp:View ID="viewCursosSenac" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td style="font-family: verdana; font-size: 10px; font-weight: bold; color: #0066FF;">
                                    <span style="font-weight: normal">Aqui você visualiza o(s) curso(s) realizado(s) 
                                    no Senac Rio. </span><span>Caso não visualize o(s) curso(s) realizado(s), 
                                    entre em contato com a Unidade onde estudou.</span><span 
                                        style="font-weight: normal"> Siga para a próxima etapa – </span><span>
                                    Escolaridade</span><span style="font-weight: normal">.</span>

<br />
                                    <br />
                                    <asp:GridView ID="gvCursosSenac" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="sqlCursosSenac" 
                                        PageSize="5" Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="Curso" HeaderText="Curso" SortExpression="Curso" />
                                            <asp:BoundField DataField="Nivel" HeaderText="Nível" SortExpression="Nivel" />
                                            <asp:BoundField DataField="Unidade" HeaderText="Unidade" 
                                                SortExpression="Unidade" />
                                            <asp:BoundField DataField="conclusao" HeaderText="Conclusão" 
                                                SortExpression="Conclusão" DataFormatString="{0:MM/yyyy}" />
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <asp:SqlDataSource ID="sqlCursosSenac" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" DeleteCommand="DELETE FROM tblCandidatoCursosSenac 
WHERE (id_candidato_fk = @id_candidato_fk) and (id_oferta_fk=@id_oferta_fk)" 
                                        InsertCommand="INSERT INTO tblCandidatoCursosSenac(id_candidato_fk, id_oferta_fk, id_nivel, id_unidade_fk, conclusao) VALUES (@id_candidato_fk, @id_oferta_fk, @id_nivel, @id_unidade_fk, @conclusao)" 
                                        
                                        
                                        SelectCommand="SELECT IDENTIFICADOR, id_oferta, id_unidade, conclusao, NIVEL, nivel_codigo, curso, unidade FROM dbo.fcClick_ClienteOfertas(@identificador) AS fcClick_ClienteOfertas_1">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="identificador" 
                                                SessionField="EstudanteIdentificador" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="id_candidato_fk" />
                                            <asp:Parameter Name="id_oferta_fk" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                                            <asp:ControlParameter ControlID="ddlCursos" Name="id_oferta_fk" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="ddlCursosSenacNivel" Name="id_nivel" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="ddlCursosSenacUnidades" Name="id_unidade_fk" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="txtConclusaoCursoSenac" Name="conclusao" 
                                                PropertyName="Text" Type="String" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        <table><tr>
                            <td style="font-family: verdana; font-size: 10px; font-weight: bold; color: #0066FF"><br />
                            </td></tr></table>
                        
                    </asp:View>
                    
                    <asp:View id="viewOutrosCursos" runat="server">
                        <asp:Panel ID="Panel4" runat="server" Font-Size="Small" >
                        <table>
                            <tr align="left" valign="top">
                                <td align="left" valign="middle" class="labelLaranja" 
                                    style="font-family: verdana; font-size: 11px">
                                    <table style="width:100%; font-family: verdana; font-size: 11px;">
                                        <tr>
                                            <td colspan="4" 
                                                
                                                style="font-size: 10px; font-family: verdana; color: #0066FF;">
                                                <span style="font-weight: normal">Você vai registrar informações sobre cursos 
                                                que você realizou em outras instituições e que estejam relacionados à área 
                                                pretendida. Preencha os campos e, a seguir, clique no botão com sinal de adição 
                                                para incluir as informações. Se desejar inserir mais cursos, preencha novamente 
                                                os campos e clique no botão com o sinal de adição que se encontra na parte 
                                                inferior da tela.
                                                <br />
                                                <br />
                                                Se você preencheu devidamente os campos de todas as telas, completou com sucesso 
                                                seu cadastro no Click Oportunidades.
                                                <br />
                                                <br />
                                                Tão logo surjam vagas adequadas ao seu perfil, entraremos em contato. </span>


</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td colspan="2">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Curso:</td>
                                            <td colspan="2">
                                                <asp:TextBox ID="txtOutrosCurso" runat="server" MaxLength="100" 
                                                    TextMode="MultiLine" ToolTip="Informe o nome do curso que fez." Width="180px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="txtOutrosCurso" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 Instituição:</td>
                                            <td colspan="2">
                                                <asp:TextBox ID="txtOutrosInstituicao" runat="server" MaxLength="100" 
                                                    TextMode="MultiLine" ToolTip="Infomre o nome da instituição onde fez o curso." 
                                                    Width="180px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="txtOutrosInstituicao" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
 Conclusão:</td>
                                            <td colspan="2">
                                                <asp:TextBox ID="txtOutrosConclusao" runat="server" 
                                                    
                                                    
                                                    ToolTip="Informe a data da conclusão no formato mm/aaaa, digitando inclusive as barras." 
                                                    Width="100px"></asp:TextBox>
                                                <cc2:MaskedEditExtender ID="txtOutrosConclusao_MaskedEditExtender" 
                                                    runat="server" Mask="99/9999" MaskType="Date" 
                                                    TargetControlID="txtOutrosConclusao"></cc2:MaskedEditExtender>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                    ControlToValidate="txtOutrosConclusao" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                              
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Carga horária:</td>
                                            <td>
                                                <asp:TextBox ID="txtOutrosCarga" runat="server" 
                                                    ToolTip="Informe a quantidade de horas de duração do curso." Width="51px"></asp:TextBox>
                                                &nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" 
                                                    ControlToValidate="txtOutrosCarga" 
                                                    ErrorMessage="Por favor, informe um número válido." Operator="GreaterThan" 
                                                    Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Label ID="lblCursosOutrosAviso" runat="server" CssClass="labelLaranja" 
                                                    style="color: #FF6600"></asp:Label>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:ImageButton ID="ibtAdicionarCursosOutros" runat="server" 
                                        ImageUrl="~/icones/Standard/001_01.gif" ToolTip="Adicionar curso" 
                                        ImageAlign="Middle" />
                                    &nbsp;Clique aqui para gravar os seus dados.<br />
                                </td>
                            </tr>
                            <tr align="left" valign="top">
                                <td align="left" valign="top">
                                    <asp:GridView ID="gvCursosOutros" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" DataKeyNames="id_cursosoutros" 
                                        DataSourceID="sqlCursosOutros" Font-Names="Arial" Font-Size="7pt" PageSize="5">
                                        <Columns>
                                            <asp:BoundField DataField="curso" HeaderText="Curso" SortExpression="curso" />
                                            <asp:BoundField DataField="instituicao" HeaderText="Instituição" 
                                                SortExpression="instituicao" />
                                            <asp:BoundField DataField="conclusao" DataFormatString="{0:d}" 
                                                HeaderText="Conclusão" SortExpression="conclusao" />
                                            <asp:BoundField DataField="carga" HeaderText="Carga" SortExpression="carga" />
                                            <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btndeletarOutros" runat="server" CausesValidation="False" 
                                                        CommandName="Delete" ImageUrl="~/icones/Standard/001_05.gif" 
                                                        onclick="btndeletarOutros_Click" 
                                                        onclientclick="if (confirm('Deseja excluir realmente?' )){return True}else{return false}" 
                                                        Text="Excluir registro" />
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sqlCursosOutros" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" DeleteCommand="DELETE FROM [tblCandidatoCursosOutros] 
WHERE (id_cursosoutros=@id_cursosoutros)" 
                                        InsertCommand="INSERT INTO [tblCandidatoCursosOutros] ([id_candidato_fk], [curso], [instituicao], [conclusao], [carga]) VALUES (@id_candidato_fk, @curso, @instituicao, @conclusao, @carga)" 
                                        SelectCommand="SELECT id_cursosoutros, id_candidato_fk, curso, instituicao, conclusao, carga FROM tblCandidatoCursosOutros WHERE (id_candidato_fk = @id_candidato_fk)" 
                                        UpdateCommand="UPDATE [tblCandidatoCursosOutros] SET [curso] = @curso, [instituicao] = @instituicao, [conclusao] = @conclusao, [carga] = @carga WHERE [id_candidato_fk] = @id_candidato_fk">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="id_cursosoutros" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="curso" Type="String" />
                                            <asp:Parameter Name="instituicao" Type="String" />
                                            <asp:Parameter Name="conclusao" Type="DateTime" />
                                            <asp:Parameter Name="carga" Type="Int32" />
                                            <asp:Parameter Name="id_candidato_fk" Type="Int32" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" 
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="txtOutrosCurso" Name="curso" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtOutrosInstituicao" Name="instituicao" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtOutrosConclusao" Name="conclusao" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtOutrosCarga" Name="carga" 
                                                PropertyName="Text" Type="Int32" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        </asp:Panel>
                    </asp:View>
                    <asp:View id="viewFormacao" runat="server">
                       <p>
                           <table style="width:100%; font-family: verdana; font-size: 11px;">
                               <tr>
                                   <td align="left" valign="top" class="labelLaranja">
                                       <table style="width:100%; font-weight: normal;">
                                           <tr>
                                               <td colspan="3">
                                                   <div style="font-family: verdana; font-size: 10px; color: #0066FF;">
                                                       Preencha os campos a seguir com informações referentes à sua escolaridade. Após, 
                                                       clique no botão com sinal de adição para incluir as informações. Para inserir o 
                                                       nome de mais de uma instituição e cursos, preencha novamente os campos e clique 
                                                       no botão com o sinal de adição que se encontra na parte inferior da tela.
                                                       <br />
                                                       <br />
                                                       Ao finalizar, siga para a próxima etapa – <b>Histórico</b> <b>Profissional.</b>

</div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <td>
                                                   &nbsp;</td>
                                               <td>
                                                   &nbsp;</td>
                                               <td>
                                                   &nbsp;</td>
                                           </tr>
                                           <tr>
                                               <td>
                                                   Instituição:</td>
                                               <td>
                                                   <asp:TextBox ID="txtFormacaoInstituicao" runat="server" MaxLength="100" 
                                                       TextMode="MultiLine" ToolTip="Informe a instituição" Width="200px"></asp:TextBox>
                                               </td>
                                               <td>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                       ControlToValidate="txtFormacaoInstituicao" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                                   <br />
                                               </td>
                                           </tr>
                                           <tr>
                                               <td>
                                                   Nível:</td>
                                               <td>
                                                   <asp:DropDownList ID="ddlFormacaoNivel" runat="server" 
                                                       DataSourceID="sqlNiveisLista" DataTextField="formacao" 
                                                       DataValueField="id_formacaonivel" Width="200px" AutoPostBack="True">
                                                   </asp:DropDownList>
                                                   <br />
                                                   <asp:SqlDataSource ID="sqlNiveisLista" runat="server" 
                                                       ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                       SelectCommand="SELECT [id_formacaonivel], [formacao] FROM [tblFormacaoNivel] ORDER BY [id_formacaonivel]">
                                                   </asp:SqlDataSource>
                                               </td>
                                               <td>
                                                   &nbsp;</td>
                                           </tr>
                                           <tr>
                                               <td>
                                                   Curso:</td>
                                               <td>
                                                   <asp:TextBox ID="txtFormacaoCurso" runat="server" MaxLength="100" 
                                                       TextMode="MultiLine" Width="200px" ToolTip="Informe o curso"></asp:TextBox>
                                               </td>
                                               <td>
                                                   &nbsp;</td>
                                           </tr>
                                           <tr>
                                               <td>
 Início:</td>
                                               <td>
                                                   <asp:TextBox ID="txtFormacaoInicio" runat="server" MaxLength="7" 
                                                       ToolTip="Informe no formato mm/aaaa." 
                                                       Width="100px"></asp:TextBox>
                                                   <cc2:MaskedEditExtender ID="txtFormacaoInicio_MaskedEditExtender" 
                                                       runat="server" CultureName="pt-BR" Mask="99/9999" MaskType="Date" 
                                                       TargetControlID="txtFormacaoInicio"></cc2:MaskedEditExtender>
                                               </td>
                                               <td>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                                       ErrorMessage="Campo obrigatório." ControlToValidate="txtFormacaoInicio"></asp:RequiredFieldValidator>
                                                   &nbsp;</td>
                                           </tr>
                                           <tr>
                                               <td style="height: 25px">
                                                   Término:</td>
                                               <td style="height: 25px">
                                                   <asp:TextBox ID="txtFormacaoFim" runat="server" MaxLength="7" 
                                                       ToolTip="Informe no formato mm/aaaa." 
                                                       Width="100px"></asp:TextBox>
                                                   <cc2:MaskedEditExtender ID="txtFormacaoFim_MaskedEditExtender" runat="server" 
                                                       CultureName="pt-BR" Mask="99/9999" MaskType="Date" 
                                                       TargetControlID="txtFormacaoFim"></cc2:MaskedEditExtender>
                                               </td>
                                               <td style="height: 25px">
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                                       ErrorMessage="Campo obrigatório." ControlToValidate="txtFormacaoFim"></asp:RequiredFieldValidator>
                                               </td>
                                           </tr>
                                           <tr>
                                               <td colspan="3">
                                                   <asp:Label ID="lblFormacaoAviso" runat="server" CssClass="labelLaranja" 
                                                       style="color: #FF6600"></asp:Label>
                                                   </td>
                                           </tr>
                                       </table>
                                       <asp:ImageButton ID="ibtFormacaoAdicionar" runat="server" 
                                           ImageUrl="~/icones/Standard/001_01.gif" ToolTip="Adicionar Escolaridade" />
                                       &nbsp;Clique aqui para gravar os seus dados.<br />
                                   </td>
                               </tr>
                               <tr>
                                   <td align="left" valign="top">
                                       <asp:GridView ID="gvFormacao" runat="server" AllowPaging="True" 
                                           AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_formacao" 
                                           DataSourceID="sqlFormacao" GridLines="None" PageSize="5">
                                           <Columns>
                                               <asp:BoundField DataField="instituicao" HeaderText="Instituição" 
                                                   SortExpression="instituicao" />
                                               <asp:BoundField DataField="curso" HeaderText="Curso" SortExpression="curso" />
                                               <asp:BoundField DataField="formacao" HeaderText="Formação" 
                                                   SortExpression="formacao" />
                                               <asp:BoundField DataField="inicio" HeaderText="Início" 
                                                   SortExpression="inicio" />
                                               <asp:BoundField DataField="fim" HeaderText="Fim" SortExpression="fim" />
                                               <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                                   <ItemTemplate>
                                                       <asp:ImageButton ID="btnExcluirFormacao" runat="server" 
                                                           CausesValidation="False" CommandName="Delete" 
                                                           ImageUrl="~/icones/Standard/001_05.gif" onclick="btnExcluirFormacao_Click" 
                                                           onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                                           Text="Excluir registro" />
                                                   </ItemTemplate>
                                                   <HeaderStyle HorizontalAlign="Center" />
                                                   <ItemStyle HorizontalAlign="Center" Width="80px" />
                                               </asp:TemplateField>
                                           </Columns>
                                       </asp:GridView>
                                   </td>
                               </tr>
                               <tr>
                                   <td align="left" valign="top">
                                       <asp:SqlDataSource ID="sqlFormacao" runat="server" 
                                           ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                           DeleteCommand="DELETE FROM [tblCandidatoFormacao] WHERE [id_formacao] = @id_formacao" 
                                           InsertCommand="INSERT INTO tblCandidatoFormacao(instituicao, curso, id_formacaonivel_fk, inicio, fim, id_candidato_fk) VALUES (@instituicao, @curso, @id_formacaonivel_fk, @inicio, @fim, @id_candidato_fk)" 
                                           SelectCommand="SELECT tblCandidatoFormacao.instituicao, tblCandidatoFormacao.curso, tblFormacaoNivel.formacao, tblCandidatoFormacao.inicio, tblCandidatoFormacao.fim, tblCandidatoFormacao.id_candidato_fk, tblCandidatoFormacao.id_formacao FROM tblCandidatoFormacao INNER JOIN tblFormacaoNivel ON tblCandidatoFormacao.id_formacaonivel_fk = tblFormacaoNivel.id_formacaonivel WHERE (tblCandidatoFormacao.id_candidato_fk = @id_candidato)" 
                                           UpdateCommand="UPDATE [tblCandidatoFormacao] SET [instituicao] = @instituicao, [curso] = @curso, [inicio] = @inicio, [fim] = @fim, [id_candidato_fk] = @id_candidato_fk WHERE [id_formacao] = @id_formacao">
                                           <SelectParameters>
                                               <asp:SessionParameter Name="id_candidato" SessionField="id_candidato" />
                                           </SelectParameters>
                                           <DeleteParameters>
                                               <asp:Parameter Name="id_formacao" Type="Int32" />
                                           </DeleteParameters>
                                           <UpdateParameters>
                                               <asp:Parameter Name="instituicao" Type="String" />
                                               <asp:Parameter Name="curso" Type="String" />
                                               <asp:Parameter Name="inicio" Type="String" />
                                               <asp:Parameter Name="fim" Type="String" />
                                               <asp:Parameter Name="id_candidato_fk" Type="Int32" />
                                               <asp:Parameter Name="id_formacao" Type="Int32" />
                                           </UpdateParameters>
                                           <InsertParameters>
                                               <asp:ControlParameter ControlID="txtFormacaoInstituicao" Name="instituicao" 
                                                   PropertyName="Text" Type="String" />
                                               <asp:ControlParameter ControlID="txtFormacaoCurso" Name="curso" 
                                                   PropertyName="Text" Type="String" />
                                               <asp:ControlParameter ControlID="ddlFormacaoNivel" Name="id_formacaonivel_fk" 
                                                   PropertyName="SelectedValue" />
                                               <asp:ControlParameter ControlID="txtFormacaoInicio" Name="inicio" 
                                                   PropertyName="Text" Type="String" />
                                               <asp:ControlParameter ControlID="txtFormacaoFim" Name="fim" PropertyName="Text" 
                                                   Type="String" />
                                               <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" 
                                                   Type="Int32" />
                                           </InsertParameters>
                                       </asp:SqlDataSource>
                                   </td>
                               </tr>
                           </table>
                        </p></asp:View>
                        <asp:View ID="viewObjetivo" runat="server">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <table style="width:100%; font-family: verdana; font-size: 11px;">
                                            <tr>
                                                <td style="height: 23px; font-size: 10px; font-family: verdana; color: #0066FF;" 
                                                    colspan="3">
                                                    Aqui você vai registrar seu objetivo profissional, a função em que deseja atuar. 
                                                    Preencha os campos a seguir e clique no botão com sinal de adição para incluir 
                                                    as informações. Se desejar inserir mais de um objetivo profissional, preencha 
                                                    novamente os campos e clique no botão com o sinal de adição que se encontra na 
                                                    parte inferior da tela.
                                                    <br />
                                                    <br />
                                                    Ao finalizar, siga para a próxima etapa – <b>Conhecimentos.</b>
 </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 23px; width: 184px;">
                                                    &nbsp;</td>
                                                <td style="height: 23px">
                                                    &nbsp;</td>
                                                <td style="height: 23px">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="height: 23px; width: 184px;">
                                                    Área Pretendida:</td>
                                                <td style="height: 23px">
                                                    <asp:DropDownList ID="ddlObjetivoArea" runat="server" 
                                                        DataSourceID="sqlObjetivoAreaLista" DataTextField="area" 
                                                        DataValueField="codigo">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sqlObjetivoAreaLista" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        SelectCommand="SELECT codigo, area FROM viewSGA_AreasConhecimento">
                                                    </asp:SqlDataSource>
                                                </td>
                                                <td style="height: 23px">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 184px">
                                                    Família CBO:</td>
                                                <td colspan="2">
                                                    <asp:DropDownList ID="ddlCbofamilia" runat="server" 
                                                        DataSourceID="sqlCboFamilia" AutoPostBack="True" Width="550px" 
                                                        DataTextField="cargo" DataValueField="id_cargo" Font-Size="10px">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sqlCboFamilia" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        
                                                        
                                                        SelectCommand="SELECT id_cargo, cargo FROM tblCBO WHERE (tipo = 'Família') ORDER BY cargo">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="Família" Name="tipo" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 184px">
                                                    Cargo Desejado:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlObjetivoCargo" runat="server" 
                                                        DataSourceID="sqlObjetivoCargoLista" DataTextField="cargo" 
                                                        DataValueField="id_cargo" Width="300px" Font-Underline="False">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sqlObjetivoCargoLista" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        
                                                        SelectCommand="SELECT id_cargo, cargo, tipo FROM tblCBO WHERE (SUBSTRING(id_cargo, 1, 4) = SUBSTRING(@id_cargo, 1, 4)) AND (tipo &lt;&gt; 'Família')">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ddlCbofamilia" Name="id_cargo" 
                                                                PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 184px">
                                                    Pretensão Salarial R$:</td>
                                                <td>
                                                    <asp:TextBox ID="txtObjetivoPretensao" runat="server" 
                                                        ToolTip="Digite somente os números sem vírgulas e pontos."></asp:TextBox>
                                                    <cc2:MaskedEditExtender ID="ObjetivoPretensao_MaskedEditExtender" 
                                                        runat="server" TargetControlID="txtObjetivoPretensao" DisplayMoney="Left" 
                                                        InputDirection="RightToLeft" Mask="99,999.99" MaskType="Number"></cc2:MaskedEditExtender>
                                                </td>
                                                <td>
                                                    <asp:CompareValidator ID="CompareValidator8" runat="server" 
                                                        ControlToValidate="txtObjetivoPretensao" ErrorMessage="Informe uma pretensão válida" 
                                                        Operator="GreaterThan" Type="Currency" ValueToCompare="1"></asp:CompareValidator>
                                                    .<br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                                                        ControlToValidate="txtObjetivoPretensao" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-family: verdana; font-size: 11px">
                                        <span style="width: 100px">Aceita transferência de localidade?<span 
                                            style="width: 100px"><asp:RadioButtonList ID="radioAceitaTransf" 
                                            runat="server" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("aceitaTransferencia") %>' Width="120px">
                                            <asp:ListItem Selected="True" Value="S">Sim</asp:ListItem>
                                            <asp:ListItem Value="N">Não</asp:ListItem>
                                        </asp:RadioButtonList>
                                        </span></span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblObjetivoAviso" runat="server" CssClass="labelLaranja" 
                                            style="color: #FF6600" Font-Names="Verdana" Font-Size="11px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="labelLaranja" style="font-family: verdana; font-size: 11px">
                                        <asp:ImageButton ID="ibtObjetivoAdicionar" runat="server" 
                                            ImageUrl="~/icones/Standard/001_01.gif" 
                                            ToolTip="Adicionar objetivo profissional" ImageAlign="Middle" />
                                        &nbsp;Clique aqui para gravar os seus dados.</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                            DataKeyNames="id_candidato_fk,id_area_fk,id_cargo_fk" 
                                            DataSourceID="sqlObjetivo" Font-Names="Verdana" Font-Size="11px">
                                            <Columns>
                                                <asp:BoundField DataField="area" HeaderText="Área" SortExpression="area" />
                                                <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                                                <asp:BoundField DataField="pretensao" DataFormatString="{0:c}" 
                                                    HeaderText="Pretensão" SortExpression="pretensao" />
                                                <asp:BoundField DataField="aceitaTransferencia" 
                                                    HeaderText="Aceita Transferência" SortExpression="aceitaTransferencia"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                                <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnExcluirHist" runat="server" CausesValidation="False" 
                                                            CommandName="Delete" ImageUrl="~/icones/Standard/001_05.gif" 
                                                            onclick="btnExcluirHist_Click" Text="Excluir registro" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:SqlDataSource ID="sqlObjetivo" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                            DeleteCommand="DELETE FROM [tblCandidatoObjetivo] WHERE [id_candidato_fk] = @id_candidato_fk AND [id_area_fk] = @id_area_fk AND [id_cargo_fk] = @id_cargo_fk" 
                                            InsertCommand="INSERT INTO tblCandidatoObjetivo(id_candidato_fk, id_area_fk, id_cargo_fk, pretensao, aceitaTransferencia) VALUES (@id_candidato_fk, @id_area_fk, @id_cargo_fk, @pretensao, @aceitaTransferencia)" 
                                            SelectCommand="SELECT tblCandidatoObjetivo.id_candidato_fk, tblCandidatoObjetivo.id_area_fk, tblCandidatoObjetivo.id_cargo_fk, tblCandidatoObjetivo.pretensao, tblCandidatoObjetivo.aceitaTransferencia, viewSGA_AreasConhecimento.area, tblCBO.cargo FROM tblCandidatoObjetivo INNER JOIN tblCBO ON tblCandidatoObjetivo.id_cargo_fk = tblCBO.id_cargo INNER JOIN viewSGA_AreasConhecimento ON tblCandidatoObjetivo.id_area_fk = viewSGA_AreasConhecimento.codigo COLLATE SQL_Latin1_General_CP1_CI_AS WHERE (tblCandidatoObjetivo.id_candidato_fk = @id_candidato)" 
                                            
                                            
                                            
                                            UpdateCommand="UPDATE tblCandidatoObjetivo SET pretensao = @pretensao, aceitaTransferencia = @aceitaTransferencia WHERE (id_candidato_fk = @id_candidato_fk) AND (id_area_fk = @id_area_fk) AND (id_cargo_fk = @id_cargo_fk)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="id_candidato" SessionField="id_candidato" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="id_candidato_fk" Type="Int32" />
                                                <asp:Parameter Name="id_area_fk" Type="String" />
                                                <asp:Parameter Name="id_cargo_fk" Type="String" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="pretensao" Type="Decimal" />
                                                <asp:Parameter Name="id_candidato_fk" Type="Int32" />
                                                <asp:Parameter Name="id_area_fk" Type="String" />
                                                <asp:Parameter Name="id_cargo_fk" Type="String" />
                                                <asp:Parameter Name="aceitaTransferencia" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" 
                                                    Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlObjetivoArea" Name="id_area_fk" 
                                                    PropertyName="SelectedValue" Type="String" />
                                                <asp:ControlParameter ControlID="ddlObjetivoCargo" Name="id_cargo_fk" 
                                                    PropertyName="SelectedValue" Type="String" />
                                                <asp:ControlParameter ControlID="txtObjetivoPretensao" Name="pretensao" 
                                                    PropertyName="Text" Type="Decimal" />
                                                <asp:ControlParameter ControlID="radioAceitaTransf" Name="aceitaTransferencia" 
                                                    PropertyName="Text" Type="String" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                    </asp:View>
                        
                     <asp:View id="viewHistorico" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td style="font-family: VERdana; font-size: 10px; color: #0066FF">
                                    Aqui você vai registrar dados referentes à sua experiência profissional. 
                                    Preencha os campos a seguir e clique no botão com sinal de adição para incluir 
                                    as informações. Se desejar inserir mais de uma experiência, preencha novamente 
                                    os campos e clique no botão com o sinal de adição que se encontra na parte 
                                    inferior da tela.
                                    <br />
                                    <br />
                                    Ao finalizar, siga para a próxima etapa – <b>Objetivo Profissional.</b>
</td>
                            </tr>
                            <tr>
                                <td align="left" valign="top">
                                    <table style="width:100%; font-family: verdana; font-size: 11px;">
                                        <tr>
                                            <td style="width: 145px">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 145px">
                                                Empresa:</td>
                                            <td>
                                                <asp:TextBox ID="txtHisEmpresa" runat="server" MaxLength="150" 
                                                    ToolTip="Informe a empresa" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                    ControlToValidate="txtHisEmpresa" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 145px">
                                                Família CBO:</td>
                                            <td colspan="2">
                                                <asp:DropDownList ID="ddlCbofamiliaHist" runat="server" AutoPostBack="True" 
                                                    DataSourceID="sqlCboFamilia" DataTextField="cargo" DataValueField="id_cargo" 
                                                    Font-Size="10px" Width="550px">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="sqlCboFamiliaHist" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                    SelectCommand="SELECT id_cargo, cargo FROM tblCBO WHERE (tipo = 'Família') ORDER BY cargo">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Família" Name="tipo" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 145px">
                                                Cargo Ocupado:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlHistoricoCargo" runat="server" 
                                                    DataSourceID="sqlCBOLista" DataTextField="cargo" DataValueField="id_cargo" 
                                                    Width="300px">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="sqlCBOLista" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                    SelectCommand="SELECT id_cargo, cargo, tipo FROM tblCBO WHERE (SUBSTRING(id_cargo, 1, 4) = SUBSTRING(@id_cargo, 1, 4)) AND (tipo &lt;&gt; 'Família')">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlCbofamiliaHist" Name="id_cargo" 
                                                            PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                                                    ControlToValidate="ddlHistoricoCargo" 
                                                    ErrorMessage="Cargo já foi inserido. Favor escolher outra opção." Width="300px"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 145px">
                                                Trabalhando atualmente?</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownTrabalhando" runat="server" AutoPostBack="True">
                                                    <asp:ListItem Value="Não">Não</asp:ListItem>
                                                    <asp:ListItem Value="Sim">Sim</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 145px">
                                                Início:</td>
                                            <td>
                                                <asp:TextBox ID="txtHisInicio" runat="server" MaxLength="10" 
                                                    ToolTip="Preencha no formato mm/aaaa. " Width="100"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                    ControlToValidate="txtHisInicio" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                                <cc2:MaskedEditExtender ID="txtHisInicio_MaskedEditExtender" runat="server" 
                                                    CultureName="pt-BR" Mask="99/9999" MaskType="Date" 
                                                    TargetControlID="txtHisInicio"></cc2:MaskedEditExtender>
                                            </td>
                                            <td>
                                                <br />
                                                <asp:CompareValidator ID="valDatHist" runat="server" 
                                                    ControlToValidate="txtHisInicio" ErrorMessage="Data inválida." 
                                                    Operator="LessThan" Type="Date" ValueToCompare="12/2010" Visible="False"></asp:CompareValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 145px">
                                                <asp:Label ID="lblDataDim" runat="server" Text="Fim:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtHisFim" runat="server" Width="100" MaxLength="10" 
                                                    ToolTip="Preencha no formato mm/aaaa."></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="Reqdatafim" runat="server" 
                                                    ControlToValidate="txtHisFim" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                                <cc2:MaskedEditExtender ID="txtHisFim_MaskedEditExtender" runat="server" 
                                                    CultureName="pt-BR" Mask="99/9999" MaskType="Date" 
                                                    TargetControlID="txtHisFim"></cc2:MaskedEditExtender>
                                                <br />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td style="width: 145px">
                                                Descrição das Atividades:</td>
                                            <td>
                                                <asp:TextBox ID="txtHisDescricao" runat="server" MaxLength="3000" 
                                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                                    ControlToValidate="txtHisDescricao" ErrorMessage="Campo obrigatório." 
                                                    Width="180px"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 145px">
                                                Última Remuneração:</td>
                                            <td>
                                                <asp:TextBox ID="txtHisRemuneracao" runat="server" MaxLength="20" 
                                                    ToolTip="Digite somente os números sem vírgulas e pontos."></asp:TextBox>
                                                <cc2:MaskedEditExtender ID="txtHisRemuneracao_MaskedEditExtender" 
                                                    runat="server" DisplayMoney="Left" InputDirection="RightToLeft" 
                                                    Mask="99,999.99" MaskType="Number" TargetControlID="txtHisRemuneracao"></cc2:MaskedEditExtender>
                                                <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                                    ControlToValidate="txtHisRemuneracao" 
                                                    ErrorMessage="Por favor, informe um valor válido." Operator="GreaterThan" 
                                                    Type="Currency" ValueToCompare="0"></asp:CompareValidator>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                                    ControlToValidate="txtHIsRemuneracao" ErrorMessage="Campo obrigatório."></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="labelLaranja" colspan="2">
                                                <asp:ImageButton ID="ibtHistoricoAdicionar" runat="server" 
                                                    ImageUrl="~/icones/Standard/001_01.gif" 
                                                    ToolTip="Adicionar histórico profissional" />
                                                &nbsp;Clique aqui para gravar os seus dados.</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lblHistoricoAviso" runat="server" CssClass="labelLaranja" 
                                                    style="color: #FF6600"></asp:Label>
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="gvHistorico" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" DataSourceID="sqlHistorico" 
                                        DataKeyNames="id_historico" Font-Names="Verdana" Font-Size="11px">
                                        <Columns>
                                            <asp:BoundField DataField="empresa" HeaderText="Empresa" 
                                                SortExpression="empresa" />
                                            <asp:BoundField DataField="inicio" DataFormatString="{0:d}" HeaderText="Início" 
                                                SortExpression="inicio" />
                                            <asp:BoundField DataField="fim" DataFormatString="{0:d}" HeaderText="Fim" 
                                                SortExpression="fim" />
                                            <asp:BoundField DataField="trabalhando" HeaderText="Trabalhando atualmente" 
                                                SortExpression="trabalhando" />
                                            <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                                            <asp:BoundField DataField="remuneracao" DataFormatString="{0:c}" 
                                                HeaderText="Remuneração" SortExpression="remuneracao" />
                                            <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnExcluirHist" runat="server" CausesValidation="False" 
                                                        CommandName="Delete" ImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                                        onclick="btnExcluirHist_Click" 
                                                        onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                                        Text="Delete" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="sqlHistorico" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        InsertCommand="INSERT INTO tblCandidatoHistorico(id_candidato_fk, empresa, inicio, fim, trabalhando, remuneracao, descricao, id_cargo_fk) VALUES (@id_candidato_fk, @empresa, @inicio, @fim, @trabalhando, @remuneracao, @descricao, @id_cargo_fk)" 
                                        ProviderName="<%$ ConnectionStrings:SENACRJConnectionString.ProviderName %>" 
                                        
                                        
                                        SelectCommand="SELECT tblCandidatoHistorico.id_historico, tblCandidatoHistorico.id_candidato_fk, tblCandidatoHistorico.empresa, tblCandidatoHistorico.inicio, tblCandidatoHistorico.fim, tblCandidatoHistorico.trabalhando, tblCandidatoHistorico.remuneracao, tblCandidatoHistorico.descricao, tblCBO.cargo FROM tblCandidatoHistorico INNER JOIN tblCBO ON tblCandidatoHistorico.id_cargo_fk = tblCBO.id_cargo WHERE (tblCandidatoHistorico.id_candidato_fk = @id_candidato_fk)" 
                                        
                                        DeleteCommand="DELETE FROM tblCandidatoHistorico WHERE (id_historico = @id_historico)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="id_historico" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                                            <asp:ControlParameter ControlID="txtHisEmpresa" Name="empresa" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="txtHisInicio" Name="inicio" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtHisFim" Name="fim" PropertyName="Text" 
                                                Type="String" />
                                            <asp:ControlParameter ControlID="DropDownTrabalhando" Name="trabalhando" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="txtHisRemuneracao" Name="remuneracao" 
                                                PropertyName="Text" Type="Decimal" />
                                            <asp:ControlParameter ControlID="txtHisDescricao" Name="descricao" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="ddlHistoricoCargo" Name="id_cargo_fk" 
                                                PropertyName="SelectedValue" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View id="viewConhecimentos" runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td align="left" valign="top">
                                    <table style="width:100%; font-family: verdana; font-size: 11px;">
                                        <tr>
                                            <td colspan="2" 
                                                
                                                style="font-family: verdana; font-size: 10px; color: #0066FF;">
                                                Registre aqui informações sobre seus conhecimentos de informática. Clique no 
                                                botão com sinal de adição para incluir as informações. A seguir, selecione 
                                                idiomas, registre seus conhecimentos na área e clique no botão com sinal de 
                                                adição para incluir as informações.
                                                <br />
                                                <br />
                                                Ao finalizar, siga para a próxima etapa – <b>Outros Cursos.</b>
 </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 130px">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 130px">
                                                Área de Conhecimento:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlConhecimentoArea" runat="server" AutoPostBack="True" 
                                                    DataSourceID="sqlAreaConhecimentoLista" DataTextField="area" 
                                                    DataValueField="codigo">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="sqlAreaConhecimentoLista" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                    SelectCommand="SELECT codigo, area FROM viewSGA_AreasConhecimento WHERE (area IN ('informática', 'idiomas'))">
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 130px">
                                                Conhecimento:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlConhecimento" runat="server" 
                                                    DataSourceID="sqlConhecimentoLista" DataTextField="descricao" 
                                                    DataValueField="id_conhecimento" Width="200px">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="sqlConhecimentoLista" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                    
                                                    SelectCommand="SELECT a.id_conhecimento, a.descricao, b.id_candidato_fk, a.id_area_fk FROM tblConhecimento AS a LEFT OUTER JOIN (SELECT id_candidato_fk, id_conhecimento_fk, nivel FROM tblCandidatoConhecimento WHERE (id_candidato_fk = @id_candidato_fk)) AS b ON a.id_conhecimento = b.id_conhecimento_fk WHERE (b.id_candidato_fk IS NULL) AND (a.id_area_fk = @id_area_fk) ORDER BY a.id_conhecimento">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                                                        <asp:ControlParameter ControlID="ddlConhecimentoArea" Name="id_area_fk" 
                                                            PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                                                    ControlToValidate="ddlConhecimento" 
                                                    ErrorMessage="Item já incluído, favor escolher outra opção." Width="250px"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 130px">
 Nível</td>
                                            <td>
                                                <asp:DropDownList ID="ddlConhecimentoNivel" runat="server">
                                                    <asp:ListItem Value="Básico">Básico</asp:ListItem>
                                                    <asp:ListItem Value="Intermediário">Intermediário</asp:ListItem>
                                                    <asp:ListItem Value="Avançado">Avançado</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="labelLaranja">
                                                <asp:ImageButton ID="ibtConhecimentoAdicionar" runat="server" 
                                                    ImageUrl="~/icones/Standard/001_01.gif" ToolTip="Adicionar conhecimento" />
                                                &nbsp;Clique aqui para gravar os seus dados.</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="lblConhecimentoAviso" runat="server" CssClass="labelLaranja"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:GridView ID="gvConhecimento" runat="server" AllowSorting="True" 
                                                    AutoGenerateColumns="False" DataKeyNames="id_candidato_fk,id_conhecimento_fk" 
                                                    DataSourceID="sqlConhecimento">
                                                    <Columns>
                                                        <asp:BoundField DataField="descricao" HeaderText="Descrição" 
                                                            SortExpression="descricao" />
                                                        <asp:BoundField DataField="nivel" HeaderText="Nível" SortExpression="nivel" >
                                                            <HeaderStyle Width="100px" />
                                                            <ItemStyle Width="50px" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="btnExcluirConhecimentos" runat="server" 
                                                                    CausesValidation="False" CommandName="Delete" 
                                                                    ImageUrl="~/icones/Standard/001_05.gif" onclick="btnExcluirConhecimentos_Click" 
                                                                    onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                                                    Text="Excluir registro" />
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:SqlDataSource ID="sqlConhecimento" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                    DeleteCommand="DELETE FROM tblCandidatoConhecimento WHERE (id_candidato_fk = @id_candidato_fk) AND (id_conhecimento_fk = @id_conhecimento_fk)" 
                                                    InsertCommand="INSERT INTO tblCandidatoConhecimento(id_candidato_fk, id_conhecimento_fk, nivel) VALUES (@id_candidato_fk, @id_conhecimento_fk, @nivel)" 
                                                    SelectCommand="SELECT tblCandidatoConhecimento.id_candidato_fk, tblConhecimento.descricao, tblCandidatoConhecimento.nivel, tblCandidatoConhecimento.id_conhecimento_fk FROM tblConhecimento RIGHT OUTER JOIN tblCandidatoConhecimento ON tblConhecimento.id_conhecimento = tblCandidatoConhecimento.id_conhecimento_fk WHERE (tblCandidatoConhecimento.id_candidato_fk = @id_candidato_fk)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                                                    </SelectParameters>
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="id_candidato_fk" />
                                                        <asp:Parameter Name="id_conhecimento_fk" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                                                        <asp:ControlParameter ControlID="ddlConhecimento" Name="id_conhecimento_fk" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="ddlConhecimentoNivel" Name="nivel" 
                                                            PropertyName="SelectedValue" />
                                                    </InsertParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="Outros" runat="server">
                        <asp:FormView ID="fvOutros" runat="server" DataKeyNames="id_candidato" 
                            DataSourceID="sqlOutros" DefaultMode="Edit">
                            <EditItemTemplate>
                                <table style="width:100%;">
                                    <tr>
                                        <td>
 Obervações finais:</td>
                                        <td>
                                            <asp:TextBox ID="observacoesTextBox" runat="server" TextMode="MultiLine" 
                                                MaxLength="1000" Width="300px" 
                                                Text='<%# Bind("observacoes") %>' Rows="5" />
                                        </td>
                                        <td>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Como conheceu o Click Oportunidades?</td>
                                        <td>
                                            <asp:DropDownList ID="ddlOutros" runat="server" AutoPostBack="True" 
                                                DataSourceID="sqlDescobriuLista" DataTextField="descobriu" 
                                                DataValueField="id_descobriu" 
                                                onselectedindexchanged="DropDownList1_SelectedIndexChanged1" 
                                                SelectedValue='<%# Bind("id_descobriu_fk") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="sqlDescobriuLista" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                SelectCommand="SELECT id_descobriu, descobriu FROM tblDescobriu ORDER BY id_descobriu">
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td>
 Outro:</td>
                                        <td>
                                            <asp:TextBox ID="descobriu_outrosTextBox" runat="server" Width="300px" 
                                                Text='<%# Bind("descobriu_outros") %>' />
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rqOutros" runat="server" 
                                                ErrorMessage="Por favor, infome como ficou sabendo do Click Oportunidades" 
                                                ControlToValidate="descobriu_outrosTextBox"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:ImageButton ID="ibtConhecimentoAdicionar" runat="server" 
                                    CommandName="update" ImageUrl="~/icones/Standard/001_06.gif" ToolTip="Gravar" />
                                <br />
                            </EditItemTemplate>
                            <InsertItemTemplate>
 id_descobriu_fk:
 <asp:TextBox ID="id_descobriu_fkTextBox" runat="server" 
                                    Text='<%# Bind("id_descobriu_fk") %>' />
                                <br />
 descobriu_outros:
 <asp:TextBox ID="descobriu_outrosTextBox" runat="server" 
                                    Text='<%# Bind("descobriu_outros") %>' />
                                <br />
 observacoes:
 <asp:TextBox ID="observacoesTextBox" runat="server" 
                                    Text='<%# Bind("observacoes") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insert" />
                                <asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="sqlOutros" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            DeleteCommand="DELETE FROM [tblCandidato] WHERE [id_candidato] = @id_candidato" 
                            InsertCommand="INSERT INTO [tblCandidato] ([id_descobriu_fk], [descobriu_outros], [observacoes]) VALUES (@id_descobriu_fk, @descobriu_outros, @observacoes)" 
                            SelectCommand="SELECT id_candidato, id_descobriu_fk, descobriu_outros, observacoes FROM tblCandidato WHERE (id_candidato = @id_candidato)" 
                            
                            UpdateCommand="UPDATE [tblCandidato] SET [id_descobriu_fk] = @id_descobriu_fk, [descobriu_outros] = @descobriu_outros, [observacoes] = @observacoes WHERE [id_candidato] = @id_candidato">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_candidato" SessionField="id_candidato" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="id_candidato" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="id_descobriu_fk" Type="Int32" />
                                <asp:Parameter Name="descobriu_outros" Type="String" />
                                <asp:Parameter Name="observacoes" Type="String" />
                                <asp:SessionParameter Name="id_candidato" SessionField="id_candidato" 
                                    Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="id_descobriu_fk" Type="Int32" />
                                <asp:Parameter Name="descobriu_outros" Type="String" />
                                <asp:Parameter Name="observacoes" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                </asp:MultiView>
            </asp:panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    




</form>

