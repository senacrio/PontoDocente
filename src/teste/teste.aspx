<%@ Page Language="VB" AutoEventWireup="false" CodeFile="teste.aspx.vb" Inherits="BSC_teste" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        IdUsuario:
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        Nome:
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        Matricula:<asp:Label ID="Label3" runat="server"></asp:Label>
        <br />
        IP:
        <asp:Label ID="Label4" runat="server"></asp:Label>
        <br />
        IP2:
        <asp:Label ID="Label7" runat="server"></asp:Label>
        <br />
        URL:&nbsp;         <asp:Label ID="Label5" runat="server"></asp:Label>
        <br />
        Workstation:
        <asp:Label ID="Label6" runat="server"></asp:Label>
    
    </div>
    <asp:Button ID="Button1" runat="server" Text="Atualiza Valores" />
    </form>
</body>
</html>
