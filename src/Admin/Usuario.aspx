<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Usuario.aspx.vb" Inherits="Usuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 263px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Label ID="Label1" runat="server" EnableViewState="False" Font-Bold="True" 
            Text="Usuários"></asp:Label>
    </p>
    <div>
    
        <asp:Panel ID="Panel1" runat="server" EnableViewState="False" 
            Font-Italic="False" GroupingText="Filtro de Pesquisa:" Width="409px">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" EnableViewState="False" 
                            Text="Nome:"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="txtFiltroNome" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    <br />
    <asp:Button ID="btnIcluir" runat="server" Text="Incluir" />
    <br />
    <br />
    <table>
        <tr>
            <td valign="top">
    <asp:GridView ID="gvwUsuario" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="IdUsuario" 
        DataSourceID="sdsUsuario">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("IdUsuario") %>' CommandName="Select" 
                        ImageUrl="~/Icones/PNG/Green/18/tool.png" Text="Alterar dados" 
                        ToolTip="Alterar" onclick="ImageButton6_Click" />
                </ItemTemplate>
            </asp:TemplateField>
<asp:BoundField DataField="nome" HeaderText="Nome Completo" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="login" HeaderText="Login no AD" 
                SortExpression="login" />
            <asp:TemplateField HeaderText="Ativo" 
                SortExpression="Ativo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Inativo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton4" runat="server" 
                        ImageUrl="~/Icones/PNG/Blue/18/ok.png" 
                        Visible='<%# Eval("Ativo") %>' 
                        CommandArgument='<%# Eval("IdUsuario") %>' CommandName="AtivoTrue" 
                        ToolTip="Ativar/Desativar" />
                    <asp:ImageButton ID="ImageButton5" runat="server" 
                        ImageUrl="~/Icones/PNG/yellow/18/stop.png" 
                        Visible='<%# Eval("AtivoInvertido") %>' 
                        CommandArgument='<%# Eval("IdUsuario") %>' CommandName="AtivoFalse" 
                        ToolTip="Ativar/Desativar" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("IdUsuario") %>' CommandName="Excluir" 
                        ImageUrl="~/Icones/PNG/Green/18/close.png" 
                        onclientclick="Javascript: if (confirm('Confirma a exclusão?')) {return true} else {return false}" 
                        Text="Delete" ToolTip="Excluir" Visible='<%# Eval("PodeExcluir") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
            <td style="width: 10px" valign="top">
                &nbsp;</td>
            <td valign="top">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server" EnableTheming="True">
                        <div style="border: 1px solid #CCCCCC; background-color: #E8E8E8;">
                            <table style="width:100%;">
                                <tr>
                                    <td align="center" colspan="3">
                                        <asp:Label ID="lblForm" runat="server" EnableViewState="False" Font-Bold="True" 
                                            Text="Dados do Usuário"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Nome:</td>
                                    <td>
                                        <img src="../Icones/form_campo_obrigatorio.gif" 
                                            style="width: 3px; height: 19px" /></td>
                                    <td>
                                        <asp:TextBox ID="txtNome" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Login AD:</td>
                                    <td>
                                        <img src="../Icones/form_campo_obrigatorio.gif" 
                                            style="width: 3px; height: 19px" /></td>
                                    <td>
                                        <asp:TextBox ID="txtLogin" runat="server" MaxLength="50" Width="160px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Matrícula:</td>
                                    <td>
                                        <img src="../Icones/form_campo_obrigatorio.gif" 
                                            style="width: 3px; height: 19px" /></td>
                                    <td>
                                        <asp:TextBox ID="txtMatricula" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="3">
                                        &nbsp;<asp:Button ID="btnGravar" runat="server" Text="Gravar" />
                                        <asp:Button ID="btnVoltar" runat="server" CausesValidation="False" 
                                            Text="Voltar" Width="50px" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtNome" Display="None" 
                            ErrorMessage="O campo NOME deve ser preenchido." SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                            runat="server" TargetControlID="RequiredFieldValidator1">
                        </ajaxToolkit:ValidatorCalloutExtender>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtLogin" Display="None" 
                            ErrorMessage="O campo LOGIN AD deve ser preenchido." 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender" 
                            runat="server" TargetControlID="RequiredFieldValidator2">
                        </ajaxToolkit:ValidatorCalloutExtender>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtMatricula" Display="None" 
                            ErrorMessage="O campo MATRÍCULA deve ser preenchido."></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                        </ajaxToolkit:ValidatorCalloutExtender>
                        <br />
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
    <br />
    <asp:SqlDataSource ID="sdsUsuario" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        
        SelectCommand="SELECT	A.IdUsuario, 
		A.nome, 
		A.login,
		Ativo = CASE WHEN A.Ativo=1 THEN 'True' ELSE 'False' END,
		AtivoInvertido = CASE WHEN A.Ativo=1 THEN 'False' ELSE 'True' END,
		PodeExcluir = CASE WHEN (EXISTS(SELECT TOP 1 I.IdUsuario FROM admPortalPerfilUsuario I WHERE I.IdUsuario=A.IdUsuario)) THEN 'False' ELSE 'True' END
FROM admPortalUsuario A
WHERE
	CASE WHEN @Nome IS NULL THEN '' ELSE A.nome END
		LIKE 
	CASE WHEN @Nome IS NULL THEN '' ELSE '%' + @Nome + '%' END
" 
        ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" InsertCommand="INSERT INTO admPortalUsuario(Nome, Login, Matricula) VALUES (@Nome, @Login, @Matricula)" 
        
        UpdateCommand="UPDATE admPortalUsuario SET Nome = @Nome, Login = @Login, Matricula = @Matricula WHERE (IdUsuario = @IdUsuario)" 
        DeleteCommand="DELETE FROM admPortalUsuario WHERE IdUsuario=@IdUsuario">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFiltroNome" DefaultValue="" 
                Name="Nome" PropertyName="Text" ConvertEmptyStringToNull="False" 
                Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="IdUsuario" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtNome" Name="Nome" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="txtLogin" Name="Login" 
                PropertyName="Text" />
            <asp:Parameter Name="IdUsuario" />
            <asp:ControlParameter ControlID="txtMatricula" Name="Matricula" 
                PropertyName="Text" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtNome" Name="Nome" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="txtLogin" Name="Login" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMatricula" Name="Matricula" 
                PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
