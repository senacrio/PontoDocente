<%@ Page Language="VB" AutoEventWireup="false" CodeFile="promocoes.aspx.vb" Inherits="Promocoes" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 82%;
            height: 85px;
        }
        .style2
        {
            height: 433px;
        }
        .style3
        {
            height: 53px;
        }
        .style4
        {
            width: 84px;
        }
        .style6
        {
            width: 135px;
        }
        .style7
        {
            width: 95px;
        }
        .style8
        {
            width: 86px;
        }
        .style9
        {
            width: 79px;
        }
        .style11
        {
            width: 189px;
        }
        .style12
        {
            width: 107px;
        }
        .style13
        {
            width: 205px;
        }
        .style14
        {
            width: 124px;
        }
        .style15
        {
            width: 619px;
        }
        .style17
        {
            width: 56px;
        }
        .style18
        {
            width: 99px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                </td>
                <td class="style2" bgcolor="White">
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="X-Large" 
                        Text="Promoção Pratique Senac" BackColor="White" 
                        BorderColor="#990000"></asp:Label>
                    <br />
                    <asp:Menu ID="Menu1" runat="server" Height="37px" 
                        Orientation="Horizontal" Width="443px">
                        <Items>
                            <asp:MenuItem Text="[Visão dos Grupos]  " Value="0"></asp:MenuItem>
                            <asp:MenuItem Text="[Visão das Inscrições]" Value="1"></asp:MenuItem>
                            <asp:MenuItem Text="[Relatório]" Value="2"></asp:MenuItem>
                        </Items>
                    </asp:Menu>
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <br />
                            <asp:SqlDataSource ID="sdsfiltrouo" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                
                                
                                
                                
                                SelectCommand="SELECT ' TODAS UNIDADE SENAC RIO' AS uo, ' TODAS UNIDADES SENAC RIO' AS sigla UNION ALL SELECT UO, SIGLA FROM SGA01Q01 WHERE (FECHAMENTO IS NULL) ORDER BY sigla">
                            </asp:SqlDataSource>
                            <table class="style1">
                                <tr>
                                    <td class="style17">
                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="UO : "></asp:Label>
                                    </td>
                                    <td class="style9">
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsfiltrouo" 
                                            DataTextField="sigla" DataValueField="uo">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style18">
                                        <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="  Abertura de :"></asp:Label>
                                    </td>
                                    <td class="style15">
                                        <asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="82px"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                            TargetControlID="TextBox2"></ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        <asp:Label runat="server" Font-Bold="True" Text="Oferta :"></asp:Label>
                                    </td>
                                    <td class="style9">
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sdsoferta" 
                                            DataTextField="OFERTA" DataValueField="OFERTA">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style18">
                                        <asp:Label ID="Label22" runat="server" EnableTheming="False" Font-Bold="True" 
                                            Text="  Até : "></asp:Label>
                                    </td>
                                    <td class="style15">
                                        <asp:TextBox ID="TextBox3" runat="server" Height="20px" Width="82px"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" 
                                            TargetControlID="TextBox3"></ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        <asp:Button ID="brnfiltrar" runat="server" Font-Bold="True" Text="Filtrar" />
                                    </td>
                                    <td class="style9">
                                        &nbsp;</td>
                                    <td class="style18">
                                        &nbsp;</td>
                                    <td class="style15">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style17">
                                        &nbsp;</td>
                                    <td class="style9">
                                        &nbsp;</td>
                                    <td class="style18">
                                        &nbsp;</td>
                                    <td class="style15">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <asp:SqlDataSource ID="sdsoferta" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                SelectCommand="SELECT '  TODAS OFERTAS SENAC' AS oferta UNION SELECT OFERTA FROM SGA03Q01 ORDER BY OFERTA"></asp:SqlDataSource>
                            <asp:ScriptManager ID="ScriptManager1" runat="server" 
                                EnableScriptGlobalization="True">
                            </asp:ScriptManager>
                            <br />
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="GRUPOS"></asp:Label>
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sdsresultado" 
                                PageSize="20">
                                <Columns>
                                    <asp:CommandField ButtonType="Button" SelectText="Inscrições" 
                                        ShowSelectButton="True" />
                                    <asp:BoundField DataField="UO" HeaderText="UO" SortExpression="UO" />
                                    <asp:BoundField DataField="sigla" HeaderText="SIGLA" SortExpression="sigla">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OFERTA" HeaderText="OFERTA" 
                                        SortExpression="OFERTA" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GRUPO" HeaderText="GRUPO" SortExpression="GRUPO" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PRECO" HeaderText="PRECO" SortExpression="PRECO" 
                                        DataFormatString="{0:n}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PARCELA" HeaderText="PARCELA" 
                                        SortExpression="PARCELA" DataFormatString="{0:n}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PARCELAMENTO" HeaderText="PARCELAMENTO" 
                                        SortExpression="PARCELAMENTO" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TURNO" HeaderText="TURNO" SortExpression="TURNO" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DIAS" HeaderText="DIAS" SortExpression="DIAS" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ABERTURA" HeaderText="ABERTURA" 
                                        SortExpression="ABERTURA" DataFormatString="{0:d}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="inicio" HeaderText="INICIO" SortExpression="inicio" 
                                        DataFormatString="{0:d}">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fim" DataFormatString="{0:d}" HeaderText="FIM" 
                                        SortExpression="fim">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="obs" HeaderText="OBS PDV" SortExpression="obs">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <br />
                            <br />
                            <table class="style1">
                                <tr>
                                    <td class="style8">
                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Promoção :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList4" runat="server" 
                                            DataSourceID="SqlDataSource1" DataTextField="CODIGO" DataValueField="CODIGO">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                            SelectCommand="SELECT ' TODAS' AS codigo UNION SELECT ' TODAS - PRATIQUE SENAC' AS CODIGO UNION SELECT CODIGO FROM SGA08Q03 WHERE (CODIGO LIKE 'PRATIQUE%') AND (UO = '049') ORDER BY CODIGO"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style8">
                                        <asp:Button ID="brnfiltrar2" runat="server" Font-Bold="True" Text="Filtrar" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="INSCRIÇÕES" 
                                Visible="False"></asp:Label>
                            <br />
                            <br />
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sds08q02" 
                                PageSize="20">
                                <Columns>
                                    <asp:BoundField DataField="UO" HeaderText="UO" SortExpression="UO" />
                                    <asp:BoundField DataField="OFERTA" HeaderText="OFERTA" 
                                        SortExpression="OFERTA" />
                                    <asp:BoundField DataField="GRUPO" HeaderText="GRUPO" SortExpression="GRUPO" />
                                    <asp:BoundField DataField="CLIENTE" HeaderText="CLIENTE" 
                                        SortExpression="CLIENTE" />
                                    <asp:BoundField DataField="PRECO" HeaderText="PRECO" SortExpression="PRECO" 
                                        DataFormatString="{0:n}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PROMOCAO" HeaderText="PROMOCAO" 
                                        SortExpression="PROMOCAO" DataFormatString="{0:n}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="VALOR_COBRADO" HeaderText="VALOR_COBRADO" 
                                        SortExpression="VALOR_COBRADO" DataFormatString="{0:n}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CODIGO_PROMOCAO" HeaderText="CODIGO_PROMOCAO" 
                                        SortExpression="CODIGO_PROMOCAO" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <br />
                            <asp:SqlDataSource ID="sdsresultado" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                SelectCommand="SELECT UO, sigla, OFERTA, NOME, GRUPO, PRECO, PARCELA, PARCELAMENTO, TURNO, DIAS, ABERTURA, inicio, fim, obs FROM promo WHERE (OFERTA LIKE @oferta) AND (UO LIKE @uo) AND (ABERTURA BETWEEN @dataini AND @datafim) OR (OFERTA LIKE @oferta) AND (ABERTURA BETWEEN @dataini AND @datafim) AND (@uo2 LIKE ' TODAS UNI%') OR (UO LIKE @uo) AND (ABERTURA BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') OR (ABERTURA BETWEEN @dataini AND @datafim) AND (@uo2 LIKE ' TODAS UNI%') AND (@oferta2 LIKE '  TODAS OF%') ORDER BY UO, OFERTA, GRUPO">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="uo" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList1" Name="uo2" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="uo3" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="oferta" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList3" Name="oferta2" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList3" Name="oferta3" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="TextBox2" Name="dataini" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="TextBox3" Name="datafim" PropertyName="Text" 
                                        Type="DateTime" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:SqlDataSource ID="sds08q02" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                
                                SelectCommand="SELECT a.UO, a.OFERTA, a.GRUPO, a.CLIENTE, a.PRECO, a.ACRESCIMO, a.DESCONTO, a.PROMOCAO, a.VALOR_COBRADO, a.CODIGO_PROMOCAO FROM promoinsc AS a INNER JOIN promo AS b ON a.UO = b.UO AND a.OFERTA = b.OFERTA AND a.GRUPO = b.GRUPO WHERE (a.UO LIKE @uo) AND (a.OFERTA LIKE @oferta) AND (a.CODIGO_PROMOCAO = @promocao) AND (a.GRUPO = @grupo) OR (a.UO LIKE @uo) AND (a.OFERTA LIKE @oferta) AND (a.GRUPO = @grupo) AND (@promocao2 = ' TODAS') OR (a.UO LIKE @uo) AND (a.OFERTA LIKE @oferta) AND (a.CODIGO_PROMOCAO LIKE 'PRAT%') AND (a.GRUPO = @grupo) AND (@promocao3 LIKE ' TODAS - %') ORDER BY a.UO, a.OFERTA, a.CODIGO_PROMOCAO">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label4" DefaultValue="" Name="uo" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="Label5" DefaultValue="" Name="oferta" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="Label3" Name="grupo" PropertyName="Text" 
                                        DefaultValue="" />
                                    <asp:ControlParameter ControlID="DropDownList4" DefaultValue="%" 
                                        Name="promocao" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList4" Name="promocao2" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList4" Name="promocao3" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                        </asp:View>
                         <asp:View ID="View2" runat="server" EnableTheming="True">
                            <br />
                            <br />
                            <asp:SqlDataSource ID="sdsfiltrouo0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                
                                
                                
                                
                                 
                                 SelectCommand="SELECT ' TODAS UNIDADE SENAC RIO' AS uo, ' TODAS UNIDADES SENAC RIO' AS sigla UNION ALL SELECT UO, SIGLA FROM SGA01Q01 WHERE (FECHAMENTO IS NULL) ORDER BY sigla">
                            </asp:SqlDataSource>
                            <table class="style1">
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="UO : "></asp:Label>
                                    </td>
                                    <td class="style11">
                                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="sdsfiltrouo0" 
                                            DataTextField="SIGLA" DataValueField="UO">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style12">
                                        <asp:Label ID="Label23" runat="server" Font-Bold="True" 
                                            Text="  Inscrições de :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" runat="server" Height="20px" Width="82px"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" 
                                            TargetControlID="TextBox4"></ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="Oferta :"></asp:Label>
                                    </td>
                                    <td class="style11">
                                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="sdsoferta0" 
                                            DataTextField="OFERTA" DataValueField="OFERTA">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style12">
                                        <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="  Até :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" runat="server" Height="20px" Width="82px"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" 
                                            TargetControlID="TextBox5"></ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Promoção :"></asp:Label>
                                    </td>
                                    <td class="style11">
                                        <asp:DropDownList ID="DropDownList7" runat="server" 
                                            DataSourceID="SqlDataSource2" DataTextField="CODIGO" DataValueField="CODIGO">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style12">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Button ID="brnfiltrar0" runat="server" Font-Bold="True" Text="Filtrar" />
                                    </td>
                                    <td class="style11">
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" SelectCommand="select ' TODAS'  as codigo union
select ' TODAS - PRATIQUE SENAC' AS CODIGO UNION
SELECT [CODIGO] FROM [SGA08Q03]
where codigo like  'PRATIQUE%'  
ORDER BY CODIGO "></asp:SqlDataSource>
                                    </td>
                                    <td class="style12">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <asp:SqlDataSource ID="sdsoferta0" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                 SelectCommand="SELECT '  TODAS OFERTAS SENAC' AS oferta UNION SELECT OFERTA FROM SGA03Q01 ORDER BY OFERTA"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsisncricoes" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                
                                
                                
                                 
                                 SelectCommand="SELECT UO, SIGLA, OFERTA, NOME, GRUPO, CLIENTE, PRECO, PROMOCAO, VALOR_COBRADO, CODIGO_PROMOCAO, PROMOCAO_OBS, precocad, PARCELA, PARCELAMENTO, TURNO, DIAS, ABERTURA, confirmacao AS INSCRICAO, OBS FROM promotot WHERE (UO LIKE @uo) AND (OFERTA LIKE @oferta) AND (CODIGO_PROMOCAO = @promocao) AND (confirmacao BETWEEN @dataini AND @datafim) OR (UO LIKE @uo) AND (CODIGO_PROMOCAO = @promocao) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') OR (OFERTA LIKE @oferta) AND (CODIGO_PROMOCAO = @promocao) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@uo2 LIKE ' TODAS UNI%') OR (CODIGO_PROMOCAO = @promocao) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@uo2 LIKE ' TODAS UNI%') OR (UO LIKE @uo) AND (OFERTA LIKE @oferta) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@promocao2 = ' TODAS') OR (UO LIKE @uo) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@promocao2 = ' TODAS') OR (OFERTA LIKE @oferta) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@uo2 LIKE ' TODAS UNI%') AND (@promocao2 = ' TODAS') OR (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@uo2 LIKE ' TODAS UNI%') AND (@promocao2 = ' TODAS') OR (UO LIKE @uo) AND (OFERTA LIKE @oferta) AND (CODIGO_PROMOCAO LIKE 'PRAT%') AND (confirmacao BETWEEN @dataini AND @datafim) AND (@promocao3 LIKE ' TODAS - %') OR (UO LIKE @uo) AND (CODIGO_PROMOCAO LIKE 'PRAT%') AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@promocao3 LIKE ' TODAS - %') OR (OFERTA LIKE @oferta) AND (CODIGO_PROMOCAO LIKE 'PRAT%') AND (confirmacao BETWEEN @dataini AND @datafim) AND (@uo2 LIKE ' TODAS UNI%') AND (@promocao3 LIKE ' TODAS - %') OR (CODIGO_PROMOCAO LIKE 'PRAT%') AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@uo2 LIKE ' TODAS UNI%') AND (@promocao3 LIKE ' TODAS - %') ORDER BY UO, OFERTA, CODIGO_PROMOCAO">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList5" DefaultValue="" Name="uo" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList5" Name="uo2" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList5" Name="uo3" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList6" DefaultValue="" Name="oferta" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList6" Name="oferta2" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList6" Name="oferta3" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList7" DefaultValue="" 
                                        Name="promocao" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList7" DefaultValue="" Name="promocao2" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList7" Name="promocao3" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="TextBox4" Name="dataini" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="TextBox5" Name="datafim" PropertyName="Text" 
                                        Type="DateTime" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="INSCRIÇÕES"></asp:Label>
                            <br />
                            <br />
                            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataSourceID="sdsisncricoes" PageSize="20" 
                                AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="UO" HeaderText="UO" SortExpression="UO" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SIGLA" HeaderText="SIGLA" SortExpression="SIGLA">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OFERTA" HeaderText="OFERTA" 
                                        SortExpression="OFERTA" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nome" HeaderText="NOME OFERTA" 
                                        SortExpression="nome" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GRUPO" HeaderText="GRUPO" 
                                        SortExpression="GRUPO" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CLIENTE" HeaderText="CLIENTE" 
                                        SortExpression="CLIENTE" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PRECO" HeaderText="PRECO" 
                                        SortExpression="PRECO" DataFormatString="{0:n}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PROMOCAO" HeaderText="PROMOÇÃO" 
                                        SortExpression="PROMOCAO" DataFormatString="{0:n}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="VALOR_COBRADO" HeaderText="VALOR_COBRADO" 
                                        SortExpression="VALOR_COBRADO" DataFormatString="{0:n}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CODIGO_PROMOCAO" HeaderText="CÓDIGO_PROMOÇÃO" 
                                        SortExpression="CODIGO_PROMOCAO" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PROMOCAO_OBS" 
                                        HeaderText="PROMOÇÃO_OBS" SortExpression="PROMOCAO_OBS">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="precocad" HeaderText="PREÇO CAD" 
                                        SortExpression="precocad" DataFormatString="{0:n}">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PARCELA" DataFormatString="{0:n}" 
                                        HeaderText="PARCELA" SortExpression="PARCELA">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PARCELAMENTO" HeaderText="PARCELAMENTO" 
                                        SortExpression="PARCELAMENTO" DataFormatString="{0:n}">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TURNO" HeaderText="TURNO" SortExpression="TURNO">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DIAS" HeaderText="DIAS" 
                                        SortExpression="DIAS">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ABERTURA" HeaderText="ABERTURA" 
                                        SortExpression="ABERTURA" DataFormatString="{0:d}" >
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="INSCRICAO" HeaderText="INSCRIÇÃO" 
                                        SortExpression="INSCRICAO" DataFormatString="{0:d}">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OBS" HeaderText="OBS" SortExpression="OBS">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <br />
                            <br />
                            <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="TOTAIS"></asp:Label>
                            <br />
                            <br />
                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSource3">
                                <Columns>
                                    <asp:BoundField DataField="Expr1" DataFormatString="{0:n}" 
                                        HeaderText="Total Valor Cobrado" ReadOnly="True" SortExpression="Expr1">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Expr2" DataFormatString="{0:n}" 
                                        HeaderText="Total Preço" ReadOnly="True" SortExpression="Expr2">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Expr3" DataFormatString="{0:n}" 
                                        HeaderText="Total Promoção" ReadOnly="True" SortExpression="Expr3">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Expr4" HeaderText="Total Cliente" 
                                        ReadOnly="True" SortExpression="Expr4" DataFormatString="{0:n}" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                
                                
                                
                                 
                                 
                                 SelectCommand="SELECT SUM(VALOR_COBRADO) AS Expr1, SUM(PRECO) AS Expr2, SUM(PROMOCAO) AS Expr3, COUNT(CLIENTE) AS Expr4, COUNT(UO) AS Expr5, COUNT(OFERTA) AS Expr6 FROM promotot WHERE (UO LIKE @uo) AND (OFERTA LIKE @oferta) AND (CODIGO_PROMOCAO = @promocao) AND (confirmacao BETWEEN @dataini AND @datafim) OR (UO LIKE @uo) AND (CODIGO_PROMOCAO = @promocao) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') OR (OFERTA LIKE @oferta) AND (CODIGO_PROMOCAO = @promocao) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@uo2 LIKE ' TODAS UNI%') OR (CODIGO_PROMOCAO = @promocao) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@uo2 LIKE ' TODAS UNI%') OR (UO LIKE @uo) AND (OFERTA LIKE @oferta) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@promocao2 = ' TODAS') OR (UO LIKE @uo) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@promocao2 = ' TODAS') OR (OFERTA LIKE @oferta) AND (confirmacao BETWEEN @dataini AND @datafim) AND (@uo2 LIKE ' TODAS UNI%') AND (@promocao2 = ' TODAS') OR (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@uo2 LIKE ' TODAS UNI%') AND (@promocao2 = ' TODAS') OR (UO LIKE @uo) AND (OFERTA LIKE @oferta) AND (CODIGO_PROMOCAO LIKE 'PRAT%') AND (confirmacao BETWEEN @dataini AND @datafim) AND (@promocao3 LIKE ' TODAS - %') OR (UO LIKE @uo) AND (CODIGO_PROMOCAO LIKE 'PRAT%') AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@promocao3 LIKE ' TODAS - %') OR (OFERTA LIKE @oferta) AND (CODIGO_PROMOCAO LIKE 'PRAT%') AND (confirmacao BETWEEN @dataini AND @datafim) AND (@uo2 LIKE ' TODAS UNI%') AND (@promocao3 LIKE ' TODAS - %') OR (CODIGO_PROMOCAO LIKE 'PRAT%') AND (confirmacao BETWEEN @dataini AND @datafim) AND (@oferta2 LIKE '  TODAS OF%') AND (@uo2 LIKE ' TODAS UNI%') AND (@promocao3 LIKE ' TODAS - %')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList5" DefaultValue="%" Name="uo" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList5" Name="uo2" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList5" Name="uo3" 
                                        PropertyName="SelectedValue" DefaultValue="" />
                                    <asp:ControlParameter ControlID="DropDownList6" DefaultValue="%" Name="oferta" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList6" Name="oferta2" 
                                        PropertyName="SelectedValue" DefaultValue="" />
                                    <asp:ControlParameter ControlID="DropDownList6" DefaultValue="" Name="oferta3" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList7" DefaultValue="%" 
                                        Name="promocao" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownList7" Name="promocao2" 
                                        PropertyName="SelectedValue" DefaultValue="" />
                                    <asp:ControlParameter ControlID="DropDownList7" DefaultValue="" 
                                        Name="promocao3" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="TextBox4" DefaultValue="" Name="dataini" 
                                        PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="TextBox5" Name="datafim" PropertyName="Text" 
                                        Type="DateTime" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <br />
                            <br />
                            <br />
                        </asp:View>
                        <br />
                        <asp:View ID="View3" runat="server">
                            <br />
                            <br />
                            <asp:Label ID="Label17" runat="server" Font-Bold="True" 
                                Text="Relatório de Inscrições"></asp:Label>
                            <br />
                            <br />
                            <br />
                            <table class="style1" width="100%">
                                <tr>
                                    <td class="style7">
                                        <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="UO : "></asp:Label>
                                    </td>
                                    <td class="style13">
                                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="sdsfiltrouo1" 
                                            DataTextField="uo" DataValueField="sigla">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sdsfiltrouo1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                            
                                            
                                            
                                            
                                            
                                            
                                            SelectCommand="SELECT ' TODAS UNIDADE SENAC RIO' AS uo, '0' AS sigla UNION ALL SELECT UO, SIGLA FROM SGA01Q01 WHERE (FECHAMENTO IS NULL) ORDER BY sigla">
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style14">
                                        <asp:Label ID="Label25" runat="server" Font-Bold="True" 
                                            Text="  Inscrições de :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" runat="server" Height="20px" Width="82px"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="TextBox6_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="TextBox6">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Oferta :"></asp:Label>
                                    </td>
                                    <td class="style13">
                                        <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="sdsoferta1" 
                                            DataTextField="oferta" DataValueField="cod">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sdsoferta1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                            
                                            SelectCommand="SELECT '  TODAS OFERTAS SENAC' AS oferta, '0' AS cod UNION SELECT OFERTA, OFERTA AS cod FROM SGA03Q01 ORDER BY OFERTA"></asp:SqlDataSource>
                                    </td>
                                    <td class="style14">
                                        <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="  Até :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox7" runat="server" Height="20px" Width="82px"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="TextBox7_CalendarExtender" runat="server" 
                                            TargetControlID="TextBox7"></ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Promoção :"></asp:Label>
                                    </td>
                                    <td class="style13">
                                        <asp:DropDownList ID="DropDownList10" runat="server" 
                                            DataSourceID="SqlDataSource4" DataTextField="codigo" DataValueField="COD">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="style14">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <asp:Button ID="brnfiltrar1" runat="server" Font-Bold="True" Text="Filtrar" />
                                    </td>
                                    <td class="style13">
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SGA00ConnectionString %>" 
                                            
                                            SelectCommand="SELECT ' TODAS' AS codigo,'%' AS COD UNION SELECT ' TODAS - PRATIQUE SENAC' AS CODIGO,'PRATIQUE%' AS COD UNION SELECT CODIGO,CODIGO AS COD FROM SGA08Q03 WHERE (CODIGO LIKE 'PRATIQUE%') ORDER BY CODIGO"></asp:SqlDataSource>
                                    </td>
                                    <td class="style14">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
                                Font-Size="8pt" Height="606px" Width="1233px">
                                <LocalReport ReportPath="AgarreSuaChance\Report1.rdlc">
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                                            Name="DataSet2_promotot" />
                                    </DataSources>
                                </LocalReport>
                            </rsweb:ReportViewer>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                TypeName="DataSet2TableAdapters.promototTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList10" Name="promocao" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter Name="dataini" ControlID="TextBox6" Type="DateTime" />
                                    <asp:ControlParameter Name="datafim" ControlID="TextBox7" Type="DateTime" />
                                    <asp:ControlParameter ControlID="DropDownList8" Name="uo" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList9" Name="oferta" 
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <br />
                        </asp:View>
                        <br />
                    </asp:MultiView>
                    <br />
                    <table class="style1">
                        <tr>
                            <td class="style4">
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <table class="style1">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="style2">
                </td>
            </tr>
            <tr>
                <td class="style3">
                    </td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style3">
                    </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <p>
        &nbsp;</p>
    </form>
</body>
</html>
