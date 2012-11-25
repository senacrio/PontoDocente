<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Templates.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    </head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="pnlVisualizar" runat="server" Direction="LeftToRight" 
        style="font-weight: 700; font-size: x-large">
        Templates de Gerenciamento de Projetos
    </asp:Panel>
                <p>
        <asp:ListBox ID="lstArquivos" Runat="server" Rows="6" Width="286px" Visible="False" />
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                    SelectImageUrl="~/Icones/grid_selecionar.gif" HeaderText="Selecionar" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            ImageUrl="~/Icones/disquete.jpg" onclick="ImageButton1_Click" 
                            ToolTip="Fazer download" Width="16px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    </form>
</body>
</html>
