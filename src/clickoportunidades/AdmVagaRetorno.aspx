<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdmVagaRetorno.aspx.vb" Inherits="AdmVagaRetorno" Theme="AdmClick"%>

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
        .style7
        {
            margin-top: 6px;
        }
        .style8
        {
            width: 153px;
        }
        .style9
        {
            width: 49%;
        }
        .style10
        {
            width: 180px;
        }
        .style11
        {
            width: 151px;
            height: 13px;
        }
        .style12
        {
            width: 528px;
            height: 178px;
        }
        
        .style14
        {
            width: 127px;
        }
        
        .style15
        {
            width: 151px;
            height: 48px;
        }
        .style17
        {
            width: 151px;
            height: 41px;
        }
        .style18
        {
            height: 41px;
        }
        .style19
        {
            width: 151px;
            }
        .style21
        {
            height: 13px;
        }
                
        </style>
    
</head>
<body>
    <form id="form1" runat="server">
            <asp:Label ID="lblvagasadm" runat="server" Font-Bold="True" 
                Font-Names="Verdana" Font-Size="12px" ForeColor="#0066FF" 
                Text="Administração de vagas"></asp:Label>
            <br />
    <br />
    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" 
        DynamicHorizontalOffset="2" Font-Bold="False" Font-Names="Verdana" 
        Font-Size="10px" ForeColor="#284E98" Orientation="Horizontal" 
        StaticSubMenuIndent="10px">
        <StaticMenuStyle Height="25px" />
        <StaticSelectedStyle BackColor="#507CD1" Height="25px" />
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
        <DynamicMenuStyle BackColor="#B5C7DE" />
        <DynamicSelectedStyle BackColor="#507CD1" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <StaticHoverStyle BackColor="#284E98" ForeColor="White" Height="25px" />
        <Items>
            <asp:MenuItem Text="Busca de vagas" Value="0" ToolTip="Buscar vagas "></asp:MenuItem>
            <asp:MenuItem Text="Visualizar vaga" Value="1" 
                ToolTip="Visualizar vaga encontrada"></asp:MenuItem>
            <asp:MenuItem Text="Detalhes da vaga" Value="2" 
                ToolTip="Detalhe da vaga selecionada"></asp:MenuItem>
            <asp:MenuItem Text="Candidatos a vaga" Value="3"></asp:MenuItem>
            <asp:MenuItem Text="Agendamento de entrevista" Value="4 "></asp:MenuItem>
            <asp:MenuItem Text="Acompanhamento da vaga" Value="5"></asp:MenuItem>
        </Items>
    </asp:Menu>
            <asp:Label ID="lblaviso" runat="server" Font-Bold="True" Font-Names="Verdana" 
                Font-Size="10px" ForeColor="#FF6600"></asp:Label>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewAdmVaga" runat="server">
            <table cellpadding="0" cellspacing="0" class="style9" 
                
                
                style="border: 1px solid #0066FF; font-family: verdana; font-size: 12px; font-weight: bold; color: #0066FF; padding-left: 5px;" 
                border="0">
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
                        <asp:TextBox ID="txtvaga" runat="server" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                        <asp:Label ID="lblempresa" runat="server" Text="Nome da empresa:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtempresa" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                        <asp:Label ID="lblcnpj" runat="server" Text="CNPJ:"></asp:Label>
                    </td>
                    <td width="80p">
                        <asp:TextBox ID="txtcnpj" runat="server" Width="120px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                        <asp:Label ID="lbldtinicio" runat="server" Text="Data inícial:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtdatinicio" runat="server" Width="62px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RqDatainicio" runat="server" 
                            ControlToValidate="txtdatinicio" ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        &nbsp;<asp:CompareValidator ID="compData" runat="server" 
                            ControlToCompare="txtdatfim" ControlToValidate="txtdatinicio" 
                            ErrorMessage="Data inválida." 
                            Operator="LessThanEqual" Type="Date" ValueToCompare="01/01/2006"></asp:CompareValidator>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="txtdatinicio"></ajaxToolkit:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                        <asp:Label ID="lbldatfim" runat="server" Text="Data Final"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtdatfim" runat="server" Width="62px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator 
                            ID="RqDataFim" runat="server" ControlToValidate="txtdatfim" 
                            ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                        &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="txtdatinicio" ControlToValidate="txtdatfim" 
                            ErrorMessage="Data inválida." Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="txtdatfim"></ajaxToolkit:CalendarExtender>
                        
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
                        <asp:RadioButtonList ID="rdAtivada" runat="server" 
                            RepeatDirection="Horizontal">
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
                
                SelectCommand="SELECT tblVaga.ultima_atualizacao, CASE tblvaga.ativada WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END AS status, tblVaga.ativada, tblEmpresa.nome_fantasia, tblEmpresa.cnpj, tblMunicipio.nome, tblVagaModalidade.modalidade, tblCBO.cargo, tblFormacaoNivel.formacao, tblVaga.id_vaga FROM tblVaga INNER JOIN tblEmpresa ON tblVaga.id_empresa_fk = tblEmpresa.id_empresa INNER JOIN tblVagaModalidade ON tblVaga.modalidade = tblVagaModalidade.id_modalidade INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo INNER JOIN tblFormacaoNivel ON tblVaga.id_escolaridade_fk = tblFormacaoNivel.id_formacaonivel LEFT OUTER JOIN tblMunicipio ON tblVaga.id_localtrabalho_fk = tblMunicipio.id_municipio AND tblEmpresa.id_municipio = tblMunicipio.id_municipio WHERE (CASE tblvaga.ativada WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END = @ativada) AND (CAST(tblVaga.id_vaga AS varchar(20)) LIKE '' + @id_vaga + '%') AND (tblEmpresa.nome_fantasia LIKE '' + @nome_fantasia + '%' OR tblEmpresa.nome_fantasia IS NULL) AND (tblEmpresa.cnpj LIKE '' + @cnpj + '%' OR tblEmpresa.cnpj IS NULL) AND (tblMunicipio.nome LIKE '' + @nome + '%' OR tblMunicipio.nome IS NULL) AND (tblVagaModalidade.modalidade LIKE '' + @modalidade + '%' OR tblVagaModalidade.modalidade IS NULL) AND (CONVERT (varchar, tblVaga.ultima_atualizacao, 103) BETWEEN @dtinicio AND @dtfim)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="rdAtivada" DefaultValue="" Name="ativada" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtempresa" DefaultValue="%" 
                        Name="nome_fantasia" PropertyName="Text" />
                    <asp:ControlParameter ControlID="cbomodalidade" Name="modalidade" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cbomunicipio" DefaultValue="" Name="nome" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtvaga" DefaultValue="%" 
                        Name="id_vaga" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcnpj" DefaultValue="%" Name="cnpj" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtdatinicio" DefaultValue="" Name="dtinicio" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtdatfim" DefaultValue="" Name="dtfim" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
          
        </asp:View>
        <asp:View ID="ViewResultado" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" class="style1">
                <tr>
                    <td valign="top">
                      <asp:GridView ID="GridVaga" runat="server" AutoGenerateColumns="False" 
                            BorderColor="#0066FF" CellPadding="0" DataKeyNames="id_vaga" 
                            DataSourceID="Sqlvagas" Width="747px" CssClass="grid">
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
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="ViewDetalhe" runat="server">
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
                    <asp:TemplateField HeaderText="Candidatos a vaga">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnCandidatos" runat="server" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_57.gif" 
                                onclick="btnCandidatos_Click" CausesValidation="False" 
                                ToolTip="Clique aqui para visualizar os candidatos a vaga" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status da vaga" SortExpression="ativada">
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ativada") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ativada") %>'></asp:TextBox>
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
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modificar status" SortExpression="ativada">
                        <InsertItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ativada") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="btnativar" runat="server" 
                                Enabled='<%# Eval("status") <> 2 %>' 
                                ImageUrl="~/clickoportunidades/icones/Standard/power.png" 
                                onclick="btnativar_Click" ToolTip="Ativar vaga" 
                                
                                onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                CausesValidation="False" />
                            <asp:ImageButton ID="btnInativar" runat="server" 
                                Enabled='<%# Eval("status") <> 1 %>' 
                                ImageUrl="~/clickoportunidades/icones/Standard/close.png" 
                                onclick="btnInativar_Click" ToolTip="Desativar vaga" 
                                
                                onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                CausesValidation="False" />
                            <asp:ImageButton ID="btnAnalisa" runat="server" 
                                Enabled='<%# Eval("status") <> 0 %>' 
                                ImageUrl="~/clickoportunidades/icones/Standard/about.png" 
                                onclick="btnAnalisa_Click" ToolTip="Vaga em análise" 
                                
                                onclientclick="if (confirm('Deseja alterar realmente?' )){return True}else{return false}" 
                                CausesValidation="False" />
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
                            <asp:CheckBox ID="CheckBox1" runat="server" 
                                Checked='<%# Bind("vale_refeicao") %>' />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" 
                                Checked='<%# Bind("vale_refeicao") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" 
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
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Valetransporte") %>'></asp:TextBox>
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
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("salario") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("salario", "{0:C}") %>'></asp:Label>
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
        </asp:View>
        <asp:View ID="ViewCandidatos" runat="server">
            <asp:GridView ID="Gridcandidato" runat="server" AutoGenerateColumns="False" 
                CssClass="grid" DataKeyNames="id_vagacandidato" DataSourceID="SqlCandidatos">
                <Columns>
                    <asp:CommandField ButtonType="Image" CausesValidation="False" 
                        SelectImageUrl="~/clickoportunidades/icones/Standard/001_59.gif" 
                        ShowSelectButton="True" HeaderText="Selecionar candidato" >
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:CommandField>
                    <asp:BoundField DataField="id_VagaCandidato" HeaderText="Código" 
                        SortExpression="id_VagaCandidato">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="id_vaga_fk" HeaderText="Código da vaga" 
                        SortExpression="id_vaga_fk">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="identificador" HeaderText="CPF" 
                        SortExpression="identificador">
                        <ItemStyle Width="90px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Visualizar candidato">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnViewCandidato" runat="server" CausesValidation="False" 
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
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("telefone") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("celular") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("telefone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="formacao" HeaderText="Escolaridade" 
                        SortExpression="formacao" />
                    <asp:TemplateField HeaderText="Agendar Entrevista">
                        <ItemTemplate>
                            <span lang="pt-br">
                            <asp:ImageButton ID="btnAgendar1" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_44.gif" 
                                onclick="btnAgendar1_Click" ToolTip="Agendar entrevista no Click" />
                            </span>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <span lang="pt-br" 
                        style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                    Não existe candidatos para essa vaga. </span>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#D1DDF1" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlCandidatos" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                
                SelectCommand="SELECT tblAcompanhamentoVagaCandidato.id_VagaCandidato, tblAcompanhamentoVagaCandidato.id_vaga_fk, tblCandidato.identificador, tblCandidato.nome, tblCandidato.telefone, tblCandidato.celular, tblCandidato.email, tblCandidato.id_candidato, tblCandidato.bairro, tblCandidato.nascimento, tblFormacaoNivel.formacao, tblMunicipio.nome AS municipio, tblSexo.sexo FROM tblAcompanhamentoVagaCandidato INNER JOIN tblCandidato ON tblAcompanhamentoVagaCandidato.id_candidato_fk = tblCandidato.id_candidato INNER JOIN tblCandidatoFormacao ON tblCandidato.id_candidato = tblCandidatoFormacao.id_candidato_fk INNER JOIN tblFormacaoNivel ON tblCandidatoFormacao.id_formacaonivel_fk = tblFormacaoNivel.id_formacaonivel INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio INNER JOIN tblSexo ON tblCandidato.sexo = tblSexo.id_sexo WHERE (tblAcompanhamentoVagaCandidato.id_vaga_fk = @id_vaga_fk)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="id_vaga_fk" 
                        SessionField="id_vaga" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewEntrevistaClick" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" class="style12" 
                style="font-family: verdana; font-size: 12px; font-weight: bold; color: #0066FF">
                <tr>
                    <td class="style17">
                        <asp:Label ID="lbldataClick" runat="server" Text="Data no Click:"></asp:Label>
                    </td>
                    <td class="style18" colspan="0">
                        <asp:TextBox ID="datdataclick" runat="server" CausesValidation="True" 
                            ToolTip="Digite a data da entrevista no Click" 
                            ValidationGroup="InsereEntrevista" Width="65px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rqdataclick0" runat="server" 
                            ControlToValidate="datdataclick" ErrorMessage="Campo obrigatório" ToolTip=" " 
                            ValidationGroup="InsereEntrevista"></asp:RequiredFieldValidator>
                        &nbsp;<asp:CompareValidator ID="CompareValidator4" runat="server" 
                            ControlToCompare="datdataempresa" ControlToValidate="datdataclick" 
                            ErrorMessage="Data inválida" Operator="LessThanEqual" Type="Date" 
                            ValidationGroup="InsereEntrevista" ValueToCompare="Getdate()"></asp:CompareValidator>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="datdataclick"></ajaxToolkit:CalendarExtender>
                    </td>
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
                            DataTextField="Nome" DataValueField="Nome">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style15">
                        Status da Entrevista:</td>
                    <td>
                        <asp:DropDownList ID="cboid_statusEntrevista" runat="server" 
                            DataSourceID="SqlstatusEntrevista" DataTextField="statusentrevista" 
                            DataValueField="id_statusEntrevista" 
                            ToolTip="Selecionar status da entrevista">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlstatusEntrevista" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            
                            SelectCommand="SELECT 111 AS id_statusEntrevista, 'Selecione' AS statusentrevista UNION ALL SELECT id_statusEntrevista, statusEntrevista FROM tblStatusEntrevista">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ImageButton ID="btnInsereEntrevista" runat="server" ImageAlign="Middle" 
                            ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" 
                            onclientclick="Adicionar novo agendamento no click" 
                            ToolTip="Inserir nova entrevista" ValidationGroup="InsereEntrevista" />
                        &nbsp;<asp:ImageButton ID="btnatualizaEntrevista" runat="server" ImageAlign="Middle" 
                            ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                            ToolTip="Alterar agendamento no click" />
                        <span lang="pt-br">&nbsp;</span><asp:ImageButton ID="btnCancelar" runat="server" 
                            ImageAlign="Middle" ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                            ToolTip="Cancelar agendamento" />
                        <span lang="pt-br">&nbsp;<asp:ImageButton ID="btnAgendar" runat="server" 
                            ImageAlign="Middle" ImageUrl="~/clickoportunidades/icones/Standard/001_44.gif" 
                            ToolTip="Agendar entrevista na empresa" />
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
                            <asp:CommandField ButtonType="Image" 
                                SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                ShowSelectButton="True" HeaderText="Selecione entrevista" >
                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                InsertVisible="False" SortExpression="id_entrevista" />
                            <asp:BoundField DataField="id_vagacandidato_fk" 
                                HeaderText="Código do candidato" SortExpression="id_vagacandidato_fk" />
                            <asp:TemplateField HeaderText="Data no Click" SortExpression="dataClick">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
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
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
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
                            <asp:Label ID="Label1" runat="server" Text="Mostrar filas:" />
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
                        <AlternatingRowStyle CssClass="altrowstyle" />
                    </asp:GridView>
                    </ContentTemplate>
                </asp:updatepanel>
                    <asp:SqlDataSource ID="SqlGridEntrevista" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        DeleteCommand="DELETE FROM [tblEntrevista] WHERE [id_entrevista] = @original_id_entrevista AND (([id_vagacandidato_fk] = @original_id_vagacandidato_fk) OR ([id_vagacandidato_fk] IS NULL AND @original_id_vagacandidato_fk IS NULL)) AND (([dataEmpresa] = @original_dataEmpresa) OR ([dataEmpresa] IS NULL AND @original_dataEmpresa IS NULL)) AND (([horaEmpresa] = @original_horaEmpresa) OR ([horaEmpresa] IS NULL AND @original_horaEmpresa IS NULL)) AND (([dataClick] = @original_dataClick) OR ([dataClick] IS NULL AND @original_dataClick IS NULL)) AND (([horaClick] = @original_horaClick) OR ([horaClick] IS NULL AND @original_horaClick IS NULL)) AND (([captador] = @original_captador) OR ([captador] IS NULL AND @original_captador IS NULL)) AND (([id_statusEntrevista] = @original_id_statusEntrevista) OR ([id_statusEntrevista] IS NULL AND @original_id_statusEntrevista IS NULL)) AND (([dataStatus] = @original_dataStatus) OR ([dataStatus] IS NULL AND @original_dataStatus IS NULL))" 
                        InsertCommand="INSERT INTO tblEntrevista(id_vagacandidato_fk, dataEmpresa, horaEmpresa, dataClick, horaClick, captador, id_statusEntrevista) VALUES (@id_vagacandidato_fk, @dataEmpresa, @horaEmpresa, @dataClick, @horaClick, @captador, @id_statusEntrevista)" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectCommand="SELECT tblEntrevista.id_entrevista, tblEntrevista.id_vagacandidato_fk, tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.dataStatus, tblStatusEntrevista.statusEntrevista, tblEntrevista.id_statusEntrevista, tblEntrevista.captador FROM tblEntrevista LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_vagacandidato_fk = @id_vagacandidato_fk)" 
                        UpdateCommand="UPDATE tblEntrevista SET id_statusEntrevista = @id_statusEntrevista WHERE (id_entrevista = @id_entrevista) ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Gridcandidato" Name="id_vagacandidato_fk" 
                                PropertyName="SelectedValue" />
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
                        SelectCommand="SELECT tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblStatusEntrevista.statusEntrevista, tblEntrevista.id_statusEntrevista, tblEntrevista.captador FROM tblEntrevista LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_entrevista = @id_entrevsita)" 
                        UpdateCommand="UPDATE tblEntrevista SET id_statusEntrevista = @id_statusEntrevista WHERE (id_entrevista = @id_entrevista) ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridEntrevista" Name="id_entrevsita" 
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
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
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
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("statusEntrevista") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="captador" HeaderText="Captador" 
                        SortExpression="captador" />
                    <asp:TemplateField HeaderText="Atualização" SortExpression="dataStatus">
                        <EditItemTemplate>
                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("dataStatus") %>'></asp:Label>
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
        <asp:View ID="ViewEntrevistaEmp" runat="server">
            <asp:Panel ID="PanelEntrevistaEmp" runat="server">
                <table class="style1" 
                    style="font-family: Verdana; font-size: 12px; color: #0066FF; font-weight: bold">
                    <tr>
                        <td class="style14">
                            <asp:Label ID="lbldataEmp" runat="server" Text="Data na Empresa:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="datdataempresa" runat="server" Width="65px" 
                                ToolTip="Digite a data da entrevista na Empresa"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqdataempresa" runat="server" 
                                ControlToValidate="datdataempresa" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="AlteraEntrevista"></asp:RequiredFieldValidator>
                            &nbsp;<asp:CompareValidator ID="CompareValidator3" runat="server" 
                                ControlToCompare="datdataclick" ControlToValidate="datdataempresa" 
                                ErrorMessage="Data inválida" Operator="GreaterThanEqual" Type="Date" 
                                ValidationGroup="AlteraEntrevista"></asp:CompareValidator>
                            
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender7" runat="server" 
                                Format="dd/MM/yyyy" TargetControlID="datdataempresa"></ajaxToolkit:CalendarExtender>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="lblhoraemp" runat="server" Text="Horário:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="horhoraempresa" runat="server" Width="45px" 
                                ToolTip="Digite o horário da entrevista na empresa"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator ID="rqhoraempresa" runat="server" 
                                ControlToValidate="horhoraempresa" ErrorMessage="Campo obrigatório" ToolTip=" " 
                                ValidationGroup="AlteraEntrevista"></asp:RequiredFieldValidator>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="lblcaptadorent0" runat="server" Text="Captador:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="cbocaptador0" runat="server" DataSourceID="Sqloperador" 
                                DataTextField="Nome" DataValueField="Nome">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:ImageButton ID="btnatualizaEntrevistaEmp" runat="server" 
                                ImageAlign="Middle" ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                ToolTip="Inserir novo agendamento na empresa" 
                                ValidationGroup="AlteraEntrevista" />
                            <span lang="pt-br">&nbsp;Agendar entrevista na empresa </span></td>
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
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:updatepanel ID="Up1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="GridEntrevistaEmp" runat="server" AllowPaging="True" 
                            AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                            CssClass="grid" DataKeyNames="id_entrevista" 
                            DataSourceID="SqlEntrevistaFormEmp" PageSize="5" Width="36%">
                            <PagerStyle CssClass="pagerstyle" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" 
                                    HeaderText="Selecionar para acompanhamento" 
                                    SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                    ShowSelectButton="True">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_entrevista" />
                                <asp:TemplateField HeaderText="Data na Empresa" SortExpression="dataEmpresa">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text='<%# Bind("dataEmpresa", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="horaEmpresa" HeaderText="Hora na Empresa" 
                                    SortExpression="horaEmpresa" />
                            </Columns>
                            <PagerTemplate>
                                <asp:Label ID="Label1" runat="server" Text="Mostrar filas:" />
                                <asp:DropDownList ID="RegsPag" runat="server" AutoPostBack="True" 
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
                                    CommandName="Page" CssClass="siguiente" ToolTip="Sig. página" />
                                <asp:Button ID="Button3" runat="server" CommandArgument="Last" 
                                    CommandName="Page" CssClass="ultimo" ToolTip="Últ. Pag" />
                            </PagerTemplate>
                            <EmptyDataTemplate>
                                &nbsp; <span lang="pt-br" 
                                    style="font-family: Verdana; font-size: 11px; font-weight: bold; color: #FF6600">
                                Não existe registros no momento.</span>
                            </EmptyDataTemplate>
                            <AlternatingRowStyle CssClass="altrowstyle" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlEntrevistaFormEmp" runat="server" 
                            CacheExpirationPolicy="Sliding" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            DeleteCommand="DELETE FROM [tblEntrevista] WHERE [id_entrevista] = @original_id_entrevista AND (([id_vagacandidato_fk] = @original_id_vagacandidato_fk) OR ([id_vagacandidato_fk] IS NULL AND @original_id_vagacandidato_fk IS NULL)) AND (([dataEmpresa] = @original_dataEmpresa) OR ([dataEmpresa] IS NULL AND @original_dataEmpresa IS NULL)) AND (([horaEmpresa] = @original_horaEmpresa) OR ([horaEmpresa] IS NULL AND @original_horaEmpresa IS NULL)) AND (([dataClick] = @original_dataClick) OR ([dataClick] IS NULL AND @original_dataClick IS NULL)) AND (([horaClick] = @original_horaClick) OR ([horaClick] IS NULL AND @original_horaClick IS NULL)) AND (([captador] = @original_captador) OR ([captador] IS NULL AND @original_captador IS NULL)) AND (([id_statusEntrevista] = @original_id_statusEntrevista) OR ([id_statusEntrevista] IS NULL AND @original_id_statusEntrevista IS NULL)) AND (([dataStatus] = @original_dataStatus) OR ([dataStatus] IS NULL AND @original_dataStatus IS NULL))" 
                            InsertCommand="INSERT INTO [tblEntrevista] ([id_vagacandidato_fk], [dataEmpresa], [horaEmpresa], [dataClick], [horaClick], [captador], [id_statusEntrevista]) VALUES (@id_vagacandidato_fk, @dataEmpresa, @horaEmpresa, @dataClick, @horaClick, @captador, @id_statusEntrevista)" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectCommand="SELECT tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblStatusEntrevista.statusEntrevista, tblEntrevista.id_statusEntrevista, tblEntrevista.captador, tblEntrevista.id_entrevista FROM tblEntrevista LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_statusEntrevista = '1') AND (tblEntrevista.id_entrevista = @id_entrevista)" 
                            
                            
                            
                            UpdateCommand="UPDATE tblEntrevista SET id_statusEntrevista = @id_statusEntrevista, dataEmpresa = @dataempresa, horaEmpresa = @horaempresa WHERE (id_entrevista = @id_entrevista)">
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
                                <asp:ControlParameter ControlID="datdataempresa" DbType="DateTime" 
                                    Name="dataempresa" PropertyName="Text" />
                                <asp:ControlParameter ControlID="horhoraempresa" Name="horaempresa" 
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
                    </ContentTemplate>
                </asp:updatepanel>
            </asp:Panel>
            
        </asp:View>
        <asp:View ID="ViewRetorno" runat="server">
            <table cellpadding="0" cellspacing="0" class="style1" 
                style="font-family: verdana; font-size: 12px; font-weight: bold; color: #0066FF">
                <tr>
                    <td class="style10">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style10">
                        <asp:Label ID="lblretorno" runat="server" Text="Retorno"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboid_retorno_fk" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlRetorno" DataTextField="Descricao" 
                            DataValueField="id_retorno" ToolTip="Escolha a opção de retorno da vaga">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlRetorno" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT [id_retorno], [Descricao] FROM [tblRetorno]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        <asp:Label ID="lblunidade" runat="server" Text="Unidade de Origem:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cbounidadeorigem" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlUnidades" DataTextField="RAZAO_SOCIAL" 
                            DataValueField="id_unidade" 
                            ToolTip="Digite a unidade que encaminhou a vaga">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlUnidades" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT [RAZAO_SOCIAL], [id_unidade] FROM [viewSGA_Unidades]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        <asp:Label ID="lblcaptador" runat="server" Text="Captador Externo"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cbocaptadorexterno" runat="server" 
                            DataSourceID="Sqlcaptador" DataTextField="Nome" DataValueField="Nome" 
                            ToolTip="Selecione o captador externo">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Sqlcaptador" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                            
                            
                            SelectCommand="SELECT admPortalUsuario.Nome, admPortalPerfil.Descricao FROM admPortalUsuario CROSS JOIN admPortalPerfil WHERE (admPortalPerfil.Descricao = 'Click Adm') ORDER BY admPortalUsuario.Nome">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        <asp:Label ID="lblOperador" runat="server" Text="Operador:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cbooperador" runat="server" DataSourceID="Sqloperador" 
                            DataTextField="Nome" DataValueField="Nome">
                        </asp:DropDownList>
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
                    <td class="style10">
                        <span lang="pt-br">Data Atual:</span></td>
                    <td>
                        <asp:TextBox ID="datdataretorno" runat="server" ReadOnly="True" 
                            ToolTip="Selecione a data de acompanhamento" ValidationGroup="retorno"></asp:TextBox>
                        <span lang="pt-br">&nbsp;</span></td>
                </tr>
                <tr>
                    <td class="style10">
                        Data de acompanhamento<span lang="pt-br"> após 45 dias</span>:</td>
                    <td>
                        <asp:TextBox ID="datdataacompanhamento" runat="server" 
                            ToolTip="Selecione a data de acompanhamento" ValidationGroup="retorno"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rqdata" runat="server" 
                            ControlToValidate="datdataacompanhamento" ErrorMessage="Campo obrigatório" 
                            ValidationGroup="Retorno"></asp:RequiredFieldValidator>
                        <span lang="pt-br">&nbsp;</span><asp:CompareValidator ID="rqdataacomp" 
                            runat="server" ControlToCompare="datdataretorno" 
                            ControlToValidate="datdataacompanhamento" ErrorMessage="Data inválida" 
                            Operator="GreaterThan" Type="Date" ValidationGroup="retorno" 
                            ValueToCompare="getdate"></asp:CompareValidator>
                        &nbsp;<ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="datdataacompanhamento"></ajaxToolkit:CalendarExtender></td>
                </tr>
                <tr>
                    <td class="style10" valign="top">
                        <asp:Label ID="lblobservacao" runat="server" Text="Observação:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtobservacao" runat="server" Rows="3" TextMode="MultiLine" 
                            Width="300px" ValidationGroup="retorno" 
                            ToolTip="Digite qualquer observaçãos sobre o candidato"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqobservacao" runat="server" 
                            ControlToValidate="txtobservacao" ErrorMessage="Campo obrigatório" 
                            ValidationGroup="Retorno"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ImageButton ID="btnInsereRetorno" runat="server" 
                            ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" 
                            ToolTip="Inserir Retorno " style="width: 24px" />
                       &nbsp;Inserir novo retorno<br />
&nbsp;</td>
                </tr>
            </table>
            <asp:GridView ID="GridRetorno" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CssClass="grid" DataKeyNames="id_acompvaga" 
                DataSourceID="SqlGridRetorno" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Image" 
                        SelectImageUrl="~/clickoportunidades/icones/Standard/001_59.gif" 
                        ShowSelectButton="True" />
                    <asp:BoundField DataField="id_entrevista_fk" HeaderText="Código da entrevista" 
                        SortExpression="id_entrevista_fk" />
                    <asp:TemplateField HeaderText="Retorno" SortExpression="Descricao">
                        <EditItemTemplate>
                            <asp:DropDownList ID="cboid_retorno_fk1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlRetorno" DataTextField="Descricao" DataValueField="id_retorno" 
                                Font-Size="9px">
                            </asp:DropDownList>
                            <br />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Descricao") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unidade" SortExpression="RAZAO_SOCIAL">
                        <EditItemTemplate>
                            <asp:DropDownList ID="cbounidadeorigem1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlUnidades" DataTextField="RAZAO_SOCIAL" 
                                DataValueField="id_unidade" Font-Size="9px">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("RAZAO_SOCIAL") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Captador externo" 
                        SortExpression="captadorexterno">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("captadorExterno") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Observação" SortExpression="Observacao">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtobservacao1" runat="server" MaxLength="1000" 
                                Text='<%# Bind("Observacao") %>' TextMode="MultiLine" 
                                ValidationGroup="gridretorno"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rqobservacao2" runat="server" 
                                ControlToValidate="txtobservacao1" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="GridRetorno"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Observacao") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="dataRetorno" HeaderText="Atualização" 
                        SortExpression="dataRetorno" DataFormatString="{0:D}" />
                    <asp:TemplateField HeaderText="Data de Retorno 45 dias">
                        <ItemTemplate>
                            <asp:Label ID="lblDataretorno" runat="server" 
                                Text='<%# Eval("dataAcompanhamento", "{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                CommandName="Delete" ImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                onclientclick="if (confirm('Deseja excluir realmente?' )){return True}else{return false}" 
                                Text="Delete" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlGridRetorno" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                DeleteCommand="DELETE FROM tblAcompVaga WHERE (id_acompvaga = @id_acompvaga)" 
                InsertCommand="INSERT INTO tblAcompVaga(id_retorno_fk, unidadeorigem, captadorExterno, operador, dataAcompanhamento, id_entrevista_fk, Observacao, dataRetorno) VALUES (@id_retorno_fk, @unidadeorigem, @captadorExterno, @operador, @dataAcompanhamento, @id_entrevista_fk, @Observacao, @dataRetorno)" 
                
                SelectCommand="SELECT tblAcompVaga.dataAcompanhamento, tblAcompVaga.id_entrevista_fk, tblAcompVaga.Observacao, tblRetorno.Descricao, tblAcompVaga.id_acompvaga, viewSGA_Unidades.RAZAO_SOCIAL, tblAcompVaga.dataRetorno, tblAcompVaga.operador, tblAcompVaga.captadorExterno FROM tblAcompVaga INNER JOIN tblRetorno ON tblAcompVaga.id_retorno_fk = tblRetorno.id_retorno INNER JOIN viewSGA_Unidades ON tblAcompVaga.unidadeorigem = viewSGA_Unidades.id_unidade WHERE (tblAcompVaga.id_entrevista_fk = @id_entrevista_fk)" 
                
                
                UpdateCommand="UPDATE tblAcompVaga SET id_retorno_fk = @id_retorno_fk, unidadeorigem = @unidadeorigem, captadorExterno = @captadorExterno, operador = @operador, dataAcompanhamento = @dataAcompanhamento, Observacao = @Observacao WHERE (id_acompvaga = @id_acompvaga)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridEntrevistaEmp" DefaultValue="" 
                        Name="id_entrevista_fk" PropertyName="SelectedValue" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id_acompvaga" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="cboid_retorno_fk" Name="id_retorno_fk" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cbounidadeorigem" Name="unidadeorigem" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cbocaptadorexterno" Name="captadorExterno" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cbooperador" Name="operador" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="datdataacompanhamento"  
                        Name="dataAcompanhamento" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtobservacao" Name="Observacao" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridRetorno" Name="id_acompvaga" 
                        PropertyName="SelectedValue" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="cboid_retorno_fk" Name="id_retorno_fk" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cbounidadeorigem" Name="unidadeorigem" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cbocaptadorexterno" Name="captadorExterno" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cbooperador" Name="operador" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="datdataacompanhamento"  
                        Name="dataAcompanhamento" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="GridEntrevista" Name="id_entrevista_fk" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtobservacao" Name="Observacao" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="datdataretorno" DbType="DateTime" 
                        DefaultValue="" Name="dataRetorno" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
    </form>
    </body>
</html>

