<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TransferirSolicitante.aspx.vb" Inherits="Sos_TransferirSolicitante" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Aba.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 226px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <br />
        <asp:Panel ID="Panel1" runat="server" GroupingText="Transferir" 
            style="font-family: Verdana; font-size: x-small" Width="456px" 
            Height="160px">
            <asp:SqlDataSource ID="sdsSolicitante" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                SelectCommand="SELECT DISTINCT viewSGT_RHFuncionario.cdn_funcionario, viewSGT_RHFuncionario.nom_pessoa_fisic FROM viewSGT_RHFuncionario INNER JOIN sosChamado ON viewSGT_RHFuncionario.cdn_funcionario = sosChamado.IDSolicitante">
            </asp:SqlDataSource>
            <table class="style1">
                <tr>
                    <td class="style2">
                        De:<br />
                        <asp:DropDownList ID="cboSolicitante" runat="server" 
                            DataSourceID="sdsSolicitante" DataTextField="nom_pessoa_fisic" 
                            DataValueField="cdn_funcionario" 
                            style="font-family: Verdana; font-size: x-small" Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <br />
                        <asp:DropDownList ID="cboNovoSolicitante" runat="server" DataSourceID="sdsUsuarios" 
                            DataTextField="nom_pessoa_fisic" DataValueField="cdn_funcionario" 
                            style="font-family: Verdana; font-size: x-small" Width="200px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sdsUsuarios" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
                            SelectCommand="select cdn_funcionario,nom_pessoa_fisic from viewSGT_RHFuncionario
order by nom_pessoa_fisic">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <br />
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="Button1" runat="server" 
                style="font-family: Verdana; font-size: x-small" Text="Transferir" />
            
            <br />
        </asp:Panel>
    
        <br />
        <asp:SqlDataSource ID="sdsTransferir" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SistemaSOS %>" 
            DeleteCommand="DELETE FROM [sosChamado] WHERE [IDChamado] = @IDChamado" 
            InsertCommand="INSERT INTO [sosChamado] ([IDUnidade], [IDLotacao], [IDTecnico], [IDSolicitante], [Descricao], [Solucao], [DataHoraAbertura], [IDGrupoServico], [IDServico], [IDStatus], [DataHoraFechamentoUsuario]) VALUES (@IDUnidade, @IDLotacao, @IDTecnico, @IDSolicitante, @Descricao, @Solucao, @DataHoraAbertura, @IDGrupoServico, @IDServico, @IDStatus, @DataHoraFechamentoUsuario)" 
            SelectCommand="SELECT * FROM [sosChamado]" 
            UpdateCommand="UPDATE sosChamado SET IDSolicitante = @NovoSolicitante WHERE (IDSolicitante = @Solicitante)">
            <DeleteParameters>
                <asp:Parameter Name="IDChamado" Type="Int64" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="cboNovoSolicitante" Name="NovoSolicitante" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="cboSolicitante" Name="Solicitante" 
                    PropertyName="SelectedValue" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="IDUnidade" Type="String" />
                <asp:Parameter Name="IDLotacao" Type="String" />
                <asp:Parameter Name="IDTecnico" Type="String" />
                <asp:Parameter Name="IDSolicitante" Type="String" />
                <asp:Parameter Name="Descricao" Type="String" />
                <asp:Parameter Name="Solucao" Type="String" />
                <asp:Parameter Name="DataHoraAbertura" Type="DateTime" />
                <asp:Parameter Name="IDGrupoServico" Type="Int32" />
                <asp:Parameter Name="IDServico" Type="Int32" />
                <asp:Parameter Name="IDStatus" Type="Int32" />
                <asp:Parameter Name="DataHoraFechamentoUsuario" Type="DateTime" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
