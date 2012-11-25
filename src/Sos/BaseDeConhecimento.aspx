<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BaseDeConhecimento.aspx.vb" Inherits="Sos_BaseDeConhecimento" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Aba.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
            font-family: Verdana;
            font-size: x-small;
        }
        .style2
        {
            width: 121px;
            text-align: right;
        }
        .style3
        {
            width: 301px;
        }
        .style4
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: bold;
            width: 85px;
        }
        .style5
        {
            width: 108px;
        }
        .style14
        {
            width: 100%;
        }
        .style15
        {
            width: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span style="color: black; font-family: Arial; font-weight: bold;">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"
                Text="Base de conhecimento"></asp:Label>
        <br />
        </span>
    
       
        <br />
        
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewPesquisa" runat="server">
                <br />
                <asp:Panel ID="Panel1" runat="server" GroupingText="Consulta" Width="526px" 
                    style="font-family: Verdana; font-size: x-small">
                    <table class="style1">
                        <tr>
                            <td class="style2">
                                Grupo de serviço:</td>
                            <td class="style3">
                                <asp:DropDownList ID="ddlGrupoServico" runat="server" 
                                    DataSourceID="sdsGrupoServico" DataTextField="Nome" 
                                    DataValueField="IDGrupoServico" 
                                    style="margin-left: 0px; font-family: Verdana; font-size: x-small;" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td rowspan="4" valign="top">
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    ImageUrl="~/Icones/botao_filtrar.png" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Serviço:</td>
                            <td class="style3">
                                <asp:DropDownList ID="ddlServico" runat="server" DataSourceID="sdsServico" 
                                    DataTextField="Nome" DataValueField="IDServico" Width="200px" 
                                    style="font-family: Verdana; font-size: x-small">
                                    <asp:ListItem>SELECIONE UM SERVIÇO</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Problema:</td>
                            <td class="style3">
                                <asp:TextBox ID="txtProblemaC" runat="server" Width="290px" 
                                    style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                &nbsp;<asp:Button ID="Button2" runat="server" Text="Novo" 
                    style="font-family: Verdana; font-size: x-small" />
                <br />
                <br />
                <div class="conteudo">
                <asp:Label ID="lblErro" runat="server" Font-Names="Arial" Font-Size="Small" 
                    ForeColor="Red" style="font-family: Verdana; font-size: x-small"></asp:Label>
                <br />
                <asp:GridView ID="grdBase" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BorderColor="Silver" 
                    BorderStyle="Solid" BorderWidth="1px" CellPadding="2" 
                    DataKeyNames="IDBaseDeConhecimento" DataSourceID="sdsBaseDeConhecimento" 
                    Font-Names="Arial" Font-Size="Small" ForeColor="#333333" GridLines="None" 
                    PageSize="20" 
                    style="text-align: left; font-family: Verdana; font-size: x-small;" 
                    Width="1048px">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EmptyDataRowStyle BorderColor="White" BorderStyle="Solid" BorderWidth="1px" 
                        ForeColor="Black" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EmptyDataTemplate>
                        <br />
                        Não existem Informações cadastradas.<br />
                        <br />
                    </EmptyDataTemplate>
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" 
                            SelectImageUrl="~/Icones/grid_selecionar.gif" SelectText="Selecionar" 
                            ShowSelectButton="True" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" 
                                    CommandArgument='<%# Bind("IDBaseDeConhecimento") %>' CommandName="editar" 
                                    ImageUrl="~/Icones/editar.jpg" onclick="ImageButton3_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Problema" HeaderText="Problema" 
                            SortExpression="Problema" />
                        <asp:BoundField DataField="Solucao" HeaderText="Solucao" 
                            SortExpression="Solucao" />
                        <asp:BoundField DataField="nomeServico" HeaderText="Serviço" 
                            SortExpression="nomeServico" />
                        <asp:BoundField DataField="nomeGrupoServico" HeaderText="Grupo de Serviço" 
                            SortExpression="nomeGrupoServico" />
                        <asp:BoundField DataField="QtdUso" HeaderText="Uso" SortExpression="QtdUso" />
                        <asp:TemplateField HeaderText="Usou?">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" 
                                    CommandArgument='<%# Bind("IDBaseDeConhecimento") %>' 
                                    ImageUrl="~/Icones/Standard/001_18.gif" onclick="ImageButton2_Click" />
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="SteelBlue" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="SteelBlue" BorderColor="Gray" BorderStyle="Solid" 
                        BorderWidth="1px" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                        BorderWidth="1px" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsBaseDeConhecimento" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    SelectCommand="SELECT sosBaseDeConhecimento.IDBaseDeConhecimento, sosBaseDeConhecimento.Problema, sosBaseDeConhecimento.Solucao, sosBaseDeConhecimento.QtdUso, sosServico.Nome AS nomeServico, sosGrupoServico.Nome AS nomeGrupoServico FROM sosBaseDeConhecimento INNER JOIN sosServico ON sosBaseDeConhecimento.IDServico = sosServico.IDServico INNER JOIN sosGrupoServico ON sosBaseDeConhecimento.IDGrupoServico = sosGrupoServico.IDGrupoServico WHERE (sosBaseDeConhecimento.Problema LIKE + '%' + @problema + '%') AND (CAST(sosBaseDeConhecimento.IDServico AS varchar) LIKE '%' + @IDServico + '%') AND (CAST(sosBaseDeConhecimento.IDGrupoServico AS varchar) LIKE '%' + @IDGrupoServico + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlServico" DefaultValue="%" Name="IDServico" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlGrupoServico" DefaultValue="%" 
                            Name="IDGrupoServico" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtProblemaC" DefaultValue="%" Name="problema" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsGrupoServico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" SelectCommand="SELECT * FROM sosGrupoServico
WHERE (Ativo=1)
UNION
SELECT NULL,'SELECIONE UM GRUPO','',NULL "></asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsServico" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" SelectCommand="SELECT * FROM [sosServico]
WHERE (Ativo=1)
UNION
SELECT NULL,'SELECIONE UM SERVIÇO','' ,'',NULL"></asp:SqlDataSource>
                <br />
            </asp:View>
            <asp:View ID="View1" runat="server">
                <table class="style14">
                    <tr>
                        <td class="style15">
                            <asp:ImageButton ID="ImageButton9" runat="server" CausesValidation="False" 
                                ImageUrl="~/Icones/voltar.jpg" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="Label9" runat="server" 
                                style="font-family: Verdana; font-size: x-small" Text="Voltar "></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="IDBaseDeConhecimento" DataSourceID="sdsDetalhesBase" 
                    GridLines="None" Height="50px" Width="1000px" 
                    style="font-family: Verdana; font-size: x-small">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style4" valign="top">
                                            Problema:</td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Problema") %>'></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4" valign="top">
                                            Solução:</td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Solucao") %>'></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4" valign="top">
                                            Qtd Uso:</td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("QtdUso") %>'></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4" valign="top">
                                            Grupo Serviço:</td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("nomeGrupoServico") %>'></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4" valign="top">
                                            Serviço:</td>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Nome") %>'></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <br />
                <asp:SqlDataSource ID="sdsDetalhesBase" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    SelectCommand="SELECT sosBaseDeConhecimento.IDBaseDeConhecimento, sosBaseDeConhecimento.Problema, sosBaseDeConhecimento.Solucao, sosBaseDeConhecimento.QtdUso, sosServico.Nome, sosGrupoServico.Nome AS nomeGrupoServico FROM sosBaseDeConhecimento INNER JOIN sosServico ON sosBaseDeConhecimento.IDServico = sosServico.IDServico INNER JOIN sosGrupoServico ON sosBaseDeConhecimento.IDGrupoServico = sosGrupoServico.IDGrupoServico WHERE (sosBaseDeConhecimento.IDBaseDeConhecimento = @IDBaseDeconhecimento)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdBase" Name="IDBaseDeconhecimento" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                <span style="color: black; font-family: Arial; font-weight: bold;">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="Medium" Text="Cadastro Base de Conhecimento" Visible="False"></asp:Label>
                <br />
                </span>
                <table class="style14">
                    <tr>
                        <td class="style15">
                            <asp:ImageButton ID="ImageButton10" runat="server" CausesValidation="False" 
                                ImageUrl="~/Icones/voltar.jpg" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="Label10" runat="server" 
                                style="font-family: Verdana; font-size: x-small" Text="Voltar "></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <table class="style1">
                    <tr>
                        <td class="style5" valign="top">
                            Grupo de Serviço:</td>
                        <td>
                            <asp:DropDownList ID="cboIDGrupoServico" runat="server" AutoPostBack="True" 
                                DataSourceID="sdsGrupoServicoInc" DataTextField="Nome" 
                                DataValueField="IDGrupoServico" Width="200px" 
                                style="font-family: Verdana; font-size: x-small">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Serviço:</td>
                        <td>
                            <asp:DropDownList ID="cboIDServico" runat="server" 
                                DataSourceID="sdsServicoInc" DataTextField="Nome" DataValueField="IDServico" 
                                Width="200px" style="font-family: Verdana; font-size: x-small">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" valign="top">
                            Problema:</td>
                        <td>
                            <asp:TextBox ID="txtProblema" runat="server" Height="200px" 
                                TextMode="MultiLine" Width="350px" 
                                style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" valign="top">
                            Solução:</td>
                        <td>
                            <asp:TextBox ID="txtSolucao" runat="server" Height="200px" TextMode="MultiLine" 
                                Width="350px" style="font-family: Verdana; font-size: x-small"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="btnSalvar0" runat="server" 
                                ImageUrl="~/Icones/001_03.gif" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="sdsGrupoServicoInc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" SelectCommand="SELECT * FROM sosGrupoServico WHERE (Ativo=1)
"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsServicoInc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    
                    
                    
                    SelectCommand="SELECT IDServico, Nome, Descricao, IDGrupoServico FROM sosServico WHERE (IDGrupoServico = @IDGrupoServico) and (Ativo=1)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboIDGrupoServico" Name="IDGrupoServico" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsBaseDeConhecimentoInc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                    DeleteCommand="DELETE FROM [sosBaseDeConhecimento] WHERE [IDBaseDeConhecimento] = @IDBaseDeConhecimento" 
                    InsertCommand="INSERT INTO sosBaseDeConhecimento(Problema, Solucao, QtdUso, IDServico, IDGrupoServico, IDRegistrador) VALUES (@Problema, @Solucao, @QtdUso, @IDServico, @IDGrupoServico, @IDRegistrador)" 
                    SelectCommand="SELECT IDBaseDeConhecimento, Problema, Solucao, QtdUso, IDServico, IDGrupoServico FROM sosBaseDeConhecimento WHERE (IDBaseDeConhecimento = @IDBasedeConhecimento)" 
                    
                    
                    UpdateCommand="UPDATE [sosBaseDeConhecimento] SET [Problema] = @Problema, [Solucao] = @Solucao, [QtdUso] = qtduso, [IDServico] = @IDServico, [IDGrupoServico] = @IDGrupoServico WHERE [IDBaseDeConhecimento] = @IDBaseDeConhecimento">
                    <SelectParameters>
                        <asp:SessionParameter Name="IDBasedeConhecimento" 
                            SessionField="idbasedeconhecimento" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="IDBaseDeConhecimento" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtProblema" Name="Problema" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtSolucao" Name="Solucao" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="cboIDServico" Name="IDServico" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="cboIDGrupoServico" Name="IDGrupoServico" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:SessionParameter Name="IDBaseDeConhecimento" 
                            SessionField="idbasedeconhecimento" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtProblema" Name="Problema" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtSolucao" Name="Solucao" PropertyName="Text" 
                            Type="String" />
                        <asp:Parameter DefaultValue="0" Name="QtdUso" Type="Int32" />
                        <asp:ControlParameter ControlID="cboIDServico" DefaultValue="" 
                            Name="IDServico" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="cboIDGrupoServico" Name="IDGrupoServico" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:SessionParameter Name="IDRegistrador" SessionField="c_Matricula" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                
                
                
            </asp:View>
            <br />
            <br />
            <br />
        </asp:MultiView>
        <br />
        </div>
        <br />
    
       
    </div>
    </form>
</body>
</html>
