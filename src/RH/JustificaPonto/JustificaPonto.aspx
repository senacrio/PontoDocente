<%@ Page Language="VB" AutoEventWireup="false" CodeFile="JustificaPonto.aspx.vb" Inherits="Ponto_JustificaPonto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function contachar(campo) {
        if (campo.value.length >= 4000) { campo.value = campo.value.substring(0, 4000); } document.forms[0].xyz.value = campo.value.length 
}
</script>
<head runat="server">


    <title></title>
    <style type="text/css">
        .style1
        {
            width: 98%;
        }
        .style3
        {
            width: 56px;
        }
        .style4
        {
            width: 56px;
            font-family: Verdana;
            font-size: x-small;
        }
        .style5
        {
            width: 162px;
        }
        .style6
        {
            width: 98px;
        }
        .style7
        {
            width: 100%;
        }
        .style8
        {
            width: 36px;
            font-family: Verdana;
            font-size: x-small;
        }
        .style13
        {
            font-size: 11.0pt;
            font-family: Calibri, sans-serif;
            color: #000000;
            text-align: center;
            background-color: #D9ECFF;
        }
        .style14
        {
            font-size: small;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ScriptManager>
        <br />
        <asp:Label ID="Label1" runat="server" 
            style="font-weight: 700; font-size: small; font-family: Verdana" 
            Text="JUSTIFICAR PONTO"></asp:Label>
        <br />
        <br />
        <div class="style13" 
            style="border-style: dashed; border-width: 1px; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-bidi-font-family: &quot;Times New Roman&quot;; mso-ansi-language: PT-BR; mso-fareast-language: PT-BR; mso-bidi-language: AR-SA; background-color: #E6F2FF;">
            <b>
            <br />
            AVISO</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style14">As informações lançadas devem ser 
            feitas pessoalmente pelo colaborador e condizer integralmente com a realidade, 
            sob pena de ser considerado falta grave, passível de punições disciplinares.</span><br />
        </div>
        <br />
        <table class="style7">
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    <asp:DropDownList ID="cboMes" runat="server" AutoPostBack="True" 
                        style="font-family: Verdana; font-size: x-small" Visible="False">
                        <asp:ListItem Value="1">Janeiro</asp:ListItem>
                        <asp:ListItem Value="2">Fevereiro</asp:ListItem>
                        <asp:ListItem Value="3">Março</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Maio</asp:ListItem>
                        <asp:ListItem Value="6">Junho</asp:ListItem>
                        <asp:ListItem Value="7">Julho</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Setembro</asp:ListItem>
                        <asp:ListItem Value="10">Outubro</asp:ListItem>
                        <asp:ListItem Value="11">Novembro</asp:ListItem>
                        <asp:ListItem Value="12">Dezembro</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:Panel ID="pnlPonto" runat="server" GroupingText="Incluir Ponto" 
            style="font-family: Verdana; font-size: x-small" Visible="False" 
            Width="305px">
            <table class="style1">
                <tr>
                    <td class="style4">
                        Ação:</td>
                    <td class="style5">
                        <asp:DropDownList ID="cboAcaoI" runat="server" DataSourceID="sdsAjustes" 
                            DataTextField="Ajuste" DataValueField="Id_Ajuste" 
                            style="font-family: Verdana; font-size: x-small" Width="200px" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                        Data:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtDataI" runat="server" 
                            style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                        <ajaxToolkit:calendarextender ID="txtDataI_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtDataI">
                        </ajaxToolkit:CalendarExtender>
                    </td>
                    <td class="style6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtDataI" Display="None" ErrorMessage="* Campo obrigatório" 
                            style="font-family: Verdana; font-size: x-small"></asp:RequiredFieldValidator>
                        <ajaxToolkit:validatorcalloutextender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                        </ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Entrada:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtEntradaI" runat="server" 
                            style="font-family: Verdana; font-size: x-small" Width="65px"></asp:TextBox>
                        <ajaxToolkit:maskededitextender ID="txtEntradaI_MaskedEditExtender" 
                            runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            Mask="99:99" MaskType="Time" TargetControlID="txtEntradaI">
                        </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td class="style6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtEntradaI" Display="None" 
                            ErrorMessage="* Campo obrigatório" 
                            style="font-family: Verdana; font-size: x-small"></asp:RequiredFieldValidator>
                        <ajaxToolkit:validatorcalloutextender ID="RequiredFieldValidator4_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                        </ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Saida:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtSaidaI" runat="server" 
                            style="font-family: Verdana; font-size: x-small" Width="65px"></asp:TextBox>
                        <ajaxToolkit:maskededitextender ID="txtSaidaI_MaskedEditExtender" 
                            runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            Mask="99:99" MaskType="Time" TargetControlID="txtSaidaI">
                        </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td class="style6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtSaidaI" Display="None" ErrorMessage="* Campo obrigatório" 
                            style="font-family: Verdana; font-size: x-small"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="txtEntradaI" ControlToValidate="txtSaidaI" Display="None" 
                            ErrorMessage="* Saida não pode ser menor que a entrada" Operator="GreaterThan"></asp:CompareValidator>
                        <ajaxToolkit:validatorcalloutextender ID="CompareValidator1_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="CompareValidator1">
                        </ajaxToolkit:ValidatorCalloutExtender>
                        <ajaxToolkit:validatorcalloutextender ID="RequiredFieldValidator5_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5">
                        </ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style3" valign="top">
                        <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Font-Size="X-Small" 
                            Text="Justificativa:"></asp:Label>
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txtJustificativaI" onkeyup="contachar(this)" runat="server" Height="57px" 
                            style="font-family: Verdana; font-size: x-small" TextMode="MultiLine" 
                            Width="200px"></asp:TextBox>
                    </td>
                    <td class="style6" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtJustificativaI" Display="None" 
                            ErrorMessage="* Campo obrigatório" 
                            style="font-family: Verdana; font-size: x-small"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="RequiredFieldValidator7_validatorcalloutextender" 
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator7">
                        </ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style5">
                        &nbsp;</td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style5">
                        <asp:Button ID="btnSalvarI" runat="server" 
                            style="font-family: Verdana; font-size: x-small" Text="Salvar" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelarI" runat="server" CausesValidation="False" 
                            style="font-family: Verdana; font-size: x-small" Text="Cancelar" />
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        <asp:SqlDataSource ID="sdsAjustes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            SelectCommand="SELECT [Id_Ajuste], [Ajuste] FROM [ptnAjuste]">
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="sdsIncluirPonto" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            DeleteCommand="DELETE FROM [Ponto] WHERE [Id_Ponto] = @Id_Ponto" 
            InsertCommand="INSERT INTO Ponto(Matric, Data, Hora, Id_Ajuste, ok, Justificativa) VALUES (@Matric, @Data, @Hora, @Id_Ajuste, 0, @Justificativa)" 
            SelectCommand="SELECT * FROM [Ponto]" 
            
            
            UpdateCommand="UPDATE [Ponto] SET [Matric] = @Matric, [Data] = @Data, [Hora] = @Hora, [Id_Ajuste] = @Id_Ajuste WHERE [Id_Ponto] = @Id_Ponto">
            <DeleteParameters>
                <asp:Parameter Name="Id_Ponto" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Matric" Type="Int32" />
                <asp:Parameter Name="Data" Type="DateTime" />
                <asp:Parameter Name="Hora" Type="String" />
                <asp:Parameter Name="Id_Ajuste" Type="Int32" />
                <asp:Parameter Name="Id_Ponto" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter Name="Matric" SessionField="c_Matricula" Type="Int32" />
                <asp:ControlParameter ControlID="txtDataI" Name="Data" PropertyName="Text" 
                    Type="DateTime" />
                <asp:Parameter Name="Hora" Type="String" />
                <asp:ControlParameter ControlID="cboAcaoI" Name="Id_Ajuste" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtJustificativaI" Name="Justificativa" 
                    PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnIncluir" runat="server" CausesValidation="False" 
            style="font-family: Verdana; font-size: x-small" Text="Incluir ponto" />
        <br />
        <br />
                            <asp:Label ID="lblErro" runat="server" Font-Names="Arial" Font-Size="Small" 
                                ForeColor="Red" 
            style="font-family: Verdana; font-size: x-small"></asp:Label>
    
        <br />
                            <asp:GridView ID="grdPonto" runat="server" 
            AllowPaging="True" AllowSorting="True" 
                                AutoGenerateColumns="False" BorderColor="Silver" BorderStyle="Solid" 
                                BorderWidth="1px" CellPadding="2" DataKeyNames="entrada,saida,matric,data" 
                                DataSourceID="sdsPonto" Font-Names="Arial" Font-Size="Small" 
                                ForeColor="#333333" GridLines="None" PageSize="15" style="text-align: left; font-family: Verdana; font-size: x-small;" 
                                Width="1027px">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EmptyDataRowStyle BorderColor="White" BorderStyle="Solid" BorderWidth="1px" 
                                    ForeColor="Black" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <EmptyDataTemplate>
                                    <br />
                                    Não existem marcações de pontos para justificar.<br />
                                    <br />
                                </EmptyDataTemplate>
                                <EditRowStyle BackColor="#999999" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                                        SelectImageUrl="~/Icones/grid_selecionar.gif" />
                                    <asp:TemplateField HeaderText="Data">
                                        <ItemTemplate>
                                            <asp:Label ID="lblData" runat="server" 
                                                style="font-family: Verdana; font-size: x-small" Text='<%# Bind("Data") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Colaborador">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNome" runat="server" 
                                                style="font-family: Verdana; font-size: x-small" 
                                                Text='<%# Bind("nom_pessoa_fisic") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Horário">
                                        <ItemTemplate>
                                            <table class="style7">
                                                <tr class="style9">
                                                    <td class="style11">
                                                        Entrada</td>
                                                    <td class="style10">
                                                        Saida</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtEntrada" runat="server" Enabled="False" 
                                                            style="font-family: Verdana; font-size: x-small" Text='<%# Bind("entrada") %>' 
                                                            Width="65px"></asp:TextBox>
                                                        <ajaxToolkit:MaskedEditExtender ID="txtEntrada_MaskedEditExtender" 
                                                            runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                            Mask="99:99" MaskType="Time" TargetControlID="txtEntrada">
                                                        </ajaxToolkit:MaskedEditExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSaida" runat="server" Enabled="False" 
                                                            style="font-family: Verdana; font-size: x-small" Text='<%# Bind("saida") %>' 
                                                            Width="65px"></asp:TextBox>
                                                        <ajaxToolkit:MaskedEditExtender ID="txtSaida_MaskedEditExtender" runat="server" 
                                                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                            Mask="99:99" MaskType="Time" TargetControlID="txtSaida">
                                                        </ajaxToolkit:MaskedEditExtender>
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                            ControlToCompare="txtEntrada" ControlToValidate="txtSaida" 
                                                            ErrorMessage="* Saida não pode ser menor que a entrada" Operator="GreaterThan" 
                                                            style="font-family: Verdana; font-size: x-small" Display="None"></asp:CompareValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" 
                                                            runat="server" Enabled="True" TargetControlID="CompareValidator1">
                                                        </ajaxToolkit:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ação">
                                        <ItemTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style2">
                                                        <asp:DropDownList ID="cboAcao" runat="server" DataSourceID="sdsAjuste" 
                                                            DataTextField="Ajuste" DataValueField="Id_Ajuste" 
                                                            SelectedValue='<%# Bind("Id_Ajuste") %>' 
                                                            style="font-family: Verdana; font-size: x-small" Enabled="False">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="valAcao" runat="server" 
                                                            ControlToValidate="cboAcao" Display="None" Enabled="False" 
                                                            ErrorMessage="* Selecione uma ação" 
                                                            style="font-family: Verdana; font-size: x-small"></asp:RequiredFieldValidator>
                                                        <ajaxToolkit:ValidatorCalloutExtender ID="valAcao_ValidatorCalloutExtender" 
                                                            runat="server" Enabled="True" TargetControlID="valAcao">
                                                        </ajaxToolkit:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:SqlDataSource ID="sdsAjuste" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                                                SelectCommand="SELECT NULL AS Id_Ajuste, NULL AS Ajuste UNION SELECT Id_Ajuste, Ajuste FROM ptnAjuste">
                                            </asp:SqlDataSource>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Jutificativa">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtJustificativa"   runat="server" onkeyup="contachar(this)" Enabled="False" Height="38px" 
                                                style="font-family: Verdana; font-size: x-small" 
                                                Text='<%# Bind("justificativa") %>' TextMode="MultiLine" Width="118px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="valJustificativa" runat="server" 
                                                ControlToValidate="txtJustificativa" Display="None" Enabled="False" 
                                                ErrorMessage="* Campo obrigatório" 
                                                style="font-family: Verdana; font-size: x-small"></asp:RequiredFieldValidator>
                                            <ajaxToolkit:ValidatorCalloutExtender ID="valJustificativa_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="valJustificativa">
                                            </ajaxToolkit:ValidatorCalloutExtender>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnSalvar" runat="server" Enabled="False" 
                                                onclick="Button1_Click" style="font-family: Verdana; font-size: x-small;" 
                                                Text="Salvar" CommandArgument="salvar" 
                                                CommandName='<%# Bind("commandname") %>' />
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
                            <asp:SqlDataSource ID="sdsPonto" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            SelectCommand="SELECT p.Data AS data, p.Matric, LEFT (MIN(p.Hora), 5) AS entrada, LEFT (MAX(p.Hora), 5) AS saida, CASE WHEN LEFT (MIN(hora) , 5) = LEFT (MAX(hora) , 5) THEN 'salvar' ELSE 'editar' END AS commandname, SGT_RHFuncionarioAtivo.nom_pessoa_fisic, p.Id_Ajuste, MIN(p.Justificativa) AS justificativa FROM Ponto AS p LEFT OUTER JOIN SGT_RHFuncionarioAtivo ON p.Matric = SGT_RHFuncionarioAtivo.cdn_funcionario WHERE (SGT_RHFuncionarioAtivo.cdn_funcionario = @matricula and p.data &gt; '2010-01-01') AND (p.Data &lt; CONVERT (char(10), GETDATE(), 101)) GROUP BY p.Matric, SGT_RHFuncionarioAtivo.nom_pessoa_fisic, p.Data, p.Id_Ajuste, p.ok HAVING (dbo.fnHora2Decimal(MAX(p.Hora)) - dbo.fnHora2Decimal(MIN(p.Hora)) = 0) OR (p.ok = 0) " 
            InsertCommand="INSERT INTO Ponto(Matric, Data, Hora, Id_Ajuste, ok, Justificativa) VALUES (@Matric, CONVERT (datetime, @Data, 103), @Hora, @Id_Ajuste, 0, @Justificativa)" 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            UpdateCommand="UPDATE Ponto SET Id_Ajuste = @Id_Ajuste, ok = 0, Justificativa = @Justificativa WHERE (Matric = @matric) AND (Data = @data) AND (LEFT (Hora, 5) = @hora)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="matricula" SessionField="c_Matricula" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Id_Ajuste" />
                                    <asp:Parameter Name="Justificativa" />
                                    <asp:Parameter Name="matric" />
                                    <asp:Parameter Name="data" />
                                    <asp:Parameter Name="hora" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Matric" />
                                    <asp:Parameter Name="Data" />
                                    <asp:Parameter Name="Hora" />
                                    <asp:Parameter Name="Id_Ajuste" />
                                    <asp:Parameter Name="Justificativa" />
                                </InsertParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="sdsEditarHorario" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            SelectCommand="select * from ponto"                       
            UpdateCommand="UPDATE Ponto SET Hora = @hora, Id_Ajuste = @id_ajuste, ok = 0, Justificativa =@Justificativa  WHERE (Matric = @matric) AND (Data = @data) AND (left(Hora,5) = @horaantiga) ">
            <UpdateParameters>
                <asp:Parameter Name="hora" />
                <asp:Parameter Name="id_ajuste" />
                <asp:Parameter Name="Justificativa" />
                <asp:Parameter Name="matric" />
                <asp:Parameter Name="data" />
                <asp:Parameter Name="horaantiga" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="sdsLog" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            InsertCommand="INSERT INTO ptnLogJustificativa(Matricula, Acao, DataHoraRegistro, DataJustificada) VALUES (@matricula, @acao, GETDATE(), @DataJustificada)" 
            SelectCommand="SELECT * FROM [ptnLogJustificativa]">
            <InsertParameters>
                <asp:SessionParameter Name="matricula" SessionField="c_Matricula" />
                <asp:SessionParameter Name="acao" SessionField="acao" />
                <asp:Parameter Name="DataJustificada" DbType=DateTime  />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
