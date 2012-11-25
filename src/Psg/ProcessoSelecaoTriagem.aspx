<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProcessoSelecaoTriagem.aspx.vb" Inherits="ProcessoSelecaoTriagem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                <asp:Label ID="lblTitulo" runat="server" Text="CONSULTAR INSCRITOS" 
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
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
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
                        <asp:Label ID="lblResult" runat="server" 
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
t.Turno = (CASE @Turno WHEN '' THEN t.Turno ELSE @Turno END)AND

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
                        <asp:ControlParameter ControlID="ddlTurno" ConvertEmptyStringToNull="False" 
                            Name="Turno" PropertyName="SelectedValue" Type="String" />
                        <asp:SessionParameter DefaultValue="" Name="IDUsuario" 
                            SessionField="c_IDUsuario" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDSUnidade" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT NULL AS IDUnidade,NULL AS Unidade 
UNION ALL
SELECT IDUnidade,Unidade FROM psgUnidade u 
ORDER BY  Unidade
">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="IDUsuario" 
                            SessionField="c_IDUsuario" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
                                    &nbsp;<asp:ImageButton ID="btnCandidatos" visible="false" runat="server" 
                                        ImageUrl="~/Icones/imprimir.jpg" />
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
                                        Text="Início inscrição:"></asp:Label>
                                </td>
                                <td width="10%">
                                    <asp:Label ID="lblDtInicioInteresse0" runat="server" Font-Bold="False" 
                                        Text="Data Início:"></asp:Label>
                                </td>
                                <td align="right" width="15%">
                                    <asp:Label ID="lblDtFimInteresse" runat="server" Font-Bold="True" 
                                        Text="Término inscrição:"></asp:Label>
                                </td>
                                <td width="62%">
                                    <asp:Label ID="lblDtFimInteresse0" runat="server" Font-Bold="False" 
                                        Text="Data Término:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblHrInicioInteresse" runat="server" Font-Bold="True" 
                                        Text="Início curso:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblHrInicioInteresse0" runat="server" Font-Bold="False" 
                                        Text="Hora Início:"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lblHrFimInteresse" runat="server" Font-Bold="True" 
                                        Text="Término curso:"></asp:Label>
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
                                    &nbsp;<asp:ImageButton ID="btnImprimir" runat="server" 
                                        ImageUrl="~/Icones/imprimir.jpg" />
                                    &nbsp;
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
                                    &nbsp;</td>
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
                                <td align="right" width="10%">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </asp:Panel>
                <br />
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" Width="100px" />
                <asp:Button ID="Button1" runat="server" Text="Analisar Dados" />
                <br />
                <br />
                <asp:Label ID="lblaprovacao" runat="server" Font-Bold="True" 
                    ForeColor="Black" Text="CANDIDATOS INSCRITOS"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="gvwCandidatos" runat="server" AutoGenerateColumns="False" 
                    CaptionAlign="Left" DataSourceID="SqlDataSCandidatoInscrito" Width="98%" 
                    DataKeyNames="IDCandidato">
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            SelectImageUrl="~/Icones/PNG/Blue/18/arrow_right.png" ShowSelectButton="True" />
                        <asp:BoundField DataField="Nome" HeaderText="Solicitante" SortExpression="Nome">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="60%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="60%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="indice" HeaderText="Índice" SortExpression="indice" 
                            DataFormatString="{0:n4}">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rank" HeaderText="Ranking" ReadOnly="True" 
                            SortExpression="Rank">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="lblResult" runat="server" Text="Nenhum candidato inscrito."></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSCandidatoInscrito" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT c.IDCandidato,
	c.Nome, c.indice,
	ROW_NUMBER()OVER (ORDER BY c.indice, c.RendaBrutaPessoal, 
						c.Ordem, c.DataNascimemto, c.DataHoraRegistro)AS Rank
FROM 
	psgInscricao i,
	psgCandidato c,
	psgTurma t,
	psgCurso cu 
WHERE 
	i.IDCandidato = c.IDCandidato	AND
	i.IDTurma     = t.IDTurma		AND 
	t.IDCurso     = cu.IDCurso		AND
	t.Ativo       = 1				AND
	cu.Ativo      = 1				AND
	t.IDCurso     = @IDCurso      AND
	t.IDUnidade   = @IDUnidade    AND
	t.IDTurma     = @IDTurma
