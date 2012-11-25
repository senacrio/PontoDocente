<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdmVagasManter.aspx.vb" Inherits="clickoportunidades_AdmVagasManter" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">

        .style1
        {
            width: 46%;
        }
        .style2
        {
            margin-left: 0px;
        }
        .style3
        {
            width: 174px;
        }
        .style4
        {
            width: 917px;
        }
        .style5
        {
            width: 229px;
        }
        .style6
        {
            width: 164px;
        }
        .style7
        {
            margin-top: 0px;
        }
        .style8
        {
            width: 70%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Left">
        
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" >
            
            <asp:View ID="View1" runat="server" EnableViewState="False">
                <span lang="pt-br">
                <asp:Label ID="lblbuscarEmpresa" runat="server" Text="Buscar empresa por:"></asp:Label>
                <br />
                <br />
                <table cellpadding="0" cellspacing="0" class="style1">
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
                            <asp:TextBox ID="txtNomefantasia" runat="server" MaxLength="500" 
                                style="width: 128px" ToolTip="Entre o nº do Fantasia da empresa" Width="300px"></asp:TextBox>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:RadioButtonList ID="rdAprovada" runat="server" AutoPostBack="True" 
                                BorderStyle="None" CssClass="style2" RepeatDirection="Horizontal">
                                <asp:ListItem Value="2">Aprovada</asp:ListItem>
                                <asp:ListItem Value="1">Não aprovada</asp:ListItem>
                                <asp:ListItem Value="0">Em análise</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <br />
                </span>
                <asp:Label ID="lbltituloEmpresas" runat="server" 
                    Text="Lista de empresas cadastradas/aprovadas:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridEmpresas" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_empresa" 
                    DataSourceID="sqlAprovacaoGrid">
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                            ShowSelectButton="True" HeaderText="Selecione uma empresa" >
                            <ItemStyle Width="100px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="id_empresa" HeaderText="id_empresa" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_empresa" />
                        <asp:TemplateField HeaderText="status" SortExpression="status">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("status") %>'></asp:Label>
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
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="razao_social" HeaderText="razao_social" 
                            SortExpression="razao_social" />
                        <asp:BoundField DataField="nome_fantasia" HeaderText="nome_fantasia" 
                            SortExpression="nome_fantasia" />
                        <asp:BoundField DataField="cnpj" HeaderText="cnpj" SortExpression="cnpj" />
                        <asp:BoundField DataField="telefones" HeaderText="telefones" 
                            SortExpression="telefones" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:TemplateField HeaderText="Cancelada" SortExpression="Cancelada">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cancelada") %>'></asp:Label>
                            </EditItemTemplate>
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
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <span lang="pt-br">
                <asp:SqlDataSource ID="sqlAprovacaoGrid" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    InsertCommand="INSERT INTO tblLogAprovacao(id_empresa_fk, usuario, status) VALUES (@id_empresa_fk, @usuario, @status)" 
                    SelectCommand="SELECT tblEmpresa.id_empresa, tblEmpresa.razao_social, tblEmpresa.nome_fantasia, tblEmpresa.cnpj, tblMunicipio.nome AS municipio, tblEmpresa.aprovado, tblEmpresa.email, CASE tblempresa.aprovado WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END AS status, tblEmpresaRepresentantes.representante, tblEmpresaRepresentantes.telefones, tblEmpresaRepresentantes.id_empresa_fk, CASE tblempresa.cancelamento WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END AS Cancelada FROM tblEmpresa LEFT OUTER JOIN tblEmpresaRepresentantes ON tblEmpresa.id_empresa = tblEmpresaRepresentantes.id_empresa_fk LEFT OUTER JOIN tblMunicipio ON tblEmpresa.id_municipio = tblMunicipio.id_municipio WHERE (tblEmpresa.cnpj LIKE '' + @cnpj + '%') AND (tblEmpresa.razao_social LIKE '' + @razao_social + '%' OR tblEmpresa.razao_social IS NULL) AND (tblEmpresa.nome_fantasia LIKE '' + @nome_fantasia + '%' OR tblEmpresa.nome_fantasia IS NULL) AND (CASE tblempresa.aprovado WHEN 1 THEN 2 WHEN 0 THEN 1 ELSE 0 END = @aprovado) ORDER BY tblEmpresa.aprovado">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCNPJ" DefaultValue="%" Name="cnpj" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtRazao" DefaultValue="%" Name="razao_social" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtNomeFantasia" DefaultValue="%" 
                            Name="nome_fantasia" PropertyName="Text" />
                        <asp:ControlParameter ControlID="rdAprovada" DefaultValue="" Name="aprovado" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="id_empresa_fk" SessionField="id_empresa" />
                        <asp:SessionParameter Name="usuario" SessionField="c_nome" />
                        <asp:SessionParameter Name="status" SessionField="aprovado" />
                    </InsertParameters>
                </asp:SqlDataSource>
                </span>
                <br />
                <asp:Label ID="lbltituloVagas" runat="server" 
                    Text="Lista de vagas da empresa selecionada acima:"></asp:Label>
                <br />
                <br />
                <asp:ImageButton ID="ImageButton1" runat="server" CssClass="style7" 
                    ImageUrl="~/icones/Standard/001_01.gif" ToolTip="Incluir nova vaga" />
                <asp:Label ID="lblAvisoCadastro" runat="server" CssClass="labelLaranja" 
                    Text="Para incluir nova vaga, clique aqui. Para editar uma vaga selecione-a na lista."></asp:Label>
                <span lang="pt-br">&nbsp;<br />
                </span><br />
                <asp:GridView ID="gridVaga" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_vaga" 
                    DataSourceID="sqlVagaGrid" Width="730px">
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                            ShowSelectButton="True" HeaderText="Selecione uma vaga">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:BoundField DataField="id_empresa_fk" HeaderText="Código da empresa" 
                            SortExpression="id_empresa_fk" />
                        <asp:BoundField DataField="id_vaga" HeaderText="Código da vaga" ReadOnly="True" 
                            SortExpression="id_vaga" />
                        <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                        <asp:BoundField DataField="modalidade" HeaderText="Modalidade" 
                            SortExpression="modalidade" />
                        <asp:BoundField DataField="formacao" HeaderText="Formação" 
                            SortExpression="formacao" />
                        <asp:TemplateField HeaderText="Faixa Etária" 
                            SortExpression="FaixaEtariaInicial">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" 
                                    Text='<%# Bind("FaixaEtariaInicial") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("FaixaEtariaInicial") %>'></asp:Label>
                                &nbsp;a
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("FaixaEtariaFinal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="salario" DataFormatString="{0:C}" 
                            HeaderText="Salário" SortExpression="salario" />
                        <asp:TemplateField HeaderText="Cadastro" SortExpression="ultima_atualizacao">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" 
                                    Text='<%# Bind("ultima_atualizacao") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" 
                                    Text='<%# Bind("ultima_atualizacao", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField ButtonType="Image" HeaderText="Ativadas" 
                            ImageUrl="~/clickoportunidades/icones/Standard/001_18.gif" Text="Vagas Ativas">
                            <HeaderStyle Font-Underline="True" />
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:ButtonField>
                    </Columns>
                    <EmptyDataTemplate>
                        <br />
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="sqlVagaGrid" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    SelectCommand="SELECT tblVaga.id_vaga, tblCBO.cargo, tblFormacaoNivel.formacao, tblVaga.salario, tblVaga.ultima_atualizacao, tblVaga.encerrada, tblVaga.Faixaetariainicial, tblVaga.Faixaetariafinal, tblVagaModalidade.modalidade AS Modalidade, tblVaga.id_empresa_fk FROM tblVaga INNER JOIN tblVagaModalidade ON tblVaga.modalidade = tblVagaModalidade.id_modalidade LEFT OUTER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo LEFT OUTER JOIN tblFormacaoNivel ON tblVaga.id_escolaridade_fk = tblFormacaoNivel.id_formacaonivel WHERE (tblVaga.encerrada IS NULL) AND (tblVaga.ativada = 'True') AND (tblVaga.id_empresa_fk = @id_empresa_fk) ORDER BY tblVaga.ultima_atualizacao DESC" 
                    UpdateCommand="UPDATE tblVaga SET encerrada = GETDATE() WHERE (id_vaga = @id_vaga)">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_empresa_fk" SessionField="id_empresa" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="id_vaga" 
                            SessionField="Session(&quot;id_vaga&quot;)" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
             
            <asp:View ID="View2" runat="server">
                <br />
                <asp:Label ID="lblareaEdicao" runat="server" 
                    Text="Área de edição dos dados da vaga:"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Font-Size="11px" ForeColor="#FF6600" 
                    Text="* As informações sobre alteração das vagas são gravadas no sistema. Você deve ter autorização para acessar essa área."></asp:Label>
                <table class="style4" style="font-size: 12px">
                    <tr>
                        <td class="style6">
                            &nbsp;<span lang="pt-br">&nbsp;</span><table class="style8">
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ibtSalvarInclusao" runat="server" 
                                            ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" 
                                            ToolTip="Adicionar uma nova vaga" ValidationGroup="empresa" Width="24px" />
                                    </td>
                                    <td align="center">
                                        <asp:ImageButton ID="ibtSalvarAlterar" runat="server" 
                                            ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                            ToolTip="Atualizar vaga selecionada" ValidationGroup="empresa" />
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnVoltar" runat="server" Height="27px" 
                                            ImageUrl="~/clickoportunidades/icones/Standard/voltar.jpg" ToolTip="Voltar " 
                                            ValidationGroup="empresa" Width="26px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span lang="pt-br">Incluir</span></td>
                                    <td>
                                        <span lang="pt-br">Atualizar</span></td>
                                    <td>
                                        <span lang="pt-br">Voltar</span></td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2">
                            <asp:SqlDataSource ID="sqlVagaForm" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                DeleteCommand="DELETE FROM [tblVaga] WHERE [id_vaga] = @id_vaga" 
                                InsertCommand="INSERT INTO tblVaga(id_cargo_fk, id_empresa_fk, modalidade, id_escolaridade_fk, modalidade_inicio, modalidade_fim, descricao, perfil, id_localtrabalho_fk, FaixaEtariaInicial, FaixaEtariaFinal, sexo, estado_civil, horario_entrada, horario_saida, domingo, segunda, terca, quarta, quinta, sexta, sabado, horario_obs, salario, vale_refeicao, refeicao_local, salario_observacao, dados_qualitativos, vale_alimentacao, plano_saude, Bairro, id_cargo_fkPai, QuantVaga, Valetransporte, ativada, rua, complemento, bairroent, id_municipio_fk, pontoreferencia) VALUES (@id_cargo_fk, @id_empresa_fk, @modalidade, @id_escolaridade_fk, @modalidade_inicio, @modalidade_fim, @descricao, @perfil, @id_localtrabalho_fk, @faixaetariainicial, @faixaetariafinal, @sexo, @estado_civil, @horario_entrada, @horario_saida, @domingo, @segunda, @terca, @quarta, @quinta, @sexta, @sabado, @horario_obs, @salario, @vale_refeicao, @refeicao_local, @salario_observacao, @dados_qualitativos, @vale_alimentacao, @plano_saude, @bairro, @id_cargo_fkPai, @QuantVaga, @valetransporte, 'True', @rua, @complemento, @bairroent, @id_municipio_fk, @pontoreferencia)" 
                                SelectCommand="SELECT id_vaga, id_cargo_fk, modalidade, modalidade_inicio, modalidade_fim, descricao, perfil, id_localtrabalho_fk, id_escolaridade_fk, FaixaEtariaInicial, FaixaEtariaFinal, sexo, estado_civil, horario_entrada, horario_saida, domingo, segunda, terca, quarta, quinta, sexta, sabado, horario_obs, salario, salario_dia, salario_dia_mes, vale_transporte, vale_refeicao, vale_alimentacao, plano_saude, refeicao_local, salario_observacao, dados_qualitativos, ultima_atualizacao, encerrada, Bairro, id_cargo_fkPai, QuantVaga, Valetransporte, rua, complemento, bairroent, id_municipio_fk, id_empresa_fk, pontoreferencia FROM tblVaga WHERE (id_vaga = @id_vaga_fk)" 
                                
                                UpdateCommand="UPDATE tblVaga SET id_cargo_fk = @id_cargo_fk, modalidade = @modalidade, modalidade_inicio = @modalidade_inicio, modalidade_fim = @modalidade_fim, descricao = @descricao, perfil = @perfil, id_localtrabalho_fk = @id_localtrabalho_fk, id_escolaridade_fk = @id_escolaridade_fk, Faixaetariainicial = @faixaetariainicial, Faixaetariafinal = @faixaetariafinal, sexo = @sexo, estado_civil = @estado_civil, horario_entrada = @horario_entrada, horario_saida = @horario_saida, domingo = @domingo, segunda = @segunda, terca = @terca, quarta = @quarta, quinta = @quinta, sexta = @sexta, sabado = @sabado, horario_obs = @horario_obs, salario = @salario, vale_refeicao = @vale_refeicao, vale_alimentacao = @vale_alimentacao, plano_saude = @plano_saude, refeicao_local = @refeicao_local, salario_observacao = @salario_observacao, dados_qualitativos = @dados_qualitativos, Bairro = @bairro, id_cargo_fkPai = @id_cargo_fkPai, QuantVaga = @QuantVaga, rua = @rua, complemento = @complemento, bairroent = @bairroent, id_municipio_fk = @id_municipio_fk, pontoreferencia = @pontoreferencia, Valetransporte =@valetransporte WHERE (id_vaga = @id_vaga)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="gridVaga" Name="id_vaga_fk" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="id_vaga" Type="Decimal" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="cboid_cargo_fk" DefaultValue="" 
                                        Name="id_cargo_fk" PropertyName="SelectedValue" Type="String" />
                                    <asp:SessionParameter Name="id_empresa_fk" SessionField="id_empresa_fk" 
                                        Type="Int32" />
                                    <asp:ControlParameter ControlID="CBOModalidade" Name="modalidade" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="datmodalidade_inicio" Name="modalidade_inicio" 
                                        PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="datmodalidade_fim" Name="modalidade_fim" 
                                        PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="txtdescricao" Name="descricao" 
                                        PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtperfil" Name="perfil" PropertyName="Text" 
                                        Type="String" />
                                    <asp:ControlParameter ControlID="CBOid_localtrabalho_fk" 
                                        Name="id_localtrabalho_fk" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="CBOsexo" Name="sexo" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="CBOEstado_civil" Name="estado_civil" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtHorario_entrada" Name="horario_entrada" 
                                        PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtHorario_saida" Name="horario_saida" 
                                        PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="chkDomingo" Name="domingo" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="chkSegunda" Name="segunda" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="chkTerca" Name="terca" PropertyName="Checked" 
                                        Type="Boolean" />
                                    <asp:ControlParameter ControlID="chkQuarta" Name="quarta" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="chkQuinta" Name="quinta" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="chkSexta" Name="sexta" PropertyName="Checked" 
                                        Type="Boolean" />
                                    <asp:ControlParameter ControlID="chkSabado" Name="sabado" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="txtHorario_obs" Name="horario_obs" 
                                        PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="moeSalario" Name="salario" PropertyName="Text" 
                                        Type="Decimal" />
                                    <asp:ControlParameter ControlID="chkVale_refeicao" Name="vale_refeicao" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="chkVale_alimentacao" Name="vale_alimentacao" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="chkPlano_saude" Name="plano_saude" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="chkrefeicao_local" Name="refeicao_local" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="txtsalario_observacao" 
                                        Name="salario_observacao" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtdados_qualitativos" 
                                        Name="dados_qualitativos" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="CBOid_escolaridade_fk" 
                                        Name="id_escolaridade_fk" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="gridVaga" Name="id_vaga" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtBairro" DefaultValue="" Name="bairro" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cboid_cargo_fkPai" Name="id_cargo_fkPai" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtQuantVaga" Name="QuantVaga" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="CBOfaixaetariainicial" 
                                        Name="faixaetariainicial" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="CBOfaixaetariafinal" Name="faixaetariafinal" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtRua" Name="rua" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtcomplemento" Name="complemento" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtBairroEnt" Name="bairroent" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cboid_municipio_fk" Name="id_municipio_fk" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtpontoreferencia" Name="pontoreferencia" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="moeValetransporte" Name="valetransporte" 
                                        PropertyName="Text" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:SessionParameter Name="id_empresa_fk" SessionField="id_empresa_fk" />
                                    <asp:ControlParameter ControlID="cboid_cargo_fk" Name="id_cargo_fk" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="CBOModalidade" Name="modalidade" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="CBOid_escolaridade_fk" 
                                        Name="id_escolaridade_fk" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="datmodalidade_inicio" Name="modalidade_inicio" 
                                        PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="datmodalidade_fim" Name="modalidade_fim" 
                                        PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtdescricao" Name="descricao" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtperfil" Name="perfil" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="CBOid_localtrabalho_fk" 
                                        Name="id_localtrabalho_fk" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="CBOsexo" Name="sexo" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="CBOEstado_civil" Name="estado_civil" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtHorario_entrada" Name="horario_entrada" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtHorario_saida" Name="horario_saida" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="chkDomingo" Name="domingo" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="chkSegunda" Name="segunda" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="chkTerca" Name="terca" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="chkQuarta" Name="quarta" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="chkQuinta" Name="quinta" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="chkSexta" Name="sexta" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="chkSabado" Name="sabado" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="txtHorario_obs" Name="horario_obs" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="moeSalario" Name="salario" PropertyName="Text" 
                                        Type="Decimal" />
                                    <asp:ControlParameter ControlID="chkVale_refeicao" Name="vale_refeicao" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="chkrefeicao_local" Name="refeicao_local" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="txtsalario_observacao" 
                                        Name="salario_observacao" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtdados_qualitativos" 
                                        Name="dados_qualitativos" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="chkVale_alimentacao" Name="vale_alimentacao" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="chkPlano_saude" Name="plano_saude" 
                                        PropertyName="Checked" />
                                    <asp:ControlParameter ControlID="txtBairro" Name="bairro" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cboid_cargo_fkPai" Name="id_cargo_fkPai" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtQuantVaga" Name="QuantVaga" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="moeValetransporte" Name="valetransporte" 
                                        PropertyName="Text" Type="Decimal" />
                                    <asp:ControlParameter ControlID="CBOfaixaetariainicial" 
                                        Name="faixaetariainicial" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="CBOfaixaetariafinal" Name="faixaetariafinal" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtRua" Name="rua" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtcomplemento" Name="complemento" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtBairroEnt" Name="bairroent" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cboid_municipio_fk" Name="id_municipio_fk" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtpontoreferencia" Name="pontoreferencia" 
                                        PropertyName="Text" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:SqlDataSource ID="SqlLogAlteracao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                InsertCommand="INSERT INTO tblLogAlteraVaga(id_vaga, usuario, status) VALUES (@id_vaga, @usuario, @status)" 
                                SelectCommand="SELECT id_vaga FROM tblVaga">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="GridVaga" Name="id_vaga" 
                                        PropertyName="SelectedValue" />
                                    <asp:SessionParameter Name="usuario" SessionField="c_nome" />
                                    <asp:Parameter DefaultValue="área administrativa" Name="status" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Cargo:</td>
                        <td colspan="2">
                            <asp:DropDownList ID="cboid_cargo_fkPai" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="True" datasourceid="sqlCBOLista0" 
                                DataTextField="cargo" DataValueField="id_cargo" Font-Size="7pt" Width="340px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlCBOLista0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT id_cargo, cargo FROM tblCBO WHERE (tipo = 'Família') ORDER BY cargo">
                            </asp:SqlDataSource>
                            <br />
                            <asp:DropDownList ID="cboid_cargo_fk" runat="server" 
                                datasourceid="sqlCBOEmpresaVaga0" DataTextField="cargo" 
                                DataValueField="id_cargo" Font-Size="7pt" Width="380px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlCBOEmpresaVaga0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT id_cargo, cargo, tipo FROM tblCBO WHERE (SUBSTRING(id_cargo, 1, 4) = SUBSTRING(@id_cargo, 1, 4)) AND (tipo &lt;&gt; 'Família')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cboid_cargo_fkPai" Name="id_cargo" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Modalidade:</td>
                        <td class="style5">
                            <asp:DropDownList ID="CBOModalidade" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="ddlModalidade_SelectedIndexChanged">
                                <asp:ListItem Value="E">Efetiva</asp:ListItem>
                                <asp:ListItem Selected="True" Value="T">Temporária</asp:ListItem>
                                <asp:ListItem Value="F">Freelancer</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Quantidade de vagas:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtQuantVaga" runat="server" CausesValidation="True" 
                                MaxLength="10" Width="60px" />
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtQuantVaga" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Período inicial:</td>
                        <td class="style5">
                            <asp:TextBox ID="datmodalidade_inicio" runat="server" CausesValidation="True" 
                                MaxLength="7" Text='<%# Bind("modalidade_inicio", "{0:d}") %>' 
                                ToolTip="Data inicial. Formato mês/ano ex. 12/2008" Width="100px" 
                                Wrap="False" />
                            &nbsp;<cc1:MaskedEditExtender ID="modalidade_inicio_MaskedEditExtender" 
                                runat="server" Mask="99/9999" MaskType="Date" 
                                TargetControlID="datmodalidade_inicio"></cc1:MaskedEditExtender></td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="rqPeriodoInicial" runat="server" 
                                ControlToValidate="datmodalidade_inicio" 
                                ErrorMessage="Campo obrigatório. Digite mês/Ano ex. 12/2008" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Período final:</td>
                        <td class="style5">
                            <asp:TextBox ID="datmodalidade_fim" runat="server" MaxLength="7" 
                                Text='<%# Bind("modalidade_fim", "{0:D}") %>' 
                                ToolTip="Data final. Formato mês/ano ex. 12/2008. Caso modalidade seja efetiva o campo não é preenchido." 
                                Width="100px" />
                            <cc1:MaskedEditExtender ID="modalidade_fim_MaskedEditExtender" runat="server" 
                                Mask="99/9999" MaskType="Date" TargetControlID="datmodalidade_fim"></cc1:MaskedEditExtender>
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Descrição da função:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtdescricao" runat="server" MaxLength="1000" Rows="3" 
                                Text='<%# Bind("descricao") %>' TextMode="MultiLine" Width="175px" />
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="valDescricao" runat="server" 
                                ControlToValidate="txtdescricao" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Perfil:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtperfil" runat="server" MaxLength="2000" Rows="3" 
                                style="margin-left: 0px" Text='<%# Bind("perfil") %>' TextMode="MultiLine" 
                                Width="250px" />
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="valPerfil" runat="server" 
                                ControlToValidate="txtperfil" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Local de trabalho:</td>
                        <td class="style5">
                            <asp:DropDownList ID="CBOid_localtrabalho_fk" runat="server" 
                                datasourceid="sqlMunicipioLista0" DataTextField="nome" 
                                DataValueField="id_municipio">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlMunicipioLista0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT [id_municipio], [nome] FROM [tblMunicipio] ORDER BY [id_municipio]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style3">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Bairro:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtBairro" runat="server" MaxLength="40"></asp:TextBox>
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Escolaridade:</td>
                        <td class="style5">
                            <asp:DropDownList ID="CBOid_escolaridade_fk" runat="server" 
                                datasourceid="sqlEscolaridadeLista0" DataTextField="formacao" 
                                DataValueField="id_formacaonivel">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlEscolaridadeLista0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT [id_formacaonivel], [formacao] FROM [tblFormacaoNivel] ORDER BY [id_formacaonivel]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Faixa etária:</td>
                        <td class="style5">
                            <asp:DropDownList ID="CBOfaixaetariainicial" runat="server" 
                                datasourceid="sqlFaixaEtariaLista0" DataTextField="faixa" 
                                DataValueField="faixa">
                            </asp:DropDownList>
                            &nbsp;a&nbsp;
                            <asp:DropDownList ID="CBOfaixaetariafinal" runat="server" 
                                datasourceid="sqlFaixaEtariaLista0" DataTextField="faixa" 
                                DataValueField="faixa">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlFaixaEtariaLista0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT faixa FROM tblFaixaEtaria ORDER BY faixa">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style3">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="CBOfaixaetariafinal" 
                                ControlToValidate="CBOfaixaetariainicial" 
                                ErrorMessage="Valor maior do que a Faixa Etária Final" Operator="LessThan" 
                                ValidationGroup="empresa" ValueToCompare="CBOfaixaetariaFinal" Width="220px"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Sexo:<br />
                        </td>
                        <td class="style5">
                            <asp:DropDownList ID="CBOsexo" runat="server" datasourceid="sqlSexo0" 
                                DataTextField="sexo" DataValueField="id_sexo">
                                <asp:ListItem Value="M">Masculino</asp:ListItem>
                                <asp:ListItem Value="F">Feminino</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlSexo0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT [id_sexo], [sexo] FROM [tblSexo] ORDER BY [id_sexo]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Estado civil:</td>
                        <td class="style5">
                            <asp:DropDownList ID="CBOEstado_civil" runat="server" 
                                datasourceid="sqlEstadoCivilLista0" DataTextField="estadocivil" 
                                DataValueField="id_estadocivil">
                                <asp:ListItem Value="S">Solteiro</asp:ListItem>
                                <asp:ListItem Value="C">Casado</asp:ListItem>
                                <asp:ListItem Value="D">Desquitado</asp:ListItem>
                                <asp:ListItem Value="R">Divorciado</asp:ListItem>
                                <asp:ListItem Value="V">Viúvo</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlEstadoCivilLista0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT [id_estadocivil], [estadocivil] FROM [tblEstadoCivil] ORDER BY [estadocivil]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6" colspan="0" dir="ltr" style="text-align: left;">
                            Horário de trabalho&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td class="style5">
                            <span lang="pt-br">Entrada:</span><asp:TextBox ID="txtHorario_entrada" 
                                runat="server" MaxLength="5" Text='<%# Bind("horario_entrada") %>' 
                                ToolTip="Digite no formato HH:MM, inclusive os dois pontos." Width="70px" />
                            <cc1:MaskedEditExtender ID="Horario_entrada_MaskedEditExtender" runat="server" 
                                Mask="99:99" MaskType="Time" TargetControlID="txtHorario_entrada"></cc1:MaskedEditExtender>
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="valEntrada" runat="server" 
                                ControlToValidate="txtHorario_entrada" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" style="text-align: right;">
                            &nbsp;</td>
                        <td class="style5">
                            <span lang="pt-br">Saida:</span><asp:TextBox ID="txtHorario_saida" 
                                runat="server" MaxLength="5" Text='<%# Bind("horario_saida") %>' 
                                ToolTip="Digite no formato HH:MM, inclusive os dois pontos." Width="70px" />
                            <cc1:MaskedEditExtender ID="Horario_saida_MaskedEditExtender" runat="server" 
                                Mask="99:99" MaskType="Time" TargetControlID="txtHorario_saida"></cc1:MaskedEditExtender>
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="valSaida" runat="server" 
                                ControlToValidate="txtHorario_saida" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Dias trabalhados:</td>
                        <td class="style5">
                            <asp:CheckBox ID="chkSegunda" runat="server" Checked='<%# Bind("segunda") %>' 
                                Font-Size="7pt" Text="Seg" />
                            <asp:CheckBox ID="chkTerca" runat="server" Checked='<%# Bind("terca") %>' 
                                Font-Size="7pt" Text="Ter" />
                            &nbsp;<asp:CheckBox ID="chkQuarta" runat="server" Checked='<%# Bind("quarta") %>' 
                                Font-Size="7pt" Text="Quar" />
                            &nbsp;<asp:CheckBox ID="chkQuinta" runat="server" Checked='<%# Bind("quinta") %>' 
                                Font-Size="7pt" Text="Qui" />
                            <br />
                            <asp:CheckBox ID="chkSexta" runat="server" Checked='<%# Bind("sexta") %>' 
                                Font-Size="7pt" Text="Sex" />
                            <asp:CheckBox ID="chkSabado" runat="server" Checked='<%# Bind("sabado") %>' 
                                Font-Size="7pt" Text="Sab" />
                            &nbsp;<asp:CheckBox ID="chkDomingo" runat="server" Checked='<%# Bind("domingo") %>' 
                                Font-Size="7pt" Text="Dom" />
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Observações sobre horário de trabalho:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtHorario_obs" runat="server" MaxLength="500" Rows="3" 
                                Text='<%# Bind("horario_obs") %>' TextMode="MultiLine" Width="300px"></asp:TextBox>
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Remuneração/Salário: R$
                        </td>
                        <td class="style5" style="font-size: 10px;">
                            <asp:TextBox ID="moeSalario" runat="server" MaxLength="10" 
                                Text='<%# Bind("salario") %>' 
                                ToolTip="Digite o valor monetário (ex.1.000,00) com ponto e vírgula." />
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="valSalario" runat="server" 
                                ControlToValidate="moeSalario" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                            <span lang="pt-br">&nbsp;<asp:RegularExpressionValidator ID="RegExpSalario" 
                                runat="server" ControlToValidate="moeSalario" 
                                ErrorMessage="Valor não está correto, entre o formato 1000,00" 
                                ValidationExpression="^([0-9]*\,?[0-9]+|[0-9]+\,?[0-9]*)?$" 
                                ValidationGroup="empresa"></asp:RegularExpressionValidator>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Obs. sobre salário:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtsalario_observacao" runat="server" MaxLength="500" Rows="3" 
                                Text='<%# Bind("salario_observacao") %>' TextMode="MultiLine" Width="300px" />
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6" style="text-align: left; ">
                            Benefícios:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        </td>
                        <td colspan="2">
                            <asp:CheckBox ID="chkrefeicao_local" runat="server" 
                                Checked='<%# Bind("refeicao_local") %>' Text="Refeição no local" />
                            <asp:CheckBox ID="chkVale_alimentacao" runat="server" Text="Vale alimentação" />
                            &nbsp;&nbsp;<br />
                            <asp:CheckBox ID="chkPlano_saude" runat="server" 
                                Checked='<%# Bind("plano_saude") %>' Text="Plano de saúde" />
                            &nbsp;&nbsp;
                            <asp:CheckBox ID="chkVale_refeicao" runat="server" 
                                Checked='<%# Bind("vale_refeicao") %>' Text="Vale refeição" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" style="text-align: left;">
                            Vale transporte/Valor diário: R$</td>
                        <td class="style5" style="font-size: 10px;">
                            <asp:TextBox ID="moeValetransporte" runat="server" MaxLength="10" 
                                Text='<%# Bind("salario") %>' 
                                ToolTip="Digite o valor monetário (ex.1.000,00) com ponto e vírgula." 
                                Width="60px" />
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="valValetransporte" runat="server" 
                                ControlToValidate="moeValetransporte" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                            <span lang="pt-br">. </span>
                            <asp:RegularExpressionValidator ID="RegExpValeTransporte" runat="server" 
                                ControlToValidate="moeValetransporte" 
                                ErrorMessage="Valor não está correto, entre o formato 1000,00" 
                                ValidationExpression="^([0-9]*\,?[0-9]+|[0-9]+\,?[0-9]*)?$" 
                                ValidationGroup="empresa"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Outras informações sobre a vaga:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtdados_qualitativos" runat="server" MaxLength="1000" 
                                Rows="3" Text='<%# Bind("dados_qualitativos") %>' TextMode="MultiLine" 
                                Width="300px" />
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            Endereço da entrevista:</td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Rua:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtRua" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="rqRua" runat="server" 
                                ControlToValidate="txtRua" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Complemento:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtcomplemento" runat="server" Width="80px"></asp:TextBox>
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="rqcomplemento" runat="server" 
                                ControlToValidate="txtcomplemento" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Município:</td>
                        <td class="style5">
                            <asp:DropDownList ID="cboid_municipio_fk" runat="server" 
                                DataSourceID="SqlmunicipioEntrevista" DataTextField="nome" 
                                DataValueField="id_municipio">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlmunicipioEntrevista" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT [id_municipio], [nome] FROM [tblMunicipio]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Bairro:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtBairroEnt" runat="server"></asp:TextBox>
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="rqbairro" runat="server" 
                                ControlToValidate="txtBairroEnt" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            Ponto de referência:</td>
                        <td class="style5">
                            <asp:TextBox ID="txtpontoreferencia" runat="server" MaxLength="1000" Rows="3" 
                                TextMode="MultiLine" Width="300px"></asp:TextBox>
                        </td>
                        <td class="style3">
                            <asp:RequiredFieldValidator ID="rqpontoreferencia" runat="server" 
                                ControlToValidate="txtpontoreferencia" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </asp:View>
             
        </asp:MultiView>
       
    </asp:Panel>
    </div>
    </form>
</body>
</html>
