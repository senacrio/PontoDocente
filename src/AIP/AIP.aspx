<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AIP.aspx.vb" Inherits="AIP" Theme="AIP"  EnableEventValidation="True" %>

<%@ Register assembly="AspNetMaskedEdit" namespace="AspNetMaskedEdit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de Autorização Para Início de Projetos</title>
      <link href="AIP.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            width: 65px;
        }
        .style5
        {
            width: 52px;
        }
        .style6
        {
            width: 407px;
        }
        </style>



</head>
<body>
    <form id="form1" runat="server">
    <asp:Menu ID="MenuProjeto" runat="server" 
               OnMenuItemClick="MenuProjeto_MenuItemClick" Orientation="Horizontal" 
                BackColor="#B5C7DE" 
        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
        ForeColor="#284E98" StaticSubMenuIndent="" Height="20px" Width="131px">
               <StaticMenuStyle Width="50px" />
               <StaticSelectedStyle BackColor="#507CD1" />
               <StaticMenuItemStyle Width="110px" HorizontalPadding="5px" ItemSpacing="50px" 
                   VerticalPadding="2px" />
               <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
               <DynamicMenuStyle BackColor="#B5C7DE" />
               <DynamicSelectedStyle BackColor="#507CD1" />
               <DynamicMenuItemStyle VerticalPadding="2px" />
               <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
               <Items>
                   <asp:MenuItem Text="Projetos" ToolTip="Lista de projetos " Value="0" 
                       ImageUrl="~/Icones/projeto.png">
                   </asp:MenuItem>
                   <asp:MenuItem Text="Detalhe" ToolTip="Detalhe do projeto" Value="1" 
                       ImageUrl="~/Icones/detalhe.png">
                   </asp:MenuItem>
                   <asp:MenuItem Text="Estab/Compet/Munic" Value="2" ImageUrl="~/Icones/envolvidos.png" 
                       ToolTip="Estab/Compet/Municípios do Projeto"></asp:MenuItem>
                   <asp:MenuItem Text="Receitas/Despesa" Value="3" ImageUrl="~/Icones/retorno.png" 
                       ToolTip="Receitas/Despesas do Projeto"></asp:MenuItem>
                   <asp:MenuItem Text="Riscos/Interdep" 
                       ToolTip="Riscos e Interdependências do projeto" Value="4" 
                       ImageUrl="~/Icones/grid_semaforo_amarelo.jpg"></asp:MenuItem>
                   <asp:MenuItem ImageUrl="~/Icones/calendario.gif" Text="Cronograma" 
                       ToolTip="Cronograma do Projeto" Value="5"></asp:MenuItem>
               </Items>
           </asp:Menu>
    <div id="divPrincipal">
           
           &nbsp;<br />
           <table class="style1">
               <tr>
                   <td class="style4">
                       <asp:Label ID="Label1" runat="server" EnableTheming="False" ForeColor="#0066CC" 
                           Text="Projeto:"></asp:Label>
                   </td>
                   <td class="style5">
           <asp:TextBox ID="txtId_projeto0" runat="server" ReadOnly="True" 
               style="text-align: left" BackColor="#D7DFDF" Width="130px" Font-Bold="False" 
                           ForeColor="#3366CC"></asp:TextBox>
                                  </td>
                   <td class="style6">
                                  <asp:TextBox ID="txtnomeprojeto0" runat="server" 
               Width="406px" ReadOnly="True" style="text-align: left" BackColor="#D7DFDF" 
                           Font-Bold="False" ForeColor="#3366CC"></asp:TextBox>
           
                   </td>
                   <td>
                       <asp:ImageButton ID="botaoIncluir" runat="server" 
                           ImageUrl="~/Icones/001_03.gif" CssClass="botao" 
                           ToolTip="Incluir novo projeto" Height="25px" Width="25px" />
           
                   </td>
               </tr>
           </table>
&nbsp;<br />
          
          <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
               <asp:View ID="View1" runat="server">
                   <asp:Panel ID="Panel20" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de projeto - Parâmetros">
                       <asp:Label ID="lblProjeto" runat="server" Text="Código do Projeto:" 
                           Width="150px"></asp:Label>
                       <asp:TextBox ID="txtCodProj" runat="server" AutoPostBack="True" 
                           ToolTip="Entre com o Código do Projeto ou parte do Código do Projeto" 
                           Width="100px"></asp:TextBox>
                       <br />
                       <asp:Label ID="lblTitProjeto" runat="server" Text="Título do Projeto:  " 
                           Width="150px"></asp:Label>
                       <asp:TextBox ID="txtTitProj" runat="server" AutoPostBack="True" 
                           ToolTip="Entre com o título do projeto ou parte do mesmo." Width="505px"></asp:TextBox>
                       <br />
                       <asp:Label ID="lblCcustoProj" runat="server" Text="Centro de Custo:" 
                           Width="150px"></asp:Label>
                       <asp:TextBox ID="txtCCustoProj" runat="server" AutoPostBack="True" 
                           ToolTip="Entre com o Centro de Custo do Projeto" Width="100px"></asp:TextBox>
                       <br />
                       <asp:Label ID="lblUnidLotacProj" runat="server" Text="Unidade de Lotação:" 
                           Width="150px"></asp:Label>
                       <asp:TextBox ID="txtUnidLotac" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
                       <asp:DropDownList ID="DDLUnidLotacProj" runat="server" 
                           DataSourceID="SDSUnidLotac" DataTextField="des_unid_lotac" 
                           DataValueField="cod_unid_lotac" Enabled="False" Width="405px">
                       </asp:DropDownList>
                       <br />
                       <asp:Label ID="lblStatusProj" runat="server" EnableTheming="True" 
                           Text="Status:" Width="150px"></asp:Label>
                       <asp:DropDownList ID="CboStatusProj" runat="server" AutoPostBack="True">
                           <asp:ListItem Selected="True">Todos</asp:ListItem>
                        <asp:ListItem>Em Análise</asp:ListItem>
                        <asp:ListItem>Validado Gestor</asp:ListItem>
                        <asp:ListItem>Aprovado</asp:ListItem>
                        <asp:ListItem>Rejeitado</asp:ListItem>
                       </asp:DropDownList>
                       <br />
                       <asp:SqlDataSource ID="SDSUnidLotac" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                           SelectCommand="SELECT [cod_unid_lotac], [des_unid_lotac] FROM [STG_RHUnidadeLotacao] where cod_unid_lotac = @cod_unid_lotac">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="txtUnidLotac" Name="cod_unid_lotac" 
                                   PropertyName="Text" />
                           </SelectParameters>
                       </asp:SqlDataSource>
                       <asp:Label ID="lblEstabelecErro0" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300" Height="16px" Text=" " Width="600px"></asp:Label>
                   </asp:Panel>
                   <asp:Panel ID="Panel10" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de projeto" ToolTip="Incluir novo projeto">
                       <br />
                       <br />
                       <asp:GridView ID="GridViewProjetos" runat="server" AllowPaging="True" 
                           AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_Projeto" 
                           DataSourceID="SqlGridProjetos" Width="950px">
                           <Columns>
                               <asp:TemplateField HeaderText="Selecionar" ShowHeader="False"><ItemTemplate><asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                           CommandName="Select" ImageUrl="~/Icones/grid_selecionar.gif" 
                                           Text="Selecionar" /></ItemTemplate></asp:TemplateField>
                               <asp:BoundField DataField="id_Projeto" HeaderText="Id Projeto" ReadOnly="True" 
                                   SortExpression="id_Projeto" Visible="False" />
                               <asp:BoundField DataField="Codigoprojeto" HeaderText="Código Projeto" 
                                   SortExpression="Codigoprojeto" />
                               <asp:BoundField DataField="Tituloprojeto" HeaderText="Título Projeto" 
                                   SortExpression="Tituloprojeto" />
                               <asp:BoundField DataField="CentroCusto" HeaderText="Centro Custo" 
                                   SortExpression="CentroCusto" />
                               <asp:BoundField DataField="Nome_Cliente" HeaderText="Nome_Cliente" 
                                   SortExpression="Nome_Cliente" />
                               <asp:BoundField DataField="DataInicio" DataFormatString="{0:d}" 
                                   HeaderText="Data Início" SortExpression="DataInicio" />
                               <asp:BoundField DataField="DataFim" DataFormatString="{0:d}" 
                                   HeaderText="Data Fim" SortExpression="DataFim" />
                               <asp:BoundField DataField="status" HeaderText="Status" 
                                   SortExpression="status" />
                               <asp:TemplateField HeaderText="Integra Datasul" ShowHeader="False"><ItemTemplate>
                                   <asp:ImageButton ID="BtnIntegra" runat="server" CausesValidation="False" 
                                           CssClass="style7" ImageUrl="~/Icones/grid_salvar.gif" 
                                           onclick="ImageButton1_Click" Text="Botão" /></ItemTemplate><ItemStyle Height="15px" Width="15px" /></asp:TemplateField>
                               <asp:TemplateField HeaderText="Acesso EPM" ShowHeader="False">
                               <ItemTemplate>
                                   <a href='<%#DataBinder.Eval(Container.DataItem, "UrlEpm") %>' target="_blank">
                                   <asp:Image ID="ImageButton4" runat="server" 
                                       ImageUrl='<%# Eval("Link") %>' 
                                    
                                       />   </a>
                                   </ItemTemplate></asp:TemplateField>
                               <asp:TemplateField HeaderText="Excluir" ShowHeader="False"><ItemTemplate><asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                           CssClass="style8" ImageUrl="~/Icones/excluir.png" onclick="ImageButton3_Click" 
                                           Text="Excluir" ToolTip="Elimina o projeto selecionado" /></ItemTemplate></asp:TemplateField>
                               <asp:BoundField DataField="Integrado" SortExpression="Integrado" ></asp:BoundField>
                           </Columns>
                           <EmptyDataTemplate>
                               Não existem projetos cadastrados para a seleção escolhida
                           </EmptyDataTemplate>
                           <HeaderStyle HorizontalAlign="Left" />
                       </asp:GridView>
                       <asp:Label ID="lblmensagemProjeto0" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300"></asp:Label>
                       <br />
                       &nbsp;<asp:Label ID="LabelMatric" runat="server" Text="Matric" Visible="False"></asp:Label>
                       &nbsp;<asp:Label ID="LabelUnidLotac" runat="server" Text="UnidLotac" Visible="False"></asp:Label>
                       <br />
                       <asp:SqlDataSource ID="sdsIntegracao" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SenacConnectionString %>" 
                           InsertCommand="Integra_Projeto_DTS" InsertCommandType="StoredProcedure" 
                           SelectCommand="Le_Status_Projeto_DTS" SelectCommandType="StoredProcedure">
                           <SelectParameters>
                               <asp:SessionParameter Name="id_projeto" SessionField="Id_Projeto" 
                                   Type="Int32" />
                           </SelectParameters>
                           <InsertParameters>
                               <asp:SessionParameter DefaultValue="" Name="Id_Projeto" 
                                   SessionField="Id_Projeto" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                       <asp:SqlDataSource ID="SqlGridProjetos" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                           DeleteCommand="DELETE FROM aipProjeto WHERE (id_projeto = @id_projeto)" 
                           ProviderName="<%$ ConnectionStrings:SenacConnection.ProviderName %>" 
                           
                           SelectCommand="SELECT     
      CASE WHEN (@CodigoProjeto = '' or @CodigoProjeto is null)           THEN ltrim(rtrim(aipProjeto.Codigoprojeto))    ELSE ltrim(rtrim(@CodigoProjeto)) + '%' END as Param_Codigoprojeto ,
      CASE WHEN (@TituloProjeto = '' or @TituloProjeto is null)           THEN ltrim(rtrim(aipProjeto.Tituloprojeto))    ELSE ltrim(rtrim(@TituloProjeto)) + '%' END as Param_Tituloprojeto ,
      CASE WHEN (@CentroCusto   = '' or @CentroCusto   is null)           THEN ltrim(rtrim(aipProjeto.CentroCusto))      ELSE ltrim(rtrim(@CentroCusto))   + '%' END as Param_CentroCusto  ,
      CASE WHEN (@Status = 'Todos'   or @Status = '' or @Status is null)  THEN ltrim(rtrim(aipProjeto.Status))        ELSE ltrim(rtrim(@Status))              END as Status,

