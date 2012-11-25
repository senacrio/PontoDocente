<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ImprimirClassificados.aspx.vb" Inherits="Psg_ImprimirClassificados" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 47px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="sdsClassificados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="select * from dbo.fnPsgRelatorio()
where idturma=@idturma and idunidade=@idunidade and idcurso=@idcurso
and situacao='classificado'">
            <SelectParameters>
                <asp:QueryStringParameter Name="idturma" QueryStringField="idturma" />
                <asp:QueryStringParameter Name="idunidade" QueryStringField="idunidade" />
                <asp:QueryStringParameter Name="idcurso" QueryStringField="idcurso" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table class="style1">
            <tr>
                <td class="style3">
                    Unidade:</td>
                <td>
                    <asp:Label ID="lblUnidade" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Curso:</td>
                <td>
                    <asp:Label ID="lblCurso" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Turno:</td>
                <td>
                    <asp:Label ID="lblTurno" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="gdvClassificados" runat="server" AutoGenerateColumns="False" 
            DataSourceID="sdsClassificados">
            <Columns>
                <asp:BoundField DataField="rank" HeaderText="Ranking" SortExpression="rank" />
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                <asp:BoundField DataField="cpf" HeaderText="CPF" SortExpression="cpf" />
                <asp:BoundField DataField="situacao" HeaderText="Situação" 
                    SortExpression="situacao" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
