<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CronogramaFechamento.aspx.vb" Inherits="FrequenciaDocente_CronogramaFechamento" %>

<%@ Register Src="controls/DeAte.ascx" TagName="DeAte" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Sos/css/Aba.css" rel="stylesheet" />
    <script src="js/jquery1.8.3.js"></script>
   
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
            text-align: left;
        }

        .auto-style12
        {
            height: 23px;
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
        .auto-style26
        {
            width: 137px;
            text-align: right;
            height: 31px;
        }
        .auto-style27
        {
            width: 137px;
            text-align: right;
        }
        .auto-style28
        {
            width: 141px;
            text-align: right;
        }
        .auto-style29
        {
            width: 141px;
            text-align: right;
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="conteudo">

            <table class="auto-style1">
                <tr>
                    <td style="text-align: center"><strong>CRONOGRAMA DE FECHAMENTO<br />
                        <br />
                        </strong>
                        <asp:Label ID="lblMsg" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
            </table>

            <br />
            <br />


            <table class="auto-style1">
                <tr>
                    <td valign="top" align="right" rowspan="4">
                        <div style="border: 2px solid black; width: 428px; height: auto;">
                        <table style="width: 428px">
                            <tr>
                                <td colspan="2" style="text-align: center; background-color: #95B3D7"><strong>Período Apotamento Instrutores
                                    <br />
                                    Atividades Acadêmicas e de Coordenação EAD</strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style17">De:</td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="txtDeDiaCoord" data-required="true" runat="server" validacao="dia" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtDeMesCoord" runat="server" data-required="true" validacao="mes" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                        /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtDeAnoCoord" data-required="true" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                        </span></strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style17">Até:</td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="txtAteDiaCoord" runat="server" data-required="true" validacao="dia" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtAteMesCoord" data-required="true" runat="server" validacao="mes" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                        /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtAteAnoCoord" data-required="true" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                        </span></strong></td>
                             
                            </tr>
                        </table>
                             </div>
                        <div style="border: 2px solid black; width: 430px; height: 91px;">
                            <table style="width: 430px"  align="right">
                                <tr>
                                    <td colspan="2" style="text-align: center; background-color: #95B3D7"><strong>Período Apotamento Instrutores - VT (docente)</strong></td>
                                </tr>
                                <tr>
                                    <td class="auto-style26">De:</td>
                                    <td class="auto-style11">
                                        <asp:TextBox ID="txtDeDia" data-required="true" CssClass="sonumero" validacao="dia" runat="server" MaxLength="2" Width="40px"></asp:TextBox>
                                        &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtDeMes" data-required="true" validacao="mes" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                            /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtDeAno" data-required="true" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                            </span></strong></td>
                                </tr>
                                <tr>
                                    <td class="auto-style27">Até:</td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="txtAteDia" runat="server" data-required="true" MaxLength="2" validacao="dia" Width="40px" CssClass="sonumero"></asp:TextBox>
                                        &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtAteMes" data-required="true" runat="server" validacao="mes" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                            /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtAteAno" data-required="true" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                            </span></strong></td>
                                </tr>
                            </table>
                            
                            </div>
                       
                           
                       
                        <div style="border: 2px solid black; width: 431px; height: 91px;">
                        <table style="width: 431px" align="right">
                            <tr>
                                <td colspan="2" style="text-align: center; background-color: #95B3D7"><strong>Período Aprovação Apotamento </strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style28">De:</td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="txtDeDiaApt" runat="server" validacao="dia" data-required="true" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtDeMesApt" runat="server" data-required="true" validacao="mes" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                        /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtDeAnoApt" data-required="true" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                        </span></strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style29">Até:</td>
                                <td class="auto-style11">
                                    <asp:TextBox ID="txtAteDiaApt" runat="server" validacao="dia" MaxLength="2" data-required="true" Width="40px" CssClass="sonumero"></asp:TextBox>
                                    &nbsp;<strong><span class="auto-style4">/<asp:TextBox ID="txtAteMesApt" runat="server"  data-required="true" validacao="mes" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                        /</span><span class="auto-style5">20</span><span class="auto-style4"><asp:TextBox ID="txtAteAnoApt" data-required="true" runat="server" MaxLength="2" Width="40px" CssClass="sonumero"></asp:TextBox>
                                        </span></strong></td>
                            </tr>
                        </table>
                             </div>
                       
                           
                       
                    </td>
                    <td valign="top" align="left">
                         <div style="border: 2px solid black; width: 430px; height: 224px;">
                        <table style="width: 430px">
                            <tr>
                                <td colspan="2" style="text-align: center; background-color: #95B3D7" class="auto-style12"><strong>Parâmetros</strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style21">Turno Manhã....................:</td>
                                <td class="auto-style23">
                                    <uc1:DeAte ID="turnomanha" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style24">Turno Tarde.......................:</td>
                                <td class="auto-style25">
                                    <uc1:DeAte ID="turnotarde" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style19">Turno Noite................ .......:</td>
                                <td class="auto-style22">
                                    <uc1:DeAte ID="turnonoite" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" valign="top"><span class="auto-style22">Jornada Mínima para VA (Horas)....................................:</span>&nbsp;<asp:TextBox  ID="txtValorVa" data-required="true" runat="server" Width="50px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style19" colspan="2">Valor Unitário Auxílio Alimentação.............................: R$
                                    <asp:TextBox CssClass="moeda" ID="txtValorAA" runat="server" data-required="true" Width="50px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style19" colspan="2">Valor de Corte para Requisição diária VT...................: R$
                                    <asp:TextBox CssClass="moeda" ID="txtValorVT" runat="server" data-required="true" Width="50px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                             </div>
                       
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                         &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btnSalvar" runat="server" Text="Salvar" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
