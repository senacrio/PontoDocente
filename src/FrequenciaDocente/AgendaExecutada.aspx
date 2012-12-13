<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AgendaExecutada.aspx.vb" EnableEventValidation="false" Inherits="FrequenciaDocente_AgendaExecutada" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1
        {
            width: 100%;
        }
          .auto-style2
        {
            width: 263px;
        }
        .auto-style3
        {
            width: 400px;
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
    
    <table class="auto-style1">
        <tr>
            <td align="center"><strong>IMPORTAÇÃO DE AGENDA EXECUTADA<br />
                        <br />
                        </strong>
                        <asp:Label ID="lblMsg" runat="server" EnableViewState="False"></asp:Label>
                    <br />
                <br />
                    </td>
        </tr>
    </table>
    
    </div>
        <table class="auto-style1">
            <tr>
                <td align="left" class="auto-style2">O cornograma que está sendo usado é o:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblCronograma" runat="server"></asp:Label>
                </td>
                <td>
                         &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="auto-style2">Selecione o arquivo de horas executadas:</td>
                <td class="auto-style3">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="391px" />
                </td>
                <td>
                         <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="botao" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="grdArquivos" runat="server" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" EnableViewState="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Parametro" HeaderText="Configuração Utilizada" />
                <asp:BoundField DataField="DataHora" HeaderText="Data / Hora " />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" AlternateText='<%# Eval("Arquivo") %>' Height="28px" ImageUrl="~/Icones/download.gif" OnClick="ImageButton1_Click" Width="30px" />
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
    </form>
</body>
</html>
