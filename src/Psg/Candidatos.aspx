<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Candidatos.aspx.vb" Inherits="Psg_Candidatos" %>

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
            font-size: x-small;
            font-family: Verdana;
            width: 134px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" style="font-weight: 700" 
            Text="CONSULTAR INSCRITOS"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="sqlDsUnidade" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT NULL AS IDUnidade,NULL AS Unidade 
UNION ALL
SELECT IDUnidade,Unidade FROM psgUnidade u WHERE 
EXISTS(
	SELECT TOP 1 pu.IDPerfil FROM psgPerfilUnidade pu
	INNER JOIN admPortalPerfilUsuario pa ON pu.IDPerfil=pa.IDPerfil
	WHERE pu.IDUnidade = u.IDUnidade AND pa.IDUsuario = @IDUsuario)
ORDER BY Unidade">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="IDUsuario" 
                    SessionField="c_IDUsuario" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table class="style1">
            <tr>
                <td class="style2">
                    SELECIONE A UNIDADE:</td>
                <td>
                    <asp:DropDownList ID="ddlUnidades" runat="server" AutoPostBack="True" 
                        DataSourceID="sqlDsUnidade" DataTextField="Unidade" DataValueField="IDUnidade" 
                        style="font-family: Verdana; font-size: x-small">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        <br />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="IDUnidade" DataSourceID="sdsCandidatos" 
            ForeColor="#333333" GridLines="None" 
            style="font-family: Verdana; font-size: x-small" Width="940px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="Unidade" HeaderText="Unidade" 
                    SortExpression="Unidade" />
                <asp:BoundField DataField="nome" HeaderText="Candidato" SortExpression="nome" />
                <asp:BoundField DataField="telefonefixo" HeaderText="Telefone Fixo" 
                    ReadOnly="True" SortExpression="telefonefixo" />
                <asp:BoundField DataField="celular" HeaderText="Celular" ReadOnly="True" 
                    SortExpression="celular" />
                <asp:BoundField DataField="Curso" HeaderText="Curso" SortExpression="Curso" />
                <asp:BoundField DataField="turno" HeaderText="Turno" ReadOnly="True" 
                    SortExpression="turno" />
                <asp:BoundField DataField="turma" HeaderText="Turma" ReadOnly="True" 
                    SortExpression="turma" />
                <asp:BoundField DataField="Endereco" HeaderText="Endereço" 
                    SortExpression="Endereco" />
                <asp:BoundField DataField="EnderecoNumero" HeaderText="Número" 
                    SortExpression="EnderecoNumero" />
                <asp:BoundField DataField="EnderecoComplemento" HeaderText="Complemento" 
                    SortExpression="EnderecoComplemento" />
                <asp:BoundField DataField="Bairro" HeaderText="Bairro" 
                    SortExpression="Bairro" />
                <asp:BoundField DataField="Cidade" HeaderText="Cidade" 
                    SortExpression="Cidade" />
            </Columns>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sdsCandidatos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            SelectCommand="SELECT psgUnidade.Unidade, psgCandidato.Nome AS nome, psgCandidato.TelefoneFixoDDD + ' ' + psgCandidato.TelefoneFixo AS telefonefixo, psgCandidato.CelularDDD + ' ' + psgCandidato.Celular AS celular, psgCurso.Curso, CASE WHEN turno = 1 THEN 'Manhã' WHEN turno = 2 THEN 'Tarde' WHEN turno = 3 THEN 'Noite' END AS turno, CONVERT (varchar, psgTurma.DataInicioCurso, 103) + ' ' + CONVERT (varchar, psgTurma.DataTerminoCurso, 103) AS turma, psgCandidato.Endereco, psgCandidato.EnderecoNumero, psgCandidato.EnderecoComplemento, psgCandidato.Bairro, psgCandidato.Cidade, psgUnidade.IDUnidade FROM psgTurma INNER JOIN psgInscricao ON psgTurma.IDTurma = psgInscricao.IDTurma INNER JOIN psgUnidade ON psgTurma.IDUnidade = psgUnidade.IDUnidade INNER JOIN psgCandidato ON psgInscricao.IDCandidato = psgCandidato.IDCandidato INNER JOIN psgCurso ON psgTurma.IDCurso = psgCurso.IDCurso WHERE (psgUnidade.IDUnidade = @idunidade) ORDER BY psgUnidade.Unidade, nome">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlUnidades" Name="idunidade" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
