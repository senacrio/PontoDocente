<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Rel.MarcacaoGerentes_adm_fatura.aspx.vb" Inherits="Ponto_Relatorios_Relatorio" %>

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
            height: 161px;
        }
        .style2
        {
            text-align: left;
        }
        .style4
        {
            width: 76px;
            height: 24px;
            text-align: justify;
        }
        .style5
        {
            width: 131px;
            height: 24px;
            font-size: x-small;
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
        .style19
        {
            font-size: x-small;
        }
        .style20
        {
            color: #FF0000;
            font-size: x-small;
        }
        .style24
        {
            width: 351px;
            font-size: x-small;
            color: #FF0000;
        }
        .style25
        {
            width: 351px;
        }
        .style26
        {
            width: 446px;
        }
        .style27
        {
            width: 446px;
            font-size: x-small;
        }
        .style28
        {
            height: 24px;
            color: #FF0000;
            font-size: x-small;
            width: 446px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    
    </div>
        <asp:Panel ID="Panel3" runat="server" Visible="False" Width="1200px">
            <div class="style7">
                <span class="style9">SALDO OI CELULAR - ADMINISTRATIVO</span></div>
            <table class="style1">
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="styleabc">
                        &nbsp;</td>
                    <td class="style26">
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
                    <td class="style26">
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
                    <td class="style27">
                        <span class="style20">MM/AAAA </span><span class="style19">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="valNumero4" runat="server" 
                            ControlToValidate="txtDtInicial1" 
                            ErrorMessage="Por favor, digite a data inicial." style="font-size: x-small"></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span>
                    </td>
                    <td class="style24" rowspan="2">
                        O mês de referencia para os relatórios é o mês de
                        <br />
                        vencimento cujas ligações foram realizadas no mês anterior.
                        <br />
                        Ex:
                        <br />
                        04/2009 -&gt; mês vencimento do pagamento
                        <br />
                        03/2009 -&gt;mês das ligações realizadas  
                    </td>
                    <td style="text-align: left">
                        &nbsp;</td>
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
                    <td class="style28">
                        MM/AAAA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="valNumero5" runat="server" 
                            ControlToValidate="txtDtFinal1" ErrorMessage="Por favor, digite a data final." 
                            style="font-size: x-small; text-align: left"></asp:RequiredFieldValidator>
                    </td>
                    <td class="style6">
                        &nbsp;</td>
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
                    <td class="style28">
                        Campo não obrigatório</td>
                    <td class="style12">
                        &nbsp;</td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:ScriptManager ID="ScriptManager3" runat="server" 
                            EnableScriptGlobalization="True">
                        </asp:ScriptManager>
                    </td>
                    <td class="style5">
                        &nbsp;</td>
                    <td class="style28">
                        <asp:Button ID="btnConsulta_ger" runat="server" Text="Consultar" />
                    </td>
                    <td class="style12">
                        &nbsp;</td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
            </table>
            <rsweb:ReportViewer ID="ReportViewer3" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="585px" ProcessingMode="Remote" Width="1182px" 
            Visible="False" ShowParameterPrompts="False">
                <ServerReport 
                ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
        </asp:Panel>
    
    </form>
</body>
</html>
