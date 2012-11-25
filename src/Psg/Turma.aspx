<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Turma.aspx.vb" Inherits="Turma" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ScriptManager>
                <asp:Label ID="lblTitulo" runat="server" Text="TURMAS" Font-Bold="True"></asp:Label>
                <br />
        <br />
        <asp:MultiView ID="mtvTurma" runat="server" ActiveViewIndex="0">
            <asp:View ID="VieTurmas" runat="server">
                <asp:Panel ID="PnlCurso" runat="server" GroupingText="FILTRO" Width="89%">
                    <table style="width:100%;">
                        <tr>
                            <td align="right" width="16%">
                                <asp:Label ID="lblUnidade" runat="server" Font-Bold="False" Text="Unidade:"></asp:Label>
                            </td>
                            <td width="60%">
                                <asp:DropDownList ID="ddlUnidadesFiltro" runat="server" 
                                    DataSourceID="SqlDSUnidades" DataTextField="Unidade" DataValueField="IDUnidade" 
                                    Width="80%">
                                </asp:DropDownList>
                                &nbsp;
                                <asp:CheckBox ID="cbxAtivoFiltro" runat="server" Checked="True" Text="Ativo" />
                            </td>
                            <td width="34%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" width="10%">
                                <asp:Label ID="lblCursos" runat="server" Font-Bold="False" Text="Curso:"></asp:Label>
                            </td>
                            <td width="70%">
                                <asp:TextBox ID="tbxDesc" runat="server" Width="89.3%"></asp:TextBox>
                            </td>
                            <td width="15%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" width="10%">
                                <asp:Label ID="lblNRegistro0" runat="server" Text="Registros por página:"></asp:Label>
                            </td>
                            <td width="70%">
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
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnFiltrar" runat="server" Text="Buscar" Width="100px" />
                            </td>
                            <td width="15%">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Button ID="btnNovo" runat="server" Text="Novo" Width="100px" />
                <asp:Button ID="btnAlterar" runat="server" Text="Alterar" Width="100px" />
                <br />
                <br />
                <asp:GridView ID="gvwTurma" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="IDTurma" DataSourceID="SqlDSTurma" 
                    Width="89%" PageSize="5">
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            SelectImageUrl="~/Icones/PNG/Blue/18/arrow_right.png" SelectText="Selecionar" 
                            ShowSelectButton="True">
                        <HeaderStyle Width="1%" />
                        <ItemStyle Width="1%" />
                        </asp:CommandField>
                        <asp:BoundField DataField="IDTurma" HeaderText="IDTurma" InsertVisible="False" 
                            ReadOnly="True" SortExpression="IDTurma" Visible="False" />
                        <asp:BoundField DataField="IDCurso" HeaderText="IDCurso" SortExpression="IDCurso" 
                            Visible="False" />
                        <asp:BoundField DataField="ProcessoSeletivo" HeaderText="Processo Seletivo" 
                            SortExpression="ProcessoSeletivo" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Curso" HeaderText="Curso" SortExpression="Curso" 
                            ReadOnly="True">
                        </asp:BoundField>
                        <asp:BoundField DataField="IDUnidade" HeaderText="IDUnidade" 
                            SortExpression="IDUnidade" Visible="False">
                        </asp:BoundField>
                        <asp:BoundField DataField="Unidade" HeaderText="Unidade" ReadOnly="True" 
                            SortExpression="Unidade">
                        </asp:BoundField>
                        <asp:BoundField DataField="DataInicioInscricao" HeaderText="Início de Inscrição" 
                            SortExpression="DataInicioInscricao">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataTerminoInscricao" HeaderText="Término de Inscrição" 
                            SortExpression="DataTerminoInscricao">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataInicioCurso" HeaderText="Início do Curso" 
                            SortExpression="DataInicioCurso">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DataTerminoCurso" HeaderText="Término do Curso" 
                            SortExpression="DataTerminoCurso">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Turno" HeaderText="Turno" SortExpression="Turno">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TipoTurma" HeaderText="Tipo da Turma" 
                            SortExpression="TipoTurma">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Ativo" HeaderText="Ativo" SortExpression="Ativo">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CheckBoxField>
                        <asp:CheckBoxField DataField="Cancelada" HeaderText="Cancelada">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CheckBoxField>
                        <asp:BoundField DataField="TotalVagas" HeaderText="Vagas" 
                            SortExpression="TotalVagas">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    AlternateText='<%# "Excluir a turma do curso de " &  Eval("Curso") & "da unidade de " & Eval("unidade") %>' 
                                    CommandArgument='<%# Eval("IDTurma") %>' CommandName="Excluir" 
                                    ImageUrl="~/Icones/PNG/yellow/18/close.png" 
                                    Visible='<%# Eval("PodeExcluir") %>' />
                                <ajaxToolkit:ConfirmButtonExtender ID="ImageButton1_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="Deseja realmente excluir esta turma?" 
                                    Enabled="True" TargetControlID="ImageButton1">
                                </ajaxToolkit:ConfirmButtonExtender>
                                <asp:ImageButton ID="ImageButton2" runat="server" 
                                    AlternateText='<%# "Excluir a turma do curso de " &  Eval("Curso") & "da unidade de " & Eval("unidade") %>' 
                                    ImageUrl="~/Icones/PNG/yellow/18/close.png" 
                                    onclientclick="alert('Atenção, existem candidatos inscritos para esta turma, exclusão não poderá ser realizada.')" 
                                    Visible='<%# Eval("NPodeExcluir") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <asp:Label ID="Label1" runat="server" Text="Não há dados para esta consulta"></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:DetailsView ID="dvwEvento" runat="server" AutoGenerateRows="False" 
                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                    DataSourceID="SqlDSDetalhe" GridLines="None" Height="16px" Width="89%">
                    <Fields>
                        <asp:BoundField DataField="Total" HeaderText="Total de registros:" 
                            HtmlEncode="False" ReadOnly="True" SortExpression="Total">
                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Width="53%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="47%" />
                        </asp:BoundField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDSDetalhe" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT 
