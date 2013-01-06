<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LancarApontamento.aspx.vb" Inherits="FrequenciaDocente_LancarApontamento" EnableEventValidation="false" %>

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
        .auto-style3
        {
            height: 23px;
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
                    <td><strong>Horas Docentes: Disponível para Lançamentos de VT
                        <asp:Label ID="lblDataVT" runat="server"></asp:Label>
                    </strong>
                    </td>
                </tr>
            </table>
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>  --%>
            <%--<asp:Panel ID="pnlVT" runat="server" BorderColor="#6666FF" BorderStyle="Solid" BorderWidth="2px" Height="150px" ScrollBars="Vertical">--%>
            <asp:Panel ID="pnl" runat="server">
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
                <strong>Horas Docentes: Atividades Acadêmicas</strong><br />

                <table class="auto-style2">
                    <tr>
                        <td align="center">
                            <table class="auto-style2">
                                <tr>
                                    <td>Unidade</td>
                                    <td>Área</td>
                                    <td>Data</td>
                                    <td>Entrada</td>
                                    <td>Saída</td>
                                    <td>Categoria</td>
                                    <td>Justificativas</td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Valor VT"></asp:Label>
                                    </td>
                                    <td>Trajeto Ida e Volta</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUnidade" runat="server" CssClass="sonumero" data-required-atv="true" Text='<%# Eval("Unidade") %>' Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
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
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtData" runat="server" CssClass="data" data-required-atv="true" Text='<%# Bind("Data") %>' Width="97px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEntrada" runat="server" CssClass="horario" data-required-atv="true" Text='<%# Bind("Entrada") %>' Width="60px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSaida" runat="server" CssClass="horario" data-required-atv="true" Text='<%# Bind("Saida") %>' Width="60px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCategoria" runat="server">
                                            <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                            <asp:ListItem Value="2">Graduação</asp:ListItem>
                                            <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                            <asp:ListItem Value="4">EAD</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtJustificativa" runat="server" Height="39px" Text='<%# Bind("Justificativa") %>' TextMode="MultiLine" Width="198px"></asp:TextBox>
                                    </td>
                                    <td style="margin-left: 40px">
                                        <asp:TextBox ID="txtValorVT" runat="server" CssClass="moeda" data-required-atv="true" Text='<%# Bind("ValorVT") %>' Width="60px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtIdaVolta" runat="server" data-required-atv="true" Height="50px" idagenda='<%# Eval("Id") %>' Text='<%# Eval("IdaVolta") %>' TextMode="MultiLine" Width="210px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSalvarAtv" runat="server" CommandArgument="salvar" CommandName="Select" Style="font-family: Verdana; font-size: x-small;" Text="Salvar" ValidationGroup="salvarAtvAcd" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="3" align="left">
                                        <asp:RangeValidator ID="rvData" runat="server" ControlToValidate="txtData" MaximumValue="20/02/2020" MinimumValue="01/01/2010" Type="Date" ValidationGroup="salvarAtvAcd"></asp:RangeValidator>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="2" align="left" style="margin-left: 40px">
                                        <asp:RangeValidator ID="rvValorVT" runat="server" ControlToValidate="txtValorVT" MaximumValue="20" MinimumValue="0" Type="Currency" ValidationGroup="salvarAtvAcd"></asp:RangeValidator>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <asp:GridView ID="grdAtividadesAcademicas" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" ShowFooter="True" DataKeyNames="Id">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="select" ImageUrl="~/Icones/editar.jpg" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IdUnidade" HeaderText="Unidade" />
                                    <asp:TemplateField HeaderText="Area">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Area") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlArea" runat="server" Enabled="False" SelectedValue='<%# Eval("Area") %>'>
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
                                            <asp:DropDownList ID="ddlCategoria" runat="server" Enabled="False" SelectedValue='<%# Eval("Categoria") %>'>
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

                <table class="auto-style1">
                    <tr>
                        <td align="right">&nbsp;</td>
                    </tr>
                </table>
                <br />


                <strong>Horas Docentes: Coordenação</strong><table class="auto-style2">
                    <tr>
                        <td align="center">
                            <table class="auto-style2">
                                <tr>
                                    <td>Unidade</td>
                                    <td>Área</td>
                                    <td>Data</td>
                                    <td>Entrada</td>
                                    <td>Saída</td>
                                    <td>Categoria</td>
                                    <td>Justificativas</td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Valor VT"></asp:Label>
                                    </td>
                                    <td>Trajeto Ida e Volta</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUnidadeCoord" runat="server" CssClass="sonumero" data-required-coord="true" Text='<%# Eval("Unidade") %>' Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlAreaCoord" runat="server">
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
                                        <asp:TextBox ID="txtDataCoord" runat="server" CssClass="data" data-required-coord="true" Text='<%# Bind("Data") %>' Width="97px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEntradaCoord" runat="server" CssClass="horario" data-required-coord="true" Text='<%# Bind("Entrada") %>' Width="60px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSaidaCoord" runat="server" CssClass="horario" data-required-coord="true" Text='<%# Bind("Saida") %>' Width="60px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCategoriaCoord" runat="server">
                                            <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                            <asp:ListItem Value="2">Graduação</asp:ListItem>
                                            <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                            <asp:ListItem Value="4">EAD</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtJustificativaCoord" runat="server" Height="39px" Text='<%# Bind("Justificativa") %>' TextMode="MultiLine" Width="198px"></asp:TextBox>
                                    </td>
                                    <td style="margin-left: 40px">
                                        <asp:TextBox ID="txtValorVTCoord" runat="server" CssClass="moeda" data-required-coord="true" Text='<%# Bind("ValorVT") %>' Width="60px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtIdaVoltaCoord" runat="server" data-required-coord="true" Height="50px" idagenda='<%# Eval("Id") %>' Text='<%# Eval("IdaVolta") %>' TextMode="MultiLine" Width="210px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSalvarCoord" runat="server" CommandArgument="salvar" CommandName="Select" Style="font-family: Verdana; font-size: x-small;" Text="Salvar" ValidationGroup="salvarAtvCoord" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3"></td>
                                    <td class="auto-style3"></td>
                                    <td colspan="3" align="left" class="auto-style3">
                                        <asp:RangeValidator ID="rvDataCoord" runat="server" ControlToValidate="txtDataCoord" MaximumValue="20/02/2020" MinimumValue="01/01/2010" Type="Date" ValidationGroup="salvarAtvCoord" Enabled="False"></asp:RangeValidator>
                                    </td>
                                    <td class="auto-style3"></td>
                                    <td class="auto-style3"></td>
                                    <td colspan="2" align="left" style="margin-left: 40px" class="auto-style3">
                                        <asp:RangeValidator ID="rvValorVTCoord" runat="server" ControlToValidate="txtValorVTCoord" MaximumValue="20" MinimumValue="0" Type="Currency" ValidationGroup="salvarAtvAcd"></asp:RangeValidator>
                                    </td>
                                    <td class="auto-style3"></td>
                                </tr>
                            </table>
                            <br />
                            <asp:GridView ID="grdCoordenacao" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" ShowFooter="True" DataKeyNames="Id">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="select" ImageUrl="~/Icones/editar.jpg" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IdUnidade" HeaderText="Unidade" />
                                    <asp:TemplateField HeaderText="Area">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Area") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlArea1" runat="server" Enabled="False" SelectedValue='<%# Eval("Area") %>'>
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
                                            <asp:DropDownList ID="ddlCategoria1" runat="server" Enabled="False" SelectedValue='<%# Eval("Categoria") %>'>
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
            </asp:Panel>
            <%--     </ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
    </form>
</body>
</html>
