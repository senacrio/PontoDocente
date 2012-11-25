<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GeraCCusto.aspx.vb" Inherits="sga_GeraCCusto" %>

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
            width: 44px;
        }
        .style3
        {
            width: 129px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label2" runat="server" Font-Bold="True" 
            Text="Consulta  Centro de Custo"></asp:Label>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <hr />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class="style1">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" Font-Bold="False" 
                Font-Size="11pt" Text="Oferta:"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:TextBox ID="txtOferta" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnGerar" runat="server" Text="Consultar" />
                        </td>
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
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="sqlCCusto" GridLines="Vertical" Height="50px" 
                    Width="807px">
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="Oferta" HeaderText="Oferta:" SortExpression="Oferta">
                        <HeaderStyle Width="150px" />
                        <ItemStyle Font-Bold="True" Width="800px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CENTRO_CUSTO" HeaderText="Centro de Custo: " 
                            ReadOnly="True" SortExpression="CENTRO_CUSTO">
                        <ItemStyle Font-Bold="True" Width="200px" />
                        </asp:BoundField>
                    </Fields>
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:DetailsView>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
&nbsp;<asp:SqlDataSource ID="sqlCCusto" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            SelectCommand="prSGA-CCUSTO" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtOferta" Name="oferta" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
