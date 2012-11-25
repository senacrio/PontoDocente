<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Autenticacao.aspx.vb" Inherits="Autenticacao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">

    <title>Intranet do Senac</title>    

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>

    <style type="text/css">
        .style1
        {
            font-size: x-small;
            color: #000000;
        }
        .style2
        {
            width: 818px;
        }
        </style>
</head>

<body bgcolor="White" background="Imagens/Fundo.jpg">

<center>
<form id="form1" runat="server">

<table style="width: 100%;">
    <tr>
        <td style="width: 85%;">
            &nbsp;
        </td>
        <td align="right" style="text-align: left; width: 15%;">
            <asp:Menu ID="menIdioma" runat="server" Orientation="Horizontal" 
                BackColor="White" DynamicHorizontalOffset="2" Font-Names="Verdana" 
                Font-Size="0.8em" ForeColor="#666666" StaticSubMenuIndent="10px">
                <StaticSelectedStyle BackColor="#D2F2EE" BorderColor="Gray" 
                    BorderStyle="Solid" BorderWidth="1px" />
                <StaticMenuItemStyle ItemSpacing="5px" HorizontalPadding="5px" 
                    VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                <DynamicMenuStyle BackColor="#E6EBEC" />
                <DynamicSelectedStyle BackColor="#99CCFF" ForeColor="Black" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                <Items>
                    <asp:MenuItem Text="  Português" Value="POR" ImageUrl="~/Imagens/IdiomaPOR.gif">
                        <asp:MenuItem ImageUrl="~/Imagens/IdiomaPOR.gif" Text="  Português" Value="POR"></asp:MenuItem>
                        <asp:MenuItem ImageUrl="~/Imagens/IdiomaENG.gif" Text="  English" Value="ENG"></asp:MenuItem>
                        <asp:MenuItem ImageUrl="~/Imagens/IdiomaESP.gif" Text="  Español" Value="ESP"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <img src="Imagens/LogoTipoSenacRJ.gif" style="width: 119px; height: 79px" />
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <br />
            <br />
            <br />
            <asp:Login ID="LoginCaixa" runat="server" BackColor="#F7F6F3" 
                BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
                DestinationPageUrl="~/Default.aspx" DisplayRememberMe="False" 
                FailureText="&lt;br&gt;Usuário ou senha inválida.&lt;br&gt;Tente novamente." 
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="142px" 
                InstructionText="Informe seu nome de usuário e senha&lt;br&gt; e clique no botão &lt;b&gt;Entrar&lt;/b&gt;." 
                LoginButtonText="Entrar" PasswordLabelText="Senha:" 
                PasswordRequiredErrorMessage="Você deve fornecer sua senha." 
                RememberMeText="Lembrar da próxima vez?" TitleText="Autenticação" 
                UserNameLabelText="Usuário:" 
                UserNameRequiredErrorMessage="Você deve fornecer seu nome de usuário." 
                Width="192px">
                <TitleTextStyle Font-Bold="True" Font-Size="0.9em" ForeColor="White" 
                    HorizontalAlign="Center" BackColor="#5D7B9D" />
                <InstructionTextStyle Font-Italic="True" Font-Names="Verdana" Font-Size="7pt" 
                    ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Top" />
                <TextBoxStyle Font-Size="0.8em" Width="100px" />
                <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Verdana" 
                    Font-Size="0.8em" ForeColor="#284775" />
                <ValidatorTextStyle Font-Bold="True" />
                <LabelStyle Font-Bold="True" Font-Italic="False" Font-Strikeout="False" 
                    ForeColor="#003366" HorizontalAlign="Right" />
                <FailureTextStyle Font-Bold="False" />
            </asp:Login>
            <br />
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <strong><span class="style1">SENAC - Serviço Nacional de Aprendizagem Comercial - AR/RJ</span></strong><br class="style1" />
            <span class="style1">Rua Marquês de Abrantes, 99 - Flamengo</span><br class="style1" />
            <span class="style1">22230-060 - Rio de Janeiro - RJ - Brasil</span><br class="style1" />
            <span class="style1">Disque Senac: (21) 4002-2002</span>
        </td>
    </tr>
</table>

</form>
</center>

</body>
</html>
