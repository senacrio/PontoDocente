<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">

    <title>Intranet do Senac</title>

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>

    <style type="text/css">
        .FormataAbaAtiva {background-color: #306897}
        .FormataAbaAtiva {font-family: arial, verdana; font-weight:bold;} 
        .FormataAbaAtiva {font-size: 12px} 
        .FormataAbaAtiva {cursor: Pointer}
        .FormataAbaAtiva {border: none}
        .FormataAbaAtiva:link, visited, active {color: White; text-decoration: none;}
        .FormataAbaAtiva:hover {color: Yellow; text-decoration: none; font-weight:bold;} 

        .FormataAbaInativa {background-color: #83acd8}
        .FormataAbaInativa {font-family: arial, verdana}
        .FormataAbaInativa {font-size: 12px;}
        .FormataAbaInativa {cursor: Pointer}
        .FormataAbaInativa {border: none}
        .FormataAbaInativa:link, visited, active {color: #363399; text-decoration: none;}
        .FormataAbaInativa:hover  {color: Yellow; text-decoration: none;}
		.IE8Fix { z-index: 1000; }
		
        </style>

</head>

<body style="margin: 5px; background-color: White;" bgcolor="#ffffff">

<form id="form1" runat="server">

<table style="width:100%;" border="0" cellpadding="0" cellspacing="0">

    <tr>
    
        <td align="center" valign="top" width="100px">
            <img src="Imagens/LogoTipoSenacRJ2.gif" />
        </td>

        <td valign="top">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            
            <table style="width:100%;" border="0" cellpadding="0" cellspacing="0" bgcolor="#306897">
                <tr>
                    <td height="30px" style="width: 75%;">
                        <asp:Menu   ID="menu"
                                    runat="server"
                                    DataSourceID="xmlDataSource1" 
                                    DynamicHorizontalOffset="2"
                                    Font-Bold="False" 
                                    Font-Names="Arial"
                                    Font-Size="9pt"
                                    ForeColor="Black"
                                    Height="28px" 
                                    Visible="false"
                                    MaximumDynamicDisplayLevels="5"
                                    Orientation="Horizontal" 
                                    StaticSubMenuIndent="10px"
                                    style="margin-left: 0px">
                                    <DataBindings>
                                    <asp:MenuItemBinding    DataMember="MenuItem"
                                                            NavigateUrlField="LinkDaPagina" 
                                                            Target="AreaDeTrabalho"
                                                            Text="Titulo" 
                                                            TextField="Titulo" 
                                                            ToolTipField="Descricao"
                                                            Value="Text" />
                                    </DataBindings>
                                    <StaticMenuItemStyle    HorizontalPadding="5px"
                                                            VerticalPadding="2px" ForeColor="White" />
                                    <DynamicMenuStyle       BackColor="#F2F4F7"
                                                            BorderColor="Black"
                                                            BorderStyle="Solid" 
                                                            ForeColor="Black"
                                                            BorderWidth="1px"
															CssClass="IE8Fix" />
                                    <DynamicSelectedStyle   BackColor="#1C5E55" ForeColor="Black" />
                                    <DynamicMenuItemStyle   HorizontalPadding="5px"
                                                            VerticalPadding="2px" />
                                    <DynamicHoverStyle      BackColor="#FFCC33"
                                                            BorderStyle="None"
                                                            Font-Bold="False" 
                                                            ForeColor="Black" />
                                    <StaticHoverStyle       BackColor="LightSteelBlue"
                                                            BorderColor="Black" 
                                                            BorderStyle="Solid"
                                                            BorderWidth="1px"
                                                            ForeColor="Black"
                                                            Font-Bold="True" />
                        </asp:Menu>
                    </td>
                
                    <td valign="middle" style="text-align: left; width: 05%;">
                        <asp:Menu ID="menIdioma" runat="server" Orientation="Horizontal" 
                            BackColor="#306897" DynamicHorizontalOffset="2" Font-Names="Verdana" 
                            Font-Size="0.8em" ForeColor="#666666" StaticSubMenuIndent="10px">
                            <StaticMenuItemStyle ItemSpacing="5px" HorizontalPadding="5px" 
                                VerticalPadding="2px" />
                            <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                            <DynamicMenuStyle BackColor="#E6EBEC" />
                            <DynamicSelectedStyle BackColor="#99CCFF" ForeColor="Black" />
                            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                            <StaticHoverStyle ForeColor="White" />
                            <Items>
                                <asp:MenuItem Text="" Value="POR" ImageUrl="~/Imagens/IdiomaPOR.gif">
                                    <asp:MenuItem ImageUrl="~/Imagens/IdiomaPOR.gif" Text="  Português" Value="POR"></asp:MenuItem>
                                    <asp:MenuItem ImageUrl="~/Imagens/IdiomaENG.gif" Text="  English" Value="ENG"></asp:MenuItem>
                                    <asp:MenuItem ImageUrl="~/Imagens/IdiomaESP.gif" Text="  Español" Value="ESP"></asp:MenuItem>
                                </asp:MenuItem>
                            </Items>
                        </asp:Menu>
                    </td>
                </tr>                

                <tr>
                    <td align="right" colspan="2" valign="middle" bgcolor="White" 
                        vertical-align: middle">
                        <asp:Label  ID="lblUsuario"
                                    runat="server"
                                    Font-Bold="False"
                                    Font-Names="Arial"
                                    Font-Size="7pt"
                                    ForeColor="#3366CC"
                                    Text="."
                                    Font-Overline="False"
                                    Font-Underline="False"
                                    EnableTheming="False" />
                        &nbsp;
                        <asp:HyperLink  ID="HyperLink2" 
                                        runat="server" style="vertical-align: middle"
                                        ImageUrl="~/Imagens/sos20.png" 
                                        NavigateUrl="~/Sos/CadastroSOS.aspx" Target="AreaDeTrabalho" 
                            EnableTheming="False" EnableViewState="False" ToolTip="Sistema de SOS">Sistema de SOS</asp:HyperLink>
                    </td>
                </tr>
            </table>
            
        </td>
        <td width="5px">
        </td>

        <td width="40px" bgcolor="White" align="center">
        
            <asp:ImageButton ID="imbTrocaMenu" runat="server" EnableTheming="False" 
                EnableViewState="False" ImageUrl="~/Icones/PNG/blue/32/Cycle.png" />
        
            <asp:LoginStatus    ID="LoginStatus1"
                                runat="server"
	                            Font-Bold="True"
	                            Font-Names="Verdana"
	                            Font-Overline="False"
	                            Font-Size="10pt"
	                            Font-Strikeout="False"
	                            Font-Underline="False"
	                            ForeColor="#404040"
	                            LoginText=""
	                            LogoutAction="RedirectToLoginPage"
	                            LogoutText=""
                                EnableTheming="True" 
                LoginImageUrl="~/Icones/PNG/Blue/32/power.png" 
                LogoutImageUrl="~/Icones/PNG/Blue/32/power.png" />
        </td>

    </tr>

</table>
                      

<asp:Table  ID="tblAreaPrincipal"
            runat="server"
            EnableTheming="False" 
            Style="text-align: left; vertical-align: top; width: 100%">
            
    <asp:TableRow ID="Linha1" runat="server">
    
        <asp:TableCell ID="Celula1" runat="server" VerticalAlign="Top" EnableViewState="true" HorizontalAlign="Left" Width="95">
            <asp:TreeView   ID="tvwMenu" 
                            runat="server" 
                            DataSourceID="xmlDataSource1" 
                            ImageSet="Simple" 
                            NodeIndent="10" 
                            ShowLines="True" Width="90px" NodeWrap="True">
                <ParentNodeStyle Font-Bold="False" />
                <HoverNodeStyle Font-Underline="True" 
                                ForeColor="#DD5555" />
                <SelectedNodeStyle  Font-Underline="True" 
                                    ForeColor="#DD5555" 
                                    HorizontalPadding="0px" 
                                    VerticalPadding="0px" />
                <DataBindings>
                    <asp:TreeNodeBinding    DataMember="MenuItem"
                                            NavigateUrlField="LinkDaPagina"
                                            TextField="Titulo" 
                                            ToolTipField="Descricao" 
                                            Target="AreaDeTrabalho" 
                                            Text="Titulo" 
                                            Value="Text" />
                </DataBindings>
                <NodeStyle  Font-Names="Verdana" 
                            Font-Size="8pt" 
                            ForeColor="Black" 
                            HorizontalPadding="0px" 
                            NodeSpacing="0px" 
                            VerticalPadding="0px" />
            </asp:TreeView>
        </asp:TableCell>
        
        <asp:TableCell ID="Celula2" runat="server">
            <iframe id="AreaDeTrabalho"
                    name="AreaDeTrabalho"
                    frameborder="0"
                    height="600px"
                    Style = "border-style: solid; border-width: 3px 1px 1px 1px; border-color: #306897; background-color: #FFFFFF;"
                    width="100%">
            </iframe>
        </asp:TableCell>        
    </asp:TableRow>
    
</asp:Table>


<asp:XmlDataSource ID="xmlDataSource1" TransformFile="~/Menu.xsl" 
    XPath="MenuItems/MenuItem" runat="server" CacheDuration="1" 
    EnableCaching="False"/>

<script type="text/javascript">

    var ie = /msie/i.test(navigator.userAgent);
    var ieBox = ie && (document.compatMode == null || document.compatMode == "BackCompat");

    function checkSize()
    {
        var canvasEl = ieBox ? document.body : document.documentElement;
        var w = window.innerWidth || canvasEl.clientWidth;
        var h = window.innerHeight || canvasEl.clientHeight;
        document.getElementById("AreaDeTrabalho").style.height = Math.max(0, h - 95) + "px";
        
               
    }

    window.onload = checkSize;
    window.onresize = checkSize;

</script>

</form>

</body>

</html>
