<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Balancete.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            left: 0px;
            width: 536px;
            position: relative;
            text-align:right;
            top: 0px;
        }
        .style3
        {
            width: 114px;
            position: relative;
            top: 1px;
            _text-align:left;         
            text-align:left;
            height: 19px;
          }
        .style4
        {
            left: -4px;
            width: 114px;
            position: relative;
            top: -5px;
            _text-align:right;         
            text-align:right;
            height: 21px;
        }
        .style5
        {
            left: 0px;
            width: 536px;
            position: relative;
            top: 0px;
            height: 165px;
        }
        .style10
        {
          
        }
        .style12
        {
            width: 239px;
            height: 33px;
        }
        .style13
        {
            width: 165px;
            height: 33px;
        }
        .style14
        {
            height: 33px;
        }
        .style18
        {
            width: 285px;
        }
        .style19
        {
            width: 264px;
        }
        .style24
        {
            width: 201px;
            height: 5px;
        }
        .style25
        {
            height: 5px;
        }
        .style26
        {
            height: 21px;
            width: 152px;
        }
        .style27
        {
            width: 152px;
        }
        .style28
        {
            height: 12px;
        }
        .style29
        {
            height: 22px;
        }
        .style30
        {
            width: 170px;
            position: relative;
            top: 1px;
            _text-align: left;
            text-align: left;
            height: 21px;
        }
        .style31
        {
            height: 21px;
            width: 170px;
        }
        </style>

 </head>
<body alink="21px">
    <form id="form1" runat="server">
    <div>
    <table id="FormView1"
style="BORDER-RIGHT: black 2px solid; BORDER-TOP: black 2px solid; font-size: smaller; BORDER-LEFT: black 2px solid; width: 520px; BORDER-BOTTOM: black 2px solid; position: relative; BORDER-COLLAPSE: collapse; " 
cellspacing="0" border="0" >
  <tbody>
  <tr>
    <td>
        <asp:Panel ID="Panel1" runat="server">
            <br />
            <table id="FormView2" border="0" cellspacing="0" 
                style="BORDER-RIGHT: black 2px solid; BORDER-TOP: black 2px solid; font-size: smaller; BORDER-LEFT: black 2px solid; width: 520px; BORDER-BOTTOM: black 2px solid; position: relative; BORDER-COLLAPSE: collapse; ">
                <tr>
                    <td class="style10" height="21px">
                        Regional:&nbsp;<asp:DropDownList ID="DDLRegional" runat="server" 
                            Enabled="False">
                            <asp:ListItem Value="15">Rio de Janeiro</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp; Mês:&nbsp;<asp:DropDownList ID="DDL_Mes" runat="server" 
                            AutoPostBack="True" Enabled="False">
                            <asp:ListItem Value="01">Janeiro</asp:ListItem>
                            <asp:ListItem Value="02">Fevereiro</asp:ListItem>
                            <asp:ListItem Value="03">Março</asp:ListItem>
                            <asp:ListItem Value="04">Abril</asp:ListItem>
                            <asp:ListItem Value="05">Maio</asp:ListItem>
                            <asp:ListItem Value="06">Junho</asp:ListItem>
                            <asp:ListItem Value="07">Julho</asp:ListItem>
                            <asp:ListItem Value="08">Agosto</asp:ListItem>
                            <asp:ListItem Value="09">Setembro</asp:ListItem>
                            <asp:ListItem Value="10">Outubro</asp:ListItem>
                            <asp:ListItem Value="11">Novembro</asp:ListItem>
                            <asp:ListItem Value="12">Dezembro</asp:ListItem>
                            <asp:ListItem Value="13">13o. Salário</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp; Ano:
                        <asp:DropDownList ID="DDL_Ano" runat="server" AutoPostBack="True" 
                            Enabled="False">
                            <asp:ListItem>2008</asp:ListItem>
                            <asp:ListItem Selected="true">2009</asp:ListItem>
                            <asp:ListItem>2010</asp:ListItem>
                            <asp:ListItem>2011</asp:ListItem>
                            <asp:ListItem>2012</asp:ListItem>
                            <asp:ListItem>2013</asp:ListItem>
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                        <br />
                        <asp:SqlDataSource ID="DSDatas" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                            SelectCommand="Le_Data_Ini_Fechto" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDL_Ano" Name="ano" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DDL_Mes" Name="mes" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="Label0" runat="server" 
                            DataTextField="Data_Ano_Inicio" DataValueField="Data_Ano_Inicio" 
                            Enabled="False" Width="95px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Label1" runat="server" 
                            DataTextField="Data_Inicio" DataValueField="Data_Inicio" Enabled="False" 
                            Width="95px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Label2" runat="server" 
                            DataTextField="Data_Termino" DataValueField="Data_Termino" Enabled="False" 
                            Width="95px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Label3" runat="server" 
                            DataTextField="Data_inicio_mes_anterior" 
                            DataValueField="Data_inicio_mes_anterior" Enabled="False" Width="95px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Label4" runat="server" 
                            DataTextField="Data_Mes_Anterior" DataValueField="Data_Mes_Anterior" 
                            Enabled="False" Width="95px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <table cellspacing="5" style="width: 528px">
                            <tbody>
                                <tr>
                                    <td style="width: 102px; TEXT-ALIGN: right">
                                        <span style="FONT-WEIGHT: bold; font-size: small; VERTICAL-ALIGN: text-top; COLOR: red; FONT-FAMILY: Arial; TEXT-ALIGN: right; TEXT-DECORATION: underline">
                                            Atenção</span>
                                    </td>
                                    <td style="font-size: x-small; width: 476px; COLOR: red; FONT-FAMILY: Arial">
                                        Esse formulário destina-se a consultar o conteúdo completo do Balancete.</td>
                                </tr>
                            </tbody>
                        </table>
                        &nbsp;
                        
                        <span id="FormView1_Label1" 
                            style="FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            Disponibilidades Efetivas</span>&nbsp;<br />
                        &nbsp;<table cellspacing="1" 
                            style="LEFT: 0px; width: 536px; position: relative; TOP: 0px">
                            <tbody>
                                <tr>
                                    <td class="style10">
                                        Caixa:</td>
                                    <td class="style25" align="left">
                                        <asp:DropDownList ID="DDLCaixa" runat="server" CssClass="style4" 
                                            DataSourceid="DsCaixa" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" EnableTheming="True" 
                                            height="21px" width="155px" BackColor="#FFFFCC">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DsCaixa" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_Conexao %>" 
                                            SelectCommand="LeSaldoBalancete" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="11111%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" DefaultValue=' ' Name="dttermino" 
                                                    PropertyName="Text" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style25" align="left">
                                        <asp:SqlDataSource ID="Ds_Zero" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_BB" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="9999" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 201px; height: 17px">
                                        &nbsp;</td>
                                    <td style="height: 17px" align="left">
                                        &nbsp;</td>
                                    <td style="height: 17px" align="left">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 201px; height: 17px">
                                        &nbsp;</td>
                                    <td class="style10" style="height: 17px" align="left">
                                        Banco c/ Movimento</td>
                                    <td class="style10" style="height: 17px" align="left">
                                        Banco c/ Poupança</td>
                                </tr>
                                <tr>
                                    <td class="style10" style="width: 201px; height: 21px">
                                        Banco do Brasil</td>
                                    <td align="left" >
                                        <asp:DropDownList ID="DDLBancoMovtoBB" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Bco_Movto_BB" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Bco_Movto_BB" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteFiltro" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="11112%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                                <asp:Parameter DefaultValue="%Brasil%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td style="width: 201px; height: 21px" align="left">
                                        <asp:DropDownList ID="DDLBancoPoupBB" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Bco_Poup_BB" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Bco_Poup_BB" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteFiltro" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="11113%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                                <asp:Parameter DefaultValue="%Brasil%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10" style="width: 201px">
                                        Caixa Econômica Federal</td>
                                    <td align="left">
                                        <asp:DropDownList ID="DDLBancoMovtoCEF" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Bco_Movto_CEF" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Bco_Movto_CEF" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteFiltro" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="11112%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                                <asp:Parameter DefaultValue="%CEF%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="DDLBancoPoupCEF" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Bco_Poup_CEF" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Bco_Poup_CEF" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteFiltro" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="11113%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                                <asp:Parameter DefaultValue="%CEF%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                        <span id="FormView1_Label15" style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="DDLBancoMovtoTotal" runat="server" BackColor="#FFFFCC" 
                                            CssClass="style4" DataSourceid="DS_Bco_Movto_Total" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Bco_Movto_Total" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteFiltro" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="11112%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                                <asp:Parameter DefaultValue="%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="DDLBancoPoupTotal" runat="server" BackColor="#FFFFCC" 
                                            CssClass="style4" DataSourceid="DS_Bco_Poup_Total" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Bco_Poup_Total" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteFiltro" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="11113%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                                <asp:Parameter DefaultValue="%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="style10"                                        
                                        style="FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px;" 
                                        align="left">
                                        Aplicações Financeiras:</td>
                                    <td align="left">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" 
                                        
                                        style="FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px;" 
                                        align="left">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                        Banco do Brasil<br />
                        <asp:GridView ID="GridAplicacoesBB" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" CellPadding="4" 
                            DataSourceID="SDSAplicacoesBB" Font-Names="Arial" Font-Size="Small" 
                            GridLines="None" Width="540px" ForeColor="#333333">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="cod_cta_corren" DataFormatString="{0:c}" 
                                    HeaderText="Conta Corrente" ReadOnly="True" />
                                <asp:BoundField DataField="ValorInicial" HeaderText="Valor Inicial" 
                                    ReadOnly="True" />
                                <asp:BoundField DataField="ValorDebito" HeaderText="Valor Débito" 
                                    ReadOnly="True" />
                                <asp:BoundField DataField="ValorCredito" HeaderText="Valor Crédito" 
                                    ReadOnly="True" />
                                <asp:BoundField DataField="ValorFinal" HeaderText="Valor Final" 
                                    ReadOnly="True" />
                                <asp:BoundField DataField="Percentual" HeaderText="Percentual" />
                                <asp:CommandField HeaderText="Alterar %" ShowEditButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SDSAplicacoesBB" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                            SelectCommand="Detalha_Aplicacoes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDL_Ano" Name="cod_exerc_ctbl" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DDL_Mes" Name="num_period_ctbl" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:Parameter DefaultValue="%BB%" Name="filtro" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                        <br />