COUNT(*)AS Total
FROM 
psgTurma t
WHERE 
Ativo = (CASE @Ativo WHEN '' THEN Ativo ELSE @Ativo END)AND
IDUnidade = (CASE @IDUnidade WHEN '' THEN IDUnidade ELSE @IDUnidade END)AND
EXISTS(SELECT Curso FROM psgCurso c WHERE c.IDCurso = t.IDCurso AND Curso LIKE '%' + @Evento  + '%')
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbxAtivoFiltro" 
                            ConvertEmptyStringToNull="False" Name="Ativo" PropertyName="Checked" 
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlUnidadesFiltro" 
                            ConvertEmptyStringToNull="False" Name="IDUnidade" PropertyName="SelectedValue" 
                            Type="String" />
                        <asp:ControlParameter ControlID="tbxDesc" ConvertEmptyStringToNull="False" 
                            Name="Evento" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDSTurma" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                    DeleteCommand="DELETE FROM psgTurma WHERE IDTurma = @ID" InsertCommand="INSERT INTO psgTurma
           (
			IDCurso
           ,IDUnidade
           ,DataInicio
           ,DataTermino
           ,HoraInicio
           ,HoraTermino
           ,Segunda
           ,Terca
           ,Quarta
           ,Quinta
           ,Sexta
           ,Sabado
           ,Domingo
           ,Ativo
           ,TotalVagas
			)
     VALUES
           (
			@IDCurso
           ,@IDUnidade
           ,@DataInicio
           ,@DataTermino
           ,@HoraInicio
           ,@HoraTermino
           ,@Segunda
           ,@Terca
           ,@Quarta
           ,@Quinta
           ,@Sexta
           ,@Sabado
           ,@Domingo
           ,@Ativo
           ,@TotalVagas
			)" SelectCommand="SELECT 
IDTurma, 
IDCurso,
(SELECT Curso +' - '+ Tipo FROM psgCurso c,psgCursoTipo ct WHERE c.IDTipo = ct.IDTipo AND c.IDCurso = t.IDCurso)AS Curso,
IDUnidade,
(SELECT Unidade FROM psgUnidade u WHERE u.IDUnidade = t.IDUnidade)AS Unidade,

