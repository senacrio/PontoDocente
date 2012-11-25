<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TransferenciaCandidato.aspx.vb" Inherits="ProcessoSelecaoAprovacao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 48px;
        }
        .style3
        {
            width: 504px;
        }
        .style4
        {
            width: 48px;
            font-weight: bold;
        }
        .style5
        {
            width: 48px;
            height: 33px;
        }
        .style6
        {
            width: 504px;
            height: 33px;
        }
        .style7
        {
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ScriptManager>
    
                <asp:Label ID="lblTitulo" runat="server" Text="TRANSFERIR INSCRITOS" 
            Font-Bold="True"></asp:Label>
                <br />
        <br />
    
        <asp:MultiView ID="mulTriagem" runat="server" ActiveViewIndex="0">
            <asp:View ID="VieTriagensEventos" runat="server">
                <asp:Panel ID="PnlFiltro" runat="server" Width="98%" GroupingText="FILTRO">
                    <table width="100%">
                        <tr>
                            <td align="right" width="15%">
                                <asp:Label ID="lblUnidade" runat="server" Text="Unidade:"></asp:Label>
                            </td>
                            <td width="60%">
                                <asp:DropDownList ID="ddlUnidade" runat="server" DataSourceID="SqlDSUnidade" 
                                    DataTextField="Unidade" DataValueField="IDUnidade" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td width="35%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblTurno" runat="server" Text="Turno:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTurno" runat="server" Width="200px">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="1">Manhã</asp:ListItem>
                                    <asp:ListItem Value="2">Tarde</asp:ListItem>
                                    <asp:ListItem Value="3">Noite</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblEvento" runat="server" Text="Nome do Curso:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbxEvento" runat="server" Width="98%"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblData" runat="server" Text="Data de Início:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDataInicio" runat="server" Width="149px"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="txtDataInicio_MaskedEditExtender" 
                                    runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                    Mask="99/99/9999" MaskType="Date" TargetControlID="txtDataInicio">
                                </ajaxToolkit:MaskedEditExtender>
                                <ajaxToolkit:CalendarExtender ID="txtDataInicio_CalendarExtender" 
                                    runat="server" Enabled="True" TargetControlID="txtDataInicio">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblNRegistro" runat="server" Text="Registros por página"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlPaginacao" runat="server">
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>35</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>45</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="100px" />
                            </td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:GridView ID="gvwEvento" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="IDTurma,IDCurso,IDUnidade" 
                    DataSourceID="SqlDSEventos" PageSize="5" Width="98%">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Select" ImageUrl="~/Icones/PNG/Blue/18/arrow_right.png" 
                                    Text="Selecionar" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDTurma" HeaderText="IDTurma" InsertVisible="False" 
                            ReadOnly="True" SortExpression="IDTurma" Visible="False" />
                        <asp:BoundField DataField="IDCurso" HeaderText="IDCurso" 
                            SortExpression="IDCurso" Visible="False" />
                        <asp:BoundField DataField="IDUnidade" HeaderText="IDUnidade" 
                            SortExpression="IDUnidade" Visible="False" />
                        <asp:BoundField DataField="DataInicioInscricao" HeaderText="Início de Inscrição" 
                            SortExpression="DataInicioInscricao">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataTerminoInscricao" HeaderText="Término de Inscrição" 
                            SortExpression="DataTerminoInscricao">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataInicioCurso" HeaderText="Início do Curso" 
                            SortExpression="DataInicioCurso">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataTerminoCurso" HeaderText="Término do Curso" 
                            SortExpression="DataTerminoCurso">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Unidade" HeaderText="Unidade" 
                            SortExpression="Unidade">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="10%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Curso" HeaderText="Curso" SortExpression="Curso">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="25%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="25%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Turno" HeaderText="Turno" SortExpression="Turno">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="5%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" 
                            SortExpression="Total">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="10%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <asp:Label ID="lblResult0" runat="server" 
                            Text="Não há dados para esta consulta."></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:DetailsView ID="dvwEvento" runat="server" AutoGenerateRows="False" 
                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                    DataSourceID="SqlDSDetalhe" GridLines="None" Height="16px" Width="98%">
                    <Fields>
                        <asp:BoundField DataField="Total" HeaderText="Total de registros:" 
                            ReadOnly="True" SortExpression="Total">
                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Width="53%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="47%" />
                        </asp:BoundField>
                    </Fields>
                </asp:DetailsView>
                <asp:TextBox ID="txtIDTurma" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="txtIDUnidade" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="txtIDCurso" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:SqlDataSource ID="SqlDSDetalhe" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT 
COUNT(*)AS Total
FROM 
psgTurma t,
psgCurso c 
WHERE 
t.IDCurso = c.IDCurso AND 
c.Ativo = 1 AND 
t.Ativo = 1  AND 
t.IDUnidade = (CASE @ID WHEN '' THEN t.IDUnidade ELSE @ID END)AND
t.DataInicioCurso = (CASE @Data WHEN '' THEN t.DataInicioCurso ELSE CONVERT(SMALLDATETIME,@Data +' 00:00',103) END) AND
t.Turno = (CASE @Turno WHEN '' THEN t.Turno ELSE @Turno END) AND

EXISTS(
	SELECT TOP 1 pu.IDPerfil FROM psgPerfilUnidade pu
	INNER JOIN admPortalPerfilUsuario pa ON pu.IDPerfil=pa.IDPerfil
	WHERE pu.IDUnidade = t.IDUnidade AND pa.IDUsuario = @IDUsuario)

AND
c.Curso LIKE  '%' + @Evento  + '%'  ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlUnidade" ConvertEmptyStringToNull="False" 
                            Name="ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="tbxEvento" ConvertEmptyStringToNull="False" 
                            Name="Evento" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDataInicio" 
                            ConvertEmptyStringToNull="False" Name="Data" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlTurno" ConvertEmptyStringToNull="False" 
                            Name="Turno" PropertyName="SelectedValue" Type="String" />
                        <asp:SessionParameter DefaultValue="" Name="IDUsuario" 
                            SessionField="c_IDUsuario" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDSEventos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT 
t.IDTurma,
t.IDCurso,
t.IDUnidade,
(SELECT Unidade FROM psgUnidade  u WHERE t.IDUnidade = u.IDUnidade)AS Unidade,
CONVERT(VARCHAR,DataInicioInscricao,103)AS DataInicioInscricao,
CONVERT(VARCHAR,DataTerminoInscricao,103)AS DataTerminoInscricao,
CONVERT(VARCHAR,DataInicioCurso,103)AS DataInicioCurso,
CONVERT(VARCHAR,DataTerminoCurso,103)AS DataTerminoCurso,
CASE TURNO WHEN 1 THEN 'Manhã' ELSE (CASE TURNO WHEN 2 THEN 'Tarde' ELSE 'Noite' END)END AS Turno,
c.Curso,
(SELECT COUNT(*)FROM psgInscricao i WHERE i.IDTurma = t.IDTurma)AS Total
FROM 
psgTurma t,
psgCurso c 
WHERE 
t.IDCurso = c.IDCurso AND 
c.Ativo = 1 AND 
t.Ativo = 1  AND 
t.IDUnidade = (CASE @ID WHEN '' THEN t.IDUnidade ELSE @ID END)AND
t.DataInicioCurso = (CASE @Data WHEN '' THEN t.DataInicioCurso ELSE CONVERT(SMALLDATETIME,@Data +' 00:00',103) END) AND
t.Turno = (CASE @Turno WHEN '' THEN t.Turno ELSE @Turno END) AND
EXISTS(
	SELECT TOP 1 pu.IDPerfil FROM psgPerfilUnidade pu
	INNER JOIN admPortalPerfilUsuario pa ON pu.IDPerfil=pa.IDPerfil
	WHERE pu.IDUnidade = t.IDUnidade AND pa.IDUsuario = @IDUsuario)
AND
c.Curso LIKE  '%' + @Evento  + '%'  
ORDER BY Curso
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlUnidade" Name="ID" 
                            PropertyName="SelectedValue" ConvertEmptyStringToNull="False" 
                            Type="String" />
                        <asp:ControlParameter ControlID="tbxEvento" ConvertEmptyStringToNull="False" 
                            Name="Evento" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDataInicio" 
                            ConvertEmptyStringToNull="False" Name="Data" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlTurno" ConvertEmptyStringToNull="False" 
                            Name="Turno" PropertyName="SelectedValue" Type="String" />
                        <asp:SessionParameter DefaultValue="" Name="IDUsuario" 
                            SessionField="c_IDUsuario" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDSUnidade" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT NULL AS IDUnidade,NULL AS Unidade 
UNION ALL
SELECT IDUnidade,Unidade FROM psgUnidade u WHERE 
EXISTS(
	SELECT TOP 1 pu.IDPerfil FROM psgPerfilUnidade pu
	INNER JOIN admPortalPerfilUsuario pa ON pu.IDPerfil=pa.IDPerfil
	WHERE pu.IDUnidade = u.IDUnidade AND pa.IDUsuario = @IDUsuario)
ORDER BY Unidade">
                    <SelectParameters>
                        <asp:SessionParameter Name="IDUsuario" 
                            SessionField="c_IDUsuario" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gdvAnaliseDados" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="IDTurma" 
                    DataSourceID="SqlDataSAnaliseDados">
                    <Columns>
                        <asp:BoundField DataField="Nome" HeaderText="Candidato" SortExpression="Nome" />
                        <asp:BoundField DataField="IndicePSG" DataFormatString="{0:n4}" 
                            HeaderText="Índice PSG" ItemStyle-HorizontalAlign="Center" 
                            SortExpression="IndicePSG">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rank" HeaderText="Rank" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="Rank">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RF" DataFormatString="{0:c}" HeaderText="RF" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="RF">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DF1" HeaderText="DF" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="DF1">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DF2" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="DF2">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PF1" HeaderText="PF" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="PF1">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PF2" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="PF2">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EB1" HeaderText="EB" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="EB1">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EB2" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="EB2">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CT1" HeaderText="CT" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="CT1">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CT2" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="CT2">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="APS1" HeaderText="APS" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="APS1">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="APS2" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="APS2">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GF" HeaderText="GF" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="GF">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RendaPercapita" DataFormatString="{0:c}" 
                            HeaderText="Renda Per Capita" ItemStyle-HorizontalAlign="Center" 
                            SortExpression="RendaBrutaPessoal">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AlunoEducacaoBasicaTrabalhador" 
                            HeaderText="Aluno Educação Básica Trabalhador" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" 
                            SortExpression="AlunoEducacaoBasicaTrabalhador">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AlunoEducacaoBasica" 
                            HeaderText="Aluno Educação Básica" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="AlunoEducacaoBasica">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EgressoEducacaoBasica" 
                            HeaderText="Egresso Educação Básica" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="EgressoEducacaoBasica">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TrabalhadorDesempregado" 
                            HeaderText="Trabalhador Desempregado" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="TrabalhadorDesempregado">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TrabalhadorEmpregado" 
                            HeaderText="Trabalhador Empregado" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="TrabalhadorEmpregado">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PessoaComDeficiencia" 
                            HeaderText="Pessoa c/ Deficiência" ItemStyle-HorizontalAlign="Center" 
                            ReadOnly="True" SortExpression="PessoaComDeficiencia">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EgressoPrograma" HeaderText="Egresso Programa" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" 
                            SortExpression="EgressoPrograma">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataNascimemto" DataFormatString="{0:dd/MM/yyyy}" 
                            HeaderText="Nascimemto" ItemStyle-HorizontalAlign="Center" 
                            SortExpression="DataNascimemto">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataHoraRegistro" 
                            DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" HeaderText="Registro" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="DataHoraRegistro">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="VieTriagemCandidatos" runat="server">
                <asp:Panel ID="Panel1" runat="server" GroupingText="CURSO  DE INTERESSE" 
                    Width="98%">
                    <asp:Panel ID="PnlOpcaoTriagem" runat="server" BorderColor="#CCCCCC" 
                        Width="100%">
                        <br />
                        <table style="width:100%;">
                            <tr>
                                <td align="right" width="17%">
                                    <asp:Label ID="lblUnidadeInteresse" runat="server" Font-Bold="True" 
                                        Text="Unidade:"></asp:Label>
                                </td>
                                <td width="50%">
                                    <asp:Label ID="lblUnidadeInteresse0" runat="server" Font-Bold="False" 
                                        Text="Unidade:"></asp:Label>
                                </td>
                                <td align="right" width="20%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" width="15%">
                                    <asp:Label ID="lblEventoInteresse" runat="server" Font-Bold="True" 
                                        Text="Curso:"></asp:Label>
                                </td>
                                <td width="75%">
                                    <asp:Label ID="lblEventoInteresse0" runat="server" Font-Bold="False" 
                                        Text="Curso:"></asp:Label>
                                </td>
                                <td align="right" width="10%">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table style="width:100%;">
                            <tr>
                                <td align="right" width="17%">
                                    <asp:Label ID="lblDtInicioInteresse" runat="server" Font-Bold="True" 
                                        Text="Início Inscrição:"></asp:Label>
                                </td>
                                <td width="10%">
                                    <asp:Label ID="lblDtInicioInteresse0" runat="server" Font-Bold="False" 
                                        Text="Data Início:"></asp:Label>
                                </td>
                                <td align="right" width="13%">
                                    <asp:Label ID="lblDtFimInteresse" runat="server" Font-Bold="True" 
                                        Text="Término Inscrição:"></asp:Label>
                                </td>
                                <td width="65%">
                                    <asp:Label ID="lblDtFimInteresse0" runat="server" Font-Bold="False" 
                                        Text="Data Término:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblHrInicioInteresse" runat="server" Font-Bold="True" 
                                        Text="Início Curso:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblHrInicioInteresse0" runat="server" Font-Bold="False" 
                                        Text="Hora Início:"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblHrFimInteresse" runat="server" Font-Bold="True" 
                                        Text="Término Curso:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblHrFimInteresse0" runat="server" Font-Bold="False" 
                                        Text="Hora Término:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width:100%;">
                            <tr>
                                <td align="right" width="17%">
                                    <asp:Label ID="lblNVagasInteresse" runat="server" Font-Bold="True" 
                                        Text="Número de vagas:"></asp:Label>
                                </td>
                                <td width="75%">
                                    <asp:Label ID="lblNVagasInteresse0" runat="server" Font-Bold="False" 
                                        Text="Número de vagas:"></asp:Label>
                                </td>
                                <td align="right" width="10%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblNInscInteresse" runat="server" Font-Bold="True" 
                                        Text="Número de inscritos:"></asp:Label>
                                </td>
                                <td width="75%">
                                    <asp:Label ID="lblNInscInteresse0" runat="server" Font-Bold="False" 
                                        Text="Número de inscritos:"></asp:Label>
                                </td>
                                <td align="right" width="10%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblNInscInteresse3" runat="server" Font-Bold="True" 
                                        Text="Número de aprovados:"></asp:Label>
                                </td>
                                <td width="75%">
                                    <asp:Label ID="lblNAprovados" runat="server" Font-Bold="False" 
                                        Text="Número de aprovados:"></asp:Label>
                                </td>
                                <td align="right" width="10%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblDiasSemanaInteresse" runat="server" Font-Bold="True" 
                                        Text="Turno:"></asp:Label>
                                </td>
                                <td width="75%">
                                    <asp:Label ID="lblDiasSemanaInteresse0" runat="server" Font-Bold="False" 
                                        Text="Dias da semana:"></asp:Label>
                                </td>
                                <td align="center" width="10%">
                                    <asp:Button ID="btnSubmeter" runat="server" Text="Submeter" Width="80px" 
                                        Enabled="False" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </asp:Panel>
                <br />
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" Width="100px" />
                <br />
                <br />
                <asp:Label ID="lblaprovacao" runat="server" Font-Bold="False" 
                    ForeColor="Black" Text="CANDIDATOS INSCRITOS"></asp:Label>
                <br />
                <br />
                <table width="98%">
                    <tr>
                        <td valign="top" width="64%">
                            <asp:GridView ID="gvwCandidatos" runat="server" AutoGenerateColumns="False" 
                                CaptionAlign="Left" DataKeyNames="IDInscricao,nome" 
                                DataSourceID="SqlDataSCandidatoInscrito" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Transferir">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton3" runat="server" 
                                                CommandArgument='<%# Bind("IDInscricao") %>' 
                                                ImageUrl="~/Icones/PNG/Green/18/charts03.png" onclick="ImageButton3_Click" 
                                                ToolTip="Transferir" Width="18px" CommandName="select" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IDInscricao" HeaderText="IDInscricao" 
                                        ReadOnly="True" SortExpression="IDInscricao" Visible="False" />
                                    <asp:BoundField DataField="Nome" HeaderText="Nome" ReadOnly="True" 
                                        ShowHeader="False" SortExpression="Nome">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="25%" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="indice" HeaderText="Índice" ReadOnly="True" 
                                        ShowHeader="False" SortExpression="indice" DataFormatString="{0:n4}">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Aprovar" SortExpression="Aprovacao">
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="rbSN" runat="server" AutoPostBack="True" 
                                                Enabled="False" RepeatDirection="Horizontal" 
                                                SelectedValue='<%# Bind("Aprovacao") %>'>
                                                <asp:ListItem Enabled="False" Value="False">NAO</asp:ListItem>
                                                <asp:ListItem Value="True">SIM</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Motivo" SortExpression="IDMotivoReprovacao">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Motivo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="30%" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="30%" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DataHoraAprovacao" HeaderText="DataHoraAprovacao" 
                                        ReadOnly="True" ShowHeader="False" SortExpression="DataHoraAprovacao" 
                                        Visible="False" />
                                    <asp:TemplateField HeaderText="Descrição" SortExpression="Descricao">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Descricao") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="25%" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="25%" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="lblResult" runat="server" 
                                        Text="Nenhum candidato inscrito."></asp:Label>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                        <td width="1%">
                            &nbsp;</td>
                        <td valign="top" width="35%">
                            <asp:MultiView ID="mtvAprovacao" runat="server">
                                <asp:View ID="Vieaprovacao" runat="server">
                                    <table bgcolor="#F3F3F3" style="border: thin solid #C3C3C3; width: 100%;">
                                        <tr>
                                            <td align="right" valign="top" width="20%">
                                                <asp:Label ID="lblaprovar" runat="server" Font-Bold="True" Text="Aprovar:"></asp:Label>
                                            </td>
                                            <td width="1%">
                                                &nbsp;</td>
                                            <td width="79%">
                                                <asp:RadioButtonList ID="rbSNE" runat="server" AutoPostBack="True" 
                                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("Aprovacao") %>'>
                                                    <asp:ListItem Value="False">NAO</asp:ListItem>
                                                    <asp:ListItem Value="True">SIM</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top">
                                                <asp:Label ID="lblMotivo" runat="server" Font-Bold="True" Text="Motivo:"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:DropDownList ID="ddlMotivo" runat="server" 
                                                    DataSourceID="SqlDSMotivoReprovacao" DataTextField="MotivoReprovacao" 
                                                    DataValueField="IDMotivoReprovacao">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top">
                                                <asp:Label ID="lblDescricao" runat="server" Font-Bold="True" Text="Descrição:"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                <asp:TextBox ID="tbxDescricao" runat="server" Text='<%# Bind("Descricao") %>' 
                                                    TextMode="MultiLine" Width="98%"></asp:TextBox>
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
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td align="right">
                                                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" 
                                                    ValidationGroup="Salvar" Width="100px" />
                                                <asp:Button ID="btnVoltarA" runat="server" CausesValidation="False" 
                                                    Text="Voltar" Width="100px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td align="right">
                                                <asp:RequiredFieldValidator ID="rfvMotivo" runat="server" 
                                                    ControlToValidate="ddlMotivo" Display="None" ErrorMessage="Campo obrigatório" 
                                                    ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                                                <ajaxToolkit:ValidatorCalloutExtender ID="rfvMotivo_ValidatorCalloutExtender" 
                                                    runat="server" Enabled="True" TargetControlID="rfvMotivo">
                                                </ajaxToolkit:ValidatorCalloutExtender>
                                                <asp:RequiredFieldValidator ID="rfvDesc" runat="server" 
                                                    ControlToValidate="tbxDescricao" Display="None" 
                                                    ErrorMessage="Campo obrigatório" ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                                                <ajaxToolkit:ValidatorCalloutExtender ID="rfvDesc_ValidatorCalloutExtender" 
                                                    runat="server" Enabled="True" TargetControlID="rfvDesc">
                                                </ajaxToolkit:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                            </asp:MultiView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSCandidatoInscrito" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT 
	i.IDInscricao,
	c.Nome,
	c.indice,
	Aprovacao,
	IDMotivoReprovacao,
	(SELECT MotivoReprovacao FROM psgMotivoReprovacao mr WHERE mr.IDMotivoReprovacao = i.IDMotivoReprovacao)AS Motivo,
	DataHoraAprovacao,
	Descricao
FROM 
	psgInscricao i,
	psgCandidato c,
	psgTurma t,
	psgCurso cu 
WHERE 
	i.IDCandidato = c.IDCandidato AND
	i.IDTurma     = t.IDTurma     AND 
	t.IDCurso     = cu.IDCurso    AND
	t.Ativo       = 1             AND
	cu.Ativo      = 1             AND
	t.IDCurso     = @IDCurso      AND
	t.IDUnidade   = @IDUnidade    AND
	t.IDTurma     = @IDTurma
ORDER BY 
	c.indice, c.RendaBrutaPessoal, c.Ordem, c.DataNascimemto, c.DataHoraRegistro
" UpdateCommand="UPDATE psgInscricao SET 
Aprovacao          = @Aprovacao,
IDMotivoReprovacao = @IDMotivoReprovacao,
DataHoraAprovacao  = GETDATE(),
Descricao          = @Descricao
WHERE
IDInscricao        = @IDInscricao">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtIDCurso" Name="IDCurso" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtIDUnidade" Name="IDUnidade" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtIDTurma" Name="IDTurma" 
                                        PropertyName="Text" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="tbxID" Name="IDInscricao" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="rbSNE" Name="Aprovacao" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="ddlMotivo" Name="IDMotivoReprovacao" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="tbxDescricao" Name="Descricao" 
                                        PropertyName="Text" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:SqlDataSource ID="SqlDSMotivoReprovacao" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT NULL AS IDMotivoReprovacao,NULL AS MotivoReprovacao
UNION ALL
SELECT IDMotivoReprovacao,MotivoReprovacao FROM psgMotivoReprovacao WHERE Ativo = 1 ORDER BY MotivoReprovacao
"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="tbxID" runat="server" Visible="False"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="VieAnalisarDados" runat="server">
            
                <asp:Button ID="btnVoltar0" runat="server" Text="Voltar" Width="100px" />
                <br />
                <br />
                <asp:Panel ID="Panel2" runat="server" GroupingText="CURSO  DE INTERESSE" 
                    Width="100%">
                    <asp:Panel ID="PnlOpcaoTriagem0" runat="server" BorderColor="#CCCCCC" 
                        Width="100%">
                        <br />
                        <table style="width:100%;">
                            <tr>
                                <td align="right" width="17%">
                                    <asp:Label ID="lblUnidadeInteresse1" runat="server" Font-Bold="True" 
                                        Text="Unidade:"></asp:Label>
                                </td>
                                <td width="50%">
                                    <asp:Label ID="lblUnidadeInteresse2" runat="server" Font-Bold="False" 
                                        Text="Unidade:"></asp:Label>
                                </td>
                                <td align="right" width="20%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" width="15%">
                                    <asp:Label ID="lblEventoInteresse1" runat="server" Font-Bold="True" 
                                        Text="Curso:"></asp:Label>
                                </td>
                                <td width="75%">
                                    <asp:Label ID="lblEventoInteresse2" runat="server" Font-Bold="False" 
                                        Text="Curso:"></asp:Label>
                                </td>
                                <td align="right" width="10%">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table style="width:100%;">
                            <tr>
                                <td align="right" width="17%">
                                    <asp:Label ID="lblDtInicioInteresse1" runat="server" Font-Bold="True" 
                                        Text="Início inscrição:"></asp:Label>
                                </td>
                                <td width="10%">
                                    <asp:Label ID="lblDtInicioInteresse2" runat="server" Font-Bold="False" 
                                        Text="Data Início:"></asp:Label>
                                </td>
                                <td align="right" width="15%">
                                    <asp:Label ID="lblDtFimInteresse1" runat="server" Font-Bold="True" 
                                        Text="Término inscrição:"></asp:Label>
                                </td>
                                <td width="62%">
                                    <asp:Label ID="lblDtFimInteresse2" runat="server" Font-Bold="False" 
                                        Text="Data Término:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblHrInicioInteresse1" runat="server" Font-Bold="True" 
                                        Text="Início curso:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblHrInicioInteresse2" runat="server" Font-Bold="False" 
                                        Text="Hora Início:"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblHrFimInteresse1" runat="server" Font-Bold="True" 
                                        Text="Término curso:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblHrFimInteresse2" runat="server" Font-Bold="False" 
                                        Text="Hora Término:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width:100%;">
                            <tr>
                                <td align="right" width="17%">
                                    <asp:Label ID="lblNVagasInteresse1" runat="server" Font-Bold="True" 
                                        Text="Número de vagas:"></asp:Label>
                                </td>
                                <td width="75%">
                                    <asp:Label ID="lblNVagasInteresse2" runat="server" Font-Bold="False" 
                                        Text="Número de vagas:"></asp:Label>
                                </td>
                                <td align="right" width="10%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblNInscInteresse1" runat="server" Font-Bold="True" 
                                        Text="Número de inscritos:"></asp:Label>
                                </td>
                                <td width="75%">
                                    <asp:Label ID="lblNInscInteresse2" runat="server" Font-Bold="False" 
                                        Text="Número de inscritos:"></asp:Label>
                                </td>
                                <td align="right" width="10%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblDiasSemanaInteresse1" runat="server" Font-Bold="True" 
                                        Text="Turno:"></asp:Label>
                                </td>
                                <td width="75%">
                                    <asp:Label ID="lblDiasSemanaInteresse2" runat="server" Font-Bold="False" 
                                        Text="Dias da semana:"></asp:Label>
                                </td>
                                <td align="right" width="10%">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </asp:Panel>
                <br />
                <table style="border: 1px solid #C0C0C0; width: 100%; background-color: #FFFF99;">
                    <tr>
                        <td>
                            <b>CÁLULO DO ÍNDICE PSG:</b></td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <b>CRITÉRIOS DE DESEMPATE:</b></td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            ÍNDICEPSG = (RF*DF*PF*EB*CT*APS)/GF, onde:<br />
                            <br />
                            RF = renda familiar bruta (somatório da renda familiar, incluindo renda do 
                            candidato);<br />
                            DF = pessoa com deficiência (não = 1; sim = 0,8);<br />
                            PF = posição na família (dependente = 1; arrimo = 0,8);<br />
                            EB = condição na educação básica – egresso ou matriculado (egresso da educação 
                            básica = 0,8; matriculado na educação básica = 0,2);<br />
                            CT = condição de trabalho – empregado, desempregado ou candidato a primeiro 
                            emprego (primeiro emprego = 1;empregado/desempregado = 0,5);<br />
                            APS = egresso do Programa de Aprendizagem/outro programa gratuito do Senac (sim 
                            = 0,8; não = 1);<br />
                            GF = grupo familiar (número de membros do núcleo familiar, incluindo o 
                            candidato).<br />
                            <br />
                            Quanto menor for o Índice PSG mais bem colocado o candidato estará no processo 
                            seletivo.</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            Caso haja alunos com o mesmo índice PSG, os critérios para desempate são por 
                            ordem:<br />
                            <br />
                            1º - menor renda per capita;<br />
                            2º - ser aluno da educação básica e trabalhador;<br />
                            3º - ser aluno da educação básica;<br />
                            4º - ser egresso da educação básica;<br />
                            5º - ser trabalhador desempregado;<br />
                            6º - ser trabalhador empregado;<br />
                            7º - ser pessoa com deficiência;<br />
                            8º - ser egresso do Programa de Aprendizagem ou de outro programa gratuito 
                            oferecido pelo Senac;<br />
                            9º - candidato mais idoso;<br />
                            10º - ordem de inscrição.</td>
                    </tr>
                </table>
            
                <br />
                <asp:SqlDataSource ID="SqlDataSAnaliseDados" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                    
                    SelectCommand="SELECT Nome, IndicePSG,ROW_NUMBER()OVER (ORDER BY psgVwCandidatoAnalitico.indicePSG, psgVwCandidatoAnalitico.RendaBrutaPessoal, psgVwCandidatoAnalitico.Ordem, psgVwCandidatoAnalitico.DataNascimemto, psgVwCandidatoAnalitico.DataHoraRegistro) as Rank, RF, DF1, DF2, PF1, PF2, EB1, EB2, CT1, CT2, APS1, APS2, GF, RendaBrutaPessoal, AlunoEducacaoBasicaTrabalhador, AlunoEducacaoBasica, EgressoEducacaoBasica, TrabalhadorDesempregado, TrabalhadorEmpregado, PessoaComDeficiencia, EgressoPrograma, DataNascimemto, DataHoraRegistro, Ordem, IDCurso, IDUnidade, IDTurma, RF / GF AS RendaPercapita FROM psgVwCandidatoAnalitico WHERE (IDCurso = @IDCurso) AND (IDUnidade = @IDUnidade) AND (IDTurma = @IDTurma) ORDER BY IndicePSG, RendaBrutaPessoal, Ordem, DataNascimemto, DataHoraRegistro">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtIDCurso" Name="IDCurso" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtIDUnidade" Name="IDUnidade" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtIDTurma" Name="IDTurma" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            
            </asp:View>
            <asp:View ID="View1" runat="server">
                <div>
                    <br />
                    <br />
                    <asp:Panel ID="pnlTransferencia" runat="server">
                        <br />
                        <asp:Label ID="lblMsg" runat="server" style="color: #FF0000"></asp:Label>
                        <table class="style1">
                            <tr>
                                <td class="style4">
                                    De:</td>
                                <td class="style3">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Nome:</td>
                                <td class="style3">
                                    <asp:Label ID="lblNome" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Curso:</td>
                                <td class="style3">
                                    <asp:Label ID="lblcursot" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Unidade:</td>
                                <td class="style3">
                                    <asp:Label ID="lblunidadet" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Turno:</td>
                                <td class="style3">
                                    <asp:Label ID="lblturnot" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td class="style3">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    Para:</td>
                                <td class="style3">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Curso:</td>
                                <td class="style3">
                                    <asp:DropDownList ID="ddlCursot" runat="server" AutoPostBack="True" 
                                        DataSourceID="sdsCurso" DataTextField="Curso" DataValueField="IDCurso">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Unidade:</td>
                                <td class="style3">
                                    <asp:DropDownList ID="ddlUnidadet" runat="server" AutoPostBack="True" 
                                        DataSourceID="sdsUnidade" DataTextField="Unidade" DataValueField="IDUnidade">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Turma:</td>
                                <td class="style3">
                                    <asp:DropDownList ID="ddlTurma" runat="server" AutoPostBack="True" 
                                        DataSourceID="sdsTurmas" DataTextField="Data" DataValueField="IDTurma">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Turno:</td>
                                <td class="style6">
                                    <asp:DropDownList ID="ddlTurnot" runat="server" Enabled="False">
                                        <asp:ListItem Value="1">Manhã</asp:ListItem>
                                        <asp:ListItem Value="2">Tarde</asp:ListItem>
                                        <asp:ListItem Value="3">Noite</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style7">
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" valign="top">
                                    Motivo:</td>
                                <td class="style3">
                                    <asp:TextBox ID="txtMotivo" runat="server" Height="171px" TextMode="MultiLine" 
                                        Width="500px"></asp:TextBox>
                                </td>
                                <td valign="top">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtMotivo" ErrorMessage="* Motivo obrigatório" 
                                        ValidationGroup="transferir"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" valign="top">
                                    &nbsp;</td>
                                <td class="style3">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td class="style3">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnSalvar0" runat="server" Text="Salvar" 
                                        ValidationGroup="transferir" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
                                        Text="Voltar" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </asp:Panel>
                    <asp:SqlDataSource ID="sdsTurmas" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                        
                        
                        SelectCommand="SELECT IDTurma, IDCurso, IDUnidade, CAST(CONVERT (varchar, DataInicioCurso, 103) AS varchar) + ' - ' + CAST(CONVERT (varchar, DataTerminoCurso, 103) AS varchar) AS Data FROM psgTurma WHERE (IDCurso = @IDCurso) AND (IDUnidade = @IDUnidade) AND (Ativo = 1)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCursot" Name="IDCurso" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlUnidadet" Name="IDUnidade" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:SqlDataSource ID="sdsUnidade" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT
IDUnidade, Unidade 
FROM psgUnidade
WHERE IDUnidade IN (SELECT IDUnidade FROM psgTurma WHERE IDCurso=@IDCurso)
ORDER BY Unidade">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCursot" Name="IDCurso" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsRegistraTransferencia" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                        DeleteCommand="DELETE FROM [psgTransferencia] WHERE [IDTransferencia] = @IDTransferencia" 
                        InsertCommand="INSERT INTO psgTransferencia(IDUnidadeDe, IDUnidadePara, IDCursoDe, IDCursoPara, IDTurmaDe, IDTurmaPara, IDCandidato, Motivo) VALUES (@IDUnidadeDe, @IDUnidadePara, @IDCursoDe, @IDCursoPara, @IDTurmaDe, @IDTurmaPara, @IDCandidato, @Motivo)" 
                        SelectCommand="SELECT * FROM [psgTransferencia]" 
                        UpdateCommand="UPDATE [psgTransferencia] SET [IDUnidadeDe] = @IDUnidadeDe, [IDUnidadePara] = @IDUnidadePara, [IDCursoDe] = @IDCursoDe, [IDCursoPara] = @IDCursoPara, [IDTurmaDe] = @IDTurmaDe, [IDTurmaPara] = @IDTurmaPara, [IDCandidato] = @IDCandidato, [Motivo] = @Motivo WHERE [IDTransferencia] = @IDTransferencia">
                        <DeleteParameters>
                            <asp:Parameter Name="IDTransferencia" Type="Int16" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="IDUnidadeDe" Type="Int16" />
                            <asp:Parameter Name="IDUnidadePara" Type="Int16" />
                            <asp:Parameter Name="IDCursoDe" Type="Int16" />
                            <asp:Parameter Name="IDCursoPara" Type="Int16" />
                            <asp:Parameter Name="IDTurmaDe" Type="Int16" />
                            <asp:Parameter Name="IDTurmaPara" Type="Int16" />
                            <asp:Parameter Name="IDCandidato" Type="Int16" />
                            <asp:Parameter Name="Motivo" Type="String" />
                            <asp:Parameter Name="IDTransferencia" Type="Int16" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="IDUnidadeDe" SessionField="idunidadede" 
                                Type="Int16" />
                            <asp:ControlParameter ControlID="ddlUnidadet" Name="IDUnidadePara" 
                                PropertyName="SelectedValue" Type="Int16" />
                            <asp:SessionParameter Name="IDCursoDe" SessionField="idcursode" Type="Int16" />
                            <asp:ControlParameter ControlID="ddlCursot" Name="IDCursoPara" 
                                PropertyName="SelectedValue" Type="Int16" />
                            <asp:SessionParameter Name="IDTurmaDe" SessionField="idturmade" Type="Int16" />
                            <asp:ControlParameter ControlID="ddlTurma" Name="IDTurmaPara" 
                                PropertyName="SelectedValue" Type="Int16" />
                            <asp:SessionParameter Name="IDCandidato" SessionField="idcandidato" 
                                Type="Int16" />
                            <asp:ControlParameter ControlID="txtMotivo" Name="Motivo" PropertyName="Text" 
                                Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsTransferir" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                        DeleteCommand="DELETE FROM [psgInscricao] WHERE [IDInscricao] = @IDInscricao" 
                        InsertCommand="INSERT INTO [psgInscricao] ([IDInscricao], [Protocolo], [Ano], [IDCandidato], [DataHoraRegistro], [IDTurma], [Aprovacao], [DataHoraAprovacao], [IDMotivoReprovacao], [Descricao], [Inativo], [DataInativo], [MotivoInativo]) VALUES (@IDInscricao, @Protocolo, @Ano, @IDCandidato, @DataHoraRegistro, @IDTurma, @Aprovacao, @DataHoraAprovacao, @IDMotivoReprovacao, @Descricao, @Inativo, @DataInativo, @MotivoInativo)" 
                        SelectCommand="SELECT * FROM [psgInscricao]" 
                        UpdateCommand="UPDATE psgInscricao SET IDTurma = @IDTurma WHERE (IDInscricao = @IDInscricao)">
                        <DeleteParameters>
                            <asp:Parameter Name="IDInscricao" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="ddlTurma" Name="IDTurma" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="gvwCandidatos" Name="IDInscricao" 
                                PropertyName="SelectedValue" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="IDInscricao" Type="Int32" />
                            <asp:Parameter Name="Protocolo" Type="Int16" />
                            <asp:Parameter Name="Ano" Type="Int16" />
                            <asp:Parameter Name="IDCandidato" Type="Int32" />
                            <asp:Parameter Name="DataHoraRegistro" Type="DateTime" />
                            <asp:Parameter Name="IDTurma" Type="Int16" />
                            <asp:Parameter Name="Aprovacao" Type="Boolean" />
                            <asp:Parameter Name="DataHoraAprovacao" Type="DateTime" />
                            <asp:Parameter Name="IDMotivoReprovacao" Type="Byte" />
                            <asp:Parameter Name="Descricao" Type="String" />
                            <asp:Parameter Name="Inativo" Type="Boolean" />
                            <asp:Parameter Name="DataInativo" Type="DateTime" />
                            <asp:Parameter Name="MotivoInativo" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsCurso" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                        SelectCommand="SELECT DISTINCT IDCurso, Curso FROM psgCurso ORDER BY Curso">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsTurno" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT MIN(A.IDTurma) AS IDTurma, A.Turno
	FROM (SELECT	IDTurma,
					(CASE Turno WHEN 1 THEN 'Manhã' 
						WHEN 2 THEN 'Tarde'
						WHEN 3 THEN 'Noite'
						END) + ' - Processo Seletivo: ' +
					CAST(ProcessoSeletivoAno AS VARCHAR(4))+'.'+
					CAST(ProcessoSeletivoSeq AS VARCHAR(2)) As Turno
		FROM psgTurma
		WHERE IDCurso = @IDCurso AND IDUnidade = @IDUnidade) A
GROUP BY A.Turno">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCursot" Name="IDCurso" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlUnidadet" Name="IDUnidade" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </asp:View>
        </asp:MultiView>
        <br />
        
    
    </div>
    </form>
</body>
</html>
