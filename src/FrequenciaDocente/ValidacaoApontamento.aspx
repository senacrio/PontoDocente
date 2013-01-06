﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ValidacaoApontamento.aspx.vb" Inherits="FrequenciaDocente_ValidacaoApontamento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">
        function expandcollapse(obj, row) {
            var div = document.getElementById(obj);
            var img = document.getElementById('img' + obj);

            if (div.style.display == "none") {
                div.style.display = "block";
                if (row == 'alt') {
                    img.src = "minus.gif";
                }
                else {
                    img.src = "minus.gif";
                }
                img.alt = "Close to view other Customers";
            }
            else {
                div.style.display = "none";
                if (row == 'alt') {
                    img.src = "plus.gif";
                }
                else {
                    img.src = "plus.gif";
                }
                img.alt = "Expand to show Orders";
            }
        }
    </script>
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table class="auto-style1">
                <tr>
                    <td style="text-align: center"><strong>Autorização de Lançamentos</strong></td>
                </tr>
            </table>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Panel ID="pnl" runat="server">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdValidacao" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdUnidade,Matricula,Categoria" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <a href="javascript:expandcollapse('div<%# Eval("id")%>', 'one');">
                                                        <img id='imgdiv<%# Eval("id")%>' width="9px" border="0" src="plus.gif" />
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Matrícula">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("matricula") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("matricula") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Nome do Colaborador">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("funcionario") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("funcionario") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Categoria">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Categoria") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlCategoria" runat="server" Enabled="False" SelectedValue='<%# Eval("Categoria") %>'>
                                                        <asp:ListItem Value="1">Fic/Tec</asp:ListItem>
                                                        <asp:ListItem Value="2">Graduação</asp:ListItem>
                                                        <asp:ListItem Value="3">Pós-Graduação</asp:ListItem>
                                                        <asp:ListItem Value="4">EAD</asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Qtde Horas">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("qtdHoras") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("qtdHoras") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Valor VT Total">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("valorTotal") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("valorTotal") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unidade Execução">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("IdUnidade") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Nome Unidade">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Unidade") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Unidade") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Centro de Custo"></asp:TemplateField>
                                            <asp:TemplateField HeaderText="Autorização">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkValidacao" runat="server" IdCategoria='<%# Eval("Categoria") %>' IdUnidade='<%# Eval("IdUnidade") %>' Matricula='<%# Eval("matricula") %>' Tipo='<%# Eval("Tipo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td colspan="100%">
                                                            <div id='div<%# Eval("id") %>' style="display: none; position: relative; left: 15px; OVERFLOW: auto; WIDTH: 97%">
                                                                <asp:GridView ID="grdDetalhes" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" DataKeyNames="id" EnableModelValidation="True" Font-Names="Verdana" Font-Size="X-Small" Width="100%">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="Entrada" HeaderText="Entrada" />
                                                                        <asp:BoundField DataField="Saida" HeaderText="Saída" />
                                                                        <asp:BoundField DataField="horas" HeaderText="Total Horas" />
                                                                        <asp:BoundField DataField="ValorVT" HeaderText="Valor VT" />
                                                                        <asp:BoundField DataField="Justificativas" HeaderText="Justificativas" />
                                                                        <asp:BoundField DataField="TrajetoIdaVolta" HeaderText="Trajeto" />
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="btnValidar" runat="server" CommandArgument='<%# Eval("id") %>' Tipo='<%# Eval("tipo") %>' OnClientClick="return confirm('Deseja validar esse apontamento?')" Text="Validar" OnClick="btnValidar_Click" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                <hr />
                                                            </div>
                                                        </td>
                                                    </tr>
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
                            <tr>
                                <td align="center">
                                    <br />
                                    <asp:Button ID="btnSalvar" runat="server" CssClass="botao" Text="Salvar" OnClientClick="return confirm('Deseja validar esses apontamentos?')" />
                                    &nbsp;<asp:Button ID="btnCancelar" runat="server" CssClass="botao" Text="Cancelar" />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
            <br />
            <br />

        </div>
    </form>
</body>
</html>