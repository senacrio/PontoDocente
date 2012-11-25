<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Curso.aspx.vb" Inherits="ProcessoSelecao_Curso" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                <asp:Label ID="lblTitulo" runat="server" Text="CURSOS" Font-Bold="True"></asp:Label>
                <br />
        <br />
        <asp:MultiView ID="mtvCurso" runat="server" ActiveViewIndex="0">
            <asp:View ID="VieCursos" runat="server">
                <asp:Panel ID="PnlCurso" runat="server" GroupingText="FILTRO" Width="89%">
                    <table style="width:100%;">
                        <tr>
                            <td align="right" width="15%">
                                <asp:Label ID="lblTipo0" runat="server" Font-Bold="False" Text="Tipo de curso:"></asp:Label>
                            </td>
                            <td width="70%">
                                <asp:DropDownList ID="ddlTipoFiltro" runat="server" DataSourceID="SqlDSTipo" 
                                    DataTextField="Tipo" DataValueField="IDTipo" Width="70.5%">
                                </asp:DropDownList>
                                &nbsp;&nbsp;
                                <asp:CheckBox ID="cbxAtivoFiltro" runat="server" Checked="True" Text="Ativo" />
                            </td>
                            <td width="15%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblCurso0" runat="server" Font-Bold="False" Text="Curso:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbxDescFiltro" runat="server" Width="80%"></asp:TextBox>
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
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnFiltrar" runat="server" Text="Buscar" Width="100px" />
                            </td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Button ID="btnNovo" runat="server" Text="Novo" Width="100px" />
                <asp:Button ID="btnAlterar" runat="server" Text="Alterar" Width="100px" />
                <br />
                <br />
                <asp:GridView ID="gvwCurso" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="IDCurso" DataSourceID="SqlDSCursos" 
                    Width="89%" PageSize="5">
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            SelectImageUrl="~/Icones/PNG/Blue/18/arrow_right.png" SelectText="Selecionar" 
                            ShowSelectButton="True">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" 
                            Wrap="True" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                        </asp:CommandField>
                        <asp:BoundField DataField="IDCurso" HeaderText="IDCurso" InsertVisible="False" 
                            ReadOnly="True" SortExpression="IDCurso" Visible="False" />
                        <asp:BoundField DataField="IDTipo" HeaderText="IDTipo" SortExpression="IDTipo" 
                            Visible="False" />
                        <asp:BoundField DataField="Curso" HeaderText="Curso" SortExpression="Curso">
                        <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" Width="69%" />
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="69%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="69%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" ReadOnly="True" 
                            SortExpression="Tipo">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="30%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="30%" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Ativo" HeaderText="Ativo" SortExpression="Ativo" 
                            Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ibtnExcluir" runat="server" 
                                    AlternateText='<%# "Excluir o curso de " &  Eval("Curso") %>' 
                                    CommandArgument='<%# Eval("IDCurso") %>' CommandName="Excluir" 
                                    ImageUrl="~/Icones/PNG/yellow/18/close.png" 
                                    Visible='<%# Eval("PodeExcluir") %>' />
                                <ajaxToolkit:ConfirmButtonExtender ID="ibtnExcluir_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="Deseja realmente excluir este curso?" 
                                    Enabled="True" TargetControlID="ibtnExcluir">
                                </ajaxToolkit:ConfirmButtonExtender>
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    AlternateText='<%# "Excluir o curso de " &  Eval("Curso") %>' 
                                    ImageUrl="~/Icones/PNG/yellow/18/close.png" 
                                    onclientclick="alert('Atenção, este curso  já foi cadastrado para uma turma, exclusão não poderá ser realizada.')" 
                                    Visible='<%# Eval("NPodeExcluir") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
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
psgCurso c
WHERE 
c.Ativo = (CASE @Ativo WHEN '' THEN c.Ativo ELSE @Ativo END)AND
c.IDTipo = (CASE @IDTipo WHEN '' THEN c.IDTipo ELSE @IDTipo END)AND
c.Curso LIKE  '%' + @Evento  + '%'  ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbxAtivoFiltro" 
                            ConvertEmptyStringToNull="False" Name="Ativo" PropertyName="Checked" 
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlTipoFiltro" 
                            ConvertEmptyStringToNull="False" Name="IDTipo" PropertyName="SelectedValue" 
                            Type="String" />
                        <asp:ControlParameter ControlID="tbxDescFiltro" 
                            ConvertEmptyStringToNull="False" Name="Evento" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDSCursos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                    DeleteCommand="DELETE FROM psgCurso WHERE IDCurso = @ID" InsertCommand="INSERT INTO psgCurso
           (
			IDTipo
           ,Curso
           ,Ativo
			)
     VALUES
           (
			@IDTipo
           ,@Curso
           ,@Ativo
			)" SelectCommand="SELECT 
