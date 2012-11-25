<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Unidades.aspx.vb" Inherits="ProcessoSelecao_Unidades" %>

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
    
        <asp:Label ID="lblTitulo" runat="server" Text="UNIDADES" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:MultiView ID="mulUnidades" runat="server" ActiveViewIndex="0">
            <asp:View ID="VieUnidades" runat="server">
                <asp:Panel ID="Panel1" runat="server" GroupingText="FILTRO" Width="89%">
                    <table style="width:100%;">
                        <tr>
                            <td align="right" valign="top" width="10%">
                                <asp:Label ID="Label1" runat="server" Text="Unidade:"></asp:Label>
                            </td>
                            <td width="50%">
                                <asp:TextBox ID="tbxDesc" runat="server" Width="98%"></asp:TextBox>
                            </td>
                            <td width="40%">
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="100px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Button ID="btnNovo" runat="server" Text="Novo" Width="100px" />
                <asp:Button ID="btnAlterar" runat="server" Text="Alterar" Width="100px" />
                <br />
                <br />
                <asp:GridView ID="gvwUnidades" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="IDUnidade" DataSourceID="SqlSUnidade" 
                    Width="89%">
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            SelectImageUrl="~/Icones/PNG/Blue/18/arrow_right.png" SelectText="Selecionar" 
                            ShowSelectButton="True">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                        </asp:CommandField>
                        <asp:BoundField DataField="IDUnidade" HeaderText="IDUnidade" 
                            InsertVisible="False" ReadOnly="True" SortExpression="IDUnidade" 
                            Visible="False" />
                        <asp:BoundField DataField="Unidade" HeaderText="Unidade" 
                            SortExpression="Unidade">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="30%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="30%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Endereco" HeaderText="Endereço" ReadOnly="True" 
                            SortExpression="Endereco">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="70%" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="70%" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    AlternateText='<%# "Excuir a unidade " & Eval("Unidade") %>' 
                                    CommandArgument='<%# Eval("IDUnidade") %>' CommandName="Excluir" 
                                    ImageUrl="~/Icones/PNG/yellow/18/close.png" 
                                    Visible='<%# Eval("PodeExcluir") %>' />
                                <ajaxToolkit:ConfirmButtonExtender ID="ImageButton1_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="Deseja realmente excluir esta unidade?" 
                                    Enabled="True" TargetControlID="ImageButton1">
                                </ajaxToolkit:ConfirmButtonExtender>
                                <asp:ImageButton ID="ImageButton2" runat="server" 
                                    AlternateText='<%# "Excuir a unidade " & Eval("Unidade") %>' 
                                    ImageUrl="~/Icones/PNG/yellow/18/close.png" 
                                    onclientclick="alert('Atenção, esta unidade já foi cadastrada para uma turma, exclusão não poderá ser realizada.')" 
                                    Visible='<%# Eval("NPodeExcluir") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="1%" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        Não há dados a serem exibidos.
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
                <asp:SqlDataSource ID="SqlSUnidade" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                    DeleteCommand="DELETE FROM psgUnidade WHERE IDUnidade = @ID" InsertCommand="INSERT INTO psgUnidade
           (
			Unidade
           ,Endereco
           ,Complemento
           ,Bairro
           ,Cidade
           ,Cep
           ,Estado
			)
     VALUES
           (
			@Unidade
           ,@Endereco
           ,@Complemento
           ,@Bairro
           ,@Cidade
           ,@Cep
           ,@Estado
			)" SelectCommand="SELECT 
