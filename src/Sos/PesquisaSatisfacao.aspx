<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PesquisaSatisfacao.aspx.vb" Inherits="Sos_PesquisaSatisfacao" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

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
            width: 318px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="pnlPesquisa" runat="server">
            <table class="style1">
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        Código da SOS:
                        <asp:Label ID="lblCodigo" runat="server" Font-Names="Verdana" 
                            Font-Size="X-Small"></asp:Label>
                    </td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        Descrição:
                        <asp:Label ID="lblDescricao" runat="server" Font-Names="Verdana" 
                            Font-Size="X-Small"></asp:Label>
                    </td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" style="font-family: Verdana; font-size: x-small" 
                        valign="top">
                        &nbsp;</td>
                    <td style="font-family: Verdana; font-size: x-small" valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        Sua SOS foi atendida?</td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        <asp:RadioButtonList ID="rdAtendido" runat="server" 
                RepeatDirection="Horizontal" style="font-family: Verdana" Font-Names="Verdana" 
                            Font-Size="X-Small">
                            <asp:ListItem Selected="True" Value="sim">Sim</asp:ListItem>
                            <asp:ListItem Value="nao">Não</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        &nbsp;</td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        Qual o grau de satisfação?</td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        <asp:RadioButtonList ID="rdSatisfacao" runat="server" 
                RepeatDirection="Horizontal" style="font-family: Verdana" Font-Names="Verdana" 
                            Font-Size="X-Small">
                            <asp:ListItem Selected="True" Value="5">Excelente</asp:ListItem>
                            <asp:ListItem Value="4">Bom</asp:ListItem>
                            <asp:ListItem Value="3">Regular</asp:ListItem>
                            <asp:ListItem Value="2">Ruim</asp:ListItem>
                            <asp:ListItem Value="1">Péssimo</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        &nbsp;</td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        Justificativa<br />
                        <asp:TextBox ID="txtJustificativa" runat="server" 
                Height="157px" style="font-family: Verdana; font-size: x-small" 
                TextMode="MultiLine" Width="317px"></asp:TextBox>
                    </td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        <br />
                        <asp:Label ID="lblerro" runat="server" 
                style="font-size: x-small"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        &nbsp;</td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" 
            style="font-family: Verdana; font-size: x-small" valign="top">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" 
                style="font-family: Verdana; font-size: x-small" Text="Enviar" />
                        &nbsp;
                    </td>
                    <td style="font-family: Verdana; font-size: x-small" 
            valign="top">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
