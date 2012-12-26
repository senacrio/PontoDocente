<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LancarApontamento.aspx.vb" Inherits="FrequenciaDocente_LancarApontamento" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/jquery1.8.3.js"></script>
    <script src="js/jquery.maskMoney.js"></script>
    <script src="js/moedas.js"></script>
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
            margin-bottom: 0px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <table align="center" class="auto-style1">
                <tr>
                    <td>Horas Docentes: Disponível para Lançamentos de VT
                        <asp:Label ID="lblDataVT" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlVT" runat="server" BorderColor="#6666FF" BorderStyle="Solid" BorderWidth="2px" Height="150px" ScrollBars="Vertical">
                        <table class="auto-style1">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdVT" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Style="font-size: small">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Unidade" HeaderText="Unidade" />
                                            <asp:TemplateField HeaderText="Data">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("Data").ToString().Substring(0, 4) + "-" + Eval("Data").ToString().Substring(6, 2) + "-" + Eval("Data").ToString().Substring(4, 2)).ToShortDateString()%>'></asp:Label>
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
                                                    <asp:TextBox ID="txtIdaVolta" runat="server" Height="50px" TextMode="MultiLine" Text='<%# Eval("IdaVolta") %>' idagenda='<%# Eval("Id") %>' Width="300px"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Valor VT">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtValorVT" Text='<%# "Valor corte: " + Eval("MaxValueVT") %>' MinimumValue="0" MaximumValue='<%# Eval("MaxValueVT") %>' Type="Currency"></asp:RangeValidator>
                                                    <br />
                                                    <asp:TextBox ID="txtValorVT" runat="server" Text='<%# Eval("ValorVT") %>' CssClass="moeda"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnSalvar" runat="server" CommandArgument="salvar" OnClick="Button1_Click" Style="font-family: Verdana; font-size: x-small;" Text="Salvar" CommandName="Select" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
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
                        <asp:Panel ID="Panel1" runat="server">
                            <table class="auto-style2">
                                <tr>
                                    <td align="center">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" ShowFooter="True">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Unidade">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Unidade") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtUnidade" runat="server" Text='<%# Eval("Unidade") %>' Width="50px"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtUnidade" runat="server" Text='<%# Eval("Unidade") %>' Width="50px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Área">
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlArea" runat="server">
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
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlArea" runat="server">
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
                                                <asp:TemplateField HeaderText="Data">
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtArea" runat="server" Text='<%# Bind("Data") %>' Width="97px"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtArea" runat="server" Text='<%# Bind("Data") %>' Width="97px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Entrada">
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtEntrada" runat="server" Text='<%# Bind("Entrada") %>' Width="60px"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Entrada") %>' Width="60px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Saída">
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtSaida" runat="server" Text='<%# Bind("Saida") %>' Width="60px"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtSaida" runat="server" Text='<%# Bind("Saida") %>' Width="60px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Categoria">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Categoria") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlCategoria" runat="server">
                                                            <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                            <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                            <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                            <asp:ListItem Value="4">EAD</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlCategoria" runat="server">
                                                            <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                            <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                            <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                            <asp:ListItem Value="4">EAD</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Justificativa">
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtJustificativa" runat="server" Height="39px" Text='<%# Bind("Justificativa") %>' TextMode="MultiLine" Width="198px"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtJustificativa" runat="server" Height="39px" Text='<%# Bind("Justificativa") %>' TextMode="MultiLine" Width="198px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Valor VT">
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtValorVT" runat="server" Text='<%# Bind("ValorVT") %>' Width="60px"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtValorVT" runat="server" Text='<%# Bind("ValorVT") %>' Width="60px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Trajeto Ida-Volta">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("IdaVolta") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtIdaVolta" runat="server" Height="50px" idagenda='<%# Eval("Id") %>' Text='<%# Eval("IdaVolta") %>' TextMode="MultiLine" Width="210px"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtIdaVolta" runat="server" Height="50px" idagenda='<%# Eval("Id") %>' Text='<%# Eval("IdaVolta") %>' TextMode="MultiLine" Width="210px"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <FooterTemplate>
                                                        <asp:Button ID="btnSalvar" runat="server" CommandArgument="salvar" CommandName="Select" Style="font-family: Verdana; font-size: x-small;" Text="Salvar" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                    </asp:Panel>
                    <table class="auto-style1">
                        <tr>
                            <td align="right">&nbsp;</td>
                        </tr>
                    </table>
                    <br />

                </ContentTemplate>
            </asp:UpdatePanel>
            <br />

        </div>
    </form>
</body>
</html>
