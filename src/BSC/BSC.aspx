<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BSC.aspx.vb" Inherits="BSC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<header("Content-Type: text/html; charset=iso-8859-1");>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<cfcontent type="text/html; charset=iso-8859-1"><html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {            margin-left: 40px;
        }
        .style3
        {
            height: 23px;
        }
        .style5
        {}
        .style8
        {
            width: 157px;
        }
        .style6
        {
            width: 452px;
        }
        .style4
        {
            width: 205px;
        }
        .style10
        {
            width: 373px;
        }
        .style11
        {
            width: 174px;
        }
        .style12
        {
            height: 23px;
            width: 157px;
        }
        .style13
        {
            width: 199px;
        }
        .style14
        {
            height: 23px;
            width: 115px;
        }
        .style15
        {
            width: 452px;
            height: 47px;
        }
        .style16
        {
            height: 47px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Menu ID="Menu1" runat="server" BackColor="#F0FFFE" Height="16px" 
                    Orientation="Horizontal" Width="857px">
                    <Items>
                        <asp:MenuItem Text="Visão" Value="1" Selected="True" 
                            ToolTip="Cadastro de Visão"></asp:MenuItem>
                        <asp:MenuItem Text="Grupo Financeiro" ToolTip="Cadastro de Grupo Financeiro" 
                            Value="4"></asp:MenuItem>
                        <asp:MenuItem Text="Visão x Grupo Financeiro" Value="2" 
                            ToolTip="Cadastro de Visão x Grupo Financeiro"></asp:MenuItem>
                        <asp:MenuItem Text="Grupo Financeiro x Conta x CC" Value="3" 
                            ToolTip="Grupo Financeiro x Conta x CC"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </td>
        </tr>
        </table>
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:MultiView ID="MtvVisao" runat="server" EnableTheming="True" 
                    ActiveViewIndex="1">
                    <asp:View ID="ViewIncluirVisao" runat="server">
                        <table class="style1">
                            <tr>
                                <td class="style12">
                                    <asp:Label ID="LblIncluirVisao" runat="server" Font-Bold="True" 
                                        Text="Incluir Visão"></asp:Label>
                                </td>
                                <td class="style3">
                                    &nbsp;</td>
                                <td class="style3">
                                </td>
                            </tr>
                            <tr>
                                <td class="style8">
                                    <asp:Label ID="lblNomeVisao" runat="server">Nome da Visão:</asp:Label>
                                    &nbsp;</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtNomeVisao" runat="server" MaxLength="50" Width="375px" 
                                        ToolTip="Entre com o nome da visão"></asp:TextBox>
                                    <asp:Label ID="IdVisao" runat="server" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style8">
                                    <asp:Label ID="lblDataLiberacao" runat="server" Text="Data da Liberação:"></asp:Label>
                                    
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDataLiberacao" runat="server" MaxLength="12" Width="88px" 
                                        
                                        ToolTip="Clique para abrir o calendário para escolher a data de liberação da visão para a emissão dos relatórios" 
                                        ReadOnly="True"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="DataLiberacao_CalendarExtender" 
                                        runat="server" TargetControlID="txtDataLiberacao"></ajaxToolkit:CalendarExtender>
                                    <asp:CheckBox ID="chkFlagAtivo" runat="server" Checked="True" Text="Ativo" 
                                        ToolTip="Indica se a visão está ativa ou não" />
                                </td>
                                <td rowspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style8">
                                    <asp:ScriptManager ID="ScriptManager2" runat="server" 
                                        EnableScriptGlobalization="True">
                                    </asp:ScriptManager>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5" colspan="3">
                                    <asp:TextBox ID="txtDescricaoVisao" runat="server" Height="82px" 
                                        TextMode="MultiLine" Width="831px" MaxLength="300" 
                                        ToolTip="Entre com uma descrição sumária sobre a visão"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5" colspan="3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style5" colspan="2">
                                    <asp:Button ID="btnGravar" runat="server" Text="Gravar" 
                                        ToolTip="Grava as informações da visão" />
                                    <asp:Button ID="btnVoltar" runat="server" Text="Voltar" 
                                        ToolTip="Retorna ao Menu Principal" />
                                </td>
                                <td rowspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style5" colspan="2">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="ViewVisao" runat="server">
                        <table class="style1">
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="lblVisao" runat="server" Font-Bold="True" 
                                        Text="Cadastro de Visão"></asp:Label>
                                    <asp:GridView ID="grdVisao" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        DataKeyNames="IDVisao" DataSourceID="SdsGridVisao" EnableTheming="True" 
                                        ForeColor="#333333" GridLines="None" Width="832px">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Icones/selecionar.png" 
                                                SelectText="Seleciona a visão" ShowSelectButton="True" />
                                            <asp:BoundField DataField="IDVisao" HeaderText="Id_Visão" ReadOnly="True" 
                                                SortExpression="IDVisao" />
                                            <asp:BoundField DataField="NomeVisao" HeaderText="Nome da Visão" 
                                                SortExpression="NomeVisao" />
                                            <asp:BoundField DataField="DescricaoVisao" HeaderText="Descrição" 
                                                SortExpression="DescricaoVisao" />
                                            <asp:BoundField DataField="Flag_Ativo" HeaderText="Ativo" 
                                                SortExpression="Flag_Ativo" />
                                            <asp:BoundField DataField="DataLiberacao" HeaderText="Data de Liberação" 
                                                SortExpression="DataLiberacao" />
                                            <asp:BoundField DataField="UnidLotac" HeaderText="UnidLotac" 
                                                SortExpression="UnidLotac" />
                                            <asp:BoundField DataField="Busca_Relacionamento" 
                                                SortExpression="Busca_Relacionamento" />
                                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                                                DeleteText="Elimina Visão" ShowDeleteButton="True" />
                                        </Columns>
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Button ID="btnIncluirVisao" runat="server" Text="Incluir" 
                                        ToolTip="Inclui nova visão" />
                                    <asp:Button ID="btnAlterarVisao" runat="server" Text="Alterar" 
                                        ToolTip="Altera a visão selecionada" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:SqlDataSource ID="sdsVisao" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                                        DeleteCommand="DELETE FROM Visao WHERE (IDVisao = @IDVisao)" 
                                        
                                        
                                        SelectCommand="SELECT IDVisao, NomeVisao, DescricaoVisao, FlagAtivo, CASE FlagAtivo WHEN 0 THEN 'INATIVO' ELSE 'ATIVO' END AS Flag_Ativo, CONVERT (VARCHAR(12), DataLiberacao, 103) AS DataLiberacao, DataLiberacao AS Expr1, UnidLotac FROM Visao AS Vs WHERE (IDVisao = @IDVisao) ">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="grdVisao" Name="IDVisao" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="IdVisao" Name="IDVisao" PropertyName="Text" />
                                        </DeleteParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SdsGridVisao" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                                        InsertCommand="INSERT INTO Visao(NomeVisao, DescricaoVisao, FlagAtivo, DataLiberacao, UnidLotac) VALUES (@NomeVisao, @DescricaoVisao, @FlagAtivo, @DataVisao, @UnidLotac)" 
                                        SelectCommand="SELECT IDVisao, NomeVisao, DescricaoVisao, FlagAtivo, DataLiberacao AS Expr1, CASE WHEN FlagAtivo = 0 THEN 'INATIVO' ELSE 'ATIVO' END AS Flag_Ativo, CONVERT (VARCHAR(12), DataLiberacao, 103) AS DataLiberacao, CASE WHEN vs.IDVisao IN (SELECT DISTINCT vgf.IdVisao FROM Visao_x_GrupoFinanceiro AS vgf , Visao AS vs WHERE vgf.IDVisao = vs.IDVisao) THEN 'ACHEI' ELSE 'NAO ACHEI' END AS Busca_Relacionamento, UnidLotac FROM Visao AS Vs " 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        UpdateCommand="UPDATE Visao SET NomeVisao = @NomeVisao, DescricaoVisao = @DescVisao, FlagAtivo = @FlagAtivo, DataLiberacao = @Datalib WHERE (IDVisao = @IDVisao)" 
                                        DeleteCommand="DELETE FROM Visao WHERE (IDVisao = @IdVisao)" 
                                        ProviderName="<%$ ConnectionStrings:S2kDW.ProviderName %>">
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="grdVisao" Name="IdVisao" 
                                                PropertyName="SelectedValue" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="txtNomeVisao" Name="NomeVisao" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="txtDescricaoVisao" Name="DescVisao" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="ChkFlagAtivo" Name="FlagAtivo" 
                                                PropertyName="Checked" />
                                            <asp:ControlParameter ControlID="grdVisao" Name="IDVisao" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="txtDataLiberacao" Name="Datalib" 
                                                PropertyName="Text" Type="DateTime" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="txtNomeVisao" Name="NomeVisao" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="txtDescricaoVisao" Name="DescricaoVisao" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="chkFlagAtivo" Name="FlagAtivo" 
                                                PropertyName="Checked" />
                                            <asp:ControlParameter ControlID="txtDataLiberacao" Name="DataVisao" 
                                                PropertyName="Text" Type="DateTime" />
                                            <asp:SessionParameter DefaultValue="" Name="UnidLotac" 
                                                SessionField="CentroCusto" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:Label ID="LblError" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                  
                    <asp:View ID="ViewVisaoGrupoFin" runat="server">
                        <p>
                            <asp:Label ID="LblTitulo2" runat="server" 
                                Text="Cadastro de Relacionamento Visão x Grupo Financeiro" 
                                Font-Bold="True"></asp:Label>
                        </p>
                        <table>
                            <tr>
                                <td class="style14">
                                    <asp:Button ID="BtnGravarGF" runat="server" style="margin-left: 0px" 
                                        Text="Gravar Novo Relacionamento" 
                                        ToolTip="Grava relacionamento entre a visão e o grupo financeiro selecionados nas abas anteriores" />
                                    <br />
                                    <asp:SqlDataSource ID="SdsVisaoGrupoFinanc" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                                        DeleteCommand="DELETE FROM Visao_x_GrupoFinanceiro WHERE (IDVisaoGrupo = @IDVisaoGrupo)" 
                                        InsertCommand="INSERT INTO Visao_x_GrupoFinanceiro(IdVisao, IdGrupoFinanceiro) VALUES (@idVisao, @IdGrupoFinanceiro)" 
                                        SelectCommand="SELECT VGF.IDVisaoGrupo, VGF.IdVisao, v.NomeVisao, VGF.IdGrupoFinanceiro, gf.NomeGrupoFinanceiro, CASE WHEN ((SELECT TOP 1 IDGrupoFinanc FROM GrupoFinancXContaXCentroCusto AS gfcc WHERE (gfcc.IDVisao = vgf.IDvisao))) = vgf.IdGrupoFinanceiro THEN 'ACHEI' ELSE 'NAO ACHEI' END AS Busca_Relacionamento FROM Visao_x_GrupoFinanceiro AS VGF INNER JOIN Visao AS v ON VGF.IdVisao = v.IDVisao INNER JOIN GrupoFinanceiro AS gf ON VGF.IdGrupoFinanceiro = gf.IdGrupoFinanceiro WHERE (VGF.IdVisao = @IdVisao2) ORDER BY VGF.IdVisao, VGF.IdGrupoFinanceiro">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="grdVisao" Name="IdVisao2" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="GrdVisaoGrupoFinanc" Name="IDVisaoGrupo" 
                                                PropertyName="SelectedValue" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="grdVisao" Name="idVisao" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="GrdGrupoFinanc" Name="IdGrupoFinanceiro" 
                                                PropertyName="SelectedValue" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="GrdVisaoGrupoFinanc" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        DataKeyNames="IdVisao,IdGrupoFinanceiro,IDVisaoGrupo" 
                                        DataSourceID="SdsVisaoGrupoFinanc" EnableTheming="True" ForeColor="#333333" 
                                        GridLines="None" Height="50px" style="margin-right: 210px" 
                                        ToolTip="Grupos financeiros relacionados a visão acima selecionada" 
                                        Width="820px">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                        CommandName="Select" ImageUrl="~/Icones/selecionar.png" 
                                                        onclick="ImageButton1_Click1" Text="Select" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="IdVisao" HeaderText="Id_Visão" 
                                                SortExpression="IdVisao" />
                                            <asp:BoundField DataField="NomeVisao" HeaderText="Nome da Visão" 
                                                SortExpression="NomeVisao">
                                                <ItemStyle Width="30%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="IdGrupoFinanceiro" HeaderText="Id_Grupo" 
                                                SortExpression="IdGrupoFinanceiro" />
                                            <asp:BoundField DataField="NomeGrupoFinanceiro" HeaderText="Grupo Financeiro" 
                                                SortExpression="NomeGrupoFinanceiro" />
                                            <asp:BoundField DataField="Busca_Relacionamento" 
                                                SortExpression="Busca_Relacionamento" />
                                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                                                DeleteText="Elimina Grupo Financeiro" ShowDeleteButton="True" />
                                        </Columns>
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                    <br />
                                    <asp:Label ID="LblVisao1" runat="server" Font-Bold="False" 
                                        Font-Underline="False" Text="Visão:" Visible="False"></asp:Label>
                                    <asp:TextBox ID="txtVisaoGF" runat="server" EnableTheming="True" 
                                        ReadOnly="True" Visible="False" Width="500px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="style5" colspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style14">
                                    <asp:Label ID="LblColuna2" runat="server" Font-Bold="False" 
                                        Font-Underline="False" Text="Grupo Financeiro:" Visible="False"></asp:Label>
                                    <asp:TextBox ID="txtGrupoGF" runat="server" EnableTheming="True" 
                                        ReadOnly="True" Visible="False" Width="500px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="style5" colspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style14">
                                    <asp:Button ID="BtnListaCt" runat="server" style="margin-left: 0px" 
                                        Text="Lista Contas" ToolTip="Lista Contas associadas a visão selecionada." 
                                        Visible="False" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style5">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style14">
                                    <asp:Button ID="BtnListaCc" runat="server" style="margin-left: 0px" 
                                        Text="Lista Centro Custo" 
                                        ToolTip="Lista Centros de Custos associadas a conta selecionada." 
                                        Visible="False" />
                                    <asp:TextBox ID="TxtIDGF" runat="server" Visible="False" Width="25px"></asp:TextBox>
                                    <asp:TextBox ID="TxtIDCt" runat="server" Visible="False" Width="75px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style5">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table style="width: 820px">
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    <asp:Button ID="BtnApagaConta" runat="server" Text="Apaga Conta" 
                                        ToolTip="Apaga todos os registros de centro de custo da conta selecionada" 
                                        Visible="False" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style6" align="left" valign="top">
                                    <asp:GridView ID="GridConsultaContas" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        DataSourceID="SDSGridConta" GridLines="None" PageSize="25" 
                                        Width="732px" style="margin-right: 65px" EnableTheming="True" 
                                        ForeColor="#333333" DataKeyNames="cod_cta_ctbl">
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" 
                                                SelectImageUrl="~/Icones/selecionar.png" 
                                                SelectText="Detalha Centros de Custos" ShowSelectButton="True">
                                                <ItemStyle Width="10px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="IDVisao" HeaderText="ID_Visão" 
                                                SortExpression="IDVisao" InsertVisible="False" ReadOnly="True" />
                                            <asp:BoundField DataField="IdGrupoFinanceiro" HeaderText="Id_Grupo" 
                                                SortExpression="IdGrupoFinanceiro" InsertVisible="False" ReadOnly="True" />
                                            <asp:BoundField DataField="NomeVisao" HeaderText="Visão" 
                                                SortExpression="NomeVisao" />
                                            <asp:BoundField DataField="NomeGrupoFinanceiro" HeaderText="Grupo Financeiro" 
                                                SortExpression="NomeGrupoFinanceiro" />
                                            <asp:BoundField DataField="Cta_Ctbl" HeaderText="Conta" 
                                                SortExpression="Cta_Ctbl" />
                                            <asp:BoundField DataField="des_tit_ctbl" HeaderText="Conta Contábil" 
                                                SortExpression="des_tit_ctbl" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemStyle Width="10px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="#F7F7F7" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="style6" valign="top">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" class="style6" valign="top">
                                    <asp:GridView ID="GridConsultaCcusto" runat="server" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        DataSourceID="SDSGridCCusto" GridLines="None" PageSize="35" 
                                        Width="738px" DataKeyNames="cta_ctbl" ForeColor="#333333">
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:BoundField DataField="Cta_Ctbl" HeaderText="Conta" 
                                                SortExpression="Cta_Ctbl">
                                                <ItemStyle Width="50px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Cod_Ccusto" HeaderText="Centro de Custo" 
                                                SortExpression="Código C.Custo">
                                                <ItemStyle Width="50px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Centro Custo" HeaderText="Centro Custo" 
                                                SortExpression="Centro Custo">
                                                <ItemStyle Width="350px" />
                                            </asp:BoundField>
                                        </Columns>
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="#F7F7F7" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="style6" valign="top">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SDSGridConta" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                            
                            SelectCommand="SELECT DISTINCT GrupoFinanceiro.NomeGrupoFinanceiro, Visao.NomeVisao, Cta_Ctbl.des_tit_ctbl, Cta_Ctbl.cod_cta_ctbl, GrupoFinancXContaXCentroCusto.Cta_Ctbl, Visao.IDVisao, GrupoFinanceiro.IdGrupoFinanceiro FROM Visao INNER JOIN GrupoFinancXContaXCentroCusto ON Visao.IDVisao = GrupoFinancXContaXCentroCusto.IDVisao AND Visao.IDVisao = @IDVisao INNER JOIN GrupoFinanceiro ON GrupoFinancXContaXCentroCusto.IDGrupoFinanc = GrupoFinanceiro.IdGrupoFinanceiro AND GrupoFinanceiro.IdGrupoFinanceiro = @IDGrupoFinanceiro INNER JOIN Cta_Ctbl ON GrupoFinancXContaXCentroCusto.Cta_Ctbl = Cta_Ctbl.cod_cta_ctbl" 
                            
                            
                            
                            DeleteCommand="DELETE FROM GrupoFinancXContaXCentroCusto WHERE (IDVisao = @IDVisao) AND (IDGrupoFinanc = @IdGrupoFinanc) AND (Cta_Ctbl = @Cta_Ctbl)" 
                            ProviderName="<%$ ConnectionStrings:S2kDW.ProviderName %>">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="grdVisao" Name="IDVisao" 
                                    PropertyName="SelectedValue" Type="Int16" />
                                <asp:SessionParameter Name="IDGrupoFinanceiro" SessionField="IdGrupoFinanc" 
                                    Type="Int16" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="grdVisao" Name="IDVisao" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="TxtIDGF" Name="IdGrupoFinanc" 
                                    PropertyName="Text" Type="Int16" />
                                <asp:ControlParameter ControlID="TxtIDCt" Name="Cta_Ctbl" PropertyName="Text" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SDSGrupoFinanceiro" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                            
                            
                            SelectCommand="SELECT IdGrupoFinanceiro, NomeGrupoFinanceiro FROM GrupoFinanceiro AS gf WHERE (IdGrupoFinanceiro NOT IN ((SELECT IdGrupoFinanceiro FROM Visao_x_GrupoFinanceiro AS vgf WHERE (IdVisao = @IdVisao)))) ORDER BY IdGrupoFinanceiro, NomeGrupoFinanceiro">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="grdVisao" DefaultValue="1" Name="IdVisao" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SDSGridCCusto" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                            
                            SelectCommand="SELECT DISTINCT gf.IDGrupoFinanc, GrupoFinanceiro.NomeGrupoFinanceiro, gf.IDVisao, Visao.NomeVisao, gf.Cta_Ctbl, Cta_Ctbl.des_tit_ctbl, gf.Cod_Ccusto, Ccusto.des_tit_ctbl AS [Centro Custo] FROM GrupoFinancXContaXCentroCusto AS gf INNER JOIN Visao ON gf.IDVisao = Visao.IDVisao INNER JOIN GrupoFinanceiro ON gf.IDGrupoFinanc = GrupoFinanceiro.IdGrupoFinanceiro INNER JOIN Cta_Ctbl ON gf.Cta_Ctbl = Cta_Ctbl.cod_cta_ctbl INNER JOIN Ccusto ON gf.Cod_Ccusto = Ccusto.cod_ccusto WHERE (gf.IDGrupoFinanc = @IDGrupoFinanceiro) AND (gf.IDVisao = @Visao) AND (gf.Cta_Ctbl = @Cta_Ctbl)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="grdVisao" Name="Visao" 
                                    PropertyName="SelectedValue" />
                                <asp:SessionParameter Name="IDGrupoFinanceiro" SessionField="IdGrupoFinanc" 
                                    Type="Int16" />
                                <asp:ControlParameter ControlID="GridConsultaContas" Name="Cta_Ctbl" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:Label ID="LblInfo2" runat="server" Text="Resultado:" Visible="False" 
                            Width="280px"></asp:Label>
                        <asp:Label ID="LblCcusto2" runat="server" Text="CentroCustoGrid" 
                            Visible="False"></asp:Label>
                        <br />
                    </asp:View>
           
                    <asp:View ID="ViewContaCC" runat="server">
                        <p>
                            <asp:Label ID="LblTitulo1" runat="server" 
                                Text="Cadastro de Relacionamento Grupo Financeiro x Conta x C.Custo" 
                                Font-Bold="True"></asp:Label>
                        </p>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="LblVisão1" runat="server" Font-Bold="False" 
                                        Font-Underline="False" style="margin-left: 0px" Text="Visão:" 
                                        Visible="False"></asp:Label>
                                </td>
                                <td class="style4" colspan="2">
                                    <asp:TextBox ID="txtVisaoGF0" runat="server" ReadOnly="True" 
                                        Width="500px" EnableTheming="True" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LblColuna1" runat="server" Font-Bold="False" 
                                        Font-Underline="False" Text="Grupo Financeiro:" Visible="False"></asp:Label>
                                </td>
                                <td class="style4" colspan="2">
                                    <asp:TextBox ID="txtGrupoGF0" runat="server" ReadOnly="True" 
                                        Width="500px" EnableTheming="True" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LblCta0" runat="server" Font-Bold="False" Font-Underline="False" 
                                        Text="Conta Contábil:"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;
                                </td>
                                <td class="style11">
                                    <asp:TextBox ID="txtFiltroCta" runat="server" AutoCompleteType="Disabled" 
                                        AutoPostBack="True" Columns="20" 
                                        ToolTip="Entre com a conta ou parte da mesma" Width="140px"></asp:TextBox>
                                    <asp:ImageButton ID="BtnFiltroCta0" runat="server" Height="23px" 
                                        ImageUrl="~/Icones/001_06.gif" Width="23px" />
                                </td>
                                <td class="style10">
                                    <asp:DropDownList ID="DDLContaCC" runat="server" AutoPostBack="True" 
                                        DataSourceID="SDSConta" DataTextField="Conta Contábil" DataValueField="Cta" 
                                        Height="25px" style="margin-left: 0px" ToolTip="Selecione uma conta contábil" 
                                        Width="361px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LblCc2" runat="server" Font-Bold="False" Font-Underline="False" 
                                        Text="Centro de Custo:"></asp:Label>
                                </td>
                                <td class="style11">
                                    <asp:TextBox ID="TxtCCustoIni" runat="server" Width="50px" Wrap="False">AAA01</asp:TextBox>
                                    <asp:Label ID="LblCc3" runat="server" EnableTheming="True" Font-Bold="False" 
                                        Font-Underline="False" Text="Até" Height="25px" Width="20px"></asp:Label>
                                    <asp:TextBox ID="TxtCCustoFim" runat="server" AutoCompleteType="Disabled" 
                                        Width="56px" Wrap="False">ZZZ99</asp:TextBox>
                                    <asp:ImageButton ID="BtnFiltroCC0" runat="server" Height="23px" 
                                        ImageUrl="~/Icones/001_06.gif" Width="23px" />
                                </td>
                                <td class="style10">
                                    <asp:Button ID="BtnGravarCC" runat="server" Text="Gravar" 
                                        
                                        ToolTip="Grava relacionamento entre visão, grupo financeiro, conta contábil e centro de custo" 
                                        Width="50px" />
                                    <asp:Button ID="BtnOcultarCC" runat="server" Text="Ocultar" 
                                        
                                        ToolTip="Oculta ou Reexibe a lista de centros de custo disponíveis para a conta contábil selecionada" 
                                        Width="55px" />
                                    <asp:Label ID="LblProcesso" runat="server" Font-Bold="True" ForeColor="#CC3300" 
                                        Text="Escolha uma Conta Contábil !!!" Width="260px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:SqlDataSource ID="SDSContaCC" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                                        DeleteCommand="DELETE FROM GrupoFinancXContaXCentroCusto WHERE (IDGrupoFinanc_Conta_CCusto = @IDGrupoFinanc_Conta_CCusto)" 
                                        InsertCommand="INSERT INTO GrupoFinancXContaXCentroCusto(IDGrupoFinanc, IdVisao, Cta_Ctbl, Cod_Ccusto) VALUES (@IdGrupoFinanceiro, @Visao, @Conta, @Cod_ccusto)" 
                                        SelectCommand="SELECT ccc.IDGrupoFinanc_Conta_CCusto, ccc.IDGrupoFinanc, ccc.IDVisao, ccc.Cta_Ctbl, ccc.Cod_Ccusto, vcc.cod_empresa, vcc.cod_ccusto AS Ccusto2, vcc.cod_plano_ccusto, vcc.des_tit_ctbl, vct.cod_cta_ctbl, vct.cod_cta_ctbl_padr_internac, vct.des_tit_ctbl AS DescTit2, vct.cod_grp_cta_ctbl, Visao_x_GrupoFinanceiro.IdGrupoFinanceiro FROM GrupoFinancXContaXCentroCusto AS ccc INNER JOIN Ccusto AS vcc ON ccc.Cod_Ccusto = vcc.cod_ccusto INNER JOIN Cta_Ctbl AS vct ON ccc.Cta_Ctbl = vct.cod_cta_ctbl AND ccc.Cta_Ctbl = @Cta AND ccc.IDVisao = @IdVisao INNER JOIN Visao_x_GrupoFinanceiro ON ccc.IDVisao = Visao_x_GrupoFinanceiro.IdVisao AND ccc.IDGrupoFinanc = Visao_x_GrupoFinanceiro.IdGrupoFinanceiro WHERE (Visao_x_GrupoFinanceiro.IdGrupoFinanceiro = @IdGrupoFinanceiro)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DDLContaCC" Name="Cta" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="grdVisao" Name="IdVisao" 
                                                PropertyName="SelectedValue" />
                                            <asp:SessionParameter Name="IdGrupoFinanceiro" SessionField="IdGrupoFinanc" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="GrdContaCC" Name="IDGrupoFinanc_Conta_CCusto" 
                                                PropertyName="SelectedValue" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:SessionParameter Name="IdGrupoFinanceiro" SessionField="IDGrupoFinanc" />
                                            <asp:ControlParameter ControlID="grdVisao" Name="Visao" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="DDLContaCC" Name="Conta" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="LblCcusto" Name="Cod_ccusto" 
                                                PropertyName="Text" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridGFCcusto" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="cod_empresa,cod_ccusto,cod_plano_ccusto,des_tit_ctbl" 
                                        DataSourceID="SDSCentroCusto" Width="803px" CellPadding="4" 
                                        ForeColor="#333333" GridLines="None" 
                                        
                                        ToolTip="Lista de centros de custo disponíveis para a conta contábil selecionada" 
                                        EnableTheming="True">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" Visible="False" />
                                            <asp:BoundField DataField="cod_empresa" HeaderText="Empresa" ReadOnly="True" 
                                                SortExpression="cod_empresa" Visible="False" />
                                            <asp:BoundField DataField="cod_ccusto" HeaderText="Centro Custo" 
                                                ReadOnly="True" SortExpression="cod_ccusto" />
                                            <asp:BoundField DataField="cod_plano_ccusto" HeaderText="Plano C Custo" 
                                                ReadOnly="True" SortExpression="cod_plano_ccusto" Visible="False" />
                                            <asp:BoundField DataField="des_tit_ctbl" HeaderText="Nome Centro Custo" 
                                                SortExpression="des_tit_ctbl" />
                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSelect" runat="server" 
                                                        oncheckedchanged="chkSelect_CheckedChanged" />
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <input ID="chkAll" runat="server" 
                                                        onclick="javascript:SelecionaTodosChecks(this);" type="checkbox" />
                                                </HeaderTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:GridView ID="GrdContaCC" runat="server" 
                            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                            DataKeyNames="IDGrupoFinanc_Conta_CCusto,IDGrupoFinanc,IDVisao" 
                            DataSourceID="SDSContaCC" ForeColor="#333333" GridLines="None" 
                            
                            
                            ToolTip="Relacionamento visão x grupo financeiro x conta contábil x centro de custo" 
                            EnableTheming="True" Width="808px">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" BorderStyle="None" Font-Names="Times New Roman" 
                                Font-Size="Smaller" />
                            <Columns>
                                <asp:BoundField DataField="IDCol_Conta_CCusto" HeaderText="IDCol_Conta_CCusto" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="IDCol_Conta_CCusto" 
                                    Visible="False" />
                                <asp:BoundField DataField="IDColuna" HeaderText="IDColuna" 
                                    InsertVisible="False" SortExpression="IDColuna" Visible="False" />
                                <asp:BoundField DataField="IdVisao" HeaderText="IdVisao" 
                                    SortExpression="IdVisao" Visible="False" />
                                <asp:BoundField DataField="cta_ctbl" HeaderText="Conta Contábil" 
                                    SortExpression="cta_ctbl" Visible="False" />
                                <asp:BoundField DataField="cod_cta_ctbl_padr_internac" 
                                    HeaderText="Conta Internacional" SortExpression="cod_cta_ctbl_padr_internac" />
                                <asp:BoundField DataField="DescTit2" HeaderText="Nome da Conta Contábil" 
                                    SortExpression="DescTit2" />
                                <asp:BoundField DataField="cod_ccusto" HeaderText="Centro de Custo" 
                                    SortExpression="cod_ccusto" />
                                <asp:BoundField DataField="des_tit_ctbl" HeaderText="Nome do Centro Custo" 
                                    SortExpression="des_tit_ctbl" />
                                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                                    DeleteText="Elimina relacionamento" ShowDeleteButton="True" />
                            </Columns>
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SdsVisaoCC" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                            SelectCommand="SELECT [IdVisao], [NomeVisao] FROM [Visao]
where UnidLotac=@UnidLotac">
                            <SelectParameters>
                                <asp:SessionParameter Name="UnidLotac" SessionField="CentroCusto" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SdsGrupoFinancCC" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                            
                            SelectCommand="SELECT gf.IdGrupoFinanceiro, gf.NomeGrupoFinanceiro, Visao_x_GrupoFinanceiro.IdVisao, gf.Ordem FROM GrupoFinanceiro AS gf INNER JOIN Visao_x_GrupoFinanceiro ON gf.IdGrupoFinanceiro = Visao_x_GrupoFinanceiro.IdGrupoFinanceiro WHERE (Visao_x_GrupoFinanceiro.IdVisao = @IdVisao) ORDER BY gf.IdGrupoFinanceiro, gf.NomeGrupoFinanceiro">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="grdVisao" Name="IdVisao" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SDSConta" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                            
                            
                            
                            
                            SelectCommand="SELECT cod_cta_ctbl AS Cta, cod_cta_ctbl_padr_internac AS [Conta Internacional], des_tit_ctbl AS [Nome da Conta], cod_grp_cta_ctbl AS [Grupo de Conta], cod_cta_ctbl_padr_internac + ' - ' + des_tit_ctbl AS [Conta Contábil], cod_plano_cta_ctbl, ind_espec_cta_ctbl, ind_natur_cta_ctbl FROM Cta_Ctbl WHERE (cod_cta_ctbl LIKE @cta + '%') AND (ind_espec_cta_ctbl = 'Analítica') AND cod_plano_cta_ctbl = 'CODECO'  ORDER BY [Conta Internacional], Cta">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtFiltroCta" Name="cta" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SDSCentroCusto" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                            
                            
                            
                            
                            SelectCommand="SELECT cod_empresa, cod_ccusto, cod_plano_ccusto, des_tit_ctbl FROM Ccusto AS cc WHERE (cod_ccusto &gt;= @ccIni) AND (cod_ccusto &lt;= @ccFim) AND (NOT EXISTS (SELECT Cod_Ccusto FROM GrupoFinancXContaXCentroCusto AS cf WHERE (IDGrupoFinanc = @IDGrupoFinanceiro) AND (IDVisao = @IdVisao) AND (Cta_Ctbl = @Cta_Ctbl) AND (Cod_Ccusto = cc.cod_ccusto)))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TxtCCustoIni" Name="ccIni" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="TxtCCustoFim" Name="ccFim" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="grdVisao" Name="IdVisao" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DDLContaCC" Name="Cta_Ctbl" 
                                    PropertyName="SelectedValue" />
                                <asp:SessionParameter Name="IDGrupoFinanceiro" SessionField="IDGrupoFinanc" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:Label ID="LblInfo" runat="server" Text="Resultado:" Visible="False" 
                            Width="249px"></asp:Label>
                        <asp:Label ID="LblCcusto" runat="server" Text="CentroCustoGrid" 
                            Visible="False"></asp:Label>
                    </asp:View>
                    <br />
                    <asp:View ID="ViewGrupoFinanc" runat="server">
                        <table class="style1">
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="lblGrupFin" runat="server" Font-Bold="True" 
                                        Text="Cadastro de Grupo Financeiro"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Button ID="btnIncluirGrpFin" runat="server" Text="Incluir" 
                                        ToolTip="Inclui novo grupo financeiro" />
                                    <asp:Button ID="btnAlterarGrpFin" runat="server" Text="Alterar" 
                                        ToolTip="Altera o grupo financeiro selecionado" />
                                    <asp:SqlDataSource ID="SdsGrpFinanc" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                                        SelectCommand="SELECT [IdGrupoFinanceiro], [NomeGrupoFinanceiro] FROM [GrupoFinanceiro]">
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SdsGridGrpFinanc" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                                        InsertCommand="INSERT INTO GrupoFinanceiro(NomeGrupoFinanceiro) VALUES (@nome)" 
                                        SelectCommand="SELECT IdGrupoFinanceiro, NomeGrupoFinanceiro, CASE WHEN gf.IDGrupoFinanceiro IN (SELECT DISTINCT vgf.IdGrupoFinanceiro FROM Visao_x_GrupoFinanceiro AS vgf , Visao AS vs WHERE vgf.IDGrupoFinanceiro = gf.IDGrupoFinanceiro) THEN 'ACHEI' ELSE 'NAO ACHEI' END AS Busca_Relacionamento FROM GrupoFinanceiro AS gf" 
                                        
                                        UpdateCommand="UPDATE GrupoFinanceiro SET NomeGrupoFinanceiro = @NomeGrupoFinanceiro WHERE (IdGrupoFinanceiro = @IDGrupoFinanceiro)" 
                                        
                                        
                                        DeleteCommand="DELETE FROM GrupoFinanceiro WHERE (IdGrupoFinanceiro = @IDGrupoFinanceiro)" 
                                        ProviderName="<%$ ConnectionStrings:S2kDW.ProviderName %>">
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="GrdGrupoFinanc" Name="IDGrupoFinanceiro" 
                                                PropertyName="SelectedValue" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="txtNomeGrupoFinanceiro" 
                                                Name="NomeGrupoFinanceiro" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="GrdGrupoFinanc" Name="IDGrupoFinanceiro" 
                                                PropertyName="SelectedValue" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="txtNomeGrupoFinanceiro" Name="nome" 
                                                PropertyName="Text" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SdsPopulaGrpFinanc" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:S2kDW %>" 
                                        DeleteCommand="DELETE FROM GrupoFinanceiro WHERE (IdGrupoFinanceiro = @IDGrupoFinanceiro)" 
                                        InsertCommand="SqlDataSource - SdsGridGrpFinanc" 
                                        SelectCommand="SELECT IdGrupoFinanceiro, NomeGrupoFinanceiro, CASE WHEN gf.IDGrupoFinanceiro IN (SELECT DISTINCT vgf.IdGrupoFinanceiro FROM Visao_x_GrupoFinanceiro AS vgf , Visao AS vs WHERE vgf.IDGrupoFinanceiro = gf.IDGrupoFinanceiro) THEN 'ACHEI' ELSE 'NAO ACHEI' END AS Busca_Relacionamento FROM GrupoFinanceiro AS gf where IDGrupoFinanceiro = @IDGrupoFinanceiro" 
                                        UpdateCommand="UPDATE GrupoFinanceiro SET NomeGrupoFinanceiro = @NomeGrupoFinanceiro WHERE (IdGrupoFinanceiro = @IDGrupoFinanceiro)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="GrdGrupoFinanc" Name="IDGrupoFinanceiro" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="GrdGrupoFinanc" Name="IDGrupoFinanceiro" 
                                                PropertyName="SelectedValue" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="GrdGrupoFinanc" Name="IDGrupoFinanceiro" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="txtNomeGrupoFinanceiro" 
                                                Name="NomeGrupoFinanceiro" PropertyName="Text" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="txtNomeGrupoFinanceiro" Name="nome" 
                                                PropertyName="Text" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:GridView ID="GrdGrupoFinanc" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        DataKeyNames="IdGrupoFinanceiro" DataSourceID="SdsGridGrpFinanc" 
                                        ForeColor="#333333" GridLines="None" Height="50px" PageSize="25" 
                                        style="margin-right: 210px" 
                                        ToolTip="Grupos financeiros relacionados a visão acima selecionada" 
                                        EnableTheming="True" Width="619px">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" 
                                                SelectImageUrl="~/Icones/selecionar.png" 
                                                SelectText="Seleciona Grupo Financeiro" ShowSelectButton="True">
                                                <ItemStyle Width="10px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="IdGrupoFinanceiro" HeaderText="Id_Grupo" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="IdGrupoFinanceiro" />
                                            <asp:BoundField DataField="NomeGrupoFinanceiro" HeaderText="Grupo Financeiro" 
                                                SortExpression="NomeGrupoFinanceiro" />
                                            <asp:BoundField DataField="Busca_Relacionamento" ReadOnly="True" 
                                                SortExpression="Busca_Relacionamento" />
                                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                                                DeleteText="Apaga Grupo Financeiro" ShowDeleteButton="True" />
                                        </Columns>
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LblError0" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="ViewIncluirGrupoFin" runat="server">
                        <table class="style1">
                            <tr>
                                <td class="style12" colspan="2">
                                    <asp:Label ID="LblIncluirGrpFin" runat="server" Font-Bold="True" 
                                        Text="Incluir Grupo Financeiro" Width="300px"></asp:Label>
                                </td>
                                <td class="style3">
                                </td>
                            </tr>
                            <tr>
                                <td class="style13">
                                    <asp:Label ID="lblNomeGrpFin" runat="server">Nome do Grupo Financeiro:</asp:Label>
                                    &nbsp;</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtNomeGrupoFinanceiro" runat="server" MaxLength="50" 
                                        ToolTip="Entre com o nome da visão" Width="375px"></asp:TextBox>
                                    <asp:Label ID="IdGrpFin" runat="server" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style5" colspan="2">
                                    <asp:Button ID="btnGravarGrpFin" runat="server" Text="Gravar" 
                                        ToolTip="Grava as informações da visão" />
                                    <asp:Button ID="btnVoltarGrpFin" runat="server" Text="Voltar" 
                                        ToolTip="Retorna ao Menu Principal" />
                                </td>
                                <td rowspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style5" colspan="2">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <br />
                    <br />
                </asp:MultiView>
            </td>
        </tr>
    </table>
    </form>
</body>

<script type="text/javascript" language="javascript">

 function SelecionaTodosChecks(spanChk){
   var oItem = spanChk.children;
   var theBox= (spanChk.type=="checkbox") ? 
       spanChk : spanChk.children.item[0];
   xState=theBox.checked;
   elm=theBox.form.elements;

   for(i=0;i<elm.length;i++)
     if(elm[i].type=="checkbox" && 
              elm[i].id!=theBox.id)
     {

       if(elm[i].checked!=xState)
         elm[i].click();
     }
 }
  </script>
</html>
