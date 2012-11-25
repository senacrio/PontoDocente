<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdmVagas.aspx.vb" Inherits="clickoportunidades_AdmVagas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
            <asp:Label ID="lblvagasadm" runat="server" Font-Bold="True" 
                Font-Names="Verdana" Font-Size="12px" ForeColor="#0066FF" 
                Text="Administração de vagas"></asp:Label>
            <br />
        <br />
            <asp:Label ID="lblaviso" runat="server" Font-Bold="True" Font-Names="Verdana" 
                Font-Size="10px" ForeColor="#FF6600"></asp:Label>
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
                        </td>
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
                                    <asp:BoundField DataField="cargo" HeaderText="Cargo" 
                                        SortExpression="id_cargo_fk">
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
                                        SortExpression="id_escolaridade_fk" />
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
                                    <asp:TemplateField HeaderText="Modificar status" SortExpression="ativada">
                                        <InsertItemTemplate>
                                            <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("ativada") %>' />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnativar" runat="server" CausesValidation="False" 
                                                Enabled='<%# Eval("status") <> 2 %>' 
                                                ImageUrl="~/clickoportunidades/icones/Standard/power.png" 
                                                onclick="btnativar_Click" 
                                                onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                                ToolTip="Ativar vaga" />
                                            <asp:ImageButton ID="btnInativar" runat="server" CausesValidation="False" 
                                                Enabled='<%# Eval("status") <> 1 %>' 
                                                ImageUrl="~/clickoportunidades/icones/Standard/close.png" 
                                                onclick="btnInativar_Click" 
                                                onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                                ToolTip="Desativar vaga" />
                                            <asp:ImageButton ID="btnAnalisa" runat="server" CausesValidation="False" 
                                                Enabled='<%# Eval("status") <> 0 %>' 
                                                ImageUrl="~/clickoportunidades/icones/Standard/about.png" 
                                                onclick="btnAnalisa_Click" 
                                                onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                                ToolTip="Vaga em análise" />
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
                                SelectCommand="SELECT DISTINCT tblVaga.modalidade_inicio, tblEmpresa.nome_fantasia, tblVaga.descricao, tblVaga.perfil, tblEmpresa.id_empresa, tblVaga.id_vaga, tblVaga.modalidade_fim, tblVaga.vale_transporte, tblVaga.vale_refeicao, tblVaga.vale_alimentacao, tblVaga.plano_saude, tblVaga.Bairro, tblVaga.horario_entrada, tblVaga.horario_saida, tblVaga.salario, tblVaga.encerrada, tblVaga.ultima_atualizacao, tblMunicipio_1.nome, tblVaga.QuantVaga, tblVaga.FaixaEtariaInicial, tblVaga.FaixaEtariaFinal, tblVaga.Valetransporte, tblVaga.ativada, tblCBO.cargo, tblFormacaoNivel.formacao, tblEstadoCivil.estadocivil, tblVaga.domingo, tblVaga.segunda, tblVaga.terca, tblVaga.quarta, tblVaga.quinta, tblVaga.sexta, tblVaga.sabado, tblVaga.horario_obs, tblVaga.salario_observacao, tblVaga.dados_qualitativos, tblVaga.pontoreferencia, tblVaga.bairroent, tblVaga.complemento, tblVaga.rua, CASE tblvaga.ativada WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END AS status, tblSexo.sexo, tblVagaModalidade.modalidade, tblMunicipio.nome AS municipio FROM tblVaga INNER JOIN tblEmpresa ON tblVaga.id_empresa_fk = tblEmpresa.id_empresa INNER JOIN tblFormacaoNivel ON tblVaga.id_escolaridade_fk = tblFormacaoNivel.id_formacaonivel INNER JOIN tblEstadoCivil ON tblVaga.estado_civil = tblEstadoCivil.id_estadocivil INNER JOIN tblSexo ON tblVaga.sexo = tblSexo.id_sexo INNER JOIN tblVagaModalidade ON tblVaga.modalidade = tblVagaModalidade.id_modalidade LEFT OUTER JOIN tblMunicipio ON tblVaga.id_localtrabalho_fk = tblMunicipio.id_municipio AND tblEmpresa.id_municipio = tblMunicipio.id_municipio LEFT OUTER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo LEFT OUTER JOIN tblMunicipio AS tblMunicipio_1 ON tblVaga.id_localtrabalho_fk = tblMunicipio_1.id_municipio AND tblEmpresa.id_municipio = tblMunicipio_1.id_municipio WHERE (tblVaga.id_vaga = @id_vaga) ORDER BY tblVaga.id_vaga" 
                                UpdateCommand="UPDATE tblVaga SET ativada = @ativada WHERE (id_vaga = id_vaga)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridVaga" Name="id_vaga" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
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
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
