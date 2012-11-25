<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RecadastroBeneficio.aspx.vb" Inherits="Beneficio_RecadastroBeneficio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            font-family: Verdana; 
            font-size: 12px;
            
        }
        .style2
        {
            width: 132px;
            font-family: Verdana;
            font-size: 12px;
            text-align: right;
        }
        .style3
        {
            width: 353px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family: Verdana; font-size: 12px">
    
        <b>Selecione um dependente.</b><br />
        <asp:DropDownList ID="ddlDependentes" runat="server" Font-Names="Verdana" 
            Font-Size="12px" AppendDataBoundItems="True" AutoPostBack="True" 
            DataSourceID="sqlDependente" DataTextField="nom_depend_func" 
            DataValueField="cdn_depend_func">
            <asp:ListItem Value="0">SELECIONE UM DEPENDENTE</asp:ListItem>
        </asp:DropDownList>
    
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <asp:SqlDataSource ID="sqlDependente" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
        SelectCommand="SELECT DISTINCT a.cdn_funcionario,b.idi_sit_benefic,a.nom_depend_func, a.cdn_depend_func 
FROM SGT_RHDependFunc AS a 
INNER JOIN SGT_RHBenefic_func AS b 
ON 
a.cdn_depend_func = b.cdn_depend_func 
and a.cdn_funcionario = b.cdn_funcionario
WHERE (a.cdn_funcionario =@matricula) 
AND (b.cdn_beneficio &gt;= 7 
AND b.cdn_beneficio &lt;= 14 OR b.cdn_beneficio &gt;= 32 
AND b.cdn_beneficio &lt;= 36 OR b.cdn_beneficio &gt;= 69 AND b.cdn_beneficio &lt;= 74) 
and 
b.idi_sit_benefic =1 
ORDER BY a.nom_depend_func">
        <SelectParameters>
            <asp:SessionParameter Name="matricula" SessionField="c_Matricula" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div style="font-size: 12px; font-family: Verdana; font-weight: 700">
        <br />
        Detalhes<hr />
        <br />
        <asp:Label ID="Label1" runat="server" 
            Text="* O CPF é obrigatório para maiores de 18 anos."></asp:Label>
    </div>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewRecadastro" runat="server">
        
            <br />
        
            <asp:Label ID="lblmsg" runat="server" Font-Names="Verdana" Font-Size="12px" 
                ForeColor="Red"></asp:Label>
        
            <table class="style1">
                <tr>
                    <td class="style2">
                        Dependente:</td>
                    <td class="style3">
                        <asp:TextBox ID="txtnom_depend_func" runat="server" Font-Names="Verdana" 
                            Font-Size="12px" Width="350px" ReadOnly="True" BackColor="#E0E0E0"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Nome da Mãe:</td>
                    <td class="style3">
                        <asp:TextBox ID="txtNomeMae" runat="server" Font-Names="Verdana" 
                            Font-Size="12px" MaxLength="150" Width="350px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtNomeMae" Display="None" 
                            ErrorMessage="* Campo Obrigatório" Font-Names="Verdana" Font-Size="12px" 
                            ValidationGroup="valRecadastro"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                        </ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Data de Nascimento:</td>
                    <td class="style3">
                        <asp:TextBox ID="txtDataNascimento" runat="server" Font-Names="Verdana" Font-Size="12px" 
                            MaxLength="15" Width="90px"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="Nascimento_MaskedEditExtender" 
                            runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            Mask="99/99/9999" MaskType="Date" TargetControlID="txtDataNascimento" 
                            UserDateFormat="DayMonthYear">
                        </ajaxToolkit:MaskedEditExtender>
                        <ajaxToolkit:CalendarExtender ID="Nascimento_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtDataNascimento" 
                            PopupButtonID="btnCalendario" PopupPosition="BottomRight">
                        </ajaxToolkit:CalendarExtender>
                        <asp:ImageButton ID="btnCalendario" runat="server" 
                            ImageUrl="~/Icones/calendario.jpg" />
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtDataNascimento" Display="None" 
                            ErrorMessage="Formato Inválido Ex: 01/01/1980" Font-Names="Verdana" 
                            Font-Size="12px" 
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtDataNascimento" Display="None" 
                            ErrorMessage="* Campo Obrigatório" ValidationGroup="valRecadastro"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                        </ajaxToolkit:ValidatorCalloutExtender>
                        <ajaxToolkit:ValidatorCalloutExtender ID="RegularExpressionValidator1_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="RegularExpressionValidator1">
                        </ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        CPF do dependente:</td>
                    <td class="style3">
                        <asp:TextBox ID="txtCPF" runat="server" Font-Names="Verdana" Font-Size="12px" 
                            MaxLength="11" Width="200px"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="CPF_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureName="pt-BR" CultureThousandsPlaceholder="" CultureTimePlaceholder="" 
                            Enabled="True" Mask="999.999.999-99" TargetControlID="txtCPF">
                        </ajaxToolkit:MaskedEditExtender>
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
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style3">
                           <asp:Button ID="btnSalvar" runat="server" BorderColor="Black" BorderWidth="1px" 
                            Font-Names="Verdana" Font-Size="12px" Text="Salvar" 
                               ValidationGroup="valRecadastro" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        
            <br />
            <asp:SqlDataSource ID="sqlRecadastro" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                
                
                
                InsertCommand="INSERT INTO ansBeneficio(Matricula, IDDependente, CPF, NomeMae, DataNascimento) VALUES (@Matricula, @IDDependente, @CPF, @NomeMae, convert(smalldatetime, @datanascimento,103))" SelectCommand="SELECT ansBeneficio.IDRecadastro, ansBeneficio.Matricula, ansBeneficio.IDDependente, ansBeneficio.CPF, ansBeneficio.RG, ansBeneficio.NomeMae, SGT_RHDependFunc.nom_depend_func, CONVERT (varchar, ansBeneficio.DataNascimento, 103) AS DataNascimento FROM ansBeneficio INNER JOIN SGT_RHDependFunc ON ansBeneficio.Matricula = SGT_RHDependFunc.cdn_funcionario AND ansBeneficio.IDDependente = SGT_RHDependFunc.cdn_depend_func WHERE (ansBeneficio.IDDependente = @IDDependente) AND (SGT_RHDependFunc.cdn_funcionario = @Matricula)" 
                
                
                
                UpdateCommand="UPDATE ansBeneficio SET CPF = @CPF, NomeMae = @NomeMae, DataNascimento = convert(smalldatetime, @datanascimento,103) WHERE (Matricula = @Matricula) AND (IDDependente = @IDDependente)">
                <SelectParameters>
                    <asp:SessionParameter Name="Matricula" SessionField="c_Matricula" />
                    <asp:ControlParameter ControlID="ddlDependentes" Name="IDDependente" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtCPF" Name="CPF" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtNomeMae" Name="NomeMae" 
                        PropertyName="Text" />
                    <asp:SessionParameter Name="Matricula" SessionField="c_Matricula" />
                    <asp:ControlParameter ControlID="ddlDependentes" Name="IDDependente" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtDataNascimento" Name="datanascimento" 
                        PropertyName="Text" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="Matricula" SessionField="c_Matricula" 
                        Type="Int32" />
                    <asp:ControlParameter ControlID="ddlDependentes" Name="IDDependente" 
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="txtCPF" Name="CPF" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtNomeMae" Name="NomeMae" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtDataNascimento" Name="datanascimento" 
                        PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
         </asp:View>
        <br /> 
    </asp:MultiView>
    </form>
</body>
</html>
