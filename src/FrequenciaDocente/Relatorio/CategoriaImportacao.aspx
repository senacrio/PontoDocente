<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CategoriaImportacao.aspx.vb" Inherits="FrequenciaDocente_Relatorio_CategoriaImportacao" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style1
        {
            width: 100%;
        }
          .auto-style2
        {
            width: 263px;
        }
        .auto-style3
        {
            width: 400px;
        }
          .botao{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
        background:#638cb5;
        border:0px;
        width:80px;
        height:19px;
       }
          </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <table class="auto-style1">
        <tr>
            <td align="center"><strong>IMPORTAÇÃO DE CATEGORIA<br />
                        <br />
                        </strong>
                        <asp:Label ID="lblMsg" runat="server" EnableViewState="False"></asp:Label>
                    </td>
        </tr>
    </table>
    
        <table class="auto-style1">
            <tr>
                <td align="left" class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>
                         &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="auto-style2">Selecione o arquivo de categorias:</td>
                <td class="auto-style3">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="391px" />
                </td>
                <td>
                         <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="botao" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
    </div>
    </form>
</body>
</html>
