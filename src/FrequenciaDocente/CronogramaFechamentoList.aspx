<%@ Page Language="VB" AutoEventWireup="false" EnableEventValidation="false" CodeFile="CronogramaFechamentoList.aspx.vb" Inherits="FrequenciaDocente_CronogramaFechamentoList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
        }
          .botao{
        border-style: none;
            border-color: inherit;
            border-width: 0px;
            font-size:10px;
            font-family:Verdana,Helvetica;
            font-weight:bold;
            color:white;
            background:#638cb5;
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td align="center"><strong>LISTAGEM DOS</strong> <strong>CRONOGRAMAS DE FECHAMENTO<br />
                        <br />
                        </strong>
                        <asp:Label ID="lblMsg" runat="server" EnableViewState="False"></asp:Label>
                    </td>
        </tr>
    </table>
        <p style="text-align: left">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btnNovo" runat="server" Text="Novo Cronograma" CssClass="botao" Width="117px" />
        <br />
    </p>
        <table class="auto-style1">
            <tr>
                <td align="center">
                    <asp:GridView ID="grdCronogramaFechamento" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" DataKeyNames="Id">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="imgAtivo" runat="server" ImageUrl="~/Icones/grid_semaforo_verde.jpg" Visible='<%# Eval("Ativo") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="mes" HeaderText="Mês" />
                            <asp:BoundField DataField="ano" HeaderText="Ano" />
                            <asp:BoundField DataField="versao" HeaderText="Versão" />
                            <asp:BoundField DataField="PCO_DE" HeaderText="Data Início do Cronograma" />
                            <asp:BoundField DataField="PAA_ATE" HeaderText="Data Final do Cronograma" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="select" ImageUrl="~/Icones/editar.jpg" CommandArgument='<%# Eval("Id") %>' OnClick="ImageButton1_Click" />
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
    <div>
    
    </div>
    </form>
</body>
</html>
