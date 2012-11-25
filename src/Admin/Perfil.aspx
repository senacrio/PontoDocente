<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Perfil.aspx.vb" Inherits="Perfil" %>

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
            Text="Perfis"></asp:Label>
    </p>
    <div>
    
        <asp:Panel ID="Panel1" runat="server" EnableViewState="False" 
            Font-Italic="False" GroupingText="Filtro de Pesquisa:" Width="409px">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" EnableViewState="False" 
                            Text="Descrição:"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="txtFiltroDescricao" runat="server" Width="250px"></asp:TextBox>
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
    <asp:GridView ID="gvwPerfil" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="IdPerfil" 
        DataSourceID="sdsPerfil">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("IdPerfil") %>' CommandName="Select" 
                        ImageUrl="~/Icones/PNG/Green/18/tool.png" Text="Alterar dados" 
                        ToolTip="Alterar" />
                </ItemTemplate>
            </asp:TemplateField>
<asp:BoundField DataField="Descricao" HeaderText="Perfil" SortExpression="Descricao"></asp:BoundField>
            <asp:TemplateField HeaderText="Ativo" 
                SortExpression="Ativo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Inativo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton4" runat="server" 
                        ImageUrl="~/Icones/PNG/Blue/18/ok.png" 
                        Visible='<%# Eval("Ativo") %>' 
                        CommandArgument='<%# Eval("IdPerfil") %>' CommandName="AtivoTrue" 
                        ToolTip="Ativar/Desativar" />
                    <asp:ImageButton ID="ImageButton5" runat="server" 
                        ImageUrl="~/Icones/PNG/yellow/18/stop.png" 
                        Visible='<%# Eval("AtivoInvertido") %>' 
                        CommandArgument='<%# Eval("IdPerfil") %>' CommandName="AtivoFalse" 
                        ToolTip="Ativar/Desativar" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Administrador" SortExpression="Admin">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Admin") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton7" runat="server" 
                        CommandArgument='<%# Eval("IdPerfil") %>' 
                        ImageUrl="~/Icones/PNG/Blue/18/ok.png" Visible='<%# Eval("Admin") %>' 
                        CommandName="AdminTrue" />
                    <asp:ImageButton ID="ImageButton8" runat="server" 
                        CommandArgument='<%# Eval("IdPerfil") %>' 
                        ImageUrl="~/Icones/PNG/yellow/18/stop.png" 
                        Visible='<%# Eval("AdminInvertido") %>' CommandName="AdminFalse" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("IdPerfil") %>' CommandName="Excluir" 
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
                                            Text="Dados do Perfil"></asp:Label>
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
                                        Descrição:</td>
                                    <td>
                                        <img src="../Icones/form_campo_obrigatorio.gif" 
                                            style="width: 3px; height: 19px" /></td>
                                    <td>
                                        <asp:TextBox ID="txtDescricao" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
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
                            ControlToValidate="txtDescricao" Display="None" 
                            ErrorMessage="O campo DESCRIÇÃO deve ser preenchido." 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                            runat="server" TargetControlID="RequiredFieldValidator1">
                        </ajaxToolkit:ValidatorCalloutExtender>
                        <br />
                        <br />
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
    <br />
    <asp:SqlDataSource ID="sdsPerfil" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        
        SelectCommand="SELECT	A.IdPerfil, 
		A.Descricao, 
		Ativo = CASE WHEN A.Ativo=1 THEN 'True' ELSE 'False' END,
		AtivoInvertido = CASE WHEN A.Ativo=1 THEN 'False' ELSE 'True' END,
		Admin = CASE WHEN A.Administrador=1 THEN 'True' ELSE 'False' END,
		AdminInvertido = CASE WHEN A.Administrador=1 THEN 'False' ELSE 'True' END,
		PodeExcluir = CASE WHEN (EXISTS(SELECT TOP 1 I.IdPerfil FROM admPortalMenuPerfil I WHERE I.IdPerfil=A.IdPerfil)) THEN 'False' ELSE 'True' END
FROM admPortalPerfil A
WHERE
	CASE WHEN @Descricao IS NULL THEN '' ELSE A.Descricao END
		LIKE 
	CASE WHEN @Descricao IS NULL THEN '' ELSE '%' + @Descricao + '%' END
" 
        ProviderName="<%$ ConnectionStrings:ServidorBD.ProviderName %>" InsertCommand="INSERT INTO admPortalPerfil (Descricao)
VALUES
(@Descricao)" 
        
        UpdateCommand="UPDATE admPortalPerfil SET Descricao=@Descricao
WHERE IdPerfil=@IdPerfil" 
        DeleteCommand="DELETE FROM admPortalPerfil WHERE IdPerfil=@IdPerfil">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFiltroDescricao" 
                Name="Descricao" PropertyName="Text" ConvertEmptyStringToNull="False" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="IdPerfil" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtDescricao" Name="Descricao" 
                PropertyName="Text" />
            <asp:Parameter Name="IdPerfil" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtDescricao" Name="Descricao" 
                PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
