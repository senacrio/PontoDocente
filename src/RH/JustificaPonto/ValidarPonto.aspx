<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ValidarPonto.aspx.vb" Inherits="Ponto_ValidarPonto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

 p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        .style13
        {
            font-size: 11.0pt;
            font-family: Calibri, sans-serif;
            color: #000000;
            text-align: center;
            background-color: #D9ECFF;
        }
        .style14
        {
            background-color: #E6F2FF;
        }
        .style15
        {
            width: 100%;
        }
        .style16
        {
            font-family: Calibri;
            width: 59px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" 
            style="font-weight: 700; font-size: small; font-family: Verdana" 
            Text="VALIDAR PONTO"></asp:Label>
    
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
        <br />
        <div class="style13" 
            style="border-style: dashed; border-width: 1px; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-bidi-font-family: &quot;Times New Roman&quot;; mso-ansi-language: PT-BR; mso-fareast-language: PT-BR; mso-bidi-language: AR-SA; background-color: #E6F2FF;">
            <b>
            <br />
            AVISO</b><p class="MsoNormal" style="font-size: small">
                <span class="style14" 
                    style="background-position: 0% 0%; mso-highlight: silver; background-image: none; background-repeat: repeat; background-attachment: scroll;">
                O Gerente ou Coordenador que valida as informações de ponto do colaborador passa a 
                ser co-responsável por esta informação, cabendo-lhe a responsabilidade e as 
                eventuais conseqüências relacionadas a esta informação.</span></p>
            <p class="MsoNormal">
                &nbsp;</p>
        </div>
        <br />
        <br />
        <table class="style15">
            <tr>
                <td class="style16">
                    Lotação:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="sqlLotacoes" DataTextField="des_unid_lotac" 
                        DataValueField="cod_unid_lotac" style="font-family: Calibri">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="sqlLotacoes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="select cod_unid_lotac,des_unid_lotac from dbo.STG_RHUnidadeLotacao a
inner join
(select cod_unid_lotac_filho from 
(SELECT cod_unid_lotac  FROM dbo.SGT_RHFuncionarioAtivo where cdn_funcionario = @matricula
union
select lotacao from ptnInterino where matricula=@matricula) g
inner join dbo.ViewSTG_RHEstrutPlanoLotac h
on g.cod_unid_lotac=h.cod_unid_lotac_pai
union
SELECT cod_unid_lotac  FROM dbo.SGT_RHFuncionarioAtivo where cdn_funcionario = @matricula
union
select lotacao from ptnInterino where matricula=@matricula) b
on cast(a.cod_unid_lotac as varchar) =cast( b.cod_unid_lotac_filho as varchar)  
">
            <SelectParameters>
                <asp:SessionParameter Name="matricula" SessionField="c_Matricula" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="grdPonto" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="sdsPontos" ForeColor="#333333" GridLines="None" 
            style="font-family: Verdana; font-size: x-small; text-align: left;" 
            DataKeyNames="data,Matric,entrada,saida" Width="800px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="data" HeaderText="Data" SortExpression="data" 
                    DataFormatString="{0:d}" />
                <asp:BoundField DataField="nom_pessoa_fisic" HeaderText="Nome" 
                    SortExpression="nom_pessoa_fisic" />
                <asp:BoundField DataField="entrada" HeaderText="Entrada" 
                    SortExpression="entrada" />
                <asp:BoundField DataField="saida" HeaderText="Saída" SortExpression="saida" />
                <asp:BoundField DataField="horas_trabalhadas" HeaderText="Horas trabalhadas" 
                    SortExpression="horas_trabalhadas" />
                <asp:BoundField DataField="Column1" HeaderText="Ajuste" 
                    SortExpression="Column1" />
                <asp:BoundField DataField="justificativa" HeaderText="Justificativa" 
                    SortExpression="justificativa" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="btnAplicar" runat="server" CommandName="select" 
                            ImageUrl="~/Icones/confirmar.gif" onclick="btnAplicar_Click" 
                            onclientclick="return confirm('Confirma a validação da justificativa?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                Não existem marcações de pontos para validação.
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="sdsLog" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            DeleteCommand="DELETE FROM [ptnLog] WHERE [IDLog] = @IDLog" 
            InsertCommand="INSERT INTO ptnLog(DataHoraRegistro, Validador, Colaborador, Entrada, Saida, DataMarcacao) VALUES (GETDATE(), @Validador, @Colaborador, @Entrada, @Saida, @DataMarcacao)" 
            SelectCommand="SELECT * FROM [ptnLog]" 
            UpdateCommand="UPDATE [ptnLog] SET [DataHoraRegistro] = @DataHoraRegistro, [Validador] = @Validador, [Colaborador] = @Colaborador, [Entrada] = @Entrada, [Saida] = @Saida WHERE [IDLog] = @IDLog">
            <DeleteParameters>
                <asp:Parameter Name="IDLog" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="DataHoraRegistro" Type="DateTime" />
                <asp:Parameter Name="Validador" Type="Int32" />
                <asp:Parameter Name="Colaborador" Type="Int32" />
                <asp:Parameter Name="Entrada" Type="String" />
                <asp:Parameter Name="Saida" Type="String" />
                <asp:Parameter Name="IDLog" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Validador" Type="Int32" />
                <asp:Parameter Name="Colaborador" Type="Int32" />
                <asp:Parameter Name="Entrada" Type="String" />
                <asp:Parameter Name="Saida" Type="String" />
                <asp:Parameter Name="DataMarcacao" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="sdsPontos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="(SELECT p.Data AS data, min(aj.ajuste) ,min(p.justificativa) as justificativa, p.Matric, dbo.fnHora2Decimal(MAX(p.Hora)) - dbo.fnHora2Decimal(MIN(p.Hora)) AS Expr1, left(min(hora),5) AS entrada, left(max(hora),5) AS saida, dbo.fnDecimal2Hora(dbo.fnHora2Decimal(MAX(p.Hora)) - dbo.fnHora2Decimal(MIN(p.Hora))) AS horas_trabalhadas, CASE WHEN dbo.fnHora2Decimal(MAX(p.Hora)) - dbo.fnHora2Decimal(MIN(p.Hora)) &lt; 28800 THEN 'Hora a menos' WHEN dbo.fnHora2Decimal(MAX(p.Hora)) - dbo.fnHora2Decimal(MIN(p.Hora)) &gt; 28800 THEN 'Horas excedentes' END AS divergencias, dbo.SGT_RHFuncionarioAtivo.nom_pessoa_fisic, p.Id_Ajuste 
FROM Ponto AS p LEFT OUTER JOIN  dbo.SGT_RHFuncionarioAtivo
ON p.Matric = dbo.SGT_RHFuncionarioAtivo.cdn_funcionario inner join
ptnajuste aj
on aj.id_ajuste=p.id_ajuste
WHERE p.data>'2010-02-01' and (p.Data &lt; getdate()) and p.matric&lt;&gt; @matricula  and p.ok=0 and 
p.matric in 

(select DISTINCT e.cdn_funcionario from dbo.View_RHCargo d
inner join
(select cdn_funcionario,cdn_cargo_basic,cdn_niv_cargo from dbo.SGT_RHFuncionarioAtivo a
where a.cod_unid_lotac=@Lotacao and a.dat_desligto_func is null
union
select distinct cdn_funcionario,cdn_cargo_basic,cdn_niv_cargo from dbo.SGT_RHFuncionarioAtivo a
INNER JOIN
(select b.cod_unid_lotac_pai,b.cod_unid_lotac_filho from dbo.STG_RHUnidadeLotacao a
inner join dbo.viewSTG_RHEstrutPlanoLotac b
on a.cod_unid_lotac COLLATE Latin1_General_CI_AI = b.cod_unid_lotac_pai where cdn_plano_lotac=2) c
ON A.cod_unid_lotac COLLATE Latin1_General_CI_AI = c.cod_unid_lotac_filho
where c.cod_unid_Lotac_pai=@Lotacao and a.dat_desligto_func is null) e
on 
d.cdn_cargo_basic=e.cdn_cargo_basic
and
d.cdn_niv_cargo=e.cdn_niv_cargo
)

GROUP BY p.Matric, dbo.SGT_RHFuncionarioAtivo.nom_pessoa_fisic, p.Data, p.Id_Ajuste 
HAVING (dbo.fnHora2Decimal(MAX(p.Hora)) - dbo.fnHora2Decimal(MIN(p.Hora)) &lt;&gt; 0))
order by p.data desc" 
            
            
            
            
            UpdateCommand="UPDATE Ponto SET ok = 1 WHERE (Matric = @Matric) AND (Data = @Data) AND (left(Hora,5) = @hora)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Lotacao" 
                    PropertyName="SelectedValue" />
                <asp:SessionParameter Name="matricula" SessionField="mat" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Matric" />
                <asp:Parameter Name="Data" />
                <asp:Parameter Name="hora" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsOk" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            SelectCommand="SELECT * FROM [Ponto]" 
            UpdateCommand="UPDATE Ponto SET ok = 1 WHERE (Matric = @Matric) AND (Data = @data) AND (left(Hora,5) = @hora)">
            <UpdateParameters>
                <asp:Parameter Name="Matric" />
                <asp:Parameter Name="data" />
                <asp:Parameter Name="hora" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label2" runat="server" 
            style="font-family: Verdana; font-size: small; color: #FF7553" 
            
            Text="Obs: Esta funcionalidade só está disponível para Gerentes ou Coordenadores."></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