IDUnidade,
Unidade,
CASE WHEN ISNULL((SELECT TOP 1 IDUnidade FROM psgTurma t WHERE t.IDUnidade = u.IDUnidade),0) = 0 THEN 1 ELSE 0 END PodeExcluir ,
CASE WHEN ISNULL((SELECT TOP 1 IDUnidade FROM psgTurma t WHERE t.IDUnidade = u.IDUnidade),0) = 0 THEN 0 ELSE 1 END NPodeExcluir ,
Endereco + CASE WHEN Complemento IS NULL THEN '' ELSE ', ' + Complemento END + ' - ' + Bairro + ' - ' + Cidade + ' - ' + Estado + ' - ' +
SUBSTRING(CEP,1,2)+'.'+SUBSTRING(CEP,3,3)+'-'+SUBSTRING(CEP,6,3)AS Endereco
FROM 
psgUnidade u
WHERE 
Unidade LIKE '%' + @Unidade + '%'
ORDER BY 
Unidade" UpdateCommand="UPDATE psgUnidade
   SET Unidade     = @Unidade
      ,Endereco    = @Endereco
      ,Complemento = @Complemento
      ,Bairro      = @Bairro
      ,Cidade      = @Cidade
      ,Cep         = @Cep
      ,Estado      = @Estado
 WHERE IDUnidade          = @ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tbxDesc" ConvertEmptyStringToNull="False" 
                            Name="Unidade" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="tbxID" Name="ID" PropertyName="Text" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="tbxID" Name="ID" PropertyName="Text" />
                        <asp:ControlParameter Name="Unidade" ControlID="tbxUnidade" 
                            PropertyName="Text" />
                        <asp:ControlParameter Name="Endereco" ControlID="tbxEndereco" 
                            PropertyName="Text" />
                        <asp:ControlParameter Name="Complemento" ControlID="tbxComplemento" 
                            PropertyName="Text" />
                        <asp:ControlParameter Name="Bairro" ControlID="tbxBairro" PropertyName="Text" />
                        <asp:ControlParameter Name="Cidade" ControlID="tbxCidade" PropertyName="Text" />
                        <asp:ControlParameter Name="Cep" ControlID="tbxCep" PropertyName="Text" />
                        <asp:ControlParameter Name="Estado" ControlID="tbxEstado" DefaultValue="" 
                            PropertyName="Text" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:ControlParameter Name="Unidade" ControlID="tbxUnidade" 
                            PropertyName="Text" />
                        <asp:ControlParameter Name="Endereco" ControlID="tbxEndereco" 
                            PropertyName="Text" />
                        <asp:ControlParameter Name="Complemento" ControlID="tbxComplemento" 
                            PropertyName="Text" />
                        <asp:ControlParameter Name="Bairro" ControlID="tbxBairro" PropertyName="Text" />
                        <asp:ControlParameter Name="Cidade" ControlID="tbxCidade" PropertyName="Text" />
                        <asp:ControlParameter Name="Cep" ControlID="tbxCep" PropertyName="Text" />
                        <asp:ControlParameter Name="Estado" ControlID="tbxEstado" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDSDetalhe" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT 
COUNT(*)AS Total
FROM 
psgUnidade  
WHERE 
Unidade LIKE '%' + @Unidade + '%'">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tbxDesc" ConvertEmptyStringToNull="False" 
                            Name="Unidade" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="tbxID" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:CheckBox ID="cbxIncluir" runat="server" Visible="False" />
            </asp:View>
            <asp:View ID="VieUnidade" runat="server">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="100px" 
                    ValidationGroup="Salvar" />
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" Width="100px" 
                    CausesValidation="False" />
                <br />
                <br />
                <br />
                <table style="width:100%;">
                    <tr>
                        <td width="14%">
                            &nbsp;</td>
                        <td width="1%">
                            <asp:Image ID="IObrigatorio" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td width="85%">
                            <asp:Label ID="lblCampoObrigatorio" runat="server" Font-Bold="False" 
                                Text="Campo Obrigatório"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="11%">
                            &nbsp;</td>
                        <td width="1%">
                            &nbsp;</td>
                        <td width="88%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" width="11%">
                            <asp:Label ID="lblNomeUnidade" runat="server" Font-Bold="True" Text="Unidade:"></asp:Label>
                        </td>
                        <td width="1%">
                            <asp:Image ID="IObrigatorio0" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td width="88%">
                            <asp:TextBox ID="tbxUnidade" runat="server" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblEndereco" runat="server" Font-Bold="True" Text="Endereço:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="IObrigatorio1" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxEndereco" runat="server" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblComplemento" runat="server" Font-Bold="True" 
                                Text="Complemento:"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="tbxComplemento" runat="server" Width="20%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblBairro" runat="server" Font-Bold="True" Text="Bairro:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="IObrigatorio3" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxBairro" runat="server" Width="30%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblCidade" runat="server" Font-Bold="True" Text="Cidade:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="IObrigatorio4" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxCidade" runat="server" Width="30%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblCep" runat="server" Font-Bold="True" Text="Cep:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="IObrigatorio5" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxCep" runat="server" Width="15%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="lblEstado" runat="server" Font-Bold="True" Text="Estado:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="IObrigatorio6" runat="server" 
                                ImageUrl="~/Icones/form_campo_obrigatorio.gif" />
                        </td>
                        <td>
                            <asp:TextBox ID="tbxEstado" runat="server" Width="5%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvUnidade" runat="server" 
                                ControlToValidate="tbxUnidade" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvUnidade_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvUnidade">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvEndereco" runat="server" 
                                ControlToValidate="tbxEndereco" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvEndereco_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvEndereco">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvBairro" runat="server" 
                                ControlToValidate="tbxBairro" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvBairro_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvBairro">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvCidade" runat="server" 
                                ControlToValidate="tbxCidade" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvCidade_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvCidade">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvCEP" runat="server" 
                                ControlToValidate="tbxCep" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvCEP_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvCEP">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="rfvEstado" runat="server" 
                                ControlToValidate="tbxEstado" Display="None" ErrorMessage="Campo obrigatório" 
                                ValidationGroup="Salvar"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="rfvEstado_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="rfvEstado">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