&nbsp;<table cellpadding="1" cellspacing="1" class="style1">
                            <tbody>
                                <tr>
                                    <td style="height: 21px" class="style3" height="21px">
                                        Descrição<br />
                                        <br />
                                    </td>
                                    <td class="style30" height="21px">
                                        Valor<br />
                                        <br />
                                    </td>
                                    <td class="style3" height="21px" style="height: 21px">
                                        Percentual<br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 21px">
                                        <asp:TextBox ID="txtDescricaoBB1" runat="server" CssClass="style3" Height="21px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8">TOTAL APLICAÇÕES CORP BB</asp:TextBox>
                                    </td>
                                    <td class="style31">
                                        <asp:SqlDataSource ID="DS_Aplic_Swap_BB" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_BB" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="%BB%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLAplicSwapBB" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Aplic_Swap_BB" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 21px">
                                        <asp:TextBox ID="txtPercentBB1" runat="server" CssClass="style4" Height="21px" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="120px" Wrap="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 21px">
                                        <asp:TextBox ID="txtDescricaoBB2" runat="server" CssClass="style3" Height="21px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style31">
                                        <asp:SqlDataSource ID="DS_Aplic_Swap_BB0" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_BB" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="%BB 999%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLAplicSwapBB0" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Aplic_Swap_BB0" DataTextField="ValorFinal" 
                                            Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 21px">
                                        <asp:TextBox ID="txtPercentBB2" runat="server" CssClass="style4" Height="21px" ToolTip="Entre com o Percentual de rendimentos" 
                                            Width="120px" Wrap="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 21px">
                                        <asp:TextBox ID="txtDescricaoBB3" runat="server" CssClass="style3" Height="21px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style31">
                                        <asp:SqlDataSource ID="DS_Aplic_Swap_BB1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_BB" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="%BB9999%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLAplicSwapBB1" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Aplic_Swap_BB1" DataTextField="ValorFinal" 
                                            Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 21px">
                                        <asp:TextBox ID="txtPercentBB3" runat="server" CssClass="style4" Height="21px" ToolTip="Entre com o Percentual de rendimentos" 
                                            Width="120px" Wrap="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 21px">
                                        <asp:TextBox ID="txtDescricaoBB4" runat="server" CssClass="style3" Height="21px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style31">
                                        <asp:SqlDataSource ID="DS_Aplic_Swap_BB2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_BB" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="%BB9999%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLAplicSwapBB2" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Aplic_Swap_BB2" DataTextField="ValorFinal" 
                                            Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 21px" >
                                        <asp:TextBox ID="txtPercentBB4" runat="server" CssClass="style4" Height="21px" ToolTip="Entre com o Percentual de rendimentos" 
                                            Width="120px" Wrap="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 21px">
                                        <asp:TextBox ID="txtDescricaoBB5" runat="server" BackColor="#D8D8D8" 
                                            CssClass="style3" Height="21px" ReadOnly="True" Width="200px" Wrap="False"></asp:TextBox>
                                    </td>
                                    <td class="style31">
                                        <asp:SqlDataSource ID="DS_Aplic_Swap_BB3" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_BB" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="%BB9999%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLAplicSwapBB3" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Aplic_Swap_BB3" DataTextField="ValorFinal" 
                                            Enabled="False" height="21px" 
                                            width="155px" DataValueField="ValorFinal">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 21px">
                                        <asp:TextBox ID="txtPercentBB5" runat="server" CssClass="style4" Height="21px" ToolTip="Entre com o Percentual de rendimentos" 
                                            Width="120px" Wrap="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 21px">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <span id="FormView1_Label16" style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style31">
                                        <asp:SqlDataSource ID="DS_Aplic_Total_BB" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 + @valor3 + @Valor4 + @Valor5 AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLAplicSwapBB" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLAplicSwapBB0" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAplicSwapBB1" Name="valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAplicSwapBB2" Name="Valor4" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAplicSwapBB3" Name="Valor5" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLAplicSwapBB4" runat="server" BackColor="#FFFFCC" 
                                            CssClass="style4" DataSourceid="DS_Aplic_Total_BB" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 21px">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        Caixa Econômica Federal<br />
                        <br />
                        <asp:GridView ID="GridAplicacoesCEF" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" CellPadding="4" 
                            DataSourceID="SDSAplicacoesCEF" GridLines="None" Width="540px" 
                            Font-Names="Arial" Font-Size="Small" ForeColor="#333333">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="cod_cta_corren" DataFormatString="{0:c}" 
                                    HeaderText="Conta Corrente" ReadOnly="True" />
                                <asp:BoundField DataField="ValorInicial" 
                                    HeaderText="Valor Inicial" ReadOnly="True" />
                                <asp:BoundField DataField="ValorDebito" 
                                    HeaderText="Valor Débito" ReadOnly="True" />
                                <asp:BoundField DataField="ValorCredito" 
                                    HeaderText="Valor Crédito" ReadOnly="True" />
                                <asp:BoundField DataField="ValorFinal" 
                                    HeaderText="Valor Final" ReadOnly="True" />
                                <asp:BoundField DataField="Percentual" HeaderText="Percentual" />
                                <asp:CommandField HeaderText="Alterar %" ShowEditButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SDSAplicacoesCEF" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                            SelectCommand="Detalha_Aplicacoes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDL_Ano" Name="cod_exerc_ctbl" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DDL_Mes" Name="num_period_ctbl" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:Parameter DefaultValue="%CEF%" Name="filtro" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
