﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DeAte.ascx.vb" Inherits="FrequenciaDocente_controls_DeAte" %>
<style type="text/css">
    .auto-style1
    {
        width: 100%;
    }
</style>

<table class="auto-style1">
    <tr>
        <td>De:</td>
        <td valign="top">
            <asp:TextBox ID="txtDeHora" validacao="horas" runat="server" Width="30px" CssClass="sonumero" MaxLength="2" ReadOnly="True"></asp:TextBox>
            :<asp:TextBox ID="txtDeMinuto" validacao="minutos" runat="server" Width="30px" CssClass="sonumero" MaxLength="2" ReadOnly="True"></asp:TextBox>
            </td>
        <td>Até:</td>
        <td valign="top">
            <asp:TextBox ID="txtAteHora" validacao="horas" runat="server" Width="30px" CssClass="sonumero" MaxLength="2" ReadOnly="True"></asp:TextBox>
            :<asp:TextBox ID="txtAteMinuto" validacao="minutos" runat="server" Width="30px" CssClass="sonumero" MaxLength="2" ReadOnly="True"></asp:TextBox>
            </td>
    </tr>
</table>