IDCurso, 
IDTipo,
Curso,
(SELECT Tipo FROM psgCursoTipo ct WHERE ct.IDTipo = c.IDTipo)AS Tipo,
CASE WHEN ISNULL((SELECT TOP 1 IDCurso FROM psgTurma t WHERE t.IDCurso = c.IDCurso),0) = 0 THEN 1 ELSE 0 END AS PodeExcluir,
CASE WHEN ISNULL((SELECT TOP 1 IDCurso FROM psgTurma t WHERE t.IDCurso = c.IDCurso),0) = 0 THEN 0 ELSE 1 END AS NPodeExcluir,

Ativo
FROM 
psgCurso c
WHERE 
c.Ativo = (CASE @Ativo WHEN '' THEN c.Ativo ELSE @Ativo END)AND
c.IDTipo = (CASE @IDTipo WHEN '' THEN c.IDTipo ELSE @IDTipo END)AND
c.Curso LIKE  '%' + @Evento  + '%'  
ORDER BY 
Curso" UpdateCommand="UPDATE psgCurso
   SET IDTipo = @IDTipo
      ,Curso  = @Curso
      ,Ativo  = @Ativo
 WHERE IDCurso = @IDCurso">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbxAtivoFiltro" 
                            ConvertEmptyStringToNull="False" Name="Ativo" PropertyName="Checked" 
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlTipoFiltro" 
                            ConvertEmptyStringToNull="False" Name="IDTipo" PropertyName="SelectedValue" 
                            Type="String" />
                        <asp:ControlParameter ControlID="tbxDescFiltro" 
                            ConvertEmptyStringToNull="False" Name="Evento" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="tbxID" Name="ID" PropertyName="Text" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="tbxID" Name="IDCurso" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlTipo" Name="IDTipo" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tbxDescricao" Name="Curso" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="cbxAtivo" Name="Ativo" 
                            PropertyName="Checked" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="ddlTipo" Name="IDTipo" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tbxDescricao" Name="Curso" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="cbxAtivo" Name="Ativo" 
                            PropertyName="Checked" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="tbxID" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:CheckBox ID="cbxIncluir" runat="server" Visible="False" />
            </asp:View>
            <asp:View ID="VieCurso" runat="server">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" 
                    ValidationGroup="Salvar" Width="100px" />
                <asp:Button ID="btnVoltar" runat="server" CausesValidation="False" 
                    Text="Voltar" Width="100px" />
                <br />
                <br />
                <br />
                <table style="width:100%;">
                    <tr>
                        <td align="right" width="9%">
                            &nbsp;</td>
                        <td width="1%">
                            <asp:Image ID="IObrigatorio" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td width="90%">
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
                            <asp:Label ID="lblTipo" runat="server" Font-Bold="True" Text="Tipo de curso:"></asp:Label>
                        </td>
                        <td width="1%">
                            <asp:Image ID="IObrigatorio0" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td width="90%">
                            <asp:DropDownList ID="ddlTipo" runat="server" DataSourceID="SqlDSTipo" 
                                DataTextField="Tipo" DataValueField="IDTipo">
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:CheckBox ID="cbxAtivo" runat="server" Checked="True" Text="Ativo" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <asp:Label ID="lblCurso" runat="server" Font-Bold="True" Text="Curso:"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Image ID="IObrigatorio1" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxDescricao" runat="server" Height="75px" 
                                TextMode="MultiLine" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:SqlDataSource ID="SqlDSTipo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT NULL AS IDTipo,NULL AS Tipo
UNION ALL
SELECT IDTipo,Tipo FROM psgCursoTipo ORDER BY Tipo "></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvTipo" runat="server" 
                                ControlToValidate="ddlTipo" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvTipo_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvTipo">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvCurso" runat="server" 
                                ControlToValidate="tbxDescricao" Display="None" 
                                ErrorMessage="Campo obrigatório" ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
