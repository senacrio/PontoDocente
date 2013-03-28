<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LancarApontamento.aspx.vb" Inherits="FrequenciaDocente_LancarApontamento" EnableEventValidation="false" %>

<%@ Register Src="controls/ddlUnidade.ascx" TagName="ddlUnidade" TagPrefix="uc1" %>
<%@ Register Src="controls/EntradaSaida.ascx" TagName="EntradaSaida" TagPrefix="uc2" %>

<%@ Register Src="controls/ddlArea.ascx" TagName="ddlArea" TagPrefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/jquery1.8.3.js"></script>

    <script src="js/jquery.maskMoney.js"></script>
    <script src="js/maskedinput.js"></script>
    <script src="js/moedas.js"></script>
    <script src="js/numeros.js"></script>
    <title></title>
    <style type="text/css">
        .FormataAbaAtiva
        {
            background-color: #306897;
        }

        .FormataAbaAtiva
        {
            font-family: arial, verdana;
            font-weight: bold;
        }

        .FormataAbaAtiva
        {
            font-size: 12px;
        }

        .FormataAbaAtiva
        {
            cursor: Pointer;
        }

        .FormataAbaAtiva
        {
            border: none;
        }

            .FormataAbaAtiva:link, visited, active
            {
                color: White;
                text-decoration: none;
            }

            .FormataAbaAtiva:hover
            {
                color: Yellow;
                text-decoration: none;
                font-weight: bold;
            }

        .FormataAbaInativa
        {
            background-color: #83acd8;
        }

        .FormataAbaInativa
        {
            font-family: arial, verdana;
        }

        .FormataAbaInativa
        {
            font-size: 12px;
        }

        .FormataAbaInativa
        {
            cursor: Pointer;
        }

        .FormataAbaInativa
        {
            border: none;
        }

            .FormataAbaInativa:link, visited, active
            {
                color: #363399;
                text-decoration: none;
            }

            .FormataAbaInativa:hover
            {
                color: Yellow;
                text-decoration: none;
            }

        .IE8Fix
        {
            z-index: 1000;
        }

        .auto-style1
        {
            width: 100%;
            margin-bottom: 0px;
        }

        .aba
        {
            border-color: #507CD1;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            border-left: 1px solid black;
            border-right: 1px solid black;
            margin-bottom: 10px;
        }



        .botao
        {
            font-size: 10px;
            font-family: Verdana,Helvetica;
            font-weight: bold;
            color: white;
            background: #638cb5;
            border: 0px;
            width: 80px;
            height: 19px;
        }

        .auto-style2
        {
            width: 100%;
        }

        .auto-style3
        {
            height: 23px;
        }

        .auto-style4
        {
        }

        .auto-style6
        {
        }

        .auto-style8
        {
            width: 15%;
        }

        .auto-style9
        {
            width: 16%;
        }

        .auto-style10
        {
            width: 3%;
        }

        .auto-style11
        {
            height: 23px;
            width: 5%;
        }

        .auto-style13
        {
            height: 23px;
            width: 8%;
        }

        .auto-style14
        {
            height: 23px;
            width: 15%;
        }

        .auto-style15
        {
            height: 23px;
            width: 3%;
        }

        .auto-style16
        {
            width: 320px;
        }

        .auto-style17
        {
        }

        .auto-style18
        {
            width: 201px;
        }

        .auto-style19
        {
            width: 24px;
        }

        .auto-style20
        {
            width: 34%;
        }

        .auto-style21
        {
            width: 254px;
        }

        .auto-style22
        {
            width: 200px;
        }

        .auto-style23
        {
            width: 250px;
        }

        .auto-style27
        {
            width: 345px;
        }

        .auto-style28
        {
            height: 23px;
            width: 345px;
        }

        .auto-style31
        {
            width: 225px;
        }

        .auto-style34
        {
            width: 286px;
        }

        .auto-style35
        {
            height: 23px;
            width: 286px;
        }

        .auto-style36
        {
            width: 20%;
        }

        .auto-style37
        {
            height: 23px;
            width: 20%;
        }
        .auto-style38
        {
            width: 277px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table class="auto-style2">
                <tr>
                    <td class="auto-style23">

                        <strong>Total de horas inseridas: </strong>
                        <asp:Label ID="lblTotalInseridas" runat="server"></asp:Label>
                    </td>
                    <td>

                        <strong>Total de horas validadas:
                        <asp:Label ID="lblTotalInseridasValidada" runat="server"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td valign="top" class="auto-style23">
                        <asp:GridView ID="grdHoras" runat="server" ShowHeader="False">
                        </asp:GridView>

                    </td>
                    <td valign="top">
                        <asp:GridView ID="grdHorasValidas" runat="server" ShowHeader="False">
                        </asp:GridView>

                    </td>
                </tr>
            </table>

            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
                        <asp:Menu ID="menu1"
                            runat="server"
                            DynamicHorizontalOffset="2"
                            Font-Bold="False"
                            Font-Names="Arial"
                            Font-Size="9pt"
                            ForeColor="Black"
                            Height="28px"
                            MaximumDynamicDisplayLevels="5"
                            Orientation="Horizontal"
                            StaticSubMenuIndent="10px"
                            Style="margin-left: 0px" Visible="False">

                            <StaticMenuItemStyle HorizontalPadding="5px"
                                VerticalPadding="2px" ForeColor="White" />
                            <DynamicMenuStyle BackColor="#F2F4F7"
                                BorderColor="Black"
                                BorderStyle="Solid"
                                ForeColor="Black"
                                BorderWidth="1px"
                                CssClass="IE8Fix" />
                            <DynamicSelectedStyle BackColor="#1C5E55" ForeColor="Black" />
                            <DynamicMenuItemStyle HorizontalPadding="5px"
                                VerticalPadding="2px" />
                            <DynamicHoverStyle BackColor="#FFCC33"
                                BorderStyle="None"
                                Font-Bold="False"
                                ForeColor="Black" />
                            <StaticHoverStyle BackColor="LightSteelBlue"
                                BorderColor="Black"
                                BorderStyle="Solid"
                                BorderWidth="1px"
                                ForeColor="Black"
                                Font-Bold="True" />
                            <Items>
                                <asp:MenuItem Text="Disponível para Lançamentos de VT" Value="0"></asp:MenuItem>
                                <asp:MenuItem Text="Atividades Acadêmicas" Value="1"></asp:MenuItem>
                                <asp:MenuItem Text="Coordenação" Value="2"></asp:MenuItem>
                                <asp:MenuItem Text="Tutoria EAD" Value="3"></asp:MenuItem>
                            </Items>
                        </asp:Menu>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <div id="divAba" class="aba">
                <asp:MultiView ID="mvLancamento" runat="server" ActiveViewIndex="0">
                    <asp:View ID="vwHorasDocentes" runat="server">
                        <table align="center" class="auto-style1">
                            <tr>
                                <td><strong>Horas Docentes: Disponível para Lançamentos de VT
                                <asp:Label ID="lblDataVT" runat="server"></asp:Label>
                                </strong></td>
                            </tr>
                        </table>
                        <table class="auto-style1">
                            <tr>
                                <td align="center">
                                    <asp:Label ID="lblMsg" runat="server" EnableViewState="False"></asp:Label>
                                    <br />
                                    <asp:GridView ID="grdVT" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Style="font-size: small">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Unidade" HeaderText="Unidade" />
                                            <asp:TemplateField HeaderText="Data">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("Data").ToString().Substring(4, 4) + "-" + Eval("Data").ToString().Substring(2, 2) + "-" + Eval("Data").ToString().Substring(0, 2)).ToShortDateString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HoraInicial" HeaderText="Entrada" />
                                            <asp:BoundField DataField="HoraFinal" HeaderText="Saída" />
                                            <asp:BoundField DataField="Categoria" HeaderText="Categoria" />
                                            <asp:TemplateField HeaderText="Trajeto Ida-Volta">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text=""></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtIdaVolta" runat="server" Height="50px" idagenda='<%# Eval("Id") %>' Text='<%# Eval("IdaVolta") %>' TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Valor VT">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <br />
                                                    <asp:TextBox ID="txtValorVT" runat="server" CssClass="moeda" Text='<%# Eval("ValorVT") %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnSalvar" runat="server" CommandArgument="salvar" CommandName="Select" OnClick="Button1_Click" Style="font-family: Verdana; font-size: x-small;" Text="Salvar" ValidationGroup="agendaExecutada" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <EmptyDataTemplate>
                                            Não existem dados cadastrados
                                        </EmptyDataTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </asp:View>
                    <asp:View ID="vwAA" runat="server">
                        <strong>Horas Docentes: Atividades Acadêmicas</strong><br />
                        <table class="auto-style2">
                            <tr>
                                <td align="center" style="text-align: left">
                                    <table class="auto-style2">
                                        <tr>
                                            <td class="auto-style38">Unidade</td>
                                            <td class="auto-style16">Área de Prestação de Serviço</td>
                                            <td class="auto-style18">Data</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style38">
                                                <uc1:ddlUnidade ID="ddlUnidadeAA" runat="server" />
                                            </td>
                                            <td class="auto-style16">
                                                <uc3:ddlArea ID="ddlArea" runat="server" />
                                            </td>
                                            <td class="auto-style18">
                                                <asp:TextBox ID="txtData" runat="server" CssClass="data" data-required-atv="true" Text='<%# Bind("Data") %>' Width="97px"></asp:TextBox>
                                                <asp:RangeValidator ID="rvData" runat="server" ControlToValidate="txtData" MaximumValue="20/02/2020" MinimumValue="01/01/2010" Type="Date" ValidationGroup="salvarAtvAcd"></asp:RangeValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtData" Display="None" ErrorMessage="Data Obrigatória" ValidationGroup="salvarAtvAcd"></asp:RequiredFieldValidator>
                                            </td>
                                            <td colspan="2">
                                                &nbsp;</td>
                                            <td class="auto-style19">
                                                &nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td style="margin-left: 40px">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style38">Entrada - Saída</td>
                                            <td class="auto-style16">
                                                &nbsp;</td>
                                            <td class="auto-style18">Categoria</td>
                                            <td colspan="2">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td style="margin-left: 40px">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style17" colspan="2">
                                                <uc2:EntradaSaida ID="EntradaSaidaAA" runat="server" />
                                            </td>
                                            <td class="auto-style18">
                                                <asp:DropDownList ID="ddlCategoria" runat="server">
                                                    <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                    <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                    <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                    <asp:ListItem Value="4">EAD</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td colspan="2">&nbsp;</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td style="margin-left: 40px">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style38">
                                                Justificativa da Atividade</td>
                                            <td class="auto-style16">
                                                <asp:Label ID="Label2" runat="server" Text="Valor VT"></asp:Label>
                                            </td>
                                            <td align="left" colspan="3">
                                                Trajeto Ida e Volta</td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td align="left" colspan="2" style="margin-left: 40px">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style38">
                                                <asp:TextBox ID="txtJustificativa" runat="server" Height="39px" Text='<%# Bind("Justificativa") %>' TextMode="MultiLine" Width="198px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtJustificativa" Display="None" ErrorMessage="Justificativa Obrigatória" ValidationGroup="salvarAtvAcd"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style16">
                                                <asp:TextBox ID="txtValorVT" runat="server" CssClass="moeda" Text='<%# Bind("ValorVT") %>' Width="60px"></asp:TextBox>
                                            </td>
                                            <td align="left" colspan="3">
                                                <asp:TextBox ID="txtIdaVolta" runat="server" data-required-atv="true" Height="50px" idagenda='<%# Eval("Id") %>' Text='<%# Eval("IdaVolta") %>' TextMode="MultiLine" Width="210px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style19">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td align="left" colspan="2" style="margin-left: 40px">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:Button ID="btnSalvarAtv" runat="server" CommandArgument="salvar" CommandName="Select" Style="font-family: Verdana; font-size: x-small;" Text="Salvar" ValidationGroup="salvarAtvAcd" />
                                    <br />
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="salvarAtvAcd" />
                                    <br />
                                    <asp:Label ID="lblMsgAA" runat="server" EnableViewState="False"></asp:Label>
                                    <br />
                                    <asp:GridView ID="grdAtividadesAcademicas" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" EnableModelValidation="True" ForeColor="#333333" GridLines="None" ShowFooter="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="select" ImageUrl="~/Icones/editar.jpg" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="IdUnidade" HeaderText="Unidade" />
                                            <asp:BoundField DataField="NomeArea" HeaderText="Area" />
                                            <asp:BoundField DataField="Data" DataFormatString="{0:dd/MM/yy}" HeaderText="Data" />
                                            <asp:BoundField DataField="Entrada" HeaderText="Entrada" />
                                            <asp:BoundField DataField="Saida" HeaderText="Saída" />
                                            <asp:TemplateField HeaderText="Categoria">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlCategoria" runat="server" Enabled="False" SelectedValue='<%# Eval("Categoria") %>'>
                                                        <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                        <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                        <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                        <asp:ListItem Value="4">EAD</asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ValorVT" HeaderText="Valor VT" />
                                            <asp:BoundField DataField="TrajetoIdaVolta" HeaderText="Trajeto Ida / Volta" />
                                            <asp:BoundField DataField="Justificativas" HeaderText="Justificativas" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <EmptyDataTemplate>
                                            Não existem dados cadastrados
                                        </EmptyDataTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:View>
                    <asp:View ID="vwCoord" runat="server">
                        <strong>Horas Docentes: Coordenação</strong><table class="auto-style2">
                            <tr>
                                <td align="center" style="text-align: left">
                                    <table class="auto-style2">
                                        <tr>
                                            <td class="auto-style4">Unidade</td>
                                            <td class="auto-style36">Área de Prestação de Serviço</td>
                                            <td class="auto-style6">Data</td>
                                            <td class="auto-style21">&nbsp;</td>
                                            <td class="auto-style20">&nbsp;</td>
                                            <td class="auto-style6">&nbsp;</td>
                                            <td class="auto-style8">&nbsp;</td>
                                            <td class="auto-style4">&nbsp;</td>
                                            <td class="auto-style9">&nbsp;</td>
                                            <td class="auto-style10">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style4">
                                                <uc1:ddlUnidade ID="ddlUnidadeCoord" runat="server" />
                                            </td>
                                            <td class="auto-style36">
                                                <uc3:ddlArea ID="ddlAreaCoord" runat="server" />
                                            </td>
                                            <td class="auto-style6">
                                                <asp:TextBox ID="txtDataCoord" runat="server" CssClass="data" data-required-coord="true" Text='<%# Bind("Data") %>' Width="97px"></asp:TextBox>
                                                <asp:RangeValidator ID="rvDataCoord" runat="server" ControlToValidate="txtDataCoord" Enabled="False" MaximumValue="20/02/2020" MinimumValue="01/01/2010" Type="Date" ValidationGroup="salvarAtvCoord"></asp:RangeValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDataCoord" Display="None" ValidationGroup="salvarAtvCoord" ErrorMessage="Data Obrigatória"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style6" colspan="2">
                                                &nbsp;</td>
                                            <td class="auto-style6">
                                                &nbsp;</td>
                                            <td class="auto-style8">&nbsp;</td>
                                            <td style="margin-left: 40px" class="auto-style4">&nbsp;</td>
                                            <td class="auto-style9">&nbsp;</td>
                                            <td class="auto-style10">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style4" colspan="2">Entrada - Saída</td>
                                            <td class="auto-style6">Categoria</td>
                                            <td class="auto-style6" colspan="2">&nbsp;</td>
                                            <td class="auto-style6">&nbsp;</td>
                                            <td class="auto-style8">&nbsp;</td>
                                            <td class="auto-style4" style="margin-left: 40px">&nbsp;</td>
                                            <td class="auto-style9">&nbsp;</td>
                                            <td class="auto-style10">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style4" colspan="2">
                                                <uc2:EntradaSaida ID="EntradaSaidaCoord" runat="server" />
                                            </td>
                                            <td class="auto-style6">
                                                <asp:DropDownList ID="ddlCategoriaCoord" runat="server">
                                                    <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                    <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                    <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                    <asp:ListItem Value="4">EAD</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style6" colspan="2">&nbsp;</td>
                                            <td class="auto-style6">&nbsp;</td>
                                            <td class="auto-style8">&nbsp;</td>
                                            <td class="auto-style4" style="margin-left: 40px">&nbsp;</td>
                                            <td class="auto-style9">&nbsp;</td>
                                            <td class="auto-style10">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style11">
                                                <asp:Label ID="Label7" runat="server" Text="Valor VT"></asp:Label>
                                            </td>
                                            <td class="auto-style37">Trajeto Ida e Volta</td>
                                            <td align="left" class="auto-style3" colspan="3">&nbsp;</td>
                                            <td class="auto-style13"></td>
                                            <td class="auto-style14"></td>
                                            <td align="left" class="auto-style3" colspan="2" style="margin-left: 40px">&nbsp;</td>
                                            <td class="auto-style15"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style11">
                                                <asp:TextBox ID="txtValorVTCoord" runat="server" CssClass="moeda" Width="60px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style37">
                                                <asp:TextBox ID="txtIdaVoltaCoord" runat="server" data-required-coord="true" Height="50px" TextMode="MultiLine" Width="210px"></asp:TextBox>
                                            </td>
                                            <td align="left" class="auto-style3" colspan="3">&nbsp;</td>
                                            <td class="auto-style13">&nbsp;</td>
                                            <td class="auto-style14">&nbsp;</td>
                                            <td align="left" class="auto-style3" colspan="2" style="margin-left: 40px">&nbsp;</td>
                                            <td class="auto-style15">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:Button ID="btnSalvarCoord" runat="server" CommandArgument="salvar" CommandName="Select" Style="font-family: Verdana; font-size: x-small;" Text="Salvar" ValidationGroup="salvarAtvCoord" />
                                    <br />
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="salvarAtvCoord" />
                                    <br />
                                    <asp:Label ID="lblMsgCoord" runat="server" EnableViewState="False"></asp:Label>
                                    <br />
                                    <asp:GridView ID="grdCoordenacao" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" EnableModelValidation="True" ForeColor="#333333" GridLines="None" ShowFooter="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandName="select" ImageUrl="~/Icones/editar.jpg" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="IdUnidade" HeaderText="Unidade" />
                                            <asp:BoundField DataField="NomeArea" HeaderText="Area" />
                                            <asp:BoundField DataField="Data" DataFormatString="{0:dd/MM/yy}" HeaderText="Data" />
                                            <asp:BoundField DataField="Entrada" HeaderText="Entrada" />
                                            <asp:BoundField DataField="Saida" HeaderText="Saída" />
                                            <asp:TemplateField HeaderText="Categoria">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlCategoria1" runat="server" Enabled="False" SelectedValue='<%# Eval("Categoria") %>'>
                                                        <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                        <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                        <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                        <asp:ListItem Value="4">EAD</asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ValorVT" HeaderText="Valor VT" />
                                            <asp:BoundField DataField="TrajetoIdaVolta" HeaderText="Trajeto Ida / Volta" />
                                            <asp:BoundField DataField="Justificativas" HeaderText="Justificativas" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <EmptyDataTemplate>
                                            Não existem dados cadastrados
                                        </EmptyDataTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:View>
                    <asp:View ID="vwEAD" runat="server">
                        <strong>Horas Tutoria: EAD</strong><br />
                        <table class="auto-style2">
                            <tr>
                                <td align="center" style="text-align: left">
                                    <table class="auto-style2">
                                        <tr>
                                            <td class="auto-style27">Unidade</td>
                                            <td class="auto-style34">Área de Prestação de Serviço</td>
                                            <td class="auto-style31">&nbsp;</td>
                                            <td class="auto-style22">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style27">
                                                <uc1:ddlUnidade ID="ddlUnidadeEAD" runat="server" />
                                            </td>
                                            <td class="auto-style34">
                                                <uc3:ddlArea ID="ddlAreaEAD" runat="server" />
                                            </td>
                                            <td class="auto-style31">
                                                <br />
                                                <br />
                                            </td>
                                            <td colspan="2">
                                                &nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td style="margin-left: 40px">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style27">Data</td>
                                            <td class="auto-style34">Entrada - Saída</td>
                                            <td class="auto-style31">&nbsp;</td>
                                            <td colspan="2">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td style="margin-left: 40px">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style27">
                                                <asp:TextBox ID="txtDataEAD" runat="server" CssClass="data" data-required-ead="true" Text='<%# Bind("Data") %>' Width="97px"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDataEAD" Display="None" ErrorMessage="Data Obrigatória" ValidationGroup="salvarAtvEAD"></asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="rvDataEAD" runat="server" ControlToValidate="txtDataEAD" Enabled="False" MaximumValue="20/02/2020" MinimumValue="01/01/2010" Type="Date" ValidationGroup="salvarAtvEAD"></asp:RangeValidator>
                                            </td>
                                            <td class="auto-style34">
                                                <uc2:EntradaSaida ID="EntradaSaidaEAD" runat="server" />
                                            </td>
                                            <td class="auto-style31">&nbsp;</td>
                                            <td colspan="2">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td style="margin-left: 40px">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">
                                                <asp:Label ID="Label6" runat="server" Text="Valor VT"></asp:Label>
                                                &nbsp;(Apenas para os Encontros Presenciais)</td>
                                            <td class="auto-style35">Trajeto Ida e Volta</td>
                                            <td align="left" class="auto-style3" colspan="3">&nbsp;</td>
                                            <td class="auto-style3"></td>
                                            <td class="auto-style3"></td>
                                            <td align="left" class="auto-style3" colspan="2" style="margin-left: 40px">&nbsp;</td>
                                            <td class="auto-style3"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style28">
                                                <asp:TextBox ID="txtValorVTEAD" runat="server" CssClass="moeda" Width="60px"></asp:TextBox>
                                            </td>
                                            <td class="auto-style35">
                                                <asp:TextBox ID="txtIdaVoltaEAD" runat="server" data-required-ead="true" Height="50px" TextMode="MultiLine" Width="210px"></asp:TextBox>
                                            </td>
                                            <td align="left" class="auto-style3" colspan="3">&nbsp;</td>
                                            <td class="auto-style3">&nbsp;</td>
                                            <td class="auto-style3">&nbsp;</td>
                                            <td align="left" class="auto-style3" colspan="2" style="margin-left: 40px">&nbsp;</td>
                                            <td class="auto-style3">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:Button ID="btnSalvarEAD" runat="server" CommandArgument="salvar" CommandName="Select" Style="font-family: Verdana; font-size: x-small; height: 20px;" Text="Salvar" ValidationGroup="salvarAtvEAD" />
                                    <br />
                                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="salvarAtvEAD" />
                                    <br />
                                    <asp:Label ID="lblMsgEAD" runat="server" EnableViewState="False"></asp:Label>
                                    <br />
                                    <asp:GridView ID="grdEAD" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" EnableModelValidation="True" ForeColor="#333333" GridLines="None" ShowFooter="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton3" runat="server" CommandName="select" ImageUrl="~/Icones/editar.jpg" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="IdUnidade" HeaderText="Unidade" />
                                            <asp:BoundField DataField="NomeArea" HeaderText="Area" />
                                            <asp:BoundField DataField="Data" DataFormatString="{0:dd/MM/yy}" HeaderText="Data" />
                                            <asp:BoundField DataField="Entrada" HeaderText="Entrada" />
                                            <asp:BoundField DataField="Saida" HeaderText="Saída" />
                                            <asp:TemplateField HeaderText="Categoria">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlCategoria2" runat="server" Enabled="False" SelectedValue='<%# Eval("Categoria") %>'>
                                                        <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                        <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                        <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                        <asp:ListItem Value="4">EAD</asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ValorVT" HeaderText="Valor VT" />
                                            <asp:BoundField DataField="TrajetoIdaVolta" HeaderText="Trajeto Ida / Volta" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <EmptyDataTemplate>
                                            Não existem dados cadastrados
                                        </EmptyDataTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </asp:View>
                    <asp:View ID="vwVT" runat="server">
                        <br />
                        <table class="auto-style2">
                            <tr>
                                <td align="center">
                                    <table class="auto-style2">
                                        <tr>
                                            <td>Atividade</td>
                                            <td>Unidade</td>
                                            <td>Área</td>
                                            <td>Data</td>
                                            <td>Entrada - Saída</td>
                                            <td>&nbsp;</td>
                                            <td>Categoria</td>
                                            <td>Justificativa da Atividade</td>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text="Valor VT"></asp:Label>
                                            </td>
                                            <td>Trajeto Ida e Volta</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlAtividade" runat="server">
                                                    <asp:ListItem Value="Atividade Acadêmica">Atividade Acadêmica</asp:ListItem>
                                                    <asp:ListItem>Coordenação</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtUnidadeVT" runat="server" CssClass="sonumero" data-required-coord="true" Text='<%# Eval("Unidade") %>' Width="50px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlAreaVT" runat="server">
                                                    <asp:ListItem Value="AJRAA01">Beleza e Bem Estar - Instrutor - AJRAA01</asp:ListItem>
                                                    <asp:ListItem Value="P1CAAC12">Beleza e Bem Estar - Instrutor - P1CAAC12</asp:ListItem>
                                                    <asp:ListItem Value="P1CAAC22">Beleza e Bem Estar - Instrutor - P1CAAC22</asp:ListItem>
                                                    <asp:ListItem Value="AJRAAA27">Ensino e Sustentabilidade - Instrutor - AJRAAA27</asp:ListItem>
                                                    <asp:ListItem Value="P2AJHC12">Gastronomia - Instrutor - P2AJHC12</asp:ListItem>
                                                    <asp:ListItem Value="P2AJHC33">Gastronomia - Instrutor - P2AJHC33</asp:ListItem>
                                                    <asp:ListItem Value="AJRAAA01">Responsabilidade Social Corporativa - AJRAAA01</asp:ListItem>
                                                    <asp:ListItem Value="AJRAAA27">Responsabilidade Social Corporativa - AJRAAA27</asp:ListItem>
                                                    <asp:ListItem Value="P1A4R161">Saúde - Instrutor - P1A4R161</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDataVT" runat="server" CssClass="data" data-required-coord="true" Text='<%# Bind("Data") %>' Width="97px"></asp:TextBox>
                                            </td>
                                            <td colspan="2">
                                                <uc2:EntradaSaida ID="EntradaSaidaVT" runat="server" />
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlCategoriaVT" runat="server">
                                                    <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                    <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                    <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                    <asp:ListItem Value="4">EAD</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtJustificativaVT" runat="server" Height="39px" Text='<%# Bind("Justificativa") %>' TextMode="MultiLine" Width="139px"></asp:TextBox>
                                            </td>
                                            <td style="margin-left: 40px">
                                                <asp:TextBox ID="txtValorVTVT" runat="server" CssClass="moeda" data-required-coord="true" Text='<%# Bind("ValorVT") %>' Width="60px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtIdaVoltaVT" runat="server" data-required-coord="true" Height="50px" idagenda='<%# Eval("Id") %>' Text='<%# Eval("IdaVolta") %>' TextMode="MultiLine" Width="140px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnSalvarVT" runat="server" CommandArgument="salvar" CommandName="Select" Style="font-family: Verdana; font-size: x-small;" Text="Salvar" ValidationGroup="salvarAtvCoord" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">&nbsp;</td>
                                            <td class="auto-style3"></td>
                                            <td class="auto-style3"></td>
                                            <td align="left" class="auto-style3" colspan="3">
                                                <asp:RangeValidator ID="rvDataVT" runat="server" ControlToValidate="txtDataVT" Enabled="False" MaximumValue="20/02/2020" MinimumValue="01/01/2010" Type="Date" ValidationGroup="salvarAtvCoord"></asp:RangeValidator>
                                            </td>
                                            <td class="auto-style3"></td>
                                            <td class="auto-style3"></td>
                                            <td align="left" class="auto-style3" colspan="2" style="margin-left: 40px">&nbsp;</td>
                                            <td class="auto-style3"></td>
                                        </tr>
                                    </table>
                                    <asp:Label ID="lblMsgVT" runat="server" EnableViewState="False"></asp:Label>
                                    <br />
                                    <asp:GridView ID="grdLancamentoVT" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" EnableModelValidation="True" ForeColor="#333333" GridLines="None" ShowFooter="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton4" runat="server" CommandName="select" ImageUrl="~/Icones/editar.jpg" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Atividade" HeaderText="Atividade" />
                                            <asp:BoundField DataField="IdUnidade" HeaderText="Unidade" />
                                            <asp:TemplateField HeaderText="Area">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Area") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlArea3" runat="server" Enabled="False" SelectedValue='<%# Eval("Area") %>'>
                                                        <asp:ListItem Value="AJRAA01">Beleza e Bem Estar - Instrutor - AJRAA01</asp:ListItem>
                                                        <asp:ListItem Value="P1CAAC12">Beleza e Bem Estar - Instrutor - P1CAAC12</asp:ListItem>
                                                        <asp:ListItem Value="P1CAAC22">Beleza e Bem Estar - Instrutor - P1CAAC22</asp:ListItem>
                                                        <asp:ListItem Value="AJRAAA27">Ensino e Sustentabilidade - Instrutor - AJRAAA27</asp:ListItem>
                                                        <asp:ListItem Value="P2AJHC12">Gastronomia - Instrutor - P2AJHC12</asp:ListItem>
                                                        <asp:ListItem Value="P2AJHC33">Gastronomia - Instrutor - P2AJHC33</asp:ListItem>
                                                        <asp:ListItem Value="AJRAAA01">Responsabilidade Social Corporativa - AJRAAA01</asp:ListItem>
                                                        <asp:ListItem Value="AJRAAA27">Responsabilidade Social Corporativa - AJRAAA27</asp:ListItem>
                                                        <asp:ListItem Value="P1A4R161">Saúde - Instrutor - P1A4R161</asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Data" DataFormatString="{0:MMMM d, yyyy}" HeaderText="Data" />
                                            <asp:BoundField DataField="Entrada" HeaderText="Entrada" />
                                            <asp:BoundField DataField="Saida" HeaderText="Saída" />
                                            <asp:TemplateField HeaderText="Categoria">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlCategoria3" runat="server" Enabled="False" SelectedValue='<%# Eval("Categoria") %>'>
                                                        <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                        <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                        <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                        <asp:ListItem Value="4">EAD</asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Justificativas" HeaderText="Justificativas" />
                                            <asp:BoundField DataField="ValorVT" HeaderText="Valor VT" />
                                            <asp:BoundField DataField="TrajetoIdaVolta" HeaderText="Trajeto Ida / Volta" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <EmptyDataTemplate>
                                            Não existem dados cadastrados
                                        </EmptyDataTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:View>
                    <br />
                    <br />
                </asp:MultiView>
            </div>
            <br />
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>  --%><%--<asp:Panel ID="pnlVT" runat="server" BorderColor="#6666FF" BorderStyle="Solid" BorderWidth="2px" Height="150px" ScrollBars="Vertical">--%>
            <asp:Panel ID="pnl" runat="server">
                <br />
                <br />

                <br />

                <table class="auto-style1">
                    <tr>
                        <td align="right">&nbsp;</td>
                    </tr>
                </table>
                <br />


                <br />
            </asp:Panel>
            <%--     </ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
    </form>
</body>
</html>