aipProjeto.id_Projeto, aipProjeto.Codigoprojeto, aipProjeto.Tituloprojeto, aipProjeto.VersaoProjeto, aipProjeto.Patrocinador, aipProjeto.Lider, aipProjeto.Demanda, 
                      aipProjeto.Objetivo, aipProjeto.Resultados, aipProjeto.Premissas, aipProjeto.DadosHistoricos, aipProjeto.Id_ExecConta, aipProjeto.Id_TipoCliente, aipProjeto.Cliente, 
                      aipProjeto.Resultado, aipProjeto.DataInicio, aipProjeto.DataFim, aipProjeto.UnidLotac, aipProjeto.CentroCusto, aipProjeto.Id_TipoProjeto, aipProjeto.PublicoAlvo, 
                      aipProjeto.status, aipProjeto.Id_UnidadeExecutora, aipProjeto.Equipe, aipProjeto.OutrasAreas, aipProjeto.Restricoes, aipProjeto.Produtos_Servicos, aipProjeto.Bairro, 
                      aipProjeto.Escopo, aipProjeto.Id_Gestor, aipProjeto.Id_TipoServico, aipProjeto.Id_Cliente, CASE WHEN View_Projetos_DTS.nome IS NULL 
                      THEN 'NÃO' ELSE 'SIM' END AS Integrado, aipProjeto.Id_OutrosClientes, aipProjeto.Usuario_Criacao, aipProjeto.NContr, aipProjeto.Data_Criacao, 
                      View_Clientes_DTS.nom_abrev AS Nome_Cliente, STG_RHUnidadeLotacao.des_unid_lotac, aipProjeto.StatusEpm, aipProjeto.URLEpm, 
                      CASE WHEN (aipProjeto.URLEpm IS NULL OR
                      aipProjeto.URLEpm = '') THEN '~/Icones/cancela_desligado.png' ELSE '~/Icones/projeto.png' END AS Link
FROM         aipProjeto INNER JOIN
                      View_Clientes_DTS ON aipProjeto.Id_Cliente = View_Clientes_DTS.cdn_cliente INNER JOIN
                      STG_RHUnidadeLotacao ON aipProjeto.UnidLotac = STG_RHUnidadeLotacao.cod_unid_lotac COLLATE Latin1_General_CI_AI LEFT OUTER JOIN
                      View_Projetos_DTS ON aipProjeto.Codigoprojeto = View_Projetos_DTS.cod_projeto COLLATE Latin1_General_CI_AI
