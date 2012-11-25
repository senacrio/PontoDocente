<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroTipo.aspx.vb" Inherits="AplicativosNOTES_AgendaSR_CadastroTipo" StyleSheetTheme="AgendaSR" Theme="AgendaSR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


.grid th
{
	background-color:#EFEFEF;
	font-weight:normal;
	border-color:#ccc;
}

        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 28px;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:MultiView ID="mvTipo" runat="server" ActiveViewIndex="0">
                    <asp:View ID="vwTipo" runat="server">
                        <br />
                        <asp:Button ID="btnIncluir" runat="server" Text="Incluir" />
                        <br />
                        <br />
                        <asp:GridView ID="gridTipo" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" CssClass="grid" 
                            DataKeyNames="Cd_Tipo" Font-Size="Small" Width="325px">
                            <Columns>
                                <asp:CommandField ButtonType="Image" 
                                    SelectImageUrl="~/Icones/Standard/001_59.gif" ShowSelectButton="True">
                                <ItemStyle Width="10px" />
                                </asp:CommandField>
                                <asp:BoundField DataField="Cd_Tipo" HeaderText="Código" />
                                <asp:BoundField DataField="Nm_Tipo" HeaderText="Tipo" />
                            </Columns>
                            <EmptyDataTemplate>
                                <span lang="pt-br" 
                                    style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                Não existe candidatos para essa vaga. </span>
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#D1DDF1" />
                        </asp:GridView>
                        <br />
                    </asp:View>
                    <asp:View ID="vwCadTipo" runat="server">
                        <br />
                        <br />
                        <table class="style1">
                            <tr>
                                <td class="style2">
                                    <asp:ImageButton ID="btnVoltar" runat="server" ImageUrl="~/Icones/voltar.jpg" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="lblTipo" runat="server" Font-Size="Small" Text="Tipo:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTipo" runat="server" Font-Size="Small"></asp:TextBox>
                                    &nbsp;<asp:ImageButton ID="ImageButton16" runat="server" 
                                        ImageUrl="~/Icones/disquete.jpg" />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:View>
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:MultiView>
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
    
    </div>
    </form>
</body>
</html>
