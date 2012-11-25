<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Permissao.aspx.vb" Inherits="Permissao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">

        .style1
        {
            font-size: medium;
            font-weight: bold;
        }
        .style2
        {
            width: 219px;
        }
        .style4
        {
            width: 31px;
        }
        </style>
</head>

<body style="font-family: arial; text-align: left">

    <form id="form1" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
    </asp:ScriptManager>

    <table style="width: 100%;">
        <tr>
            <td class="style2">

    <span class="style1">Permissões de Acesso</span>
                <br /><br />
            </td>
            <td style="font-family: Arial, Helvetica, sans-serif; font-size: small" 
                valign="top">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="1">
                    <ProgressTemplate>
                        <img src="../Imagens/Carregando1.gif" style="width: 21px; height: 17px" /> 
                        Carregando...
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table style="width: 100%; background-color: #CCCCCC;">
                <tr>
                    <td valign="top" style="width: 5px">
                        &nbsp;
                    </td>
                    <td>
                        Menu:</td>
                    <td style="width: 5px">
                        &nbsp;</td>
                    <td>
                        Perfis com acesso:</td>
                    <td>
                        <asp:CheckBox ID="chkPerfil" runat="server" AutoPostBack="True" Text="Marcar" />
                    </td>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        Perfis sem acesso:</td>
                    <td>
                        &nbsp;
                        <asp:CheckBox ID="chkPerfilLista" runat="server" AutoPostBack="True" 
                            Font-Italic="False" Style="text-align: right" Text="Marcar" />
                    </td>
                    <td style="width: 5px" width="5px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td rowspan="6" valign="top">
                        <asp:Panel ID="Panel1" runat="server" BackColor="White" Height="400px" 
                            ScrollBars="Vertical" Width="100%">
                            <asp:TreeView ID="TreeView1" runat="server" BackColor="White" 
                                DataSourceID="xdsMenu" Height="100%" ImageSet="Arrows" NodeWrap="True" 
                                ShowCheckBoxes="All" ShowLines="True" Width="100%">
                                <ParentNodeStyle Font-Bold="False" />
                                <HoverNodeStyle BackColor="#FFFFCC" BorderColor="#CCCCCC" BorderWidth="1px" 
                                    Font-Underline="False" ForeColor="#5555DD" />
                                <SelectedNodeStyle BackColor="#FFFFCC" BorderColor="#CCCCCC" 
                                    BorderStyle="Solid" BorderWidth="1px" Font-Underline="False" 
                                    ForeColor="#5555DD" HorizontalPadding="5px" VerticalPadding="0px" />
                                <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
                                    HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                                <DataBindings>
                                    <asp:TreeNodeBinding ImageUrlField="Image" TextField="Text" ToolTipField="Tip" 
                                        ValueField="Value" />
                                </DataBindings>
                                <LeafNodeStyle ForeColor="#5555DD" />
                            </asp:TreeView>
                        </asp:Panel>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td colspan="2" rowspan="2" valign="top">
                        <asp:ListBox ID="lsbPerfil" runat="server" AutoPostBack="True" 
                            DataSourceID="sdsPerfil" DataTextField="Descricao" DataValueField="IdPerfil" 
                            Rows="7" SelectionMode="Multiple" Width="100%" Height="170px"></asp:ListBox>
                    </td>
                    <td class="style4" valign="top">
                        <asp:Button ID="btnRemoverPerfil" runat="server" Font-Bold="True" Height="40px" 
                            Text="&gt;&gt;" Width="30px" />
                    </td>
                    <td colspan="2" rowspan="2" valign="top">
                        <asp:ListBox ID="lsbPerfilLista" runat="server" DataSourceID="sdsPerfilLista" 
                            DataTextField="Descricao" DataValueField="IdPerfil" Rows="7" 
                            SelectionMode="Multiple" style="margin-right: 0px" Width="100%" 
                            Height="170px">
                        </asp:ListBox>
                    </td>
                    <td rowspan="2" valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="style4" valign="top">
                        <asp:Button ID="btnAdicionaPerfil" runat="server" Font-Bold="True" 
                            Height="40px" Text="&lt;&lt;" Width="30px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Usuários do perfil acima:</td>
                    <td>
                        <asp:CheckBox ID="chkUsuario" runat="server" AutoPostBack="True" 
                            Text="Marcar" />
                    </td>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        Usuários fora do perfil:</td>
                    <td>
                        <asp:CheckBox ID="chkUsuarioLista" runat="server" AutoPostBack="True" 
                            Font-Italic="False" Text="Marcar" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;</td>
                    <td colspan="2" rowspan="2" valign="top">
                        <asp:ListBox ID="lsbUsuario" runat="server" DataSourceID="sdsUsuario" 
                            DataTextField="Nome" DataValueField="IdUsuario" Rows="7" 
                            SelectionMode="Multiple" Width="100%" Height="170px"></asp:ListBox>
                    </td>
                    <td class="style4" valign="top">
                        <asp:Button ID="btnRemoverUsuario" runat="server" Font-Bold="True" 
                            Height="40px" Text="&gt;&gt;" Width="30px" />
                    </td>
                    <td colspan="2" rowspan="2" valign="top">
                        <asp:ListBox ID="lsbUsuarioLista" runat="server" 
                            DataSourceID="sdsUsuarioLista" DataTextField="Nome" DataValueField="IdUsuario" 
                            Rows="7" SelectionMode="Multiple" Width="100%" Height="170px"></asp:ListBox>
                    </td>
                    <td rowspan="2" valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="style4" valign="top">
                        <asp:Button ID="btnAdicionaUsuario" runat="server" Font-Bold="True" 
                            Height="40px" Text="&lt;&lt;" Width="30px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td align="right">
                        <asp:Button ID="btnRecolhe" runat="server" CausesValidation="False" Text="-" 
                            Width="20px" />
                        &nbsp;<asp:Button ID="btnExpande" runat="server" CausesValidation="False" 
                            Text="+" Width="20px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <img src="../../Icones/PNG/Blue/18/arrow_right.png" /> Ativo&nbsp;
                        <img src="../../Icones/PNG/Yellow/18/arrow_down.png" /> Inativo</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
    <br />

                              

          <asp:SqlDataSource ID="sdsPerfil" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT A.IdPerfil, B.Descricao, B.Ativo FROM admPortalMenuPerfil A