&nbsp;<table cellpadding="1" cellspacing="1" 
                            style="position: relative; height: 21px;">
                            <tbody>
                                <tr>
                                    <td class="style3" style="width: 210px; height: 17px" height="21px">
                                        Descrição<br />
                                        <br />
                                    </td>
                                    <td class="style3" style="width: 210px; height: 17px" height="21px">
                                        Valor<br />
                                        <br />
                                    </td>
                                    <td class="style3" height="21px">
                                        Percentual<br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="21px">
                                        <asp:TextBox ID="txtDescricaoCEF1" runat="server" CssClass="style3" Height="19px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8">TOTAL APLICAÇÕES CORP CEF</asp:TextBox>
                                    </td>
                                    <td height="21px">
                                        <asp:DropDownList ID="DDLAplicCEF1" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Aplic_Swap_CEF2" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Aplic_Swap_CEF2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_CEF" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="CEF%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td height="21px">
                                        <asp:TextBox ID="txtPercentCEF1" runat="server" CssClass="style4" Height="21px" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="120px" Wrap="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="21px">
                                        <asp:TextBox ID="txtDescricaoCEF2" runat="server" BackColor="#D8D8D8" 
                                            CssClass="style3" Height="19px" ReadOnly="True" Width="200px" Wrap="False"></asp:TextBox>
                                    </td>
                                    <td height="21px">
                                        <asp:DropDownList ID="DDLAplicCEF2" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Aplic_Swap_CEF" DataTextField="ValorFinal" 
                                            Enabled="False" height="21px" 
                                            width="155px" DataValueField="ValorFinal">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Aplic_Swap_CEF" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_CEF" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="XXCEF%" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td height="21px">
                                        <asp:TextBox ID="txtPercentCEF2" runat="server" CssClass="style4" Height="21px" ToolTip="Entre com o Percentual de rendimentos" 
                                            Width="120px" Wrap="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="21px">
                                        <asp:TextBox ID="txtDescricaoCEF3" runat="server" CssClass="style3" Height="19px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td height="21px">
                                        <asp:DropDownList ID="DDLAplicCEF3" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Aplic_Swap_CEF0" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Aplic_Swap_CEF0" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_CEF" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="XXCEF 999" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td height="21px">
                                        <asp:TextBox ID="txtPercentCEF3" runat="server" CssClass="style4" Height="21px" ToolTip="Entre com o Percentual de rendimentos" 
                                            Width="120px" Wrap="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="21px">
                                        <asp:TextBox ID="txtDescricaoCEF4" runat="server" CssClass="style3" Height="19px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td height="21px">
                                        <asp:DropDownList ID="DDLAplicCEF4" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Aplic_Swap_CEF1" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Aplic_Swap_CEF1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Total_Aplicacoes_CEF" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="XXCEF 9999" Name="filtro" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td height="21px">
                                        <asp:TextBox ID="txtPercentCEF4" runat="server" CssClass="style4" Height="21px" ToolTip="Entre com o Percentual de rendimentos" 
                                            Width="120px" Wrap="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="21px">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <span id="FormView1_Label17" style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td height="21px">
                                        <asp:DropDownList ID="DDLAplicTotalCEF" runat="server" BackColor="#FFFFCC" 
                                            CssClass="style4" DataSourceid="DS_Aplic_Total_CEF" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Aplic_Total_CEF" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 + @valor3 + @Valor4 AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLAplicCEF1" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLAplicCEF2" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAplicCEF3" Name="valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAplicCEF4" Name="Valor4" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td height="21px">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label2" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            Disponibilidades Vinculadas<br />
                        </span>&nbsp;<table cellspacing="1"  
                            style="LEFT: 0px; width: 536px; position: relative; TOP: 0px">
                            <tbody>
                                <tr>
                                    <td class="style10">
                                    </td>
                                    <td style="height: 17px" class="style10">
                                        Banco c/ Movimento<br />
                                    </td>
                                    <td style="width: 165px; height: 17px" class="style10">
                                        Banco c/ Poupança<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Banco do Brasil</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLDispBancoMovtoBB" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Disp_Bco_Movto_BB" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Disp_Bco_Movto_BB" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Lista_DispVinculadas_BB" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td style="width: 165px" class="style10">
                                        <asp:DropDownList ID="DDLDispBancoPoupBB" runat="server" DataSourceid="DS_Zero" 
                                            DataTextField="ValorFinal" Enabled="False" height="21px" width="155px" 
                                            CssClass="style4">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Caixa Econômica Federal</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLDispBancoMovtoCEF" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Disp_Bco_Movto_CEF" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Disp_Bco_Movto_CEF" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="Lista_DispVinculadas_CEF" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" Name="cod_exerc_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td style="width: 165px" class="style10">
                                        <asp:DropDownList ID="DDLDispBancoPoupCEF" runat="server" 
                                            DataSourceid="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px" CssClass="style4">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                        <span id="FormView1_Label18" style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLDispBancoMovtoTotal" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_Disp_Bco_Movto_Total" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Disp_Bco_Movto_Total" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLDispBancoMovtoBB" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLDispBancoMovtoCEF" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td style="width: 165px" class="style10">
                                        <asp:DropDownList ID="DDLDispBancoPoupTotal" runat="server" BackColor="#FFFFCC" 
                                            DataSourceid="DS_Zero" DataTextField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px" CssClass="style4">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" style="background-color: #CCCCCC;">
                                        <span id="FormView1_Label33" 
                                            style=" FONT-WEIGHT: bold; font-size: small; width: 520px; ">Aplicações 
                                            Financeiras</span>
                                    </td>
                                    <td class="style14">
                                        <br />
                                        <br />
                                    </td>
                                    <td class="style13">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        &nbsp;Banco do Brasil
                        <table cellpadding="1" cellspacing="1" class="style5">
                            <tbody class="style10">
                                <tr>
                                    <td class="style28" height="21px">
                                        Descrição<br />
                                    </td>
                                    <td class="style28" height="21px">
                                        Valor<br />
                                    </td>
                                    <td class="style28" height="21px">
                                        Percentual<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:TextBox ID="txtAplicacaoBB1" runat="server" CssClass="style3" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style29">
                                        <asp:DropDownList ID="DDLAplicVinculadaBB1" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style29">
                                        <asp:TextBox ID="txtAplicacaoVincBB1" runat="server" CssClass="style4" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="100px" Wrap="False" 
                                            Enabled="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:TextBox ID="txtAplicacaoBB2" runat="server" CssClass="style3" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style29">
                                        <asp:DropDownList ID="DDLAplicVinculadaBB2" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style29">
                                        <asp:TextBox ID="txtAplicacaoVincBB2" runat="server" CssClass="style4" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="100px" Wrap="False" 
                                            Enabled="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:TextBox ID="txtAplicacaoBB3" runat="server" CssClass="style3" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style29">
                                        <asp:DropDownList ID="DDLAplicVinculadaBB3" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style29">
                                        <asp:TextBox ID="txtAplicacaoVincBB3" runat="server" CssClass="style4" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="100px" Wrap="False" 
                                            Enabled="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:TextBox ID="txtAplicacaoBB4" runat="server" CssClass="style3" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style29">
                                        <asp:DropDownList ID="DDLAplicVinculadaBB4" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style29" >
                                        <asp:TextBox ID="txtAplicacaoVincBB4" runat="server" CssClass="style4" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="100px" Wrap="False" 
                                            Enabled="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:TextBox ID="txtAplicacaoBB5" runat="server" CssClass="style3" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style29">
                                        <asp:DropDownList ID="DDLAplicVinculadaBB5" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style29">
                                        <asp:TextBox ID="txtAplicacaoVincBB5" runat="server" CssClass="style4" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="100px" Wrap="False" 
                                            Enabled="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <span id="FormView1_Label19" style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style29">
                                        <asp:DropDownList ID="DDLTotalAplicVinculadaBB" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceID="DS_Zero" 
                                            DataTextField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style29">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        &nbsp;Caixa Econômica Federal
                        <table cellpadding="1" cellspacing="1" 
                            style="LEFT: 0px; width: 536px; position: relative; TOP: 8px">
                            <tbody>
                                <tr>
                                    <td style="width: 202px; height: 17px" class="style10">
                                        Descrição<br />
                                    </td>
                                    <td class="style10">
                                        Valor<br />
                                    </td>
                                    <td style="height: 17px" class="style10">
                                        Percentual<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        <asp:TextBox ID="txtAplicacaoCEF1" runat="server" CssClass="style3" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAplicVinculadaCEF1" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="txtAplicacaoVincCEF1" runat="server" CssClass="style4" Height="21px" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="100px" Wrap="False" 
                                            Enabled="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        <asp:TextBox ID="txtAplicacaoCEF2" runat="server" CssClass="style3" Height="21px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAplicVinculadaCEF2" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="txtAplicacaoVincCEF2" runat="server" CssClass="style4" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="100px" Wrap="False" 
                                            Enabled="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        <asp:TextBox ID="txtAplicacaoCEF3" runat="server" CssClass="style3" Height="21px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAplicVinculadaCEF3" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="txtAplicacaoVincCEF3" runat="server" CssClass="style4" Height="21px" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="100px" Wrap="False" 
                                            Enabled="False">0,00</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        <asp:TextBox ID="txtAplicacaoCEF4" runat="server" CssClass="style3" Height="21px" 
                                            Width="200px" Wrap="False" ReadOnly="True" BackColor="#D8D8D8"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAplicVinculadaCEF4" runat="server" CssClass="style4" 
                                            DataSourceID="DS_Zero" DataTextField="ValorFinal" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style10">
                                        <asp:TextBox ID="txtAplicacaoVincCEF4" runat="server" CssClass="style4" Height="21px" 
                                            ToolTip="Entre com o Percentual de rendimentos" Width="100px" Wrap="False" Text="0,00"
                                            Enabled="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="style10">
                                    <td class="style10">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <span id="FormView1_Label20" style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLTotalAplicVinculadaCEF" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceID="DS_Zero" 
                                            DataTextField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style10">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label3" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            Ativo Realizável / transitório / Compensado<br />
                        </span>&nbsp;<table style="LEFT: 0px; width: 472px; position: relative; TOP: 0px">
                            <tbody class="style10">
                                <tr>
                                    <td style="width: 206px; height: 21px" class="style10">
                                        Ativo Realizável</td>
                                    <td class="style10" >
                                        <asp:DropDownList ID="DDLAtivoRealizavel" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Ativo_Realizavel" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Ativo_Realizavel" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteAtivo" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="112%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 206px" class="style10">
                                        Ativo transitório</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAtivoTransitorio" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Ativo_Transitorio" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Ativo_Transitorio" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteCtaInternac" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="12%" Name="conta" Type="String" />
                                                <asp:Parameter DefaultValue="12%" Name="containternac" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 206px" class="style10">
                                        Ativo Compensado</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAtivoCompensado" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Ativo_Compensado" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Ativo_Compensado" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalancete" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="14%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 206px" class="style10">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                        <span id="FormView1_Label21" style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLATotalAtivo" runat="server" BackColor="#FFFFCC" 
                                            CssClass="style4" DataSourceid="DS_TotalAtivo" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalAtivo" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 + @Valor3 AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLAtivoRealizavel" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLAtivoTransitorio" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAtivoCompensado" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label4" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            Ativo Permanente</span>
                        <br />
                        <table style="LEFT: 0px; width: 504px; position: relative; TOP: 0px">
                            <tbody>
                                <tr>
                                    <td style="width: 205px" class="style10">
                                        Mês Anterior</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAtivoPermanenteAnterior" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Ativo_PermanenteAnterior" 
                                            DataTextField="ValorFinal" DataValueField="ValorFInal" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Ativo_PermanenteAnterior" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteAtivo" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="13%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label3" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label4" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 205px" class="style10">
                                        Aquisição Despesa de Capital(+)</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAquis_Desp_Capital" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Aquis_desp_capital" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Aquis_desp_capital" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeMovtoAtivo" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="512000%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="Label3" DefaultValue=' ' 
                                                    Name="dtinicioanterior" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="Label4" Name="dtterminoanterior" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 205px" class="style10">
                                        Outras (-)</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAtivo_outras" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Ativo_outras" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Ativo_outras" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeMovtoAtivo" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="511000%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="Label3" DefaultValue=' ' 
                                                    Name="dtinicioanterior" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="Label4" Name="dtterminoanterior" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 205px" class="style10">
                                        Alienação (-)</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAtivo_alienacao" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Ativo_alienacao" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Ativo_alienacao" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeMovtoAtivo" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="513000%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="Label3" DefaultValue=' ' 
                                                    Name="dtinicioanterior" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="Label4" Name="dtterminoanterior" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 205px" class="style10">
                                        Outros (-)</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAtivo_outros" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Zero" DataTextField="ValorFinal" DataValueField="ValorFinal" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 205px" class="style10">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <span id="FormView1_Label22" style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLATotalAtivoPermanente" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_TotalAtivoPermante" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalAtivoPermante" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            
                                            SelectCommand="SELECT @valor1 + @Valor2 - @Valor3 - @Valor4 - @Valor5 AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLAtivoPermanenteAnterior" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLAquis_Desp_Capital" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAtivo_outras" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAtivo_alienacao" Name="Valor4" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAtivo_outros" Name="Valor5" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label5" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            Mutações Patrimoniais Ativas<br />
                        </span>&nbsp;<table style="LEFT: 0px; width: 452px; position: relative; TOP: 0px">
                            <tbody>
                                <tr>
                                    <td class="style10">
                                        Receita de Capital</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceita_Capital" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Receita_Capital" DataTextField="val_sdo_ctbl_fim_nao_apurado" 
                                            DataValueField="val_sdo_ctbl_fim_nao_apurado" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Receita_Capital" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalancete" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="511000%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                    </td>
                                    <td class="style10">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Ativo / Passivo Permanente</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAtivo_passivo_permanente" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Ativo_Passivo_Perman" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Ativo_Passivo_Perman" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteMutacoesAtivo" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="513000%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Outras Mutações Patrimoniais</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLAtivo_outras_mutacoes" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Ativo_outras_mutacoes" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Ativo_outras_mutacoes" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteMutacoesAtivo" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="519000%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <span id="FormView1_Label23" 
                                            style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLATotalAtivoMutacoesPermanente" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_TotalMutacoesAtivas" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalMutacoesAtivas" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 + @Valor3  AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLReceita_Capital" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLAtivo_passivo_permanente" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLAtivo_outras_mutacoes" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label6" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            Despesas Correntes<br />
                        </span>&nbsp;<table style="LEFT: 0px; width: 528px; position: relative; TOP: 0px">
                            <tbody class="style10">
                                <tr>
                                    <td style="width: 170px; height: 21px" height="21px">
                                        Conta</td>
                                    <td height="21px" >
                                        Executada até o mês</td>
                                    <td height="21px" >
                                        &nbsp;Prevista até o mês</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px; height: 21px">
                                        Vencimento e Vantagem Fixa</td>
                                    <td >
                                        <asp:DropDownList ID="DDLDespesas_Vencimento_Vantagem" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Vencimento_Vantagem" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Vencimento_Vantagem" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="319011%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td >
                                        <asp:DropDownList ID="DDLDespesas_Vencimento_Vantagem_Previsto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Vencimento_Vantagem_Previsto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Vencimento_Vantagem_Previsto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="319011%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        Obrigações Patrimoniais</td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespesas_Obrigacoes_patrimoniais" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Obrigacoes_patrim" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Obrigacoes_patrim" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="319013%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespesas_Obrigacoes_patrimoniais_Previsto" 
                                            runat="server" CssClass="style4" 
                                            DataSourceid="DS_Despesas_Obrigacoes_patrim_Previsto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Obrigacoes_patrim_Previsto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="319013%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 170px; height: 21px">
                                        Despesas Variáveis P.Civil</td>
                                    <td >
                                        <asp:DropDownList ID="DDLDespesas_Variaveis_PCivil" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Variaveis_PCivil" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Variaveis_PCivil" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="319016%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td >
                                        <asp:DropDownList ID="DDLDespesas_Variaveis_PCivil_Previsto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Variaveis_PCivil_Previsto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Variaveis_PCivil_Previsto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="319016%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        Indenizações trabalhistas</td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespesas_Indenizacoes_trabalhistas" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Indenizacoes_trabalhistas" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Indenizacoes_trabalhistas" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="319094%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespesas_Indenizacoes_trabalhistas_Previsto" 
                                            runat="server" CssClass="style4" 
                                            DataSourceid="DS_Despesas_Indenizacoes_trabalhistas_Previsto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Indenizacoes_trabalhistas_Previsto" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="319094%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        Outras Despesas Correntes</td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespesas_Outras_Correntes" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Outras_Correntes" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Outras_Correntes" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="33%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespesas_Outras_Correntes_Previsto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Outras_Correntes_Previsto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Outras_Correntes_Previsto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="33%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span id="FormView1_Label24" 
                                            style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDLTotal_Despesas" runat="server" BackColor="#FFFFCC" 
                                            CssClass="style4" DataSourceid="DS_TotalDespesas" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalDespesas" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 + @Valor3 + @Valor4 + @Valor5  AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLDespesas_Vencimento_Vantagem" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLDespesas_Obrigacoes_patrimoniais" 
                                                    Name="Valor2" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespesas_Variaveis_PCivil" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespesas_Indenizacoes_trabalhistas" 
                                                    Name="Valor4" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespesas_Outras_Correntes" Name="Valor5" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDLTotal_Despesas_Previsto" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_TotalDespesas_Previsto" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalDespesas_Previsto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 + @Valor3 + @Valor4 + @Valor5  AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLDespesas_Vencimento_Vantagem_Previsto" 
                                                    Name="valor1" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLDespesas_Obrigacoes_patrimoniais_Previsto" 
                                                    Name="Valor2" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespesas_Variaveis_PCivil_Previsto" 
                                                    Name="Valor3" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespesas_Indenizacoes_trabalhistas_Previsto" 
                                                    Name="Valor4" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespesas_Outras_Correntes_Previsto" 
                                                    DefaultValue=' ' Name="Valor5" PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label7" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            <span ID="FormView1_Label34" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                        <br />
                        Despesas Correntes Média dos ùltimos 12 meses<br />
                        <table style="LEFT: 0px; width: 528px; position: relative; TOP: 0px">
                            <tbody class="style10">
                                <tr>
                                    <td style="width: 170px; height: 21px">
                                        Mês/Ano</td>
                                    <td>
                                        Valor do mês</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px; height: 21px">
                                        <span ID="FormView1_Label36" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label37" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes11" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes11" DataValueField="Data_Mes_11" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes11" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes11" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes11" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes11" 
                                                    DefaultValue="" Name="dtinicio" PropertyName="SelectedValue" 
                                                    Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes11" 
                                                    DefaultValue="" Name="dttermino" PropertyName="SelectedValue" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="FormView1_Label38" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label39" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label40" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label41" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes10" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes10" DataValueField="Data_Mes_10" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="FormView1_Label42" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label43" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label44" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label45" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes10" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes10" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="FormView1_Label46" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label47" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes10" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes10" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes10" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="Span1" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span2" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span3" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span4" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes9" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes9" DataValueField="Data_Mes_9" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="Span5" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span6" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span7" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span8" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes9" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes9" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span9" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span10" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes9" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes9" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes9" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="Span11" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span12" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span13" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span14" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes8" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes8" DataValueField="Data_Mes_8" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="Span15" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span16" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span17" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span18" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes8" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes8" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span19" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span20" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes8" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes8" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes8" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="Span21" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span22" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span23" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span24" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes7" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes7" DataValueField="Data_Mes_7" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="Span25" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span26" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span27" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span28" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes7" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes7" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span29" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span30" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes7" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes7" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes7" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="Span31" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span32" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span33" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span34" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes6" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes6" DataValueField="Data_Mes_6" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="Span35" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span36" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span37" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span38" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes6" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes6" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span39" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span40" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes6" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes6" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes6" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="Span41" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span42" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span43" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span44" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes5" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes5" DataValueField="Data_Mes_5" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="Span45" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span46" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span47" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span48" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes5" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes5" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span49" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span50" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes5" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes5" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes5" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="Span51" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span52" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span53" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span54" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes4" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes4" DataValueField="Data_Mes_4" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="Span55" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span56" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span57" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span58" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes4" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes4" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span59" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span60" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes4" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes4" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes4" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="Span61" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span62" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span63" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span64" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes3" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes3" DataValueField="Data_Mes_3" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="Span65" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span66" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span67" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span68" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes3" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes3" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span69" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span70" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes3" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes3" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes3" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="Span71" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span72" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span73" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span74" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes2" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes2" DataValueField="Data_Mes_2" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="Span75" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span76" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span77" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span78" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes2" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes2" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span79" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span80" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes2" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes2" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        <span ID="Span81" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span82" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span83" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span84" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes1" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes1" DataValueField="Data_Mes_1" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></td>
                                    <td>
                                        <span ID="Span85" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span86" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span87" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span88" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes1" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes1" 
                                            DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" 
                                            width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span89" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span90" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes1" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes1" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px; height: 21px">
                                        <span ID="FormView1_Label48" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label49" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span91" style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span92" style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span93" style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span94" style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteMes0" runat="server" CssClass="style4" 
                                            DataSourceid="DSDatas" DataTextField="Nome_mes0" DataValueField="Data_Mes_0" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        </span></span></span></span></span></span></td>
                                    <td>
                                        <span ID="FormView1_Label50" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="FormView1_Label51" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span95" style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span96" style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span97" style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span98" style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:DropDownList ID="DDLDespCorrenteValorMes0" runat="server" 
                                            CssClass="style4" DataSourceid="DS_DespCorrenteMes0" DataTextField="Movimento" 
                                            DataValueField="Movimento" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <span ID="Span99" style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <span ID="Span100" 
                                            style=" FONT-WEIGHT: bold; font-size: medium; width: 520px; ">
                                        <asp:SqlDataSource ID="DS_DespCorrenteMes0" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasCorrente" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="conta" Type="String" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes0" DefaultValue="" 
                                                    Name="dtinicio" PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteMes0" DefaultValue="" 
                                                    Name="dttermino" PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </span></span></span></span></span></span></span></span></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span ID="FormView1_Label35" 
                                            style="FONT-WEIGHT: bold">Total</span> </td>
                                    <td>
                                        <asp:DropDownList ID="DDLTotal_Despesas12meses" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_TotalDespesas12meses" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalDespesas12meses" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" SelectCommand="SELECT @valor1 + @Valor2 + @Valor3 + @Valor4 + @Valor5  +
