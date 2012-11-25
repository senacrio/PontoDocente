<%@ Page Language="vb" AutoEventWireup="false" CodeFile="BalanceteMenu.aspx.vb" Inherits="_Default_Menu" Theme="BalanceteWeb"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
      
    <style type="text/css">
        .style1
        {
            width: 702px;
            height: 417px;
        }
        .style2
        {
            height: 140px;
        }
    </style>
      
 </head>
<body alink="21px">
    <form id="form1" runat="server">
    <div style="font-family: Verdana; font-size: small">
    <table id="FormView1"
style="BORDER-RIGHT: black 2px solid; BORDER-TOP: black 2px solid; font-size: smaller; BORDER-LEFT: black 2px solid; width: 520px; BORDER-BOTTOM: black 2px solid; position: relative; BORDER-COLLAPSE: collapse; border-style: none;" 
cellspacing="0" border="0" bgcolor="White" frame="border" >
  <tbody>
  <tr>
    <td align="left" class="style1" >
        <asp:Panel ID="Panel1" runat="server" Width="767px" BorderColor="White">
            <p align="left">
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl="~/Imagens/LogoTipoSenacRJ2.gif" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblUnidade0" runat="server" EnableTheming="False" 
                    Font-Size="Large" Height="28px" Text="BALANCETE WEB"></asp:Label>
            </p>
            <table id="FormView2" border="0" cellspacing="0" 
                
                
                style="border: 2px solid black; font-size: smaller; width: 764px; position: relative; BORDER-COLLAPSE: collapse; top: 0px; left: 0px;">
                <caption style="margin-top: 0px">
                    <tr>
                        <td align="center" height="30">
                            <asp:Label ID="lblTexto" runat="server" EnableTheming="False" Font-Bold="True" 
                                Font-Size="Small" ForeColor="#CC3300" 
                                Text="Selecione o período para a geração do balancete WEB"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <br />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="lblUnidade" runat="server" Font-Size="Small" Text="Unidade:" 
                                Width="80px"></asp:Label>
                            <asp:DropDownList ID="DDLRegional" runat="server" Enabled="False" 
                                style="margin-left: 0px" Width="201px">
                                <asp:ListItem Value="15">Rio de Janeiro</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;
                            <br />
                            <asp:Label ID="lblAno" runat="server" Font-Size="Small" Text="Ano:" 
                                Width="80px"></asp:Label>
                            <asp:DropDownList ID="DDL_Ano" runat="server" AutoPostBack="True">
                                <asp:ListItem>2008</asp:ListItem>
                                <asp:ListItem Selected="true">2009</asp:ListItem>
                                <asp:ListItem>2010</asp:ListItem>
                                <asp:ListItem>2011</asp:ListItem>
                                <asp:ListItem>2012</asp:ListItem>
                                <asp:ListItem>2013</asp:ListItem>
                                <asp:ListItem>2014</asp:ListItem>
                                <asp:ListItem>2015</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="lblMes" runat="server" Font-Size="Small" Text="Mês:" 
                                Width="80px"></asp:Label>
                            <asp:DropDownList ID="DDL_Mes" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="01">Janeiro</asp:ListItem>
                                <asp:ListItem Value="02">Fevereiro</asp:ListItem>
                                <asp:ListItem Value="03">Março</asp:ListItem>
                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                <asp:ListItem Value="05">Maio</asp:ListItem>
                                <asp:ListItem Value="06">Junho</asp:ListItem>
                                <asp:ListItem Value="07">Julho</asp:ListItem>
                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                <asp:ListItem Value="09">Setembro</asp:ListItem>
                                <asp:ListItem Value="10">Outubro</asp:ListItem>
                                <asp:ListItem Value="11">Novembro</asp:ListItem>
                                <asp:ListItem Value="12">Dezembro</asp:ListItem>
                                <asp:ListItem Value="13">13o. Salário</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <br />
                            <asp:SqlDataSource ID="DSDatas" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                SelectCommand="Le_Data_Ini_Fechto" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DDL_Ano" Name="ano" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="DDL_Mes" Name="mes" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="Label0" runat="server" DataSourceID="DSDatas" 
                                DataTextField="Data_Ano_Inicio" DataValueField="Data_Ano_Inicio" 
                                Enabled="False" Width="120px" EnableTheming="False" ForeColor="White">
                            </asp:DropDownList>
                            <asp:DropDownList ID="Label1" runat="server" DataSourceID="DSDatas" 
                                DataTextField="Data_Inicio" DataValueField="Data_Inicio" Enabled="False" 
                                Width="120px" EnableTheming="False" ForeColor="White">
                            </asp:DropDownList>
                            <asp:DropDownList ID="Label2" runat="server" DataSourceID="DSDatas" 
                                DataTextField="Data_Termino" DataValueField="Data_Termino" Enabled="False" 
                                Width="120px" EnableTheming="False" ForeColor="White">
                            </asp:DropDownList>
                            <asp:DropDownList ID="Label3" runat="server" DataSourceID="DSDatas" 
                                DataTextField="Data_inicio_mes_anterior" 
                                DataValueField="Data_inicio_mes_anterior" Enabled="False" 
                                Width="120px" EnableTheming="False" ForeColor="White">
                            </asp:DropDownList>
                            <asp:DropDownList ID="Label4" runat="server" DataSourceID="DSDatas" 
                                DataTextField="Data_Mes_Anterior" DataValueField="Data_Mes_Anterior" 
                                Enabled="False" Width="120px" EnableTheming="False" ForeColor="White">
                            </asp:DropDownList>
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                ImageUrl="~/Icones/botao_selecionar.png" 
                                ToolTip="Gera Balancete para o Período Selecionado." Width="34px" />
                            <br />
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </caption>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblMSG" runat="server" EnableTheming="False" Font-Bold="True" 
                Font-Size="6pt" ForeColor="#CC3300" 
                Text="ATENÇÃO !!! A GERAÇÃO DO BALANCETE PODE DEMORAR ALGUNS MINUTOS, FAVOR AGUARDAR A ABERTURA DA TELA DOS DADOS DO BALANCETE WEB."></asp:Label>
            <br />
            <br />
        </asp:Panel>
      </td></tr></tbody></table>
    </div>
    </form>
</body>
</html>
