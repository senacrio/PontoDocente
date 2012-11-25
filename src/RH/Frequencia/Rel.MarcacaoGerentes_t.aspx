<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Rel.MarcacaoGerentes_t.aspx.vb" Inherits="Ponto_Relatorios_Relatorio" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register namespace="AspNetMaskedEdit" tagprefix="AspNetMaskedEdit" %>

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
            text-align: left;
        }
        .style3
        {
            width: 249px;
            text-align: right;
        }
        .style4
        {
            width: 76px;
            height: 24px;
        }
        .style5
        {
            width: 313px;
            height: 24px;
        }
        .style6
        {
            height: 24px;
            color: #FF0000;
            font-size: small;
            text-align: left;
        }
        .style7
        {
            text-align: left;
        }
        .style9
        {
            font-size: 14pt;
            font-weight: bold;
            text-align: left;
        }
        .style12
        {
            height: 24px;
            color: #FF0000;
            font-size: x-small;
            width: 368px;
        }
        .style14
        {
            height: 24px;
            color: #FF0000;
            font-size: small;
            text-align: left;
            width: 317px;
        }
        .style16
        {
            height: 24px;
            color: #FF0000;
            font-size: small;
            text-align: left;
            width: 375px;
        }
        .style17
        {
            height: 24px;
            color: #FF0000;
            font-size: small;
        }
        .style18
        {
            text-align: center;
            font-weight: bold;
            font-size: medium;
        }
        .style19
        {
            font-size: x-small;
        }
        .style20
        {
            color: #FF0000;
            font-size: x-small;
        }
        .style24
        {
            width: 368px;
            font-size: x-small;
        }
        p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        .newStyle1
        {
        }
        .style28
        {
            text-align: left;
            width: 132px;
        }
        .style29
        {
            width: 132px;
            height: 24px;
        }
        .style30
        {
            width: 249px;
        }
        .style31
        {
            width: 249px;
            height: 24px;
        }
        .style32
        {
            width: 313px;
        }
        .style39
        {
            width: 375px;
        }
        .style40
        {
            width: 317px;
        }
        .style41
        {
            width: 102%;
            height: 171px;
        }
        .style42
        {
            width: 250px;
        }
        .style43
        {
            width: 250px;
            height: 24px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel2" runat="server" Visible="False" Width="1128px" 
            Height="819px">
            &nbsp;<table class="style1">
                <tr>
                    <td class="style2" colspan="2">
                        <div class="style7">
                            <span class="style9">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EXTRATO OI 
                            CELULAR (ELEGÍVEIS)</span></div>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <asp:Panel ID="Panel4" runat="server" Visible="true" GroupingText="Filtro" 
                Width="1034px">
            
            <table class="style1">
                <tr>
                    <td class="style2">
                        Data inicial:</td>
                    <td class="style30">
                        <span style="color:red"><span class="style20">
                        <asp:TextBox ID="txtDtInicial0" runat="server" AutoCompleteType="Disabled" 
                            ToolTip="Fomato MM/AAAA"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtInicial0_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtInicial0">
                        </ajaxToolkit:MaskedEditExtender>
                        MM/AAAA</span></span></td>
                    <td class="style39" style="color: #FF0000; font-size: x-small">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtDtInicial0" 
                            ErrorMessage="Por favor, digite a data inicial." style="font-size: x-small"></asp:RequiredFieldValidator>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td rowspan="2" style="color: #FF0000; font-size: x-small">
                        O mês de referencia para os relatórios é o mês de<br />
                        vencimento cujas ligações foram realizadas no mês anterior.<br />
                        Ex:<br />
                        04/2009 -&gt; mês vencimento do pagamento<br />
                        
                        
                         03/2009 -&gt;mês das ligações realizadas
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Data final:</td>
                    <td class="style31">
                        <asp:TextBox ID="txtDtFinal0" runat="server" ToolTip="Fomato MM/AAAA"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtFinal0_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtFinal0">
                        </ajaxToolkit:MaskedEditExtender>
                        <span style="color:red"><span class="style20">MM/AAAA</span></span></td>
                    <td class="style39" style="color: #FF0000; font-size: x-small">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtDtFinal0" ErrorMessage="Por favor, digite a data final." 
                            style="font-size: x-small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Matrícula:</td>
                    <td class="style31">
                        <asp:TextBox ID="txtLinha0" runat="server"></asp:TextBox>
                    </td>
                    <td class="style16">
                        <asp:Button ID="Button1" runat="server" Text="Consultar" />
                        &nbsp;</td>
                    <td class="style17">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:SqlDataSource ID="dsLotacao0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                            SelectCommand="SELECT lotac_nomes.des_unid_lotac, lotac_filho.cod_filho FROM STG_RHUnidadeLotacao AS lotac_nomes INNER JOIN (SELECT @lotac AS cod_pai, @lotac AS cod_filho UNION SELECT DISTINCT b.cod_unid_lotac_pai, b.cod_unid_lotac_filho FROM STG_RHUnidadeLotacao AS a INNER JOIN ViewSTG_RHEstrutPlanoLotac AS b ON a.cod_unid_lotac = b.cod_unid_lotac_pai WHERE (b.cdn_plano_lotac = 2) AND (b.cod_unid_lotac_pai = @lotac)) AS lotac_filho ON lotac_nomes.cod_unid_lotac = lotac_filho.cod_filho">
                            <SelectParameters>
                                <asp:SessionParameter Name="lotac" SessionField="c_lotac" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style39">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            </asp:Panel>
            
            
            <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="585px" ProcessingMode="Remote" Width="1034px" 
            Visible="False" ShowParameterPrompts="False" ShowBackButton="True">
                <ServerReport ReportPath="/Report_SisPonto/TelefoniaCelular_Func" 
                ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
        </asp:Panel>
        <br/>
        <asp:Panel ID="Panel1" runat="server" Visible="False" Width="1208px">
            <div class="style18">
                <span class="style9">EXTRATO OI CELULAR (ELEGÍVEIS)</span></div>
                               
                <asp:Panel ID="Panel5" runat="server" Visible="False" Width="1189px" 
                GroupingText="Filtro">
                <table class="style1">
                <tr>
                    <td class="style28">
                        &nbsp;</td>
                    <td class="style42">
                        &nbsp;</td>
                    <td class="style40">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style28">
                        Unidade:</td>
                    <td class="style42">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsLotacao" 
                            DataTextField="des_unid_lotac" DataValueField="cod_filho">
                        </asp:DropDownList>
                    </td>
                    <td class="style40">
                        <span><span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span></span></td>
                    <td class="style2" rowspan="3">
                        <span><span class="newStyle1"><span style="color:red"><span class="style19">O 
                        mês de referencia para os relatórios é o mês de
                        <br />
                        vencimento cujas ligações foram realizadas no mês anterior.<br />
                        <span class="style20">Ex:</span><br />
                        04/2009 -&gt; mês vencimento do pagamento</span><br />
                        <span style="font-family: &quot;Calibri&quot;,&quot;sans-serif&quot;; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-bidi-font-family: &quot;Times New Roman&quot;; color: red; mso-ansi-language: PT-BR; mso-fareast-language: PT-BR; mso-bidi-language: AR-SA">
                        <span class="style19">03/2009 -&gt; mês das ligações realizadas</span></span></span></span></span></td>
                </tr>
                <tr>
                    <td class="style28">
                        Data inicial:</td>
                    <td class="style42">
                        <asp:TextBox ID="txtDtInicial" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtInicial_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtInicial">
                        </ajaxToolkit:MaskedEditExtender>
                        <span style="color:red"><span class="style20">MM/AAAA&nbsp;</span></span></td>
                    <td class="style40">
                        <asp:RequiredFieldValidator ID="valNumero2" runat="server" 
                            ControlToValidate="txtDtInicial" 
                            ErrorMessage="Por favor, digite a data inicial." style="font-size: x-small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style29">
                        Data final:</td>
                    <td class="style43">
                        <asp:TextBox ID="txtDtFinal" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtFinal_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtFinal">
                        </ajaxToolkit:MaskedEditExtender>
                        <span class="style20">MM/AAAA</span></td>
                    <td class="style40">
                        <asp:RequiredFieldValidator ID="valNumero3" runat="server" 
                            ControlToValidate="txtDtFinal" ErrorMessage="Por favor, digite a data final." 
                            style="font-size: x-small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style29">
                        <asp:SqlDataSource ID="dsLotacao" runat="server" 
                            CacheExpirationPolicy="Sliding" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                            SelectCommand="SELECT lotac_nomes.des_unid_lotac, lotac_filho.cod_filho FROM STG_RHUnidadeLotacao AS lotac_nomes INNER JOIN (SELECT @lotac AS cod_pai, @lotac AS cod_filho UNION SELECT DISTINCT b.cod_unid_lotac_pai, b.cod_unid_lotac_filho FROM STG_RHUnidadeLotacao AS a INNER JOIN ViewSTG_RHEstrutPlanoLotac AS b ON a.cod_unid_lotac = b.cod_unid_lotac_pai WHERE (b.cdn_plano_lotac = 2) AND (b.cod_unid_lotac_pai = @lotac)) AS lotac_filho ON lotac_nomes.cod_unid_lotac = lotac_filho.cod_filho">
                            <SelectParameters>
                                <asp:SessionParameter Name="lotac" SessionField="c_lotac" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="style43">
                        <asp:ScriptManager ID="ScriptManager3" runat="server" 
                            EnableScriptGlobalization="True">
                        </asp:ScriptManager>
                    </td>
                    <td class="style14">
                        <asp:Button ID="btnConsulta" runat="server" Text="Consultar" />
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
            </table>
                </asp:Panel>
            
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="585px" ProcessingMode="Remote" Width="1068px" 
            Visible="False" ShowParameterPrompts="False">
                <ServerReport ReportPath="/Report_SisPonto/TelefoniaCelular" 
                ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
        </asp:Panel>
    
    </div>
        <asp:Panel ID="Panel3" runat="server" Visible="False" Width="1201px">
            <div class="style7">
                <span class="style9">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXTRATO 
                OI CELULAR (ELEGÍVEIS)</span></div>
        <asp:Panel ID="Panel6" runat="server" Visible="False" Width="1201px"> 
                <table class="style41">
                <tr>
                    <td class="style2">
                        Data inicial:</td>
                    <td class="style32">
                        <asp:TextBox ID="txtDtInicial1" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtInicial1_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtInicial1">
                        </ajaxToolkit:MaskedEditExtender>
                        <span class="style20">MM/AAAA</span></td>
                    <td class="style24">
                        <asp:RequiredFieldValidator ID="valNumero4" runat="server" 
                            ControlToValidate="txtDtInicial1" 
                            ErrorMessage="Por favor, digite a data inicial." style="font-size: x-small"></asp:RequiredFieldValidator>
                    </td>
                    <td rowspan="2">
                        <span><span class="newStyle1"><span style="color:red"><span class="style19">
                        <span lang="pt-br">O </span>mês de referencia para os relatórios é o mês de
                        <br />
                        vencimento cujas ligações foram realizadas no mês anterior.<br />
                        <span class="style20">Ex:</span><br />
                        04/2009 -&gt; mês vencimento do pagamento</span><br />
                        <span style="font-family: &quot;Calibri&quot;,&quot;sans-serif&quot;; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-bidi-font-family: &quot;Times New Roman&quot;; color: red; mso-ansi-language: PT-BR; mso-fareast-language: PT-BR; mso-bidi-language: AR-SA">
                        <span class="style19">03/2009 -&gt; mês das ligações realizadas</span></span></span></span></span></td>
                </tr>
                <tr>
                    <td class="style4">
                        Data final:</td>
                    <td class="style5">
                        <asp:TextBox ID="txtDtFinal1" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtDtFinal1_MaskedEditExtender" 
                            runat="server" Mask="99/9999" TargetControlID="txtDtFinal1">
                        </ajaxToolkit:MaskedEditExtender>
                        <span class="style20">MM/AAAA</span></td>
                    <td class="style24">
                        <asp:RequiredFieldValidator ID="valNumero5" runat="server" 
                            ControlToValidate="txtDtFinal1" 
                            ErrorMessage="Por favor, digite a data final." 
                            style="font-size: x-small; text-align: left;"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Telefone: </td>
                    <td class="style5">
                        <asp:TextBox ID="txtLinha" runat="server"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="txtLinha_MaskedEditExtender" 
                            runat="server" Mask="99 9999 9999" TargetControlID="txtLinha">
                        </ajaxToolkit:MaskedEditExtender>
                        <span class="style20">Campo não obrigatório</span></td>
                    <td class="style24">
                        &nbsp;</td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style5">
                        <asp:Button ID="btnConsulta_ger" runat="server" Text="Consultar" />
                    </td>
                    <td class="style12">
                        &nbsp;</td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
            </table>
        
        </asp:Panel>        
                    <rsweb:ReportViewer ID="ReportViewer3" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="585px" ProcessingMode="Remote" Width="1025px" 
            Visible="False" ShowParameterPrompts="False">
                <ServerReport ReportPath="/Report_SisPonto/TelefoniaCelular_func_geren" 
                ReportServerUrl="http://banco01/reportserver" />
            </rsweb:ReportViewer>
        </asp:Panel>
    
    </form>
</body>
</html>