@valor6 + @Valor7 + @Valor8 + @Valor9 + @Valor10  +
@valor11 + @Valor0 
AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLDespCorrenteValorMes1" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLDespCorrenteValorMes2" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes3" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes4" Name="Valor4" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes5" Name="Valor5" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes6" Name="valor6" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes7" Name="Valor7" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes8" Name="Valor8" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes9" Name="Valor9" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes10" Name="Valor10" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes11" Name="valor11" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespCorrenteValorMes0" Name="Valor0" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span ID="Span101" 
                                            style="FONT-WEIGHT: bold">Média</span> </td>
                                    <td>
                                        <asp:DropDownList ID="DDL_MediaDespesasCorrente" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_Media_DespesaCorrente" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Media_DespesaCorrente" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" SelectCommand="SELECT cast((@valor1 / 12) as decimal(12,2))
AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLTotal_Despesas12meses" Name="valor1" 
                                                    PropertyName="SelectedValue" DbType="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                        </span>
                        <br />
                            Despesas de Capital e Previsão Orçamentária</span>&nbsp;&nbsp;<br />
                        <br />
                        Despesas de Capital
                        <table style="width: 717px; position: relative; TOP: 32px">
                            <tbody>
                                <tr>
                                    <td height="21px">
                                        Conta</td>
                                    <td height="21px">
                                        Executada até o mês</td>
                                    <td height="21px">
                                        Prevista até o mês</td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Investimentos</td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespesas_Investimento" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Investimento" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Investimento" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="44%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLDespesas_Investimento_Previsto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Investimento_Previsto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Investimento_Previsto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="44%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Inversões Financeiras</td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespesas_Inversoes_Financeiras" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Inversoes_Financeiras" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Inversoes_Financeiras" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="45%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLDespesas_Inversoes_Financeiras_Previsto" 
                                            runat="server" CssClass="style4" 
                                            DataSourceid="DS_Despesas_Inversoes_Financeiras_Previsto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Inversoes_Financeiras_Previsto" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="45%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Amortização e Ref. de Dívda</td>
                                    <td>
                                        <asp:DropDownList ID="DDLDespesas_Amortizacoes" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Amortizacoes" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Amortizacoes" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="47%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLDespesas_Amortizacoes_Previsto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_Amortizacoes_Previsto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Amortizacoes_Previsto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="47%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <span id="FormView1_Label9" 
                                            style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDLTotal_DespesasCapital" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_TotalDespesasCapital" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalDespesasCapital" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 + @Valor3  AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLDespesas_Investimento" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLDespesas_Inversoes_Financeiras" 
                                                    Name="Valor2" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespesas_Amortizacoes" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLTotalDespesasCapitalPrevisto" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" 
                                            DataSourceid="DS_TotalDespesasCapitalPrevisto" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalDespesasCapitalPrevisto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 + @Valor3  AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLDespesas_Investimento_Previsto" 
                                                    Name="valor1" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLDespesas_Inversoes_Financeiras_Previsto" 
                                                    Name="Valor2" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespesas_Amortizacoes_Previsto" 
                                                    Name="Valor3" PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        Previsão Orçamentária<br />
