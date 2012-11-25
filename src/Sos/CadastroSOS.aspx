<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroSOS.aspx.vb" Inherits="Sos_CadastroSOS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Aba.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
            font-size: x-small;
            font-family: Verdana;
        }
        .style2
        {
            width: 101px;
        }
        .style3
        {
        }
        .style5
        {
            width: 106px;
        }
        .style6
        {
            width: 145px;
        }
        .style7
        {
            width: 204px;
        }
        .style8
        {
            width: 48px;
        }
        .style9
        {
            height: 21px;
            text-align: left;
        }
        .style10
        {
            width: 315px;
            font-size:x-small ;
            
        }
        .style11
        {
            width: 285px;
        }
        .style12
        {
            width: 71px;
        }
        .style13
        {
            width: 64px;
        }
        .style14
        {
            width: 100%;
        }
        .style15
        {
            width: 23px;
        }
        </style>
        
        <script type="text/javascript" >
            function mascara(o, f) {
                v_obj = o
                v_fun = f
                setTimeout("execmascara()", 1)
            }

            function execmascara() {
                v_obj.value = v_fun(v_obj.value)
            }

            function telefone(v) {
                v = v.replace(/\D/g, "")                 //Remove tudo o que não é dígito
                v = v.replace(/^(\d\d)(\d)/g, "($1) $2") //Coloca parênteses em volta dos dois primeiros dígitos
                v = v.replace(/(\d{4})(\d)/, "$1-$2")    //Coloca hífen entre o quarto e o quinto dígitos
                return v
            }
  
        </script>

    