--CONVERT(VARCHAR,DataInicio,103)AS DataInicio,
--CONVERT(VARCHAR,DataTermino,103)AS DataTermino,
--HoraInicio,
--HoraTermino,
--Segunda,
--Terca,
--Quarta,
--Quinta,
--Sexta,
--Sabado,
--Domingo,
CONVERT(VARCHAR,DataInicioInscricao,103)AS DataInicioInscricao,
CONVERT(VARCHAR,DataTerminoInscricao,103)AS DataTerminoInscricao,
CONVERT(VARCHAR,DataInicioCurso,103)AS DataInicioCurso,
CONVERT(VARCHAR,DataTerminoCurso,103)AS DataTerminoCurso,
CASE TURNO WHEN 1 THEN 'Manha' ELSE (CASE TURNO WHEN 2 THEN 'Tarde' ELSE 'Noite' END)END AS Turno,
CAST(ProcessoSeletivoAno AS VARCHAR(4))+'.'+CAST(ProcessoSeletivoSeq AS VARCHAR(2)) AS ProcessoSeletivo,
Cancelada,
CASE WHEN DedicadaMista=1 THEN 'Dedicada' ELSE 'Mista' END AS TipoTurma,
Ativo,
CASE WHEN ISNULL((SELECT TOP 1 i.IDturma FROM psgInscricao i WHERE i.IDturma = t.IDturma),0) = 0 THEN 1 ELSE 0 END AS PodeExcluir,
CASE WHEN ISNULL((SELECT TOP 1 i.IDturma FROM psgInscricao i WHERE i.IDturma = t.IDturma),0) = 0 THEN 0 ELSE 1 END AS NPodeExcluir,
TotalVagas
FROM 
psgTurma t
WHERE 
t.Ativo = (CASE @Ativo WHEN '' THEN t.Ativo ELSE @Ativo END)AND
t.IDUnidade = (CASE @IDUnidade WHEN '' THEN t.IDUnidade ELSE @IDUnidade END)AND
EXISTS(SELECT Curso FROM psgCurso c WHERE c.IDCurso = t.IDCurso AND Curso LIKE '%' + @Evento  + '%')
ORDER BY 
Curso" UpdateCommand="UPDATE psgTurma
   SET IDCurso     = @IDCurso
      ,IDUnidade   = @IDUnidade
      ,DataInicio  = @DataInicio
      ,DataTermino = @DataTermino
      ,HoraInicio  = @HoraInicio
      ,HoraTermino = @HoraTermino
      ,Segunda     = @Segunda
      ,Terca       = @Terca
      ,Quarta      = @Quarta
      ,Quinta      = @Quinta
      ,Sexta       = @Sexta
      ,Sabado      = @Sabado
      ,Domingo     = @Domingo
      ,Ativo       = @Ativo
      ,TotalVagas  = @TotalVagas
 WHERE IDTurma     = @ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbxAtivoFiltro" 
                            ConvertEmptyStringToNull="False" Name="Ativo" PropertyName="Checked" 
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlUnidadesFiltro" 
                            ConvertEmptyStringToNull="False" Name="IDUnidade" PropertyName="SelectedValue" 
                            Type="String" />
                        <asp:ControlParameter ControlID="tbxDesc" ConvertEmptyStringToNull="False" 
                            Name="Evento" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="tbxID" Name="ID" PropertyName="Text" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="ddlCurso" Name="IDCurso" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlUnidades" Name="IDUnidade" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tbxDtInicio" Name="DataInicio" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="tbxDtTermino" Name="DataTermino" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="tbxHrInicio" Name="HoraInicio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbxHrTermino" Name="HoraTermino" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="cbxSegunda" Name="Segunda" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxTerca" Name="Terca" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxQuarta" Name="Quarta" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxQuinta" Name="Quinta" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxSexta" Name="Sexta" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxSabado" Name="Sabado" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxDomingo" Name="Domingo" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxAtivo" Name="Ativo" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="tbxTotalVagas" Name="TotalVagas" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbxID" Name="ID" PropertyName="Text" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="ddlCurso" Name="IDCurso" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlUnidades" Name="IDUnidade" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tbxDtInicio" Name="DataInicio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbxDtTermino" Name="DataTermino" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbxHrInicio" Name="HoraInicio" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbxHrTermino" Name="HoraTermino" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="cbxSegunda" Name="Segunda" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxTerca" Name="Terca" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxQuarta" Name="Quarta" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxQuinta" Name="Quinta" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxSexta" Name="Sexta" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxSabado" Name="Sabado" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxDomingo" Name="Domingo" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="cbxAtivo" Name="Ativo" 
                            PropertyName="Checked" />
                        <asp:ControlParameter ControlID="tbxTotalVagas" Name="TotalVagas" 
                            PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="tbxID" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:CheckBox ID="cbxIncluir" runat="server" Visible="False" />
            </asp:View>
            <asp:View ID="VieTurma" runat="server">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" 
                    ValidationGroup="Salvar" Width="100px" />
                <asp:Button ID="btnVoltar" runat="server" CausesValidation="False" 
                    Text="Voltar" Width="100px" />
                <br />
                <br />
                <br />
                <table style="width:100%;">
                    <tr>
                        <td align="right" width="12%">
                            &nbsp;</td>
                        <td width="1%">
                            <asp:Image ID="IObrigatorio" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td width="87%">
                            <asp:Label ID="lblCampoObrigatorio" runat="server" Font-Bold="False" 
                                Text="Campo Obrigatório"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="9%">
                            &nbsp;</td>
                        <td width="1%">
                            &nbsp;</td>
                        <td width="90%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" width="9%">
                            &nbsp;</td>
                        <td width="1%">
                            &nbsp;</td>
                        <td width="90%">
                            <asp:CheckBox ID="cbxAtivo" runat="server" Checked="True" Text="Ativo" />
                            &nbsp;
                            <asp:CheckBox ID="cbxCancelada" runat="server" Checked="True" 
                                Text="Cancelada" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="9%">
                            <asp:Label ID="lblCurso" runat="server" Font-Bold="True" Text="Curso:"></asp:Label>
                        </td>
                        <td width="1%">
                            <asp:Image ID="IObrigatorio0" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td width="90%">
                            <asp:DropDownList ID="ddlCurso" runat="server" DataSourceID="SqlDSCurso" 
                                DataTextField="Curso" DataValueField="IDCurso" Width="70%">
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td align="right" width="9%">
                            <asp:Label ID="lblUnidades" runat="server" Font-Bold="True" Text="Unidade:"></asp:Label>
                        </td>
                        <td width="1%">
                            <asp:Image ID="IObrigatorio2" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td width="90%">
                            <asp:DropDownList ID="ddlUnidades" runat="server" DataSourceID="SqlDSUnidades" 
                                DataTextField="Unidade" DataValueField="IDUnidade" Width="70%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblUnidades0" runat="server" Font-Bold="True" 
                                Text="Processo Seletivo:"></asp:Label>
                        </td>
                        <td valign="top">
                            <img src="../Icones/form_campo_obrigatorio.gif" 
                                style="width: 3px; height: 19px" /></td>
                        <td>
                            <asp:DropDownList ID="ddlAno" runat="server">
                            </asp:DropDownList>
                            &nbsp;
                            <asp:DropDownList ID="ddlSeq" runat="server">
                                <asp:ListItem Selected="True">1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblUnidades1" runat="server" Font-Bold="True" 
                                Text="Tipo de Curso:"></asp:Label>
                        </td>
                        <td valign="top">
                            <img src="../Icones/form_campo_obrigatorio.gif" 
                                style="width: 3px; height: 19px" /></td>
                        <td>
                            <asp:DropDownList ID="ddlTipoCurso" runat="server">
                                <asp:ListItem Selected="True" Value="1">Dedicada</asp:ListItem>
                                <asp:ListItem Value="2">Mista</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblDtInicio" runat="server" Font-Bold="True" 
                                Text="Início de Inscrição:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Image ID="IObrigatorio1" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxDtInicio" runat="server"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="tbxDtInicio_MaskedEditExtender" 
                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                Mask="99/99/9999" MaskType="Date" TargetControlID="tbxDtInicio">
                            </ajaxToolkit:MaskedEditExtender>
                            <ajaxToolkit:CalendarExtender ID="tbxDtInicio_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="tbxDtInicio">
                            </ajaxToolkit:CalendarExtender>
                            &nbsp;<asp:Label ID="Label2" runat="server" Text="dd/mm/yyyy"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblDtTermino" runat="server" Font-Bold="True" 
                                Text="Término Inscrição:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Image ID="IObrigatorio3" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxDtTermino" runat="server"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="tbxDtTermino_MaskedEditExtender" 
                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                Mask="99/99/9999" MaskType="Date" TargetControlID="tbxDtTermino">
                            </ajaxToolkit:MaskedEditExtender>
                            <ajaxToolkit:CalendarExtender ID="tbxDtTermino_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="tbxDtTermino">
                            </ajaxToolkit:CalendarExtender>
                            &nbsp;<asp:Label ID="Label3" runat="server" Text="dd/mm/yyyy"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblHrInicio" runat="server" Font-Bold="True" 
                                Text="Início do Curso:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Image ID="IObrigatorio4" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxDtInicioCurso" runat="server"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="tbxDtInicioCurso_MaskedEditExtender" 
                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                Mask="99/99/9999" MaskType="Date" TargetControlID="tbxDtInicioCurso">
                            </ajaxToolkit:MaskedEditExtender>
                            <ajaxToolkit:CalendarExtender ID="tbxDtInicioCurso_CalendarExtender" 
                                runat="server" Enabled="True" TargetControlID="tbxDtInicioCurso">
                            </ajaxToolkit:CalendarExtender>
                            &nbsp;<asp:Label ID="Label6" runat="server" Text="dd/mm/yyyy"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblHrtermino" runat="server" Font-Bold="True" 
                                Text="Término do Curso:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Image ID="IObrigatorio5" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxDtTerminoCurso" runat="server"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="tbxDtTerminoCurso_MaskedEditExtender" 
                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                Mask="99/99/9999" MaskType="Date" TargetControlID="tbxDtTerminoCurso">
                            </ajaxToolkit:MaskedEditExtender>
                            <ajaxToolkit:CalendarExtender ID="tbxDtTerminoCurso_CalendarExtender" 
                                runat="server" Enabled="True" TargetControlID="tbxDtTerminoCurso">
                            </ajaxToolkit:CalendarExtender>
                            &nbsp;<asp:Label ID="Label7" runat="server" Text="dd/mm/yyyy"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblTurno" runat="server" Font-Bold="True" Text="Turno:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Image ID="IObrigatorio6" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlTurno" runat="server" Width="130px">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="1">Manhã</asp:ListItem>
                                <asp:ListItem Value="2">Tarde</asp:ListItem>
                                <asp:ListItem Value="3">Noite</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblVagas" runat="server" Font-Bold="True" Text="Total de Vagas:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Image ID="IObrigatorio7" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxTotalVagas" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            &nbsp;</td>
                        <td valign="top">
                            &nbsp;</td>
                        <td>
                            <asp:SqlDataSource ID="SqlDSCurso" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                                SelectCommand="SELECT NULL AS IDCurso,NULL AS Curso 
