<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Rel.MarcacaoGerentes_adm.aspx.vb" Inherits="Ponto_Relatorios_Relatorio" %>

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
        .style19
        {
            font-size: x-small;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel2" runat="server" Visible="False" Width="961px">
            &nbsp;<table class="style1">
                <tr>
                    <td class="style2" colspan="4">
                        <div class="style7">
                            <span class="style9">&nbsp;SALDO OI CELULAR (ELEGÍVEIS) - ADMINISTRATIVO</span></div>
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
                            ErrorMessage="Por favor, digite a data inicial." CssClass="style19"></asp:RequiredFieldValidator>
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
                            ErrorMessage="Por favor, digite a data inicial." CssClass="style19"></asp:RequiredFieldValidator>
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
                        <asp:ScriptManager ID="ScriptManager3" runat="server" 
                            EnableScriptGlobalization="True">
                        </asp:ScriptManager>
                    </td>
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
    
    </div>
    
    </form>
</body>
</html>
