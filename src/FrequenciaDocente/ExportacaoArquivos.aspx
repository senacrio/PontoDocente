<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ExportacaoArquivos.aspx.vb" Inherits="FrequenciaDocente_ExportacaoArquivos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style1
        {
            width: 100%;
        }
          </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table class="auto-style1">
        <tr>
            <td align="center"><strong>EXPORTAÇÃO DE ARQUIVOS PARA O DATASUL<br />
                <br />
                        <asp:Label ID="lblMsg" runat="server" EnableViewState="False"></asp:Label>
                        </strong>
                    </td>
        </tr>
    </table>
    
    </div>
        <p>
            <asp:Button ID="btnExportar" runat="server" Text="Exportar arquivos" />
        </p>
    </form>
</body>
</html>