ORDER BY 
	c.indice, c.RendaBrutaPessoal, c.Ordem, c.DataNascimemto, c.DataHoraRegistro
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtIDCurso" Name="IDCurso" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtIDUnidade" Name="IDUnidade" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtIDTurma" Name="IDTurma" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
                <asp:GridView ID="gdvAnaliseDados" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IDTurma" DataSourceID="SqlDataSAnaliseDados" 
                    AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="Nome" HeaderText="Candidato" SortExpression="Nome" />
                        <asp:BoundField DataField="IndicePSG" HeaderText="Índice PSG" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="IndicePSG" 
                            DataFormatString="{0:n4}" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rank" HeaderText="Rank" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="Rank" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RF" HeaderText="RF" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="RF" 
                            DataFormatString="{0:c}" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DF1" HeaderText="DF" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="DF1" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DF2" ReadOnly="True" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="DF2" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PF1" HeaderText="PF" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="PF1" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PF2" ReadOnly="True" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="PF2" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EB1" HeaderText="EB" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="EB1" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EB2" ReadOnly="True" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="EB2" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CT1" HeaderText="CT" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="CT1" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CT2" ReadOnly="True" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="CT2" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="APS1" HeaderText="APS" 
                            ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="APS1" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="APS2" ReadOnly="True" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="APS2" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GF" HeaderText="GF" 
                            ItemStyle-HorizontalAlign="Center" SortExpression="GF" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RendaPercapita" 
                            ItemStyle-HorizontalAlign="Center" HeaderText="Renda Per Capita" 
                            SortExpression="RendaPercapita" DataFormatString="{0:c}" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AlunoEducacaoBasicaTrabalhador" 
                            ItemStyle-HorizontalAlign="Center" 
                            HeaderText="Aluno Educação Básica Trabalhador" ReadOnly="True" 
                            SortExpression="AlunoEducacaoBasicaTrabalhador" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AlunoEducacaoBasica" 
                            ItemStyle-HorizontalAlign="Center" HeaderText="Aluno Educação Básica" 
                            ReadOnly="True" SortExpression="AlunoEducacaoBasica" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EgressoEducacaoBasica" 
                            ItemStyle-HorizontalAlign="Center" HeaderText="Egresso Educação Básica" 
                            ReadOnly="True" SortExpression="EgressoEducacaoBasica" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TrabalhadorDesempregado" 
                            ItemStyle-HorizontalAlign="Center" HeaderText="Trabalhador Desempregado" 
                            ReadOnly="True" SortExpression="TrabalhadorDesempregado" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TrabalhadorEmpregado" 
                            ItemStyle-HorizontalAlign="Center" HeaderText="Trabalhador Empregado" 
                            ReadOnly="True" SortExpression="TrabalhadorEmpregado" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PessoaComDeficiencia" 
                            ItemStyle-HorizontalAlign="Center" HeaderText="Pessoa c/ Deficiência" 
                            ReadOnly="True" SortExpression="PessoaComDeficiencia" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EgressoPrograma" ItemStyle-HorizontalAlign="Center" 
                            HeaderText="Egresso Programa" ReadOnly="True" SortExpression="EgressoPrograma" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataNascimemto" ItemStyle-HorizontalAlign="Center" 
                            HeaderText="Nascimemto" SortExpression="DataNascimemto" 
                            DataFormatString="{0:dd/MM/yyyy}">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataHoraRegistro" ItemStyle-HorizontalAlign="Center" 
                            HeaderText="Registro" SortExpression="DataHoraRegistro" 
                            DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSAnaliseDados" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                    
                    SelectCommand="SELECT Nome, IndicePSG, ROW_NUMBER()OVER (ORDER BY psgVwCandidatoAnalitico.indicePSG, psgVwCandidatoAnalitico.RendaBrutaPessoal, psgVwCandidatoAnalitico.Ordem, psgVwCandidatoAnalitico.DataNascimemto, psgVwCandidatoAnalitico.DataHoraRegistro) AS Rank, RF, DF1, DF2, PF1, PF2, EB1, EB2, CT1, CT2, APS1, APS2, GF, RendaBrutaPessoal, AlunoEducacaoBasicaTrabalhador, AlunoEducacaoBasica, EgressoEducacaoBasica, TrabalhadorDesempregado, TrabalhadorEmpregado, PessoaComDeficiencia, EgressoPrograma, DataNascimemto, DataHoraRegistro, Ordem, IDCurso, IDUnidade, IDTurma, RF / GF AS RendaPercapita FROM psgVwCandidatoAnalitico WHERE (IDCurso = @IDCurso) AND (IDUnidade = @IDUnidade) AND (IDTurma = @IDTurma) ORDER BY IndicePSG, RendaBrutaPessoal, Ordem, DataNascimemto, DataHoraRegistro">
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
        </asp:MultiView>
        <br />
        
    
    </div>
    </form>
</body>
</html>