UNION ALL
SELECT c.IDCurso,c.Curso +' - '+ ct.Tipo AS Curso FROM psgCurso c,psgCursoTipo ct WHERE c.IDTipo = ct.IDTipo AND c.Ativo = 1
ORDER BY Curso">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:SqlDataSource ID="SqlDSUnidades" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT NULL AS IDUnidade,NULL AS Unidade
UNION ALL
SELECT IDUnidade,Unidade FROM psgUnidade ORDER BY Unidade 
"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvCurso" runat="server" 
                                ControlToValidate="ddlCurso" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvCurso_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvCurso">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvUnidades" runat="server" 
                                ControlToValidate="ddlUnidades" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvUnidades_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvUnidades">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvDti" runat="server" 
                                ControlToValidate="tbxDtInicio" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvDti_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvDti">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvDtf" runat="server" 
                                ControlToValidate="tbxDtTermino" Display="None" 
                                ErrorMessage="Campo obrigatório" ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvDtf_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvDtf">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvDtic" runat="server" 
                                ControlToValidate="tbxDtInicioCurso" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvDtic_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvDtic">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvDtfc" runat="server" 
                                ControlToValidate="tbxDtTerminoCurso" Display="None" 
                                ErrorMessage="Campo obrigatório" ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvDtfc_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvDtfc">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvTurno" runat="server" 
                                ControlToValidate="ddlTurno" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvTurno_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvTurno">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvVagas" runat="server" 
                                ControlToValidate="tbxTotalVagas" Display="None" 
                                ErrorMessage="Campo obrigatório" ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvVagas_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvVagas">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblDias" runat="server" Font-Bold="True" Text="Dias:" 
                                Visible="False"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:CheckBox ID="cbxDomingo" runat="server" Text="Domingo" Visible="False" />
                            <asp:CheckBox ID="cbxSegunda" runat="server" Text="Segunda" Visible="False" />
                            <asp:CheckBox ID="cbxTerca" runat="server" Text="Terca" Visible="False" />
                            <asp:CheckBox ID="cbxQuarta" runat="server" Text="Quarta" Visible="False" />
                            <asp:CheckBox ID="cbxQuinta" runat="server" Text="Quinta" Visible="False" />
                            <asp:CheckBox ID="cbxSexta" runat="server" Text="Sexta" Visible="False" />
                            <asp:CheckBox ID="cbxSabado" runat="server" Text="Sabado" Visible="False" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
