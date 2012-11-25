<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TesteRH.aspx.vb" Inherits="TesteRH" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            Aniversariantes do mês</h1>
        <table>
           <tr>
              <td valign="top">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/RH/Aniversario/Chapeu.gif" />
              </td>
              <td>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" Font-Names="Arial" 
                    Font-Size="5pt" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
              </td>
           </tr>
        </table>

    
    </div>
    </form>
</body>
</html>
