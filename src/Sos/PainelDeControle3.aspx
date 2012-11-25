<%@ Page Language="VB" EnableEventValidation="false" AutoEventWireup="false" CodeFile="PainelDeControle3.aspx.vb" Inherits="Sos_PainelDeControle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Aba.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .style1
        {
            width: 100%;
            font-family: Verdana;
            font-size: x-small;
        }
        .style8
        {
            width: 48px;
        }
        .style9
        {
            width: 113px;
        }
        .style10
        {
            width: 299px;
        }
        .style14
        {
            width: 122%;
            font-family: Verdana;
            font-size: x-small;
            height: 34px;
        }
        .style15
        {
            width: 23px;
        }
        .style16
        {
            width: 290px;
        }
        .style17
        {
            width: 65px;
            font-family: Verdana;
            font-size: x-small;
        }
        .style4
        {
            width: 62px;
        }
        .style6
        {
            width: 136px;
        }
        .style11
        {
            width: 102px;
        }
        .style7
        {
            width: 204px;
        }
        .style18
        {
            width: 106px;
        }
        .style19
        {
            width: 125px;
        }
        .style22
        {
            font-family: Verdana;
        }
        .style23
        {
            width: 100%;
        }
        .style24
        {
            width: 55px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                        <asp:ScriptManager ID="ScriptManager1" runat="server" 
                            EnableScriptGlobalization="True">
                        </asp:ScriptManager>
    
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <span style="color: black; font-family: Arial; font-weight: bold;">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="Medium" Text="Painel de controle"></asp:Label>
                </span>
                <br />
                <table class="style14">
                    <tr>
                        <td class="style18">
                            <asp:Panel ID="Panel1" runat="server" GroupingText="Consulta" 
                                style="font-family: Verdana; font-size: x-small" Width="676px">
                                <table class="style1">
                                    <tr>
                                        <td class="style4">
                                            Codigo:</td>
                                        <td class="style6">
                                            <asp:TextBox ID="txtCodigoC" runat="server" 
                                                style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                                        </td>
                                        <td class="style11">
                                            Grupo de Serviço:</td>
                                        <td class="style7">
                                            <asp:DropDownList ID="ddlGrupoServicoC" runat="server" 
                                                DataSourceID="sdsGrupoServicoCbo" DataTextField="Nome" 
                                                DataValueField="IDGrupoServico" 
                                                style="font-family: Verdana; font-size: x-small" Width="200px">
                                                <asp:ListItem Value="1">ddsaads</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td rowspan="5" valign="top">
                                            <asp:ImageButton ID="btnFiltrar" runat="server" 
                                                ImageUrl="~/Icones/botao_filtrar.png" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            Descrição:</td>
                                        <td class="style6">
                                            <asp:TextBox ID="txtDescricaoC" runat="server" 
                                                style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                                        </td>
                                        <td class="style11">
                                            Serviço:</td>
                                        <td class="style7">
                                            <asp:DropDownList ID="ddlServicoC" runat="server" DataSourceID="sdsServicoCbo" 
                                                DataTextField="Nome" DataValueField="IDServico" 
                                                style="font-family: Verdana; font-size: x-small" Width="200px">
                                                <asp:ListItem Value="1">assa</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            SOS:</td>
                                        <td class="style6">
                                            <asp:DropDownList ID="ddlSOSC" runat="server" 
                                                style="font-family: Verdana; font-size: x-small">
                                                <asp:ListItem Value="1">TODAS UNIDADES</asp:ListItem>
                                                <asp:ListItem Value="0">PRÓPRIA UNIDADE</asp:ListItem>
                                                <asp:ListItem Value="2">MINHAS SOS&#39;S</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style11">
                                            Status:</td>
                                        <td class="style7">
                                            <asp:DropDownList ID="ddlStatusC" runat="server" DataSourceID="sdsStatus" 
                                                DataTextField="Status" DataValueField="IDStatus" 
                                                style="font-family: Verdana; font-size: x-small" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            Técnico:</td>
                                        <td class="style6">
                                            <asp:DropDownList ID="ddlTecnicoBusca" runat="server" 
                                                DataSourceID="sqlBuscaTecnico" DataTextField="nom_pessoa_fisic" 
                                                DataValueField="cdn_funcionario" 
                                                style="font-family: Verdana; font-size: x-small" Width="128px">
                                                <asp:ListItem Value="1">TODAS UNIDADES</asp:ListItem>
                                                <asp:ListItem Value="0">PRÓPRIA UNIDADE</asp:ListItem>
                                                <asp:ListItem Value="2">MINHAS SOS&#39;S</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style11">
                                            Solicitante:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtSolicitante" runat="server" 
                                                style="font-family: Verdana; font-size: x-small" Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            Atualização:</td>
                                        <td class="style6">
                                            <asp:TextBox ID="txtTempo" runat="server" 
                                                style="font-family: Verdana; font-size: x-small" Width="50px">60</asp:TextBox>
                                            &nbsp;</td>
                                        <td class="style11">
                                            Aberto em:</td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtDataInicial" runat="server" style="font-family: Verdana; font-size: x-small" 
                                                Width="80px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="txtDataInicial_CalendarExtender" 
                                                runat="server" Enabled="True" TargetControlID="txtDataInicial">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:TextBox ID="txtDataFinal" runat="server" style="font-family: Verdana; font-size: x-small" Width="80px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="txtDataFinal_CalendarExtender" runat="server" 
                                                Enabled="True" TargetControlID="txtDataFinal">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </asp:Panel>
                        </td>
                        <td valign="top">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel2" runat="server" GroupingText="SOS" Height="100px" 
                                        style="font-family: Verdana; font-size: x-small" Width="248px">
                                        <table class="style14">
                                            <tr>
                                                <td class="style19">
                                                    Total de SOS:</td>
                                                <td>
                                                    <asp:Label ID="lblTotalSOS" runat="server" Font-Names="Verdana" 
                                                        Font-Size="X-Small" Text="-"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style19">
                                                    SOS em aberto:</td>
                                                <td>
                                                    <asp:Label ID="lblSOSAberta" runat="server" Font-Names="Verdana" 
                                                        Font-Size="X-Small" Text="-"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style19">
                                                    SOS em andamento:</td>
                                                <td>
                                                    <asp:Label ID="lblAndamento" runat="server" Font-Names="Verdana" 
                                                        Font-Size="X-Small" Text="-"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style19">
                                                    Espera média:</td>
                                                <td>
                                                    <asp:Label ID="lblTempo" runat="server" Font-Names="Verdana" 
                                                        Font-Size="X-Small" Text="-"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                    </asp:Panel>
                                    <asp:Timer ID="Timer3" runat="server" Interval="5000">
                                    </asp:Timer>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Timer3" EventName="Tick" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="sdsGrupoServicoCbo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    SelectCommand="SELECT IDGrupoServico, Nome, Descricao FROM sosGrupoServico 
WHERE (Ativo=1)
UNION SELECT NULL, 'TODOS' ,'' ">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsServicoCbo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" SelectCommand="SELECT     IDServico, Nome, Descricao, IDGrupoServico
FROM         sosServico
WHERE (Ativo=1)
union
SELECT NULL,'TODOS','',''"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" SelectCommand="SELECT     IDStatus, Status
FROM         sosStatus
UNION
SELECT NULL,'TODOS'"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlBuscaTecnico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    SelectCommand="SELECT ' TODOS' AS nom_pessoa_fisic, 0 AS cdn_funcionario UNION SELECT SGT_RHFuncionarioAtivo.nom_pessoa_fisic, SGT_RHFuncionarioAtivo.cdn_funcionario FROM SGT_RHFuncionarioAtivo INNER JOIN sosTecnico ON SGT_RHFuncionarioAtivo.cdn_funcionario = sosTecnico.IDTecnico ORDER BY nom_pessoa_fisic">
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblTotal" runat="server" Font-Names="Verdana" 
                    Font-Size="X-Small"></asp:Label>
                <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" 
                    BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" 
                    Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px">
                    <StaticSelectedStyle BackColor="#507CD1" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                    <DynamicMenuStyle BackColor="#B5C7DE" />
                    <DynamicSelectedStyle BackColor="#507CD1" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                    <Items>
                        <asp:MenuItem Selected="True" Text="SOS" Value="0"></asp:MenuItem>
                        <asp:MenuItem Text="Acompanhamento" Value="1"></asp:MenuItem>
                    </Items>
                    
                </asp:Menu>
                <div class="conteudo">
                <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View2" runat="server">
                        <asp:Label ID="lblErro" runat="server" Font-Names="Arial" Font-Size="Small" 
                            ForeColor="Red" style="font-family: Verdana; font-size: x-small"></asp:Label>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="grdSOS" runat="server" AllowPaging="True" AllowSorting="True" 
                                    AutoGenerateColumns="False" BorderColor="Silver" BorderStyle="Solid" 
                                    BorderWidth="1px" CellPadding="2" 
                                    DataKeyNames="IDChamado,IDStatus,IDTecnico,Status,IDSolicitante" 
                                    DataSourceID="sdsPainelSOS" Font-Names="Arial" Font-Size="Small" 
                                    ForeColor="#333333" GridLines="None" PageSize="15" 
                                    style="text-align: left; font-family: Verdana; font-size: x-small;" 
                                    Width="1027px">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EmptyDataRowStyle BorderColor="White" BorderStyle="Solid" BorderWidth="1px" 
                                        ForeColor="Black" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EmptyDataTemplate>
                                        <br />
                                        Não existem Informações cadastradas.<br />
                                        <br />
                                    </EmptyDataTemplate>
                                    <EditRowStyle BackColor="#999999" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Select" 
                                                    ImageUrl="~/Icones/grid_selecionar.gif" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="IDChamado" HeaderText="Código" InsertVisible="False" 
                                            ReadOnly="True" SortExpression="IDChamado" />
                                        <asp:TemplateField HeaderText="VNC / Telefone">
                                            <ItemTemplate>
                                                <table class="style23" style="font-size: x-small">
                                                    <tr>
                                                        <td class="style24">
                                                            VNC:</td>
                                                        <td>
                                                            <asp:Label ID="Label9" runat="server" Font-Size="X-Small" 
                                                                Text='<%# Bind("Vnc") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style24">
                                                            Telefone:</td>
                                                        <td>
                                                            <asp:Label ID="Label10" runat="server" Font-Size="X-Small" 
                                                                Text='<%# Bind("Telefone") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="nomeServico" HeaderText="Serviço" 
                                            SortExpression="nomeServico" />
                                        <asp:BoundField DataField="Descricao" HeaderText="Descrição" 
                                            SortExpression="Descricao" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status">
                                            <ItemStyle Font-Bold="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Técnico">
                                            <ItemTemplate>
                                                <table class="style23">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="Image1" runat="server" AlternateText="Sem foto" Height="60px" 
                                                                ImageUrl='<%# Bind("fotoTec") %>' Width="45px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label7" runat="server" 
                                                                style="font-family: Verdana; font-size: x-small;" Text='<%# Bind("Tecnico") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Solicitante">
                                            <ItemTemplate>
                                                <table class="style23">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="Image2" runat="server" AlternateText="Sem foto" Height="60px" 
                                                                ImageUrl='<%# Bind("fotoSolic") %>' Width="45px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label8" runat="server" 
                                                                style="font-family: Verdana; font-size: x-small;" 
                                                                Text='<%# Bind("Solicitante") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                                        <asp:BoundField DataField="DataHoraAbertura" HeaderText="Data/Hora" 
                                            SortExpression="DataHoraAbertura">
                                            <ItemStyle Width="120px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="des_unid_lotac" HeaderText="Unidade" 
                                            SortExpression="des_unid_lotac" >
                                            <ItemStyle Font-Size="8pt" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                                    CommandArgument='<%# Bind("IDChamado") %>' onclick="Button2_Click" 
                                                    style="font-family: Verdana; font-size: x-small" Text="Reclassificar" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Arquivos">
                                            <ItemTemplate>
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                    DataKeyNames="IDArquivo" DataSourceID="sdsAnexos" GridLines="None" 
                                                    ShowHeader="False" style="font-family: Verdana; font-size: x-small" 
                                                    Width="150px">
                                                    <Columns>
                                                        <asp:HyperLinkField DataNavigateUrlFields="Arquivo" DataTextField="Descricao" 
                                                            Target="_blank">
                                                            <ItemStyle Width="150px" />
                                                        </asp:HyperLinkField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sdsAnexos" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                                    SelectCommand="SELECT IDArquivo, Descricao, 'Anexos/' + Arquivo AS Arquivo, IDChamado, IDAcompanhamento FROM sosArquivo WHERE (IDChamado = @IDChamado)">
                                                    <SelectParameters>
                                                        <asp:Parameter Name="IDChamado" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="IDTecnico" HeaderText="IDTecnico" 
                                            SortExpression="IDTecnico" Visible="False" />
                                    </Columns>
                                    <PagerStyle BackColor="SteelBlue" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="SteelBlue" BorderColor="Gray" BorderStyle="Solid" 
                                        BorderWidth="1px" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                    <AlternatingRowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                                        BorderWidth="1px" ForeColor="#284775" />
                                </asp:GridView>
                                <asp:Timer ID="Timer2" runat="server">
                                </asp:Timer>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:SqlDataSource ID="sdsPainelSOS" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                            DeleteCommand="DELETE FROM [sosChamado] WHERE [IDChamado] = @IDChamado" 
                            InsertCommand="INSERT INTO [sosChamado] ([IDUnidade], [IDLotacao], [IDTecnico], [IDSolicitante], [Descricao], [Solucao], [DataHoraAbertura], [IDGrupoServico], [IDServico], [IDStatus], [DataHoraFechamentoUsuario]) VALUES (@IDUnidade, @IDLotacao, @IDTecnico, @IDSolicitante, @Descricao, @Solucao, @DataHoraAbertura, @IDGrupoServico, @IDServico, @IDStatus, @DataHoraFechamentoUsuario)" 
                            SelectCommand="SELECT DISTINCT sosChamado.IDChamado, '~/sos/fotos/' + CAST(sosChamado.IDTecnico AS varchar) + '.jpg' AS fotoTec, '~/sos/fotos/' + CAST(sosChamado.IDSolicitante AS varchar) + '.jpg' AS fotoSolic, sosChamado.IDUnidade, sosChamado.IDLotacao, sosChamado.IDTecnico, sosChamado.IDSolicitante, sosChamado.Descricao, sosChamado.Solucao, sosChamado.DataHoraAbertura, sosChamado.IDGrupoServico, sosChamado.IDServico,  CASE sosChamado.IDStatus WHEN 3 THEN 'False' WHEN 4 THEN 'False' WHEN 5 THEN 'False' ELSE 'True' END AS HabilitarTransf, sosChamado.IDStatus, sosChamado.DataHoraFechamentoUsuario, sosStatus.Status, sosGrupoServico.Nome AS nomeGrupoServico, sosServico.Nome AS nomeServico, viewSGT_RHFuncionario.nom_pessoa_fisic AS Tecnico, viewSGT_RHFuncionario_1.nom_pessoa_fisic AS Solicitante, viewSTG_RHUnidadeLotacao.des_unid_lotac, View_RHCargo.des_cargo AS cargo, sosChamado.Vnc, sosChamado.Telefone FROM View_RHCargo INNER JOIN viewSGT_RHFuncionario AS viewSGT_RHFuncionario_1 ON View_RHCargo.cdn_cargo_basic = viewSGT_RHFuncionario_1.cdn_cargo_basic AND View_RHCargo.cdn_niv_cargo = viewSGT_RHFuncionario_1.cdn_niv_cargo RIGHT OUTER JOIN viewSTG_RHUnidadeLotacao RIGHT OUTER JOIN sosChamado INNER JOIN sosStatus ON sosChamado.IDStatus = sosStatus.IDStatus INNER JOIN sosServico ON sosChamado.IDServico = sosServico.IDServico INNER JOIN sosGrupoServico ON sosChamado.IDGrupoServico = sosGrupoServico.IDGrupoServico ON viewSTG_RHUnidadeLotacao.id_unidade = CAST(sosChamado.IDUnidade AS nvarchar) LEFT OUTER JOIN viewSGT_RHFuncionario RIGHT OUTER JOIN sosTecnico ON viewSGT_RHFuncionario.cdn_funcionario = sosTecnico.IDTecnico ON sosChamado.IDTecnico = sosTecnico.IDTecnico AND sosChamado.IDTecnico = sosTecnico.IDTecnico ON viewSGT_RHFuncionario_1.cdn_funcionario = sosChamado.IDSolicitante WHERE (CAST(sosChamado.IDChamado AS VARCHAR) LIKE '%' + @IDChamado + '%') AND (sosChamado.Descricao LIKE '%' + @Descricao + '%') AND (CAST(sosChamado.IDGrupoServico AS VARCHAR) LIKE '%' + @IDGrupoServico + '%') AND (CAST(sosChamado.IDServico AS VARCHAR) LIKE @IDServico) AND (CAST(sosChamado.IDStatus AS varchar) LIKE '%' + @IDStatus + '%') AND (CAST(sosChamado.IDUnidade AS varchar) LIKE '%' + @IDUnidade + '%') AND (ISNULL(CAST(sosChamado.IDTecnico AS varchar), '') LIKE '%' + @IDTecnico + '%') AND (viewSGT_RHFuncionario_1.dat_desligto_func IS NULL) AND (sosChamado.DataHoraAbertura BETWEEN @dataInicial +' 00:00:00' AND @dataFinal + ' 23:59:59')
AND isnull(viewSGT_RHFuncionario.CDN_FUNCIONARIO,'') =(case when @bIDTecnico=0 then isnull(viewSGT_RHFuncionario.CDN_FUNCIONARIO,'') else @bIDTecnico end)
		AND viewSGT_RHFuncionario_1.nom_pessoa_fisic LIKE @solicitante + '%'	
 ORDER BY sosChamado.IDChamado DESC" 
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            UpdateCommand="UPDATE [sosChamado] SET [IDUnidade] = @IDUnidade, [IDLotacao] = @IDLotacao, [IDTecnico] = @IDTecnico, [IDSolicitante] = @IDSolicitante, [Descricao] = @Descricao, [Solucao] = @Solucao, [DataHoraAbertura] = @DataHoraAbertura, [IDGrupoServico] = @IDGrupoServico, [IDServico] = @IDServico, [IDStatus] = @IDStatus, [DataHoraFechamentoUsuario] = @DataHoraFechamentoUsuario WHERE [IDChamado] = @IDChamado">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtCodigoC" DefaultValue="%" Name="IDChamado" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtDescricaoC" DefaultValue="%" 
                                    Name="Descricao" PropertyName="Text" />
                                <asp:ControlParameter ControlID="ddlGrupoServicoC" DefaultValue="%" 
                                    Name="IDGrupoServico" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlServicoC" DefaultValue="%" Name="IDServico" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlStatusC" DefaultValue="%" Name="IDStatus" 
                                    PropertyName="SelectedValue" />
                                <asp:Parameter DefaultValue="%" Name="IDTecnico" />
                                <asp:Parameter DefaultValue="%" Name="IDUnidade" />
                                <asp:ControlParameter ControlID="txtDataInicial" DbType="DateTime" 
                                    DefaultValue="1900-01-01" Name="dataInicial" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtDataFinal" DbType="DateTime" 
                                    DefaultValue="2050-01-01" Name="dataFinal" PropertyName="Text" />
                                <asp:ControlParameter Name="bIDTecnico" ControlID="ddlTecnicoBusca" PropertyName="SelectedValue" DbType="Int32" />
                                <asp:ControlParameter Name="solicitante"  ControlID="txtSolicitante" PropertyName="Text" DbType="String" DefaultValue="%"  />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="IDChamado" Type="Int64" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="IDUnidade" Type="String" />
                                <asp:Parameter Name="IDLotacao" Type="String" />
                                <asp:Parameter Name="IDTecnico" Type="String" />
                                <asp:Parameter Name="IDSolicitante" Type="String" />
                                <asp:Parameter Name="Descricao" Type="String" />
                                <asp:Parameter Name="Solucao" Type="String" />
                                <asp:Parameter Name="DataHoraAbertura" Type="DateTime" />
                                <asp:Parameter Name="IDGrupoServico" Type="Int32" />
                                <asp:Parameter Name="IDServico" Type="Int32" />
                                <asp:Parameter Name="IDStatus" Type="Int32" />
                                <asp:Parameter Name="DataHoraFechamentoUsuario" Type="DateTime" />
                                <asp:Parameter Name="IDChamado" Type="Int64" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="IDUnidade" Type="String" />
                                <asp:Parameter Name="IDLotacao" Type="String" />
                                <asp:Parameter Name="IDTecnico" Type="String" />
                                <asp:Parameter Name="IDSolicitante" Type="String" />
                                <asp:Parameter Name="Descricao" Type="String" />
                                <asp:Parameter Name="Solucao" Type="String" />
                                <asp:Parameter Name="DataHoraAbertura" Type="DateTime" />
                                <asp:Parameter Name="IDGrupoServico" Type="Int32" />
                                <asp:Parameter Name="IDServico" Type="Int32" />
                                <asp:Parameter Name="IDStatus" Type="Int32" />
                                <asp:Parameter Name="DataHoraFechamentoUsuario" Type="DateTime" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <br />
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <span style="color: black; font-family: Arial; font-weight: bold;">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" 
                            Font-Size="Medium" Text="Acompanhamento"></asp:Label>
                        </span>
                        <br />
                        <table class="style14">
                            <tr>
                                <td class="style15">
                                    <asp:ImageButton ID="ImageButton8" runat="server" CausesValidation="False" 
                                        ImageUrl="~/Icones/voltar.jpg" />
                                </td>
                                <td valign="top">
                                    <asp:Label ID="Label6" runat="server" 
                                        style="font-family: Verdana; font-size: x-small" Text="Voltar para SOS"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="pnlAcp" runat="server">
                            <table class="style1">
                                <tr>
                                    <td class="style8">
                                        Código:</td>
                                    <td class="style16">
                                        <asp:Label ID="lblCodigo" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style8" valign="top">
                                        Texto:</td>
                                    <td class="style16" valign="top">
                                        <asp:TextBox ID="txtTexto" runat="server" Height="108px" TextMode="MultiLine" 
                                            Width="275px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtTexto" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                    <td valign="top">
                                        <asp:Panel ID="pnlAnexo" runat="server">
                                            <table class="style1">
                                                <tr>
                                                    <td class="style17">
                                                        Descrição:</td>
                                                    <td>
                                                        <asp:TextBox ID="txtDescricaoAcp" runat="server" 
                                                            style="font-family: Verdana; font-size: x-small" Width="217px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                            ControlToValidate="txtDescricaoAcp" ErrorMessage="*" ValidationGroup="sosanexo"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        Arquivo:</td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload2" runat="server" 
                                                            style="font-family: Verdana; font-size: x-small" />
                                                        &nbsp;
                                                        <asp:ImageButton ID="btnAdcionar" runat="server" 
                                                            ImageUrl="~/Icones/001_01.gif" style="width: 24px" 
                                                            ValidationGroup="sosanexo" />
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        &nbsp;</td>
                                                    <td>
                                                        <asp:SqlDataSource ID="sdsAnexosACP" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                                            InsertCommand="INSERT INTO sosArquivo(Descricao, Arquivo, IDAcompanhamento) VALUES (@Descricao, @Arquivo, @IDAcompanhamento)" 
                                                            
                                                            SelectCommand="SELECT IDArquivo, Descricao, 'Sos/Anexos/' + Arquivo AS Arquivo, IDChamado, IDAcompanhamento FROM sosArquivo WHERE (IDChamado IS NULL) AND (IDAcompanhamento IS NULL)">
                                                            <InsertParameters>
                                                                <asp:ControlParameter ControlID="txtDescricaoAcp" Name="Descricao" 
                                                                    PropertyName="Text" />
                                                                <asp:ControlParameter ControlID="FileUpload2" Name="Arquivo" 
                                                                    PropertyName="FileName" />
                                                                <asp:Parameter Name="IDAcompanhamento" />
                                                            </InsertParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style8" valign="top">
                                        Finalizar:</td>
                                    <td class="style16" valign="top">
                                        <asp:DropDownList ID="cboFinalizar" runat="server" 
                                            style="font-family: Verdana; font-size: x-small">
                                            <asp:ListItem Value="nao">Não</asp:ListItem>
                                            <asp:ListItem Value="sim">Sim</asp:ListItem>
                                            <asp:ListItem Value="cancel">Cancelamento</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td valign="top">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style8" valign="top">
                                        Transferir:</td>
                                    <td class="style16" valign="top">
                                        <asp:DropDownList ID="ddlTecnicos" runat="server" CssClass="style22" 
                                            DataSourceID="sdsTecnicos" DataTextField="nom_pessoa_fisic" 
                                            DataValueField="IDTecnico" style="font-size: x-small" Width="275px">
                                            <asp:ListItem>TESTE</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td valign="top">
                                        <asp:SqlDataSource ID="sdsTecnicos" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                            
                                            SelectCommand="SELECT sosTecnico.IDTecnico, viewSGT_RHFuncionario.nom_pessoa_fisic + ' (' + CAST((SELECT COUNT(*) AS Expr1 FROM sosChamado WHERE (IDTecnico = sosTecnico.IDTecnico) AND (IDStatus = 2)) AS varchar) + ')' AS nom_pessoa_fisic FROM sosTecnico INNER JOIN viewSGT_RHFuncionario ON sosTecnico.IDTecnico = viewSGT_RHFuncionario.cdn_funcionario UNION SELECT NULL AS Expr1, NULL AS Expr2 ORDER BY nom_pessoa_fisic">
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="sdsAlteraTecnico" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                            DeleteCommand="DELETE FROM [sosChamado] WHERE [IDChamado] = @IDChamado" 
                                            InsertCommand="INSERT INTO [sosChamado] ([IDUnidade], [IDLotacao], [IDTecnico], [IDSolicitante], [Descricao], [Solucao], [DataHoraAbertura], [IDGrupoServico], [IDServico], [IDStatus], [DataHoraFechamentoUsuario]) VALUES (@IDUnidade, @IDLotacao, @IDTecnico, @IDSolicitante, @Descricao, @Solucao, @DataHoraAbertura, @IDGrupoServico, @IDServico, @IDStatus, @DataHoraFechamentoUsuario)" 
                                            SelectCommand="SELECT * FROM [sosChamado]" 
                                            UpdateCommand="UPDATE sosChamado SET IDTecnico = @IDTecnico, IDStatus = @IDStatus WHERE (IDChamado = @IDChamado)">
                                            <DeleteParameters>
                                                <asp:Parameter Name="IDChamado" Type="Int64" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:SessionParameter Name="IDTecnico" SessionField="c_Matricula" />
                                                <asp:ControlParameter ControlID="lblCodigo" Name="IDChamado" 
                                                    PropertyName="Text" />
                                                <asp:Parameter DefaultValue="2" Name="IDStatus" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="IDUnidade" Type="Int32" />
                                                <asp:Parameter Name="IDLotacao" Type="Int32" />
                                                <asp:Parameter Name="IDTecnico" Type="Int32" />
                                                <asp:Parameter Name="IDSolicitante" Type="Int32" />
                                                <asp:Parameter Name="Descricao" Type="String" />
                                                <asp:Parameter Name="Solucao" Type="String" />
                                                <asp:Parameter Name="DataHoraAbertura" Type="DateTime" />
                                                <asp:Parameter Name="IDGrupoServico" Type="Int32" />
                                                <asp:Parameter Name="IDServico" Type="Int32" />
                                                <asp:Parameter Name="IDStatus" Type="Int32" />
                                                <asp:Parameter Name="DataHoraFechamentoUsuario" Type="DateTime" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style8" valign="top">
                                        &nbsp;</td>
                                    <td class="style16" valign="top">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton4" runat="server" 
                                            ImageUrl="~/Icones/001_03.gif" style="height: 24px" />
                                        &nbsp;
                                        <asp:ImageButton ID="btnCancelarAc" runat="server" CausesValidation="False" 
                                            ImageUrl="~/Icones/001_02.gif" />
                                    </td>
                                    <td valign="top">
                                        <asp:SqlDataSource ID="sdsTransferir" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                            DeleteCommand="DELETE FROM [sosChamado] WHERE [IDChamado] = @IDChamado" 
                                            InsertCommand="INSERT INTO [sosChamado] ([IDTecnico]) VALUES (@IDTecnico)" 
                                            SelectCommand="SELECT [IDChamado], [IDTecnico] FROM [sosChamado]" 
                                            
                                            UpdateCommand="UPDATE sosChamado SET IDTecnico = @IDTecnico, IDStatus = 2 WHERE (IDChamado = @IDChamado)">
                                            <DeleteParameters>
                                                <asp:Parameter Name="IDChamado" Type="Int64" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:ControlParameter ControlID="ddlTecnicos" Name="IDTecnico" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="lblCodigo" Name="IDChamado" 
                                                    PropertyName="Text" Type="Int64" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="IDTecnico" Type="Int32" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="grdAcompanhamento" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" BorderColor="Silver" 
                                    BorderStyle="Solid" BorderWidth="1px" CellPadding="2" 
                                    DataKeyNames="IDAcompanhamento" DataSourceID="sdsAcompanhamento" 
                                    Font-Names="Arial" Font-Size="Small" ForeColor="#333333" GridLines="None" 
                                    PageSize="20" 
                                    style="text-align: left; font-family: Verdana; font-size: x-small;" 
                                    Width="100%">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EmptyDataRowStyle BorderColor="White" BorderStyle="Solid" BorderWidth="1px" 
                                        ForeColor="Black" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EmptyDataTemplate>
                                        <br />
                                        Não existem Informações cadastradas.<br />
                                        <br />
                                    </EmptyDataTemplate>
                                    <EditRowStyle BackColor="#999999" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField DataField="Historico" HeaderText="Histórico" 
                                            SortExpression="Historico" />
                                        <asp:TemplateField HeaderText="Arquivos">
                                            <ItemTemplate>
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                                    DataKeyNames="IDArquivo" DataSourceID="sdsAnexos" GridLines="None" 
                                                    ShowHeader="False" style="font-family: Verdana; font-size: x-small">
                                                    <Columns>
                                                        <asp:HyperLinkField DataNavigateUrlFields="Arquivo" DataTextField="Descricao" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="sdsAnexos" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                                    SelectCommand="SELECT IDArquivo, Descricao, 'Anexos/' + Arquivo AS Arquivo, IDChamado, IDAcompanhamento FROM sosArquivo WHERE (IDAcompanhamento = @IDAcompanhamento)">
                                                    <SelectParameters>
                                                        <asp:Parameter Name="IDAcompanhamento" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Registrador" HeaderText="Registrado por:" 
                                            SortExpression="Registrador" />
                                        <asp:BoundField DataField="Tecnico" HeaderText="Técnico" 
                                            SortExpression="Tecnico" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" 
                                            SortExpression="Status" />
                                        <asp:BoundField DataField="DataHoraRegistro" HeaderText="Data/Hora" 
                                            SortExpression="DataHoraRegistro" />
                                    </Columns>
                                    <PagerStyle BackColor="SteelBlue" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="SteelBlue" BorderColor="Gray" BorderStyle="Solid" 
                                        BorderWidth="1px" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                                        BorderWidth="1px" ForeColor="#284775" />
                                </asp:GridView>
                                <br />
                                
                                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer_Tick">
                                </asp:Timer>
                                
                            </ContentTemplate>
                            
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            </Triggers>
                            
                        </asp:UpdatePanel>
                        <asp:SqlDataSource ID="sdsAcompanhamento" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                            DeleteCommand="DELETE FROM [sosAcompanhamento] WHERE [IDAcompanhamento] = @IDAcompanhamento" 
                            InsertCommand="INSERT INTO sosAcompanhamento(Historico, IDRegistrador, IDTecnico, DataHoraRegistro, IDChamado, IDStatus) VALUES (@Historico, @IDRegistrador, @IDTecnico, GETDATE(), @IDChamado, @IDStatus)" 
                            SelectCommand="SELECT sosAcompanhamento.IDAcompanhamento, sosAcompanhamento.Historico, sosAcompanhamento.IDRegistrador, sosAcompanhamento.IDTecnico, sosAcompanhamento.DataHoraRegistro, sosAcompanhamento.IDChamado, sosAcompanhamento.IDStatus, sosStatus.Status, viewSGT_RHFuncionario.nom_pessoa_fisic AS Registrador, viewSGT_RHFuncionario_1.nom_pessoa_fisic AS Tecnico FROM sosAcompanhamento INNER JOIN sosStatus ON sosAcompanhamento.IDStatus = sosStatus.IDStatus LEFT OUTER JOIN viewSGT_RHFuncionario AS viewSGT_RHFuncionario_1 ON sosAcompanhamento.IDTecnico = viewSGT_RHFuncionario_1.cdn_funcionario LEFT OUTER JOIN viewSGT_RHFuncionario ON sosAcompanhamento.IDRegistrador = viewSGT_RHFuncionario.cdn_funcionario WHERE (sosAcompanhamento.IDChamado = @IDChmado) AND (viewSGT_RHFuncionario_1.dat_desligto_func IS NULL) AND 
                                    (viewSGT_RHFuncionario.dat_desligto_func IS NULL)
                             ORDER BY sosAcompanhamento.IDAcompanhamento DESC" 
                            
                            UpdateCommand="UPDATE [sosAcompanhamento] SET [Historico] = @Historico, [IDRegistrador] = @IDRegistrador, [IDTecnico] = @IDTecnico, [DataHoraRegistro] = @DataHoraRegistro, [IDChamado] = @IDChamado, [IDStatus] = @IDStatus WHERE [IDAcompanhamento] = @IDAcompanhamento">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblCodigo" Name="IDChmado" 
                                    PropertyName="Text" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="IDAcompanhamento" Type="Int64" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Historico" Type="String" />
                                <asp:Parameter Name="IDRegistrador" Type="Int32" />
                                <asp:Parameter Name="IDTecnico" Type="Int32" />
                                <asp:Parameter Name="DataHoraRegistro" Type="DateTime" />
                                <asp:Parameter Name="IDChamado" Type="Int64" />
                                <asp:Parameter Name="IDStatus" Type="Int32" />
                                <asp:Parameter Name="IDAcompanhamento" Type="Int64" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtTexto" Name="Historico" PropertyName="Text" 
                                    Type="String" />
                                <asp:SessionParameter DefaultValue="" Name="IDRegistrador" 
                                    SessionField="c_matricula" Type="Int32" />
                                <asp:SessionParameter DefaultValue="" Name="IDTecnico" SessionField="IDTecnico" 
                                    Type="Int32" />
                                <asp:SessionParameter Name="IDStatus" SessionField="IDStatus" Type="Int32" 
                                    DefaultValue="" />
                                <asp:ControlParameter ControlID="lblCodigo" Name="IDChamado" 
                                    PropertyName="Text" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <br />
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        &nbsp;<table class="style14">
                            <tr>
                                <td class="style15">
                                    <asp:ImageButton ID="ImageButton7" runat="server" CausesValidation="False" 
                                        ImageUrl="~/Icones/voltar.jpg" />
                                </td>
                                <td valign="top">
                                    <asp:Label ID="Label5" runat="server" 
                                        style="font-family: Verdana; font-size: x-small" Text="Voltar para SOS"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table class="style1">
                            <tr>
                                <td class="style9">
                                    Código:</td>
                                <td class="style10">
                                    <asp:Label ID="lblCodigoE" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style9">
                                    Grupo de serviço:</td>
                                <td class="style10">
                                    <asp:DropDownList ID="ddlGrupoServico" runat="server" AutoPostBack="True" 
                                        DataSourceID="sdsGrupoServico" DataTextField="Nome" 
                                        DataValueField="IDGrupoServico" Width="200px" 
                                        style="font-family: Verdana; font-size: x-small">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style9">
                                    Serviço:</td>
                                <td class="style10">
                                    <asp:DropDownList ID="ddlServico" runat="server" DataSourceID="sdsServico" 
                                        DataTextField="Nome" DataValueField="IDServico" Width="200px" 
                                        style="font-family: Verdana; font-size: x-small">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style9" valign="top">
                                    Descrição:</td>
                                <td class="style10">
                                    <asp:TextBox ID="txtDescricao" runat="server" Height="216px" ReadOnly="True" 
                                        TextMode="MultiLine" Width="500px" 
                                        style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style9">
                                    &nbsp;</td>
                                <td class="style10">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style9">
                                    &nbsp;</td>
                                <td class="style10">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnResolver" runat="server" CausesValidation="False" 
                                        Text="Salvar" style="font-family: Verdana; font-size: x-small" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="btnRejeitar" runat="server" Text="Rejeitar" 
                                        style="font-family: Verdana; font-size: x-small" />
                                    <asp:SqlDataSource ID="sdsRejeitar" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                        SelectCommand="SELECT * FROM [sosChamado]" 
                                        UpdateCommand="UPDATE sosChamado SET IDStatus = @IDStatus WHERE (IDChamado = @IDChamado)">
                                        <UpdateParameters>
                                            <asp:Parameter DefaultValue="5" Name="IDStatus" />
                                            <asp:ControlParameter ControlID="lblCodigoE" DefaultValue="" Name="IDChamado" 
                                                PropertyName="Text" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style9">
                                    &nbsp;</td>
                                <td class="style10">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style9" valign="top">
                                    Justificativa:</td>
                                <td class="style10" valign="top">
                                    <asp:TextBox ID="txtJustificativa" runat="server" Height="216px" 
                                        TextMode="MultiLine" Width="500px" 
                                        style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                                </td>
                                <td valign="top">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="txtJustificativa" 
                                        ErrorMessage="Justificativa obrigatória para rejeição" 
                                        style="font-family: Verdana; font-size: x-small" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:SqlDataSource ID="sdsGrupoServico" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                            SelectCommand="SELECT * FROM [sosGrupoServico]
WHERE (Ativo=1)"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsServico" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                            
                            SelectCommand="SELECT IDServico, Nome, Descricao, IDGrupoServico FROM sosServico WHERE (IDGrupoServico = @IDGrupoChamado) and (Ativo=1)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlGrupoServico" Name="IDGrupoChamado" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsResolver" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                            DeleteCommand="DELETE FROM [sosChamado] WHERE [IDChamado] = @IDChamado" 
                            InsertCommand="INSERT INTO [sosChamado] ([IDUnidade], [IDLotacao], [IDTecnico], [IDSolicitante], [Descricao], [Solucao], [DataHoraAbertura], [IDGrupoServico], [IDServico], [IDStatus], [DataHoraFechamentoUsuario]) VALUES (@IDUnidade, @IDLotacao, @IDTecnico, @IDSolicitante, @Descricao, @Solucao, @DataHoraAbertura, @IDGrupoServico, @IDServico, @IDStatus, @DataHoraFechamentoUsuario)" 
                            SelectCommand="SELECT * FROM [sosChamado]" 
                            UpdateCommand="UPDATE sosChamado SET IDTecnico = @IDTecnico, IDGrupoServico = @IDGrupoServico, IDServico = @IDServico, IDStatus = @IDStatus WHERE (IDChamado = @IDChamado)">
                            <DeleteParameters>
                                <asp:Parameter Name="IDChamado" Type="Int64" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="IDTecnico" />
                                <asp:Parameter Name="IDGrupoServico" />
                                <asp:Parameter Name="IDServico" />
                                <asp:Parameter Name="IDStatus" />
                                <asp:Parameter Name="IDChamado" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="IDUnidade" Type="String" />
                                <asp:Parameter Name="IDLotacao" Type="String" />
                                <asp:Parameter Name="IDTecnico" Type="String" />
                                <asp:Parameter Name="IDSolicitante" Type="String" />
                                <asp:Parameter Name="Descricao" Type="String" />
                                <asp:Parameter Name="Solucao" Type="String" />
                                <asp:Parameter Name="DataHoraAbertura" Type="DateTime" />
                                <asp:Parameter Name="IDGrupoServico" Type="Int32" />
                                <asp:Parameter Name="IDServico" Type="Int32" />
                                <asp:Parameter Name="IDStatus" Type="Int32" />
                                <asp:Parameter Name="DataHoraFechamentoUsuario" Type="DateTime" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                        <br />
                    </asp:View>
                    <br />
                    <br />
                    
                </asp:MultiView>
                </div>
                <br />
                <br />
            </asp:View>
            <br />
            <br />
            <br />
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
