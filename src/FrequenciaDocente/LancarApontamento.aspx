<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LancarApontamento.aspx.vb" Inherits="FrequenciaDocente_LancarApontamento" EnableEventValidation="false"  %>

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
        }
          .botao{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
        background:#638cb5;
        border:0px;
        width:80px;
        height:19px;
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
         <%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
                    <asp:Panel ID="pnlVT" runat="server" BorderColor="#6666FF" BorderStyle="Solid" BorderWidth="2px" Height="523px" ScrollBars="Vertical">
                        <table class="auto-style1">
                            <tr>
                                <td align="center">&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdVT" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" EnableModelValidation="True" ForeColor="#333333" GridLines="None" style="font-size: small">
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
                                                    <asp:TextBox ID="txtValorVT" runat="server" Text='<%# Eval("ValorVT") %>' CssClass="moeda"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnSalvar" runat="server" CommandArgument="salvar" onclick="Button1_Click" style="font-family: Verdana; font-size: x-small;" Text="Salvar" CommandName="select" />
                                                </ItemTemplate>
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
                <br />
                    </asp:Panel>
                    <table class="auto-style1">
                        <tr>
                            <td align="right">
                                <asp:Button ID="btnSalvar" runat="server" CssClass="botao" Text="Salvar" />
                            </td>
                        </tr>
                    </table>
                    <br />
<%--                </ContentTemplate>
            </asp:UpdatePanel>--%>
            <br />

        </div>
    </form>
</body>
</html>
