<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Rel.MarcacaoGerentes.aspx.vb" Inherits="Ponto_Relatorios_Relatorio" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 76px;
        }
        .style3
        {
            width: 131px;
            text-align: right;
        }
        .style4
        {
            width: 76px;
            height: 24px;
        }
        .style5
        {
            width: 131px;
            height: 24px;
        }
        .style6
        {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ScriptManager>
        <asp:SqlDataSource ID="dsLotacao" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            
            SelectCommand="select cod_unid_lotac,des_unid_lotac from dbo.STG_RHUnidadeLotacao a
inner join
(select cod_unid_lotac_filho from 
(SELECT cod_unid_lotac  FROM dbo.SGT_RHFuncionarioAtivo where cdn_funcionario = @matricula
union
select lotacao from ptnInterino where matricula=@matricula) g
inner join dbo.ViewSTG_RHEstrutPlanoLotac h
on g.cod_unid_lotac=h.cod_unid_lotac_pai
union
SELECT cod_unid_lotac  FROM dbo.SGT_RHFuncionarioAtivo where cdn_funcionario = @matricula
union
select lotacao from ptnInterino where matricula=@matricula) b
on cast(a.cod_unid_lotac as varchar) =cast( b.cod_unid_lotac_filho as varchar)  ">
            <SelectParameters>
                <asp:SessionParameter Name="matricula" SessionField="c_Matricula" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table class="style1">
            <tr>
                <td class="style2">
                    Unidade:</td>
                <td class="styleabc">
      <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsLotacao" 
            DataTextField="des_unid_lotac" DataValueField="cod_unid_lotac">
        </asp:DropDownList>
                </td>
                <td>
                    &nbsp;&nbsp;
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Data inicial:</td>
                <td class="styleabc">
                    <asp:TextBox ID="txtDtInicial" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtDtInicial_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="txtDtInicial" Format="dd/MM/yyyy">
                    </ajaxToolkit:CalendarExtender>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    Data final:</td>
                <td class="style5">
                    <asp:TextBox ID="txtDtFinal" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtDtFinal_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="txtDtFinal" Format="dd/MM/yyyy">
                    </ajaxToolkit:CalendarExtender>
                </td>
                <td class="style6">
        <asp:Button ID="btnConsulta" runat="server" Text="Consultar" />
    
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="585px" ProcessingMode="Remote" Width="1054px" 
            Visible="False">
            <ServerReport ReportPath="/Report_SisPonto/MarcacaoGerente3" 
                ReportServerUrl="http://banco01/reportserver" />
        </rsweb:ReportViewer>
    
    </div>
    </form>
</body>
</html>