</head>
<body>
    <form id="form1" runat="server">
    <div id="conteudo">
    
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <span style="color: black; font-family: Arial; font-weight: bold;">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="Medium" Text="SOS"></asp:Label>
                
                <br />
                
                </span>
                
                <asp:Panel ID="Panel1" runat="server" GroupingText="Consulta" Width="676px" 
                    style="font-family: Verdana; font-size: x-small">
                    <table class="style1">
                        <tr>
                            <td class="style13">
                                Codigo:</td>
                            <td class="style6">
                                <asp:TextBox ID="txtCodigoC" runat="server" 
                                    style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                            </td>
                            <td class="style5">
                                Grupo de Serviço:</td>
                            <td class="style7">
                                <asp:DropDownList ID="ddlGrupoServicoC" runat="server" Width="200px" 
                                    DataSourceID="sdsGrupoServicoC" DataTextField="Nome" 
                                    DataValueField="IDGrupoServico" 
                                    style="font-family: Verdana; font-size: x-small">
                                    <asp:ListItem Value="1">ddsaads</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td rowspan="3" valign="top">
                                <asp:ImageButton ID="btnFiltrar" runat="server" 
                                    ImageUrl="~/Icones/botao_filtrar.png" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                Descrição:</td>
                            <td class="style6">
                                <asp:TextBox ID="txtDescricaoC" runat="server" 
                                    style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                            </td>
                            <td class="style5">
                                Serviço:</td>
                            <td class="style7">
                                <asp:DropDownList ID="ddlServicoC" runat="server" Width="200px" 
                                    DataSourceID="sdsServicoC" DataTextField="Nome" DataValueField="IDServico" 
                                    style="font-family: Verdana; font-size: x-small">
                                    <asp:ListItem Value="1">assa</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                SOS:</td>
                            <td class="style6">
                                <asp:DropDownList ID="ddlSOSC" runat="server" Width="128px" 
                                    style="font-family: Verdana; font-size: x-small">
                                    <asp:ListItem Value="0">Próprias</asp:ListItem>
                                    <asp:ListItem Value="1">Unidade</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style5">
                                Status:</td>
                            <td class="style7">
                                <asp:DropDownList ID="ddlStatusC" runat="server" DataSourceID="sdsStatus" 
                                    DataTextField="Status" DataValueField="IDStatus" Width="200px" 
                                    style="font-family: Verdana; font-size: x-small">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
                <asp:SqlDataSource ID="sdsChamado" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    
                    
                    
                    
                    
                    
                    SelectCommand="SELECT DISTINCT sosChamado.IDChamado, sosChamado.IDUnidade, sosChamado.IDLotacao, sosChamado.IDTecnico, sosChamado.IDSolicitante, '~/sos/Fotos/' + CAST(sosChamado.IDSolicitante AS varchar) + '.jpg' AS fotoSolic, '~/sos/Fotos/' + CAST(sosChamado.IDTecnico AS varchar) + '.jpg' AS fotoTec, sosChamado.Solucao, sosChamado.DataHoraAbertura, sosChamado.IDGrupoServico, sosChamado.IDServico, sosChamado.IDStatus, CASE sosChamado.IDStatus WHEN 1 THEN 'True' ELSE 'False' END AS HabilitaStatus, CASE sosChamado.IDStatus WHEN 1 THEN '~/Icones/editar.jpg' ELSE '~/Icones/grid_alterar.gif' END AS imgAlterar, CASE sosChamado.IDStatus WHEN 1 THEN 'FALSE' ELSE 'TRUE' END AS fotoVis, sosGrupoServico.Nome AS nomeGrupoServico, sosServico.Nome AS nomeServico, sosChamado.Descricao, sosStatus.Status, viewSGT_RHFuncionario.nom_pessoa_fisic AS Tecnico, viewSGT_RHFuncionario_1.nom_pessoa_fisic AS Solicitante FROM sosChamado INNER JOIN sosGrupoServico ON sosChamado.IDGrupoServico = sosGrupoServico.IDGrupoServico INNER JOIN sosServico ON sosChamado.IDServico = sosServico.IDServico INNER JOIN sosStatus ON sosChamado.IDStatus = sosStatus.IDStatus LEFT OUTER JOIN viewSGT_RHFuncionario AS viewSGT_RHFuncionario_1 ON sosChamado.IDSolicitante = viewSGT_RHFuncionario_1.cdn_funcionario LEFT OUTER JOIN viewSGT_RHFuncionario ON sosChamado.IDTecnico = viewSGT_RHFuncionario.cdn_funcionario WHERE (sosChamado.Descricao LIKE '%' + @Descricao + '%') AND (CAST(sosChamado.IDServico AS VARCHAR) LIKE '%' + @IDServico + '%') AND (CAST(sosChamado.IDChamado AS VARCHAR) LIKE '%' + @IDChamado + '%') AND (CAST(sosChamado.IDStatus AS VARCHAR) LIKE '%' + @Status + '%') AND (CAST(sosChamado.IDGrupoServico AS varchar) LIKE '%' + @IDGrupoServico + '%') AND (CAST(sosChamado.IDUnidade AS varchar) LIKE '%' + @IDUnidade + '%') AND (CAST(sosChamado.IDSolicitante AS varchar) LIKE '%' + @IDSolicitante + '%') ORDER BY sosChamado.IDChamado DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtDescricaoC" DefaultValue="%" 
                            Name="Descricao" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlServicoC" DefaultValue="%" Name="IDServico" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtCodigoC" DefaultValue="%" Name="IDChamado" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlStatusC" DefaultValue="%" Name="Status" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlGrupoServicoC" DefaultValue="%" 
                            Name="IDGrupoServico" PropertyName="SelectedValue" />
                        <asp:Parameter DefaultValue="%" Name="IDUnidade" />
                        <asp:Parameter DefaultValue="%" Name="IDSolicitante" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsGrupoServicoC" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" SelectCommand="SELECT IDGrupoServico, Nome, Descricao FROM sosGrupoServico 
