<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Cópia de Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 839px;
        }
        .style2
        {
        }
        .style5
        {
            width: 84px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="Large" 
                    style="text-align: left" Text="Cadastro de Documentos"></asp:Label>
    <table style="width:100%;">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style2" colspan="2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                Descrição:</td>
                <td>
                    <asp:TextBox ID="txtDescricao" runat="server" ToolTip="Descrição do arquivo"></asp:TextBox>
                </td>
                <td class="style1">
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            
            <td class="style5">
                Arquivo:</td>
            <td>
        <asp:FileUpload ID="FileUpload1" runat="server" 
                    ToolTip="Caminho do arquivo. Clique para procurar." Height="22px" />
            </td>
            <td class="style1">
        <asp:Button ID="Button1" runat="server" Text="Enviar" Height="22px" ToolTip="Enviar" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style1">
                <asp:SqlDataSource ID="SqlDSDocumentos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    DeleteCommand="DELETE FROM [epmArquivo] WHERE [IDArquivo] = @IDArquivo" 
                    InsertCommand="INSERT INTO epmArquivo(Descricao, Arquivo, Usuario) VALUES (@Descricao, @Arquivo, @Usuario)" 
                    SelectCommand="SELECT * FROM [epmArquivo]" 
                    UpdateCommand="UPDATE [epmArquivo] SET [Descricao] = @Descricao, [Arquivo] = @Arquivo, [Tipo] = @Tipo, [Usuario] = @Usuario, [DataInicio] = @DataInicio WHERE [IDArquivo] = @IDArquivo">
                    <DeleteParameters>
                        <asp:Parameter Name="IDArquivo" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Descricao" Type="String" />
                        <asp:Parameter Name="Arquivo" Type="String" />
                        <asp:Parameter Name="Tipo" Type="String" />
                        <asp:Parameter Name="Usuario" Type="String" />
                        <asp:Parameter Name="DataInicio" Type="DateTime" />
                        <asp:Parameter Name="IDArquivo" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtDescricao" Name="Descricao" 
                            PropertyName="Text" />
                        <asp:SessionParameter Name="Arquivo" SessionField="PathArquivo" />
                        <asp:SessionParameter Name="Usuario" SessionField="c_nome" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="pnlVisualizar" runat="server" Direction="LeftToRight">
        <asp:Label ID="lblAviso" runat="server" 
            Text="Cadastro efetuado com sucesso. Clique no link para visualizar o arquivo: "></asp:Label>
        <asp:HyperLink ID="HyperLink1" runat="server">[HyperLink1]</asp:HyperLink>
    </asp:Panel>
    <p>
        &nbsp;</p>
    <p>
        <asp:ListBox ID="lstArquivos" Runat="server" Rows="6" Width="286px" 
            Visible="False" />
    </p>
    <p>
        <input id="btnDownload" runat="server" onserverclick="btnDownload_ServerClick" 
            type="button" value="Download do arquivo" /></p>
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
