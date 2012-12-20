<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LancarApontamento.aspx.vb" Inherits="FrequenciaDocente_LancarApontamento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <asp:Panel ID="pnlVT" runat="server" BorderColor="#6666FF" BorderStyle="Solid" BorderWidth="2px" Height="200px" ScrollBars="Vertical">
            <table class="auto-style1">
                <tr>
                    <td align="center">Horas Docentes: Disponível para Lançamentos de VT a partir do dia:
                        <asp:Label ID="lblDataVT" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="grdVT" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
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
                                        <asp:TextBox ID="txtIdoVolta" runat="server" Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Valor VT">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
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
    
    </div>
    </form>
</body>
</html>
