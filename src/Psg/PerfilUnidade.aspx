<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PerfilUnidade.aspx.vb" Inherits="PerfilUnidade" %>

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
        <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" 
            Text="PERFIL POR UNIDADE"></asp:Label>
        <br />
        <br />
        <asp:MultiView ID="mulPerfilUnidade" runat="server" ActiveViewIndex="0">
            <asp:View ID="ViePerfisUnidades" runat="server">
                <br />
                <asp:Button ID="btnNovo" runat="server" Text="Novo" Width="100px" />
                <asp:Button ID="btnAlterar" runat="server" Text="Alterar" Width="100px" />
                <br />
                <br />
                <asp:GridView ID="gvwPerfilUnidade" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="IDPerfil,IDUnidade" DataSourceID="SqlDSPerfilUnidade" Width="89%">
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
                        <asp:BoundField DataField="IDPerfil" HeaderText="IDPerfil" 
                            InsertVisible="False" ReadOnly="True" SortExpression="IDPerfil" 
                            Visible="False" />
                        <asp:BoundField DataField="IDUnidade" HeaderText="IDUnidade" 
                            SortExpression="IDUnidade" Visible="False" />
                        <asp:BoundField DataField="Descricao" HeaderText="Grupo" 
                            SortExpression="Descricao">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="49%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="49%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Unidade" HeaderText="Unidade" ReadOnly="True" 
                            SortExpression="Unidade">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="49%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="49%" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ibtnExcluir" runat="server" 
                                    AlternateText='<%# "Excluir este perfil: " & Eval("Descricao") & " - " & Eval("Unidade") %>' 
                                    CommandArgument='<%# Eval("IDPerfil") %>' 
                                    CommandName='<%# Eval("IDUnidade") %>' 
                                    ImageUrl="~/Icones/PNG/yellow/18/close.png" />
                                <ajaxToolkit:ConfirmButtonExtender ID="ibtnExcluir_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="Deseja realmente excluir este perfil?" 
                                    Enabled="True" TargetControlID="ibtnExcluir">
                                </ajaxToolkit:ConfirmButtonExtender>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        Não há dados a serem exibidos.
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDSPerfilUnidade" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" DeleteCommand="DELETE FROM psgPerfilUnidade WHERE IDPerfil = @IDPerfil AND IDUnidade = @IDUnidade
" InsertCommand="INSERT INTO psgPerfilUnidade
           (
			IDPerfil
           ,IDUnidade
			)
     VALUES
           (
			@IDPerfil
           ,@IDUnidade
			)" SelectCommand="
SELECT 
pf.IDPerfil,
pf.Descricao,
pu.IDUnidade,
(SELECT Unidade FROM psgUnidade u WHERE pu.IDUnidade = u.IDUnidade)AS Unidade
FROM 
psgPerfilUnidade pu,
admPortalPerfil pf 
WHERE 
pf.IDPerfil = pu.IDPerfil AND 
pf.Ativo = 1
ORDER BY Descricao" UpdateCommand="UPDATE psgPerfilUnidade
   SET IDPerfil  = @IDPerfil
      ,IDUnidade = @IDUnidade
 WHERE IDPerfil = @IDPerfilP AND IDUnidade = @IDUnidadeP">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="tbxIDP" Name="IDPerfil" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbxIDU" Name="IDUnidade" PropertyName="Text" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="ddlPerfil" Name="IDPerfil" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlUnidade" Name="IDUnidade" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="tbxIDP" Name="IDPerfilP" PropertyName="Text" />
                        <asp:ControlParameter ControlID="tbxIDU" Name="IDUnidadeP" 
                            PropertyName="Text" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="ddlPerfil" Name="IDPerfil" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlUnidade" Name="IDUnidade" 
                            PropertyName="SelectedValue" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="tbxIDU" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="tbxIDP" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:CheckBox ID="cbxIncluir" runat="server" Visible="False" />
            </asp:View>
            <br />
            <asp:View ID="ViePerfilUnidade" runat="server">
                <asp:Button ID="btnGravar" runat="server" Text="Salvar" 
                    ValidationGroup="salvar" Width="100px" />
                <asp:Button ID="btnVoltar" runat="server" CausesValidation="False" 
                    Text="Voltar" Width="100px" />
                <br />
                <br />
                <table style="width:100%;">
                    <tr>
                        <td width="9%">
                            &nbsp;</td>
                        <td width="1%">
                            <asp:Image ID="IObrigatorio1" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td width="90%">
                            <asp:Label ID="lblCampoObrigatorio" runat="server" Font-Bold="False" 
                                Text="Campo Obrigatório"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="9%">
                            &nbsp;</td>
                        <td width="1%">
                            &nbsp;</td>
                        <td width="90%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblPerfil" runat="server" Font-Bold="True" Text="Grupo:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="IObrigatorio" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPerfil" runat="server" DataSourceID="SqlDSPerfil" 
                                DataTextField="Descricao" DataValueField="IDPerfil" Width="500px" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblUnidade" runat="server" Font-Bold="True" Text="Unidade:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="IObrigatorio0" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlUnidade" runat="server" DataSourceID="SqlDSUnidades" 
                                DataTextField="Unidade" DataValueField="IDUnidade" Width="500px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvG" runat="server" 
                                ControlToValidate="ddlPerfil" Display="None" ErrorMessage="Campo obrigatorio" 
                                ValidationGroup="salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvG_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvG">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvU" runat="server" 
                                ControlToValidate="ddlUnidade" Display="None" ErrorMessage="Campo obrigatorio" 
                                ValidationGroup="salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvU_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvU">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:SqlDataSource ID="SqlDSPerfil" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT NULL AS IDPerfil,NULL AS Descricao 
UNION ALL
SELECT IDPerfil,Descricao from admPortalPerfil WHERE Ativo = 1 ORDER BY Descricao
"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDSUnidades" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT NULL AS IDUnidade, NULL AS Unidade 
UNION ALL
SELECT IDUnidade,Unidade FROM psgUnidade
	WHERE IDUnidade NOT IN 
		(SELECT IDUnidade FROM psgPerfilUnidade WHERE IDPerfil=@IDPerfil)
ORDER BY Unidade">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlPerfil" Name="IDPerfil" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
