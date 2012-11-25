<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admConvacacao.aspx.vb" Inherits="clickoportunidades_AdmVagas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    
    <title>Untitled Page</title>
    <style type="text/css">

        .style9
        {
            width: 49%;
        }
        .style8
        {
            width: 153px;
        }
        .style1
        {
            width: 100%;
        }
        
.grid th
{
	background-color:#EFEFEF;
	font-weight:normal;
	border-color:#ccc;
}

        .style7
        {
            margin-top: 6px;
        }
        .style12
        {
            width: 528px;
            height: 178px;
        }
        
        .style17
        {
            width: 151px;
            height: 41px;
        }
        .style18
        {
        }
        .style19
        {
            width: 151px;
            }
        .style11
        {
            width: 151px;
            height: 13px;
        }
        .style21
        {
            height: 13px;
        }
                
        .style15
        {
            width: 151px;
            height: 48px;
        }
        
.altrowstyle 
{
	background-color:#EFEFEF;}

.pagerstyle {font-size:x-small;text-align:right;background:url(../../images/bcktop.gif) repeat-x;
    background-position: bottom left;}

.LetraNormal {color:#000000;text-decoration: none;font-size: 8pt;font-style:normal;font-weight:normal}

.irapag{
    font-size:x-small;
    width:20px;
}
.primero{
    background:transparent url(Img/first.gif) no-repeat scroll center;
    height:1.3em;
    width:16px;
    cursor:pointer;
}
.anterior{
    background:transparent url(Img/previous.gif) no-repeat scroll center;
    height:1.3em;
    width:16px;
    cursor:pointer;
}
.siguiente{
    background:transparent url(Img/next.gif) no-repeat scroll center;
    height:1.3em;
    width:16px;
    cursor:pointer;
}
.ultimo{
    background:transparent url(Img/last.gif) no-repeat scroll center;
    height:1.3em;
    width:16px;
    cursor:pointer;
}
        
        .style14
        {
            width: 127px;
        }
        
        .style22
        {
            color: #0066FF;
            font-size: small;
        }
        .style23
        {
            font-weight: bold;
        }
        
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
            <asp:Label ID="lblvagasadm" runat="server" Font-Bold="True" 
                Font-Names="Verdana" Font-Size="12px" ForeColor="#0066FF" 
                Text="Convocação de candidatos"></asp:Label>
            <br />
        <br />
            <asp:Label ID="lblaviso" runat="server" Font-Bold="True" Font-Names="Verdana" 
                Font-Size="10px" ForeColor="#FF6600"></asp:Label>
            <br />
            <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" 
                DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
                ForeColor="#284E98" Orientation="Horizontal" StaticSubMenuIndent="10px">
                <StaticSelectedStyle BackColor="#507CD1" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <Items>
                    <asp:MenuItem Selected="True" Text="Buscar Vagas" Value="0"></asp:MenuItem>
                    <asp:MenuItem Text="Entrevista" Value="3"></asp:MenuItem>
                </Items>
            </asp:Menu>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
            EnableTheming="False">
            <asp:View ID="ViewAdmVaga" runat="server">
                <table border="0" cellpadding="0" cellspacing="0" class="style9" 
                    style="border: 1px solid #0066FF; font-family: verdana; font-size: 12px; font-weight: bold; color: #0066FF; padding-left: 5px;">
                    <tr>
                        <td class="style8">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="lblcodvaga" runat="server" Text="Código da vaga:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtvaga" runat="server" Width="80px" MaxLength="7"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="lblempresa" runat="server" Text="Nome da empresa:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtempresa" runat="server" Width="300px" MaxLength="150"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="lblcnpj" runat="server" Text="CNPJ:"></asp:Label>
                        </td>
                        <td width="80p">
                            <asp:TextBox ID="txtcnpj" runat="server" Width="120px" MaxLength="20"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="lbldtinicio" runat="server" Text="Data inícial:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtdatinicio" runat="server" Width="62px" MaxLength="8"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RqDatainicio" runat="server" 
                                ControlToValidate="txtdatinicio" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                            &nbsp;<asp:CompareValidator ID="compData" runat="server" 
                                ControlToCompare="txtdatfim" ControlToValidate="txtdatinicio" 
                                ErrorMessage="Data inválida." Operator="LessThanEqual" Type="Date" 
                                ValueToCompare="01/01/2006"></asp:CompareValidator>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                                TargetControlID="txtdatinicio"></ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="lbldatfim" runat="server" Text="Data Final"></asp:Label>
                            :</td>
                        <td>
                            <asp:TextBox ID="txtdatfim" runat="server" Width="62px" MaxLength="8"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RqDataFim" runat="server" 
                                ControlToValidate="txtdatfim" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txtdatinicio" ControlToValidate="txtdatfim" 
                                ErrorMessage="Data inválida." Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" 
                                TargetControlID="txtdatfim"></ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="lblmuncipio" runat="server" Text="Município:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="cbomunicipio" runat="server" DataSourceID="Sqlmunicipio" 
                                DataTextField="nome" DataValueField="id_municipio">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Sqlmunicipio" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT NULL AS id_municipio, 'Selecione' AS nome UNION ALL SELECT id_municipio, nome FROM tblMunicipio ORDER BY id_municipio">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="lblmodalidade" runat="server" Text="Forma de contratação:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="cbomodalidade" runat="server" 
                                DataSourceID="Sqlmodalidade" DataTextField="modalidade" 
                                DataValueField="id_modalidade">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Sqlmodalidade" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT NULL AS id_modalidade, 'Selecione' AS modalidade UNION ALL SELECT id_modalidade, modalidade FROM tblVagaModalidade ORDER BY id_modalidade">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Status da vaga</td>
                        <td>
                            <asp:RadioButtonList ID="rdAtivada" runat="server" RepeatDirection="Horizontal" 
                                AutoPostBack="True">
                                <asp:ListItem Value="2">Ativada</asp:ListItem>
                                <asp:ListItem Value="1">Desativada</asp:ListItem>
                                <asp:ListItem Value="0">Em Andamento</asp:ListItem>
                            </asp:RadioButtonList>
                            &nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:ImageButton ID="botaoAdmVagas" runat="server" ImageAlign="Bottom" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" />
                            &nbsp;Clique aqui para buscar vagas.</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    EnableScriptGlobalization="True">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="Sqlvagas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    SelectCommand="SELECT tblVaga.id_vaga, tblVaga.id_cargo_fkPai, tblVaga.id_empresa_fk, tblVaga.modalidade_inicio, tblVaga.modalidade_fim, tblVaga.descricao, tblVaga.perfil, tblVaga.Faixaetariainicial, tblVaga.Faixaetariafinal, tblVaga.sexo, tblVaga.estado_civil, tblVaga.horario_entrada, tblVaga.horario_saida, tblVaga.domingo, tblVaga.segunda, tblVaga.terca, tblVaga.quarta, tblVaga.quinta, tblVaga.sexta, tblVaga.sabado, tblVaga.horario_obs, tblVaga.Data, tblVaga.salario, tblVaga.salario_dia, tblVaga.salario_dia_mes, tblVaga.vale_transporte, tblVaga.vale_refeicao, tblVaga.vale_alimentacao, tblVaga.plano_saude, tblVaga.refeicao_local, tblVaga.salario_observacao, tblVaga.dados_qualitativos, tblVaga.ultima_atualizacao, tblVaga.encerrada, CASE tblvaga.ativada WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END AS status, tblVaga.Bairro, tblVaga.QuantVaga, tblVaga.Valetransporte, tblVaga.Valetransporte_obs, tblVaga.rua, tblVaga.complemento, tblVaga.bairroent, tblVaga.id_municipio_fk, tblVaga.pontoreferencia, tblEmpresa.razao_social, tblEmpresa.nome_fantasia, tblEmpresa.id_empresa, tblCBO.cargo, tblVagaModalidade.modalidade AS Expr1, tblMunicipio.nome, tblFormacaoNivel.formacao, tblVaga.modalidade, tblEmpresa.cnpj, tblVaga.id_localtrabalho_fk FROM tblVaga INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo INNER JOIN tblVagaModalidade ON tblVaga.modalidade = tblVagaModalidade.id_modalidade INNER JOIN tblMunicipio ON tblVaga.id_localtrabalho_fk = tblMunicipio.id_municipio INNER JOIN tblFormacaoNivel ON tblVaga.id_escolaridade_fk = tblFormacaoNivel.id_formacaonivel LEFT OUTER JOIN tblEmpresa ON tblVaga.id_empresa_fk = tblEmpresa.id_empresa WHERE (tblVaga.ultima_atualizacao BETWEEN CONVERT (smalldatetime, @dtInicio + ' 00:00', 103) AND CONVERT (smalldatetime, @dtfim + ' 23:59', 103)) AND (tblEmpresa.cnpj LIKE '' + @cnpj + '%') AND (tblEmpresa.nome_fantasia LIKE '' + @nome_fantasia + '%') AND (tblVaga.modalidade LIKE '' + @modalidade + '%') AND (tblMunicipio.nome LIKE '' + @nome + '%') AND (CASE tblvaga.ativada WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END = @ativada) ORDER BY tblVaga.ultima_atualizacao">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="rdAtivada" DefaultValue="" Name="ativada" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtempresa" DefaultValue="" 
                            Name="nome_fantasia" PropertyName="Text" />
                        <asp:ControlParameter ControlID="cbomodalidade" Name="modalidade" 
                            PropertyName="SelectedValue" DefaultValue="" />
                        <asp:ControlParameter ControlID="cbomunicipio" DefaultValue="" Name="nome" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtvaga" DefaultValue="" Name="id_vaga" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtcnpj" DefaultValue="" Name="cnpj" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtdatinicio" Name="dtinicio" 
                            PropertyName="Text" DefaultValue="" ConvertEmptyStringToNull="False" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtdatfim" 
                            Name="dtfim" PropertyName="Text" ConvertEmptyStringToNull="False" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="ViewResultado" runat="server">
                <table border="0" cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td valign="top">
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Verdana" 
                                Font-Size="12px" ForeColor="#3366CC" 
                                Text="Selecione a vaga abaixo para visualizar mais detalhes"></asp:Label>
                            <span lang="pt-br">&nbsp; </span>
                            <asp:ImageButton ID="btnvoltar" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/clickoportunidades/icones/Standard/voltar.jpg" ToolTip="Voltar" />
                            <br />
                            <asp:GridView ID="GridVaga" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" BorderColor="#0066FF" 
                                CellPadding="0" CssClass="grid" DataKeyNames="id_vaga" DataSourceID="Sqlvagas" 
                                Width="747px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Visualizar vaga" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Select" ImageUrl="~/clickoportunidades/icones/Standard/001_59.gif" 
                                                Text="Detalhes" ToolTip="Visualize os detalhes da vaga" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="120px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_vaga" HeaderText="Código da vaga" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="id_vaga">
                                        <ItemStyle HorizontalAlign="Center" Width="200px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Candidatos">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" 
                                                ImageUrl="~/clickoportunidades/icones/Standard/001_57.gif" 
                                                CommandArgument='<%# Bind("id_vaga") %>' onclick="ImageButton2_Click" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="cargo" HeaderText="Cargo" 
                                        SortExpression="cargo">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nome_fantasia" HeaderText="Empresa" 
                                        SortExpression="id_empresa_fk" />
                                    <asp:BoundField DataField="modalidade" HeaderText="Modalidade" 
                                        SortExpression="modalidade" />
                                    <asp:BoundField DataField="nome" HeaderText="Local de trabalho" 
                                        SortExpression="id_localtrabalho_fk">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="formacao" HeaderText="Formação" 
                                        SortExpression="formacao" />
                                    <asp:TemplateField HeaderText="Status da vaga" SortExpression="ativada">
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ativada") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnOK" runat="server" CausesValidation="False" 
                                                CommandName="Select" ImageUrl="~/icones/Standard/001_18.gif" Text="Select" 
                                                ToolTip="Vaga ativada" Visible='<%# Eval("status") = 2 %>' />
                                            <asp:ImageButton ID="btnNO" runat="server" CausesValidation="False" 
                                                ImageUrl="~/Icones/Standard/001_19.gif" ToolTip="Vaga inativa" 
                                                Visible='<%# Eval("status") = 1 %>' Width="24px" />
                                            <asp:ImageButton ID="btnAnalise" runat="server" Height="24px" 
                                                ImageUrl="~/clickoportunidades/icones/Standard/001_11.gif" 
                                                ToolTip="Vaga em análise" Visible='<%# Eval("status") = 0 %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="200px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Última atualização" 
                                        SortExpression="ultima_atualizacao">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" 
                                                Text='<%# Bind("ultima_atualizacao") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" 
                                                Text='<%# Bind("ultima_atualizacao", "{0:D}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="250px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <span lang="pt-br" 
                                        style="font-family: Verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                    Não há registros no momento.</span>
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#D1DDF1" />
                            </asp:GridView>
                            <br />
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                                BackColor="White" BorderColor="#0066FF" BorderStyle="Solid" BorderWidth="1px" 
                                CellPadding="4" CssClass="style7" DataKeyNames="id_empresa,id_vaga" 
                                DataSourceID="SqlDetalheVaga" Font-Names="Verdana" Font-Size="11px" 
                                GridLines="None" Height="50px" 
                                ToolTip="Para modificar o status da vaga, clique nas três icones - azul: Ativar, vermelha: desativar, laranja: Analisar" 
                                Width="362px">
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <Fields>
                                    <asp:TemplateField HeaderText="Status da vaga" SortExpression="ativada">
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ativada") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ativada") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnOK0" runat="server" CausesValidation="False" 
                                                CommandName="Select" ImageUrl="~/icones/Standard/001_18.gif" Text="Select" 
                                                ToolTip="Vaga ativada" Visible='<%# Eval("status") = 2 %>' />
                                            <asp:ImageButton ID="btnNO0" runat="server" CausesValidation="False" 
                                                ImageUrl="~/Icones/Standard/001_19.gif" ToolTip="Vaga inativa" 
                                                Visible='<%# Eval("status") = 1 %>' Width="24px" />
                                            <asp:ImageButton ID="btnAnalise0" runat="server" Height="24px" 
                                                ImageUrl="~/clickoportunidades/icones/Standard/001_11.gif" 
                                                ToolTip="Vaga em análise" Visible='<%# Eval("status") = 0 %>' />
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status da convocação" SortExpression="ativada">
                                        <InsertItemTemplate>
                                            <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("ativada") %>' />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="cboId_ConvStatus" runat="server" 
                                                SelectedValue='<%# Bind("Id_ConvStatus") %>'>
                                                <asp:ListItem Value="0">Em andamento</asp:ListItem>
                                                <asp:ListItem Value="1">Encaminhamento realizado</asp:ListItem>
                                                <asp:ListItem Value="2">Não houve candidato interessado</asp:ListItem>
                                                <asp:ListItem Value="3">Não tivemos candidatos no perfil</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:ImageButton ID="btnAtualizar" runat="server" 
                                                ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                                onclick="btnAtualizar_Click" />
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_vaga" HeaderText="Código da vaga" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="id_vaga" />
                                    <asp:BoundField DataField="id_empresa" HeaderText="Código da empresa" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="id_empresa" />
                                    <asp:TemplateField></asp:TemplateField>
                                    <asp:BoundField DataField="nome_fantasia" HeaderText="Empresa" 
                                        SortExpression="nome_fantasia" />
                                    <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                                    <asp:BoundField DataField="formacao" HeaderText="formacao" 
                                        SortExpression="formacao" />
                                    <asp:BoundField DataField="modalidade" HeaderText="Modalidade" 
                                        SortExpression="modalidade" />
                                    <asp:BoundField DataField="modalidade_inicio" HeaderText="Início" 
                                        SortExpression="modalidade_inicio" />
                                    <asp:BoundField DataField="modalidade_fim" HeaderText="Fim:" 
                                        SortExpression="modalidade_fim" />
                                    <asp:BoundField DataField="horario_entrada" HeaderText="Horário de entrada" 
                                        SortExpression="horario_entrada" />
                                    <asp:BoundField DataField="horario_saida" HeaderText="Horário de saída" 
                                        SortExpression="horario_saida" />
                                    <asp:BoundField DataField="horario_obs" HeaderText="Obs. horário" 
                                        SortExpression="horario_obs" />
                                    <asp:BoundField DataField="descricao" HeaderText="Descrição da vaga" 
                                        SortExpression="descricao" />
                                    <asp:BoundField DataField="perfil" HeaderText="Perfil da vaga" 
                                        SortExpression="perfil" />
                                    <asp:BoundField DataField="Bairro" HeaderText="Bairro" 
                                        SortExpression="Bairro" />
                                    <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo" />
                                    <asp:BoundField DataField="estadocivil" HeaderText="Estado civil" 
                                        SortExpression="estadocivil" />
                                    <asp:BoundField DataField="Faixaetariainicial" 
                                        HeaderText="Faixa etária inicial" SortExpression="Faixaetariainicial" />
                                    <asp:BoundField DataField="Faixaetariafinal" HeaderText="Faixa etária final" 
                                        SortExpression="Faixaetariafinal" />
                                    <asp:BoundField DataField="nome" HeaderText="Município" SortExpression="nome" />
                                    <asp:BoundField DataField="QuantVaga" HeaderText="Qt. de Vaga" 
                                        SortExpression="QuantVaga" />
                                    <asp:TemplateField></asp:TemplateField>
                                    <asp:TemplateField HeaderText="Benefícios">
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Vale refeição" SortExpression="vale_refeicao">
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="CheckBox4" runat="server" 
                                                Checked='<%# Bind("vale_refeicao") %>' />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:CheckBox ID="CheckBox2" runat="server" 
                                                Checked='<%# Bind("vale_refeicao") %>' />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox5" runat="server" 
                                                Checked='<%# Bind("vale_refeicao") %>' Enabled="False" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="vale_alimentacao" HeaderText="Vale alimentação" 
                                        SortExpression="vale_alimentacao" />
                                    <asp:CheckBoxField DataField="plano_saude" HeaderText="Plano saúde" 
                                        SortExpression="plano_saude" />
                                    <asp:TemplateField HeaderText="Vale transporte" SortExpression="Valetransporte">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Valetransporte") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Valetransporte") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" 
                                                Text='<%# Bind("Valetransporte", "{0:C}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField></asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dias da semana:">
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="segunda" HeaderText="segunda" 
                                        SortExpression="segunda">
                                        <ItemStyle Font-Bold="True" />
                                    </asp:CheckBoxField>
                                    <asp:CheckBoxField DataField="terca" HeaderText="terca" 
                                        SortExpression="terca" />
                                    <asp:CheckBoxField DataField="quarta" HeaderText="quarta" 
                                        SortExpression="quarta" />
                                    <asp:CheckBoxField DataField="quinta" HeaderText="quinta" 
                                        SortExpression="quinta" />
                                    <asp:CheckBoxField DataField="sexta" HeaderText="sexta" 
                                        SortExpression="sexta" />
                                    <asp:CheckBoxField DataField="sabado" HeaderText="sábado" 
                                        SortExpression="sabado" />
                                    <asp:CheckBoxField DataField="domingo" HeaderText="domingo" 
                                        SortExpression="domingo" />
                                    <asp:BoundField />
                                    <asp:TemplateField HeaderText="Salário" SortExpression="salario">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("salario") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("salario") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("salario", "{0:C}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="dados_qualitativos" 
                                        HeaderText="Informações adicionais" SortExpression="dados_qualitativos" />
                                    <asp:TemplateField></asp:TemplateField>
                                    <asp:TemplateField HeaderText="Local da entrevista">
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="rua" HeaderText="Endereço:" SortExpression="rua" />
                                    <asp:BoundField DataField="pontoreferencia" HeaderText="Ponto de referência" 
                                        SortExpression="pontoreferencia" />
                                    <asp:BoundField DataField="complemento" HeaderText="Complemento" 
                                        SortExpression="complemento" />
                                    <asp:BoundField DataField="bairroent" HeaderText="Bairro" 
                                        SortExpression="bairroent" />
                                    <asp:BoundField DataField="municipio" HeaderText="Município" 
                                        SortExpression="municipio" />
                                    <asp:BoundField DataField="ultima_atualizacao" HeaderText="Última atualização" 
                                        SortExpression="ultima_atualizacao" />
                                </Fields>
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDetalheVaga" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT DISTINCT tblVaga.modalidade_inicio, tblEmpresa.nome_fantasia, tblVaga.descricao, tblVaga.perfil, tblEmpresa.id_empresa, tblVaga.id_vaga, tblVaga.modalidade_fim, tblVaga.vale_transporte, tblVaga.vale_refeicao, tblVaga.vale_alimentacao, tblVaga.plano_saude, tblVaga.Bairro, tblVaga.horario_entrada, tblVaga.horario_saida, tblVaga.salario, tblVaga.encerrada, tblVaga.ultima_atualizacao, tblMunicipio_1.nome, tblVaga.QuantVaga, tblVaga.Faixaetariainicial, tblVaga.Faixaetariafinal, tblVaga.Valetransporte, tblVaga.ativada, tblCBO.cargo, tblFormacaoNivel.formacao, tblEstadoCivil.estadocivil, tblVaga.domingo, tblVaga.segunda, tblVaga.terca, tblVaga.quarta, tblVaga.quinta, tblVaga.sexta, tblVaga.sabado, tblVaga.horario_obs, tblVaga.salario_observacao, tblVaga.dados_qualitativos, tblVaga.pontoreferencia, tblVaga.bairroent, tblVaga.complemento, tblVaga.rua, CASE tblvaga.ativada WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END AS status, tblSexo.sexo, tblVagaModalidade.modalidade, tblMunicipio.nome AS municipio, tblVaga.Id_ConvStatus FROM tblVaga INNER JOIN tblEmpresa ON tblVaga.id_empresa_fk = tblEmpresa.id_empresa INNER JOIN tblFormacaoNivel ON tblVaga.id_escolaridade_fk = tblFormacaoNivel.id_formacaonivel INNER JOIN tblEstadoCivil ON tblVaga.estado_civil = tblEstadoCivil.id_estadocivil INNER JOIN tblSexo ON tblVaga.sexo = tblSexo.id_sexo INNER JOIN tblVagaModalidade ON tblVaga.modalidade = tblVagaModalidade.id_modalidade LEFT OUTER JOIN tblMunicipio ON tblVaga.id_localtrabalho_fk = tblMunicipio.id_municipio AND tblEmpresa.id_municipio = tblMunicipio.id_municipio LEFT OUTER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo LEFT OUTER JOIN tblMunicipio AS tblMunicipio_1 ON tblVaga.id_localtrabalho_fk = tblMunicipio_1.id_municipio AND tblEmpresa.id_municipio = tblMunicipio_1.id_municipio WHERE (tblVaga.id_vaga = @id_vaga) ORDER BY tblVaga.id_vaga" 
                                
                                UpdateCommand="UPDATE tblVaga SET Id_ConvStatus = @Id_ConvStatus WHERE (id_vaga = @id_vaga)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridVaga" Name="id_vaga" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="Id_ConvStatus" SessionField="id_convstatus" />
                                    <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlAnalise" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT ativada FROM tblVaga" 
                                UpdateCommand="UPDATE tblVaga SET ativada = NULL WHERE (id_vaga = @id_vaga)">
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="GridVaga" Name="id_vaga" 
                                        PropertyName="SelectedValue" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="Gridcandidato" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" CssClass="grid" DataKeyNames="id_vagacandidato" 
                                DataSourceID="SqlCandidatos">
                                <Columns>
                                    <asp:CommandField ButtonType="Image" CausesValidation="False" 
                                        HeaderText="Selecionar candidato" 
                                        SelectImageUrl="~/clickoportunidades/icones/Standard/001_59.gif" 
                                        ShowSelectButton="True">
                                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="id_VagaCandidato" HeaderText="Código" 
                                        SortExpression="id_VagaCandidato">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="identificador" HeaderText="CPF" 
                                        SortExpression="identificador">
                                        <ItemStyle Width="90px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Visualizar currículo">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnViewCandidato" runat="server" CausesValidation="False" 
                                                CommandArgument='<%# Bind("id_candidato") %>' 
                                                ImageUrl="~/clickoportunidades/icones/Standard/001_37.gif" 
                                                onclick="btnViewCandidato_Click" ToolTip="Visualizar dados do candidato" 
                                                Visible='<%# Bind("id_candidato") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_candidato" HeaderText="Código do candidato" 
                                        InsertVisible="False" SortExpression="id_candidato">
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nome" HeaderText="Candidato" SortExpression="nome">
                                        <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Tel/Cel." SortExpression="telefone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("telefone") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("celular") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("telefone") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="formacao" HeaderText="Escolaridade" 
                                        SortExpression="formacao" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <span lang="pt-br" 
                                        style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                    Não existe candidatos para essa vaga. </span>
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#D1DDF1" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlInativar" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT ativada FROM tblVaga" 
                                UpdateCommand="UPDATE tblVaga SET ativada = 'False' WHERE (id_vaga = @id_vaga)">
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="GridVaga" Name="id_vaga" 
                                        PropertyName="SelectedValue" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="Sqlativar" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT ativada FROM tblVaga" 
                                UpdateCommand="UPDATE tblVaga SET ativada = 'True' WHERE (id_vaga = @id_vaga)">
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="GridVaga" Name="id_vaga" 
                                        PropertyName="SelectedValue" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlLogAlteracao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                InsertCommand="INSERT INTO tblLogAlteraVaga(id_vaga, usuario, status) VALUES (@id_vaga, @usuario, @status)" 
                                SelectCommand="SELECT id_vaga FROM tblVaga">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="GridVaga" Name="id_vaga" 
                                        PropertyName="SelectedValue" />
                                    <asp:SessionParameter Name="usuario" SessionField="c_nome" />
                                    <asp:SessionParameter Name="status" SessionField="ativada" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlCandidatos" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT tblAcompanhamentoVagaCandidato.id_VagaCandidato, tblAcompanhamentoVagaCandidato.id_vaga_fk, tblCandidato.identificador, tblCandidato.nome, tblCandidato.telefone, tblCandidato.celular, tblCandidato.email, tblCandidato.id_candidato, tblCandidato.bairro, tblCandidato.nascimento, tblFormacaoNivel.formacao, tblMunicipio.nome AS municipio, tblSexo.sexo FROM tblAcompanhamentoVagaCandidato INNER JOIN tblCandidato ON tblAcompanhamentoVagaCandidato.id_candidato_fk = tblCandidato.id_candidato INNER JOIN tblCandidatoFormacao ON tblCandidato.id_candidato = tblCandidatoFormacao.id_candidato_fk INNER JOIN tblFormacaoNivel ON tblCandidatoFormacao.id_formacaonivel_fk = tblFormacaoNivel.id_formacaonivel INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio INNER JOIN tblSexo ON tblCandidato.sexo = tblSexo.id_sexo WHERE (tblAcompanhamentoVagaCandidato.id_vaga_fk = @id_vaga)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="ViewEntrevistaClick" runat="server">
                &nbsp;<span class="style22"><span class="style23" lang="pt-br">Agendar 
                entrevista no Click&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:ImageButton ID="ImageButton3" runat="server" 
                    ImageUrl="~/clickoportunidades/icones/Standard/voltar.jpg" />
                </span><table border="0" cellpadding="0" cellspacing="0" class="style12" 
                    style="font-family: verdana; font-size: 12px; font-weight: bold; color: #0066FF">
                    <tr>
                        <td class="style17">
                            Código da entrevista:</td>
                        <td class="style18" colspan="0">
                            <asp:Label ID="lblCodEntrevista" runat="server"></asp:Label>
                        </td>
                        <td class="style18" rowspan="6">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style17">
                            <asp:Label ID="lbldataClick" runat="server" Text="Data no Click:"></asp:Label>
                        </td>
                        <td class="style18" colspan="0">
                            <asp:TextBox ID="datdataClick" runat="server" CausesValidation="True" 
                                ToolTip="Digite a data da entrevista no Click" 
                                ValidationGroup="InsereEntrevista" Width="65px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" 
                                Format="dd/MM/yyyy" TargetControlID="datdataclick">
                            </ajaxToolkit:CalendarExtender>
                            &nbsp;<asp:RequiredFieldValidator ID="rqdataclick0" runat="server" 
                                ControlToValidate="datdataclick" ErrorMessage="Campo obrigatório" ToolTip=" " 
                                ValidationGroup="InsereEntrevista"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style19">
                            <asp:Label ID="lblhoraclick" runat="server" Text="Horário:"></asp:Label>
                        </td>
                        <td colspan="0">
                            <asp:TextBox ID="horhoraclick" runat="server" CausesValidation="True" 
                                ToolTip="Digite o horário da entrevista no Click" 
                                ValidationGroup="InsereEntrevista" Width="45px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqhoraclick" runat="server" 
                                ControlToValidate="horhoraclick" ErrorMessage="Campo obrigatório" ToolTip=" " 
                                ValidationGroup="InsereEntrevista"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style11">
                            <asp:Label ID="lblcaptadorent" runat="server" Text="Captador:"></asp:Label>
                        </td>
                        <td class="style21" colspan="0">
                            <asp:DropDownList ID="cbocaptador" runat="server" DataSourceID="Sqloperador" 
                                DataTextField="Nome" DataValueField="Nome" style="height: 22px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            Status da Entrevista:</td>
                        <td>
                            <asp:DropDownList ID="cboid_statusEntrevista" runat="server" 
                                DataSourceID="SqlstatusEntrevista" DataTextField="statusentrevista" 
                                DataValueField="id_statusEntrevista" ToolTip="Selecionar status da entrevista">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlstatusEntrevista" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT 111 AS id_statusEntrevista, 'Selecione' AS statusentrevista UNION ALL SELECT id_statusEntrevista, statusEntrevista FROM tblStatusEntrevista">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="Sqloperador" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                                SelectCommand="SELECT Nome FROM admPortalUsuario WHERE (Nome = @nome)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="nome" SessionField="c_nome" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;<asp:ImageButton ID="btnatualizaEntrevista" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                ToolTip="Alterar agendamento no click" />
                            <span lang="pt-br">&nbsp;</span><asp:ImageButton ID="btnCancelar" runat="server" 
                                ImageAlign="Middle" ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                                ToolTip="Cancelar agendamento" />
                            <span lang="pt-br">&nbsp;<asp:ImageButton ID="btnAgendar" runat="server" 
                                ImageAlign="Middle" ImageUrl="~/clickoportunidades/icones/Standard/001_44.gif" 
                                style="height: 24px" ToolTip="Agendar entrevista na empresa" Visible="False" />
                            &nbsp;</span><asp:Label ID="lblmensagemBotao" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:updatepanel ID="Up2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="GridEntrevista" runat="server" AllowPaging="True" 
                            AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                            CssClass="grid" DataKeyNames="id_entrevista,id_vagacandidato_fk" 
                            DataSourceID="SqlGridEntrevista" PageSize="5" style="margin-right: 0px" 
                            Width="90%">
                            <PagerStyle CssClass="pagerstyle" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" HeaderText="Selecione entrevista" 
                                    SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                    ShowSelectButton="True">
                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                </asp:CommandField>
                                <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                    InsertVisible="False" SortExpression="id_entrevista" />
                                <asp:BoundField DataField="id_vagacandidato_fk" 
                                    HeaderText="Código do candidato" SortExpression="id_vagacandidato_fk" />
                                <asp:TemplateField HeaderText="Data no Click" SortExpression="dataClick">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="horaClick" HeaderText="Hora no Click" 
                                    SortExpression="horaClick" />
                                <asp:TemplateField HeaderText="Status da entrevista" 
                                    SortExpression="statusEntrevista">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("statusEntrevista") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="captador" HeaderText="Captador" 
                                    SortExpression="captador" />
                                <asp:TemplateField HeaderText="Atualização" SortExpression="dataStatus">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("dataStatus") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("dataStatus") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerTemplate>
                                <asp:Label ID="Label18" runat="server" Text="Mostrar filas:" />
                                <asp:DropDownList ID="RegsPag" runat="server" AutoPostBack="true" 
                                    CssClass="LetraNormal" OnSelectedIndexChanged="RegsPag_SelectedIndexChanged">
                                    <asp:ListItem Value="3" />
                                    <asp:ListItem Value="5" />
                                    <asp:ListItem Value="10" />
                                    <asp:ListItem Value="15" />
                                </asp:DropDownList>
                                &nbsp; Ir a
                                <asp:TextBox ID="IraPag" runat="server" AutoPostBack="true" CssClass="irapag" 
                                    OnTextChanged="IraPag" />
                                de
                                <asp:Label ID="lblTotalNumberOfPages" runat="server" />
                                &nbsp;
                                <asp:Button ID="Button4" runat="server" CommandArgument="First" 
                                    CommandName="Page" CssClass="primero" ToolTip="Prim. Pag" />
                                <asp:Button ID="Button1" runat="server" CommandArgument="Prev" 
                                    CommandName="Page" CssClass="anterior" ToolTip="Pág. anterior" />
                                <asp:Button ID="Button2" runat="server" CommandArgument="Next" 
                                    CommandName="Page" CssClass="siguiente" ToolTip="Próx. página" />
                                <asp:Button ID="Button3" runat="server" CommandArgument="Last" 
                                    CommandName="Page" CssClass="ultimo" ToolTip="Últ. Pag" />
                            </PagerTemplate>
                            <EmptyDataTemplate>
                                &nbsp; <span lang="pt-br" 
                                    style="font-family: Verdana; font-size: 11px; font-weight: bold; color: #FF6600">
                                Não existe registros no momento.</span>
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#D1DDF1" />
                            <AlternatingRowStyle CssClass="altrowstyle" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:updatepanel>
                <asp:updatepanel ID="Up4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <br />
                    </ContentTemplate>
                </asp:updatepanel>
                <asp:SqlDataSource ID="SqlGridEntrevista" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    DeleteCommand="DELETE FROM [tblEntrevista] WHERE [id_entrevista] = @original_id_entrevista AND (([id_vagacandidato_fk] = @original_id_vagacandidato_fk) OR ([id_vagacandidato_fk] IS NULL AND @original_id_vagacandidato_fk IS NULL)) AND (([dataEmpresa] = @original_dataEmpresa) OR ([dataEmpresa] IS NULL AND @original_dataEmpresa IS NULL)) AND (([horaEmpresa] = @original_horaEmpresa) OR ([horaEmpresa] IS NULL AND @original_horaEmpresa IS NULL)) AND (([dataClick] = @original_dataClick) OR ([dataClick] IS NULL AND @original_dataClick IS NULL)) AND (([horaClick] = @original_horaClick) OR ([horaClick] IS NULL AND @original_horaClick IS NULL)) AND (([captador] = @original_captador) OR ([captador] IS NULL AND @original_captador IS NULL)) AND (([id_statusEntrevista] = @original_id_statusEntrevista) OR ([id_statusEntrevista] IS NULL AND @original_id_statusEntrevista IS NULL)) AND (([dataStatus] = @original_dataStatus) OR ([dataStatus] IS NULL AND @original_dataStatus IS NULL))" 
                    InsertCommand="INSERT INTO tblEntrevista(id_vagacandidato_fk, dataEmpresa, horaEmpresa, dataClick, horaClick, captador, id_statusEntrevista) VALUES (@id_vagacandidato_fk, @dataEmpresa, @horaEmpresa, @dataClick, @horaClick, @captador, @id_statusEntrevista)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT tblEntrevista.id_entrevista, tblEntrevista.id_vagacandidato_fk, tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.dataStatus, tblStatusEntrevista.statusEntrevista, tblEntrevista.id_statusEntrevista, tblEntrevista.captador, tblEntrevista.id_statusEntrevistaEmp FROM tblEntrevista LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_vagacandidato_fk = @id_vagacandidato_fk) AND (tblEntrevista.id_statusEntrevistaEmp = 9) ORDER BY tblEntrevista.id_entrevista DESC" 
                    UpdateCommand="UPDATE tblEntrevista SET id_statusEntrevista = @id_statusEntrevista WHERE (id_entrevista = @id_entrevista) ">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_vagacandidato_fk" 
                            SessionField="id_vagacandidato" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_id_entrevista" Type="Int32" />
                        <asp:Parameter Name="original_id_vagacandidato_fk" Type="Int32" />
                        <asp:Parameter DbType="DateTime" Name="original_dataEmpresa" />
                        <asp:Parameter Name="original_horaEmpresa" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="original_dataClick" />
                        <asp:Parameter Name="original_horaClick" Type="String" />
                        <asp:Parameter Name="original_captador" Type="String" />
                        <asp:Parameter Name="original_id_statusEntrevista" Type="Int32" />
                        <asp:Parameter DbType="DateTime" Name="original_dataStatus" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="cboid_statusEntrevista" DbType="String" 
                            Name="id_statusEntrevista" PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="id_entrevista" SessionField="id_entrevista" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="id_vagacandidato_fk" 
                            SessionField="id_vagacandidato" Type="Int32" />
                        <asp:ControlParameter ControlID="datdataempresa" DbType="DateTime" 
                            Name="dataEmpresa" PropertyName="Text" />
                        <asp:ControlParameter ControlID="horhoraempresa" Name="horaEmpresa" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="datdataclick" DbType="DateTime" 
                            Name="dataClick" PropertyName="Text" />
                        <asp:ControlParameter ControlID="horhoraclick" Name="horaClick" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="cbocaptador" Name="captador" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="cboid_statusEntrevista" 
                            Name="id_statusEntrevista" PropertyName="SelectedValue" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlEntrevistaForm" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    DeleteCommand="DELETE FROM [tblEntrevista] WHERE [id_entrevista] = @original_id_entrevista AND (([id_vagacandidato_fk] = @original_id_vagacandidato_fk) OR ([id_vagacandidato_fk] IS NULL AND @original_id_vagacandidato_fk IS NULL)) AND (([dataEmpresa] = @original_dataEmpresa) OR ([dataEmpresa] IS NULL AND @original_dataEmpresa IS NULL)) AND (([horaEmpresa] = @original_horaEmpresa) OR ([horaEmpresa] IS NULL AND @original_horaEmpresa IS NULL)) AND (([dataClick] = @original_dataClick) OR ([dataClick] IS NULL AND @original_dataClick IS NULL)) AND (([horaClick] = @original_horaClick) OR ([horaClick] IS NULL AND @original_horaClick IS NULL)) AND (([captador] = @original_captador) OR ([captador] IS NULL AND @original_captador IS NULL)) AND (([id_statusEntrevista] = @original_id_statusEntrevista) OR ([id_statusEntrevista] IS NULL AND @original_id_statusEntrevista IS NULL)) AND (([dataStatus] = @original_dataStatus) OR ([dataStatus] IS NULL AND @original_dataStatus IS NULL))" 
                    InsertCommand="INSERT INTO [tblEntrevista] ([id_vagacandidato_fk], [dataEmpresa], [horaEmpresa], [dataClick], [horaClick], [captador], [id_statusEntrevista]) VALUES (@id_vagacandidato_fk, @dataEmpresa, @horaEmpresa, @dataClick, @horaClick, @captador, @id_statusEntrevista)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.id_statusEntrevista, tblEntrevista.captador FROM tblEntrevista LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_entrevista = @id_entrevista)" 
                    UpdateCommand="UPDATE tblEntrevista SET id_statusEntrevista = @id_statusEntrevista, dataClick = @dataClick, horaClick = @horaClick WHERE (id_entrevista = @id_entrevista)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridEntrevista" Name="id_entrevista" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_id_entrevista" Type="Int32" />
                        <asp:Parameter Name="original_id_vagacandidato_fk" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="original_dataEmpresa" />
                        <asp:Parameter Name="original_horaEmpresa" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_dataClick" />
                        <asp:Parameter Name="original_horaClick" Type="String" />
                        <asp:Parameter Name="original_captador" Type="String" />
                        <asp:Parameter Name="original_id_statusEntrevista" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="original_dataStatus" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="cboid_statusEntrevista" DbType="String" 
                            Name="id_statusEntrevista" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridEntrevista" Name="id_entrevista" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="datdataclick" DbType="DateTime" 
                            Name="dataClick" PropertyName="Text" />
                        <asp:ControlParameter ControlID="horhoraclick" Name="horaClick" 
                            PropertyName="Text" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="id_vagacandidato_fk" 
                            SessionField="id_vagacandidato" Type="Int32" />
                        <asp:ControlParameter ControlID="datdataclick" DbType="DateTime" 
                            Name="dataClick" PropertyName="Text" />
                        <asp:ControlParameter ControlID="horhoraclick" Name="horaClick" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="cbocaptador" Name="captador" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="cboid_statusEntrevista" 
                            Name="id_statusEntrevista" PropertyName="SelectedValue" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlEntrevista" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    SelectCommand="SELECT tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblStatusEntrevista.statusEntrevista, tblEntrevista.id_statusEntrevista, tblEntrevista.captador FROM tblEntrevista LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_entrevista = @id_entrevsita)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridEntrevista" Name="id_entrevsita" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <span lang="pt-br" 
                    style="font-family: Verdana; font-size: 12px; font-weight: bold; color: #0066FF">
                <br />
                Lista de entrevista agendadas com todos os candidatos.</span><br />
                <asp:GridView ID="GridEntrevistaGeral" runat="server" AllowPaging="True" 
                    AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                    CssClass="grid" DataKeyNames="id_entrevista,id_vagacandidato_fk" 
                    DataSourceID="SqlGridEntrevistaGeral" PageSize="5" style="margin-right: 0px" 
                    Width="90%">
                    <PagerStyle CssClass="pagerstyle" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" HeaderText="Selecione entrevista" 
                            SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                            ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                            InsertVisible="False" SortExpression="id_entrevista" />
                        <asp:BoundField DataField="id_vagacandidato_fk" 
                            HeaderText="Código do candidato" SortExpression="id_vagacandidato_fk" />
                        <asp:TemplateField HeaderText="Data no Click" SortExpression="dataClick">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="horaClick" HeaderText="Hora no Click" 
                            SortExpression="horaClick" />
                        <asp:TemplateField HeaderText="Status da entrevista" 
                            SortExpression="statusEntrevista">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label19" runat="server" Text='<%# Bind("statusEntrevista") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="captador" HeaderText="Captador" 
                            SortExpression="captador" />
                        <asp:TemplateField HeaderText="Atualização" SortExpression="dataStatus">
                            <EditItemTemplate>
                                <asp:Label ID="Label20" runat="server" Text='<%# Eval("dataStatus") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Bind("dataStatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerTemplate>
                        <asp:Label ID="Label17" runat="server" Text="Mostrar filas:" />
                        <asp:DropDownList ID="RegsPag0" runat="server" AutoPostBack="true" 
                            CssClass="LetraNormal" OnSelectedIndexChanged="RegsPag_SelectedIndexChanged">
                            <asp:ListItem Value="3" />
                            <asp:ListItem Value="5" />
                            <asp:ListItem Value="10" />
                            <asp:ListItem Value="15" />
                        </asp:DropDownList>
                        &nbsp; Ir a
                        <asp:TextBox ID="IraPag0" runat="server" AutoPostBack="true" CssClass="irapag" 
                            OnTextChanged="IraPag" />
                        de
                        <asp:Label ID="lblTotalNumberOfPages0" runat="server" />
                        &nbsp;
                        <asp:Button ID="Button5" runat="server" CommandArgument="First" 
                            CommandName="Page" CssClass="primero" ToolTip="Prim. Pag" />
                        <asp:Button ID="Button6" runat="server" CommandArgument="Prev" 
                            CommandName="Page" CssClass="anterior" ToolTip="Pág. anterior" />
                        <asp:Button ID="Button7" runat="server" CommandArgument="Next" 
                            CommandName="Page" CssClass="siguiente" ToolTip="Próx. página" />
                        <asp:Button ID="Button8" runat="server" CommandArgument="Last" 
                            CommandName="Page" CssClass="ultimo" ToolTip="Últ. Pag" />
                    </PagerTemplate>
                    <SelectedRowStyle BackColor="#D1DDF1" />
                    <AlternatingRowStyle CssClass="altrowstyle" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlGridEntrevistaGeral" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    DeleteCommand="DELETE FROM [tblEntrevista] WHERE [id_entrevista] = @original_id_entrevista AND (([id_vagacandidato_fk] = @original_id_vagacandidato_fk) OR ([id_vagacandidato_fk] IS NULL AND @original_id_vagacandidato_fk IS NULL)) AND (([dataEmpresa] = @original_dataEmpresa) OR ([dataEmpresa] IS NULL AND @original_dataEmpresa IS NULL)) AND (([horaEmpresa] = @original_horaEmpresa) OR ([horaEmpresa] IS NULL AND @original_horaEmpresa IS NULL)) AND (([dataClick] = @original_dataClick) OR ([dataClick] IS NULL AND @original_dataClick IS NULL)) AND (([horaClick] = @original_horaClick) OR ([horaClick] IS NULL AND @original_horaClick IS NULL)) AND (([captador] = @original_captador) OR ([captador] IS NULL AND @original_captador IS NULL)) AND (([id_statusEntrevista] = @original_id_statusEntrevista) OR ([id_statusEntrevista] IS NULL AND @original_id_statusEntrevista IS NULL)) AND (([dataStatus] = @original_dataStatus) OR ([dataStatus] IS NULL AND @original_dataStatus IS NULL))" 
                    InsertCommand="INSERT INTO tblEntrevista(id_vagacandidato_fk, dataEmpresa, horaEmpresa, dataClick, horaClick, captador, id_statusEntrevista) VALUES (@id_vagacandidato_fk, @dataEmpresa, @horaEmpresa, @dataClick, @horaClick, @captador, @id_statusEntrevista)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT tblEntrevista.id_entrevista, tblEntrevista.id_vagacandidato_fk, tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.dataStatus, tblStatusEntrevista.statusEntrevista, tblEntrevista.id_statusEntrevista, tblEntrevista.captador FROM tblEntrevista LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista ORDER BY tblEntrevista.dataClick" 
                    UpdateCommand="UPDATE tblEntrevista SET id_statusEntrevista = @id_statusEntrevista WHERE (id_entrevista = @id_entrevista) ">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id_entrevista" Type="Int32" />
                        <asp:Parameter Name="original_id_vagacandidato_fk" Type="Int32" />
                        <asp:Parameter DbType="DateTime" Name="original_dataEmpresa" />
                        <asp:Parameter Name="original_horaEmpresa" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="original_dataClick" />
                        <asp:Parameter Name="original_horaClick" Type="String" />
                        <asp:Parameter Name="original_captador" Type="String" />
                        <asp:Parameter Name="original_id_statusEntrevista" Type="Int32" />
                        <asp:Parameter DbType="DateTime" Name="original_dataStatus" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="cboid_statusEntrevista" DbType="String" 
                            Name="id_statusEntrevista" PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="id_entrevista" SessionField="id_entrevista" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="id_vagacandidato_fk" 
                            SessionField="id_vagacandidato" Type="Int32" />
                        <asp:ControlParameter ControlID="datdataempresa" DbType="DateTime" 
                            Name="dataEmpresa" PropertyName="Text" />
                        <asp:ControlParameter ControlID="horhoraempresa" Name="horaEmpresa" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="datdataclick" DbType="DateTime" 
                            Name="dataClick" PropertyName="Text" />
                        <asp:ControlParameter ControlID="horhoraclick" Name="horaClick" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="cbocaptador" Name="captador" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="cboid_statusEntrevista" 
                            Name="id_statusEntrevista" PropertyName="SelectedValue" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                </ContentTemplate>
                </asp:updatepanel>
            </asp:View>
            <asp:View ID="View1" runat="server">
                
                <span class="style22"><span class="style23" lang="pt-br">Agendar entrevista na 
                empresa&nbsp; </span>
                <asp:ImageButton ID="ImageButton4" runat="server" 
                    ImageUrl="~/clickoportunidades/icones/Standard/voltar.jpg" />
                <b><br />
                &nbsp;<br />
                </b>
                <asp:Label ID="lblMsg" runat="server" style="color: #FF0000; font-weight: 700"></asp:Label>
                </span>
                <table class="style1" 
                    style="font-family: Verdana; font-size: 12px; color: #0066FF; font-weight: bold">
                    <tr>
                        <td class="style14">
                            <asp:Label ID="lbldataEmp1" runat="server" Text="Data na Empresa:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="datdataempresa" runat="server" 
                                ToolTip="Digite a data da entrevista na Empresa" Width="65px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="empresa_CalendarExtender" 
                                runat="server" BehaviorID="empresa_CalendarExtender" Enabled="True" 
                                TargetControlID="datdataempresa">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator ID="rqdataempresa1" runat="server" 
                                ControlToValidate="datdataempresa" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="AlteraEntrevista"></asp:RequiredFieldValidator>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="lblhoraemp1" runat="server" Text="Horário:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="horhoraempresa" runat="server" 
                                ToolTip="Digite o horário da entrevista na empresa" Width="45px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqhoraempresa1" runat="server" 
                                ControlToValidate="horhoraempresa" ErrorMessage="Campo obrigatório" ToolTip=" " 
                                ValidationGroup="AlteraEntrevista"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="lblcaptadorent2" runat="server" Text="Captador:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="captador2" runat="server" DataSourceID="Sqloperador" 
                                DataTextField="Nome" DataValueField="Nome">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            Status:</td>
                        <td>
                            <asp:DropDownList ID="cboid_statusEntrevistaEmp" runat="server" 
                                DataSourceID="sqlStatusEntrevistaEmp" DataTextField="statusEntrevista" 
                                DataValueField="id_statusEntrevista">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:SqlDataSource ID="sqlStatusEntrevistaEmp" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT id_statusEntrevista, statusEntrevista FROM tblStatusEntrevista WHERE (id_statusEntrevista = 1) OR (id_statusEntrevista = 9)">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="btnInserirEntEmp" runat="server" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" />
                            <asp:ImageButton ID="btnatualizaEntrevistaEmp1" runat="server" 
                                ImageAlign="Middle" ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                ToolTip="Inserir novo agendamento na empresa" 
                                ValidationGroup="AlteraEntrevista" Visible="False" />
                            <asp:ImageButton ID="btnCancelarEmp" runat="server" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                                Visible="False" />
                            <span lang="pt-br">&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="btnAgendar0" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_44.gif" style="height: 24px" 
                                ToolTip="Agendar entrevista no Click" />
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span lang="pt-br">Clique na seta azul para adicionar um acompanhamento </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:SqlDataSource ID="sqlEntrevistaEmpForm" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT id_entrevista, dataEmpresa, horaEmpresa, id_statusEntrevistaEmp FROM tblEntrevista WHERE (id_entrevista = @id_entrevista)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="sqlEntrevistaEmp" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    InsertCommand="INSERT INTO tblEntrevista(id_vagacandidato_fk, dataEmpresa, horaEmpresa, captador, id_statusEntrevistaEmp) VALUES (@id_vagacandidato_fk, @dataEmpresa, @horaEmpresa, @captador, @id_statusEntrevistaEmp)" 
                    
                    SelectCommand="SELECT tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblStatusEntrevista.statusEntrevista, tblEntrevista.id_statusEntrevista, tblEntrevista.captador, tblEntrevista.id_entrevista, tblCandidato.nome FROM tblEntrevista INNER JOIN tblAcompanhamentoVagaCandidato ON tblEntrevista.id_vagacandidato_fk = tblAcompanhamentoVagaCandidato.id_VagaCandidato INNER JOIN tblCandidato ON tblAcompanhamentoVagaCandidato.id_candidato_fk = tblCandidato.id_candidato LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_vagacandidato_fk = @id_vagacandidato)" 
                    UpdateCommand="UPDATE tblEntrevista SET dataEmpresa = @dataEmpresa, horaEmpresa = @horaEmpresa, captador = @captador, id_statusEntrevistaEmp = @id_statusEntrevistaEmp WHERE (id_entrevista = @id_entrevista)">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_vagacandidato" SessionField="id_vagacandidato" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="datdataempresa" Name="dataEmpresa" 
                        dbtype="DateTime" PropertyName="Text" />
                        <asp:ControlParameter ControlID="horhoraempresa" Name="horaEmpresa" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="captador2" Name="captador" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="cboid_statusEntrevistaEmp" 
                            Name="id_statusEntrevistaEmp" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista" 
                            PropertyName="SelectedValue" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="id_vagacandidato_fk" 
                            SessionField="id_vagacandidato" />
                        <asp:ControlParameter ControlID="datdataempresa" DbType="DateTime" 
                            Name="dataEmpresa" PropertyName="Text" />
                        <asp:ControlParameter ControlID="horhoraempresa" Name="horaEmpresa" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="captador2" Name="captador" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="cboid_statusEntrevistaEmp" 
                            Name="id_statusEntrevistaEmp" PropertyName="SelectedValue" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridEntrevistaEmp0" runat="server" AllowPaging="True" 
                    AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                    CssClass="grid" DataKeyNames="id_entrevista" 
                    DataSourceID="sqlEntrevistaEmp" PageSize="5" Width="49%">
                    <PagerStyle CssClass="pagerstyle" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            HeaderText="Selecionar para acompanhamento" 
                            SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                            ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:BoundField DataField="nome" HeaderText="Candidato" SortExpression="nome">
                        <ItemStyle Width="500px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_entrevista" />
                        <asp:TemplateField HeaderText="Data na Empresa" SortExpression="dataEmpresa">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label21" runat="server" 
                                    Text='<%# Bind("dataEmpresa", "{0:D}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="horaEmpresa" HeaderText="Hora na Empresa" 
                            SortExpression="horaEmpresa" />
                    </Columns>
                    <PagerTemplate>
                        <asp:Label ID="Label22" runat="server" Text="Mostrar filas:" />
                        <asp:DropDownList ID="RegsPag1" runat="server" AutoPostBack="True" 
                            CssClass="LetraNormal" OnSelectedIndexChanged="RegsPag_SelectedIndexChanged">
                            <asp:ListItem Value="3" />
                            <asp:ListItem Value="5" />
                            <asp:ListItem Value="10" />
                            <asp:ListItem Value="15" />
                        </asp:DropDownList>
                        &nbsp; Ir a
                        <asp:TextBox ID="IraPag1" runat="server" AutoPostBack="true" CssClass="irapag" 
                            OnTextChanged="IraPag" />
                        de
                        <asp:Label ID="lblTotalNumberOfPages1" runat="server" />
                        &nbsp;
                        <asp:Button ID="Button9" runat="server" CommandArgument="First" 
                            CommandName="Page" CssClass="primero" ToolTip="Prim. Pag" />
                        <asp:Button ID="Button10" runat="server" CommandArgument="Prev" 
                            CommandName="Page" CssClass="anterior" ToolTip="Pág. anterior" />
                        <asp:Button ID="Button11" runat="server" CommandArgument="Next" 
                            CommandName="Page" CssClass="siguiente" ToolTip="Sig. página" />
                        <asp:Button ID="Button12" runat="server" CommandArgument="Last" 
                            CommandName="Page" CssClass="ultimo" ToolTip="Últ. Pag" />
                    </PagerTemplate>
                    <EmptyDataTemplate>
                        &nbsp; <span lang="pt-br" 
                            style="font-family: Verdana; font-size: 11px; font-weight: bold; color: #FF6600">
                        Não existe registros no momento.</span>
                    </EmptyDataTemplate>
                    <AlternatingRowStyle CssClass="altrowstyle" />
                    <SelectedRowStyle BackColor="#D1DDF1" />
                </asp:GridView>
            </asp:View>
            <br />
            
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
