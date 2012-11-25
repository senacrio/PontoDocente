<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Aprovacao.aspx.vb" Inherits="Aprovacao" Theme="AIP"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
     <link href="AIP.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="divPrincipal">
    <asp:Menu ID="MenuProjeto" runat="server" Orientation="Horizontal" 
                BackColor="#B5C7DE" 
        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
        ForeColor="#284E98" StaticSubMenuIndent="" Width="20px">
               <StaticMenuStyle Width="50px" />
               <StaticSelectedStyle BackColor="#507CD1" />
               <StaticMenuItemStyle Width="110px" HorizontalPadding="5px" ItemSpacing="50px" 
                   VerticalPadding="2px" />
               <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
               <DynamicMenuStyle BackColor="#B5C7DE" />
               <DynamicSelectedStyle BackColor="#507CD1" />
               <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
               <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
               <Items>
                   <asp:MenuItem Text="Projetos" ToolTip="Lista de projetos " Value="0" 
                       ImageUrl="~/Icones/projeto.png">
                   </asp:MenuItem>
                   <asp:MenuItem Text="Detalhe" ToolTip="Detalhe do projeto" Value="1" 
                       ImageUrl="~/Icones/detalhe.png">
                   </asp:MenuItem>
                   <asp:MenuItem Text="Estab/Compet/Munic/Área" Value="2" ImageUrl="~/Icones/envolvidos.png" 
                       ToolTip="Estab/Compet/Munic/Área do Projeto"></asp:MenuItem>
                   <asp:MenuItem Text="Receitas/Despesa" Value="3" ImageUrl="~/Icones/retorno.png" 
                       ToolTip="Receitas/Despesas do Projeto"></asp:MenuItem>
                   <asp:MenuItem Text="Riscos/Interdep" 
                       ToolTip="Riscos e Interdependências do projeto" Value="4" 
                       ImageUrl="~/Icones/grid_semaforo_amarelo.jpg"></asp:MenuItem>
                   <asp:MenuItem ImageUrl="~/Icones/calendario.gif" Text="Cronograma" 
                       ToolTip="Cronograma do Projeto" Value="5"></asp:MenuItem>
                   <asp:MenuItem ImageUrl="~/Icones/icone_noticia.png" Text="Critérios" Value="6" 
                       ToolTip="Critérios de Aprovação">
                   </asp:MenuItem>
               </Items>
           </asp:Menu>
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="ViewAprovacao" runat="server">
                <asp:Panel ID="Panel21" runat="server" CssClass="TabelaControlesTopo" 
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
                    <asp:DropDownList ID="CboStatusProj" runat="server" AutoPostBack="True" 
                        Width="150px">
                        <asp:ListItem Selected="True">Todos</asp:ListItem>
                        <asp:ListItem>Em Análise</asp:ListItem>
                        <asp:ListItem>Aprovado Gestor</asp:ListItem>
                        <asp:ListItem>Rejeitado</asp:ListItem>
                        <asp:ListItem>Cancelado</asp:ListItem>
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
                <asp:Panel ID="Panel1" runat="server" CssClass="TabelaControlesTopo" 
                    GroupingText="AIP - Aprovação" Width="1042px" EnableTheming="False">
                    <br />
                    <asp:Label ID="Label1" runat="server" EnableTheming="False" ForeColor="#003366" 
                        Text="Projeto:" Width="150px"></asp:Label>
                    <asp:TextBox ID="txtId_projeto" runat="server" BackColor="#D7DFDF" 
                        Font-Bold="False" ForeColor="#3366CC" ReadOnly="True" style="text-align: left" 
                        Width="150px"></asp:TextBox>
                    <asp:TextBox ID="txtnome_projeto" runat="server" BackColor="#D7DFDF" 
                        Font-Bold="False" ForeColor="#3366CC" ReadOnly="True" style="text-align: left" 
                        Width="250px"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblAprovação" runat="server" Text="Aprovação:" 
                        EnableTheming="False" ForeColor="#003366" Width="150px"></asp:Label>
                    &nbsp;<asp:ListBox ID="LblAprovacao" runat="server" AutoPostBack="True" 
                        Rows="1" Width="150px">
                        <asp:ListItem>Em Análise</asp:ListItem>
                        <asp:ListItem>Validado Gestor</asp:ListItem>
                        <asp:ListItem>Aprovado</asp:ListItem>
                        <asp:ListItem>Rejeitado</asp:ListItem>
                    </asp:ListBox>
                    &nbsp;<asp:ImageButton ID="BtnAlteraStatusAprovacao" runat="server" CssClass="botao" 
                        ImageUrl="~/Icones/001_06.gif" 
                        ToolTip="Altera o status do projeto selecionado." EnableTheming="False" 
                        
                        
                        onclientclick="javascript: var atualizar = confirm( &quot;Você deseja alterar o status do projeto?&quot; );if ( atualizar == true ) {} else {return false;}" 
                        Height="25px" Width="25px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnIntegra" runat="server" EnableTheming="False" 
                        Text="Integra Com EPM" Visible="False" />
                    <br />
                    <asp:Label ID="LabelMatric" runat="server" Text="Label" Visible="False"></asp:Label>
                    <asp:Label ID="LabelUnidLotac" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridAprovacao" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                        
                        
                        DataKeyNames="id_Projeto,Codigoprojeto,Tituloprojeto,VersaoProjeto,status,Patrocinador" DataSourceID="SDSAprovacao" 
                        EmptyDataText="Não existe registro no momento." ForeColor="#333333" 
                        GridLines="None" Width="1021px" EnableTheming="True">
                        <PagerSettings NextPageImageUrl="~/Icones/seta_direita.gif" 
                            PreviousPageImageUrl="~/Icones/seta_esq.gif" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" 
                                SelectImageUrl="~/Icones/grid_selecionar.gif" ShowSelectButton="True" />
                            <asp:TemplateField HeaderText="Código">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                        NavigateUrl='<%# Eval("URLEpm") %>' Text='<%# Eval("Codigoprojeto") %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Tituloprojeto" HeaderText="Título" 
                                SortExpression="Tituloprojeto" />
                            <asp:BoundField DataField="VersaoProjeto" HeaderText="Versão" 
                                SortExpression="VersaoProjeto" />
                            <asp:BoundField DataField="Executivo_Contas" HeaderText="Executivo Contas" 
                                SortExpression="Executivo_Contas" />
                            <asp:BoundField DataField="Nome_Area" HeaderText="Área" 
                                SortExpression="Nome_Area" />
                            <asp:BoundField DataField="Patrocinador" HeaderText="Patrocinador" 
                                SortExpression="Patrocinador" />
                            <asp:BoundField DataField="CentroCusto" HeaderText="CentroCusto" 
                                SortExpression="CentroCusto" />
                            <asp:BoundField DataField="UnidLotac" HeaderText="UnidLotac" 
                                SortExpression="UnidLotac" />
                            <asp:BoundField DataField="Gestor" HeaderText="Gestor" 
                                SortExpression="Gestor" />
                            <asp:BoundField DataField="status" HeaderText="Status" 
                                SortExpression="status" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SDSStatus" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                        SelectCommand="SELECT id_projeto, status FROM aipProjeto WHERE (id_projeto = @Id_Projeto)" 
                        UpdateCommand="UPDATE aipProjeto SET status = @status WHERE (id_projeto = @id_Projeto)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridAprovacao" Name="Id_Projeto" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="LblAprovacao" Name="status" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="GridAprovacao" Name="id_Projeto" 
                                PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SDSAprovacao" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                        
                        SelectCommand="SELECT aipProjeto.id_Projeto, aipProjeto.Codigoprojeto, aipProjeto.Tituloprojeto, aipProjeto.VersaoProjeto, aipProjeto.status, aipProjeto.Patrocinador, aipProjeto.Lider, aipProjeto.Objetivo, aipProjeto.Resultados, aipProjeto.Premissas, aipProjeto.DadosHistoricos, aipProjeto.Id_ExecConta, aipProjeto.Id_TipoCliente, aipProjeto.Cliente, aipProjeto.Resultado, aipProjeto.DataInicio, aipProjeto.DataFim, aipProjeto.UnidLotac, aipProjeto.CentroCusto, aipProjeto.Id_TipoProjeto, aipProjeto.PublicoAlvo, aipProjeto.Id_UnidadeExecutora, aipProjeto.Equipe, aipProjeto.OutrasAreas, aipProjeto.Restricoes, aipProjeto.Produtos_Servicos, aipProjeto.Bairro, aipProjeto.Escopo, aipProjeto.Id_Gestor, aipProjeto.Id_TipoServico, aipProjeto.Id_Cliente, aipProjeto.Id_OutrosClientes, aipProjeto.Usuario_Criacao, aipProjeto.Data_Criacao, View_Executivos_DTS.nome AS Executivo_Contas, aipTpProjeto.NomeTpProjeto, aipArea.Nome_Area, aipProjeto.Demanda, aipProjeto.NContr, View_Gestores_DTS.nome AS Gestor, aipProjeto.StatusEpm, aipProjeto.URLEpm FROM aipProjeto INNER JOIN View_Executivos_DTS ON aipProjeto.Id_ExecConta = View_Executivos_DTS.cod_exec INNER JOIN aipTpProjeto ON aipProjeto.Id_TipoProjeto = aipTpProjeto.id_TpProjeto INNER JOIN aipArea ON aipProjeto.Id_UnidadeExecutora = aipArea.Id_Area INNER JOIN View_Gestores_DTS ON aipProjeto.Id_Gestor = View_Gestores_DTS.cod_gestor WHERE     (aipProjeto.UnidLotac = CASE WHEN @UnidLotac IN (115010000, 115020000) THEN aipProjeto.UnidLotac ELSE CASE WHEN @UnidLotac = '400025' AND 
                      aipProjeto.Id_Cliente = '999908313' THEN aipProjeto.UnidLotac ELSE @UnidLotac END END) AND 
                      (aipProjeto.Codigoprojeto LIKE (CASE WHEN (@CodigoProjeto = '' or @CodigoProjeto is null) THEN '%'   ELSE ltrim(rtrim(@CodigoProjeto)) + '%' END)) AND 
                      (aipProjeto.Tituloprojeto LIKE (CASE WHEN (@TituloProjeto = '' or @TituloProjeto is null) THEN '%'   ELSE ltrim(rtrim(@TituloProjeto)) + '%' END)) AND 
                      (aipProjeto.CentroCusto   LIKE (CASE WHEN (@CentroCusto   = '' or @CentroCusto   is null) THEN '%'   ELSE ltrim(rtrim(@CentroCusto))   + '%' END)) AND 
                      (aipProjeto.Status     =     CASE WHEN (@Status = 'Todos' or @Status = '' or @Status is null) THEN ltrim(rtrim(aipProjeto.Status)) ELSE ltrim(rtrim(@Status))        END)" 
                        DeleteCommand="DELETE FROM [aipProjeto] WHERE [id_Projeto] = @id_Projeto" 
                        
                        UpdateCommand="UPDATE aipProjeto SET StatusEpm = 'Integrado EPM', URLEpm = @URLEPM WHERE (id_Projeto = @Id_Projeto)">
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
                            <asp:Parameter Name="id_Projeto" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="LblUrl" Name="URLEPM" PropertyName="Text" />
                            <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="LblLogin" runat="server" EnableTheming="False" Width="500px"></asp:Label>
                    <br />
                    <asp:Label ID="LblMsg" runat="server" EnableTheming="False" Width="500px"></asp:Label>
                    <br />
                    <asp:Label ID="LblUrl" runat="server" EnableTheming="False" Width="500px"></asp:Label>
                    <br />
                    <br />
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
                    ToolTip="Fomato XXXAAAANNNN (XXX = Área, AAAA = Ano e NNNN = Sequencial)" 
                    Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqCodigo" runat="server" 
                    ControlToValidate="txtCodigoprojeto" ErrorMessage="Campo obrigatório" 
                    Width="120px"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="lblVersao0" runat="server" Text="Versão do projeto:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtVersaoProjeto" runat="server" MaxLength="3" Width="48px" 
                    Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqCodigo10" runat="server" 
                    ControlToValidate="txtVersaoProjeto" ErrorMessage="Campo obrigatório" 
                    Width="120px"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblCentroCusto" runat="server" Text="Centro de Custo:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtCentroCusto" runat="server" Width="105px" Enabled="False"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <asp:Label ID="lblNContr" runat="server" Text="Nr.Prop/Contrato:" Width="150px"></asp:Label>
                <asp:TextBox ID="txtNContr" runat="server" Width="105px" Enabled="False"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="lblTítuloProjeto" runat="server" Text="Título do Projeto:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtTituloprojeto" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqCodigo0" runat="server" 
                    ControlToValidate="txttituloprojeto" ErrorMessage="Campo obrigatório" 
                    Width="120px"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblExecContas" runat="server" Text="Executivo de Contas:" 
                    Width="150px"></asp:Label>
                <asp:DropDownList ID="cboId_ExecConta" runat="server" 
                    DataSourceID="SqlExecutContaDTS" DataTextField="nome" DataValueField="cod_exec" 
                    Width="305px" Enabled="False">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblPatrocinador" runat="server" Text="Patrocinador:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtpatrocinador" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqCodigo8" runat="server" 
                    ControlToValidate="txtpatrocinador" ErrorMessage="Campo obrigatório" 
                    Width="120px"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblGestor" runat="server" Text="Gestor:" Width="150px"></asp:Label>
                <asp:DropDownList ID="cboId_Gestor" runat="server" DataSourceID="SGestorDTS" 
                    DataTextField="nome" DataValueField="cod_gestor" Width="305px" 
                    Enabled="False">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblLider" runat="server" Text="Líder do Projeto:" Width="150px"></asp:Label>
                <asp:TextBox ID="txtLider" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqCodigo11" runat="server" 
                    ControlToValidate="txtlider" ErrorMessage="Campo obrigatório" Width="120px"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblEquipe" runat="server" Text="Equipe do Projeto:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtEquipe" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <br />
                <asp:Label ID="lblArea" runat="server" Text="Unidade/Área Executora:" 
                    Width="150px"></asp:Label>
                <asp:DropDownList ID="cboId_UnidadeExecutora" runat="server" 
                    DataSourceID="SqlArea" DataTextField="Nome_Area" DataValueField="Id_Area" 
                    Width="305px" Enabled="False">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RqCodigo16" runat="server" 
                    ControlToValidate="cboId_UnidadeExecutora" ErrorMessage="Campo obrigatório" 
                    Width="120px"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="lblOutrasAreas" runat="server" 
                    Text="Outras Áreas Envolvidas no Projeto:" Width="150px"></asp:Label>
                <asp:TextBox ID="txtOutrasAreas" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <br />
                <asp:Label ID="lblTpProjeto" runat="server" Text="Tipo de Projeto:" 
                    Width="150px"></asp:Label>
                <asp:DropDownList ID="cboId_TipoProjeto" runat="server" 
                    DataSourceID="SqlTpProjeto" DataTextField="NomeTpProjeto" 
                    DataValueField="id_TpProjeto" Width="305px" Enabled="False">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblEstabelec1" runat="server" Text="Estabelecimentos:" 
                    Width="150px"></asp:Label>
                <br />
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
                        <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="LblTotPercEstab" runat="server" EnableTheming="False" 
                                    Font-Bold="True" ForeColor="White" Text="Label"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" EnableTheming="True" 
                                    Text='<%# Bind("Percentual", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="50px" />
                            <FooterStyle ForeColor="White" Width="50px" />
                            <HeaderStyle Width="50px" />
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:GridView>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlTpProjeto" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                    SelectCommand="SELECT [id_TpProjeto], [NomeTpProjeto] FROM [aipTpProjeto]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SGestorDTS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                    SelectCommand="DTS_le_gestores" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlArea" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                    SelectCommand="SELECT Id_Area, Nome_Area FROM aipArea ORDER BY Id_Area">
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
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqCodigo2" runat="server" 
                    ControlToValidate="txtDemanda" ErrorMessage="Campo obrigatório" Width="120px"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblObjetivos" runat="server" Text="Objetivos do Projeto:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtObjetivo" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqCodigo6" runat="server" 
                    ControlToValidate="txtObjetivo" ErrorMessage="Campo obrigatório" 
                    style="height: 14px" Width="120px"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblTpServico" runat="server" Text="Tipo de Atendimento:" 
                    Visible="False" Width="150px"></asp:Label>
                <asp:DropDownList ID="cbId_Tiposervico" runat="server" Visible="False" 
                    Width="305px" Enabled="False">
                    <asp:ListItem Value="00">NÃO APLICÁVEL</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SdsTpServico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SenacConnection %>" 
                    SelectCommand="DTS_le_tp_servico" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblCompetencia0" runat="server" Text="Competências:" 
                    Width="150px"></asp:Label>
                <br />
                <asp:GridView ID="GridCompetencia0" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id_projeto_competencia,Percentual" DataSourceID="SqlCompetencia" 
                    EmptyDataText="Não existem competências amarradas a este projeto" Width="584px">
                    <Columns>
                        <asp:BoundField DataField="cod_compet" HeaderText="Código" ReadOnly="True" 
                            SortExpression="cod_compet">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nome" HeaderText="Competência" ReadOnly="True" 
                            SortExpression="nome">
                        <HeaderStyle HorizontalAlign="Left" Width="300px" />
                        <ItemStyle Width="300px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="LblTotalPercentCompet" runat="server" EnableTheming="False" 
                                    Font-Bold="True" ForeColor="White" Text="Label"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Percentual", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="50px" />
                            <FooterStyle Width="50px" />
                            <HeaderStyle HorizontalAlign="Left" Width="50px" />
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:GridView>
                <br />
                <br />
                <asp:Label ID="lblTitulo3" runat="server" EnableTheming="False" 
                    Font-Size="Large" ForeColor="Black" Text="3 - Cliente"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblTipoCliente0" runat="server" Text="Tipo de Cliente:" 
                    Width="150px"></asp:Label>
                <asp:DropDownList ID="cboId_TipoCliente" runat="server" 
                    DataSourceID="SqlTpCliente" DataTextField="NomeTpCliente" 
                    DataValueField="id_TpCliente" Width="305px" Enabled="False">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblCliente" runat="server" Text="Cliente Corporativo:" 
                    Width="150px"></asp:Label>
                <asp:DropDownList ID="cboId_Cliente" runat="server" DataSourceID="SqlCliente" 
                    DataTextField="Cliente" DataValueField="cdn_cliente" Width="650px" 
                    Enabled="False">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblOutrosClientes" runat="server" Text="Cliente Interno:" 
                    Width="150px"></asp:Label>
                <asp:DropDownList ID="cboId_OutrosClientes" runat="server" 
                    DataSourceID="SqlOutrosClientes" DataTextField="Cliente" 
                    DataValueField="id_outros_clientes" Width="305px" Enabled="False">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblClientes" runat="server" Text="Outros Clientes:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtCliente" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
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
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                &nbsp;&nbsp;<br />
                <asp:Label ID="lblMunicipio0" runat="server" Text="Municípios:" Width="150px"></asp:Label>
                <br />
                <asp:GridView ID="GridCidade0" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id_Projeto_Cidade,Percentual" DataSourceID="SqlGridMunicipio" 
                    EmptyDataText="Não existem Cidades amarradas a este projeto" Width="446px">
                    <Columns>
                        <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" 
                            SortExpression="Estado">
                        <HeaderStyle HorizontalAlign="Left" Width="30px" />
                        <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nome" HeaderText="Município" ReadOnly="True" 
                            SortExpression="Nome">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblTotalPercCidade" runat="server" EnableTheming="False" 
                                    Font-Bold="True" ForeColor="White" Text="Label"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTotalPercentCidade0" runat="server" 
                                    Text='<%# Bind("Percentual", "{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="50px" />
                            <HeaderStyle HorizontalAlign="Left" Width="50px" />
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Label ID="lblBairro" runat="server" Text="Bairros:" Width="150px"></asp:Label>
                <asp:TextBox ID="txtBairro" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <br />
                <br />
                <br />
                <asp:Label ID="lblTitulo5" runat="server" EnableTheming="False" 
                    Font-Size="Large" ForeColor="Black" Text="5 -Escopo"></asp:Label>
                <br />
                &nbsp;&nbsp;<br />
                <asp:Label ID="lblEscopo" runat="server" Text="Escopo Preliminar:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtEscopo" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqCodigo17" runat="server" 
                    ControlToValidate="txtEscopo" ErrorMessage="Campo obrigatório" 
                    style="height: 14px" Width="120px"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblProdutosServicos" runat="server" Text="Produtos e Serviços:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtProdutos_Servicos" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblTitulo6" runat="server" EnableTheming="False" 
                    Font-Size="Large" ForeColor="Black" Text="6 - Premissas"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblPremissas" runat="server" Text="Premissas:" Width="150px"></asp:Label>
                <asp:TextBox ID="txtPremissas" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RqCodigo13" runat="server" 
                    ControlToValidate="txtPremissas" ErrorMessage="Campo obrigatório" 
                    style="height: 14px" Width="120px"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="lblTitulo7" runat="server" EnableTheming="False" 
                    Font-Size="Large" ForeColor="Black" Text="7 - Restrições"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblRestricoes" runat="server" Text="Restrições:" Width="150px"></asp:Label>
                <asp:TextBox ID="txtRestricoes" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblTitulo8" runat="server" EnableTheming="False" 
                    Font-Size="Large" ForeColor="Black" Text="8 - Dados Históricos"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblDadosHistoricos" runat="server" 
                    Text="Dados Históricos Disponíveis:" Width="150px"></asp:Label>
                <asp:TextBox ID="txtDadosHistoricos" runat="server" EnableTheming="False" 
                    Font-Names="Verdana" Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblTitulo9" runat="server" EnableTheming="False" 
                    Font-Size="Large" ForeColor="Black" Text="9 - Resultados Esperados"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblResultado" runat="server" Text="Resultados Esperado:" 
                    Width="150px"></asp:Label>
                <asp:TextBox ID="txtResultado" runat="server" EnableTheming="False" 
                    Font-Size="Smaller" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblTitulo10" runat="server" EnableTheming="False" 
                    Font-Size="Large" ForeColor="Black" Text="10 - Datas Previstas"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblDatainicio" runat="server" Text="Data início:" Width="150px"></asp:Label>
                <asp:TextBox ID="datDataInicio" runat="server" Width="100px" Enabled="False"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="DatDataInicio_CalendarExtender" 
                    runat="server" TargetControlID="DatDataInicio">
                </ajaxToolkit:CalendarExtender>
                <asp:CompareValidator ID="valDataInicio" runat="server" 
                    ControlToValidate="datDataInicio" ErrorMessage="Data inválida" 
                    Operator="GreaterThan" Type="Date" ValueToCompare="01/01/2008"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RqCodigo4" runat="server" 
                    ControlToValidate="datDataInicio" ErrorMessage="Campo obrigatório" 
                    Width="120px"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblDatafim" runat="server" Text="Data fim:" Width="150px"></asp:Label>
                <asp:TextBox ID="datDataFim" runat="server" Width="100px" Enabled="False"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="DataFim_CalendarExtender" runat="server" 
                    TargetControlID="DatDataFim">
                </ajaxToolkit:CalendarExtender>
                <asp:CompareValidator ID="valDataFim" runat="server" 
                    ControlToCompare="datDataInicio" ControlToValidate="datDataFim" 
                    ErrorMessage="Data inválida" Operator="GreaterThan" Type="Date" 
                    ValueToCompare="01/01/2008"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RqCodigo5" runat="server" 
                    ControlToValidate="datDataFim" ErrorMessage="Campo obrigatório" Width="120px"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    EnableScriptGlobalization="True">
                </asp:ScriptManager>
                <br />
                <table class="TabelaControles">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
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
                    ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" 
                    
                    
                    SelectCommand="SELECT id_Projeto, Tituloprojeto, VersaoProjeto, Patrocinador, Id_Gestor, Lider, Demanda, Objetivo, Resultados, Premissas, Escopo, DadosHistoricos, Id_ExecConta, Id_TipoCliente, Cliente, Resultado, DataInicio, DataFim, UnidLotac, status, CentroCusto, Id_TipoProjeto, PublicoAlvo, Id_UnidadeExecutora, Equipe, Bairro, Produtos_Servicos, OutrasAreas, Restricoes, Codigoprojeto, Id_TipoServico, Id_cliente, Id_OutrosClientes, NContr, Data_Criacao, Usuario_Criacao FROM aipProjeto WHERE (id_Projeto = @id_projeto)">
                    <SelectParameters>
                        <asp:SessionParameter Name="id_projeto" SessionField="id_projeto" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id_projeto" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:Panel ID="Panel15" runat="server" CssClass="TabelaControlesTopo" 
                    GroupingText="Cadastro de projeto - Estabelecimentos" 
                    ToolTip="Inclui Estabelecimento">
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
                                SortExpression="cod_estab">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nom_abrev" HeaderText="Nome Abreviado" 
                                SortExpression="nom_abrev">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nom_pessoa" HeaderText="Nome Estabelecimento" 
                                SortExpression="nom_pessoa">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="LblTotalEstabelec" runat="server" EnableTheming="False" 
                                        Font-Bold="True" ForeColor="White" Text="Label"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Percentual", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <FooterStyle Width="50px" />
                                <HeaderStyle HorizontalAlign="Left" Width="50px" />
                                <ItemStyle Width="50px" />
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
                    GroupingText="Cadastro de projeto - Competências" ToolTip="Inclui Competência">
                    &nbsp; &nbsp;<br />
                    <br />
                    <asp:GridView ID="GridCompetencia" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="id_projeto_competencia,Percentual" DataSourceID="SqlCompetencia" 
                        EmptyDataText="Não existem competências amarradas a este projeto" Width="584px">
                        <Columns>
                            <asp:BoundField DataField="id_projeto_competencia" 
                                HeaderText="id_projeto_competencia" InsertVisible="False" 
                                SortExpression="id_projeto_competencia" Visible="False" />
                            <asp:BoundField DataField="cod_compet" HeaderText="Código" ReadOnly="True" 
                                SortExpression="cod_compet">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nome" HeaderText="Competência" ReadOnly="True" 
                                SortExpression="nome">
                            <HeaderStyle HorizontalAlign="Left" Width="300px" />
                            <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual">
                                <EditItemTemplate>
                                    Competência
                                </EditItemTemplate>
                                <AlternatingItemTemplate>
                                    Código
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="LblTotalCompet" runat="server" EnableTheming="False" 
                                        Font-Bold="True" ForeColor="White" Text="TotalCompetencia"></asp:Label>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Percentual
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LblValorCompet" runat="server" 
                                        Text='<%# Bind("Percentual", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <FooterStyle Width="50px" />
                                <HeaderStyle HorizontalAlign="Left" Width="50px" />
                                <ItemStyle Width="50px" />
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
                            <asp:SessionParameter Name="Id_Projeto" SessionField="Id_Projeto" />
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
                <asp:Panel ID="Panel17" runat="server" CssClass="TabelaControlesTopo" 
                    GroupingText="Cadastro de Municípios" Height="425px" ToolTip="Inclui Município">
                    &nbsp;&nbsp;<br />
                    <asp:GridView ID="GridCidade" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="id_Projeto_Cidade,Percentual" DataSourceID="SqlGridMunicipio" 
                        EmptyDataText="Não existem cidades amarradas a este projeto" Width="591px">
                        <Columns>
                            <asp:BoundField DataField="id_Projeto_Cidade" HeaderText="id_Projeto_Cidade" 
                                SortExpression="id_Projeto_Cidade" Visible="False" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" 
                                SortExpression="Estado">
                            <HeaderStyle Width="30px" />
                            <ItemStyle Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Nome" HeaderText="Nome" ReadOnly="True" 
                                SortExpression="Nome" />
                            <asp:TemplateField HeaderText="Percentual" SortExpression="Percentual">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Percentual") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalPercentMunic" runat="server" EnableTheming="False" 
                                        Font-Bold="True" ForeColor="White" Text="TotalPercentMunic"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LblValorMunic" runat="server" Text='<%# Eval("Percentual") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <HeaderStyle Width="50px" />
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:Label ID="lblCidadeErro" runat="server" EnableTheming="False" 
                        ForeColor="#CC3300" Height="16px" Text=" " Width="600px"></asp:Label>
                    <br />
                    <br />
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
                <asp:Panel ID="Panel11" runat="server" CssClass="TabelaControlesTopo" 
                    GroupingText="Cadastro de projeto - Receitas" ToolTip="Inclui Receitas" 
                    Width="892px">
                    &nbsp;&nbsp;&nbsp;<br />
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
                                SortExpression="descricao">
                            <ControlStyle Width="350px" />
                            <HeaderStyle HorizontalAlign="Left" Width="350px" />
                            <ItemStyle HorizontalAlign="Left" Width="350px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Valor da Receita" SortExpression="ValorReceita">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("ValorReceita") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalReceita" runat="server" CssClass="style8" 
                                        EnableTheming="False" Font-Bold="True" ForeColor="White" Text="Label"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelReceita" runat="server" 
                                        Text='<%# Bind("ValorReceita", "{0:c}") %>' EnableTheming="False"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100px" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" Width="100px" />
                                <ItemStyle HorizontalAlign="Right" Width="100px" />
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
                    <br />
                </asp:Panel>
                <asp:Panel ID="Panel19" runat="server" CssClass="TabelaControlesTopo" 
                    GroupingText="Cadastro de projeto - Despesas" ToolTip="Inclui Despesas" 
                    Width="892px">
                    <br />
                    &nbsp;&nbsp;<asp:GridView ID="GridViewDespesas" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_despesas" 
                        DataSourceID="SdsDespesas">
                        <Columns>
                            <asp:BoundField DataField="id_projeto_FK" HeaderText="id_projeto_FK" 
                                SortExpression="id_projeto_FK" Visible="False" />
                            <asp:BoundField DataField="id_despesas" HeaderText="id_despesas" 
                                InsertVisible="False" ReadOnly="True" SortExpression="id_despesas" 
                                Visible="False" />
                            <asp:BoundField DataField="descricao" HeaderText="Descrição" 
                                SortExpression="descricao">
                            <ControlStyle Width="350px" />
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" Width="350px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Valor da Despesa" SortExpression="valorDespesa">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("valorDespesa") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="LblTotalDespesa" runat="server" Font-Bold="True" 
                                        ForeColor="White" Text="Label" EnableTheming="False"></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelDespesa" runat="server" 
                                        Text='<%# Bind("valorDespesa", "{0:c}") %>' EnableTheming="False"></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100px" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" Width="100px" />
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
                    <br />
                </asp:Panel>
                <br />
            </asp:View>
            <asp:View ID="View7" runat="server">
                <asp:Panel ID="Panel20" runat="server" CssClass="TabelaControlesTopo" 
                    GroupingText="Cadastro de projeto - Calendários" ToolTip="Inclui Calendário" 
                    Width="892px">
                    <br />
                    &nbsp;<br />
                    <asp:GridView ID="GridViewCronograma" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_Cronograma" 
                        DataSourceID="SdsCronograma" Width="100%" 
                        EmptyDataText="Não existem datas cadastradas">
                        <Columns>
                            <asp:BoundField DataField="id_Projeto" HeaderText="id_Projeto" 
                                SortExpression="id_Projeto" Visible="False" />
                            <asp:BoundField DataField="id_Cronograma" HeaderText="id_Cronograma" 
                                InsertVisible="False" ReadOnly="True" SortExpression="id_Cronograma" 
                                Visible="False" />
                            <asp:BoundField DataField="Data_Inicio" DataFormatString="{0:d}" 
                                HeaderText="Data_Inicio" SortExpression="Data_Inicio" />
                            <asp:BoundField DataField="Data_Termino" DataFormatString="{0:d}" 
                                HeaderText="Data_Termino" SortExpression="Data_Termino" />
                            <asp:BoundField DataField="Descricao_Etapa" HeaderText="Descricao_Etapa" 
                                SortExpression="Descricao_Etapa" />
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
            <asp:View ID="View8" runat="server">
                <div ID="divPrincipal0">
                    <asp:Panel ID="Panel13" runat="server" CssClass="TabelaControlesTopo" 
                        GroupingText="Cadastro de Riscos" ToolTip="Inclui Risco">
                        <br />
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
            <asp:View ID="View6" runat="server">
                <asp:Image ID="Criterios" runat="server" ImageUrl="~/Imagens/Criterios.JPG" />
            </asp:View>
            <br />
            <br />
            <br />
        </asp:MultiView>
        <br />
    </div>
    </form>
</body>
</html>