WHERE     (aipProjeto.UnidLotac = CASE WHEN @UnidLotac IN (115010000, 115020000) THEN aipProjeto.UnidLotac ELSE CASE WHEN @UnidLotac = '114010200' AND 
                      aipProjeto.Id_Cliente = '999908313' THEN aipProjeto.UnidLotac ELSE @UnidLotac END END) AND 
                      (aipProjeto.Codigoprojeto LIKE (CASE WHEN (@CodigoProjeto = '' or @CodigoProjeto is null) THEN '%'   ELSE ltrim(rtrim(@CodigoProjeto)) + '%' END)) AND 
                      (aipProjeto.Tituloprojeto LIKE (CASE WHEN (@TituloProjeto = '' or @TituloProjeto is null) THEN '%'   ELSE ltrim(rtrim(@TituloProjeto)) + '%' END)) AND 
                      (aipProjeto.CentroCusto   LIKE (CASE WHEN (@CentroCusto   = '' or @CentroCusto   is null) THEN '%'   ELSE ltrim(rtrim(@CentroCusto))   + '%' END)) AND 
                      (aipProjeto.Status     =     CASE WHEN (@Status = 'Todos' or @Status = '' or @Status is null) THEN ltrim(rtrim(aipProjeto.Status)) ELSE ltrim(rtrim(@Status))        END)">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="txtUnidLotac" DbType="String" Name="UnidLotac" 
                                   PropertyName="Text" />
                               <asp:ControlParameter ControlID="CboStatusProj" Name="Status" 
                                   PropertyName="SelectedValue" Type="String" />
                               <asp:ControlParameter ControlID="txtCodProj" Name="CodigoProjeto" 
                                   PropertyName="Text" ConvertEmptyStringToNull="False" />
                               <asp:ControlParameter ControlID="txtTitProj" Name="TituloProjeto" 
                                   PropertyName="Text" ConvertEmptyStringToNull="False" />
                               <asp:ControlParameter ControlID="txtCCustoProj" Name="CentroCusto" 
                                   PropertyName="Text" ConvertEmptyStringToNull="False" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:ControlParameter ControlID="GridViewProjetos" Name="id_projeto" 
                                   PropertyName="SelectedValue" />
                           </DeleteParameters>
                       </asp:SqlDataSource>
                       <br />
                   </asp:Panel>
              </asp:View>
               
               <asp:View ID="View2" runat="server">
               <br />
                   <asp:Label ID="lblTitulo1" runat="server" EnableTheming="False" 
                       Font-Size="Large" ForeColor="Black" Text="1 - Identificação do Projeto"></asp:Label>
                   <br />
                   <br />
                   <asp:Label ID="lblCodigo" runat="server" Text="Código do projeto:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtCodigoprojeto" runat="server" 
                       ToolTip="Fomato XXXAAAANNNN (XXX = Área, AAAA = Ano e NNNN = Sequencial)"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RqCodigo" runat="server" 
                       ControlToValidate="txtCodigoprojeto" ErrorMessage="Campo obrigatório" 
                       Width="120px"></asp:RequiredFieldValidator>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <br />
                   <asp:Label ID="lblVersao0" runat="server" Text="Versão do projeto:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtVersaoProjeto" runat="server" MaxLength="3" Width="48px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RqCodigo10" runat="server" 
                       ControlToValidate="txtVersaoProjeto" ErrorMessage="Campo obrigatório" 
                       Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <asp:Label ID="lblCentroCusto" runat="server" Text="Centro de Custo:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtCentroCusto" runat="server" Width="105px"></asp:TextBox>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                   <asp:Label ID="lblNContr" runat="server" Text="Nr.Prop/Contrato:" Width="150px"></asp:Label>
                   <asp:TextBox ID="txtNContr" runat="server" Width="105px"></asp:TextBox>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <br />
                   <asp:Label ID="lblTítuloProjeto" runat="server" Text="Título do Projeto:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtTituloprojeto" runat="server" Width="600px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RqCodigo0" runat="server" 
                       ControlToValidate="txttituloprojeto" ErrorMessage="Campo obrigatório" 
                       Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <asp:Label ID="lblExecContas" runat="server" Text="Executivo de Contas:" 
                       Width="150px"></asp:Label>
                   <asp:DropDownList ID="cboId_ExecConta" runat="server" 
                       DataSourceID="SqlExecutContaDTS" DataTextField="nome" 
                       DataValueField="cod_exec" Width="605px">
                   </asp:DropDownList>
                   <br />
                   <asp:Label ID="lblPatrocinador" runat="server" Text="Patrocinador:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtpatrocinador" runat="server" Width="600px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RqCodigo8" runat="server" 
                       ControlToValidate="txtpatrocinador" ErrorMessage="Campo obrigatório" 
                       Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <asp:Label ID="lblGestor" runat="server" Text="Gestor:" Width="150px"></asp:Label>
                   <asp:DropDownList ID="cboId_Gestor" runat="server" DataSourceID="SGestorDTS" 
                       DataTextField="nome" DataValueField="cod_gestor" Width="605px">
                   </asp:DropDownList>
                   <br />
                   <asp:Label ID="lblLider" runat="server" Text="Líder do Projeto:" Width="150px"></asp:Label>
                   <asp:TextBox ID="txtLider" runat="server" Width="600px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RqCodigo11" runat="server" 
                       ControlToValidate="txtlider" ErrorMessage="Campo obrigatório" Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <asp:Label ID="lblEquipe" runat="server" Text="Equipe do Projeto:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtEquipe" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" Height="30px"></asp:TextBox>
                   <br />
                   <asp:Label ID="lblArea" runat="server" Text="Unidade/Área Executora:" 
                       Width="150px"></asp:Label>
                   <asp:DropDownList ID="cboId_UnidadeExecutora" runat="server" 
                       DataSourceID="SqlArea" DataTextField="Nome_Area" DataValueField="Id_Area" 
                       Width="605px">
                   </asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RqCodigo16" runat="server" 
                       ControlToValidate="cboId_UnidadeExecutora" ErrorMessage="Campo obrigatório" 
                       Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <br />
                   <asp:Label ID="lblOutrasAreas" runat="server" 
                       Text="Outras Áreas Envolvidas no Projeto:" Width="150px"></asp:Label>
                   <asp:TextBox ID="txtOutrasAreas" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="30px"></asp:TextBox>
                   <br />
                   <asp:Label ID="lblTpProjeto" runat="server" Text="Tipo de Projeto:" 
                       Width="150px"></asp:Label>
                   <asp:DropDownList ID="cboId_TipoProjeto" runat="server" 
                       DataSourceID="SqlTpProjeto" DataTextField="NomeTpProjeto" 
                       DataValueField="id_TpProjeto" Width="605px">
                   </asp:DropDownList>
                   <br />
                   <br />
                   <asp:Label ID="lblEstabelec1" runat="server" Text="Estabelecimentos:" 
                       Width="150px"></asp:Label>
                   <asp:GridView ID="GridEstabelec0" runat="server" AutoGenerateColumns="False" 
                       DataKeyNames="id_Projeto_Estabelec,Percentual" DataSourceID="SdsEstabelec" 
                       EmptyDataText="Não existem estabelecimentos amarrados a este projeto" 
                       Width="584px">
                       <Columns>
                           <asp:BoundField DataField="id_Projeto_Estabelec" 
                               HeaderText="id_Projeto_Estabelec" InsertVisible="False" 
                               SortExpression="id_Projeto_Estabelec" Visible="False" />
                           <asp:BoundField DataField="cod_estab" HeaderText="Código" ReadOnly="True" 
                               SortExpression="cod_estab" />
                           <asp:BoundField DataField="nom_abrev" HeaderText="Nome Abreviado" 
                               SortExpression="nom_abrev" />
                           <asp:BoundField DataField="nom_pessoa" HeaderText="Nome Estabelecimento" 
                               SortExpression="nom_pessoa" />
                           <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual"><EditItemTemplate><asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox></EditItemTemplate><FooterTemplate><asp:Label ID="LblTotPercEstab" runat="server" Font-Bold="True" 
                                       ForeColor="White" Text="Label" EnableTheming="False"></asp:Label></FooterTemplate><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("Percentual", "{0:n}") %>' 
                                       EnableTheming="True"></asp:Label></ItemTemplate><ControlStyle Width="50px" /><FooterStyle Width="50px" ForeColor="White" /><HeaderStyle Width="50px" /><ItemStyle Width="50px" /></asp:TemplateField>
                       </Columns>
                       <HeaderStyle HorizontalAlign="Left" />
                   </asp:GridView>
                   <br />
                   <asp:Label ID="lblAreaConhec" runat="server" Text="Áreas de Conhecimento:" 
                       Width="150px" Visible="False"></asp:Label>
                   <asp:GridView ID="GridAreaConhec0" runat="server" AutoGenerateColumns="False" 
                       DataKeyNames="id_projeto,codigo,AreaConhec" 
                       DataSourceID="SqlGridAreaConhec" 
                       EmptyDataText="Não existem Áreas de Conhecimento amarradas a este projeto" 
                       Width="591px" Visible="False">
                       <Columns>
                           <asp:BoundField DataField="Codigo" HeaderText="Código" 
                               SortExpression="Codigo" />
                           <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                               SortExpression="id_projeto" Visible="False" />
                           <asp:BoundField DataField="AreaConhec" HeaderText="Área de Conhecimento" 
                               SortExpression="AreaConhec"></asp:BoundField>
                           <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual"><EditItemTemplate><asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox></EditItemTemplate><FooterTemplate><asp:Label ID="LblTotalAreaConhec" runat="server" EnableTheming="False" 
                                       Font-Bold="True" ForeColor="White" Text="TotalPercentAreaCompet"></asp:Label></FooterTemplate><ItemTemplate><asp:Label ID="LblValorAreaConhec0" runat="server" 
                                       Text='<%# Eval("Percentual") %>'></asp:Label></ItemTemplate><HeaderStyle HorizontalAlign="Left" /></asp:TemplateField>
                       </Columns>
                       <HeaderStyle HorizontalAlign="Left" />
                   </asp:GridView>
                   <asp:SqlDataSource ID="SqlTpProjeto" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                       SelectCommand="SELECT [id_TpProjeto], [NomeTpProjeto] FROM [aipTpProjeto]">
                   </asp:SqlDataSource>
                   <asp:SqlDataSource ID="SqlArea" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                       SelectCommand="SELECT Id_Area, Nome_Area FROM aipArea ORDER BY Id_Area">
                   </asp:SqlDataSource>
                   <asp:SqlDataSource ID="SGestorDTS" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                       SelectCommand="DTS_le_gestores" SelectCommandType="StoredProcedure">
                   </asp:SqlDataSource>
                   <asp:SqlDataSource ID="SqlExecutConta" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                       SelectCommand="SELECT 0 AS Matrícula, 'Não Aplicável' AS Nome UNION SELECT aipExecutContas.cdn_matricula AS Matrícula, RHFuncionario.nom_pessoa_fisic AS Nome FROM aipExecutContas INNER JOIN RHFuncionario ON aipExecutContas.cdn_matricula = RHFuncionario.cdn_funcionario WHERE (RHFuncionario.dat_desligto_func IS NULL)">
                   </asp:SqlDataSource>
                   <asp:SqlDataSource ID="SqlExecutContaDTS" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                       SelectCommand="DTS_le_executivos" SelectCommandType="StoredProcedure">
                   </asp:SqlDataSource>
                   <br />
                   <asp:Label ID="lblTitulo2" runat="server" EnableTheming="False" 
                       Font-Size="Large" ForeColor="Black" Text="2 - Caracterização do Projeto"></asp:Label>
                   <br />
                   <br />
                   <asp:Label ID="lblEntendDemanda" runat="server" Text="Entendimento da Demanda:"></asp:Label>
                   <asp:TextBox ID="txtDemanda" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="80px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RqCodigo2" runat="server" 
                       ControlToValidate="txtDemanda" ErrorMessage="Campo obrigatório" Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <asp:Label ID="lblObjetivos" runat="server" Text="Objetivos do Projeto:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtObjetivo" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="80px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RqCodigo6" runat="server" 
                       ControlToValidate="txtObjetivo" ErrorMessage="Campo obrigatório" 
                       style="height: 14px" Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <asp:Label ID="lblTpServico" runat="server" Text="Tipo de Atendimento:" 
                       Width="150px" Visible="False"></asp:Label>
                   <asp:DropDownList ID="cbId_Tiposervico" runat="server" 
                       Width="605px" Visible="False">
                       <asp:ListItem Value="00">NÃO APLICÁVEL</asp:ListItem>
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SdsTpServico" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                       SelectCommand="DTS_le_tp_servico" SelectCommandType="StoredProcedure">
                   </asp:SqlDataSource>
                   <br />
                   <asp:Label ID="lblCompetencia0" runat="server" Text="Competências:" 
                       Width="150px"></asp:Label>
                   <asp:GridView ID="GridCompetencia0" runat="server" AutoGenerateColumns="False" 
                       DataKeyNames="id_projeto_competencia,Percentual" DataSourceID="SqlCompetencia" 
                       EmptyDataText="Não existem competências amarradas a este projeto" Width="584px">
                       <Columns>
                           <asp:BoundField DataField="cod_compet" HeaderText="Código" ReadOnly="True" 
                               SortExpression="cod_compet" ><HeaderStyle HorizontalAlign="Left" /></asp:BoundField>
                           <asp:BoundField DataField="nome" HeaderText="Competência" ReadOnly="True" 
                               SortExpression="nome"><HeaderStyle Width="300px" HorizontalAlign="Left" /><ItemStyle Width="300px" /></asp:BoundField>
                           <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual"><EditItemTemplate><asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox></EditItemTemplate><FooterTemplate><asp:Label ID="lblTotalCompet" runat="server" Font-Bold="True" 
                                       ForeColor="White" Text="Label" EnableTheming="False"></asp:Label></FooterTemplate><ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Bind("Percentual", "{0:n}") %>'></asp:Label></ItemTemplate><ControlStyle Width="50px" /><FooterStyle Width="50px" /><HeaderStyle Width="50px" HorizontalAlign="Left" /><ItemStyle Width="50px" /></asp:TemplateField>
                       </Columns>
                       <HeaderStyle HorizontalAlign="Left" />
                   </asp:GridView>
                   <br />
                   <asp:Label ID="lblTitulo3" runat="server" EnableTheming="False" 
                       Font-Size="Large" ForeColor="Black" Text="3 - Cliente"></asp:Label>
                   <br />
                   <br />
                   <asp:Label ID="lblCliente" runat="server" Text="Cliente Corporativo:" 
                       Width="150px"></asp:Label>
                   <asp:DropDownList ID="cboId_TipoCliente" runat="server" 
                       DataSourceID="SqlTpCliente" DataTextField="NomeTpCliente" 
                       DataValueField="id_TpCliente" Width="605px">
                   </asp:DropDownList>
                   <br />
                   <asp:Label ID="lblTipoCliente0" runat="server" Text="Tipo de Cliente:" 
                       Width="150px"></asp:Label>
                   <asp:DropDownList ID="cboId_Cliente" runat="server" DataSourceID="SqlCliente" 
                       DataTextField="Cliente" DataValueField="cdn_cliente" Width="650px">
                   </asp:DropDownList>
                   <br />
                   <asp:Label ID="lblOutrosClientes" runat="server" Text="Cliente Interno:" 
                       Width="150px"></asp:Label>
                   <asp:DropDownList ID="cboId_OutrosClientes" runat="server" 
                       DataSourceID="SqlOutrosClientes" DataTextField="Cliente" 
                       DataValueField="id_outros_clientes" Width="605px">
                   </asp:DropDownList>
                   <br />
                   <asp:Label ID="lblClientes" runat="server" Text="Outros Clientes:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtCliente" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="30px"></asp:TextBox>
                   <br />
                   <br />
                   <br />
                   <asp:SqlDataSource ID="SqlTpCliente" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                       DeleteCommand="DELETE FROM [aipTpCliente] WHERE [id_TpCliente] = @id_TpCliente" 
                       InsertCommand="INSERT INTO [aipTpCliente] ([NomeTpCliente]) VALUES (@NomeTpCliente)" 
                       SelectCommand="SELECT [id_TpCliente], [NomeTpCliente] FROM [aipTpCliente]" 
                       UpdateCommand="UPDATE [aipTpCliente] SET [NomeTpCliente] = @NomeTpCliente WHERE [id_TpCliente] = @id_TpCliente">
                       <DeleteParameters>
                           <asp:Parameter Name="id_TpCliente" Type="Int32" />
                       </DeleteParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="NomeTpCliente" Type="String" />
                           <asp:Parameter Name="id_TpCliente" Type="Int32" />
                       </UpdateParameters>
                       <InsertParameters>
                           <asp:Parameter Name="NomeTpCliente" Type="String" />
                       </InsertParameters>
                   </asp:SqlDataSource>
                   <asp:SqlDataSource ID="SqlCliente" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                       DeleteCommand="DELETE FROM [aipTpCliente] WHERE [id_TpCliente] = @id_TpCliente" 
                       InsertCommand="INSERT INTO [aipTpCliente] ([NomeTpCliente]) VALUES (@NomeTpCliente)" 
                       SelectCommand="DTS_le_clientes" SelectCommandType="StoredProcedure" 
                       UpdateCommand="UPDATE [aipTpCliente] SET [NomeTpCliente] = @NomeTpCliente WHERE [id_TpCliente] = @id_TpCliente">
                       <DeleteParameters>
                           <asp:Parameter Name="id_TpCliente" Type="Int32" />
                       </DeleteParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="NomeTpCliente" Type="String" />
                           <asp:Parameter Name="id_TpCliente" Type="Int32" />
                       </UpdateParameters>
                       <InsertParameters>
                           <asp:Parameter Name="NomeTpCliente" Type="String" />
                       </InsertParameters>
                   </asp:SqlDataSource>
                   <asp:SqlDataSource ID="SqlOutrosClientes" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                       SelectCommand="SELECT [id_outros_clientes], [Cliente] FROM [aipOutrosClientes]">
                   </asp:SqlDataSource>
                   <br />
                   <asp:Label ID="lblTitulo4" runat="server" EnableTheming="False" 
                       Font-Size="Large" ForeColor="Black" Text="4 -Público Alvo"></asp:Label>
                   <br />
                   <br />
                   <asp:Label ID="lblPublicoAlvo" runat="server" Text="Público Alvo:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtPublicoAlvo" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="30px"></asp:TextBox>
                   &nbsp;&nbsp;<br />
                   <br />
                   <asp:Label ID="lblMunicipio0" runat="server" Text="Municípios:" Width="150px"></asp:Label>
                   <asp:GridView ID="GridCidade0" runat="server" AutoGenerateColumns="False" 
                       DataKeyNames="id_Projeto_Cidade,Percentual" DataSourceID="SqlGridMunicipio" 
                       EmptyDataText="Não existem Cidades amarradas a este projeto" Width="446px">
                       <Columns>
                           <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" 
                               SortExpression="Estado"><HeaderStyle Width="30px" HorizontalAlign="Left" /><ItemStyle Width="30px" /></asp:BoundField>
                           <asp:BoundField DataField="Nome" HeaderText="Município" ReadOnly="True" 
                               SortExpression="Nome" ><HeaderStyle HorizontalAlign="Left" /></asp:BoundField>
                           <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual"><EditItemTemplate><asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox></EditItemTemplate><FooterTemplate><asp:Label ID="lblTotalPercCidade" runat="server" Font-Bold="True" 
                                       ForeColor="White" Text="Label" EnableTheming="False"></asp:Label></FooterTemplate><ItemTemplate><asp:Label ID="lblTotalPercentCidade0" runat="server" 
                                       Text='<%# Bind("Percentual", "{0:n}") %>'></asp:Label></ItemTemplate><ControlStyle Width="50px" /><HeaderStyle Width="50px" HorizontalAlign="Left" /><ItemStyle Width="50px" /></asp:TemplateField>
                       </Columns>
                   </asp:GridView>
                   <br />
                   <asp:Label ID="lblBairro" runat="server" Text="Bairros:" Width="150px"></asp:Label>
                   <asp:TextBox ID="txtBairro" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="30px"></asp:TextBox>
                   <br />
                   <br />
                   <br />
                   <asp:Label ID="lblTitulo5" runat="server" Font-Size="Large" ForeColor="Black" 
                       Text="5 -Escopo" EnableTheming="False"></asp:Label>
                   <br />
                   &nbsp;&nbsp;<br />
                   <asp:Label ID="lblEscopo" runat="server" Text="Escopo Preliminar:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtEscopo" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="80px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RqCodigo17" runat="server" 
                       ControlToValidate="txtEscopo" ErrorMessage="Campo obrigatório" 
                       style="height: 14px" Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <asp:Label ID="lblProdutosServicos" runat="server" Text="Produtos e Serviços:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtProdutos_Servicos" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="80px"></asp:TextBox>
                   <br />
                   <br />
                   <asp:Label ID="lblTitulo6" runat="server" Font-Size="Large" ForeColor="Black" 
                       Text="6 - Premissas" EnableTheming="False"></asp:Label>
                   <br />
                   <br />
                   <asp:Label ID="lblPremissas" runat="server" Text="Premissas:" Width="150px"></asp:Label>
                   <asp:TextBox ID="txtPremissas" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana"  
                       Font-Size="Smaller" Height="80px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RqCodigo13" runat="server" 
                       ControlToValidate="txtPremissas" ErrorMessage="Campo obrigatório" 
                       style="height: 14px" Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <br />
                   <asp:Label ID="lblTitulo7" runat="server" Font-Size="Large" ForeColor="Black" 
                       Text="7 - Restrições" EnableTheming="False"></asp:Label>
                   <br />
                   <br />
                   <asp:Label ID="lblRestricoes" runat="server" Text="Restrições:" Width="150px"></asp:Label>
                   <asp:TextBox ID="txtRestricoes" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="30px"></asp:TextBox>
                   <br />
                   <br />
                   <asp:Label ID="lblTitulo8" runat="server" Font-Size="Large" ForeColor="Black" 
                       Text="8 - Dados Históricos" EnableTheming="False"></asp:Label>
                   <br />
                   <br />
                   <asp:Label ID="lblDadosHistoricos" runat="server" 
                       Text="Dados Históricos Disponíveis:" Width="150px"></asp:Label>
                   <asp:TextBox ID="txtDadosHistoricos" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Names="Verdana" 
                       Font-Size="Smaller" Height="30px"></asp:TextBox>
                   <br />
                   <br />
                   <asp:Label ID="lblTitulo9" runat="server" Font-Size="Large" ForeColor="Black" 
                       Text="9 - Resultados Esperados" EnableTheming="False"></asp:Label>
                   <br />
                   <br />
                   <asp:Label ID="lblResultado" runat="server" Text="Resultados Esperado:" 
                       Width="150px"></asp:Label>
                   <asp:TextBox ID="txtResultado" runat="server" EnableTheming="False" 
                       TextMode="MultiLine" Width="600px" Font-Size="Smaller" 
                       Font-Names="Verdana" Height="80px"></asp:TextBox>
                   <br />
                   <br />
                   <asp:Label ID="lblTitulo10" runat="server" Font-Size="Large" 
                       ForeColor="Black" Text="10 - Datas Previstas" EnableTheming="False"></asp:Label>
                   <br />
                   <br />
                   <asp:Label ID="lblDatainicio" runat="server" Text="Data início:" Width="150px"></asp:Label>
                   <asp:TextBox ID="datDataInicio" runat="server" Width="100px"></asp:TextBox>
                   <ajaxToolkit:CalendarExtender ID="DatDataInicio_CalendarExtender" 
                       runat="server" TargetControlID="DatDataInicio"></ajaxToolkit:CalendarExtender>
                   <asp:CompareValidator ID="valDataInicio" runat="server" 
                       ControlToValidate="datDataInicio" ErrorMessage="Data inválida" 
                       Operator="GreaterThan" Type="Date" ValueToCompare="01/01/2008"></asp:CompareValidator>
                   <asp:RequiredFieldValidator ID="RqCodigo4" runat="server" 
                       ControlToValidate="datDataInicio" ErrorMessage="Campo obrigatório" 
                       Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <asp:Label ID="lblDatafim" runat="server" Text="Data fim:" Width="150px"></asp:Label>
                   <asp:TextBox ID="datDataFim" runat="server" Width="100px"></asp:TextBox>
                   <ajaxToolkit:CalendarExtender ID="DataFim_CalendarExtender" runat="server" 
                       TargetControlID="DatDataFim"></ajaxToolkit:CalendarExtender>
                   <asp:CompareValidator ID="valDataFim" runat="server" 
                       ControlToCompare="datDataInicio" ControlToValidate="datDataFim" 
                       ErrorMessage="Data inválida" Operator="GreaterThan" Type="Date" 
                       ValueToCompare="01/01/2008"></asp:CompareValidator>
                   <asp:RequiredFieldValidator ID="RqCodigo5" runat="server" 
                       ControlToValidate="datDataFim" ErrorMessage="Campo obrigatório" Width="120px"></asp:RequiredFieldValidator>
                   <br />
                   <br />
                   <asp:ScriptManager ID="ScriptManager1" runat="server" 
                       EnableScriptGlobalization="True"></asp:ScriptManager>
                   <br />
                   <table class="TabelaControles">
                       <tr>
                           <td>
                               <asp:ImageButton ID="botaoIncluirProjeto" runat="server" Height="25px" 
                                   ImageUrl="~/Icones/001_03.gif" ToolTip="Incluir novo projeto" Width="25px" />
                           </td>
                           <td>
                               <asp:ImageButton ID="botaoAlterarProjeto" runat="server" Height="25px" 
                                   ImageUrl="~/Icones/editar.jpg" ToolTip="Alterar Projeto" Width="25px" />
                           </td>
                           <td>
                               <asp:ImageButton ID="botaoVoltar" runat="server" CausesValidation="False" 
                                   Height="25px" ImageUrl="~/Icones/voltar.jpg" 
                                   ToolTip="Voltar para página principal" Width="25px" />
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
                   </table>
                   <br />
                   <asp:Label ID="lblmensagemProjeto" runat="server" EnableTheming="False" 
                       ForeColor="#CC3300"></asp:Label>
                   <asp:SqlDataSource ID="SqlProjeto" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                       DeleteCommand="DELETE FROM [aipProjeto] WHERE [id_projeto] = @id_projeto" 
                       InsertCommand="INSERT INTO aipProjeto(Tituloprojeto, VersaoProjeto, Patrocinador, Id_Gestor, Lider, Demanda, Objetivo, Premissas, DadosHistoricos, Id_ExecConta, Id_TipoCliente, Cliente, Resultado, DataInicio, DataFim, Resultados, UnidLotac, CentroCusto, Id_TipoProjeto, PublicoAlvo, Id_UnidadeExecutora, Equipe, OutrasAreas, Bairro, Restricoes, Produtos_Servicos, Escopo, Codigoprojeto, Id_TipoServico, Id_cliente, Id_OutrosClientes, Usuario_Criacao, Data_Criacao, NContr) VALUES (@Tituloprojeto, @VersaoProjeto, @txtPatrocinador, @txtGestor, @txtLider, @Demanda, @Objetivo, @Premissas, @DadosHistoricos, @Id_ExecConta, @Id_TipoCliente, @Cliente, @Resultado, @DataInicio, @DataFim, @Resultados, @UnidLotac, @CentroCusto, @Id_TipoProjeto, @PublicoAlvo, @Id_UnidadeExecutora, @Equipe, @OutrasAreas, @Bairro, @Restricoes, @Produtos_Servicos, @Escopo, @Codigoprojeto, @Id_Tiposervico, @Id_cliente, @Id_OutrosClientes, @Usuario_Criacao, GETDATE(), @NContr collate Latin1_General_CI_AI)" 
                       ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
                       SelectCommand="SELECT id_Projeto, Tituloprojeto, VersaoProjeto, Patrocinador, Id_Gestor, Lider, Demanda, Objetivo, Resultados, Premissas, Escopo, DadosHistoricos, Id_ExecConta, Id_TipoCliente, Cliente, Resultado, DataInicio, DataFim, UnidLotac, status, CentroCusto, Id_TipoProjeto, PublicoAlvo, Id_UnidadeExecutora, Equipe, Bairro, Produtos_Servicos, OutrasAreas, Restricoes, Codigoprojeto, Id_TipoServico, Id_cliente, Id_OutrosClientes, NContr, Data_Criacao, Usuario_Criacao FROM aipProjeto WHERE (id_Projeto = @id_projeto)" 
                       UpdateCommand="UPDATE aipProjeto SET Tituloprojeto = @Tituloprojeto, VersaoProjeto = @VersaoProjeto, Patrocinador = @txtPatrocinador, Id_Gestor = @txtGestor, Lider = @txtLider, Demanda = @Demanda, Objetivo = @Objetivo, Resultados = @Resultados, Premissas = @Premissas, DadosHistoricos = @DadosHistoricos, Id_ExecConta = @Id_ExecConta, Id_TipoCliente = @Id_TipoCliente, Cliente = @Cliente, Resultado = @Resultado, DataInicio = @DataInicio, DataFim = @DataFim, CentroCusto = @CentroCusto, Id_TipoProjeto = @Id_TipoProjeto, PublicoAlvo = @PublicoAlvo, Id_UnidadeExecutora = @Id_UnidadeExecutora, Equipe = @Equipe, OutrasAreas = @OutrasAreas, Bairro = @Bairro, Restricoes = @Restricoes, Produtos_Servicos = @Produtos_Servicos, Escopo = @Escopo, Id_TipoServico = @Id_Tiposervico, Id_Cliente = @Id_cliente, Id_OutrosClientes = @Id_OutrosClientes, NContr = @NContr COLLATE Latin1_General_CI_AI WHERE (Codigoprojeto = @Cod_Projeto)">
                       <InsertParameters>
                           <asp:ControlParameter ControlID="txtTituloprojeto" Name="Tituloprojeto" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtVersaoProjeto" Name="VersaoProjeto" 
                               PropertyName="Text" Type="Int16" />
                           <asp:ControlParameter ControlID="txtpatrocinador" Name="txtPatrocinador" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="cboId_Gestor" Name="txtGestor" 
                               PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="txtLider" Name="txtLider" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtDemanda" Name="Demanda" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtObjetivo" Name="Objetivo" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtPremissas" Name="Premissas" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtDadosHistoricos" Name="DadosHistoricos" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="cboId_ExecConta" Name="Id_ExecConta" 
                               PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="cboId_TipoCliente" Name="Id_TipoCliente" 
                               PropertyName="SelectedValue" Type="String" />
                           <asp:ControlParameter ControlID="txtCliente" Name="Cliente" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtResultado" Name="Resultado" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="DatDataInicio" Name="DataInicio" 
                               PropertyName="Text" Type="DateTime" />
                           <asp:ControlParameter ControlID="DatDataFim" Name="DataFim" PropertyName="Text" 
                               Type="DateTime" />
                           <asp:ControlParameter ControlID="txtResultado" Name="Resultados" 
                               PropertyName="Text" />
                           <asp:SessionParameter Name="UnidLotac" SessionField="CentroCusto" />
                           <asp:ControlParameter ControlID="txtCentroCusto" Name="CentroCusto" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="cboId_TipoProjeto" Name="Id_TipoProjeto" 
                               PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="txtPublicoAlvo" Name="PublicoAlvo" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="cboId_UnidadeExecutora" 
                               Name="Id_UnidadeExecutora" PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="txtEquipe" Name="Equipe" PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtOutrasAreas" Name="OutrasAreas" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtBairro" Name="Bairro" PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtRestricoes" Name="Restricoes" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtProdutos_Servicos" Name="Produtos_Servicos" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtEscopo" Name="Escopo" PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtCodigoprojeto" Name="Codigoprojeto" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="cbId_TipoServico" Name="Id_Tiposervico" 
                               PropertyName="SelectedValue" Type="String" />
                           <asp:ControlParameter ControlID="cboId_Cliente" Name="Id_cliente" 
                               PropertyName="SelectedValue" Type="String" />
                           <asp:ControlParameter ControlID="cboId_OutrosClientes" Name="Id_OutrosClientes" 
                               PropertyName="SelectedValue" />
                           <asp:SessionParameter Name="Usuario_Criacao" SessionField="c_nome" />
                           <asp:ControlParameter ControlID="txtNContr" Name="NContr" PropertyName="Text" />
                       </InsertParameters>
                       <SelectParameters>
                           <asp:SessionParameter Name="id_projeto" SessionField="id_projeto" />
                       </SelectParameters>
                       <DeleteParameters>
                           <asp:Parameter Name="id_projeto" Type="Int32" />
                       </DeleteParameters>
                       <UpdateParameters>
                           <asp:ControlParameter ControlID="txtTituloprojeto" Name="Tituloprojeto" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtVersaoProjeto" Name="VersaoProjeto" 
                               PropertyName="Text" Type="Int16" />
                           <asp:ControlParameter ControlID="txtpatrocinador" Name="txtPatrocinador" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="cboId_Gestor" Name="txtGestor" 
                               PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="txtLider" Name="txtLider" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtDemanda" Name="Demanda" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtObjetivo" Name="Objetivo" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtResultado" Name="Resultados" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtPremissas" Name="Premissas" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtDadosHistoricos" Name="DadosHistoricos" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="cboId_ExecConta" Name="Id_ExecConta" 
                               PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="cboId_TipoCliente" Name="Id_TipoCliente" 
                               PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="txtCliente" Name="Cliente" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtResultado" Name="Resultado" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="DatDataInicio" Name="DataInicio" 
                               PropertyName="Text" Type="DateTime" />
                           <asp:ControlParameter ControlID="DatDataFim" Name="DataFim" PropertyName="Text" 
                               Type="DateTime" />
                           <asp:ControlParameter ControlID="txtCentroCusto" Name="CentroCusto" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="cboId_TipoProjeto" Name="Id_TipoProjeto" 
                               PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="txtPublicoAlvo" Name="PublicoAlvo" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="cboId_UnidadeExecutora" 
                               Name="Id_UnidadeExecutora" PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="txtEquipe" Name="Equipe" PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtOutrasAreas" Name="OutrasAreas" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtBairro" Name="Bairro" PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtRestricoes" Name="Restricoes" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtProdutos_Servicos" Name="Produtos_Servicos" 
                               PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtEscopo" Name="Escopo" PropertyName="Text" />
                           <asp:ControlParameter ControlID="cbId_TipoServico" Name="Id_Tiposervico" 
                               PropertyName="SelectedValue" Type="String" />
                           <asp:ControlParameter ControlID="cboId_Cliente" Name="Id_cliente" 
                               PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="cboId_OutrosClientes" Name="Id_OutrosClientes" 
                               PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="txtNContr" Name="NContr" PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtCodigoprojeto" Name="Cod_Projeto" 
                               PropertyName="Text" />
                       </UpdateParameters>
                   </asp:SqlDataSource>
                   </asp:View>
               <asp:View ID="View3" runat="server">
                   <asp:Panel ID="Panel15" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de projeto - Estabelecimentos" 
                       ToolTip="Inclui Estabelecimento">
                       <asp:Label ID="lblEstabelec" runat="server" Text="Estabelecimentos:" 
                           Width="150px"></asp:Label>
                       <asp:DropDownList ID="ddlId_Estabelec" runat="server" 
                           DataSourceID="SdsEstabelecDTS" DataTextField="Estabelec" 
                           DataValueField="cod_estab" Width="305px">
                       </asp:DropDownList>
                       <br />
                       <asp:Label ID="Percent_Estab" runat="server" Text="Percentual:  " Width="150px"></asp:Label>
                       <asp:TextBox ID="PercentEstab" runat="server" 
                           ToolTip="Entre com o percentual para o estabelecimento" Width="100px">0,00</asp:TextBox>
                       <asp:ImageButton ID="botaoIncluirEstab" runat="server" CssClass="botao" 
                           Height="18px" ImageUrl="~/Icones/001_03.gif" 
                           ToolTip="Incluir Estabelecimento" ValidationGroup="Incluiestab" 
                           Width="18px" />
                       <br />
                       <br />
                       <asp:GridView ID="GridEstabelec" runat="server" AutoGenerateColumns="False" 
                           DataKeyNames="id_Projeto_Estabelec,Percentual" DataSourceID="SdsEstabelec" 
                           EmptyDataText="Não existem estabelecimentos amarrados a este projeto" 
                           Width="584px">
                           <Columns>
                               <asp:BoundField DataField="id_Projeto_Estabelec" 
                                   HeaderText="id_Projeto_Estabelec" InsertVisible="False" 
                                   SortExpression="id_Projeto_Estabelec" Visible="False" />
                               <asp:BoundField DataField="cod_estab" HeaderText="Código" ReadOnly="True" 
                                   SortExpression="cod_estab" ><HeaderStyle HorizontalAlign="Left" /></asp:BoundField>
                               <asp:BoundField DataField="nom_abrev" HeaderText="Nome Abreviado" 
                                   SortExpression="nom_abrev" ><HeaderStyle HorizontalAlign="Left" /></asp:BoundField>
                               <asp:BoundField DataField="nom_pessoa" HeaderText="Nome Estabelecimento" 
                                   SortExpression="nom_pessoa" ><HeaderStyle HorizontalAlign="Left" /></asp:BoundField>
                               <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual"><EditItemTemplate><asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox></EditItemTemplate><FooterTemplate><asp:Label ID="LblTotalEstabelec" runat="server" Font-Bold="True" 
                                           ForeColor="White" Text="Label" EnableTheming="False"></asp:Label></FooterTemplate><ItemTemplate><asp:Label ID="Label4" runat="server" Text='<%# Bind("Percentual", "{0:n}") %>'></asp:Label></ItemTemplate><ControlStyle Width="50px" /><FooterStyle Width="50px" /><HeaderStyle Width="50px" HorizontalAlign="Left" /><ItemStyle Width="50px" /></asp:TemplateField>
                               <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                           CommandName="Delete" ImageUrl="~/Icones/excluir.png" 
                                           onclick="ImageButton1_Click2" Text="Excluir" />
                                   </ItemTemplate>
                               </asp:TemplateField>
                           </Columns>
                           <HeaderStyle HorizontalAlign="Left" />
                       </asp:GridView>
                       <br />
                       <asp:Label ID="lblEstabelecErro" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300" Height="16px" Text=" " Width="600px"></asp:Label>
                       <asp:SqlDataSource ID="SdsEstabelec" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                           DeleteCommand="DELETE FROM aipEstabelec WHERE (id_Projeto_Estabelec = @id_projeto_estabelec)" 
                           InsertCommand="INSERT INTO aipEstabelec(id_Projeto, id_Estabelec, Percentual) VALUES (@id_projeto, @id_estabelec,@Percentual)" 
                           ProviderName="<%$ ConnectionStrings:SenacConnection.ProviderName %>" 
                           SelectCommand="SELECT aipEstabelec.id_Projeto_Estabelec, aipEstabelec.id_Projeto, aipEstabelec.id_Estabelec, View_Estabelecimento.nom_abrev, View_Estabelecimento.nom_pessoa, View_Estabelecimento.cod_id_feder, View_Estabelecimento.cod_estab, aipEstabelec.Percentual FROM aipEstabelec INNER JOIN View_Estabelecimento ON aipEstabelec.id_Estabelec = View_Estabelecimento.cod_estab COLLATE Latin1_General_CI_AI where Id_Projeto = @Id_Projeto" 
                           UpdateCommand="UPDATE aipEstabelec SET Percentual = @Percentual WHERE (id_Projeto_Estabelec = @id_Projeto_Estabelec)">
                           <SelectParameters>
                               <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:Parameter Name="id_projeto_estabelec" />
                           </DeleteParameters>
                           <UpdateParameters>
                               <asp:Parameter DBType="Object" Name="Percentual" Type="Decimal" />
                               <asp:Parameter Name="id_Projeto_Estabelec" />
                           </UpdateParameters>
                           <InsertParameters>
                               <asp:SessionParameter Name="id_projeto" SessionField="Id_Projeto" />
                               <asp:ControlParameter ControlID="ddlId_Estabelec" Name="id_estabelec" 
                                   PropertyName="SelectedValue" Type="String" />
                               <asp:ControlParameter ControlID="PercentEstab" Name="Percentual" 
                                   PropertyName="Text" Type="Decimal" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                       <asp:SqlDataSource ID="SdsEstabelecDTS" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                           ProviderName="<%$ ConnectionStrings:SenacConnection.ProviderName %>" 
                           SelectCommand="DTS_le_estabelec" SelectCommandType="StoredProcedure">
                       </asp:SqlDataSource>
                   </asp:Panel>
                   <asp:Panel ID="Panel16" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de projeto - Competências" 
                       ToolTip="Inclui Competência" Height="444px">
                       <br />
                       <asp:Label ID="lblCompetencia" runat="server" Text="Competência:" Width="150px"></asp:Label>
                       <asp:DropDownList ID="ddlId_competencia" runat="server" 
                           DataSourceID="SqlCompetenciaDTS" DataTextField="nome" 
                           DataValueField="cod_compet" Width="305px">
                       </asp:DropDownList>
                       &nbsp;&nbsp;&nbsp;
                       <br />
                       <asp:Label ID="Percent_Compet" runat="server" Text="Percentual:  " 
                           Width="150px"></asp:Label>
                       <asp:TextBox ID="PercentCompet" runat="server" 
                           ToolTip="Entre com o percentual para a competência" Width="100px">0,00</asp:TextBox>
                       &nbsp;<asp:ImageButton ID="botaoIncluirCompetencia" runat="server" CssClass="botao" 
                           Height="18px" ImageUrl="~/Icones/001_03.gif" ToolTip="Incluir Competências" 
                           ValidationGroup="IncluiCompet" Width="18px" />
                       &nbsp;<br />
                       <br />
                       <asp:GridView ID="GridCompetencia" runat="server" AutoGenerateColumns="False" 
                           DataKeyNames="id_projeto_competencia,Percentual" DataSourceID="SqlCompetencia" 
                           EmptyDataText="Não existem competências amarradas a este projeto" 
                           Width="321px">
                           <Columns>
                               <asp:BoundField DataField="id_projeto_competencia" 
                                   HeaderText="id_projeto_competencia" InsertVisible="False" 
                                   SortExpression="id_projeto_competencia" Visible="False" />
                               <asp:BoundField DataField="cod_compet" HeaderText="Código" ReadOnly="True" 
                                   SortExpression="cod_compet"><HeaderStyle HorizontalAlign="Left" /></asp:BoundField>
                               <asp:BoundField DataField="nome" HeaderText="Competência" ReadOnly="True" 
                                   SortExpression="nome"><HeaderStyle HorizontalAlign="Left" Width="300px" /><ItemStyle Width="300px" /></asp:BoundField>
                               <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual"><EditItemTemplate>Competência</EditItemTemplate><FooterTemplate><asp:Label ID="lblTotalCompet" runat="server" EnableTheming="False" 
                                           Font-Bold="True" ForeColor="White" Text="TotalCompetencia"></asp:Label></FooterTemplate><HeaderTemplate>Percentual</HeaderTemplate><ItemTemplate><asp:Label ID="LblValorCompet" runat="server" 
                                           Text='<%# Bind("Percentual", "{0:n}") %>'></asp:Label></ItemTemplate><ControlStyle Width="50px" /><FooterStyle Width="50px" /><HeaderStyle HorizontalAlign="Left" Width="50px" /><ItemStyle Width="50px" /></asp:TemplateField>
                               <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                           CommandName="Delete" ImageUrl="~/Icones/excluir.png" 
                                           onclick="ImageButton1_Click3" Text="Excluir" />
                                   </ItemTemplate>
                               </asp:TemplateField>
                           </Columns>
                           <HeaderStyle HorizontalAlign="Left" />
                       </asp:GridView>
                       &nbsp;<asp:Label ID="lblCompetenciaErro" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300" Height="16px" Text=" " Width="600px"></asp:Label>
                       <asp:SqlDataSource ID="SqlCompetenciaDTS" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                           SelectCommand="DTS_le_competencia" SelectCommandType="StoredProcedure">
                       </asp:SqlDataSource>
                       <asp:SqlDataSource ID="SqlCompetencia" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                           DeleteCommand="DELETE FROM aipCompetencia WHERE (id_projeto_competencia = @id_projeto_competencia)" 
                           InsertCommand="INSERT INTO aipCompetencia(id_competencia, id_projeto,percentual) VALUES (@id_competencia, @id_projeto,@percentual)" 
                           ProviderName="<%$ ConnectionStrings:SenacConnection.ProviderName %>" 
                           SelectCommand="SELECT aipCompetencia.id_projeto_competencia, aipCompetencia.id_projeto, View_Competencia.cod_compet, View_Competencia.nome, aipCompetencia.Percentual FROM aipCompetencia INNER JOIN View_Competencia ON aipCompetencia.id_competencia COLLATE Latin1_General_CI_AS = View_Competencia.cod_compet where Id_Projeto = @Id_Projeto" 
                           UpdateCommand="UPDATE aipCompetencia SET Percentual = @Percentual WHERE (id_projeto_competencia = @id_projeto_competencia)">
                           <SelectParameters>
                               <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" 
                                   DefaultValue="9" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:Parameter Name="id_projeto_competencia" />
                           </DeleteParameters>
                           <UpdateParameters>
                               <asp:Parameter DBType="Object" Name="Percentual" Type="Decimal" />
                               <asp:Parameter Name="id_projeto_competencia" />
                           </UpdateParameters>
                           <InsertParameters>
                               <asp:ControlParameter ControlID="ddlId_competencia" Name="id_competencia" 
                                   PropertyName="SelectedValue" Type="String" />
                               <asp:SessionParameter Name="id_projeto" SessionField="Id_Projeto" />
                               <asp:ControlParameter ControlID="PercentCompet" Name="percentual" 
                                   PropertyName="Text" Type="Decimal" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                       <asp:Label ID="lblCompetErro" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300" Height="16px" Text=" " Width="600px"></asp:Label>
                       <br />
                       <br />
                   </asp:Panel>
                   <asp:Panel ID="Panel18" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de Área de Conhecimento" Height="297px" 
                       ToolTip="Inclui Área de Conhecimento" Visible="False">
                       <asp:Label ID="lblAreaConhec1" runat="server" Text="Área de Conhecimento:" 
                           Width="150px"></asp:Label>
                       <asp:DropDownList ID="ddlId_AreaConhec" runat="server" 
                           DataSourceID="SqlAreaConhec" DataTextField="nome" 
                           DataValueField="cod_ar_conhec" Width="250px">
                       </asp:DropDownList>
                       &nbsp;<br />
                       <asp:Label ID="LblPercentAreaConhec" runat="server" Text="Percentual:  " 
                           Width="150px"></asp:Label>
                       <asp:TextBox ID="PercentAreaConhec" runat="server" 
                           ToolTip="Entre com o percentual para o Município" Width="100px">0,00</asp:TextBox>
                       &nbsp;<asp:ImageButton ID="botaoIncluirAreaConhec" runat="server" CssClass="botao" 
                           Height="18px" ImageUrl="~/Icones/001_03.gif" 
                           ToolTip="Incluir Área de Conhecimento" ValidationGroup="IncluiArea" 
                           Width="18px" />
                       <br />
                       <br />
                       <asp:GridView ID="GridAreaConhec" runat="server" AutoGenerateColumns="False" 
                           DataKeyNames="id_projeto_AreaConhec" DataSourceID="SqlGridAreaConhec" 
                           EmptyDataText="Não existem áreas de conhecimento amarradas a este projeto" 
                           Width="591px">
                           <Columns>
                               <asp:BoundField DataField="id_projeto" HeaderText="id_projeto" 
                                   SortExpression="id_projeto" Visible="False">
                               <HeaderStyle HorizontalAlign="Left" />
                               </asp:BoundField>
                               <asp:BoundField DataField="Codigo" HeaderText="Código" 
                                   SortExpression="Codigo" />
                               <asp:BoundField DataField="AreaConhec" HeaderText="Área de Conhecimento" 
                                   SortExpression="AreaConhec" />
                               <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual">
                                   <EditItemTemplate>
                                       <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox>
                                   </EditItemTemplate>
                                   <FooterTemplate>
                                       <asp:Label ID="LblTotalAreaConhecim" runat="server" EnableTheming="False" 
                                           Font-Bold="True" ForeColor="White" Text="Label"></asp:Label>
                                   </FooterTemplate>
                                   <ItemTemplate>
                                       <asp:Label ID="LblValorAreaConhec" runat="server" 
                                           Text='<%# Eval("Percentual") %>'></asp:Label>
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Left" />
                               </asp:TemplateField>
                               <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                                   EditImageUrl="~/Icones/editar.jpg" ShowDeleteButton="True" />
                           </Columns>
                           <HeaderStyle HorizontalAlign="Left" />
                       </asp:GridView>
                       <br />
                       <asp:Label ID="lblAreaConhec0" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300" Height="16px" Text=" " Width="600px"></asp:Label>
                       <br />
                       <asp:SqlDataSource ID="SqlAreaConhec" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                           InsertCommand="INSERT INTO aipAreaConhec(id_projeto, id_projeto_AreaConhec, Percentual) VALUES (@id_projeto, @id_projeto_AreaConhec, @Percentual)" 
                           ProviderName="<%$ ConnectionStrings:SENACRJConnectionString.ProviderName %>" 
                           SelectCommand="SELECT cod_ar_conhec, nome FROM View_AreaConhec_DTS">
                           <InsertParameters>
                               <asp:SessionParameter Name="id_projeto" SessionField="Id_Projeto" />
                               <asp:ControlParameter ControlID="ddlId_AreaConhec" Name="id_projeto_AreaConhec" 
                                   PropertyName="SelectedValue" />
                               <asp:ControlParameter ControlID="PercentAreaConhec" Name="Percentual" 
                                   PropertyName="Text" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                       <asp:SqlDataSource ID="SqlGridAreaConhec" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                           DeleteCommand="DELETE FROM aipAreaConhec WHERE (id_projeto_AreaConhec = @id_projeto_AreaConhec)" 
                           InsertCommand="INSERT INTO aipAreaConhec(id_projeto, id_AreaConhec, Percentual) VALUES (@id_Projeto, @AreaConhec, @Percentual)" 
                           ProviderName="<%$ ConnectionStrings:SENACRJConnectionString.ProviderName %>" 
                           SelectCommand="SELECT View_AreaConhec_DTS.cod_ar_conhec AS Codigo, View_AreaConhec_DTS.nome AS AreaConhec, aipAreaConhec.id_projeto, aipAreaConhec.Percentual, aipAreaConhec.id_AreaConhec, aipAreaConhec.id_projeto_AreaConhec FROM aipAreaConhec INNER JOIN View_AreaConhec_DTS ON aipAreaConhec.id_AreaConhec = View_AreaConhec_DTS.cod_ar_conhec COLLATE Latin1_General_CI_AI WHERE (aipAreaConhec.id_projeto = @Id_Projeto)" 
                           
                           
                           UpdateCommand="UPDATE aipEstabelec SET Percentual = @Percentual WHERE (id_Projeto_Estabelec = @id_Projeto_Estabelec)">
                           <SelectParameters>
                               <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:ControlParameter ControlID="GridAreaConhec" Name="id_projeto_AreaConhec" 
                                   PropertyName="SelectedValue" />
                           </DeleteParameters>
                           <UpdateParameters>
                               <asp:Parameter DBType="Object" Name="Percentual" Type="Decimal" />
                               <asp:Parameter Name="id_Projeto_Estabelec" />
                           </UpdateParameters>
                           <InsertParameters>
                               <asp:SessionParameter Name="id_Projeto" SessionField="Id_Projeto" />
                               <asp:ControlParameter ControlID="ddlId_AreaConhec" Name="AreaConhec" 
                                   PropertyName="SelectedValue" />
                               <asp:ControlParameter ControlID="PercentAreaConhec" Name="Percentual" 
                                   PropertyName="Text" Type="Decimal" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                   </asp:Panel>
                   <asp:Panel ID="Panel17" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de Municípios" Height="425px" ToolTip="Inclui Município">
                       <asp:Label ID="lblMunicipio" runat="server" Text="UF/Município:" Width="150px"></asp:Label>
                       <asp:DropDownList ID="ddlId_Estado" runat="server" AutoPostBack="True" 
                           DataSourceID="SqlEstado" DataTextField="Estado" DataValueField="Estado" 
                           Width="52px">
                       </asp:DropDownList>
                       <asp:DropDownList ID="ddlId_Municipio" runat="server" 
                           DataSourceID="SqlMunicipio" DataTextField="Nome" DataValueField="ID_Municipio" 
                           Width="250px">
                       </asp:DropDownList>
                       &nbsp;&nbsp;&nbsp;
                       <br />
                       <asp:Label ID="Percent_Cidade" runat="server" Text="Percentual:  " 
                           Width="150px"></asp:Label>
                       <asp:TextBox ID="PercentCidade" runat="server" 
                           ToolTip="Entre com o percentual para o Município" Width="100px">0,00</asp:TextBox>
                       &nbsp;<asp:ImageButton ID="botaoIncluirCidade" runat="server" CssClass="botao" 
                           Height="18px" ImageUrl="~/Icones/001_03.gif" ToolTip="Incluir Município" 
                           ValidationGroup="IncluiMunicipio" Width="18px" />
                       <br />
                       <br />
                       <asp:GridView ID="GridCidade" runat="server" AutoGenerateColumns="False" 
                           DataKeyNames="id_Projeto_Cidade,Percentual" DataSourceID="SqlGridMunicipio" 
                           EmptyDataText="Não existem cidades amarradas a este projeto" Width="228px">
                           <Columns>
                               <asp:BoundField DataField="id_Projeto_Cidade" HeaderText="id_Projeto_Cidade" 
                                   SortExpression="id_Projeto_Cidade" Visible="False" />
                               <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" 
                                   SortExpression="Estado"><HeaderStyle Width="30px" /><ItemStyle Width="30px" /></asp:BoundField>
                               <asp:BoundField DataField="Nome" HeaderText="Nome" ReadOnly="True" 
                                   SortExpression="Nome" />
                               <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual"><EditItemTemplate><asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox></EditItemTemplate><FooterTemplate><asp:Label ID="lblTotalPercentMunic" runat="server" EnableTheming="False" 
                                           Font-Bold="True" ForeColor="White" Text="TotalPercentMunic"></asp:Label></FooterTemplate><ItemTemplate><asp:Label ID="LblValorMunic" runat="server" Text='<%# Eval("Percentual") %>'></asp:Label></ItemTemplate><ControlStyle Width="50px" /><HeaderStyle Width="50px" /><ItemStyle Width="50px" /></asp:TemplateField>
                               <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                           CommandName="Delete" ImageUrl="~/Icones/excluir.png" 
                                           onclick="ImageButton1_Click4" Text="Excluir" />
                                   </ItemTemplate>
                               </asp:TemplateField>
                           </Columns>
                           <HeaderStyle HorizontalAlign="Left" />
                       </asp:GridView>
                       <asp:Label ID="lblCidadeErro" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300" Height="16px" Text=" " Width="600px"></asp:Label>
                       <br />
                       <br />
                       <asp:SqlDataSource ID="SqlMunicipio" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                           ProviderName="<%$ ConnectionStrings:SENACRJConnectionString.ProviderName %>" 
                           SelectCommand="SELECT ID_Municipio, Nome, Estado FROM PlnMunicipio WHERE (Estado = @Estado) order by Estado,Nome">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="ddlId_Estado" Name="Estado" 
                                   PropertyName="SelectedValue" />
                           </SelectParameters>
                       </asp:SqlDataSource>
                       <asp:SqlDataSource ID="SqlEstado" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                           ProviderName="<%$ ConnectionStrings:SENACRJConnectionString.ProviderName %>" 
                           SelectCommand="SELECT Estado FROM plnEstado AS plnEstado">
                       </asp:SqlDataSource>
                       <asp:SqlDataSource ID="SqlGridMunicipio" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                           DeleteCommand="DELETE FROM aipCidade WHERE (id_Projeto_Cidade = @id_Projeto_Cidade)" 
                           InsertCommand="INSERT INTO aipCidade(id_Projeto, id_Cidade, UF,Percentual) VALUES (@id_Projeto, @id_Cidade, @UF,@Percentual)" 
                           ProviderName="<%$ ConnectionStrings:SENACRJConnectionString.ProviderName %>" 
                           SelectCommand="SELECT aipCidade.id_Projeto_Cidade, aipCidade.id_Projeto, aipCidade.id_Cidade, aipCidade.UF, PlnMunicipio.Nome, PlnMunicipio.Estado, aipCidade.Percentual FROM PlnMunicipio INNER JOIN plnEstado ON PlnMunicipio.Estado = plnEstado.Estado INNER JOIN aipCidade ON PlnMunicipio.ID_Municipio = aipCidade.id_Cidade AND PlnMunicipio.Estado = aipCidade.UF where Id_Projeto = @Id_Projeto" 
                           UpdateCommand="UPDATE aipEstabelec SET Percentual = @Percentual WHERE (id_Projeto_Estabelec = @id_Projeto_Estabelec)">
                           <SelectParameters>
                               <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:ControlParameter ControlID="GridCidade" Name="id_Projeto_Cidade" 
                                   PropertyName="SelectedValue" />
                           </DeleteParameters>
                           <UpdateParameters>
                               <asp:Parameter DBType="Object" Name="Percentual" Type="Decimal" />
                               <asp:Parameter Name="id_Projeto_Estabelec" />
                           </UpdateParameters>
                           <InsertParameters>
                               <asp:SessionParameter Name="id_Projeto" SessionField="Id_Projeto" />
                               <asp:ControlParameter ControlID="ddlId_Municipio" Name="id_Cidade" 
                                   PropertyName="SelectedValue" />
                               <asp:ControlParameter ControlID="ddlId_Estado" Name="UF" 
                                   PropertyName="SelectedValue" />
                               <asp:ControlParameter ControlID="PercentCidade" Name="Percentual" 
                                   PropertyName="Text" Type="Decimal" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                   </asp:Panel>
                </asp:View>               
               <asp:View ID="View4" runat="server">
                   <asp:Panel ID="Panel19" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de projeto - Resultado/Margem de Contribuição" 
                       Width="761px">
                       <br />
                       &nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="lblTitResultado" runat="server" EnableTheming="False" 
                           Font-Names="Verdana" Font-Size="Small" ForeColor="#006699" Text="Resultado:" 
                           Width="200px"></asp:Label>
                       <asp:Label ID="lblResult" runat="server" EnableTheming="False" 
                           Font-Names="Verdana" Font-Size="Small" ForeColor="#006699" Text="0,00" 
                           ToolTip="Resultado = Total das Receitas / Total das Despesas" 
                           Font-Bold="True"></asp:Label>
                       <br />
                       <br />
                       &nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="lblTitMargem" runat="server" EnableTheming="False" 
                           Font-Names="Verdana" Font-Size="Small" ForeColor="#006699" 
                           Text="Margem de Contribuição:" Width="200px"></asp:Label>
                       <asp:Label ID="lblMargem" runat="server" EnableTheming="False" 
                           Font-Names="Verdana" Font-Size="Small" ForeColor="#006699" Text="0%" 
                           ToolTip="Margem de Contribuição = Resultado / Receita" Width="150px" 
                           Font-Bold="True"></asp:Label>
                       <br />
                       <br />
                   </asp:Panel>
                   <asp:Panel ID="Panel11" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de projeto - Receitas" ToolTip="Inclui Receitas" 
                       Width="757px" Height="556px">
                       &nbsp;<asp:Label ID="lblDespesas0" runat="server" Text="Valor R$:" Width="200px"></asp:Label>
                       <br />
                       &nbsp;<asp:TextBox ID="txtValorReceita" runat="server" Width="128px"></asp:TextBox>
                       &nbsp;<asp:ImageButton ID="botaoIncluirReceita" runat="server" CssClass="botao" 
                           Height="20px" ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir Receitas" 
                           ValidationGroup="CadastroReceitas" Width="20px" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                           ControlToValidate="txtValorReceita" ErrorMessage="Campo obrigatório" 
                           ValidationGroup="CadastroReceitas"></asp:RequiredFieldValidator>
                       <br />
                       &nbsp;<asp:Label ID="lbldescReceita" runat="server" Text="Descrição:" Width="200px"></asp:Label>
                       <br />
                       &nbsp;<asp:TextBox ID="txtDescricaoReceita" runat="server" EnableTheming="False" 
                           Height="60px" TextMode="MultiLine" Width="700px"></asp:TextBox>
                       <br />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                           ControlToValidate="txtDescricaoReceita" ErrorMessage="Campo obrigatório" 
                           ValidationGroup="CadastroReceitas"></asp:RequiredFieldValidator>
                       <br />
                       <asp:Label ID="lblmensagemRetorno0" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300"></asp:Label>
                       <br />
                       <asp:GridView ID="GridViewReceita" runat="server" AllowPaging="True" 
                           AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_receitas" 
                           DataSourceID="SdsReceitas">
                           <Columns>
                               <asp:BoundField DataField="id_projeto_FK" HeaderText="id_projeto_FK" 
                                   SortExpression="id_projeto_FK" Visible="False" />
                               <asp:BoundField DataField="id_receitas" HeaderText="id_receitas" 
                                   InsertVisible="False" ReadOnly="True" SortExpression="id_receitas" 
                                   Visible="False" />
                               <asp:BoundField DataField="descricao" HeaderText="Descrição" 
                                   SortExpression="descricao"><ControlStyle Width="350px" /><HeaderStyle HorizontalAlign="Left" Width="350px" /><ItemStyle HorizontalAlign="Left" Width="350px" /></asp:BoundField>
                               <asp:TemplateField HeaderText="Valor da Receita" SortExpression="ValorReceita"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ValorReceita") %>'></asp:TextBox></EditItemTemplate><FooterTemplate><asp:Label ID="lblTotalReceita" runat="server" CssClass="style8" 
                                           EnableTheming="False" Font-Bold="True" ForeColor="White" Text="Label"></asp:Label></FooterTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" 
                                           Text='<%# Bind("ValorReceita", "{0:c}") %>'></asp:Label></ItemTemplate><ControlStyle Width="100px" /><FooterStyle HorizontalAlign="Right" /><HeaderStyle HorizontalAlign="Right" Width="100px" /><ItemStyle HorizontalAlign="Right" Width="100px" /></asp:TemplateField>
                               <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                           CommandName="Delete" ImageUrl="~/Icones/excluir.png" 
                                           onclick="ImageButton1_Click5" Text="Excluir Receita" />
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Right" />
                                   <ItemStyle HorizontalAlign="Right" />
                               </asp:TemplateField>
                           </Columns>
                       </asp:GridView>
                       <asp:SqlDataSource ID="SdsReceitas" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                           DeleteCommand="DELETE FROM [aipReceitas] WHERE [id_receitas] = @id_receitas" 
                           InsertCommand="INSERT INTO [aipReceitas] ([id_projeto_FK], [valorReceita], [descricao]) VALUES (@id_projeto_FK, @valorReceita, @descricao)" 
                           SelectCommand="SELECT id_projeto_FK, id_receitas, valorReceita, descricao FROM aipReceitas WHERE (id_projeto_FK = @id_Projeto)" 
                           UpdateCommand="UPDATE [aipReceitas] SET [id_projeto_FK] = @id_projeto_FK, [valorReceita] = @valorReceita, [descricao] = @descricao WHERE [id_receitas] = @id_receitas">
                           <SelectParameters>
                               <asp:SessionParameter Name="id_Projeto" SessionField="Id_Projeto" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:Parameter Name="id_receitas" Type="Int32" />
                           </DeleteParameters>
                           <UpdateParameters>
                               <asp:Parameter Name="id_projeto_FK" Type="String" />
                               <asp:Parameter Name="valorReceita" Type="Decimal" />
                               <asp:Parameter Name="descricao" Type="String" />
                               <asp:Parameter Name="id_receitas" Type="Int32" />
                           </UpdateParameters>
                           <InsertParameters>
                               <asp:SessionParameter Name="id_projeto_FK" SessionField="Id_Projeto" 
                                   Type="String" />
                               <asp:ControlParameter ControlID="txtValorReceita" Name="valorReceita" 
                                   PropertyName="Text" Type="Decimal" />
                               <asp:ControlParameter ControlID="txtDescricaoReceita" Name="descricao" 
                                   PropertyName="Text" Type="String" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                       &nbsp;&nbsp;&nbsp;&nbsp;
                       <br />
                   </asp:Panel>
                   <asp:Panel ID="Panel1" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de projeto - Despesas" Width="762px" 
                       ToolTip="Inclui Despesas" Height="556px">
                       &nbsp;&nbsp;<asp:Label ID="lblDespesas" runat="server" Text="Valor R$:"></asp:Label>
                       <br />
                       &nbsp;<asp:TextBox ID="txtValorDespesa" runat="server" Width="128px"></asp:TextBox>
                       &nbsp;<asp:ImageButton ID="botaoIncluirDespesas" runat="server" 
                           CssClass="botao" ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir Despesas" 
                           ValidationGroup="CadastroDespesas" Height="20px" Width="20px" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                           ControlToValidate="txtValorDespesa" ErrorMessage="Campo obrigatório" 
                           ValidationGroup="CadastroDespesas"></asp:RequiredFieldValidator>
                       <br />
                       &nbsp;<asp:Label ID="lbldescDespesa" runat="server" Text="Descrição:" Width="100px"></asp:Label>
                       <br />
                       &nbsp;<asp:TextBox ID="txtDescricaoDespesa" runat="server" TextMode="MultiLine" 
                           Width="700px" EnableTheming="False" Height="60px"></asp:TextBox>
                       <br />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                           ControlToValidate="txtDescricaoDespesa" ErrorMessage="Campo obrigatório" 
                           ValidationGroup="CadastroDespesas"></asp:RequiredFieldValidator>
                       <br />
                       <asp:Label ID="lblmensagemRetorno" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300"></asp:Label>
                       <br />
                       <asp:GridView ID="GridViewDespesas" runat="server" AllowPaging="True" 
                           AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_despesas" 
                           DataSourceID="SdsDespesas">
                           <Columns>
                               <asp:BoundField DataField="id_projeto_FK" HeaderText="id_projeto_FK" 
                                   SortExpression="id_projeto_FK" Visible="False" />
                               <asp:BoundField DataField="id_despesas" HeaderText="id_despesas" 
                                   InsertVisible="False" ReadOnly="True" SortExpression="id_despesas" 
                                   Visible="False" />
                               <asp:BoundField DataField="descricao" HeaderText="Descrição" 
                                   SortExpression="descricao"><ControlStyle Width="350px" /><HeaderStyle HorizontalAlign="Left" /><ItemStyle HorizontalAlign="Left" Width="350px" /></asp:BoundField>
                               <asp:TemplateField HeaderText="Valor da Despesa" SortExpression="valorDespesa"><EditItemTemplate><asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("valorDespesa") %>'></asp:TextBox></EditItemTemplate><FooterTemplate><asp:Label ID="LblTotalDespesa" runat="server" CssClass="style7" 
                                           EnableTheming="False" Font-Bold="True" ForeColor="White" Text="Label"></asp:Label></FooterTemplate><ItemTemplate><asp:Label ID="Label5" runat="server" 
                                           Text='<%# Bind("valorDespesa", "{0:c}") %>'></asp:Label></ItemTemplate><ControlStyle Width="100px" /><FooterStyle HorizontalAlign="Right" /><HeaderStyle HorizontalAlign="Right" /><ItemStyle HorizontalAlign="Right" Width="100px" /></asp:TemplateField>
                               <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                           CommandName="Delete" ImageUrl="~/Icones/excluir.png" 
                                           onclick="ImageButton1_Click6" Text="Excluir" />
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Right" />
                                   <ItemStyle HorizontalAlign="Right" />
                               </asp:TemplateField>
                           </Columns>
                       </asp:GridView>
                       <br />
                       <asp:SqlDataSource ID="SdsDespesas" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                           DeleteCommand="DELETE FROM [aipDespesas] WHERE [id_despesas] = @id_despesas" 
                           InsertCommand="INSERT INTO aipDespesas(id_projeto_FK, valorDespesa, descricao) VALUES (@id_projeto_FK, @valorDespesa, @descricao)" 
                           SelectCommand="SELECT id_projeto_FK, id_despesas, valorDespesa, descricao FROM aipDespesas WHERE (id_projeto_FK = @id_Projeto)" 
                           UpdateCommand="UPDATE [aipDespesas] SET [id_projeto_FK] = @id_projeto_FK, [valorDespesa] = @valorDespesa, [descricao] = @descricao WHERE [id_despesas] = @id_despesas">
                           <SelectParameters>
                               <asp:SessionParameter Name="id_Projeto" SessionField="Id_Projeto" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:Parameter Name="id_despesas" Type="Int32" />
                           </DeleteParameters>
                           <UpdateParameters>
                               <asp:Parameter Name="id_projeto_FK" Type="String" />
                               <asp:Parameter Name="valorDespesa" Type="Decimal" />
                               <asp:Parameter Name="descricao" Type="String" />
                               <asp:Parameter Name="id_despesas" Type="Int32" />
                           </UpdateParameters>
                           <InsertParameters>
                               <asp:SessionParameter Name="id_projeto_FK" SessionField="Id_Projeto" 
                                   Type="String" />
                               <asp:ControlParameter ControlID="txtValorDespesa" Name="valorDespesa" 
                                   PropertyName="Text" Type="Decimal" />
                               <asp:ControlParameter ControlID="txtDescricaoDespesa" Name="descricao" 
                                   PropertyName="Text" Type="String" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                </asp:Panel>
               </asp:View>
               <asp:View ID="View5" runat="server">
                   <asp:Panel ID="Panel12" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro de projeto - Calendários" Width="759px" 
                       ToolTip="Inclui Calendário">
                       <br />
                       &nbsp;&nbsp;Data Início:&nbsp;<asp:TextBox ID="datData_inicioCalendar" 
                           runat="server" Width="80px"></asp:TextBox>
                       <%--<ajaxToolkit:MaskedEditExtender ID="datData_inicioCalendar_MaskedEditExtender" 
                           runat="server" BehaviorID="Data_inicioCalendar_MaskedEditExtender" 
                           Mask="99/99/9999" MaskType="Date" TargetControlID="datData_inicioCalendar" 
                           UserDateFormat="DayMonthYear"></ajaxToolkit:MaskedEditExtender>--%>
                       <ajaxToolkit:CalendarExtender ID="datData_inicioCalendar_CalendarExtender" 
                           runat="server" TargetControlID="datData_inicioCalendar"></ajaxToolkit:CalendarExtender>
                       &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                           ControlToValidate="datData_inicioCalendar" ErrorMessage="Campo obrigatório" 
                           ValidationGroup="CadastroCalendario"></asp:RequiredFieldValidator>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data Término:
                       <asp:TextBox ID="datData_terminoCalendar" runat="server" 
                           Width="80px"></asp:TextBox>
                       <%--<ajaxToolkit:MaskedEditExtender ID="datData_terminoCalendar_MaskedEditExtender" 
                           runat="server" BehaviorID="Data_terminoCalendar_MaskedEditExtender" 
                           Mask="99/99/9999" MaskType="Date" TargetControlID="datData_terminoCalendar" 
                           UserDateFormat="DayMonthYear"></ajaxToolkit:MaskedEditExtender>--%>
                       <ajaxToolkit:CalendarExtender ID="datData_terminoCalendar_CalendarExtender" 
                           runat="server" TargetControlID="datData_terminoCalendar"></ajaxToolkit:CalendarExtender>
                       <asp:ImageButton ID="botaoIncluirCalendario" runat="server" CssClass="botao" 
                           Height="20px" ImageUrl="~/Icones/adicionar.gif" 
                           ToolTip="Incluir Atividades / Calendário" ValidationGroup="CadastroCalendario" 
                           Width="20px" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                           ControlToValidate="datData_terminoCalendar" ErrorMessage="Campo obrigatório" 
                           ValidationGroup="CadastroCalendario"></asp:RequiredFieldValidator>
                       <br />
                       <br />
                       &nbsp;<asp:Label ID="lblAtivCalendario" runat="server" Text="Principais Atividades/Entregas:" 
                           Width="250px"></asp:Label>
                       <br />
                       &nbsp;<asp:TextBox ID="txtAtividadeCalendario" runat="server" EnableTheming="False" 
                           Height="60px" TextMode="MultiLine" Width="700px"></asp:TextBox>
                       <br />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                           ControlToValidate="txtAtividadeCalendario" ErrorMessage="Campo obrigatório" 
                           ValidationGroup="CadastroCalendario"></asp:RequiredFieldValidator>
                       <br />
                       <asp:Label ID="lblmensagemRetorno1" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300"></asp:Label>
                       <br />
                       <br />
                       <asp:GridView ID="GridViewCronograma" runat="server" AllowPaging="True" 
                           AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_Cronograma" 
                           DataSourceID="SdsCronograma" Width="100%">
                           <Columns>
                               <asp:BoundField DataField="id_Projeto" HeaderText="id_Projeto" 
                                   SortExpression="id_Projeto" Visible="False" />
                               <asp:BoundField DataField="id_Cronograma" HeaderText="id_Cronograma" 
                                   InsertVisible="False" ReadOnly="True" SortExpression="id_Cronograma" 
                                   Visible="False" />
                               <asp:BoundField DataField="Data_Inicio" DataFormatString="{0:d}" 
                                   HeaderText="Data_Inicio" SortExpression="Data_Inicio"></asp:BoundField>
                               <asp:BoundField DataField="Data_Termino" DataFormatString="{0:d}" 
                                   HeaderText="Data_Termino" SortExpression="Data_Termino"></asp:BoundField>
                               <asp:BoundField DataField="Descricao_Etapa" HeaderText="Descricao_Etapa" 
                                   SortExpression="Descricao_Etapa" />
                               <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                           CommandName="Delete" ImageUrl="~/Icones/excluir.png" 
                                           onclick="ImageButton1_Click7" Text="Excluir" />
                                   </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Right" />
                                   <ItemStyle HorizontalAlign="Right" />
                               </asp:TemplateField>
                           </Columns>
                       </asp:GridView>
                       <asp:SqlDataSource ID="SdsCronograma" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                           DeleteCommand="DELETE FROM [aipCronograma] WHERE [id_Cronograma] = @id_Cronograma" 
                           InsertCommand="INSERT INTO [aipCronograma] ([id_Projeto], [Data_Inicio], [Data_Termino], [Descricao_Etapa]) VALUES (@id_Projeto, @Data_Inicio, @Data_Termino, @Descricao_Etapa)" 
                           SelectCommand="SELECT id_Projeto, id_Cronograma, Data_Inicio, Data_Termino, Descricao_Etapa FROM aipCronograma WHERE (id_Projeto = @id_Projeto)" 
                           
                           UpdateCommand="UPDATE [aipCronograma] SET [id_Projeto] = @id_Projeto, [Data_Inicio] = @Data_Inicio, [Data_Termino] = @Data_Termino, [Descricao_Etapa] = @Descricao_Etapa WHERE [id_Cronograma] = @id_Cronograma">
                           <SelectParameters>
                               <asp:SessionParameter Name="id_Projeto" SessionField="Id_Projeto" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:Parameter Name="id_Cronograma" Type="Int32" />
                           </DeleteParameters>
                           <UpdateParameters>
                               <asp:Parameter Name="id_Projeto" Type="Int32" />
                               <asp:Parameter DbType="Date" Name="Data_Inicio" />
                               <asp:Parameter DbType="Date" Name="Data_Termino" />
                               <asp:Parameter Name="Descricao_Etapa" Type="String" />
                               <asp:Parameter Name="id_Cronograma" Type="Int32" />
                           </UpdateParameters>
                           <InsertParameters>
                               <asp:SessionParameter Name="id_Projeto" SessionField="id_projeto" 
                                   Type="Int32" />
                               <asp:ControlParameter ControlID="datData_inicioCalendar" DbType="DateTime" 
                                   Name="Data_Inicio" PropertyName="Text" />
                               <asp:ControlParameter ControlID="datData_terminoCalendar" DbType="DateTime" 
                                   Name="Data_Termino" PropertyName="Text" />
                               <asp:ControlParameter ControlID="txtAtividadeCalendario" Name="Descricao_Etapa" 
                                   PropertyName="Text" Type="String" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                       <br />
                   </asp:Panel>
                   <br />
               </asp:View>
               <asp:View ID="View6" runat="server">
                   <div id="divPrincipal0">
                       <asp:Panel ID="Panel13" runat="server" CssClass="TabelaControlesTopo" 
                           GroupingText="Cadastro de Riscos" ToolTip="Inclui Risco">
                           <br />
                           <asp:Label ID="lblRisco" runat="server" Text="Risco:" Width="96px"></asp:Label>
                           <asp:TextBox ID="txtRisco" runat="server" EnableTheming="False" 
                               TextMode="MultiLine" Width="500px" Height="80px"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                               ControlToValidate="txtRisco" ErrorMessage="Campo obrigatório" 
                               ValidationGroup="CadastroRiscos"></asp:RequiredFieldValidator>
                           <br />
                           <asp:Label ID="lblAcao" runat="server" Text="Ação Para Minorá-los:"></asp:Label>
                           <asp:TextBox ID="txtAcao" runat="server" EnableTheming="False" 
                               TextMode="MultiLine" Width="500px" Height="80px"></asp:TextBox>
                           <asp:ImageButton ID="BtnIncluiRisco" runat="server" CssClass="botao" 
                               Height="20px" ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" 
                               ValidationGroup="CadastroRiscos" Width="20px" />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                               ControlToValidate="txtAcao" ErrorMessage="Campo obrigatório" 
                               ValidationGroup="CadastroRiscos"></asp:RequiredFieldValidator>
                           <br />
                           <br />
                           <asp:Label ID="txtAviso" runat="server" BorderStyle="None" 
                               EnableTheming="False" Font-Bold="False" Height="19px" style="color: #FF3300" 
                               Width="600px"></asp:Label>
                           <asp:GridView ID="GridRisco" runat="server" AllowPaging="True" 
                               AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                               DataKeyNames="id_Risco" DataSourceID="SqlRisco" 
                               EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
                               GridLines="None" Width="212px">
                               <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/Icones/seta_direita.gif" 
                                   PreviousPageImageUrl="~/Icones/seta_esq.gif" />
                               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <RowStyle BackColor="#EFF3FB" />
                               <Columns>
                                   <asp:BoundField DataField="id_Risco" HeaderText="id_Risco" ReadOnly="True" 
                                       SortExpression="id_Risco" Visible="False" />
                                   <asp:BoundField DataField="Risco" HeaderText="Risco" SortExpression="Risco" />
                                   <asp:BoundField DataField="Acao" HeaderText="Acao" SortExpression="Acao" />
                                   <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                       <ItemTemplate>
                                           <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                               CommandName="Delete" ImageUrl="~/Icones/excluir.png" 
                                               onclick="ImageButton1_Click8" Text="Excluir" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <EditRowStyle BackColor="#2461BF" />
                               <AlternatingRowStyle BackColor="White" />
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlRisco" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                               DeleteCommand="DELETE FROM aipRisco WHERE (id_Risco = @Id_Risco)" 
                               InsertCommand="INSERT INTO aipRisco(id_Projeto, Risco, Acao) VALUES (@Id_Projeto, @Risco, @Acao)" 
                               ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
                               SelectCommand="SELECT id_Projeto, id_Risco, Risco, Acao FROM aipRisco WHERE (id_Projeto = @Id_Projeto)" 
                               UpdateCommand="UPDATE aipRisco SET Risco = @Risco, Acao = @Acao">
                               <SelectParameters>
                                   <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" />
                               </SelectParameters>
                               <DeleteParameters>
                                   <asp:ControlParameter ControlID="GridRisco" Name="Id_Risco" 
                                       PropertyName="SelectedValue" />
                               </DeleteParameters>
                               <InsertParameters>
                                   <asp:ControlParameter ControlID="txtRisco" Name="Risco" PropertyName="Text" />
                                   <asp:ControlParameter ControlID="txtAcao" Name="Acao" PropertyName="Text" />
                                   <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" />
                               </InsertParameters>
                               <UpdateParameters>
                                   <asp:ControlParameter ControlID="txtRisco" Name="Risco" PropertyName="Text" />
                                   <asp:ControlParameter ControlID="txtAcao" Name="Acao" PropertyName="Text" />
                               </UpdateParameters>
                           </asp:SqlDataSource>
                           <br />
                           <br />
                       </asp:Panel>
                       <asp:Panel ID="Panel14" runat="server" CssClass="TabelaControlesTopo" 
                           GroupingText="Cadastro de Interdependências entre Projetos" 
                           ToolTip="Inclui Risco">
                           <br />
                           <br />
                           <asp:Label ID="lblProjeto_Interdepend" runat="server" 
                               Text="Projeto de Interdependência:"></asp:Label>
                           <asp:TextBox ID="txtProjetoInterdepend" runat="server" EnableTheming="False" 
                               TextMode="MultiLine" Width="500px" Height="80px"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                               ControlToValidate="txtProjetoInterdepend" ErrorMessage="Campo obrigatório" 
                               ValidationGroup="CadastroInterdepend"></asp:RequiredFieldValidator>
                           <br />
                           <asp:Label ID="lblAcaoInterdepend" runat="server" 
                               Text="Ação de Interdependência:"></asp:Label>
                           <asp:TextBox ID="txtAcaoInterdepend" runat="server" EnableTheming="False" 
                               TextMode="MultiLine" Width="500px" Height="80px"></asp:TextBox>
                           <asp:ImageButton ID="BtnIncluiInterdepend" runat="server" CssClass="botao" 
                               Height="20px" ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir dados" 
                               ValidationGroup="CadastroInterdepend" Width="20px" />
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                               ControlToValidate="txtAcaoInterdepend" ErrorMessage="Campo obrigatório" 
                               ValidationGroup="CadastroInterdepend"></asp:RequiredFieldValidator>
                           <br />
                           <br />
                           <asp:Label ID="txtAviso2" runat="server" BorderStyle="None" 
                               EnableTheming="False" Font-Bold="False" Height="19px" style="color: #FF3300" 
                               Width="600px"></asp:Label>
                           <br />
                           <asp:GridView ID="GridInterdepend" runat="server" AllowPaging="True" 
                               AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                               DataKeyNames="Id_Interdepend" datasourceid="SqlInterdepend" 
                               EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
                               GridLines="None" Width="212px">
                               <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/Icones/seta_direita.gif" 
                                   PreviousPageImageUrl="~/Icones/seta_esq.gif" />
                               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <RowStyle BackColor="#EFF3FB" />
                               <Columns>
                                   <asp:BoundField DataField="Id_Interdepend" HeaderText="Id_Interdepend" 
                                       ReadOnly="True" SortExpression="Id_Interdepend" Visible="False" />
                                   <asp:BoundField DataField="Projeto_Interdepend" 
                                       HeaderText="Projeto_Interdepend" SortExpression="Projeto_Interdepend" />
                                   <asp:BoundField DataField="Acao_Interdepend" HeaderText="Acao_Interdepend" 
                                       SortExpression="Acao_Interdepend" />
                                   <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                                       <ItemTemplate>
                                           <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                               CommandName="Delete" ImageUrl="~/Icones/excluir.png" 
                                               onclick="ImageButton1_Click9" Text="Excluir" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <EditRowStyle BackColor="#2461BF" />
                               <AlternatingRowStyle BackColor="White" />
                           </asp:GridView>
                           <asp:SqlDataSource ID="SqlInterdepend" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                               DeleteCommand="DELETE FROM aipInterdependencia WHERE (Id_Interdepend = @Id_Interdepend)" 
                               InsertCommand="INSERT INTO aipInterdependencia(Id_Projeto, Projeto_Interdepend, Acao_Interdepend) VALUES (@Id_Projeto, @Projeto_Interdepend, @Acao_Interdepend)" 
                               ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
                               SelectCommand="SELECT Id_Projeto, Id_Interdepend, Projeto_Interdepend, Acao_Interdepend FROM aipInterdependencia WHERE (Id_Projeto = @Id_Projeto) ORDER BY Id_Projeto" 
                               
                               UpdateCommand="UPDATE aipInterdependencia SET Id_Projeto = @Id_Projeto, Projeto_Interdepend = @Projeto_Interdepend, Acao_Interdepend = @Acao_Interdepend">
                               <SelectParameters>
                                   <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" />
                               </SelectParameters>
                               <DeleteParameters>
                                   <asp:ControlParameter ControlID="GridInterdepend" Name="Id_Interdepend" 
                                       PropertyName="SelectedValue" />
                               </DeleteParameters>
                               <InsertParameters>
                                   <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" 
                                       Type="String" />
                                   <asp:ControlParameter ControlID="txtProjetoInterdepend" 
                                       Name="Projeto_Interdepend" PropertyName="Text" />
                                   <asp:ControlParameter ControlID="txtAcaoInterdepend" Name="Acao_Interdepend" 
                                       PropertyName="Text" />
                               </InsertParameters>
                               <UpdateParameters>
                                   <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" />
                                   <asp:ControlParameter ControlID="txtProjetoInterdepend" 
                                       Name="Projeto_Interdepend" PropertyName="Text" />
                                   <asp:ControlParameter ControlID="txtAcaoInterdepend" Name="Acao_Interdepend" 
                                       PropertyName="Text" />
                               </UpdateParameters>
                           </asp:SqlDataSource>
                           <br />
                       </asp:Panel>
                       <br />
                   </div>
               </asp:View>
          </asp:MultiView>
        </div>
    </form>
</body>
</html>
