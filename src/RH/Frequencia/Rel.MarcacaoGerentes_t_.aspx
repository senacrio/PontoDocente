<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Rel.MarcacaoGerentes_t.aspx.vb" Inherits="Ponto_Relatorios_Relatorio" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register namespace="AspNetMaskedEdit" tagprefix="AspNetMaskedEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: left;
        }
        .style3
        {
            width: 131px;
            text-align: right;
        }
        .style4
        {
            width: 76px;
            height: 24px;
        }
        .style5
        {
            width: 131px;
            height: 24px;
        }
        .style6
        {
            height: 24px;
            color: #FF0000;
            font-size: small;
            text-align: left;
        }
        .style7
        {
            text-align: center;
        }
        .style9
        {
            font-size: 14pt;
            font-weight: bold;
            text-align: center;
        }
        .style12
        {
            height: 24px;
            color: #FF0000;
            font-size: x-small;
            width: 351px;
        }
        .style13
        {
            width: 544px;
        }
        .style14
        {
            height: 24px;
            color: #FF0000;
            font-size: small;
            text-align: left;
            width: 544px;
        }
        .style15
        {
            width: 466px;
        }
        .style16
        {
            height: 24px;
            color: #FF0000;
            font-size: small;
            text-align: left;
            width: 466px;
        }
        .style17
        {
            height: 24px;
            color: #FF0000;
            font-size: small;
        }
        .style18
        {
            text-align: center;
            font-weight: bold;
            font-size: medium;
        }
        .style19
        {
            font-size: x-small;
        }
        .style20
        {
            color: #FF0000;
            font-size: x-small;
        }
        .style21
        {
            height: 24px;
            color: #FF0000;
            font-size: x-small;
            text-align: left;
            width: 544px;
        }
        .style22
        {
            width: 544px;
            font-size: x-small;
        }
        .style23
        {
            height: 24px;
            color: #FF0000;
            font-size: x-small;
            width: 351px;
        }
        .style24
        {
            width: 351px;
            font-size: x-small;
        }
        .style25
        {
            width: 351px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel2" runat="server" Visible="False" Width="938px">
            &nbsp;<table class="style1">
                <tr>
                    <td class="style2" colspan="4">
                        <div class="style7">
                            <span class="style9">&nbsp;SALDO OI CELULAR (ELEGÍVEIS)</span></div>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Data inicial:</td>
                    <td class="styleabc">
                        <asp:TextBox ID="txtDtInicial0" runat="server" AutoPostBack="True" 
                            ToolTip="Fomato MM/AAAA"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtInicial0_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtInicial0">
                        </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td class="style15" style="color: #FF0000; font-size: small">
                        <span class="style19">MM/AAAA&nbsp;&nbsp;&nbsp; </span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td style="color: #FF0000; font-size: small">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtDtInicial0" 
                            ErrorMessage="Por favor, digite a data inicial."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Data final:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtDtFinal0" runat="server" ToolTip="Fomato MM/AAAA"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtFinal0_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtFinal0">
                        </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td class="style16">
                        <span class="style19">MM/AAAA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td class="style17">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtDtFinal0" 
                            ErrorMessage="Por favor, digite a data final."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Matrícula:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtLinha0" runat="server"></asp:TextBox>
                    </td>
                    <td class="style16">
                        <asp:Button ID="Button1" runat="server" Text="Consultar" />
                        &nbsp;</td>
                    <td class="style17">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:SqlDataSource ID="dsLotacao0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                            SelectCommand="SELECT lotac_nomes.des_unid_lotac, lotac_filho.cod_filho FROM STG_RHUnidadeLotacao AS lotac_nomes INNER JOIN (SELECT @lotac AS cod_pai, @lotac AS cod_filho UNION SELECT DISTINCT b.cod_unid_lotac_pai, b.cod_unid_lotac_filho FROM STG_RHUnidadeLotacao AS a INNER JOIN ViewSTG_RHEstrutPlanoLotac AS b ON a.cod_unid_lotac = b.cod_unid_lotac_pai WHERE (b.cdn_plano_lotac = 2) AND (b.cod_unid_lotac_pai = @lotac)) AS lotac_filho ON lotac_nomes.cod_unid_lotac = lotac_filho.cod_filho">
                            <SelectParameters>
                                <asp:SessionParameter Name="lotac" SessionField="c_lotac" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style15">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="585px" ProcessingMode="Remote" Width="928px" 
            Visible="False" ShowParameterPrompts="False" ShowBackButton="True">
                <ServerReport ReportPath="/Report_SisPonto/TelefoniaCelular_Func" 
                ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="False" Width="1128px">
            <div class="style18">
                <span class="style9">SALDO OI CELULAR (ELEGÍVEIS)</span></div>
            <table class="style1">
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="styleabc">
                        &nbsp;</td>
                    <td class="style13">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Unidade:</td>
                    <td class="styleabc">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsLotacao" 
                            DataTextField="des_unid_lotac" DataValueField="cod_filho">
                        </asp:DropDownList>
                    </td>
                    <td class="style13">
                        &nbsp;&nbsp; &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Data inicial:</td>
                    <td class="styleabc">
                        <asp:TextBox ID="txtDtInicial" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtInicial_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtInicial">
                        </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td class="style22">
                        <span class="style20">
                        MM/AAAA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span>
                    </td>
                    <td class="style2" style="font-size: small">
                        <asp:RequiredFieldValidator ID="valNumero2" runat="server" 
                            ControlToValidate="txtDtInicial" 
                            ErrorMessage="Por favor, digite a data inicial."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Data final:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtDtFinal" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtFinal_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtFinal">
                        </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td class="style21">
                        <span class="style20">
                        MM/AAAA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span>
                    </td>
                    <td class="style6">
                        <asp:RequiredFieldValidator ID="valNumero3" runat="server" 
                            ControlToValidate="txtDtFinal" ErrorMessage="Por favor, digite a data final."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:SqlDataSource ID="dsLotacao" runat="server" 
                            CacheExpirationPolicy="Sliding" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                            SelectCommand="SELECT lotac_nomes.des_unid_lotac, lotac_filho.cod_filho FROM STG_RHUnidadeLotacao AS lotac_nomes INNER JOIN (SELECT @lotac AS cod_pai, @lotac AS cod_filho UNION SELECT DISTINCT b.cod_unid_lotac_pai, b.cod_unid_lotac_filho FROM STG_RHUnidadeLotacao AS a INNER JOIN ViewSTG_RHEstrutPlanoLotac AS b ON a.cod_unid_lotac = b.cod_unid_lotac_pai WHERE (b.cdn_plano_lotac = 2) AND (b.cod_unid_lotac_pai = @lotac)) AS lotac_filho ON lotac_nomes.cod_unid_lotac = lotac_filho.cod_filho">
                            <SelectParameters>
                                <asp:SessionParameter Name="lotac" SessionField="c_lotac" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="style5">
                        <asp:ScriptManager ID="ScriptManager3" runat="server" 
                            EnableScriptGlobalization="True">
                        </asp:ScriptManager>
                    </td>
                    <td class="style14">
                        <asp:Button ID="btnConsulta" runat="server" Text="Consultar" />
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
            </table>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="585px" ProcessingMode="Remote" Width="1012px" 
            Visible="False" ShowParameterPrompts="False">
                <ServerReport ReportPath="/Report_SisPonto/TelefoniaCelular" 
                ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
        </asp:Panel>
    
    </div>
        <asp:Panel ID="Panel3" runat="server" Visible="False" Width="840px">
            <div class="style7">
                <span class="style9">SALDO OI CELULAR (ELEGÍVEIS)</span></div>
            <table class="style1">
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="styleabc">
                        &nbsp;</td>
                    <td class="style25">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="styleabc">
                        &nbsp;</td>
                    <td class="style25">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Data inicial:</td>
                    <td class="styleabc">
                        <asp:TextBox ID="txtDtInicial1" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtInicial1_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtInicial1">
                        </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td class="style24">
                        <span class="style20">MM/AAAA </span><span class="style19">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span>
                    </td>
                    <td style="text-align: left">
                        <asp:RequiredFieldValidator ID="valNumero4" runat="server" 
                            ControlToValidate="txtDtInicial1" 
                            ErrorMessage="Por favor, digite a data inicial." style="font-size: small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Data final:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtDtFinal1" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtFinal1_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtFinal1">
                        </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td class="style23">
                        MM/AAAA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="style6">
                        <asp:RequiredFieldValidator ID="valNumero5" runat="server" 
                            ControlToValidate="txtDtFinal1" ErrorMessage="Por favor, digite a data final." 
                            style="font-size: small; text-align: left"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Telefone:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txtLinha" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtLinha_MaskedEditExtender" runat="server" 
                            Mask="99 9999 9999" TargetControlID="txtLinha">
                        </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td class="style12">
                        Campo não obrigatório</td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style5">
                        <asp:Button ID="btnConsulta_ger" runat="server" Text="Consultar" />
                    </td>
                    <td class="style12">
                        &nbsp;</td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
            </table>
            <rsweb:ReportViewer ID="ReportViewer3" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="585px" ProcessingMode="Remote" Width="732px" 
            Visible="False" ShowParameterPrompts="False">
                <ServerReport ReportPath="/Report_SisPonto/TelefoniaCelular_func_geren" 
                ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
        </asp:Panel>
    
    </form>
</body>
</html>