&nbsp;<table style="LEFT: 40px; width: 382px; position: relative; TOP: 0px; height: 21px">
                            <tbody>
                                <tr>
                                    <td class="style18" valign="middle">
                                        Despesas Corrente Exercício Prevista</td>
                                    <td class="style19">
                                        <asp:DropDownList ID="DDLTotalDespPrevCt3" runat="server" CssClass="style4" 
                                            DataSourceid="DS_DespesasCorrenteExercicioPrevista" DataTextField="val_orcado" 
                                            DataValueField="val_orcado" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_DespesasCorrenteExercicioPrevista" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="3%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="12" Name="v_num_period_ctbl" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style18">
                                        Despesas de Capital Exercício Prevista</td>
                                    <td class="style19">
                                        <asp:DropDownList ID="DDLTotalDespPrevCt4" runat="server" CssClass="style4" 
                                            DataSourceid="DS_DespesasCapitalExercicioPrevista" DataTextField="val_orcado" 
                                            DataValueField="val_orcado" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_DespesasCapitalExercicioPrevista" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="4%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter DefaultValue="12" Name="v_num_period_ctbl" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style18">
                                        Despesa Prevista Total do Exercício</td>
                                    <td class="style19">
                                        <asp:SqlDataSource ID="DS_TotalDespesasPrevistaTTExercicio" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2   AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLTotalDespPrevCt3" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLTotalDespPrevCt4" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLTotal_DespesasCapital1" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" 
                                            DataSourceid="DS_TotalDespesasPrevistaTTExercicio" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label11" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            Balancete Financeiro - Exercício Anterior<br />
                        </span>&nbsp;<table 
                            style="LEFT: 0px; width: 395px; position: relative; TOP: 0px">
                            <tbody>
                                <tr>
                                    <td class="style26">
                                        Realizável
                                        <br />
                                        Transitório<br />
                                        Realizável + transitório</td>
                                    <td >
                                        <asp:DropDownList ID="DDLRealizavelAnterior" runat="server" CssClass="style4" 
                                            DataSourceid="DS_RealizavelAnterior" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_RealizavelAnterior" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasAnterior" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="112%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' Name="ano" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLTransitorioAnterior" runat="server" CssClass="style4" 
                                            DataSourceid="DS_TransitorioAnterior" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_TransitorioAnterior" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasAnterior" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="12%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' Name="ano" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLTotalRealizavelTransitorioAnterior" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" 
                                            DataSourceid="DS_TotalRealizTransitAnterior" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_TotalRealizTransitAnterior" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2   AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLRealizavelAnterior" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLTransitorioAnterior" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style27">
                                        Passivo Financeiro
                                        <br />
                                        Transitório<br />
                                        Passivo Financeiro + transitório</td>
                                    <td>
                                        <asp:DropDownList ID="DDLPassivoFinanceiroAnterior" runat="server" 
                                            CssClass="style4" DataSourceid="DS_PassivoFinanceiroAnterior" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_PassivoFinanceiroAnterior" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoPassivoAnterior" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="21%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' Name="ano" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLPassivoTransitorioAnterior" runat="server" 
                                            CssClass="style4" DataSourceid="DS_PassivoTransitorioAnterior" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_PassivoTransitorioAnterior" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoPassivoAnterior" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="22%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' Name="ano" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DropDownList ID="DDLTotalPassivoTransitAnterior" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" 
                                            DataSourceid="DS_TotalPassivoTransitAnterior" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_TotalPassivoTransitAnterior" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2   AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLPassivoFinanceiroAnterior" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLPassivoTransitorioAnterior" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style26">
                                        Saldo do Ativo Disponível</td>
                                    <td >
                                        <asp:DropDownList ID="DDLTotalSaldoAtivoAnterior" runat="server" BackColor="#FFFFCC" 
                                            CssClass="style4" DataSourceid="DS_TotalSaldoAtivo" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_TotalSaldoAtivo" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasAnterior" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="111%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' Name="ano" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style26">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <span id="FormView1_Label13" 
                                            style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td >
                                        <asp:DropDownList ID="DDTotalExercicioAnterior" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_TotalExercicioAnterior" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_TotalExercicioAnterior" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2+ @Valor3   AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLTotalPassivoTransitAnterior" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLTotalRealizavelTransitorioAnterior" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLTotalSaldoAtivoAnterior" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label12" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            Passivo<br />
                        </span>&nbsp;<table 
                            style="LEFT: 0px; width: 369px; position: relative; TOP: 0px">
                            <tbody class="style10">
                                <tr>
                                    <td style="width: 160px" class="style10">
                                        Exigível Imediato</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLPassivo_ExigivelImediato" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Passivo_ExigivelImediato" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_Passivo_ExigivelImediato" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalancetePassivo" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="211%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 160px" class="style10">
                                        Exigível Mediato</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLPassivo_ExigivelMediato" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Passivo_ExigivelMediato" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_Passivo_ExigivelMediato" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalancetePassivo" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="212%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                      </td>
                                </tr>
                                <tr>
                                    <td style="width: 160px" class="style10">
                                        Passivo transitório</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLPassivo_Transitorio" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Passivo_Transitorio" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_Passivo_Transitorio" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalancetePassivo" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="22%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 160px" class="style10">
                                        Passivo Permanente</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLPassivo_Permanente" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Passivo_Permanente" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_Passivo_Permanente" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalancetePassivo" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="23%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 160px" class="style10">
                                        Resultado do Período</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLPassivo_ResultadoExercicio" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ResultadoExercicio" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ResultadoExercicio" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="leResultadoExercicio" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label1" Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter ControlID="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 160px" class="style10">
                                        Passivo Compensado</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLPassivo_Compensado" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Passivo_Compensado" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_Passivo_Compensado" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalancetePassivo" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="24%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 160px" class="style10">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span id="FormView1_Label26" 
                                            style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDTotalPassivo" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_TotalPassivo" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_TotalPassivo" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            
                                            SelectCommand="SELECT @valor1 + @Valor2+ @Valor3  + @Valor4+ @Valor5   + @Valor6  AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLPassivo_ExigivelImediato" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLPassivo_ExigivelMediato" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLPassivo_Transitorio" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLPassivo_Permanente" Name="Valor4" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLPassivo_ResultadoExercicio" Name="Valor5" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLPassivo_Compensado" Name="Valor6" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label14" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            Mutações Patrimoniais Passivas<br />
                        </span>&nbsp;<table style="LEFT: 0px; width: 376px; position: relative; TOP: 0px">
                            <tbody>
                                <tr>
                                    <td style="width: 194px; height: 21px" class="style10">
                                        Despesa de Capital</td>
                                    <td style="width: 158px; height: 21px" class="style10">
                                        <asp:DropDownList ID="DDLDespesas_Capital" runat="server" CssClass="style4" 
                                            DataSourceid="DS_Despesas_Capital" DataTextField="val_sdo_ctbl_fim_nao_apurado" 
                                            DataValueField="val_sdo_ctbl_fim_nao_apurado" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_Capital" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoDespesasNegat" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="512000%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 194px" class="style10">
                                        Ativo / Passivo Permanente</td>
                                    <td style="width: 158px" class="style10">
                                        <asp:DropDownList ID="DDLDespesas_AtivoPassivoPermanente" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_AtivoPassivoPermanente" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_AtivoPassivoPermanente" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteMutacoesPassivo" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="513000%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 194px" class="style10">
                                        Outras Mutações Patrimoniais</td>
                                    <td style="width: 158px" class="style10">
                                        <asp:DropDownList ID="DDLDespesas_OutrasMutacoesPatrimoniais" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Despesas_OutrasMutacoesPatrimoniais" 
                                            DataTextField="val_sdo_ctbl_fim_nao_apurado" DataValueField="val_sdo_ctbl_fim_nao_apurado" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_Despesas_OutrasMutacoesPatrimoniais" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoBalanceteMutacoesPassivo" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="519000%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="SelectedValue" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 194px" class="style10">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <span id="FormView1_Label27" style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td style="width: 158px" class="style10">
                                        <asp:DropDownList ID="DDTotalPassivo0" runat="server" BackColor="#FFFFCC" 
                                            CssClass="style4" DataSourceid="DS_TotalMutacoesPatrimoniais" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalMutacoesPatrimoniais" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2+ @Valor3    AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLDespesas_Capital" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLDespesas_AtivoPassivoPermanente" 
                                                    Name="Valor2" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLDespesas_OutrasMutacoesPatrimoniais" 
                                                    Name="Valor3" PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label25" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            Receita de Contribuição<br />
                        </span>&nbsp;<table style="LEFT: 0px; width: 504px; position: relative; TOP: 0px">
                            <tbody>
                                <tr>
                                    <td style="width: 172px; height: 21px" class="style10" height="21px">
                                        Conta</td>
                                    <td style="width: 136px; height: 21px" class="style10" height="21px">
                                        Arrecadada até o mês</td>
                                    <td style="width: 136px; height: 21px" class="style10" height="21px">
                                        Prevista até o mês</td>
                                </tr>
                                <tr>
                                    <td style="width: 172px; height: 21px" class="style10">
                                        Comunicada pelo INSS</td>
                                    <td style="width: 136px; height: 21px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaComunicadaINSS" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaComunicadaINSS" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaComunicadaINSS" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="12103301%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td style="width: 73px; height: 21px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaComunicadaINSSPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaComunicadaINSSPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaComunicadaINSSPrevisto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="12103301%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 172px; height: 21px" class="style10">
                                        Subvenções Ordinárias</td>
                                    <td style="width: 136px; height: 21px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaSubvencoesOrdinarias" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Zero" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                    <td style="width: 73px; height: 21px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaSubvencoesOrdinariasPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Zero" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 172px; height: 21px" class="style10">
                                        PSG</td>
                                    <td style="width: 136px; height: 21px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaPSG" runat="server" CssClass="style4" 
                                            DataSourceid="DS_ReceitaPSG" DataTextField="val_sdo_ctbl_fim" 
                                            DataValueField="val_sdo_ctbl_fim" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPSG" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="12103302%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td style="width: 73px; height: 21px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaPSGPrevista" runat="server" CssClass="style4" 
                                            DataSourceid="DS_ReceitaPSGPrevista" DataTextField="val_orcado_periodo" 
                                            DataValueField="val_orcado_periodo" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPSGPrevista" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="12103302%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 172px" class="style10">
                                        Aplicação Investimentos</td>
                                    <td style="width: 136px" class="style10">
                                        <asp:DropDownList ID="DDLReceitasAplicacaoInvestimentos" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Zero" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                    <td style="width: 73px" class="style10">
                                        <asp:DropDownList ID="DDLReceitasAplicacaoInvestimentosPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Zero" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 172px" class="style10">
                                        Outras Receitas de Contribuição</td>
                                    <td style="width: 136px" class="style10">
                                        <asp:DropDownList ID="DDLReceitas_OutrasContribuicao" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Zero" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                    <td style="width: 73px" class="style10">
                                        <asp:DropDownList ID="DDLReceitas_OutrasContribuicaoPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Zero" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 172px" class="style10">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span id="FormView1_Label29" 
                                            style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td style="width: 136px" class="style10">
                                        <asp:DropDownList ID="DDLTotalReceitaContribuicao" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" 
                                            DataSourceid="DS_TotalReceitaContribuicao" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalReceitaContribuicao" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2+ @Valor3  + @Valor4+ @Valor5  AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLReceitaComunicadaINSS" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLReceitaSubvencoesOrdinarias" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPSG" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitasAplicacaoInvestimentos" 
                                                    Name="Valor4" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitas_OutrasContribuicao" Name="Valor5" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td style="width: 73px" class="style10">
                                        <asp:DropDownList ID="DDLTotalReceitaContribuicaoPrevisto" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" 
                                            DataSourceid="DS_TotalReceitaContribuicaoPrevisto" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalReceitaContribuicaoPrevisto" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2 + @Valor3 + @Valor4 + @Valor5 AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLReceitaComunicadaINSSPrevisto" 
                                                    Name="valor1" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLReceitaSubvencoesOrdinariasPrevisto" 
                                                    Name="Valor2" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPSGPrevista" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitasAplicacaoInvestimentosPrevisto" 
                                                    Name="Valor4" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitas_OutrasContribuicaoPrevisto" 
                                                    Name="Valor5" PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label28" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            Receita Patrimonial / Serviços / Outras Receitas<br />
                        </span>&nbsp;<table style="LEFT: 0px; width: 528px; position: relative; TOP: 8px">
                            <tbody>
                                <tr>
                                    <td style="width: 170px; height: 21px" height="21px">
                                        Contas</td>
                                    <td style="width: 170px; height: 21px" class="style10" height="21px">
                                        &nbsp;Arrecadada até o mês</td>
                                    <td class="style10" height="21px" >
                                        Prevista até o mês</td>
                                </tr>
                                <tr>
                                    <td style="width: 170px; height: 21px">
                                        Imobiliárias</td>
                                    <td style="width: 170px; height: 21px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialImobiliarias" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaPatrimonialImobiliarias" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialImobiliarias" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="131%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10" >
                                        <asp:DropDownList ID="DDLReceitaPatrimonialImobiliariasPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaPatrimonialImobiliariasPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialImobiliariasPrevisto" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="131%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 170px">
                                        Valores Imobiliários</td>
                                    <td style="width: 170px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialValoresImobiliarios" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaPatrimonialValoresImobiliarios" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialValoresImobiliarios" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="132%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialValoreslImobiliariosPrevisto" 
                                            runat="server" CssClass="style4" 
                                            DataSourceid="DS_ReceitaPatrimonialValoreslImobiliariosPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialValoreslImobiliariosPrevisto" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="132%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 170px; height: 21px">
                                        Outras Rec. &nbsp;Patrimoniais</td>
                                    <td style="width: 170px; height: 21px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialOutras" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaPatrimonialOutras" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialOutras" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="139%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10" >
                                        <asp:DropDownList ID="DDLReceitaPatrimonialOutrosPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaPatrimonialOutrasPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialOutrasPrevisto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="139%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        Receita de Serviços</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialServicos" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaPatrimonialServicos" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialServicos" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="16%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialServicosPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaPatrimonialServicosPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialServicosPrevisto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="16%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        Outras Receitas Correntes</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialOutrasCorrente" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaPatrimonialOutrasCorrente" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialOutrasCorrente" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="19%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialOutrasCorrentePrevisto" 
                                            runat="server" CssClass="style4" 
                                            DataSourceid="DS_ReceitaPatrimonialOutrasCorrentePrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaPatrimonialOutrasCorrentePrevisto" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="19%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        Transferências Correntes</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialTransfCorrentes" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Zero" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaPatrimonialTransfCorrentesPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_Zero" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <span id="FormView1_Label30" 
                                            style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLTotalReceitaPatrimonial" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_TotalReceitaPatrimonial" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:SqlDataSource ID="DS_TotalReceitaPatrimonial" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2+ @Valor3  + @Valor4+ @Valor5 + @Valor6 AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLReceitaPatrimonialImobiliarias" 
                                                    Name="valor1" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLReceitaPatrimonialValoresImobiliarios" 
                                                    Name="Valor2" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPatrimonialOutras" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPatrimonialServicos" Name="Valor4" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPatrimonialOutrasCorrente" 
                                                    Name="Valor5" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPatrimonialTransfCorrentes" 
                                                    Name="Valor6" PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLTotalReceitaContribuicao1" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" 
                                            DataSourceid="DS_TotalReceitaPatrimonialPrevisto" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:SqlDataSource ID="DS_TotalReceitaPatrimonialPrevisto" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2+ @Valor3  + @Valor4+ @Valor5 + @Valor6 AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLReceitaPatrimonialImobiliariasPrevisto" 
                                                    Name="valor1" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLReceitaPatrimonialValoreslImobiliariosPrevisto" 
                                                    Name="Valor2" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPatrimonialOutrosPrevisto" 
                                                    Name="Valor3" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPatrimonialServicosPrevisto" 
                                                    Name="Valor4" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPatrimonialOutrasCorrentePrevisto" 
                                                    Name="Valor5" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaPatrimonialTransfCorrentesPrevisto" 
                                                    Name="Valor6" PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <span id="FormView1_Label31" 
                            style=" FONT-WEIGHT: bold; font-size: medium; LEFT: 0px; width: 520px; position: relative; TOP: 8px; ">
                            <br />
                            Receitas de Capital / Outras Receitas<br />
                            <br />
                        </span>Receitas de Capital
                        <table style="LEFT: 0px; width: 456px; position: relative; TOP: 0px">
                            <tbody>
                                <tr>
                                    <td class="style10" height="21px">
                                        Contas</td>
                                    <td style="width: 130px" class="style10" height="21px">
                                        Arrecadada até o mês</td>
                                    <td class="style10" height="21px">
                                        Prevista até o mês</td>
                                </tr>
                                <tr>
                                    <td>
                                        Operações de Crédito</td>
                                    <td style="width: 130px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalOpCredito" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaCapitalOpCredito" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalOpCredito" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="21%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalOpCreditoPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaCapitalOpCreditoPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalOpCreditoPrevisto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="21%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Alienação de Bens</td>
                                    <td style="width: 130px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalAlienBens" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaCapitalAlienBens" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalAlienBens" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="22%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalAlienBensPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaCapitalAlienBensPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalAlienBensPrevisto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="22%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Amortização de Empréstimos</td>
                                    <td style="width: 130px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalAmortEmprest" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaCapitalAmortEmprest" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalAmortEmprest" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="23%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalAmortEmprestPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaCapitalAmortEmprestPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalAmortEmprestPrevisto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="23%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        transferência de Capital</td>
                                    <td style="width: 130px" class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalTransfCapital" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaCapitalTransfCapital" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalTransfCapital" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="24%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalTransfCapitalPrevisto" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaCapitalTransfCapitalPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalTransfCapitalPrevisto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="24%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Saldo de Exercícios Anteriores</td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalSaldoExercAnteriores" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaCapitalSaldoExercAnteriores" 
                                            DataTextField="val_sdo_ctbl_fim" DataValueField="val_sdo_ctbl_fim" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalSaldoExercAnteriores" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceita" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="258%" Name="conta" Type="String" />
                                                <asp:ControlParameter Controlid="Label1" DefaultValue=' ' Name="dtinicio" 
                                                    PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter Controlid="Label2" Name="dttermino" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLReceitaCapitalSaldoExercAnterioresPrevisto" 
                                            runat="server" CssClass="style4" 
                                            DataSourceid="DS_ReceitaCapitalSaldoExercAnterioresPrevisto" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaCapitalSaldoExercAnterioresPrevisto" 
                                            runat="server" ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="LeSaldoReceitasOrcado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="258%" Name="cod_cta_ctbl" Type="String" />
                                                <asp:ControlParameter Controlid="DDL_Ano" DefaultValue=' ' 
                                                    Name="v_cod_exerc_ctbl" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter Controlid="DDL_Mes" Name="v_num_period_ctbl" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span id="FormView1_Label32" 
                                            style="FONT-WEIGHT: bold">Total</span>
                                    </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLTotalReceitaCapital" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" DataSourceid="DS_TotalReceitaCapital" 
                                            DataTextField="ValorFinal" DataValueField="ValorFinal" Enabled="False" 
                                            height="21px" width="155px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_TotalReceitaCapital" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2+ @Valor3  + @Valor4+ @Valor5  AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLReceitaCapitalOpCredito" Name="valor1" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLReceitaCapitalAlienBens" Name="Valor2" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaCapitalAmortEmprest" Name="Valor3" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaCapitalTransfCapital" Name="Valor4" 
                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaCapitalSaldoExercAnteriores" 
                                                    Name="Valor5" PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                    <td class="style10">
                                        <asp:DropDownList ID="DDLTotalReceitaCapitalPrevisto" runat="server" 
                                            BackColor="#FFFFCC" CssClass="style4" 
                                            DataSourceid="DS_TotalReceitaCapitalPrevisto" DataTextField="ValorFinal" 
                                            DataValueField="ValorFinal" Enabled="False" height="21px" width="155px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DS_TotalReceitaCapitalPrevisto" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="SELECT @valor1 + @Valor2+ @Valor3  + @Valor4+ @Valor5  AS ValorFinal">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDLReceitaCapitalOpCreditoPrevisto" 
                                                    Name="valor1" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter Controlid="DDLReceitaCapitalAlienBensPrevisto" 
                                                    Name="Valor2" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaCapitalAmortEmprestPrevisto" 
                                                    Name="Valor3" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaCapitalTransfCapitalPrevisto" 
                                                    Name="Valor4" PropertyName="SelectedValue" Type="Decimal" />
                                                <asp:ControlParameter ControlID="DDLReceitaCapitalSaldoExercAnterioresPrevisto" 
                                                    Name="Valor5" PropertyName="SelectedValue" Type="Decimal" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <br />
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td colspan="2" class="style10">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        Receita Prevista Total do Exercício</td>
                                    <td colspan="2">
                                        <asp:DropDownList ID="DDLReceitaTotalExercicioPrevista" runat="server" 
                                            CssClass="style4" DataSourceid="DS_ReceitaTotalExercicioPrevista" 
                                            DataTextField="val_orcado_periodo" DataValueField="val_orcado_periodo" 
                                            Enabled="False" height="21px" width="155px" BackColor="#FFFFCC">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="DS_ReceitaTotalExercicioPrevista" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:DW_Datasul_conexao %>" 
                                            SelectCommand="leReceitaPrevistaExercicio" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter Controlid="DDL_Ano" 
                                                    Name="ano" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        </td>
                                </tr>
                            </tbody>
                        </table>
                        &nbsp; &nbsp;&nbsp; &nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:Button ID="BtnGrava" runat="server" BackColor="#999999" 
                Font-Names="Arial Black" Font-Size="Small" ForeColor="Yellow" Height="30px" 
                Text="Grava Dados na Tabela BalanceteWeb" Width="525px" />
            <asp:SqlDataSource ID="SDSDados" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SenacConnectionString %>" 
                InsertCommand="INSERT INTO BalanceteWeb(regional, mes, ano, caixa, Banco_conta_movimento_Brasil, Banco_conta_movimento_CEF, Banco_conta_poupanca_efetiva_bb, Banco_conta_poupanca_efetiva_cef, Descricao1_bb, Descricao2_bb, Descricao3_bb, Descricao4_bb, Descricao5_bb, Valor1_bb, Valor2_bb, Valor3_bb, Valor4_bb, Valor5_bb, Percentual1_bb, Percentual2_bb, Percentual3_bb, Percentual4_bb, Percentual5_bb, Descricao1_cef, Descricao2_cef, Descricao3_cef, Descricao4_cef, Valor1_cef, Valor2_cef, Valor3_cef, Valor4_cef, Percentual1_cef, Percentual2_cef, Percentual3_cef, Percentual4_cef, Banco_conta_movimento_vinculada_bb, Banco_conta_movimento_vinculada_cef, Banco_poupanca_vinculada_bb, Banco_poupanca_vinculada_cef, Descricao1_vinculada_bb, Descricao2_vinculada_bb, Descricao3_vinculada_bb, Descricao4_vinculada_bb, Descricao5_vinculada_bb, Valor1_vinculada_bb, Valor2_vinculada_bb, Valor3_vinculada_bb, Valor4_vinculada_bb, Valor5_vinculada_bb, Percentual1_vinculada_bb, Percentual2_vinculada_bb, Percentual3_vinculada_bb, Percentual4_vinculada_bb, Percentual5_vinculada_bb, Descricao1_vinculada_cef, Descricao2_vinculada_cef, Descricao3_vinculada_cef, Descricao4_vinculada_cef, Valor1_vinculada_cef, Valor2_vinculada_cef, Valor3_vinculada_cef, Valor4_vinculada_cef, Percentual1_vinculada_cef, Percentual2_vinculada_cef, Percentual3_vinculada_cef, Percentual4_vinculada_cef, ativo_realizavel, ativo_transitorio, ativo_compensado, mes_anterior, aquisicao_despesa_de_capital, Outras, Alienacao, Outros, receitas_de_capital, ativo_passivo_permanente, outras_mutacoes_patrimoniais, vencimentos_vantagens_fixas_previstas, obrigacoes_patrimoniais_previstas, despesas_variaveis_civil_previstas, indenizacoes_trabalhistas_previstas, outras_despesas_correntes_previstas, vencimentos_vantagens_fixas_executadas, obrigacoes_patrimoniais_executadas, despesas_variaveis_civil_executadas, indenizacoes_trabalhistas_executadas, outras_despesas_correntes_executadas, Investimentos_executadas, Inversoes_financeiras_executadas, Amortizacoes_executadas, Investimentos_previstas, Inversoes_financeiras_previstas, Amortizacoes_previstas, Outras_despesas_correntes_dp, Mes1, Mes2, Mes3, Mes4, Mes5, Mes6, Mes7, Mes8, Mes9, Mes10, Mes11, Mes12, valor1_media, valor2_media, valor3_media, valor4_media, valor5_media, valor6_media, valor7_media, valor8_media, valor9_media, valor10_media, valor11_media, valor12_media, realizavel_transitorio, Passivo_financeiro_transitorio, saldo_ativo_disponivel, Exigivel_imediato, Exigivel_mediato, Passivo_transitorio, Passivo_permanente, Resultado_periodo, Passivo_compensado, Mutacoes_despesa_capital, Mutacoes_ativo_passivo_permanente, Mutacoes_outras_mutacoes_patrimoniais, Comunicada_inss_arrecadada, Subvencoes_ordinarias_arrecadada, remessa_fpe_arrecadada, Aplicacao_investimentos_arrecadada, Sistema_Sei_Arrecadada, Comunicada_inss_prevista, Subvencoes_ordinarias_prevista, remessa_fpe_prevista, Aplicacao_investimentos_prevista, Sistema_Sei_prevista, imobiliarias_arrecadada, Valores_imobiliarias_arrecadada, outras_rec_patrimoniais_arrecadada, receita_de_servico_arrecadada, outras_receitas_correntes_arrecadada, transferencias_correntes_arrecadada, imobiliarias_prevista, Valores_imobiliarias_prevista, outras_rec_patrimoniais_prevista, receita_de_servico_prevista, outras_receitas_correntes_prevista, transferencias_correntes_prevista, operacoes_credito_arrecadada, alienacao_bens_arrecadada, amortizacao_emprestimos_arrecadada, transferencia_capital_arrecadada, saldo_exercicios_anteriores_arrecadada, operacoes_credito_prevista, alienacao_bens_prevista, amortizacao_emprestimos_prevista, transferencia_capital_prevista, saldo_exercicios_anteriores_prevista, receita_prevista_total) VALUES (@regional, @mes, @ano, @caixa, @Banco_conta_movimento_Brasil, @Banco_conta_movimento_CEF, @Banco_conta_poupanca_efetiva_bb, @Banco_conta_poupanca_efetiva_cef, @Descricao1_bb, @Descricao2_bb, @Descricao3_bb, @Descricao4_bb, @Descricao5_bb, @Valor1_bb, @Valor2_bb, @Valor3_bb, @Valor4_bb, @Valor5_bb, @Percentual1_bb, @Percentual2_bb, @Percentual3_bb, @Percentual4_bb, @Percentual5_bb, @Descricao1_cef, @Descricao2_cef, @Descricao3_cef, @Descricao4_cef, @Valor1_cef, @Valor2_cef, @Valor3_cef, @Valor4_cef, @Percentual1_cef, @Percentual2_cef, @Percentual3_cef, @Percentual4_cef, @Banco_conta_movimento_vinculada_bb, @Banco_conta_movimento_vinculada_cef, @Banco_poupanca_vinculada_bb, @Banco_poupanca_vinculada_cef, @Descricao1_vinculada_bb, @Descricao2_vinculada_bb, @Descricao3_vinculada_bb, @Descricao4_vinculada_bb, @Descricao5_vinculada_bb, @Valor1_vinculada_bb, @Valor2_vinculada_bb, @Valor3_vinculada_bb, @Valor4_vinculada_bb, @Valor5_vinculada_bb, @Percentual1_vinculada_bb, @Percentual2_vinculada_bb, @Percentual3_vinculada_bb, @Percentual4_vinculada_bb, @Percentual5_vinculada_bb, @Descricao1_vinculada_cef, @Descricao2_vinculada_cef, @Descricao3_vinculada_cef, @Descricao4_vinculada_cef, @Valor1_vinculada_cef, @Valor2_vinculada_cef, @Valor3_vinculada_cef, @Valor4_vinculada_cef, @Percentual1_vinculada_cef, @Percentual2_vinculada_cef, @Percentual3_vinculada_cef, @Percentual4_vinculada_cef, @ativo_realizavel, @ativo_transitorio, @ativo_compensado, @mes_anterior, @aquisicao_despesa_de_capital, @Outras, @Alienacao, @Outros, @receitas_de_capital, @ativo_passivo_permanente, @outras_mutacoes_patrimoniais, @vencimentos_vantagens_fixas_previstas, @obrigacoes_patrimoniais_previstas, @despesas_variaveis_civil_previstas, @indenizacoes_trabalhistas_previstas, @outras_despesas_correntes_previstas, @vencimentos_vantagens_fixas_executadas, @obrigacoes_patrimoniais_executadas, @despesas_variaveis_civil_executadas, @indenizacoes_trabalhistas_executadas, @outras_despesas_correntes_executadas, @Investimentos_executadas, @Inversoes_financeiras_executadas, @Amortizacoes_executadas, @Investimentos_previstas, @Inversoes_financeiras_previstas, @Amortizacoes_previstas, @Outras_despesas_correntes_dp, @Mes1, @Mes2, @Mes3, @Mes4, @Mes5, @Mes6, @Mes7, @Mes8, @Mes9, @Mes10, @Mes11, @Mes12, @valor1_media, @valor2_media, @valor3_media, @valor4_media, @valor5_media, @valor6_media, @valor7_media, @valor8_media, @valor9_media, @valor10_media, @valor11_media, @valor12_media, @realizavel_transitorio, @Passivo_financeiro_transitorio, @saldo_ativo_disponivel, @Exigivel_imediato, @Exigivel_mediato, @Passivo_transitorio, @Passivo_permanente, @Resultado_periodo, @Passivo_compensado, @Mutacoes_despesa_capital, @Mutacoes_ativo_passivo_permanente, @Mutacoes_outras_mutacoes_patrimoniais, @Comunicada_inss_arrecadada, @Subvencoes_ordinarias_arrecadada, @remessa_fpe_arrecadada, @Aplicacao_investimentos_arrecadada, @Sistema_Sei_Arrecadada, @Comunicada_inss_prevista, @Subvencoes_ordinarias_prevista, @remessa_fpe_prevista, @Aplicacao_investimentos_prevista, @Sistema_Sei_prevista, @imobiliarias_arrecadada, @Valores_imobiliarias_arrecadada, @outras_rec_patrimoniais_arrecadada, @receita_de_servico_arrecadada, @outras_receitas_correntes_arrecadada, @transferencias_correntes_arrecadada, @imobiliarias_prevista, @Valores_imobiliarias_prevista, @outras_rec_patrimoniais_prevista, @receita_de_servico_prevista, @outras_receitas_correntes_prevista, @transferencias_correntes_prevista, @operacoes_credito_arrecadada, @alienacao_bens_arrecadada, @amortizacao_emprestimos_arrecadada, @transferencia_capital_arrecadada, @saldos_exercicios_anteriores, @operacoes_credito_prevista, @alienacao_bens_prevista, @amortizacao_emprestimos_prevista, @transferencia_capital_prevista, @saldo_exercicios_anteriores_prevista, @receita_prevista_total)" 
                SelectCommand="SELECT * FROM [BalanceteWeb]">
                <InsertParameters>
                    <asp:Parameter Name="regional" Type="Int16" DefaultValue="15" />
                    <asp:ControlParameter Name="mes"								ControlID="DDL_Mes"				PropertyName="SelectedValue" Type="Int16"/>
                    <asp:ControlParameter Name="ano"								ControlID="DDL_Ano"				PropertyName="SelectedValue" Type="Int16"/>
                    <asp:ControlParameter Name="caixa"								ControlID="DDLCaixa"			PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Banco_conta_movimento_Brasil"		ControlID="DDLBancoMovtoBB"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="banco_conta_movimento_CEF"			ControlID="DDLBancoMovtoCEF"	PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="banco_conta_poupanca_efetiva_bb"	ControlID="DDLBancoPoupBB"		PropertyName="SelectedValue" Type="Decimal"/>
					<asp:ControlParameter Name="Banco_conta_poupanca_efetiva_cef"	ControlID="DDLBancoPoupCEF"		PropertyName="SelectedValue" Type="Decimal" DefaultValue=' ' />
                    <asp:ControlParameter Name="descricao1_bb"						ControlID="txtAplicacaoBB1"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="descricao2_bb"						ControlID="txtAplicacaoBB2"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="descricao3_bb"						ControlID="txtAplicacaoBB3"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="descricao4_bb"						ControlID="txtAplicacaoBB4"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="descricao5_bb"						ControlID="txtAplicacaoBB5"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="valor1_bb"							ControlID="DDLAplicSWAPBB0"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor2_bb"							ControlID="DDLAplicSwapBB"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor3_bb"							ControlID="DDLAplicSwapBB1"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor4_bb"							ControlID="DDLAplicSwapBB2"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Valor5_bb"							ControlID="DDLAplicSwapBB3"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="percentual1_bb"						ControlID="txtPercentBB1"		PropertyName="Text"			 Type="Decimal" DefaultValue="0" />
                    <asp:ControlParameter Name="percentual2_bb"						ControlID="txtPercentBB2"		PropertyName="Text"			 Type="Decimal" DefaultValue="0" />
                    <asp:ControlParameter Name="percentual3_bb"						ControlID="txtPercentBB3"		PropertyName="Text"			 Type="Decimal" DefaultValue="0" />
                    <asp:ControlParameter Name="percentual4_bb"						ControlID="txtPercentBB4"		PropertyName="Text"			 Type="Decimal" DefaultValue="0" />
                    <asp:ControlParameter Name="percentual5_bb"						ControlID="txtPercentBB5"		PropertyName="Text"			 Type="Decimal" DefaultValue="0" />
                    <asp:ControlParameter Name="descricao1_cef"						ControlID="txtDescricaoCEF1"	PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false"/>
                    <asp:ControlParameter Name="descricao2_cef"						ControlID="txtDescricaoCEF2"	PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false"/>
                    <asp:ControlParameter Name="descricao3_cef"						ControlID="txtDescricaoCEF3"	PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false"/>
                    <asp:ControlParameter Name="descricao4_cef"						ControlID="txtDescricaoCEF4"	PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false"/>
                    <asp:ControlParameter Name="Valor1_cef"							ControlID="DDLAplicCEF1"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Valor2_cef"							ControlID="DDLAplicCEF2"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Valor3_cef"							ControlID="DDLAplicCEF3"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Valor4_cef"							ControlID="DDLAplicCEF4"		PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="percentual1_cef"					ControlID="txtPercentCEF1"		PropertyName="Text"			 Type="Decimal" DefaultValue="0" />
                    <asp:ControlParameter Name="percentual2_cef"					ControlID="txtPercentCEF2"		PropertyName="Text"			 Type="Decimal" DefaultValue="0" />
                    <asp:ControlParameter Name="percentual3_cef"					ControlID="txtPercentCEF3"		PropertyName="Text"			 Type="Decimal" DefaultValue="0" />
                    <asp:ControlParameter Name="percentual4_cef"					ControlID="txtPercentCEF4"		PropertyName="Text"			 Type="Decimal" DefaultValue="0" />
                    <asp:ControlParameter Name="banco_conta_movimento_vinculada_bb" ControlID="DDLDispBancoMovtoBB" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Banco_conta_movimento_vinculada_cef" ControlID="DDLDispBancoMovtoCEF" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="banco_poupanca_vinculada_bb"		ControlID="DDLDispBancoPoupBB"	PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="banco_poupanca_vinculada_cef"		ControlID="DDLDispBancoPoupCEF" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="descricao1_vinculada_bb"			ControlID="txtAplicacaoBB1"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false"/>
                    <asp:ControlParameter Name="descricao2_vinculada_bb"			ControlID="txtAplicacaoBB2"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false"/>
                    <asp:ControlParameter Name="descricao3_vinculada_bb"			ControlID="txtAplicacaoBB3"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false"/>
                    <asp:ControlParameter Name="descricao4_vinculada_bb"			ControlID="txtAplicacaoBB4"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false"/>
                    <asp:ControlParameter Name="descricao5_vinculada_bb"			ControlID="txtAplicacaoBB5"		PropertyName="Text"			 Type="String" DefaultValue=' ' ConvertEmptyStringToNull="false"/>
                    <asp:ControlParameter Name="valor1_vinculada_bb"				ControlID="DDLAplicVinculadaBB1" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor2_vinculada_bb"				ControlID="DDLAplicVinculadaBB2" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor3_vinculada_bb"				ControlID="DDLAplicVinculadaBB3" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor4_vinculada_bb"				ControlID="DDLAplicVinculadaBB4" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor5_vinculada_bb"				ControlID="DDLAplicVinculadaBB5" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="percentual1_vinculada_bb"			ControlID="txtAplicacaoVincBB1"	 PropertyName="Text"		  Type="Decimal"/>
                    <asp:ControlParameter Name="percentual2_vinculada_bb"			ControlID="txtAplicacaoVincBB2"	 PropertyName="Text"		  Type="Decimal"/>
                    <asp:ControlParameter Name="percentual3_vinculada_bb"			ControlID="txtAplicacaoVincBB3"	 PropertyName="Text"		  Type="Decimal"/>
                    <asp:ControlParameter Name="percentual4_vinculada_bb"			ControlID="txtAplicacaoVincBB4"	 PropertyName="Text"		  Type="Decimal"/>
                    <asp:ControlParameter Name="percentual5_vinculada_bb"			ControlID="txtAplicacaoVincBB5"	 PropertyName="Text"		  Type="Decimal"/>
                    <asp:ControlParameter Name="descricao1_vinculada_cef"			ControlID="txtAplicacaoCEF1"	 PropertyName="Text"		  Type="String" ConvertEmptyStringToNull="False" />
                    <asp:ControlParameter Name="descricao2_vinculada_cef"			ControlID="txtAplicacaoCEF2"	 PropertyName="Text"		  Type="String" ConvertEmptyStringToNull="False" />
                    <asp:ControlParameter Name="descricao3_vinculada_cef"			ControlID="txtAplicacaoCEF3"	 PropertyName="Text"		  Type="String" ConvertEmptyStringToNull="False" />
                    <asp:ControlParameter Name="descricao4_vinculada_cef"			ControlID="txtAplicacaoCEF4"	 PropertyName="Text"		  Type="String" ConvertEmptyStringToNull="False" />
                    <asp:ControlParameter Name="valor1_vinculada_cef"				ControlID="DDLAplicVinculadaCEF1" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor2_vinculada_cef"				ControlID="DDLAplicVinculadaCEF2" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor3_vinculada_cef"				ControlID="DDLAplicVinculadaCEF3" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor4_vinculada_cef"				ControlID="DDLAplicVinculadaCEF4" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="percentual1_vinculada_cef"			ControlID="txtAplicacaoVincCEF1"  PropertyName="Text"		   Type="Decimal"/>
                    <asp:ControlParameter Name="percentual2_vinculada_cef"			ControlID="txtAplicacaoVincCEF2"  PropertyName="Text"		   Type="Decimal"/>
                    <asp:ControlParameter Name="percentual3_vinculada_cef"			ControlID="txtAplicacaoVincCEF3"  PropertyName="Text"		   Type="Decimal"/>
                    <asp:ControlParameter Name="percentual4_vinculada_cef"			ControlID="txtAplicacaoVincCEF4"  PropertyName="Text"		   Type="Decimal"/>
                    <asp:ControlParameter Name="ativo_realizavel"					ControlID="DDLAtivoRealizavel"	  PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="ativo_transitorio"					ControlID="DDLAtivoTransitorio"   PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="ativo_compensado"					ControlID="DDLAtivoCompensado"    PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="mes_anterior"						ControlID="DDLAtivoPermanenteAnterior" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="aquisicao_despesa_de_capital"		ControlID="DDLAquis_Desp_Capital" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outras"								ControlID="DDLAtivo_outras"		  PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="alienacao"							ControlID="DDLAtivo_alienacao"	  PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outros"								ControlID="DDLAtivo_outros"		  PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="receitas_de_capital"				ControlID="DDLReceita_Capital"	  PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="ativo_passivo_permanente"			ControlID="DDLAtivo_passivo_permanente"						PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outras_mutacoes_patrimoniais"		ControlID="DDLAtivo_outras_mutacoes"					    PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="vencimentos_vantagens_fixas_previstas"		ControlID="DDLDespesas_Vencimento_Vantagem_Previsto"	   PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="obrigacoes_patrimoniais_previstas"			ControlID="DDLDespesas_Obrigacoes_patrimoniais_Previsto"   PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="despesas_variaveis_civil_previstas"			ControlID="DDLDespesas_Variaveis_PCivil_Previsto"		   PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="indenizacoes_trabalhistas_previstas"		ControlID="DDLDespesas_Indenizacoes_trabalhistas_Previsto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outras_despesas_correntes_previstas"		ControlID="DDLDespesas_Outras_Correntes_Previsto"          PropertyName="SelectedValue" Type="Decimal"/>




                    <asp:ControlParameter Name="vencimentos_vantagens_fixas_executadas"		ControlID="DDLDespesas_Vencimento_Vantagem" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="obrigacoes_patrimoniais_executadas"			ControlID="DDLDespesas_Obrigacoes_patrimoniais" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="despesas_variaveis_civil_executadas"		ControlID="DDLDespesas_Variaveis_PCivil" PropertyName="SelectedValue" Type="Decimal"/>                        
                    <asp:ControlParameter Name="indenizacoes_trabalhistas_executadas"		ControlID="DDLDespesas_Indenizacoes_trabalhistas" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outras_despesas_correntes_executadas"		ControlID="DDLDespesas_Outras_Correntes" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Investimentos_executadas"					ControlID="DDLDespesas_Investimento" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="inversoes_financeiras_executadas"			ControlID="DDLDespesas_Inversoes_Financeiras" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="amortizacoes_executadas"					ControlID="DDLDespesas_Amortizacoes" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="investimentos_previstas"					ControlID="DDLDespesas_Investimento_Previsto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="inversoes_financeiras_previstas"			ControlID="DDLDespesas_Inversoes_Financeiras_Previsto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="amortizacoes_previstas"						ControlID="DDLDespesas_Amortizacoes_Previsto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outras_despesas_correntes_dp"				ControlID="DDLTotal_DespesasCapital1" PropertyName="SelectedValue" Type="Decimal"/>

                    <asp:ControlParameter Name="mes1"										ControlID="DDLDespCorrenteMes1" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes2"										ControlID="DDLDespCorrenteMes2" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes3"										ControlID="DDLDespCorrenteMes3" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes4"										ControlID="DDLDespCorrenteMes4" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes5"										ControlID="DDLDespCorrenteMes5" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes6"										ControlID="DDLDespCorrenteMes6" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes7"										ControlID="DDLDespCorrenteMes7" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes8"										ControlID="DDLDespCorrenteMes8" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes9"										ControlID="DDLDespCorrenteMes9" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes10"										ControlID="DDLDespCorrenteMes10" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes11"										ControlID="DDLDespCorrenteMes11" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="mes12"										ControlID="DDLDespCorrenteMes0" PropertyName="SelectedItem.Text" Type="String"/>
                    <asp:ControlParameter Name="valor1_media"								ControlID="DDLDespCorrenteValorMes1" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor2_media"								ControlID="DDLDespCorrenteValorMes2" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor3_media"								ControlID="DDLDespCorrenteValorMes3" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor4_media"								ControlID="DDLDespCorrenteValorMes4" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor5_media"								ControlID="DDLDespCorrenteValorMes5" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor6_media"								ControlID="DDLDespCorrenteValorMes6" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor7_media"								ControlID="DDLDespCorrenteValorMes7" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor8_media"								ControlID="DDLDespCorrenteValorMes8" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor9_media"								ControlID="DDLDespCorrenteValorMes9" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor10_media"								ControlID="DDLDespCorrenteValorMes10" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor11_media"								ControlID="DDLDespCorrenteValorMes11" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="valor12_media"								ControlID="DDLDespCorrenteValorMes0" PropertyName="SelectedValue" Type="Decimal"/>

                    <asp:ControlParameter Name="realizavel_transitorio"						ControlID="DDLTotalRealizavelTransitorioAnterior"		   PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="passivo_financeiro_transitorio"				ControlID="DDLTotalPassivoTransitAnterior" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="saldo_ativo_disponivel"						ControlID="DDLTotalSaldoAtivoAnterior" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="exigivel_imediato"							ControlID="DDLPassivo_ExigivelImediato" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="exigivel_mediato"							ControlID="DDLPassivo_ExigivelMediato" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="passivo_transitorio"						ControlID="DDLPassivo_Transitorio" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="passivo_permanente"							ControlID="DDLPassivo_Permanente" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="resultado_periodo"							ControlID="DDLPassivo_ResultadoExercicio" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="passivo_compensado"							ControlID="DDLPassivo_Compensado" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Mutacoes_despesa_capital"					ControlID="DDLDespesas_Capital" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="mutacoes_ativo_passivo_permanente"			ControlID="DDLDespesas_AtivoPassivoPermanente" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="mutacoes_outras_mutacoes_patrimoniais"		ControlID="DDLDespesas_OutrasMutacoesPatrimoniais" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="comunicada_inss_arrecadada"					ControlID="DDLReceitaComunicadaINSS" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Subvencoes_ordinarias_arrecadada"			ControlID="DDLReceitaSubvencoesOrdinarias" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="remessa_fpe_arrecadada"						ControlID="DDLReceitaPSG" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="aplicacao_investimentos_arrecadada"			ControlID="DDLReceitasAplicacaoInvestimentos" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Sistema_Sei_Arrecadada"                     ControlID="DDLReceitas_OutrasContribuicao" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Comunicada_inss_prevista"                   ControlID="DDLReceitaComunicadaINSSPrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Subvencoes_ordinarias_prevista"             ControlID="DDLReceitaSubvencoesOrdinariasPrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="remessa_fpe_prevista"                       ControlID="DDLReceitaPSGPrevista" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Aplicacao_investimentos_prevista"           ControlID="DDLReceitasAplicacaoInvestimentosPrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Sistema_Sei_prevista"                       ControlID="DDLReceitas_OutrasContribuicaoPrevisto" PropertyName="SelectedValue" Type="Decimal"/>

                    <asp:ControlParameter Name="imobiliarias_arrecadada"                    ControlID="DDLReceitaPatrimonialImobiliarias" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Valores_imobiliarias_arrecadada"            ControlID="DDLReceitaPatrimonialValoresImobiliarios" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outras_rec_patrimoniais_arrecadada"         ControlID="DDLReceitaPatrimonialOutras" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="receita_de_servico_arrecadada"              ControlID="DDLReceitaPatrimonialServicos" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outras_receitas_correntes_arrecadada"       ControlID="DDLReceitaPatrimonialOutrasCorrente" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="transferencias_correntes_arrecadada"        ControlID="DDLReceitaPatrimonialTransfCorrentes" PropertyName="SelectedValue" Type="Decimal"/>

                    <asp:ControlParameter Name="imobiliarias_prevista"                      ControlID="DDLReceitaPatrimonialImobiliariasPrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="Valores_imobiliarias_prevista"              ControlID="DDLReceitaPatrimonialValoreslImobiliariosPrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outras_rec_patrimoniais_prevista"           ControlID="DDLReceitaPatrimonialOutrosPrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="receita_de_servico_prevista"                ControlID="DDLReceitaPatrimonialServicosPrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="outras_receitas_correntes_prevista"         ControlID="DDLReceitaPatrimonialOutrasCorrentePrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="transferencias_correntes_prevista"          ControlID="DDLReceitaPatrimonialTransfCorrentesPrevisto" PropertyName="SelectedValue" Type="Decimal"/>                    
                    
                    <asp:ControlParameter Name="operacoes_credito_arrecadada"               ControlID="DDLReceitaCapitalOpCredito" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="alienacao_bens_arrecadada"                  ControlID="DDLReceitaCapitalAlienBens" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="amortizacao_emprestimos_arrecadada"         ControlID="DDLReceitaCapitalAmortEmprest" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="transferencia_capital_arrecadada"           ControlID="DDLReceitaCapitalTransfCapital" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="saldos_exercicios_anteriores"               ControlID="DDLReceitaCapitalSaldoExercAnteriores" PropertyName="SelectedValue" Type="Decimal"/>

                    <asp:ControlParameter Name="operacoes_credito_prevista"                 ControlID="DDLReceitaCapitalOpCreditoPrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="alienacao_bens_prevista"                    ControlID="DDLReceitaCapitalAlienBensPrevisto" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter Name="amortizacao_emprestimos_prevista"           ControlID="DDLReceitaCapitalAmortEmprestPrevisto" PropertyName="SelectedValue" Type="Decimal"/>                    
                    <asp:ControlParameter Name="transferencia_capital_prevista"             ControlID="DDLReceitaCapitalTransfCapitalPrevisto" PropertyName="SelectedValue" Type="Decimal"/>                             
                    <asp:ControlParameter Name="saldo_exercicios_anteriores_prevista"       ControlID="DDLReceitaCapitalSaldoExercAnterioresPrevisto" PropertyName="SelectedValue" Type="Decimal"/>                       

                    <asp:ControlParameter Name="receita_prevista_total"                     ControlID="DDLReceitaTotalExercicioPrevista" PropertyName="SelectedValue" Type="Decimal"/>                                                     
</InsertParameters>

            </asp:SqlDataSource>
            <br />
            <br />
        </asp:Panel>
      </td></tr></tbody></table>
    </div>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </form>
</body>
<script language="JavaScript">
function abrirURL(URL) {

  var width = 150;
  var height = 250;

  var left = 99;
  var top = 99;

  window.open(URL,'janela', 'width='+width+', height='+height+', top='+top+', left='+left+', scrollbars=yes, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no');

}
</script>
</html>
