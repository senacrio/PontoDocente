<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CronogramaFechamento.aspx.vb" Inherits="FrequenciaDocente_CronogramaFechamento" %>

<%@ Register src="controls/DeAte.ascx" tagname="DeAte" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Sos/css/Aba.css" rel="stylesheet" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.maskMoney.js"></script>
    <script src="js/moedas.js"></script>
    <script src="js/numeros.js"></script>
    <title></title>
 
    
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
        }
        .auto-style4
        {
            font-size: x-large;
        }
        .auto-style5
        {
            font-size: large;
        }
        .auto-style11
        {
            height: 31px;
        }
        .auto-style12
        {
            height: 23px;
        }
        .auto-style14
        {
            width: 170px;
            text-align: right;
            height: 31px;
        }
        .auto-style15
        {
            width: 170px;
            text-align: right;
        }
        .auto-style17
        {
            width: 133px;
            text-align: right;
        }
        .auto-style19
        {
            text-align: left;
            font-size: small;
        }
        .auto-style21
        {
            width: 197px;
            text-align: left;
            height: 31px;
            font-size: small;
        }
        .auto-style22
        {
            font-size: small;
        }
        .auto-style23
        {
            height: 31px;
            font-size: small;
        }
        .auto-style24
        {
            width: 197px;
            text-align: left;
            font-size: small;
            height: 19px;
        }
        .auto-style25
        {
            font-size: small;
            height: 19px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="conteudo">
    
        <table class="auto-style1">
            <tr>
                <td style="text-align: center"><strong>CRONOGRAMA DE FECHAMENTO</strong></td>
            </tr>
        </table>
    
        <br />
        <br />
    
    
        <table class="auto-style1">
            <tr>
                <td valign="top">
                        <table style="width: 430px" align="right" >
                            <tr>
                                <td colspan="2" style="text-align: center; background-color: #95B3D7"><strong>Período Apotamento Instrutores - VT</strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style14">De:</td>
                                <td class="auto-style11">
                                    <asp:TextBox ID="txtDeDia" CssClass="sonumero" runat="server" MaxLength="2" Width="40px"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtDeMes" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtDeAno" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    </span></strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Até:</td>
                                <td>
                                    <asp:TextBox ID="txtAteDia" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtAteMes" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtAteAno" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    </span></strong></td>
                            </tr>
                        </table>
                    </td>
                <td>
                        <table style="width: 428px" >
                            <tr>
                                <td colspan="2" style="text-align: center; background-color: #95B3D7"><strong>Período Apotamento Instrutores
                                    <br />
                                    Atividades Acadêmicas e de Coordenação</strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style17">De:</td>
                                <td>
                                    <asp:TextBox ID="txtDeDiaCoord" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtDeMesCoord" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtDeAnoCoord" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    </span></strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style17">Até:</td>
                                <td>
                                    <asp:TextBox ID="txtAteDiaCoord" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtAteMesCoord" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtAteAnoCoord" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    </span></strong></td>
                            </tr>
                        </table>
                    </td>
            </tr>
            <tr>
                <td valign="top">
                        <table style="width: 431px" align="right" >
                            <tr>
                                <td colspan="2" style="text-align: center; background-color: #95B3D7"><strong>Período Aprovação Apotamento </strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style15">De:</td>
                                <td>
                                    <asp:TextBox ID="txtDeDiaApt" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtDeMesApt" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtDeAnoApt" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    </span></strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style14">Até:</td>
                                <td class="auto-style11">
                                    <asp:TextBox ID="txtAteDiaApt" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtAteMesApt" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtAteAnoApt" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    </span></strong></td>
                            </tr>
                        </table>
                    </td>
                <td>
                        <table style="width: 430px" >
                            <tr>
                                <td colspan="2" style="text-align: center; background-color: #95B3D7" class="auto-style12"><strong>Parâmetros</strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style21">Turno Manhã....................:</td>
                                <td class="auto-style23">
                                    <uc1:DeAte ID="DeAte1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">Turno Tarde.......................:</td>
                                <td class="auto-style25">
                                    <uc1:DeAte ID="DeAte2" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style19">Turno Noite................ .......:</td>
                                <td class="auto-style22">
                                    <uc1:DeAte ID="DeAte3" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td  colspan="2" valign="top"><span class="auto-style22">Jornada Mínima para VA (Horas)...............................: R$</span>
                                    <asp:TextBox CssClass="moeda" ID="txtValorVa" runat="server" Width="50px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style19" colspan="2">Valor Unitário Auxílio Alimentação.............................: R$
                                    <asp:TextBox CssClass="moeda" ID="txtValorAA" runat="server" Width="50px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style19" colspan="2">Valor de Corte para Requisição diária VT...................: R$
                                    <asp:TextBox CssClass="moeda" ID="txtValorVT" runat="server" Width="50px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
            </tr>
        </table>

        </div>
    </form>
</body>
</html>
