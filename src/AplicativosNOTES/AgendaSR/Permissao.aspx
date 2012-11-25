<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Permissao.aspx.vb" Inherits="AplicativosNOTES_AgendaSR_Permissao" %>

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
            width: 301px;
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
                <table class="style1">
                    <tr>
                        <td class="style2" valign="top">
                            <asp:Label ID="Label2" runat="server" Text="Nome:" Font-Size="Small"></asp:Label>
                            <br />
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnBuscar" runat="server" 
                                            ImageUrl="~/Icones/Standard/001_38.gif" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Italic="False" 
                                Font-Size="Small"></asp:Label>
                            <br />
                        </td>
                        <td valign="bottom">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" valign="top" align="left">
                            
                            &nbsp;<asp:ImageButton ID="btnAutoriza" runat="server" 
                                ImageUrl="~/Icones/seta-direita.gif" />
                            <br />
                            
                            <asp:GridView ID="gridFuncionarios" runat="server" 
                AutoGenerateColumns="False" Width="296px" DataKeyNames="cdn_funcionario,nom_pessoa_fisic" Font-Size="Small" 
                                style="text-align: center" Caption="Não autorizados" EnableTheming="True">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Select" 
                                                ImageUrl="~/Icones/seta_direita.gif" />
                                        </ItemTemplate>
                                        <ItemStyle Width="5px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="cdn_funcionario" 
                        HeaderText="Matrícula" />
                                    <asp:BoundField DataField="nom_pessoa_fisic" 
                        HeaderText="Nome" />
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td valign="top">
                            <asp:ImageButton ID="btnRemove" runat="server" 
                                ImageUrl="~/Icones/seta-esquerda.gif" />
                            <br />
                            <asp:GridView ID="gridPermissao" runat="server" 
                AutoGenerateColumns="False" DataKeyNames="cdn_funcionario,nom_pessoa_fisic" Font-Size="Small" 
                                Caption="Autorizados">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Select" 
                                                ImageUrl="~/Icones/seta_direita.gif" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="cdn_funcionario" 
                        HeaderText="Matricula" />
                                    <asp:BoundField DataField="nom_pessoa_fisic" 
                        HeaderText="Nome" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