INNER JOIN admPortalPerfil B ON A.IdPerfil=B.IdPerfil
WHERE IdMenu=@IdMenu
ORDER BY B.Descricao
">
              <SelectParameters>
                  <asp:ControlParameter ControlID="TreeView1" Name="IdMenu" 
                      PropertyName="SelectedValue" />
              </SelectParameters>
          </asp:SqlDataSource>
                              

          <asp:SqlDataSource ID="sdsPerfilLista" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT A.IdPerfil, A.Descricao, A.Ativo FROM admPortalPerfil A
WHERE A.IdPerfil NOT IN 
	(
	SELECT A.IdPerfil FROM admPortalMenuPerfil A
	INNER JOIN admPortalPerfil B ON A.IdPerfil=B.IdPerfil
	WHERE IdMenu=@IdMenu
	)
ORDER BY A.Descricao">
              <SelectParameters>
                  <asp:ControlParameter ControlID="TreeView1" Name="IdMenu" 
                      PropertyName="SelectedValue" />
              </SelectParameters>
          </asp:SqlDataSource>
                              

          <asp:SqlDataSource ID="sdsUsuario" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT B.IdUsuario, B.Nome FROM admPortalPerfilUsuario A
INNER JOIN admPortalUsuario B ON A.IdUsuario=B.IdUsuario
WHERE A.IdPerfil=@IdPerfil
ORDER BY B.Nome">
              <SelectParameters>
                  <asp:ControlParameter ControlID="lsbPerfil" Name="IdPerfil" 
                      PropertyName="SelectedValue" />
              </SelectParameters>
          </asp:SqlDataSource>
                              

          <asp:SqlDataSource ID="sdsUsuarioLista" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT A.IdUsuario, A.Nome + ' (' + A.Login + ')' AS Nome FROM admPortalUsuario A
WHERE A.IdUsuario NOT IN 
	(
	SELECT IdUsuario FROM admPortalPerfilusuario
	WHERE IdPerfil=@IdPerfil
	)
ORDER BY A.Nome">
              <SelectParameters>
                  <asp:ControlParameter ControlID="lsbPerfil" Name="IdPerfil" 
                      PropertyName="SelectedValue" />
              </SelectParameters>
          </asp:SqlDataSource>
                              
    <br />
    
    <asp:XmlDataSource ID="xdsMenu" runat="server" TransformFile="MenuAdmin.xsl"
        XPath="Nodes/TreeNode" EnableCaching="False"></asp:XmlDataSource>
        
    </form>
</body>
</html>
