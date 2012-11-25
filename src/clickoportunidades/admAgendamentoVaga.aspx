<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admAgendamentoVaga.aspx.vb" Inherits="admVagasEdit" Theme="AdmClick" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">


        .style4
        {
            width: 917px;
        }
        .style6
        {
            width: 126px;
        }
        .style5
        {
            width: 229px;
        }
        .style3
        {
            width: 174px;
        }
        .style11
        {
        }
        .style12
        {
            width: 372px;
            height: 24px;
        }
        .style14
        {
            width: 307px;
        }
        .style15
        {
            height: 24px;
            width: 307px;
        }
        .style17
        {
            color: #006699;
            background-color: #E9E9E9;
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
        
        .style21
        {
            height: 13px;
            width: 360px;
        }
                
        .style25
        {
            width: 360px;
        }
                
        .style1
        {
            width: 100%;
        }
        
        .style26
        {
            height: 24px;
            width: 152px;
        }
        
        .style27
        {
            width: 152px;
        }
        
        .style28
        {
            width: 49px;
        }
        .style29
        {
            height: 24px;
            width: 49px;
        }
        
        .style8
        {
            width: 70%;
        }
                
        .style30
        {
            font-size: small;
        }
        .style31
        {
            height: 16px;
        }
                
        .style32
        {
            height: 24px;
        }
                
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span lang="pt-br">

       <table style="width: 101%">
                <tr>
                    <td style="text-align: left; ">
    
                    <span lang="pt-br">
                        <asp:Label ID="lblTitulo" runat="server" Text="Agendamento de Entrevista " 
                            style="font-size: medium; font-weight: 700"></asp:Label>
                            <br />
                            <br />
                                    <asp:ScriptManager ID="ScriptManager1" runat="server" 
                                        EnableScriptGlobalization="True">
                                    </asp:ScriptManager>
                </span>
    
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10px" 
                            ForeColor="#FF6600" 
                            Text="*Atenção: Qualquer operação efetuada nessa área é de responsabilidade única do Click Oportunidades, essas operações são registradas." 
                            Width="650px"></asp:Label>
                        &nbsp;
                        <br />
                    </td>
                </tr>
                </table>
           
  
        <br />
        <table cellpadding="0" cellspacing="0" style="width: 788px">
            <tr>
                <td class="style11" valign="top" colspan="2">
                    <span lang="pt-br">

                <asp:Label ID="lbltituloVagas0" runat="server" 
                    Text="Buscar vagas por data:" 
            ForeColor="#006699"></asp:Label>
                </span>
                </td>
                <td class="style28" valign="middle">
                    &nbsp;</td>
                <td class="style11" valign="middle">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11" valign="top" colspan="2">
                    Data Inicial:<span lang="pt-br"><asp:TextBox ID="txtDtInicial" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtDtInicial_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="txtDtInicial">
                    </ajaxToolkit:CalendarExtender>
    
                    </span>
    
                </td>
                <td class="style28" valign="middle">
                    &nbsp;</td>
                <td class="style11" valign="middle">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11" valign="top" colspan="2">
    
        <span lang="pt-br">

                    Data Final:&nbsp;

                    <asp:TextBox ID="txtDtFinal" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtDtFinal_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="txtDtFinal">
                    </ajaxToolkit:CalendarExtender>
    
                    <asp:ImageButton ID="ImageButton4" runat="server" 
                        ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" 
                        ImageAlign="Middle" />
                    <asp:Label ID="Label32" runat="server" Text="Procurar"></asp:Label>
                    </span>
                </td>
                <td class="style28" valign="middle">
                    &nbsp;</td>
                <td class="style11" valign="middle">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11" valign="middle" colspan="2">
    
        <span lang="pt-br">
                        <asp:GridView ID="GridVaga" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CssClass="grid" DataKeyNames="id_vaga" 
                            DataSourceID="SqlBuscaVagas" CaptionAlign="Left">
                            <Columns>
                                <asp:CommandField ButtonType="Image" 
                                    SelectImageUrl="~/clickoportunidades/icones/Standard/001_59.gif" 
                                    ShowSelectButton="True" />
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label33" runat="server" Text='<%# Bind("id_vaga") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cargo">
                                    <HeaderTemplate>
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label35" runat="server" Text="Cargo"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBuscaCargo" runat="server"></asp:TextBox>
                                                    <asp:ImageButton ID="ImageButton5" runat="server" 
                                                        ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" 
                                                        onclick="ImageButton5_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label34" runat="server" Text='<%# Bind("cargo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <span lang="pt-br" 
                                    
                                    
                                    style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                Não existe candidatos para essa vaga. </span>
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#D1DDF1" />
                        </asp:GridView>
                    
                        </span>
                </td>
                <td class="style28" valign="middle">
                    &nbsp;</td>
                <td class="style11" valign="middle">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11" valign="middle" colspan="2">
                    <span lang="pt-br">

                <asp:Label ID="lbltituloVagas" runat="server" 
                    Text="Buscar vagas por:" 
            ForeColor="#006699"></asp:Label>
                </span>
                </td>
                <td class="style28" valign="middle">
                    &nbsp;</td>
                <td class="style11" valign="middle">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="middle">
    
     

                        <asp:Label ID="Label2" runat="server" Text="Usuário/Responsável:"></asp:Label>

                </td>
                <td valign="middle">
                        <span lang="pt-br">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlUsuario" 
                            DataTextField="Nome" DataValueField="IdUsuario" Font-Size="8pt" 
                            style="margin-top: 11px; margin-bottom: 0px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlUsuario" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT [IdUsuario], [Nome] FROM [admPortalUsuario]
where nome = @nome">
                            <SelectParameters>
                                <asp:SessionParameter Name="nome" SessionField="c_nome" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </span>
                </td>
                <td class="style28" valign="middle">
                        &nbsp;</td>
                <td class="style14" valign="middle">
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="style11" valign="middle">
                    &nbsp;
                    <asp:Label ID="Label10" runat="server" Text="Empresa:"></asp:Label>
                </td>
                <td valign="middle">
                    <asp:TextBox ID="txtNomeFantasia" runat="server"></asp:TextBox>
&nbsp;
    
        <span lang="pt-br">
                &nbsp;</span><br />
                </td>
                <td class="style28" valign="middle">
                    &nbsp;</td>
                <td class="style14" valign="middle">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11" valign="top">
                    &nbsp;
                    <asp:Label ID="Label11" runat="server" Text="CNPJ:"></asp:Label>
                </td>
                <td valign="top">
                    <asp:TextBox ID="txtCNPJ" runat="server"></asp:TextBox>
                    <ajaxToolkit:MaskedEditExtender ID="txtCNPJ_MaskedEditExtender" runat="server" 
                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                        Mask="99.999.999/9999-99" TargetControlID="txtCNPJ">
                    </ajaxToolkit:MaskedEditExtender>
    
        <span lang="pt-br">
                    <asp:ImageButton ID="ImageButton2" runat="server" 
                        ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" 
                        ImageAlign="Middle" style="height: 24px" />
                    <asp:Label ID="Label12" runat="server" Text="Procurar"></asp:Label>
                    </span>
                </td>
                <td class="style28" valign="top">
                    &nbsp;</td>
                <td class="style14" valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11" valign="top">
                    &nbsp;</td>
                <td valign="top">
                    &nbsp;</td>
                <td class="style28" valign="top">
                    &nbsp;</td>
                <td class="style14" valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top" >
                    <span lang="pt-br">
                    &nbsp;<asp:Label ID="Label8" runat="server" Text="Empresa:"></asp:Label>
                </span>
                </td>
                <td valign="top" >
                    <span lang="pt-br">
                    <asp:DropDownList ID="cbonome_fantasia" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlEmpresa" DataTextField="nome_fantasia" 
                        DataValueField="id_empresa" Width="200px" Font-Size="8pt">
                    </asp:DropDownList>
                    
                </span>
                </td>
                <td class="style28" valign="top" >
                    &nbsp;</td>
                <td class="style14" valign="top" >
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12" valign="top">
                  
        <span lang="pt-br">

                    <asp:Label ID="Label9" runat="server" Text="Vaga (s):"></asp:Label>
                </span>
                </td>
                <td class="style32" valign="top">
                    <span lang="pt-br">
                    <asp:DropDownList ID="cboid_vaga" runat="server" 
                        DataSourceID="SqlVagas" DataTextField="idevaga" DataValueField="id_vaga" 
                        Width="300px" Font-Size="8pt">
                    </asp:DropDownList>
                                                                        
               
                
                                   
                </td>
                <td class="style29" valign="top">
                    <span lang="pt-br">
                                        
               
                
                                   
                    <asp:ImageButton ID="ibtSalvarAlterar0" runat="server" 
                                            ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                            ToolTip="Preencher formulário com os dados da vaga." 
                        ValidationGroup="empresa" CausesValidation="False" ImageAlign="Middle" 
                        Width="24px" />
                                                        
               
                
                                   
                    </td>
                <td class="style15" valign="top">
                    <span lang="pt-br">
                                        
               
                
                                   
                    <asp:Label ID="Label13" runat="server" 
                        Text="Clique aqui para preencher o formulário com os dados da vaga" 
                        Width="300px"></asp:Label>
                                        
               
                
                                   
                    </td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
                <td>
    
                    <span lang="pt-br">
                    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        
                        
                        
                        SelectCommand="SELECT id_empresa, nome_fantasia, razao_social FROM tblEmpresa WHERE (nome_fantasia IS NOT NULL) AND (razao_social IS NOT NULL) AND (nome_fantasia LIKE @nome_fantasia + '%') AND (REPLACE(REPLACE(REPLACE(cnpj, '.', ''), '/', ''), '-', '') LIKE @CNPJ + '%') ORDER BY nome_fantasia">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtNomeFantasia" DefaultValue="%" 
                                Name="nome_fantasia" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtCNPJ" DefaultValue="%" Name="CNPJ" 
                                PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                                    <asp:SqlDataSource ID="SqlVagas" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        
                        SelectCommand="SELECT tblCBO.cargo, tblVaga.id_vaga, CAST(tblVaga.id_vaga AS varchar) + ' ' + tblCBO.cargo AS idevaga FROM tblVaga INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo WHERE (tblVaga.id_empresa_fk = @id_empresa_fk) ORDER BY tblVaga.id_vaga">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cbonome_fantasia" Name="id_empresa_fk" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                    </asp:SqlDataSource>
                </span>
    
                </td>
                <td class="style28">
    
                    &nbsp;</td>
                <td class="style14">
    
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
                <td>
    
                    &nbsp;</td>
                <td class="style28">
    
                    &nbsp;</td>
                <td class="style14">
    
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
                <td>
    
                    &nbsp;</td>
                <td class="style28">
    
                    &nbsp;</td>
                <td class="style14">
    
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
                <td>
    
                    &nbsp;</td>
                <td class="style28">
    
                    &nbsp;</td>
                <td class="style14">
    
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11" colspan="4">
    
        <span lang="pt-br">
                        <br />
                    
                        </span>
                    <br />
                    <br />
    
                    <span lang="pt-br">
                    
                                    <asp:SqlDataSource ID="SqlBuscaVagas" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        
                        
                        
                        SelectCommand="SELECT tblCBO.cargo, tblVaga.id_vaga, CAST(tblVaga.id_vaga AS varchar) + ' ' + tblCBO.cargo AS idevaga FROM tblVaga INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo WHERE (tblVaga.ultima_atualizacao BETWEEN CONVERT (smalldatetime, @dtInicio + ' 00:00', 103) AND CONVERT (smalldatetime, @dtfim + ' 23:59', 103)) AND (tblCBO.cargo LIKE @cargo + '%') ORDER BY tblVaga.id_vaga">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtDtInicial" Name="dtInicio" 
                                                PropertyName="Text" DefaultValue="1900-01-01" />
                                            <asp:ControlParameter ControlID="txtDtFinal" Name="dtfim" PropertyName="Text" 
                                                DefaultValue="2070-01-01" />
                                            <asp:SessionParameter DefaultValue="%" Name="cargo" SessionField="cargo" />
                                        </SelectParameters>
                    </asp:SqlDataSource>
                        </span>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style11" colspan="2">
                    &nbsp;</td>
                <td class="style28">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
            </tr>
            </table>
                &nbsp;</span><br />
        <asp:Panel ID="Panel1" runat="server" Width="664px">
            <div style="border: 1px solid #006699">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:Label ID="lblareaEdicao" runat="server" 
                    Text="Área de edição dos dados da vaga" Font-Bold="True" Font-Size="15px"></asp:Label>
                        <br />
                        <br />
                        &nbsp;<asp:Label ID="lblAviso" runat="server" ForeColor="#FF6600"></asp:Label>
                        <br />
                        <table class="style4" style="font-size: 12px">
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                                <td colspan="2">
                                    <asp:SqlDataSource ID="SqlLogAlteracao" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        InsertCommand="INSERT INTO tblLogAlteraVaga(id_vaga, usuario, status) VALUES (@id_vaga, @usuario, @status)" 
                                        SelectCommand="SELECT id_vaga FROM tblVaga">
                                        <InsertParameters>
                                            <asp:SessionParameter Name="usuario" SessionField="c_nome" />
                                            <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                                            <asp:Parameter DefaultValue="área administrativa" Name="status" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sqlCaptadores" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                                        SelectCommand="SELECT '' AS Matricula, 'Empresa' AS nome 
	UNION 
SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome 
	FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario 
	ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario 
	WHERE (admPortalPerfilUsuario.IdPerfil = 5)
	order by nome ">
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sqlVagaForm" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        InsertCommand="INSERT INTO tblVaga(id_cargo_fk, id_empresa_fk, modalidade, id_escolaridade_fk, modalidade_inicio, modalidade_fim, descricao, perfil, id_localtrabalho_fk, Faixaetariainicial, Faixaetariafinal, sexo, estado_civil, horario_entrada, horario_saida, domingo, segunda, terca, quarta, quinta, sexta, sabado, horario_obs, salario, vale_refeicao, refeicao_local, salario_observacao, dados_qualitativos, vale_alimentacao, plano_saude, Bairro, id_cargo_fkPai, QuantVaga, Valetransporte, ativada, rua, complemento, bairroent, id_municipio_fk, pontoreferencia, resp_vaga) VALUES (@id_cargo_fk, @id_empresa_fk, @modalidade, @id_escolaridade_fk, @modalidade_inicio, @modalidade_fim, @descricao, @perfil, @id_localtrabalho_fk, @faixaetariainicial, @faixaetariafinal, @sexo, @estado_civil, @horario_entrada, @horario_saida, @domingo, @segunda, @terca, @quarta, @quinta, @sexta, @sabado, @horario_obs, @salario, @vale_refeicao, @refeicao_local, @salario_observacao, @dados_qualitativos, @vale_alimentacao, @plano_saude, @bairro, @id_cargo_fkPai, @QuantVaga, @valetransporte, NULL, @rua, @complemento, @bairroent, @id_municipio_fk, @pontoreferencia, @resp_vaga)" 
                                        SelectCommand="SELECT tblVaga.id_vaga, tblVaga.modalidade, tblVaga.modalidade_inicio, tblVaga.modalidade_fim, tblVaga.descricao, tblVaga.perfil, tblVaga.id_localtrabalho_fk, tblVaga.Faixaetariainicial, tblVaga.Faixaetariafinal, tblVaga.sexo, tblVaga.estado_civil, tblVaga.horario_entrada, tblVaga.horario_saida, tblVaga.domingo, tblVaga.segunda, tblVaga.terca, tblVaga.quarta, tblVaga.quinta, tblVaga.sexta, tblVaga.sabado, tblVaga.horario_obs, CONVERT (numeric(8 , 2), tblVaga.salario) AS salario, tblVaga.salario_dia, tblVaga.salario_dia_mes, tblVaga.vale_transporte, tblVaga.vale_refeicao, tblVaga.vale_alimentacao, tblVaga.plano_saude, tblVaga.refeicao_local, tblVaga.salario_observacao, tblVaga.dados_qualitativos, tblVaga.ultima_atualizacao, tblVaga.encerrada, tblVaga.Bairro, tblVaga.QuantVaga, CONVERT (numeric(8 , 2), tblVaga.Valetransporte) AS Valetransporte, tblVaga.rua, tblVaga.complemento, tblVaga.bairroent, tblVaga.id_municipio_fk, tblVaga.pontoreferencia, tblVaga.id_cargo_fk, tblVaga.id_empresa_fk, tblVaga.id_cargo_fkPai, tblCBO.cargo, tblCBO.tipo, tblVaga.id_escolaridade_fk, CASE WHEN tblVaga.ativada IS NULL THEN '0' WHEN tblVaga.ativada = 0 THEN '2' WHEN tblVaga.ativada = 1 THEN '1' END AS ativada, tblVaga.ativada_obs, tblVaga.resp_vaga, tblEmpresa.id_sindicato_fk FROM tblEmpresa RIGHT OUTER JOIN tblVaga INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo ON tblEmpresa.id_empresa = tblVaga.id_empresa_fk WHERE (tblVaga.id_vaga = @id_vaga)" 
                                        
                                        
                                        UpdateCommand="UPDATE tblVaga SET id_cargo_fk = @id_cargo_fk, modalidade = @modalidade, modalidade_inicio = @modalidade_inicio, modalidade_fim = @modalidade_fim, descricao = @descricao, perfil = @perfil, id_localtrabalho_fk = @id_localtrabalho_fk, id_escolaridade_fk = @id_escolaridade_fk, Faixaetariainicial = @faixaetariainicial, Faixaetariafinal = @faixaetariafinal, sexo = @sexo, estado_civil = @estado_civil, horario_entrada = @horario_entrada, horario_saida = @horario_saida, domingo = @domingo, segunda = @segunda, terca = @terca, quarta = @quarta, quinta = @quinta, sexta = @sexta, sabado = @sabado, horario_obs = @horario_obs, salario = @salario, vale_refeicao = @vale_refeicao, vale_alimentacao = @vale_alimentacao, plano_saude = @plano_saude, refeicao_local = @refeicao_local, salario_observacao = @salario_observacao, dados_qualitativos = @dados_qualitativos, Bairro = @bairro, id_cargo_fkPai = @id_cargo_fkPai, QuantVaga = @QuantVaga, rua = @rua, complemento = @complemento, bairroent = @bairroent, id_municipio_fk = @id_municipio_fk, pontoreferencia = @pontoreferencia, Valetransporte = REPLACE(@valetransporte, ',', '.'), ativada = (CASE WHEN @ativada = 0 THEN NULL WHEN @ativada = 1 THEN '1' WHEN @ativada = 2 THEN '0' END), ativada_obs = @ativada_obs, resp_vaga = @resp_vaga WHERE (id_vaga = @id_vaga)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="cboid_cargo_fk" DefaultValue="" 
                                                Name="id_cargo_fk" PropertyName="SelectedValue" Type="String" />
                                            <asp:SessionParameter Name="id_empresa_fk" SessionField="id_empresa_fk" 
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="CBOModalidade" Name="modalidade" 
                                                PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="txtmodalidade_inicio" Name="modalidade_inicio" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtmodalidade_fim" Name="modalidade_fim" 
                                                PropertyName="Text" Type="String" />
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
                                            <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                                            <asp:ControlParameter ControlID="cboativada" Name="ativada" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="txtativada_obs" Name="ativada_obs" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="cboresp_vaga" Name="resp_vaga" 
                                                PropertyName="SelectedValue" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="cbonome_fantasia" Name="id_empresa_fk" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="cboid_cargo_fk" Name="id_cargo_fk" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="CBOModalidade" Name="modalidade" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="CBOid_escolaridade_fk" 
                                                Name="id_escolaridade_fk" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="txtmodalidade_inicio" Name="modalidade_inicio" 
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="txtmodalidade_fim" Name="modalidade_fim" 
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
                                            <asp:SessionParameter Name="resp_vaga" SessionField="c_Nome" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sqlSindicato" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="select * from tblsindicatos"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    Responsável:</td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cboresp_vaga" runat="server" DataSourceID="sqlCaptadores" 
                                        DataTextField="Nome" DataValueField="Nome" Font-Size="8pt">
                                        <asp:ListItem>Empresa</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    <span lang="pt-br">Empresa:</span></td>
                                <td colspan="2">
                                    <asp:SqlDataSource ID="sqlEmpresas" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT [nome_fantasia], [id_empresa] FROM [tblEmpresa] WHERE [nome_fantasia] is not null ORDER BY [nome_fantasia]">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="cboid_empresa_fk" runat="server" 
                                        DataSourceID="sqlEmpresas" DataTextField="nome_fantasia" 
                                        DataValueField="id_empresa" Font-Size="8pt" Width="380px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    Sindicato:</td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cboid_sindicato_fk" runat="server" 
                                        DataSourceID="sqlSindicato" DataTextField="sindicato" 
                                        DataValueField="id_sindicato" Enabled="False" Font-Size="8pt" Width="380px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    Cargo:</td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cboid_cargo_fkPai" runat="server" 
                                AppendDataBoundItems="True" AutoPostBack="True" datasourceid="sqlCBOLista0" 
                                DataTextField="cargo" DataValueField="id_cargo" Font-Size="8pt" 
                                Width="340px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlCBOLista0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                
                                
                                        SelectCommand="SELECT id_cargo, cargo FROM tblCBO WHERE (tipo = 'Família') ORDER BY cargo">
                                    </asp:SqlDataSource>
                                    <br />
                                    <asp:DropDownList ID="cboid_cargo_fk" runat="server" 
                                datasourceid="sqlCBOEmpresaVaga0" DataTextField="cargo" 
                                DataValueField="id_cargo" Font-Size="8pt" Width="380px" Font-Strikeout="False">
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
                                onselectedindexchanged="ddlModalidade_SelectedIndexChanged" Font-Size="8pt">
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
                                    <asp:TextBox ID="txtmodalidade_inicio" runat="server" CausesValidation="True" 
                                MaxLength="7" Text='<%# Bind("modalidade_inicio", "{0:d}") %>' 
                                ToolTip="Data inicial. Formato mês/ano ex. 12/2008" Width="100px" 
                                Wrap="False" />
                                    &nbsp;<ajaxToolkit:MaskedEditExtender ID="modalidade_inicio_MaskedEditExtender" 
                                runat="server" AcceptNegative="Right" Mask="99/9999" MaskType="Date" 
                                TargetControlID="txtmodalidade_inicio" Enabled="True">
                                    </ajaxToolkit:MaskedEditExtender>
                                </td>
                                <td class="style3">
                                    <asp:RequiredFieldValidator ID="rqPeriodoInicial" runat="server" 
                                ControlToValidate="txtmodalidade_inicio" 
                                ErrorMessage="Campo obrigatório. Digite mês/Ano ex. 12/2008" 
                                ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    Período final:</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtmodalidade_fim" runat="server" MaxLength="7" 
                                Text='<%# Bind("modalidade_fim", "{0:D}") %>' 
                                ToolTip="Data final. Formato mês/ano ex. 12/2008. Caso modalidade seja efetiva o campo não é preenchido." 
                                Width="100px" />
                                    <ajaxToolkit:MaskedEditExtender ID="modalidade_fim_MaskedEditExtender" 
                                runat="server" Mask="99/9999" MaskType="Date" 
                                TargetControlID="txtmodalidade_fim" Enabled="True">
                                    </ajaxToolkit:MaskedEditExtender>
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
                                DataValueField="id_municipio" Font-Size="8pt">
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
                                    <asp:DropDownList ID="cboid_escolaridade_fk" runat="server" 
                                datasourceid="sqlEscolaridadeLista0" DataTextField="formacao" 
                                DataValueField="id_formacaonivel" Font-Size="8pt">
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
                                    <asp:DropDownList ID="cboFaixaetariainicial" runat="server" 
                                datasourceid="sqlFaixaEtariaLista0" DataTextField="faixa" 
                                DataValueField="faixa" Font-Size="8pt">
                                    </asp:DropDownList>
                                    &nbsp;a&nbsp;
                                    <asp:DropDownList ID="cboFaixaetariaFinal" runat="server" 
                                datasourceid="sqlFaixaEtariaLista0" DataTextField="faixa" 
                                DataValueField="faixa" Font-Size="8pt">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlFaixaEtariaLista0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                SelectCommand="SELECT faixa FROM tblFaixaEtaria ORDER BY faixa"></asp:SqlDataSource>
                                </td>
                                <td class="style3">
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="CBOfaixaetariafinal" 
                                ControlToValidate="CBOfaixaetariainicial" 
                                ErrorMessage="Valor maior do que a Faixa Etária Final" Operator="LessThan" 
                                ValidationGroup="empresa" ValueToCompare="CBOfaixaetariaFinal" 
                                Width="220px"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    Sexo:<br />
                                </td>
                                <td class="style5">
                                    <asp:DropDownList ID="CBOsexo" runat="server" datasourceid="sqlSexo0" 
                                DataTextField="sexo" DataValueField="id_sexo" Font-Size="8pt">
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
                                DataValueField="id_estadocivil" Font-Size="8pt">
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
                                    <ajaxToolkit:MaskedEditExtender ID="Horario_entrada_MaskedEditExtender" 
                                runat="server" Mask="99:99" MaskType="Time" 
                                TargetControlID="txtHorario_entrada">
                                    </ajaxToolkit:MaskedEditExtender>
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
                                    <span lang="pt-br">&nbsp;&nbsp; Saida:</span><asp:TextBox ID="txtHorario_saida" 
                                runat="server" MaxLength="5" Text='<%# Bind("horario_saida") %>' 
                                ToolTip="Digite no formato HH:MM, inclusive os dois pontos." Width="70px" />
                                    <ajaxToolkit:MaskedEditExtender ID="Horario_saida_MaskedEditExtender" 
                                runat="server" Mask="99:99" MaskType="Time" 
                                TargetControlID="txtHorario_saida">
                                    </ajaxToolkit:MaskedEditExtender>
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
                                    <span lang="pt-br">&nbsp;</span><asp:RegularExpressionValidator 
                                        ID="regValSalario" runat="server" ControlToValidate="moeSalario" 
                                        ErrorMessage="Formato incorreto. Ex 1000,00" 
                                        ValidationExpression="^([0-9]*\,?[0-9]+|[0-9]+\,?[0-9]*)?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    Obs. sobre salário:</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtsalario_observacao" runat="server" MaxLength="500" Rows="3" 
                                Text='<%# Bind("salario_observacao") %>' TextMode="MultiLine" 
                                Width="300px" />
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
                                Checked='<%# Bind("refeicao_local") %>' Text="Refeição no local" Font-Size="8pt" />
                                    <asp:CheckBox ID="chkVale_alimentacao" runat="server" Text="Vale alimentação" 
                                        Font-Size="8pt" />
                                    &nbsp;&nbsp;<br />
                                    <asp:CheckBox ID="chkPlano_saude" runat="server" 
                                Checked='<%# Bind("plano_saude") %>' Text="Plano de saúde" Font-Size="8pt" />
                                    &nbsp;&nbsp;
                                    <asp:CheckBox ID="chkVale_refeicao" runat="server" 
                                Checked='<%# Bind("vale_refeicao") %>' Text="Vale refeição" Font-Size="8pt" />
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
                                ValidationGroup="empresa" Enabled="False"></asp:RequiredFieldValidator>
                                    <span lang="pt-br">&nbsp;<asp:RegularExpressionValidator ID="regValValeTransporte" 
                                        runat="server" ControlToValidate="moeValetransporte" 
                                        ErrorMessage="Formato incorreto. Ex 1000,00" 
                                        ValidationExpression="^([0-9]*\,?[0-9]+|[0-9]+\,?[0-9]*)?$"></asp:RegularExpressionValidator>
                                    </span>
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
                                <td colspan="3" class="style17">
                                    Endereço da entrevista:</td>
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
                                DataValueField="id_municipio" Font-Size="8pt">
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
                            <tr>
                                <td class="style6">
                                    Status:</td>
                                <td class="style5">
                                    <asp:DropDownList ID="cboativada" runat="server" Enabled="False" 
                                        Font-Size="8pt">
                                        <asp:ListItem Value="0">Em análise</asp:ListItem>
                                        <asp:ListItem Value="1">Ativada</asp:ListItem>
                                        <asp:ListItem Value="2">Desativada</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    Obs Status:</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtativada_obs" runat="server" Height="52px" 
                                        TextMode="MultiLine" Width="300px"></asp:TextBox>
                                </td>
                                <td class="style3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    <table class="style8">
                                        <tr>
                                            <td align="left">
                                                <asp:ImageButton ID="ibtSalvarAlterar" runat="server" ImageAlign="Middle" 
                                                    ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                                    ToolTip="Atualizar vaga selecionada" ValidationGroup="empresa" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="justify">
                                                <asp:Label ID="lblAlterar" runat="server" Text="Atualizar"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style3">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridEntrevistaGeral0" runat="server" 
                            AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                            CssClass="grid" DataSourceID="sqlEmpresaDetalhe" PageSize="5" 
                            style="margin-right: 0px" Width="90%">
                            <PagerStyle CssClass="pagerstyle" />
                            <Columns>
                                <asp:BoundField DataField="representante" HeaderText="Representante" 
                                    SortExpression="representante" />
                                <asp:BoundField DataField="telefones" HeaderText="Telefones / Representante" 
                                    SortExpression="telefones" />
                                <asp:BoundField DataField="celular" HeaderText="Celular / Representante" 
                                    SortExpression="celular" />
                                <asp:BoundField DataField="emailrep" HeaderText="Email / Representante" 
                                    SortExpression="emailrep" />
                                <asp:BoundField DataField="email" HeaderText="Email / Empresa" 
                                    SortExpression="email" />
                            </Columns>
                            <PagerTemplate>
                                <asp:Label ID="Label31" runat="server" Text="Mostrar filas:" />
                                <asp:DropDownList ID="RegsPag2" runat="server" AutoPostBack="true" 
                                    CssClass="LetraNormal" OnSelectedIndexChanged="RegsPag_SelectedIndexChanged">
                                    <asp:ListItem Value="3" />
                                    <asp:ListItem Value="5" />
                                    <asp:ListItem Value="10" />
                                    <asp:ListItem Value="15" />
                                </asp:DropDownList>
                                &nbsp; Ir a
                                <asp:TextBox ID="IraPag2" runat="server" AutoPostBack="true" CssClass="irapag" 
                                    OnTextChanged="IraPag" />
                                de
                                <asp:Label ID="lblTotalNumberOfPages2" runat="server" />
                                &nbsp;
                                <asp:Button ID="Button13" runat="server" CommandArgument="First" 
                                    CommandName="Page" CssClass="primero" ToolTip="Prim. Pag" />
                                <asp:Button ID="Button14" runat="server" CommandArgument="Prev" 
                                    CommandName="Page" CssClass="anterior" ToolTip="Pág. anterior" />
                                <asp:Button ID="Button15" runat="server" CommandArgument="Next" 
                                    CommandName="Page" CssClass="siguiente" ToolTip="Próx. página" />
                                <asp:Button ID="Button16" runat="server" CommandArgument="Last" 
                                    CommandName="Page" CssClass="ultimo" ToolTip="Últ. Pag" />
                            </PagerTemplate>
                            <EmptyDataTemplate>
                                <span lang="pt-br" 
                                    style="font-family: Verdana; font-size: 11px; font-weight: bold; color: #FF6600">
                                Não existe registro no momento.</span>
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#D1DDF1" />
                            <AlternatingRowStyle CssClass="altrowstyle" />
                        </asp:GridView>
                        <br />
                        <asp:SqlDataSource ID="sqlEmpresaDetalhe" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT tblEmpresaRepresentantes.telefones, tblEmpresaRepresentantes.celular, tblEmpresaRepresentantes.emailrep, tblEmpresa.email, tblEmpresaRepresentantes.representante FROM tblEmpresa INNER JOIN tblEmpresaRepresentantes ON tblEmpresa.id_empresa = tblEmpresaRepresentantes.id_empresa_fk INNER JOIN tblVaga ON tblEmpresa.id_empresa = tblVaga.id_empresa_fk WHERE (tblVaga.id_vaga = @id_vaga)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <hr />
                        <asp:MultiView ID="MultiView3" runat="server" ActiveViewIndex="0">
                        
                            <asp:View ID="ViewEntrevistaEmpresa" runat="server">
                                <span class="style23" lang="pt-br"><span class="style30">Agendar entrevista na 
                                empresa&nbsp;</span><span class="style22"> </span>
                                </span>
                                <span class="style22"><b>
                                <br />
                                &nbsp;<br />
                                </b>
                                <asp:Label ID="lblMsg" runat="server" style="color: #FF0000; font-weight: 700"></asp:Label>
                                </span>
                                <table class="style1" 
                                    
                                    style="font-family: Verdana; font-size: 12px; color: #0066FF; font-weight: bold" 
                                    height="200">
                                    <tr>
                                        <td class="style6">
                                            <asp:Label ID="lbldataEmp1" runat="server" Text="Data na Empresa:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="datdataempresa" runat="server" 
                                                ToolTip="Digite a data da entrevista na Empresa" Width="65px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="empresa_CalendarExtender" runat="server" 
                                                BehaviorID="empresa_CalendarExtender" Enabled="True" 
                                                TargetControlID="datdataempresa">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rqdataempresa1" runat="server" 
                                                ControlToValidate="datdataempresa" ErrorMessage="Campo obrigatório" 
                                                ValidationGroup="AlteraEntrevista"></asp:RequiredFieldValidator>
                                            &nbsp;</td>
                                        <td rowspan="5">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <asp:Label ID="lblhoraemp1" runat="server" Text="Horário:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="horhoraempresa" runat="server" 
                                                ToolTip="Digite o horário da entrevista na empresa" Width="45px"></asp:TextBox>
                                            <ajaxToolkit:MaskedEditExtender ID="empresa_MaskedEditExtender" runat="server" 
                                                BehaviorID="empresa_MaskedEditExtender" ClearMaskOnLostFocus="False" 
                                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                Mask="99:99" TargetControlID="horhoraempresa" PromptCharacter="_">
                                            </ajaxToolkit:MaskedEditExtender>
                                            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                                ControlToValidate="horhoraempresa" ErrorMessage="Campo obrigatório" 
                                                ValidationGroup="AlteraEntrevista" ValueToCompare="__:__" 
                                                Operator="NotEqual"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <asp:Label ID="lblcaptadorent2" runat="server" 
                                                Text="Responsável pelo agendamento na empresa"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cbocaptador2" runat="server" DataSourceID="Sqloperador" 
                                                DataTextField="Nome" DataValueField="Nome">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <asp:Label ID="lbldataEmp2" runat="server" Text="Status da Entrevista:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cboid_statusEntrevistaClick" runat="server" 
                                                DataSourceID="SqlstatusEntrevista" DataTextField="statusentrevista" 
                                                DataValueField="id_statusEntrevista">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="style31">
                                            <asp:SqlDataSource ID="sqlStatusEntrevistaEmp" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                SelectCommand="SELECT id_statusEntrevista, statusEntrevista FROM tblStatusEntrevista WHERE (id_statusEntrevista = 1) OR (id_statusEntrevista = 9)">
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <asp:ImageButton ID="btnInserirEntEmp" runat="server" 
                                                ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" 
                                                ValidationGroup="AlteraEntrevista" />
                                            <asp:ImageButton ID="btnatualizaEntrevistaEmp1" runat="server" 
                                                ImageAlign="Middle" ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                                ToolTip="Inserir novo agendamento na empresa" 
                                                ValidationGroup="AlteraEntrevista" Visible="False" />
                                            <asp:ImageButton ID="btnCancelarEmp" runat="server" 
                                                ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" Visible="False" />
                                            <span lang="pt-br">&nbsp;&nbsp;&nbsp;&nbsp; </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <span lang="pt-br">Clique na seta azul para editar a entrevista. </span></td>
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
                                        <td colspan="2">
                                            <asp:SqlDataSource ID="sqlEntrevistaEmpForm" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                SelectCommand="SELECT id_entrevista, dataEmpresa, horaEmpresa, captador AS captador2, id_statusEntrevista AS id_statusEntrevistaClick FROM tblEntrevista WHERE (id_entrevista = @id_entrevista)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista" 
                                                        PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <asp:SqlDataSource ID="sqlEntrevistaEmp" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                    DeleteCommand="DELETE FROM tblEntrevista WHERE (id_entrevista = @id_entrevista)" 
                                    InsertCommand="INSERT INTO tblEntrevista(dataEmpresa, horaEmpresa, captador, id_vaga_fk) VALUES (@dataEmpresa, @horaEmpresa, @captador, @id_vaga_fk)" 
                                    SelectCommand="SELECT tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.id_statusEntrevista, tblEntrevista.captador, tblEntrevista.id_entrevista, tblEntrevista.id_vaga_fk, CASE WHEN tblVaga.ativada IS NULL THEN 'Em análise' WHEN tblVaga.ativada = 0 THEN 'Desativada' WHEN tblVaga.ativada = 1 THEN 'Ativada' END AS statusvaga, tblStatusEntrevista.statusEntrevista FROM tblEntrevista LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista LEFT OUTER JOIN tblVaga ON tblEntrevista.id_vaga_fk = tblVaga.id_vaga WHERE (tblEntrevista.id_vaga_fk = @id_vaga_fk)" 
                                    
                                    
                                    UpdateCommand="UPDATE tblEntrevista SET dataEmpresa = @dataEmpresa, horaEmpresa = @horaEmpresa, captador = @captador, id_statusEntrevista = @id_statusEntrevista WHERE (id_entrevista = @id_entrevista)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="id_vaga_fk" SessionField="id_vaga" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="id_entrevista" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="datdataempresa" dbtype="DateTime" 
                                            Name="dataEmpresa" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="horhoraempresa" Name="horaEmpresa" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="cbocaptador2" Name="captador" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="cboid_statusEntrevistaClick" 
                                            Name="id_statusEntrevista" PropertyName="SelectedValue" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="datdataempresa" DbType="DateTime" 
                                            Name="dataEmpresa" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="horhoraempresa" Name="horaEmpresa" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="cbocaptador2" Name="captador" 
                                            PropertyName="SelectedValue" />
                                        <asp:SessionParameter Name="id_vaga_fk" SessionField="id_vaga" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                                <br />
                                <asp:GridView ID="GridEntrevistaEmp0" runat="server" AllowPaging="True" 
                                    AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                                    CssClass="grid" DataKeyNames="id_entrevista" DataSourceID="sqlEntrevistaEmp" 
                                    PageSize="5" Width="600px">
                                    <PagerStyle CssClass="pagerstyle" />
                                    <Columns>
                                        <asp:CommandField ButtonType="Image" 
                                            HeaderText="Selecionar para acompanhamento" 
                                            SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                            ShowSelectButton="True">
                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        </asp:CommandField>
                                        <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="id_entrevista" />
                                        <asp:BoundField DataField="captador" HeaderText="Responsável" 
                                            SortExpression="captador" />
                                        <asp:TemplateField HeaderText="Data na Empresa" SortExpression="dataEmpresa">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label26" runat="server" 
                                                    Text='<%# Bind("dataEmpresa", "{0:D}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="horaEmpresa" HeaderText="Hora na Empresa" 
                                            SortExpression="horaEmpresa" />
                                        <asp:BoundField DataField="statusEntrevista" HeaderText="Status da Entrevista" 
                                            SortExpression="statusEntrevista" />
                                        <asp:BoundField DataField="statusvaga" HeaderText="Status da Vaga" 
                                            SortExpression="statusvaga" />
                                        <asp:CommandField ButtonType="Image" 
                                            DeleteImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                            ShowDeleteButton="True" />
                                    </Columns>
                                    <PagerTemplate>
                                        <asp:Label ID="Label27" runat="server" Text="Mostrar filas:" />
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
                                        Não existe registro no momento.</span>
                                    </EmptyDataTemplate>
                                    <AlternatingRowStyle CssClass="altrowstyle" />
                                    <SelectedRowStyle BackColor="#D1DDF1" />
                                </asp:GridView>
                                <br />
                                <span lang="pt-br" 
                                    style="font-family: Verdana; font-size: 12px; font-weight: bold; color: #0066FF">
                                <br />
                                </span>
                                <br />
                                <br />
                                <hr />
                                <br />
                            </asp:View>
                            
                        </asp:MultiView>
                        <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                            <asp:View ID="ViewEntrevistaClick" runat="server">
                                &nbsp;<span class="style30"><span class="style23" lang="pt-br">Agendar entrevista no 
                                Click&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                                </span>
                                <span class="style22">
                                <br />
                                
                                </span>
                                <asp:GridView ID="GridEntrevista" runat="server" AllowPaging="True" 
                                    AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                                    CssClass="grid" DataKeyNames="id_entrevista" DataSourceID="SqlGridEntrevista" 
                                    PageSize="5" style="margin-right: 0px" Width="90%">
                                    <PagerStyle CssClass="pagerstyle" />
                                    <Columns>
                                        <asp:CommandField ButtonType="Image" HeaderText="Selecione entrevista" 
                                            SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                            ShowSelectButton="True">
                                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                                        </asp:CommandField>
                                        <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                            InsertVisible="False" SortExpression="id_entrevista" />
                                        <asp:TemplateField HeaderText="Data no Click" SortExpression="dataClick">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label21" runat="server" Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="horaClick" HeaderText="Hora no Click" 
                                            SortExpression="horaClick" />
                                        <asp:BoundField DataField="captador" HeaderText="Responsável" 
                                            SortExpression="captador" />
                                        <asp:BoundField DataField="dataEmpresa" DataFormatString="{0:d}" 
                                            HeaderText="Data Empresa" SortExpression="dataEmpresa" />
                                        <asp:BoundField DataField="horaEmpresa" HeaderText="Hora Empresa" 
                                            SortExpression="horaEmpresa" />
                                        <asp:BoundField DataField="statusEntrevista" HeaderText="Status da Entrevista" 
                                            SortExpression="statusEntrevista" />
                                        <asp:BoundField DataField="statusvaga" HeaderText="Status da Vaga" 
                                            SortExpression="statusvaga" />
                                        <asp:CommandField ButtonType="Image" 
                                            DeleteImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                            ShowDeleteButton="True" />
                                    </Columns>
                                    <PagerTemplate>
                                        <asp:Label ID="Label18" runat="server" Text="Mostrar filas:" />
                                        <asp:DropDownList ID="RegsPag" runat="server" AutoPostBack="true" 
                                            CssClass="LetraNormal">
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
                                        Não existe registro no momento.</span>
                                    </EmptyDataTemplate>
                                    <SelectedRowStyle BackColor="#D1DDF1" />
                                    <AlternatingRowStyle CssClass="altrowstyle" />
                                </asp:GridView>
                                <br />
                                <table border="0" cellpadding="0" cellspacing="0" 
                                    style="font-family: verdana; font-size: 12px; font-weight: bold; color: #0066FF">
                                    <tr>
                                        <td class="style27">
                                            Código:</td>
                                        <td class="style25" colspan="0">
                                            <asp:Label ID="lblCodEntrevista" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style27">
                                            <asp:Label ID="lbldataClick" runat="server" Text="Data no Click:"></asp:Label>
                                        </td>
                                        <td class="style25" colspan="0">
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
                                        <td class="style27">
                                            <asp:Label ID="lblhoraclick" runat="server" Text="Horário:"></asp:Label>
                                        </td>
                                        <td class="style25" colspan="0">
                                            <asp:TextBox ID="horhoraclick" runat="server" CausesValidation="True" 
                                                ToolTip="Digite o horário da entrevista no Click" 
                                                ValidationGroup="InsereEntrevista" Width="45px"></asp:TextBox>
                                            <ajaxToolkit:MaskedEditExtender ID="raclick_MaskedEditExtender" runat="server" 
                                                BehaviorID="raclick_MaskedEditExtender" ClearMaskOnLostFocus="False" 
                                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                Mask="99:99" TargetControlID="horhoraclick">
                                            </ajaxToolkit:MaskedEditExtender>
                                            <asp:RequiredFieldValidator ID="rqhoraclick" runat="server" 
                                                ControlToValidate="horhoraclick" ErrorMessage="Campo obrigatório" ToolTip=" " 
                                                ValidationGroup="InsereEntrevista"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style27">
                                            <asp:Label ID="lblcaptadorent" runat="server" 
                                                Text="Responsável pelo agendamento no Click Oportunidades:"></asp:Label>
                                        </td>
                                        <td class="style21" colspan="0">
                                            <asp:DropDownList ID="cbocaptador" runat="server" DataSourceID="Sqloperador" 
                                                DataTextField="Nome" DataValueField="Nome" style="height: 22px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style27">
                                            <asp:Label ID="lblStatusEntrevista" runat="server" Text="Status da Entrevista:"></asp:Label>
                                        </td>
                                        <td class="style21" colspan="0">
                                            <asp:DropDownList ID="cboid_statusEntrevista" runat="server" 
                                                DataSourceID="SqlstatusEntrevista" DataTextField="statusentrevista" 
                                                DataValueField="id_statusEntrevista">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style26">
                                            <br />
                                        </td>
                                        <td class="style25">
                                            <asp:SqlDataSource ID="SqlstatusEntrevista" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                SelectCommand="SELECT 111 AS id_statusEntrevista, 'Selecione' AS statusentrevista UNION ALL SELECT id_statusEntrevista, statusEntrevista FROM tblStatusEntrevista WHERE (id_statusEntrevista = 10) OR (id_statusEntrevista = 11)">
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="Sqloperador" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                                                SelectCommand="SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario WHERE (admPortalPerfilUsuario.IdPerfil = 5) ORDER BY admPortalUsuario.Nome">
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
                                <br />
                                <br />
                                <asp:SqlDataSource ID="SqlGridEntrevista" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                    DeleteCommand="DELETE FROM [tblEntrevista] WHERE [id_entrevista] = @original_id_entrevista " 
                                    InsertCommand="INSERT INTO tblEntrevista(id_vagacandidato_fk, dataEmpresa, horaEmpresa, dataClick, horaClick, captador, id_statusEntrevista) VALUES (@id_vagacandidato_fk, @dataEmpresa, @horaEmpresa, @dataClick, @horaClick, @captador, @id_statusEntrevista)" 
                                    OldValuesParameterFormatString="original_{0}" 
                                    SelectCommand="SELECT tblEntrevista.id_entrevista, tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.dataStatus, tblStatusEntrevista.statusEntrevista, tblEntrevista.id_statusEntrevista, tblEntrevista.captador, tblEntrevista.id_statusEntrevistaEmp, tblEntrevista.id_vaga_fk, CASE WHEN tblVaga.ativada IS NULL THEN 'Em análise' WHEN tblVaga.ativada = 0 THEN 'Desativada' WHEN tblVaga.ativada = 1 THEN 'Ativada' END AS statusvaga FROM tblEntrevista INNER JOIN tblVaga ON tblEntrevista.id_vaga_fk = tblVaga.id_vaga LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_vaga_fk = @id_vaga_fk) ORDER BY tblEntrevista.id_entrevista DESC" 
                                    
                                    UpdateCommand="UPDATE tblEntrevista SET id_statusEntrevista = @id_statusEntrevista WHERE (id_entrevista = @id_entrevista) ">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="id_vaga_fk" SessionField="id_vaga" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_id_entrevista" />
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
                                    InsertCommand="INSERT INTO tblEntrevista(id_vagacandidato_fk, dataClick, horaClick, captador) VALUES (@id_vagacandidato_fk, @dataClick, @horaClick, @captador)" 
                                    OldValuesParameterFormatString="original_{0}" 
                                    SelectCommand="SELECT tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.id_statusEntrevista, tblEntrevista.captador FROM tblEntrevista LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_entrevista = @id_entrevista)" 
                                    
                                    UpdateCommand="UPDATE tblEntrevista SET dataClick = @dataClick, horaClick = @horaClick, id_statusEntrevista = @statusEntrevista WHERE (id_entrevista = @id_entrevista)">
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
                                        <asp:ControlParameter ControlID="GridEntrevista" Name="id_entrevista" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="datdataclick" DbType="DateTime" 
                                            Name="dataClick" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="horhoraclick" Name="horaClick" 
                                            PropertyName="Text" />
                                        <asp:ControlParameter ControlID="cboid_statusEntrevista" 
                                            Name="statusEntrevista" PropertyName="SelectedValue" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:SessionParameter Name="id_vagacandidato_fk" 
                                            SessionField="id_vagacandidato" Type="Int32" />
                                        <asp:ControlParameter ControlID="datdataclick" DbType="DateTime" 
                                            Name="dataClick" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="horhoraclick" Name="horaClick" 
                                            PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="cbocaptador" Name="captador" 
                                            PropertyName="SelectedValue" />
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
                                <asp:SqlDataSource ID="sqlupdatevaga" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                    DeleteCommand="DELETE FROM [tblVaga] WHERE [id_vaga] = @id_vaga" 
                                    InsertCommand="INSERT INTO [tblVaga] ([ativada]) VALUES (@ativada)" 
                                    SelectCommand="SELECT [id_vaga], [ativada] FROM [tblVaga]" 
                                    UpdateCommand="UPDATE [tblVaga] SET [ativada] = 0 WHERE [id_vaga] = @id_vaga">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id_vaga" Type="Decimal" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" Type="Decimal" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="ativada" Type="Boolean" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                                <br />
                                <asp:SqlDataSource ID="sqlUpdateEntrevistas" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                    DeleteCommand="DELETE FROM [tblEntrevista] WHERE [id_entrevista] = @id_entrevista" 
                                    InsertCommand="INSERT INTO [tblEntrevista] ([id_vaga_fk], [id_statusEntrevista]) VALUES (@id_vaga_fk, @id_statusEntrevista)" 
                                    SelectCommand="SELECT [id_vaga_fk], [id_statusEntrevista], [id_entrevista] FROM [tblEntrevista]" 
                                    UpdateCommand="UPDATE tblEntrevista SET id_statusEntrevista = 10 WHERE (id_vaga_fk = @id_vaga_fk)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id_entrevista" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:SessionParameter Name="id_vaga_fk" SessionField="id_vaga" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="id_vaga_fk" Type="Decimal" />
                                        <asp:Parameter Name="id_statusEntrevista" Type="Int32" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </asp:View>
                        </asp:MultiView>
                        <br />
                        
                    </asp:View>
                    <br />
                </asp:MultiView>
            </div>
            <br />
        </asp:Panel>
                <span lang="pt-br">
                <br />
                <br />
                <br />
                </span>
                <br />
                <br />
    
    </div>
    </form>
</body>
</html>