WHERE (Ativo=1) and (idgruposervico &lt;&gt; (case when (SELECT left(des_cargo,3) as cargo FROM dbo.SGT_RHFuncionarioAtivo INNER JOIN View_RHCargo ON dbo.SGT_RHFuncionarioAtivo.cdn_cargo_basic = View_RHCargo.cdn_cargo_basic AND dbo.SGT_RHFuncionarioAtivo.cdn_niv_cargo = View_RHCargo.cdn_niv_cargo WHERE     (dbo.SGT_RHFuncionarioAtivo.cdn_funcionario =@matricula ))='GER' then 0 else 5 end ) )
UNION SELECT NULL, 'TODOS' ,'' 
">
                    <SelectParameters>
                        <asp:SessionParameter Name="matricula" SessionField="c_Matricula" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsServicoC" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" SelectCommand="SELECT     IDServico, Nome, Descricao, IDGrupoServico
FROM         sosServico
WHERE (Ativo=1) and (idservico &lt;&gt; (case when @matricula in (10830,6115,2610,2473) then 0 else 33 end ) )
union
SELECT NULL,'TODOS','',''">
<SelectParameters>
                        <asp:SessionParameter Name="matricula" SessionField="c_Matricula" />
                    </SelectParameters>
</asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" SelectCommand="SELECT IDStatus, Status FROM sosStatus
UNION 
SELECT NULL , 'TODOS' "></asp:SqlDataSource>
                <br />
                <asp:Menu ID="tabMenu" runat="server" Orientation="Horizontal" 
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
                        <asp:View ID="View3" runat="server">
                            &nbsp;&nbsp;<br />
                            &nbsp;&nbsp;
                            <asp:Button ID="Button1" runat="server" Text="Novo" 
                                style="font-family: Verdana; font-size: x-small; height: 20px;" />
                            <br />
                            <br />
                            <asp:Label ID="lblErro" runat="server" Font-Names="Arial" Font-Size="Small" 
                                ForeColor="Red"></asp:Label>
                            <asp:GridView ID="grdSOS" runat="server" AllowPaging="True" AllowSorting="True" 
                                AutoGenerateColumns="False" BorderColor="Silver" BorderStyle="Solid" 
                                BorderWidth="1px" CellPadding="2" DataKeyNames="IDChamado,IDStatus,IDTecnico" 
                                DataSourceID="sdsChamado" Font-Names="Arial" Font-Size="Small" 
                                ForeColor="#333333" GridLines="None" PageSize="15" style="text-align: left; font-family: Verdana; font-size: x-small;" 
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
                                            <asp:ImageButton ID="btnSelecionar" runat="server" CommandName="Select" 
                                                ImageUrl="~/Icones/grid_selecionar.gif" />
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IDChamado" HeaderText="Código" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="IDChamado" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="30px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Descricao" HeaderText="Descrição" 
                                        SortExpression="Descricao" >
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DataHoraAbertura" HeaderText="Data/Hora" 
                                        SortExpression="DataHoraAbertura" >
                                        <ItemStyle Width="120px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nomeServico" HeaderText="Serviço" 
                                        SortExpression="nomeServico" />
                                    <asp:TemplateField HeaderText="Solicitante">
                                        <ItemTemplate>
                                            <table class="style14">
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="Image2" runat="server" AlternateText="Sem foto" Height="60px" 
                                                            ImageUrl='<%# Bind("fotoSolic") %>' Width="45px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label9" runat="server" 
                                                            style="font-family: Verdana; font-size: x-small" 
                                                            Text='<%# Bind("Solicitante") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Técnico">
                                        <ItemTemplate>
                                            <table class="style14">
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="Image1" runat="server" AlternateText="Sem foto" Height="60px" 
                                                            ImageUrl='<%# Bind("fotoTec") %>' Width="45px" 
                                                            Visible='<%# Bind("fotoVis") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label8" runat="server" 
                                                            style="font-family: Verdana; font-size: x-small" Text='<%# Bind("Tecnico") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Status" HeaderText="Status" 
                                        SortExpression="Status" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                                CommandArgument='<%# Bind("IDChamado") %>' 
                                                Enabled='<%# Bind("HabilitaStatus") %>' ImageUrl='<%# Bind("imgAlterar") %>' 
                                                onclick="ImageButton1_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Arquivos">
                                        <ItemTemplate>
                                            <asp:GridView ID="grdAnexos" runat="server" AutoGenerateColumns="False" 
                                                DataKeyNames="IDArquivo" DataSourceID="sdsArquivosLinha" GridLines="None" 
                                                ShowHeader="False" Width="100px" 
                                                style="font-family: Verdana; font-size: x-small">
                                                <Columns>
                                                    <asp:HyperLinkField DataTextField="Descricao" DataNavigateUrlFields="arquivo" >
                                                        <ItemStyle Width="150px" />
                                                    </asp:HyperLinkField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="sdsArquivosLinha" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                                
                                                
                                                SelectCommand="SELECT IDArquivo, Descricao, 'Anexos/' + Arquivo AS Arquivo, IDChamado, IDAcompanhamento FROM sosArquivo WHERE (IDChamado = @IDChamado)">
                                                <SelectParameters>
                                                    <asp:Parameter Name="IDChamado" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </ItemTemplate>
                                        <ItemStyle Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton10" runat="server" 
                                                CommandArgument='<%# Bind("IDChamado") %>' ImageUrl="~/Icones/excluir.png" 
                                                onclick="ImageButton10_Click" Visible='<%# Bind("HabilitaStatus") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="SteelBlue" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="SteelBlue" BorderColor="Gray" BorderStyle="Solid" 
                                    BorderWidth="1px" Font-Bold="True" ForeColor="White" 
                                    HorizontalAlign="Left" />
                                <AlternatingRowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                                    BorderWidth="1px" ForeColor="#284775" />
                            </asp:GridView>
                            <br />
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <span style="color: black; font-family: Arial; font-weight: bold;">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" 
                                Font-Size="Medium" Text="Acompanhamento"></asp:Label>
                            </span>
                            <br />
                            <br />
                            <asp:Panel ID="pnlACP" runat="server">
                                <table class="style1">
                                    <tr>
                                        <td class="style8">
                                            Código:</td>
                                        <td class="style11">
                                            <asp:Label ID="lblCodigo" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style8" valign="top">
                                            Texto:</td>
                                        <td class="style11" valign="top">
                                            <asp:TextBox ID="txtTexto" runat="server" Height="108px" TextMode="MultiLine" 
                                                Width="275px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="txtTexto" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                        <td valign="top">
                                            <asp:Panel ID="pnlAnexo" runat="server">
                                                <table class="style1">
                                                    <tr>
                                                        <td class="style12">
                                                            Descrição:</td>
                                                        <td>
                                                            <asp:TextBox ID="txtDescricaoAcp" runat="server" Width="217px" 
                                                                style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            Arquivo:</td>
                                                        <td>
                                                            <asp:FileUpload ID="FileUpload2" runat="server" 
                                                                style="font-family: Verdana; font-size: x-small" />
                                                            &nbsp;
                                                            <asp:ImageButton ID="btnAdcionar" runat="server" CausesValidation="False" 
                                                                ImageUrl="~/Icones/001_01.gif" />
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style12">
                                                            &nbsp;</td>
                                                        <td>
                                                            <asp:SqlDataSource ID="sdsAnexosAcp" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                                                DeleteCommand="DELETE FROM sosArquivo WHERE (IDArquivo = @IDArquivo)" 
                                                                InsertCommand="INSERT INTO sosArquivo(Descricao, Arquivo, IDAcompanhamento) VALUES (@Descricao, @Arquivo, @IDAcompanhamento)" 
                                                                
                                                                SelectCommand="SELECT IDArquivo, Descricao, 'Sos/Anexos/' + Arquivo AS Arquivo, IDChamado, IDAcompanhamento FROM sosArquivo WHERE (IDChamado IS NULL) AND (IDAcompanhamento IS NULL)">
                                                                <DeleteParameters>
                                                                    <asp:Parameter Name="IDArquivo" />
                                                                </DeleteParameters>
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
                                            &nbsp;</td>
                                        <td class="style11" valign="top">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:ImageButton ID="ImageButton4" runat="server" 
                                                ImageUrl="~/Icones/001_03.gif" />
                                            &nbsp;
                                            <asp:ImageButton ID="btnCancelarAc" runat="server" CausesValidation="False" 
                                                ImageUrl="~/Icones/001_02.gif" />
                                        </td>
                                        <td valign="top">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <br />
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:GridView ID="grdAcompanhamento" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" BorderColor="Silver" 
                                        BorderStyle="Solid" BorderWidth="1px" CellPadding="2" 
                                        DataKeyNames="IDAcompanhamento" DataSourceID="sdsAcompanhamento" 
                                        Font-Names="Arial" Font-Size="Small" ForeColor="#333333" GridLines="None" 
                                        PageSize="20" 
                                        style="text-align: left; font-family: Verdana; font-size: x-small;" 
                                        Width="1048px">
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
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                        DataKeyNames="IDArquivo" DataSourceID="sdsAnexosLinhaACP" GridLines="None" 
                                                        ShowHeader="False" style="font-family: Verdana; font-size: x-small" 
                                                        Width="150px">
                                                        <Columns>
                                                            <asp:HyperLinkField DataNavigateUrlFields="Arquivo" DataTextField="Descricao" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="sdsAnexosLinhaACP" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                                        
                                                        SelectCommand="SELECT IDArquivo, Descricao, 'Anexos/' + Arquivo AS Arquivo, IDChamado, IDAcompanhamento FROM sosArquivo WHERE (IDAcompanhamento = @IDAcompanhamento)">
                                                        <SelectParameters>
                                                            <asp:Parameter Name="IDAcompanhamento" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="registrador" HeaderText="Registrado por:" 
                                                SortExpression="registrador" />
                                            <asp:BoundField DataField="Tecnico" HeaderText="Técnico" 
                                                SortExpression="Tecnico" />
                                            <asp:BoundField DataField="Status" HeaderText="Status" 
                                                SortExpression="Status" />
                                            <asp:BoundField DataField="DataHoraRegistro" HeaderText="Data/Hora" 
                                                SortExpression="DataHoraRegistro" />
                                        </Columns>
                                        <PagerStyle BackColor="SteelBlue" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="SteelBlue" BorderColor="Gray" BorderStyle="Solid" 
                                            BorderWidth="1px" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                        <AlternatingRowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                                            BorderWidth="1px" ForeColor="#284775" />
                                    </asp:GridView>
                                    <asp:Timer ID="Timer1" runat="server" Interval="1000">
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
                                SelectCommand="SELECT sosAcompanhamento.IDAcompanhamento, sosAcompanhamento.Historico, sosAcompanhamento.IDRegistrador, sosAcompanhamento.IDTecnico, sosAcompanhamento.DataHoraRegistro, sosAcompanhamento.IDChamado, sosAcompanhamento.IDStatus, sosStatus.Status, viewSGT_RHFuncionario.nom_pessoa_fisic AS Tecnico, viewSGT_RHFuncionario_1.nom_pessoa_fisic AS registrador FROM sosAcompanhamento INNER JOIN sosStatus ON sosAcompanhamento.IDStatus = sosStatus.IDStatus LEFT OUTER JOIN viewSGT_RHFuncionario AS viewSGT_RHFuncionario_1 ON sosAcompanhamento.IDRegistrador = viewSGT_RHFuncionario_1.cdn_funcionario LEFT OUTER JOIN viewSGT_RHFuncionario ON sosAcompanhamento.IDTecnico = viewSGT_RHFuncionario.cdn_funcionario WHERE (sosAcompanhamento.IDChamado = @IDChmado) AND (viewSGT_RHFuncionario_1.dat_desligto_func IS NULL) AND 
        		              (viewSGT_RHFuncionario.dat_desligto_func IS NULL)
				 ORDER BY sosAcompanhamento.DataHoraRegistro DESC" 
                                
                                
                                
                                UpdateCommand="UPDATE [sosAcompanhamento] SET [Historico] = @Historico, [IDRegistrador] = @IDRegistrador, [IDTecnico] = @IDTecnico, [DataHoraRegistro] = @DataHoraRegistro, [IDChamado] = @IDChamado, [IDStatus] = @IDStatus WHERE [IDAcompanhamento] = @IDAcompanhamento">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="grdSOS" Name="IDChmado" 
                                        PropertyName="SelectedValue" />
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
                                        SessionField="c_Matricula" Type="Int32" />
                                    <asp:SessionParameter DefaultValue="NULL" Name="IDTecnico" 
                                        SessionField="IDTecnico" Type="Int32" />
                                    <asp:ControlParameter ControlID="grdSOS" Name="IDChamado" 
                                        PropertyName="SelectedValue" Type="Int64" />
                                    <asp:SessionParameter Name="IDStatus" SessionField="IDStatus" Type="Int32" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </asp:View>
                    </asp:MultiView>
                </div>
                <br />
                <br />
                <br />
            </asp:View>
            <asp:View ID="View4" runat="server">
                <span style="color: black; font-family: Arial; font-weight: bold;">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="Medium" Text="Cadastro SOS"></asp:Label>
                <br />
                </span>
                <asp:Menu ID="tabMenu2" runat="server" Orientation="Horizontal" 
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
                        <asp:MenuItem Selected="True" Text="Cadastro SOS" Value="0"></asp:MenuItem>
                        <asp:MenuItem Enabled="False" Text="Anexo" Value="1"></asp:MenuItem>
                    </Items>
                    
                </asp:Menu>
                <div class="conteudo">
                <asp:MultiView ID="MultiView3" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View6" runat="server">
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
                        <asp:Panel ID="Panel4" runat="server">
                            <table class="style1">
                                <tr>
                                    <td class="style2">
                                        &nbsp;</td>
                                    <td class="style10">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;</td>
                                    <td class="style10">
                                        <asp:Label ID="lblSOS" runat="server" Font-Names="Arial" Font-Size="Small" 
                                            ForeColor="Red" style="font-family: Verdana; font-size: x-small"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;</td>
                                    <td class="style10">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        Grupo Serviço:</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="cboIDGrupoServico" runat="server" AutoPostBack="True" 
                                            DataSourceID="sdsGrupoServico" DataTextField="Nome" 
                                            DataValueField="IDGrupoServico" Width="200px" 
                                            style="font-family: Verdana; font-size: x-small">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        <asp:Label ID="lblservico" runat="server" Text="Serviço:"></asp:Label>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="cboIDServico" runat="server" DataSourceID="sdsServico" 
                                            DataTextField="Nome" DataValueField="IDServico" Width="200px" 
                                            style="font-family: Verdana; font-size: x-small">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="cboIDServico" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        VNC:</td>
                                    <td class="style10">
                                        <asp:TextBox ID="txtVNC" style="font-family: Verdana; font-size: x-small" 
                                            runat="server" Width="200px" MaxLength="15"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        Telefone:</td>
                                    <td class="style10">
                                        <asp:TextBox ID="txttelefone" style="font-family: Verdana; font-size: x-small" onkeypress="mascara(this,telefone)" MaxLength="14"  runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2" valign="top">
                                        Descrição:</td>
                                    <td class="style10" valign="top">
                                        <asp:TextBox ID="txtDescricao" runat="server" Height="216px" 
                                            style="font-family: Verdana; font-size: x-small" TextMode="MultiLine" 
                                            Width="500px"></asp:TextBox>
                                    </td>
                                    <td valign="top">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txtDescricao" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;</td>
                                    <td class="style10">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;</td>
                                    <td class="style10">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ID="btnIncluir" runat="server" CommandName="Incluir" 
                                            ImageUrl="~/Icones/001_03.gif" style="width: 24px" ToolTip="Salvar" />
                                        &nbsp;&nbsp;
                                        <asp:ImageButton ID="btnCancelar" runat="server" CausesValidation="False" 
                                            ImageUrl="~/Icones/001_02.gif" ToolTip="Cancelar" />
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;</td>
                                    <td class="style10">
                                        <asp:SqlDataSource ID="sdsChamadoEdt" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                            DeleteCommand="DELETE FROM [sosChamado] WHERE [IDChamado] = @IDChamado" 
                                            InsertCommand="INSERT INTO [sosChamado] ([IDUnidade], [IDLotacao], [IDTecnico], [IDSolicitante], [Descricao], [Solucao], [DataHoraAbertura], [IDGrupoServico], [IDServico], [IDStatus], [DataHoraFechamentoUsuario]) VALUES (@IDUnidade, @IDLotacao, @IDTecnico, @IDSolicitante, @Descricao, @Solucao, @DataHoraAbertura, @IDGrupoServico, @IDServico, @IDStatus, @DataHoraFechamentoUsuario)" 
                                            SelectCommand="SELECT * FROM [sosChamado]" 
                                            UpdateCommand="UPDATE [sosChamado] SET [IDUnidade] = @IDUnidade, [IDLotacao] = @IDLotacao, [IDTecnico] = @IDTecnico, [IDSolicitante] = @IDSolicitante, [Descricao] = @Descricao, [Solucao] = @Solucao, [DataHoraAbertura] = @DataHoraAbertura, [IDGrupoServico] = @IDGrupoServico, [IDServico] = @IDServico, [IDStatus] = @IDStatus, [DataHoraFechamentoUsuario] = @DataHoraFechamentoUsuario WHERE [IDChamado] = @IDChamado">
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
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;</td>
                                    <td class="style3" colspan="2">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="View7" runat="server">
                        <table class="style14">
                            <tr>
                                <td class="style15">
                                    <asp:ImageButton ID="ImageButton9" runat="server" CausesValidation="False" 
                                        ImageUrl="~/Icones/voltar.jpg" />
                                </td>
                                <td valign="top">
                                    <asp:Label ID="Label7" runat="server" 
                                        style="font-family: Verdana; font-size: x-small" Text="Voltar para SOS"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Panel2" runat="server" Height="410px" Width="532px">
                            <table class="style1">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style9" colspan="2">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        Descrição:</td>
                                    <td>
                                        <asp:TextBox ID="txtDescricaoArq" runat="server" Width="217px" 
                                            style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txtDescricaoArq" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Arquivo:</td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" 
                                            style="font-family: Verdana; font-size: x-small" />
                                        &nbsp;<asp:ImageButton ID="ImageButton5" runat="server" 
                                            ImageUrl="~/Icones/001_01.gif" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="FileUpload1" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:GridView ID="grdArquivo" runat="server" AutoGenerateColumns="False" 
                                            DataKeyNames="IDArquivo" DataSourceID="sdsArquivo" GridLines="None">
                                            <Columns>
                                                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                                                    DeleteText="Excluir" ShowDeleteButton="True" />
                                                <asp:TemplateField HeaderText="Descrição">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Descricao") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:HyperLinkField DataTextField="Arquivo" 
                                                    DataTextFormatString="&lt;a href=Anexos/{0}&gt;Download&lt;/a&gt;" 
                                                    HeaderText="Arquivo" />
                                                <asp:TemplateField></asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="sdsArquivo" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                                            DeleteCommand="DELETE FROM [sosArquivo] WHERE [IDArquivo] = @IDArquivo" 
                                            InsertCommand="INSERT INTO sosArquivo(Descricao, Arquivo, IDChamado) VALUES (@Descricao, @Arquivo, @IDChamado)" 
                                            SelectCommand="SELECT IDArquivo, Descricao,Arquivo, IDChamado, IDAcompanhamento FROM sosArquivo WHERE (cast(IDChamado as varchar) like @IDChamado)" 
                                            UpdateCommand="UPDATE sosArquivo SET IDChamado = @IDChamado WHERE (IDArquivo = @IDArquivo)">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="%" Name="IDChamado" 
                                                    SessionField="SIDChamado" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="IDArquivo" Type="Int64" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="IDChamado" />
                                                <asp:Parameter Name="IDArquivo" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="txtDescricaoArq" Name="Descricao" 
                                                    PropertyName="Text" Type="String" />
                                                <asp:ControlParameter ControlID="FileUpload1" Name="Arquivo" 
                                                    PropertyName="FileName" Type="String" />
                                                <asp:SessionParameter DefaultValue="" Name="IDChamado" 
                                                    SessionField="IDUltimoChamado" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="lblErroArq" runat="server" Font-Names="Arial" Font-Size="Small" 
                                            ForeColor="Red" style="font-family: Verdana; font-size: x-small"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:View>
                </asp:MultiView>
                </div>
                <br />
                <table class="style1">
                    <tr>
                        <td valign="top">
                            &nbsp;</td>
                        <td valign="top">
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:SqlDataSource ID="sdsChamadoInc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    DeleteCommand="DELETE FROM [sosChamado] WHERE [IDChamado] = @IDChamado" 
                    InsertCommand="INSERT INTO [sosChamado] ([IDChamado], [IDUnidade], [IDLotacao], [IDTecnico], [IDSolicitante], [Solucao], [DataHoraAbertura], [IDGrupoServico], [IDServico]) VALUES (@IDChamado, @IDUnidade, @IDLotacao, @IDTecnico, @IDSolicitante, @Solucao, @DataHoraAbertura, @IDGrupoServico, @IDServico)" 
                    SelectCommand="SELECT * FROM [sosChamado]" 
                    
                    UpdateCommand="UPDATE sosChamado SET IDGrupoServico = @IDGrupoServico, IDServico = @IDServico, Descricao = @Descricao WHERE (IDChamado = @IDChamado)">
                    <DeleteParameters>
                        <asp:Parameter Name="IDChamado" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="cboIDGrupoServico" Name="IDGrupoServico" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="cboIDServico" Name="IDServico" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtDescricao" DefaultValue="" Name="Descricao" 
                            PropertyName="Text" />
                        <asp:SessionParameter Name="IDChamado" SessionField="SIDChamado" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IDChamado" Type="Int64" />
                        <asp:Parameter Name="IDUnidade" Type="String" />
                        <asp:Parameter Name="IDLotacao" Type="String" />
                        <asp:Parameter Name="IDTecnico" Type="String" />
                        <asp:Parameter Name="IDSolicitante" Type="String" />
                        <asp:Parameter Name="Solucao" Type="String" />
                        <asp:Parameter Name="DataHoraAbertura" Type="DateTime" />
                        <asp:Parameter Name="IDGrupoServico" Type="Int32" />
                        <asp:Parameter Name="IDServico" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="sdsGrupoServico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    SelectCommand="SELECT IDGrupoServico, Nome, Descricao FROM sosGrupoServico 
WHERE (Ativo=1) and (idgruposervico &lt;&gt; (case when (SELECT left(des_cargo,3) as cargo FROM dbo.SGT_RHFuncionarioAtivo INNER JOIN View_RHCargo ON dbo.SGT_RHFuncionarioAtivo.cdn_cargo_basic = View_RHCargo.cdn_cargo_basic AND dbo.SGT_RHFuncionarioAtivo.cdn_niv_cargo = View_RHCargo.cdn_niv_cargo WHERE     (dbo.SGT_RHFuncionarioAtivo.cdn_funcionario =@matricula ))='GER' then 0 else 5 end ) )
UNION SELECT '0', 'SELECIONE UM GRUPO' ,'' ">
                    <SelectParameters>
                        <asp:SessionParameter Name="matricula" SessionField="c_Matricula" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsServico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    
                    SelectCommand="SELECT IDServico, Nome, Descricao, IDGrupoServico FROM sosServico WHERE (IDGrupoServico = @IDGrupoServico) and (Ativo=1)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboIDGrupoServico" Name="IDGrupoServico" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <br />
            <br />
            <br />
            <br />
            
        </asp:MultiView>
        <br />
        <br />
    
        <br />
    
    </div>
    </form>
</body>
</html>
