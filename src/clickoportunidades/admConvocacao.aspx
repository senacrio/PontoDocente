<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admConvocacao.aspx.vb" Inherits="admVagasEdit" Theme="AdmClick" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script type="text/javascript" >
function desmarcar(objRadio) {
  
      objRadio.checked = false;
  }
  function Mascara(objeto) {
      if (objeto.value.length == 0)
          objeto.value = '(' + objeto.value;

      if (objeto.value.length == 3)
          objeto.value = objeto.value + ')';

      if (objeto.value.length == 8)
          objeto.value = objeto.value + '-';
  }


			function FormataCpf(campo, teclapres)
			{
				var tecla = teclapres.keyCode;
				var vr = new String(campo.value);
				vr = vr.replace(".", "");
				vr = vr.replace("/", "");
				vr = vr.replace("-", "");
				tam = vr.length + 1;
				if (tecla != 14)
				{
					if (tam == 4)
						campo.value = vr.substr(0, 3) + '.';
					if (tam == 7)
						campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 6) + '.';
					if (tam == 11)
						campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 3) + '.' + vr.substr(7, 3) + '-' + vr.substr(11, 2);
				}
			}
		

</script>

    <title>Untitled Page</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">


        .style22
        {
            color: #0066FF;
            font-size: small;
        }
        .style23
        {
            font-weight: bold;
        }
        
        .style24
        {
            width: 100%;
            height: 56px;
        }
        .style25
        {
            width: 50px;
        }
        .style26
        {
            width: 138px;
        }
        
        .style34
        {
            font-size: small;
        }
        
        .style35
        {
            width: 100%;
            font-size:x-small; 
        }
        
        .style36
        {
            width: 82px;
        }
        .style37
        {
        }
        .style38
        {
        }
        
        .style39
        {
            width: 100%;
        }
        .style40
        {
            width: 140px;
        }
        .style41
        {
            width: 34px;
        }
        .style42
        {
            width: 251px;
        }
        
        .style43
        {
        }
        
        .style44
        {
            width: 141px;
        }
        .handleText
        {
	        width:16px;
	        height:16px;
	        background-image:url(../imagens/HandleGrip.png);
	        overflow:hidden;
	        cursor:se-resize;
        }
        .resizingText
        {
	        padding:0px;
	        border-style:solid;
	        border-width:2px;
	        border-color:#7391BA;
        }

        .style45
        {
            width: 195px;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span lang="pt-br">

       <table style="width: 101%">
                <tr>
                    <td style="text-align: left; ">
    
                        <span lang="pt-br">
                        <asp:Label ID="lblTitulo" runat="server" Text="Captação de candidatos:" 
                            style="font-size: medium; font-weight: 700"></asp:Label>
                        <br />
                </span>
    
                        <br />
    
        <span lang="pt-br">

                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10px" 
                            ForeColor="#FF6600" 
                            Text="*Atenção: Qualquer operação efetuada nessa área é de responsabilidade única do Click Oportunidades, essas operações são registradas." 
                            Width="650px"></asp:Label>
                        <br />
                        <br />

                                    <asp:ScriptManager ID="ScriptManager1" runat="server" 
                                        EnableScriptGlobalization="True">
                                    </asp:ScriptManager>
                            <asp:SqlDataSource ID="sqlEmpresas" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                
                                
                            SelectCommand="SELECT [nome_fantasia], [id_empresa] FROM [tblEmpresa] WHERE [nome_fantasia] is not null ORDER BY [nome_fantasia]">
                            </asp:SqlDataSource>
                        
                        <asp:Panel ID="Panel10" runat="server" BorderWidth="2px" Height="43px" 
                            Width="330px" BackColor="White" BorderColor="Black">
                            <table class="style39">
                                <tr>
                                    <td>
                                        <span lang="pt-br">&nbsp;<a href="#Passo1">Passo 1</a></span></td>
                                    <td>
                                        <span lang="pt-br">&nbsp;<a href="#Passo2">Passo 2</a></span>
                                        </td>
                                    <td>
                                        <span lang="pt-br">&nbsp;<a href="#Passo3">Passo 3</a></span>
                                        </td>
                                    <td>
                                        <span lang="pt-br">&nbsp;<a href="#Passo4">Passo 4</a></span></td>
                                    <td>
                                        <span lang="pt-br">&nbsp;<a href="#Passo5">Passo 5</a></span></td>
                                        <td>
                                        <span lang="pt-br">&nbsp;<a href="#Passo6">Passo 6</a></span></td>
                                        <td>
                                        <span lang="pt-br">&nbsp;<a href="#Passo7">Passo 7</a></span></td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <ajaxToolkit:AlwaysVisibleControlExtender ID="Panel10_AlwaysVisibleControlExtender" 
                            runat="server" Enabled="True" HorizontalOffset="10" HorizontalSide="Right" 
                            TargetControlID="Panel10" VerticalOffset="10">
                        </ajaxToolkit:AlwaysVisibleControlExtender>
                        <a name="Passo1"></a>
                        <asp:Panel ID="Panel2" runat="server" BackColor="#FFAE5E" Height="20px">
                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                <span lang="pt-br">&nbsp;&nbsp; 1° Passo - BUSCAR AS CAPTAÇÕES - para visualizar utilize 
                                qualquer opção - CAPTADOR,DATA,EMPRESA ou PERÍODO</span></div>
                            <br />
                        </asp:Panel>
                        </span>
    
                        <table class="style35">
                            <tr>
                                <td class="style36">
                                    Captador:</td>
                                <td class="style38">
                                    <asp:DropDownList ID="cbocaptadorBusca" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="sqlCaptadores" DataTextField="nome" 
                                        DataValueField="nome" Font-Size="X-Small" style="margin-left: 0px">
                                        <asp:ListItem Value="%">TODOS</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style36">
                                    Período click:</td>
                                <td class="style38" colspan="2">
                                    <asp:TextBox ID="txtperiodoInicial" runat="server" Font-Size="X-Small" 
                                        Width="80px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtperiodoInicial_CalendarExtender" 
                                        runat="server" Enabled="True" TargetControlID="txtperiodoInicial">
                                    </ajaxToolkit:CalendarExtender>
    
        <span lang="pt-br">

                                    <asp:TextBox ID="txtperiodofinal" runat="server" Font-Size="X-Small" 
                                        Width="80px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtperiodofinal_CalendarExtender" 
                                        runat="server" Enabled="True" TargetControlID="txtperiodofinal">
                                    </ajaxToolkit:CalendarExtender>
                                    </span></td>
                            </tr>
                            <tr>
                                <td class="style36">
                                    Período Empresa:</td>
                                <td class="style38" colspan="2">
    
        <span lang="pt-br">

                                    <asp:TextBox ID="txtperiodoInicialEmp" runat="server" Font-Size="X-Small" 
                                        Width="80px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtperiodoInicialEmp_CalendarExtender" 
                                        runat="server" Enabled="True" TargetControlID="txtperiodoInicialEmp">
                                    </ajaxToolkit:CalendarExtender>
    
                                    <asp:TextBox ID="txtperiodofinalEmp" runat="server" Font-Size="X-Small" 
                                        Width="80px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtperiodofinalEmp_CalendarExtender" 
                                        runat="server" Enabled="True" TargetControlID="txtperiodofinalEmp">
                                    </ajaxToolkit:CalendarExtender>
                        </span></td>
                            </tr>
                            <tr>
                                <td class="style36">
                                    Empresa:</td>
                                <td class="style37" colspan="2">
                                    <asp:DropDownList ID="cboempresabusca" runat="server" 
                                        AppendDataBoundItems="True" DataSourceID="sqlEmpresas" 
                                        DataTextField="nome_fantasia" DataValueField="id_empresa" Font-Size="X-Small">
                                        <asp:ListItem Value="0">TODOS</asp:ListItem>
                                    </asp:DropDownList>
    
        <span lang="pt-br">

                    <asp:ImageButton ID="ImageButton6" runat="server" 
                        ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" 
                        ImageAlign="Middle" onclick="ImageButton6_Click" />
                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style36">
                                    &nbsp;</td>
                                <td class="style37" colspan="2">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <span lang="pt-br">

        <a name="Passo2"></a>
                        <asp:Panel ID="Panel4" runat="server" BackColor="#FFAE5E" 
            Height="20px">
                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                <span lang="pt-br">&nbsp;&nbsp; 2° Passo - SELECIONAR A CAPTAÇÃO - verifique os dados da 
                                vaga, perfil, entrevista e candidatos</span></div>
                            <br />
                            <br />
                        </asp:Panel>

                        <br />

                        <b>Selecione uma entrevista clicando na seta azul</b><br />

                </span>&nbsp;
                        <br />
                    </td>
                </tr>
                </table>
           
  &nbsp;<b><span class="style22"><asp:SqlDataSource ID="sqlCaptadores" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                                
                                
                            SelectCommand="SELECT '' AS Matricula, 'Empresa' AS nome UNION SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario WHERE (admPortalPerfilUsuario.IdPerfil = 5) ORDER BY nome">
                            </asp:SqlDataSource>

                                <asp:SqlDataSource ID="SqlGridEntrevistaGeral" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                    OldValuesParameterFormatString=""                                                                                                
                                    
                                    
                                    
                        
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            SelectCommand="SELECT DISTINCT tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.id_statusEntrevista, tblEntrevista.captador, tblEntrevista.id_entrevista, tblEntrevista.id_vaga_fk, CASE WHEN tblVaga.ativada IS NULL THEN 'Em análise' WHEN tblVaga.ativada = 0 THEN 'Desativada' WHEN tblVaga.ativada = 1 THEN 'Ativada' END AS statusvaga, tblStatusEntrevista.statusEntrevista, tblEntrevista.dataCaptacao, tblProgramacaoEntrevista.codigo, tblEmpresa.nome_fantasia, tblEntrevista.quantcandidatos, tblCBO.cargo, tblVaga.fechamento, tblVaga.comentario, CASE WHEN tblVaga.fechamento IS NULL THEN 'Sem Status' WHEN tblVaga.fechamento = 15 THEN 'Encerrada' WHEN tblVaga.fechamento = 16 THEN 'Em aberto' END AS StatusFecha, tblVaga.encerrada FROM tblEmpresa INNER JOIN tblVaga ON tblEmpresa.id_empresa = tblVaga.id_empresa_fk INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo RIGHT OUTER JOIN tblEntrevista LEFT OUTER JOIN tblProgramacaoEntrevista ON tblEntrevista.id_entrevista = tblProgramacaoEntrevista.id_entrevista_fk LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista ON tblVaga.id_vaga = tblEntrevista.id_vaga_fk WHERE (tblVaga.id_empresa_fk = (CASE WHEN @id_empresa = 0 THEN tblVaga.id_empresa_fk ELSE @id_empresa END)) AND (ISNULL(tblEntrevista.dataClick, '1900-02-01') BETWEEN @dataInicialclick AND @dataFinalclick) AND (ISNULL(tblEntrevista.dataEmpresa, '1900-02-01') BETWEEN @dataInicialemp AND @dataFinalemp) AND (tblEntrevista.cancelamento = 0) AND (ISNULL(tblEntrevista.captador, '') LIKE @captador) AND (tblEntrevista.tipoEntrevista IS NULL) AND (tblEntrevista.tipoEntrevista IS NULL) ORDER BY tblEntrevista.dataClick">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cboempresabusca" Name="id_empresa" 
                                            PropertyName="SelectedValue" DefaultValue="" />
                                        <asp:ControlParameter ControlID="txtperiodoInicial" DbType="DateTime" 
                                            DefaultValue="1900-01-01" Name="dataInicialclick" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtperiodofinal" DbType="DateTime" 
                                            DefaultValue="2030-01-01" Name="dataFinalclick" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtperiodoInicialEmp" DbType="DateTime" 
                                            DefaultValue="1900-01-01" Name="dataInicialemp" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtperiodofinalEmp" DbType="DateTime" 
                                            DefaultValue="2030-01-01" Name="dataFinalemp" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="cbocaptadorBusca" Name="captador" 
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            <asp:GridView ID="GridEntrevistaGeral" runat="server" AllowPaging="True" 
                                AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                                CssClass="grid" 
            DataKeyNames="id_entrevista,id_vaga_fk" DataSourceID="SqlGridEntrevistaGeral" 
                                EnableViewState="False" Font-Bold="False" PageSize="5" 
                            ForeColor="Black">
                                <PagerStyle CssClass="pagerstyle" />
                                <Columns>
                                    <asp:CommandField HeaderText="Selecione a entrevista para captação" 
                                        ShowSelectButton="True" ButtonType="Image" 
                                        SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="id_entrevista" >
                                    <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="captador" HeaderText="Captador responsável" 
                                        SortExpression="captador" >
                                    <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nome_fantasia" HeaderText="Empresa" 
                                        SortExpression="nome_fantasia" >
                                    <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Programações necessárias">
                                        <ItemTemplate>
                                            <span lang="pt-br"><b><span class="style22">
                                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                                                AutoGenerateColumns="False" BackColor="White" BorderStyle="None" 
                                                DataSourceID="Sqlprogramacaoent" Font-Bold="False" Font-Size="8px" 
                                                ForeColor="White" GridLines="None" PageSize="3" ShowHeader="False">
                                                <Columns>
                                                    <asp:BoundField DataField="nome" ShowHeader="False" SortExpression="nome">
                                                        <FooterStyle BackColor="White" ForeColor="Black" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <FooterStyle ForeColor="Black" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="Sqlprogramacaoent" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                SelectCommand="SELECT tblProgramacaoEntrevista.id_entrevista_fk, tblSGA_Ofertas.nome FROM tblProgramacaoEntrevista INNER JOIN tblSGA_Ofertas ON tblProgramacaoEntrevista.id_oferta_fk = tblSGA_Ofertas.oferta WHERE (tblProgramacaoEntrevista.id_entrevista_fk = @id_entrevista_fk)">
                                                <SelectParameters>
                                                    <asp:Parameter Name="id_entrevista_fk" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            </span></b></span>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="quantcandidatos" HeaderText="Quantidade de vagas" 
                                        SortExpression="quantcandidatos" >
                                    <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Data e horário no Click" 
                                        SortExpression="dataClick">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label286" runat="server" 
                                                Text='<%# Bind("dataEmpresa", "{0:D}") %>'></asp:Label>
                                            &nbsp;às <span lang="pt-br"><b>
                                            <span class="style22" 
                                                style="font-weight: normal; color: #000000; font-size: 11px;">
                                            <asp:Label ID="Label2" runat="server" Font-Bold="False" 
                                                Text='<%# Bind("horaEmpresa", "{0}") %>' Font-Size="11px" 
                                                ForeColor="Black"></asp:Label>
                                            h</span></b></span>
                                        </ItemTemplate>
                                        <HeaderStyle Width="180px" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" ForeColor="Black" 
                                            Width="180px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Data e horário na Empresa" 
                                        SortExpression="dataEmpresa">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                                            &nbsp;às <span lang="pt-br"><b><span class="style22" 
                                                style="font-size: 11px; font-weight: normal; color: #000000;">
                                            <asp:Label ID="Label3" runat="server" Font-Bold="False" 
                                                Text='<%# Bind("horaEmpresa", "{0}") %>' Font-Size="11px" 
                                                ForeColor="Black"></asp:Label>
                                            h</span></b></span>
                                        </ItemTemplate>
                                        <HeaderStyle Width="180px" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" Width="180px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Encaminhado para:">
                                        <ItemTemplate>
                                            <span lang="pt-br"><b><span class="style22">
                                            <asp:GridView ID="gridCaptadores" runat="server" AllowPaging="True" 
                                                AutoGenerateColumns="False" DataKeyNames="id_captador_entrevista" 
                                                DataSourceID="sqlCaptadores" Font-Bold="False" GridLines="None" PageSize="3" 
                                                ShowHeader="False" Width="121px" Font-Size="11px" ForeColor="Black">
                                                <Columns>
                                                    <asp:BoundField DataField="captador" HeaderText="captador" 
                                                        SortExpression="captador">
                                                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="sqlCaptadores" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                DeleteCommand="DELETE FROM [tblCaptadorEntrevista] WHERE [id_captador_entrevista] = @id_captador_entrevista" 
                                                InsertCommand="INSERT INTO [tblCaptadorEntrevista] ([id_entrevista_fk], [captador]) VALUES (@id_entrevista_fk, @captador)" 
                                                SelectCommand="SELECT id_entrevista_fk, captador, id_captador_entrevista FROM tblCaptadorEntrevista WHERE (id_entrevista_fk = @id_entrevista_fk)" 
                                                UpdateCommand="UPDATE [tblCaptadorEntrevista] SET [id_entrevista_fk] = @id_entrevista_fk, [captador] = @captador WHERE [id_captador_entrevista] = @id_captador_entrevista">
                                                <SelectParameters>
                                                    <asp:Parameter Name="id_entrevista_fk" />
                                                </SelectParameters>
                                                <DeleteParameters>
                                                    <asp:Parameter Name="id_captador_entrevista" Type="Int32" />
                                                </DeleteParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="id_entrevista_fk" Type="Int32" />
                                                    <asp:Parameter Name="captador" Type="String" />
                                                    <asp:Parameter Name="id_captador_entrevista" Type="Int32" />
                                                </UpdateParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="id_entrevista_fk" Type="Int32" />
                                                    <asp:Parameter Name="captador" Type="String" />
                                                </InsertParameters>
                                            </asp:SqlDataSource>
                                            </span></b></span>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Data da Captação" SortExpression="dataCaptacao">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("dataCaptacao") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label44" runat="server" 
                                                Text='<%# Bind("dataCaptacao", "{0:D}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="statusfecha" 
                                        HeaderText="Status da vaga após entrevista" SortExpression="statusfecha">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Data de encerramento da vaga após captação" 
                                        SortExpression="encerrada">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("encerrada") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("encerrada", "{0:D}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerTemplate>
                                    &nbsp;
                                    <asp:Button ID="Button9" runat="server" CommandArgument="First" 
                                        CommandName="Page" CssClass="primero" ToolTip="Prim. Pag" />
                                    <asp:Button ID="Button10" runat="server" CommandArgument="Prev" 
                                        CommandName="Page" CssClass="anterior" ToolTip="Pág. anterior" />
                                    <asp:Button ID="Button11" runat="server" CommandArgument="Next" 
                                        CommandName="Page" CssClass="siguiente" ToolTip="Sig. página" />
                                    <asp:Button ID="Button12" runat="server" CommandArgument="Last" 
                                        CommandName="Page" CssClass="ultimo" ToolTip="Últ. Pag" />
                                </PagerTemplate>
                                <EmptyDataTemplate>
                                    &nbsp; <span lang="pt-br" 
                                        
                                        
                                        style="font-family: Verdana; font-size: 11px; font-weight: bold; color: #FF6600">
                                    Não existe registro no momento.</span>
                                </EmptyDataTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <AlternatingRowStyle CssClass="altrowstyle" />
                                <SelectedRowStyle BackColor="#D1DDF1" />
                            </asp:GridView>
                </span></b>
                </span>&nbsp;<asp:Panel ID="Panel1" runat="server" Width="1000px">
            <div style="border: 1px solid #006699">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:SqlDataSource ID="sqlVagaForm" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            InsertCommand="INSERT INTO tblVaga(id_cargo_fk, id_empresa_fk, modalidade, id_escolaridade_fk, modalidade_inicio, modalidade_fim, descricao, perfil, id_localtrabalho_fk, Faixaetariainicial, Faixaetariafinal, sexo, estado_civil, horario_entrada, horario_saida, domingo, segunda, terca, quarta, quinta, sexta, sabado, horario_obs, salario, vale_refeicao, refeicao_local, salario_observacao, dados_qualitativos, vale_alimentacao, plano_saude, Bairro, id_cargo_fkPai, QuantVaga, Valetransporte, ativada, rua, complemento, bairroent, id_municipio_fk, pontoreferencia, resp_vaga) VALUES (@id_cargo_fk, @id_empresa_fk, @modalidade, @id_escolaridade_fk, @modalidade_inicio, @modalidade_fim, @descricao, @perfil, @id_localtrabalho_fk, @faixaetariainicial, @faixaetariafinal, @sexo, @estado_civil, @horario_entrada, @horario_saida, @domingo, @segunda, @terca, @quarta, @quinta, @sexta, @sabado, @horario_obs, @salario, @vale_refeicao, @refeicao_local, @salario_observacao, @dados_qualitativos, @vale_alimentacao, @plano_saude, @bairro, @id_cargo_fkPai, @QuantVaga, @valetransporte, NULL, @rua, @complemento, @bairroent, @id_municipio_fk, @pontoreferencia, @resp_vaga)" 
                            SelectCommand="SELECT tblVaga.id_vaga, tblVaga.modalidade, tblVaga.modalidade_inicio, tblVaga.modalidade_fim, tblVaga.descricao, tblVaga.perfil, tblVaga.id_localtrabalho_fk, tblVaga.Faixaetariainicial, tblVaga.Faixaetariafinal, tblVaga.sexo, tblVaga.estado_civil, tblVaga.horario_entrada, tblVaga.horario_saida, tblVaga.domingo, tblVaga.segunda, tblVaga.terca, tblVaga.quarta, tblVaga.quinta, tblVaga.sexta, tblVaga.sabado, tblVaga.horario_obs, CONVERT (numeric(8 , 2), tblVaga.salario) AS salario, tblVaga.salario_dia, tblVaga.salario_dia_mes, tblVaga.vale_transporte, tblVaga.vale_refeicao, tblVaga.vale_alimentacao, tblVaga.plano_saude, tblVaga.refeicao_local, tblVaga.salario_observacao, tblVaga.dados_qualitativos, tblVaga.ultima_atualizacao, tblVaga.encerrada, tblVaga.Bairro AS bairrovaga, tblVaga.QuantVaga, CONVERT (numeric(8 , 2), tblVaga.Valetransporte) AS Valetransporte, tblVaga.rua, tblVaga.complemento, tblVaga.bairroent, tblVaga.id_municipio_fk AS id_municipio_fkEnt, tblVaga.pontoreferencia, tblVaga.id_cargo_fk, tblVaga.id_empresa_fk, tblVaga.id_cargo_fkPai, tblCBO.cargo, tblCBO.tipo, tblVaga.id_escolaridade_fk, CASE WHEN tblVaga.ativada IS NULL THEN '0' WHEN tblVaga.ativada = 0 THEN '2' WHEN tblVaga.ativada = 1 THEN '1' END AS ativada, tblVaga.ativada_obs, tblVaga.resp_vaga FROM tblVaga INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo WHERE (tblVaga.id_vaga = @id_vaga)" 
                            
                            
                            UpdateCommand="UPDATE tblVaga SET id_cargo_fk = @id_cargo_fk, modalidade = @modalidade, modalidade_inicio = @modalidade_inicio, modalidade_fim = @modalidade_fim, descricao = @descricao, perfil = @perfil, id_localtrabalho_fk = @id_localtrabalho_fk, id_escolaridade_fk = @id_escolaridade_fk, Faixaetariainicial = @faixaetariainicial, Faixaetariafinal = @faixaetariafinal, sexo = @sexo, estado_civil = @estado_civil, horario_entrada = @horario_entrada, horario_saida = @horario_saida, domingo = @domingo, segunda = @segunda, terca = @terca, quarta = @quarta, quinta = @quinta, sexta = @sexta, sabado = @sabado, horario_obs = @horario_obs, salario = @salario, vale_refeicao = @vale_refeicao, vale_alimentacao = @vale_alimentacao, plano_saude = @plano_saude, refeicao_local = @refeicao_local, salario_observacao = @salario_observacao, dados_qualitativos = @dados_qualitativos, Bairro = @bairro, id_cargo_fkPai = @id_cargo_fkPai, QuantVaga = @QuantVaga, rua = @rua, complemento = @complemento, bairroent = @bairroent, id_municipio_fk = @id_municipio_fk, pontoreferencia = @pontoreferencia, Valetransporte = REPLACE(@valetransporte, ',', '.'), ativada = (CASE WHEN @ativada = 0 THEN NULL WHEN @ativada = 1 THEN '1' WHEN @ativada = 2 THEN '0' END), ativada_obs = @ativada_obs, resp_vaga = @resp_vaga WHERE (id_vaga = @id_vaga)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="id_vaga" 
                                    SessionField="id_vaga" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="cboid_cargo_fk" DefaultValue="" 
                                    Name="id_cargo_fk" PropertyName="SelectedValue" Type="String" />
                                <asp:SessionParameter Name="id_empresa_fk" SessionField="id_empresa_fk" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="CBOModalidade" Name="modalidade" 
                                    PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="txtmodalidade_inicio" Name="modalidade_inicio" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtmodalidade_fim" Name="modalidade_fim" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtdescricao" Name="descricao" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtperfil" Name="perfil" PropertyName="Text" 
                                    Type="String" />
                                <asp:ControlParameter ControlID="CBOid_localtrabalho_fk" 
                                    Name="id_localtrabalho_fk" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="CBOsexo" Name="sexo" 
                                    PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="CBOEstado_civil" Name="estado_civil" 
                                    PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="txtHorario_entrada" Name="horario_entrada" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtHorario_saida" Name="horario_saida" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="chkDomingo" Name="domingo" 
                                    PropertyName="Checked" Type="Boolean" />
                                <asp:ControlParameter ControlID="chkSegunda" Name="segunda" 
                                    PropertyName="Checked" Type="Boolean" />
                                <asp:ControlParameter ControlID="chkTerca" Name="terca" PropertyName="Checked" 
                                    Type="Boolean" />
                                <asp:ControlParameter ControlID="chkQuarta" Name="quarta" 
                                    PropertyName="Checked" Type="Boolean" />
                                <asp:ControlParameter ControlID="chkQuinta" Name="quinta" 
                                    PropertyName="Checked" Type="Boolean" />
                                <asp:ControlParameter ControlID="chkSexta" Name="sexta" PropertyName="Checked" 
                                    Type="Boolean" />
                                <asp:ControlParameter ControlID="chkSabado" Name="sabado" 
                                    PropertyName="Checked" Type="Boolean" />
                                <asp:ControlParameter ControlID="txtHorario_obs" Name="horario_obs" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="moeSalario" Name="salario" PropertyName="Text" 
                                    Type="Decimal" />
                                <asp:ControlParameter ControlID="chkVale_refeicao" Name="vale_refeicao" 
                                    PropertyName="Checked" Type="Boolean" />
                                <asp:ControlParameter ControlID="chkVale_alimentacao" Name="vale_alimentacao" 
                                    PropertyName="Checked" Type="Boolean" />
                                <asp:ControlParameter ControlID="chkPlano_saude" Name="plano_saude" 
                                    PropertyName="Checked" Type="Boolean" />
                                <asp:ControlParameter ControlID="chkrefeicao_local" Name="refeicao_local" 
                                    PropertyName="Checked" Type="Boolean" />
                                <asp:ControlParameter ControlID="txtsalario_observacao" 
                                    Name="salario_observacao" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtdados_qualitativos" 
                                    Name="dados_qualitativos" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="CBOid_escolaridade_fk" 
                                    Name="id_escolaridade_fk" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtBairro" DefaultValue="" Name="bairro" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboid_cargo_fkPai" Name="id_cargo_fkPai" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtQuantVaga" Name="QuantVaga" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="CBOfaixaetariainicial" 
                                    Name="faixaetariainicial" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="CBOfaixaetariafinal" Name="faixaetariafinal" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtRua" Name="rua" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtcomplemento" Name="complemento" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtBairroEnt" Name="bairroent" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboid_municipio_fk" Name="id_municipio_fk" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtpontoreferencia" Name="pontoreferencia" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="moeValetransporte" Name="valetransporte" 
                                    PropertyName="Text" />
                                <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                                <asp:ControlParameter ControlID="cboativada" Name="ativada" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtativada_obs" Name="ativada_obs" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboresp_vaga" Name="resp_vaga" 
                                    PropertyName="SelectedValue" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="cbonome_fantasia" Name="id_empresa_fk" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="cboid_cargo_fk" Name="id_cargo_fk" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="CBOModalidade" Name="modalidade" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="CBOid_escolaridade_fk" 
                                    Name="id_escolaridade_fk" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtmodalidade_inicio" Name="modalidade_inicio" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtmodalidade_fim" Name="modalidade_fim" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtdescricao" Name="descricao" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtperfil" Name="perfil" PropertyName="Text" />
                                <asp:ControlParameter ControlID="CBOid_localtrabalho_fk" 
                                    Name="id_localtrabalho_fk" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="CBOsexo" Name="sexo" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="CBOEstado_civil" Name="estado_civil" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtHorario_entrada" Name="horario_entrada" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtHorario_saida" Name="horario_saida" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="chkDomingo" Name="domingo" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="chkSegunda" Name="segunda" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="chkTerca" Name="terca" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="chkQuarta" Name="quarta" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="chkQuinta" Name="quinta" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="chkSexta" Name="sexta" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="chkSabado" Name="sabado" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="txtHorario_obs" Name="horario_obs" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="moeSalario" Name="salario" PropertyName="Text" 
                                    Type="Decimal" />
                                <asp:ControlParameter ControlID="chkVale_refeicao" Name="vale_refeicao" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="chkrefeicao_local" Name="refeicao_local" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="txtsalario_observacao" 
                                    Name="salario_observacao" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtdados_qualitativos" 
                                    Name="dados_qualitativos" PropertyName="Text" />
                                <asp:ControlParameter ControlID="chkVale_alimentacao" Name="vale_alimentacao" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="chkPlano_saude" Name="plano_saude" 
                                    PropertyName="Checked" />
                                <asp:ControlParameter ControlID="txtBairro" Name="bairro" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboid_cargo_fkPai" Name="id_cargo_fkPai" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtQuantVaga" Name="QuantVaga" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="moeValetransporte" Name="valetransporte" 
                                    PropertyName="Text" Type="Decimal" />
                                <asp:ControlParameter ControlID="CBOfaixaetariainicial" 
                                    Name="faixaetariainicial" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="CBOfaixaetariafinal" Name="faixaetariafinal" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtRua" Name="rua" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtcomplemento" Name="complemento" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtBairroEnt" Name="bairroent" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboid_municipio_fk" Name="id_municipio_fk" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtpontoreferencia" Name="pontoreferencia" 
                                    PropertyName="Text" />
                                <asp:SessionParameter Name="resp_vaga" SessionField="c_Nome" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel8" runat="server" BackColor="White" BorderWidth="1px" 
                            Height="30px" Width="300px" ScrollBars="Horizontal">
                            <asp:Panel ID="Panel9" runat="server" BorderWidth="1px" BackColor="#E8E8E8" 
                                Height="20px">
                                <table class="style39">
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="Label40" runat="server" Font-Bold="True" 
                                                Text="Clique aqui para mover"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:MultiView ID="MultiView6" runat="server" ActiveViewIndex="0">
                                    <asp:View ID="View2" runat="server">
                                        <br />
                                        <table class="style39">
                                            <tr>
                                                <td class="style44">
                                                    Captador:</td>
                                                <td>
                                                    <asp:DropDownList ID="cboresp_vaga" runat="server" DataSourceID="sqlCaptadores" 
                                                        DataTextField="nome" DataValueField="nome" Font-Size="8pt">
                                                        <asp:ListItem>Empresa</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Empresa:</td>
                                                <td>
                                                    <asp:DropDownList ID="cboid_empresa_fk" runat="server" 
                                                        DataSourceID="sqlEmpresas" DataTextField="nome_fantasia" 
                                                        DataValueField="id_empresa" Enabled="False" Font-Size="8pt" Width="380px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style43" colspan="2">
                                                    <asp:Label ID="lblDadosDavaga" runat="server" Font-Bold="True" 
                                                        Font-Overline="False" Font-Underline="True" Text="DADOS DA VAGA"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Cargo:</td>
                                                <td>
                                                    <asp:DropDownList ID="cboid_cargo_fkPai" runat="server" 
                                                        AppendDataBoundItems="True" AutoPostBack="True" datasourceid="sqlCBOLista0" 
                                                        DataTextField="cargo" DataValueField="id_cargo" Enabled="False" Font-Size="8pt" 
                                                        Width="340px">
                                                    </asp:DropDownList>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Descrição:</td>
                                                <td>
                                                    <asp:DropDownList ID="cboid_cargo_fk" runat="server" 
                                                        datasourceid="sqlCBOEmpresaVaga0" DataTextField="cargo" 
                                                        DataValueField="id_cargo" Enabled="False" Font-Size="8pt" 
                                                        Font-Strikeout="False" Width="380px">
                                                    </asp:DropDownList>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Modalidade:</td>
                                                <td>
                                                    <asp:DropDownList ID="CBOModalidade" runat="server" AutoPostBack="True" 
                                                        Enabled="False" Font-Size="8pt">
                                                        <asp:ListItem Value="E">Efetiva</asp:ListItem>
                                                        <asp:ListItem Selected="True" Value="T">Temporária</asp:ListItem>
                                                        <asp:ListItem Value="F">Freelancer</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Quantidade:</td>
                                                <td>
                                                    <asp:TextBox ID="txtQuantVaga" runat="server" CausesValidation="True" 
                                                        MaxLength="10" ReadOnly="True" Width="60px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Local de trabalho:</td>
                                                <td>
                                                    <asp:DropDownList ID="CBOid_localtrabalho_fk" runat="server" 
                                                        datasourceid="sqlMunicipioLista0" DataTextField="nome" 
                                                        DataValueField="id_municipio" Enabled="False" Font-Size="8pt">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Bairro:</td>
                                                <td>
                                                    <asp:TextBox ID="txtbairrovaga" runat="server" MaxLength="40" ReadOnly="True"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Horário de trabalho:</td>
                                                <td>
                                                    das
                                                    <asp:TextBox ID="txtHorario_entrada" runat="server" MaxLength="5" 
                                                        ReadOnly="True" Text='<%# Bind("horario_entrada") %>' 
                                                        ToolTip="Digite no formato HH:MM, inclusive os dois pontos." Width="70px" />
                                                    <ajaxToolkit:MaskedEditExtender ID="Horario_entrada_MaskedEditExtender" 
                                                        runat="server" Mask="99:99" MaskType="Time" 
                                                        TargetControlID="txtHorario_entrada">
                                                    </ajaxToolkit:MaskedEditExtender>
                                                    &nbsp;às
                                                    <asp:TextBox ID="txtHorario_saida" runat="server" MaxLength="5" ReadOnly="True" 
                                                        Text='<%# Bind("horario_saida") %>' 
                                                        ToolTip="Digite no formato HH:MM, inclusive os dois pontos." Width="70px" />
                                                    <ajaxToolkit:MaskedEditExtender ID="Horario_saida_MaskedEditExtender" 
                                                        runat="server" Mask="99:99" MaskType="Time" TargetControlID="txtHorario_saida">
                                                    </ajaxToolkit:MaskedEditExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Dias de trabalho:
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chkSegunda" runat="server" Checked='<%# Bind("segunda") %>' 
                                                        Enabled="False" Font-Size="7pt" Text="Seg" />
                                                    <asp:CheckBox ID="chkTerca" runat="server" Checked='<%# Bind("terca") %>' 
                                                        Enabled="False" Font-Size="7pt" Text="Ter" />
                                                    <asp:CheckBox ID="chkQuarta" runat="server" Checked='<%# Bind("quarta") %>' 
                                                        Enabled="False" Font-Size="7pt" Text="Quar" />
                                                    <asp:CheckBox ID="chkQuinta" runat="server" Checked='<%# Bind("quinta") %>' 
                                                        Enabled="False" Font-Size="7pt" Text="Qui" />
                                                    <asp:CheckBox ID="chkSexta" runat="server" Checked='<%# Bind("sexta") %>' 
                                                        Enabled="False" Font-Size="7pt" Text="Sex" />
                                                    <asp:CheckBox ID="chkSabado" runat="server" Checked='<%# Bind("sabado") %>' 
                                                        Enabled="False" Font-Size="7pt" Text="Sab" />
                                                    <asp:CheckBox ID="chkDomingo" runat="server" Checked='<%# Bind("domingo") %>' 
                                                        Enabled="False" Font-Size="7pt" Text="Dom" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Obs. Horário de Trabalho:</td>
                                                <td>
                                                    <asp:TextBox ID="txtHorario_obs" runat="server" MaxLength="500" ReadOnly="True" 
                                                        Rows="3" Text='<%# Bind("horario_obs") %>' TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Salário:</td>
                                                <td>
                                                    <asp:TextBox ID="moeSalario" runat="server" MaxLength="10" ReadOnly="True" 
                                                        Text='<%# Bind("salario") %>' 
                                                        ToolTip="Digite o valor monetário (ex.1.000,00) com ponto e vírgula." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Obs. Salário:</td>
                                                <td>
                                                    <asp:TextBox ID="txtsalario_observacao" runat="server" MaxLength="500" 
                                                        ReadOnly="True" Rows="3" Text='<%# Bind("salario_observacao") %>' 
                                                        TextMode="MultiLine" Width="300px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Benefícios:</td>
                                                <td>
                                                    <asp:CheckBox ID="chkrefeicao_local" runat="server" 
                                                        Checked='<%# Bind("refeicao_local") %>' Font-Size="8pt" 
                                                        Text="Refeição no local" />
                                                    <asp:CheckBox ID="chkVale_alimentacao" runat="server" Font-Size="8pt" 
                                                        Text="Vale alimentação" />
                                                    <asp:CheckBox ID="chkPlano_saude" runat="server" 
                                                        Checked='<%# Bind("plano_saude") %>' Font-Size="8pt" Text="Plano de saúde" />
                                                    <asp:CheckBox ID="chkVale_refeicao" runat="server" 
                                                        Checked='<%# Bind("vale_refeicao") %>' Font-Size="8pt" Text="Vale refeição" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Vale Transporte:</td>
                                                <td>
                                                    <asp:TextBox ID="moeValetransporte" runat="server" MaxLength="10" 
                                                        ReadOnly="True" Text='<%# Bind("salario") %>' 
                                                        ToolTip="Digite o valor monetário (ex.1.000,00) com ponto e vírgula." 
                                                        Width="60px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Outras Observações:</td>
                                                <td>
                                                    <asp:TextBox ID="txtdados_qualitativos" runat="server" MaxLength="1000" 
                                                        ReadOnly="True" Rows="3" Text='<%# Bind("dados_qualitativos") %>' 
                                                        TextMode="MultiLine" Width="300px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    <asp:Label ID="lblDadosdoPerfil" runat="server" Font-Bold="True" 
                                                        Font-Underline="True" Text="DADOS DO PERFIL DO CANDIDATO PARA A VAGA"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Perfil:</td>
                                                <td>
                                                    <asp:TextBox ID="txtperfil" runat="server" MaxLength="2000" ReadOnly="True" 
                                                        Rows="3" style="margin-left: 0px" Text='<%# Bind("perfil") %>' 
                                                        TextMode="MultiLine" Width="250px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Escolaridade:</td>
                                                <td>
                                                    <asp:DropDownList ID="cboid_escolaridade_fk" runat="server" 
                                                        datasourceid="sqlEscolaridadeLista0" DataTextField="formacao" 
                                                        DataValueField="id_formacaonivel" Enabled="False" Font-Size="8pt">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Faixa Etária:</td>
                                                <td>
                                                    <asp:DropDownList ID="cboFaixaetariainicial" runat="server" 
                                                        datasourceid="sqlFaixaEtariaLista0" DataTextField="faixa" 
                                                        DataValueField="faixa" Enabled="False" Font-Size="8pt">
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="cboFaixaetariaFinal" runat="server" 
                                                        datasourceid="sqlFaixaEtariaLista0" DataTextField="faixa" 
                                                        DataValueField="faixa" Enabled="False" Font-Size="8pt">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Sexo:</td>
                                                <td>
                                                    <asp:DropDownList ID="CBOsexo" runat="server" datasourceid="sqlSexo0" 
                                                        DataTextField="sexo" DataValueField="id_sexo" Enabled="False" Font-Size="8pt">
                                                        <asp:ListItem Value="M">Masculino</asp:ListItem>
                                                        <asp:ListItem Value="F">Feminino</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Estado Civil:</td>
                                                <td>
                                                    <asp:DropDownList ID="CBOEstado_civil" runat="server" 
                                                        datasourceid="sqlEstadoCivilLista0" DataTextField="estadocivil" 
                                                        DataValueField="id_estadocivil" Enabled="False" Font-Size="8pt">
                                                        <asp:ListItem Value="S">Solteiro</asp:ListItem>
                                                        <asp:ListItem Value="C">Casado</asp:ListItem>
                                                        <asp:ListItem Value="D">Desquitado</asp:ListItem>
                                                        <asp:ListItem Value="R">Divorciado</asp:ListItem>
                                                        <asp:ListItem Value="V">Viúvo</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    <asp:Label ID="lblDadosDaEntrevista" runat="server" Font-Bold="True" 
                                                        Font-Underline="True" Text="DADOS DA ENTREVISTA"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Rua:</td>
                                                <td>
                                                    <asp:TextBox ID="txtRua" runat="server" ReadOnly="True" Width="300px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Complemento:</td>
                                                <td>
                                                    <asp:TextBox ID="txtcomplemento" runat="server" ReadOnly="True" Width="80px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Município:</td>
                                                <td>
                                                    <asp:DropDownList ID="cboid_municipio_fkEnt" runat="server" 
                                                        DataSourceID="SqlmunicipioEntrevista" DataTextField="nome" 
                                                        DataValueField="id_municipio" Enabled="False" Font-Size="8pt">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Bairro:</td>
                                                <td>
                                                    <asp:TextBox ID="txtBairroEnt" runat="server" ReadOnly="True"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style44">
                                                    Ponto de referência:</td>
                                                <td>
                                                    <asp:TextBox ID="txtpontoreferencia" runat="server" MaxLength="1000" 
                                                        ReadOnly="True" Rows="3" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                    </asp:View>
                                </asp:MultiView>
                            </asp:Panel>
                        </asp:Panel>
                        <ajaxToolkit:ResizableControlExtender ID="Panel8_ResizableControlExtender" 
                            runat="server" Enabled="True" TargetControlID="Panel8" 
                            HandleCssClass="handleText" ResizableCssClass="resizingText" 
                            HandleOffsetX="-20" HandleOffsetY="-20" MaximumHeight="10000" 
                            MinimumHeight="30" MinimumWidth="300">
                        </ajaxToolkit:ResizableControlExtender>
                        <ajaxToolkit:DragPanelExtender ID="Panel8_DragPanelExtender" runat="server" 
                            DragHandleID="Panel9" Enabled="True"  TargetControlID="Panel8">
                        </ajaxToolkit:DragPanelExtender>
                        <asp:SqlDataSource ID="sqlMunicipioLista0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT [id_municipio], [nome] FROM [tblMunicipio] ORDER BY [id_municipio]">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlmunicipioEntrevista" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT [id_municipio], [nome] FROM [tblMunicipio]">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlFaixaEtariaLista0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT faixa FROM tblFaixaEtaria ORDER BY faixa">
                        </asp:SqlDataSource>
                        <br />
                        <%--<a href="DetalheVaga.aspx" target="_blank"  >Detalhes da vaga</a>--%>
                        &nbsp;<asp:SqlDataSource ID="sqlEscolaridadeLista0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT [id_formacaonivel], [formacao] FROM [tblFormacaoNivel] ORDER BY [id_formacaonivel]">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlEstadoCivilLista0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT [id_estadocivil], [estadocivil] FROM [tblEstadoCivil] ORDER BY [estadocivil]">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlSexo0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="SELECT [id_sexo], [sexo] FROM [tblSexo] ORDER BY [id_sexo]">
                        </asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="sqlCBOEmpresaVaga0" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        
                            
                            SelectCommand="SELECT id_cargo, cargo, tipo FROM tblCBO WHERE (tipo &lt;&gt; 'Família')">
                                                    </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlCBOLista0" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        SelectCommand="SELECT id_cargo, cargo FROM tblCBO WHERE (tipo = 'Família') ORDER BY cargo">
                                                    </asp:SqlDataSource>
                        <br />
                        <asp:MultiView ID="MultiView4" runat="server" ActiveViewIndex="0">
                            <asp:View ID="ViewCandidatos" runat="server">
                                <span class="style23" lang="pt-br"><span class="style34">
                                <span lang="pt-br">
                                <a name="Passo3"></a>
                                <asp:Panel ID="Panel5" runat="server" BackColor="#FFAE5E" Height="20px">
                                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                        <span lang="pt-br">&nbsp;&nbsp; 3° Passo - INICIAR A CAPTAÇÃO - verifique os dados da 
                                        vaga, perfil, entrevista e candidatos</span></div>
                                    <br />
                                </asp:Panel>
                                </span>
                                </span></span>
                                <div>
                                    <br />
                                    <asp:Label ID="Label39" runat="server" 
                                        style="font-weight: 700; font-size: small" 
                                        Text="Candidatos que estão no perfil da vaga"></asp:Label>
                                    <br />
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <br />
                                            <table class="style24">
                                                <tr>
                                                    <td class="style25">
                                                        <span class="style22"><span class="style23" lang="pt-br">Nome:</span></span></td>
                                                    <td class="style26">
                                                        <asp:TextBox ID="txbNomeBusca" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style25">
                                                        <span class="style22"><span class="style23" lang="pt-br">CPF:</span></span></td>
                                                    <td class="style26">
                                                        <asp:TextBox ID="txbCPF" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ID="ImageButton3" runat="server" 
                                                            ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" 
                                                            CausesValidation="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                            <br />
                                            <asp:LinkButton ID="LinkButton1" runat="server">Desmarcar Tudo</asp:LinkButton>
                                            <br />
                                            <br />
                                            <b>
                                            <asp:ImageButton ID="ImageButton8" runat="server" 
                                                ImageUrl="~/Icones/Standard/001_51.gif" 
                                                onclientclick="return confirm('Deseja encaminhar esses candidatos?')" />
                                            &nbsp; Clique na seta laranja para incluir os candidatos selecionados na LISTA DE 
                                            ENCAMINHADOS</b><br />
                                            
                                            <br />
                                            <asp:Label ID="lblErro" runat="server" 
                                                style="font-size: small; font-weight: 700; color: #FF0000" 
                                                Font-Bold="False"></asp:Label>
                                            <br />
                                            <asp:GridView ID="Gridcandidato0" runat="server" AllowPaging="True" 
                                                AutoGenerateColumns="False" CssClass="grid" DataKeyNames="id_candidato,nome" 
                                                DataSourceID="SqlCandidatos0" AllowSorting="True">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Entrevista">
                                                        <ItemTemplate>
                                                            <table class="style35">
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                                                             Font-Size="X-Small" RepeatDirection="Horizontal">
                                                                            <asp:ListItem Value="9">Click</asp:ListItem>
                                                                            <asp:ListItem Value="1">Empresa</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="id_candidato" HeaderText="Cód. Candidato" 
                                                        InsertVisible="False" ReadOnly="True" SortExpression="id_candidato" >
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="identificador" HeaderText="CPF" 
                                                        SortExpression="identificador">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle Width="90px" HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Visualizar currículo">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnViewCandidato0" runat="server" CausesValidation="False" 
                                                                CommandArgument='<%# Bind("id_candidato") %>' 
                                                                ImageUrl="~/clickoportunidades/icones/Standard/001_37.gif" 
                                                                onclick="btnViewCandidato_Click" ToolTip="Visualizar dados do candidato" 
                                                                Visible='<%# Bind("id_candidato") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="nome" HeaderText="Candidato" SortExpression="nome">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle Width="200px" HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Telefones" SortExpression="telefone">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label37" runat="server" Text='<%# Bind("telefone") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label38" runat="server" Text='<%# Bind("celular") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("telefone") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="municipio" HeaderText="Cidade" 
                                                        SortExpression="municipio" >
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="bairro" HeaderText="Bairro" 
                                                        SortExpression="bairro" >
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="sexo" HeaderText="Sexo" 
                                                        SortExpression="sexo" >
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nascimento" HeaderText="Data de nascimento" 
                                                        SortExpression="nascimento" >
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="formacao" HeaderText="Escolaridade" 
                                                        SortExpression="formacao" >
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <span lang="pt-br" 
                                                        style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                                    Não existe candidatos para essa vaga. </span>
                                                </EmptyDataTemplate>
                                                <SelectedRowStyle BackColor="#D1DDF1" />
                                            </asp:GridView>
                                            <br />
                                            <asp:Label ID="lblMsg" runat="server" 
                                                style="font-weight: 700; color: #FF0000; background-color: #FFFFFF" 
                                                Font-Size="12px"></asp:Label>
                                            <br />
                                            <br />
                                            <b>
                                            <asp:ImageButton  ID="ImageButton7" runat="server" 
                                                ImageUrl="~/Icones/Standard/001_51.gif" 
                                                onclientclick="return confirm('Deseja encaminhar esses candidatos?')" />
                                            &nbsp; Clique na seta laranja para incluir os candidatos selecionados na LISTA DE 
                                            ENCAMINHADOS<br />
                                            <br />
                                            </b><br />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <br />
                                    <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                    <a name="Passo4"></a>
                                    <asp:Panel ID="Panel7" runat="server" BackColor="#FFAE5E" Height="20px">
                                        <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                            <span lang="pt-br">&nbsp;&nbsp; 4° Passo - LISTA DE CAPTADOS DO SITE</span></div>
                                        <br />
                                    </asp:Panel>
                                    </span></span></span>
                                    <br />
                                    
                                    <br />
                                    <asp:SqlDataSource ID="SqlCandidatos0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        
                                        
                                        
                                        
                                        SelectCommand="SELECT DISTINCT '0' AS selecionado, tblCandidato.id_tipo_fk, tblCandidato.nome, tblCandidato.telefone, tblCandidato.celular, tblCandidato.email, tblCandidato.id_candidato, tblCandidato.bairro, tblCandidato.nascimento, tblMunicipio.nome AS municipio, (SELECT TOP (1) b.formacao FROM tblCandidatoFormacao AS a INNER JOIN tblFormacaoNivel AS b ON a.id_formacaonivel_fk = b.id_formacaonivel WHERE (a.id_candidato_fk = tblCandidato.id_candidato) ORDER BY b.id_formacaonivel DESC) AS formacao, tblSexo.sexo, tblCandidato.sexo AS Expr1, tblCandidato.cidade, tblSGA_ClientesComOferta.id_oferta, tblCandidato.identificador FROM tblCandidato INNER JOIN tblCandidatoFormacao ON tblCandidato.id_candidato = tblCandidatoFormacao.id_candidato_fk INNER JOIN tblFormacaoNivel ON tblCandidatoFormacao.id_formacaonivel_fk = tblFormacaoNivel.id_formacaonivel INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio INNER JOIN tblSexo ON tblCandidato.sexo = tblSexo.id_sexo INNER JOIN tblSGA_ClientesComOferta ON tblCandidato.identificador = tblSGA_ClientesComOferta.IDENTIFICADOR WHERE (tblCandidato.id_candidato NOT IN (SELECT id_cadidato_fk FROM tblCandidatoEntrevista)) AND (tblSGA_ClientesComOferta.id_oferta IN (SELECT id_oferta_fk FROM tblProgramacaoEntrevista WHERE (id_entrevista_fk = @id_entrevista))) AND (tblCandidato.identificador LIKE @identificador + '%') AND (tblCandidato.nome LIKE @nome + '%') ORDER BY tblCandidato.nome">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txbCPF" Name="identificador" 
                                                PropertyName="Text" DefaultValue="%" />
                                            <asp:ControlParameter ControlID="txtnome" Name="nome" PropertyName="Text" 
                                                DefaultValue="%" />
                                            <asp:SessionParameter DefaultValue="" Name="id_entrevista" 
                                                SessionField="id_entrevista" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                    <asp:DetailsView ID="dtvDetalheVaga4" runat="server" AutoGenerateRows="False" 
                                        DataSourceID="sqldetalhevaga" Font-Bold="False" 
                                        Height="50px" Width="547px" Font-Size="11px" style="margin-right: 4px">
                                        <FieldHeaderStyle Width="90px" />
                                        <Fields>
                                            <asp:BoundField DataField="nome_fantasia" HeaderText="Nome da empresa:" 
                                                SortExpression="nome_fantasia" />
                                            <asp:TemplateField HeaderText="Endereço da entrevista:" SortExpression="rua">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label261" runat="server" Font-Bold="False" 
                                                        Text='<%# Bind("rua") %>'></asp:Label>
                                                    , <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                                    <asp:Label ID="Label262" runat="server" Font-Bold="False" 
                                                        Text='<%# Bind("complemento", "{0}") %>' Font-Size="11px"></asp:Label>
                                                    &nbsp;,
                                                    <asp:Label ID="Label263" runat="server" Font-Bold="False" 
                                                        Text='<%# Bind("bairroent", "{0}") %>' Font-Size="11px"></asp:Label>
                                                    </span></span></span>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("rua") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("rua") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="pontoreferencia" HeaderText="Ponto de referência" 
                                                SortExpression="pontoreferencia" />
                                            <asp:TemplateField HeaderText="Data da entrevista na Empresa:" 
                                                SortExpression="dataempresa">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label264" runat="server" 
                                                        Text='<%# Bind("dataEmpresa", "{0:D}") %>'></asp:Label>
                                                    &nbsp;às <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                                                        style="font-size: 11px; font-weight: normal">
                                                    <asp:Label ID="Label265" runat="server" 
                                                        Text='<%# Bind("horaEmpresa", "{0}") %>'></asp:Label>
                                                    h</span></span></span>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label265" runat="server" Text='<%# Eval("dataempresa") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox23" runat="server" 
                                                        Text='<%# Bind("dataempresa", "{0:D}") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Data da entrevista no Click:" 
                                                SortExpression="dataclick">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label266" runat="server" 
                                                        Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                                                    &nbsp;às <span class="style23" lang="pt-br"><span class="style34">
                                                    <span lang="pt-br" 
                                                        style="font-weight: normal; font-size: 11px;">
                                                    <asp:Label ID="Label267" runat="server" Font-Bold="False" 
                                                        Text='<%# Bind("horaClick", "{0}") %>' Font-Size="11px"></asp:Label>
                                                    h</span></span></span>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label268" runat="server" Text='<%# Eval("dataclick") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("dataclick") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemStyle Font-Size="11px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="comentario" HeaderText="Obs:" 
                                                SortExpression="comentario" />
                                            <asp:TemplateField HeaderText="Dados do responsável da entrevista:">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label269" runat="server" Font-Bold="False" 
                                                        Text='<%# Eval("respEntrevista", "{0}") %>'></asp:Label>
                                                    &nbsp;/ <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                                                        style="font-weight: normal">
                                                    <asp:Label ID="Label270" runat="server" Font-Bold="False" 
                                                        Text='<%# Eval("respTelefone") %>' Font-Size="11px"></asp:Label>
                                                    &nbsp;/
                                                    <asp:Label ID="Label271" runat="server" Font-Bold="False" 
                                                        Text='<%# Eval("respCelular", "{0}") %>' Font-Size="11px"></asp:Label>
                                                    &nbsp;/<asp:Label ID="Label272" runat="server" 
                                                        Text='<%# Bind("respEmail", "{0}") %>' Font-Size="11px"></asp:Label>
                                                    </span></span></span>
                                                </ItemTemplate>
                                                <ItemStyle Font-Size="11px" />
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                    </span></span></span>
                                    <br />
                                    <asp:GridView ID="GridEncaminhados" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" CssClass="grid" 
                                        DataKeyNames="id_candidatoentr" 
                                        DataSourceID="sqlEncaminhados">
                                        <Columns>
                                            <asp:BoundField DataField="nome" HeaderText="Nome do Candidato" 
                                                SortExpression="nome" />
                                            <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo" />
                                            <asp:TemplateField HeaderText="Data de nascimento" SortExpression="nascimento">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nascimento") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nascimento", "{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="identificador" HeaderText="CPF" 
                                                SortExpression="identificador" />
                                            <asp:BoundField DataField="bairro" HeaderText="Bairro" 
                                                SortExpression="bairro" />
                                            <asp:BoundField DataField="municipio" HeaderText="Municipio" 
                                                SortExpression="municipio" />
                                            <asp:BoundField DataField="telefone" HeaderText="Telefones" 
                                                SortExpression="telefone" />
                                            <asp:BoundField DataField="statusEntrevista" 
                                                HeaderText="Forma de Encaminhamento" SortExpression="statusEntrevista" />
                                            <asp:TemplateField HeaderText="Voltar para Captação">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton9" runat="server" CommandName="delete" 
                                                        ImageUrl="~/Icones/voltar.jpg" 
                                                        onclientclick="return confirm('Deseja voltar esse candidato para captação?')" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <span lang="pt-br" 
                                                style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                            Não existe candidatos para essa vaga. </span>
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#D1DDF1" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sqlConvocacaoForm" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        DeleteCommand="DELETE FROM [tblCandidatoEntrevista] WHERE [id_candidatoentr] = @id_candidatoentr" 
                                        InsertCommand="INSERT INTO tblCandidatoEntrevista(id_cadidato_fk, id_entrevista_fk, Captador, FormaEnc, DataCaptacao, id_vaga_fk) VALUES (@id_cadidato_fk, @id_entrevista_fk, @Captacao, @formaenc, GETDATE(), @id_vaga_fk)" 
                                        SelectCommand="SELECT tblCandidatoEntrevista.id_candidatoentr, tblCandidatoEntrevista.id_cadidato_fk, tblCandidatoEntrevista.id_entrevista_fk, tblCandidatoEntrevista.DataCaptacao, tblCandidatoEntrevista.FormaEnc, tblCandidatoEntrevista.observacao, tblCandidatoEntrevista.Captador, tblCandidato.nome AS NomeCandidato, tblSexo.sexo FROM tblCandidatoEntrevista INNER JOIN tblCandidato ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidato.id_candidato INNER JOIN tblSexo ON tblCandidato.sexo = tblSexo.id_sexo WHERE (tblCandidatoEntrevista.id_candidatoentr = @id_candidatoentr)" 
                                        
                                        
                                        UpdateCommand="UPDATE tblCandidatoEntrevista SET id_cadidato_fk = @id_cadidato_fk, id_entrevista_fk = @id_entrevista_fk, DataCaptacao = @DataCaptacao, FormaEnc = @FormaEnc, observacao = @observacao, Captador = @captador WHERE (id_candidatoentr = @id_candidatoentr)">
                                        <SelectParameters>
                                            <asp:Parameter Name="id_candidatoentr"  />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="id_candidatoentr" Type="Int32" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="id_cadidato_fk" />
                                            <asp:Parameter Name="id_entrevista_fk" />
                                            <asp:Parameter Name="DataCaptacao" />
                                            <asp:Parameter Name="FormaEnc" />
                                            <asp:Parameter Name="observacao" />
                                            <asp:Parameter Name="captador" />
                                            <asp:Parameter Name="id_candidatoentr" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="id_cadidato_fk" Type="Int32" />
                                            <asp:ControlParameter ControlID="GridEntrevistaGeral" Name="id_entrevista_fk" 
                                                PropertyName="SelectedValue" />
                                            <asp:SessionParameter Name="Captacao" SessionField="c_Nome" />
                                            <asp:Parameter Name="formaenc" />
                                            <asp:sessionParameter Name="id_vaga_fk" SessionField="id_vaga" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                   
                                    <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                    
                                    <a name="Passo5"></a>
                                    <asp:Panel ID="Panel6" runat="server" BackColor="#FFAE5E" Height="20px">
                                        <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                            <span lang="pt-br">&nbsp;&nbsp; 5° Passo - INCLUIR NOVOS CANDIDATOS NA LISTA DE CAPTADOS</span></div>
                                        <br />
                                    </asp:Panel>
                                    </span></span></span>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                        <asp:MultiView ID="MultiView5" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="ViewNovosCandidatos" runat="server">
                                            <table class="style39">
                                                <tr>
                                                    <td class="style41">
                                                        CPF:</td>
                                                    <td class="style40">
                                                        <asp:TextBox ID="txbCPFNovo" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ID="ImageButton11" runat="server" 
                                                            ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <asp:GridView ID="GridNovosCandidatos" runat="server" AllowPaging="True" 
                                                        AllowSorting="True" AutoGenerateColumns="False" CssClass="grid" 
                                                        DataKeyNames="id_candidato" DataSourceID="sqlCandidatosNovo">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="ImageButton14" runat="server" CommandName="Select" 
                                                                        ImageUrl="~/Icones/Standard/001_59.gif" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="id_candidato" HeaderText="ID Candidato" 
                                                                InsertVisible="False" ReadOnly="True" SortExpression="id_candidato" />
                                                            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                                                            <asp:BoundField DataField="nascimento" HeaderText="Data Nascimento" 
                                                                SortExpression="nascimento" />
                                                            <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo" />
                                                            <asp:BoundField DataField="identificador" HeaderText="CPF" 
                                                                SortExpression="identificador" />
                                                            <asp:BoundField DataField="bairro" HeaderText="Bairro" 
                                                                SortExpression="bairro" />
                                                            <asp:BoundField DataField="Municipio" HeaderText="Município" 
                                                                SortExpression="Municipio" />
                                                            <asp:BoundField DataField="telefone" HeaderText="Telefone" 
                                                                SortExpression="telefone" />
                                                        </Columns>
                                                        <EmptyDataTemplate>
                                                            <span lang="pt-br" 
                                                                style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                                            Não existe candidatos para essa vaga. </span>
                                                        </EmptyDataTemplate>
                                                        <SelectedRowStyle BackColor="#D1DDF1" />
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="sqlCandidatosNovo" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        
                                                        SelectCommand="SELECT tblMunicipio.nome AS Municipio, CASE WHEN dbo.tblCandidatoEntrevista.id_candidatoentr IS NULL THEN 'True' ELSE 'False' END AS habilitaEncaminhar, CASE WHEN dbo.tblCandidatoEntrevista.id_candidatoentr IS NULL THEN 'False' ELSE 'True' END AS habilitaTipoEnc, tblCandidato.id_candidato, tblCandidato.nome, tblCandidato.identificador_tipo, tblCandidato.identificador, tblCandidato.rg, tblCandidato.id_nacionalidade, tblCandidato.nascimento, tblCandidato.sexo, tblCandidato.id_estadocivil, tblCandidato.endereco, tblCandidato.numero, tblCandidato.complemento, tblCandidato.bairro, tblCandidato.id_municipio, tblCandidato.estado_fk, tblCandidato.cep, tblCandidato.telefone, tblCandidato.celular, tblCandidato.telefone_recado, tblCandidato.email, tblCandidato.dependentes, tblCandidato.observacao, tblCandidato.id_contato, tblCandidato.ultima_atualizacao, tblCandidato.id_descobriu_fk, tblCandidato.descobriu_outros, tblCandidato.observacoes, tblCandidato.senha, tblCandidato.id_deficiente_fk, tblCandidato.emailnao, tblCandidato.nomePai, tblCandidato.nomeMae, tblCandidato.cidade, tblCandidato.lembrete, tblCandidato.id_evento, tblCandidato.id_unidade, tblCandidato.id_tipo_fk FROM tblMunicipio INNER JOIN tblCandidato ON tblMunicipio.id_municipio = tblCandidato.id_municipio LEFT OUTER JOIN tblCandidatoEntrevista ON tblCandidato.id_candidato = tblCandidatoEntrevista.id_cadidato_fk WHERE (tblCandidato.id_tipo_fk = 2)">
                                                    </asp:SqlDataSource>
                                                    <br />
                                                    <asp:Label ID="lblmsgcandidatoextra" runat="server"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <table class="style39">
                                                        <tr>
                                                            <td class="style26">
                                                                <asp:Label ID="lblNomeCandidato" runat="server" Text="Nome do Candidato:"></asp:Label>
                                                            </td>
                                                            <td class="style42">
                                                                <asp:TextBox ID="txtnome" runat="server" Width="250px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                    ControlToValidate="txtnome" ErrorMessage="* Campo Obrigatório" 
                                                                    ValidationGroup="novocandidato"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                                <asp:Label ID="lblunidade" runat="server" Text="Unidade:"></asp:Label>
                                                            </td>
                                                            <td class="style42">
                                                                <asp:DropDownList ID="cboid_unidade_fk" runat="server" 
                                                                    DataSourceID="sqlUnidade" DataTextField="sigla" DataValueField="id_unidade" 
                                                                    Font-Size="X-Small" Width="250px">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                                <asp:Label ID="lbldataNascimento" runat="server" Text="Data Nascimento:"></asp:Label>
                                                            </td>
                                                            <td class="style42">
                                                                <asp:TextBox ID="txtDataNascimento" runat="server" Font-Names="Verdana" 
                                                                    Font-Size="12px" MaxLength="15" Width="90px"></asp:TextBox>
                                                                <ajaxToolkit:MaskedEditExtender ID="txtDataNascimento_MaskedEditExtender" 
                                                                    runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    Mask="99/99/9999" MaskType="Date" TargetControlID="txtDataNascimento" 
                                                                    UserDateFormat="DayMonthYear">
                                                                </ajaxToolkit:MaskedEditExtender>
                                                                <ajaxToolkit:CalendarExtender ID="txtDataNascimento_CalendarExtender" 
                                                                    runat="server" Enabled="True" Format="dd/MM/yyyy" PopupButtonID="btnCalendario" 
                                                                    PopupPosition="BottomRight" TargetControlID="txtDataNascimento">
                                                                </ajaxToolkit:CalendarExtender>
                                                                <asp:ImageButton ID="btnCalendario" runat="server" 
                                                                    ImageUrl="~/Icones/calendario.jpg" />
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                    ControlToValidate="txtDataNascimento" ErrorMessage="* Campo Obrigatório" 
                                                                    ValidationGroup="novocandidato"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                                <asp:Label ID="lblsexo" runat="server" Text="Sexo:"></asp:Label>
                                                            </td>
                                                            <td class="style42">
                                                                <asp:DropDownList ID="cboid_sexo_fk" runat="server" Font-Size="X-Small">
                                                                    <asp:ListItem Value="M">Masculino</asp:ListItem>
                                                                    <asp:ListItem Value="F">Feminino</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                                CPF:</td>
                                                            <td class="style42">
                                                                <asp:TextBox ID="txtidentificador" runat="server" 
                                                                    onkeyup="FormataCpf(this,event)"  Width="150px" MaxLength="14"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                                <asp:Label ID="lblcidade" runat="server" Text="Cidade:"></asp:Label>
                                                            </td>
                                                            <td class="style42">
                                                                <asp:DropDownList ID="cboid_municipio_fk" runat="server" 
                                                                    DataSourceID="sqlMunicipio" DataTextField="nome" DataValueField="id_municipio" 
                                                                    Font-Size="X-Small">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                                <asp:Label ID="lblBairro" runat="server" Text="Bairro:"></asp:Label>
                                                            </td>
                                                            <td class="style42">
                                                                <asp:TextBox ID="txtbairro" runat="server" Width="200px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                    ControlToValidate="txtbairro" ErrorMessage="* Campo Obrigatório" 
                                                                    ValidationGroup="novocandidato"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                                <asp:Label ID="lbltelefone" runat="server" Text="Telefone:"></asp:Label>
                                                            </td>
                                                            <td class="style42">
                                                                <asp:TextBox ID="txttelefone" onkeypress="Mascara(this);" runat="server" 
                                                                    MaxLength="13"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                                <asp:Label ID="lblFormaEnc" runat="server" Text="Forma de Encaminhamento:"></asp:Label>
                                                            </td>
                                                            <td class="style42">
                                                                <asp:DropDownList ID="cboid_formaenc_fk" runat="server" 
                                                                    DataSourceID="sqlFormaEnc" DataTextField="statusEntrevista" 
                                                                    DataValueField="id_statusEntrevista" Font-Size="X-Small">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                            </td>
                                                            <td class="style42">
                                                                &nbsp;</td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style26">
                                                                &nbsp;</td>
                                                            <td class="style42">
                                                                <asp:ImageButton ID="btnIncluir" runat="server" ImageUrl="~/Icones/001_01.gif" 
                                                                    ValidationGroup="novocandidato" ToolTip="Adicionar candidato" />
                                                                <asp:ImageButton ID="btnSalvar" runat="server" 
                                                                    ImageUrl="~/Icones/Standard/001_06.gif" ValidationGroup="novocandidato" 
                                                                    Visible="False" ToolTip="Atualizar candidato" />
                                                                <asp:ImageButton ID="ImageButton13" runat="server" 
                                                                    ImageUrl="~/Icones/Standard/001_02.gif" ToolTip="Cancelar cadastro" />
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <asp:SqlDataSource ID="sqlEncaminharExtra" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                DeleteCommand="DELETE FROM [tblCandidatoEntrevistaExtra] WHERE [Id_captacao_extra] = @Id_captacao_extra" 
                                                InsertCommand="INSERT INTO [tblCandidatoEntrevistaExtra] ([id_candidato_extra], [id_entrevista]) VALUES (@id_candidato_extra, @id_entrevista)" 
                                                SelectCommand="SELECT * FROM [tblCandidatoEntrevistaExtra]" 
                                                UpdateCommand="UPDATE [tblCandidatoEntrevistaExtra] SET [id_candidato_extra] = @id_candidato_extra, [id_entrevista] = @id_entrevista WHERE [Id_captacao_extra] = @Id_captacao_extra">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Id_captacao_extra" Type="Int32" />
                                                </DeleteParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="id_candidato_extra" Type="Int32" />
                                                    <asp:Parameter Name="id_entrevista" Type="Int32" />
                                                    <asp:Parameter Name="Id_captacao_extra" Type="Int32" />
                                                </UpdateParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="id_candidato_extra" Type="Int32" />
                                                    <asp:ControlParameter Name="id_entrevista" ControlID="GridEntrevistaGeral" PropertyName="selectedvalue"  Type="Int32" />
                                                </InsertParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlUnidade" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                SelectCommand="SELECT CAST(id_unidade AS int) AS id_unidade, SIGLA FROM tblSgaUnidade">
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlFormaEnc" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                SelectCommand="SELECT 0 AS id_statusEntrevista, '' AS statusEntrevista UNION SELECT id_statusEntrevista, statusEntrevista FROM tblStatusEntrevista WHERE (id_statusEntrevista = 9) OR (id_statusEntrevista = 1)">
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlMunicipio" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                SelectCommand="SELECT [nome], [id_municipio] FROM [tblMunicipio] WHERE ([estado_fk] = @estado_fk)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="RJ" Name="estado_fk" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlNovosCandidatosForm" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                InsertCommand="INSERT INTO tblCandidato(nome, nascimento, sexo, identificador, bairro, id_municipio, telefone, id_unidade, id_tipo_fk, senha) VALUES (@nome, @dataNascimento, @id_sexo_fk, @identificador, @bairro, @id_municipio_fk, @telefone, @id_unidade_fk, 2, '123')" 
                                                SelectCommand="SELECT tblCandidatoExtra.* FROM tblCandidatoExtra" 
                                                
                                                
                                                UpdateCommand="UPDATE tblCandidato SET nome = @nome, id_unidade = @id_unidade, nascimento = @nascimento, sexo = @sexo, identificador = @identificador, id_municipio = @id_municipio, bairro = @bairro, telefone = @telefone WHERE (id_candidato = @id_candidato)">
                                                <UpdateParameters>
                                                    <asp:ControlParameter ControlID="txtnome" Name="nome" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="txtidentificador" Name="identificador" 
                                                        PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="txtbairro" Name="bairro" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="txttelefone" Name="telefone" 
                                                        PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="cboid_unidade_fk" Name="id_unidade" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="txtDataNascimento" Name="nascimento" 
                                                        PropertyName="Text" Type="DateTime" />
                                                    <asp:ControlParameter ControlID="cboid_sexo_fk" Name="sexo" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="cboid_municipio_fk" Name="id_municipio" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="GridNovosCandidatos" Name="id_candidato" 
                                                        PropertyName="SelectedValue" />
                                                </UpdateParameters>
                                                <InsertParameters>
                                                    <asp:ControlParameter ControlID="txtnome" Name="nome" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="txtdataNascimento" DbType="DateTime" 
                                                        Name="dataNascimento" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="cboid_sexo_fk" Name="id_sexo_fk" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="txtidentificador" Name="identificador" 
                                                        PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="txtbairro" Name="bairro" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="cboid_municipio_fk" Name="id_municipio_fk" 
                                                        PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="txttelefone" Name="telefone" 
                                                        PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="cboid_unidade_fk" DefaultValue="" 
                                                        Name="id_unidade_fk" PropertyName="SelectedValue" />
                                                </InsertParameters>
                                            </asp:SqlDataSource>
                                        </asp:View>
                                    </asp:MultiView>
                                            <asp:SqlDataSource ID="sqlEncaminhados" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                DeleteCommand="DELETE FROM tblCandidatoEntrevista WHERE (id_candidatoentr = @id_candidatoentr)" 
                                                
                                                
                                                
                                                SelectCommand="SELECT tblCandidato.nome, tblCandidato.nascimento, tblCandidato.identificador, tblCandidato.bairro, tblCandidato.telefone, tblMunicipio.nome AS municipio, tblStatusEntrevista.statusEntrevista, tblCandidatoEntrevista.id_candidatoentr, tblSexo.sexo FROM tblCandidatoEntrevista INNER JOIN tblCandidato ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidato.id_candidato INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio INNER JOIN tblStatusEntrevista ON tblCandidatoEntrevista.FormaEnc = tblStatusEntrevista.id_statusEntrevista INNER JOIN tblSexo ON tblCandidato.sexo = tblSexo.id_sexo WHERE (tblCandidato.id_tipo_fk = 1) AND (tblCandidatoEntrevista.id_entrevista_fk = @id_entrevista_fk) ORDER BY tblCandidatoEntrevista.id_candidatoentr DESC">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="id_entrevista_fk" SessionField="id_entrevista" />
                                                </SelectParameters>
                                                <DeleteParameters>
                                                    <asp:Parameter Name="id_candidatoentr" />
                                                </DeleteParameters>
                                            </asp:SqlDataSource>
                                            <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                            <a name="Passo6"></a>
                                            <asp:Panel ID="Panel11" runat="server" BackColor="#FFAE5E" Height="20px">
                                                <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                                    <span lang="pt-br">&nbsp;&nbsp; 6° Passo - LISTA DOS NOVOS CANDIDATOS CAPTADOS PARA A VAGA </span>
                                                </div>
                                            </asp:Panel>
                                            <asp:DetailsView ID="dtvDetalheVaga5" runat="server" AutoGenerateRows="False" 
                                                DataSourceID="sqldetalhevaga" Font-Bold="False" Font-Size="11px" Height="50px" 
                                                style="margin-right: 4px" Width="547px">
                                                <FieldHeaderStyle Width="90px" />
                                                <Fields>
                                                    <asp:BoundField DataField="nome_fantasia" HeaderText="Nome da empresa:" 
                                                        SortExpression="nome_fantasia" />
                                                    <asp:TemplateField HeaderText="Endereço da entrevista:" SortExpression="rua">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label273" runat="server" Font-Bold="False" 
                                                                Text='<%# Bind("rua") %>'></asp:Label>
                                                            , <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                                            <asp:Label ID="Label274" runat="server" Font-Bold="False" Font-Size="11px" 
                                                                Text='<%# Bind("complemento", "{0}") %>'></asp:Label>
                                                            &nbsp;,
                                                            <asp:Label ID="Label275" runat="server" Font-Bold="False" Font-Size="11px" 
                                                                Text='<%# Bind("bairroent", "{0}") %>'></asp:Label>
                                                            </span></span></span>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("rua") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("rua") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="pontoreferencia" HeaderText="Ponto de referência" 
                                                        SortExpression="pontoreferencia" />
                                                    <asp:TemplateField HeaderText="Data da entrevista na Empresa:" 
                                                        SortExpression="dataempresa">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label276" runat="server" 
                                                                Text='<%# Bind("dataEmpresa", "{0:D}") %>'></asp:Label>
                                                            &nbsp;às <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                                                                style="font-size: 11px; font-weight: normal">
                                                            <asp:Label ID="Label277" runat="server" 
                                                                Text='<%# Bind("horaEmpresa", "{0}") %>'></asp:Label>
                                                            h</span></span></span>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label ID="Label278" runat="server" Text='<%# Eval("dataempresa") %>'></asp:Label>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox27" runat="server" 
                                                                Text='<%# Bind("dataempresa", "{0:D}") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Data da entrevista no Click:" 
                                                        SortExpression="dataclick">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label279" runat="server" 
                                                                Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                                                            &nbsp;às <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                                                                style="font-weight: normal; font-size: 11px;">
                                                            <asp:Label ID="Label280" runat="server" Font-Bold="False" Font-Size="11px" 
                                                                Text='<%# Bind("horaClick", "{0}") %>'></asp:Label>
                                                            h</span></span></span>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label ID="Label281" runat="server" Text='<%# Eval("dataclick") %>'></asp:Label>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("dataclick") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemStyle Font-Size="11px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="comentario" HeaderText="Obs:" 
                                                        SortExpression="comentario" />
                                                    <asp:TemplateField HeaderText="Dados do responsável da entrevista:">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label282" runat="server" Font-Bold="False" 
                                                                Text='<%# Eval("respEntrevista", "{0}") %>'></asp:Label>
                                                            &nbsp;/ <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                                                                style="font-weight: normal">
                                                            <asp:Label ID="Label283" runat="server" Font-Bold="False" Font-Size="11px" 
                                                                Text='<%# Eval("respTelefone") %>'></asp:Label>
                                                            &nbsp;/
                                                            <asp:Label ID="Label284" runat="server" Font-Bold="False" Font-Size="11px" 
                                                                Text='<%# Eval("respCelular", "{0}") %>'></asp:Label>
                                                            &nbsp;/<asp:Label ID="Label285" runat="server" Font-Size="11px" 
                                                                Text='<%# Bind("respEmail", "{0}") %>'></asp:Label>
                                                            </span></span></span>
                                                        </ItemTemplate>
                                                        <ItemStyle Font-Size="11px" />
                                                    </asp:TemplateField>
                                                </Fields>
                                            </asp:DetailsView>
                                            </span></span></span>
                                            <br />
                                            <asp:Label ID="Label41" runat="server" Font-Bold="True" 
                                                Text="Candidatos Extras Encaminhados"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:GridView ID="GridEncaminhadosExtra" runat="server" AllowPaging="True" 
                                                AllowSorting="True" AutoGenerateColumns="False" CssClass="grid" 
                                                DataKeyNames="id_candidatoentr" 
                                                DataSourceID="sqlEncaminhados0">
                                                <Columns>
                                                    <asp:BoundField DataField="nome" HeaderText="Nome do Candidato" 
                                                        SortExpression="nome" />
                                                    <asp:TemplateField HeaderText="Programação" SortExpression="cargo">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cargo") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <span lang="pt-br"><b><span class="style22">
                                                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                                                AutoGenerateColumns="False" BackColor="White" BorderStyle="None" 
                                                                DataSourceID="Sqlprogramacaoent" Font-Bold="False" Font-Size="8px" 
                                                                ForeColor="White" GridLines="None" PageSize="3" ShowHeader="False">
                                                                <Columns>
                                                                    <asp:BoundField DataField="nome" ShowHeader="False" SortExpression="nome">
                                                                        <FooterStyle BackColor="White" ForeColor="Black" />
                                                                    </asp:BoundField>
                                                                </Columns>
                                                                <FooterStyle ForeColor="Black" />
                                                            </asp:GridView>
                                                            </span></b></span>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo" />
                                                    <asp:BoundField DataField="nascimento" HeaderText="Data de nascimento" 
                                                        SortExpression="nascimento" />
                                                    <asp:BoundField DataField="identificador" HeaderText="CPF" 
                                                        SortExpression="identificador" />
                                                    <asp:BoundField DataField="bairro" HeaderText="Bairro" 
                                                        SortExpression="bairro" />
                                                    <asp:BoundField DataField="municipio" HeaderText="Municipio" 
                                                        SortExpression="municipio" />
                                                    <asp:BoundField DataField="telefone" HeaderText="Telefones" 
                                                        SortExpression="telefone" />
                                                    <asp:BoundField DataField="statusEntrevista" 
                                                        HeaderText="Forma de Encaminhamento" SortExpression="statusEntrevista" />
                                                    <asp:TemplateField HeaderText="Voltar para Captação">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton15" runat="server" CommandName="delete" 
                                                                ImageUrl="~/Icones/voltar.jpg" onclick="ImageButton15_Click" 
                                                                onclientclick="return confirm('Deseja voltar esse candidato para captação?')" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <span lang="pt-br" 
                                                        style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                                    Não existe candidatos para essa vaga. </span>
                                                </EmptyDataTemplate>
                                                <SelectedRowStyle BackColor="#D1DDF1" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="sqlEncaminhados0" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                DeleteCommand="DELETE FROM tblCandidatoEntrevista WHERE (id_candidatoentr = @id_candidatoentr)" 
                                                
                                                
                                                SelectCommand="SELECT tblCandidato.nome, tblCBO.cargo, tblCandidato.nascimento, tblCandidato.identificador, tblCandidato.bairro, tblCandidato.telefone, tblMunicipio.nome AS municipio, tblStatusEntrevista.statusEntrevista, tblCandidatoEntrevista.id_candidatoentr, tblCandidato.id_tipo_fk, tblSexo.sexo FROM tblCandidatoEntrevista INNER JOIN tblCandidato ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidato.id_candidato INNER JOIN tblEntrevista ON tblCandidatoEntrevista.id_entrevista_fk = tblEntrevista.id_entrevista INNER JOIN tblVaga ON tblEntrevista.id_vaga_fk = tblVaga.id_vaga INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio INNER JOIN tblStatusEntrevista ON tblCandidatoEntrevista.FormaEnc = tblStatusEntrevista.id_statusEntrevista INNER JOIN tblSexo ON tblCandidato.sexo = tblSexo.id_sexo WHERE (tblCandidato.id_tipo_fk = 2) AND (tblEntrevista.id_entrevista = @id_entrevista) ORDER BY tblCandidatoEntrevista.id_candidatoentr DESC">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="id_entrevista" SessionField="id_entrevista" />
                                                </SelectParameters>
                                                <DeleteParameters>
                                                    <asp:Parameter Name="id_candidatoentr" />
                                                </DeleteParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlEncaminhadosExtra" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                SelectCommand="SELECT tblCandidatoEntrevistaExtra.Id_captacao_extra, tblCandidatoEntrevistaExtra.id_candidato_extra, tblCandidatoEntrevistaExtra.id_entrevista, tblCandidatoExtra.nome, tblCandidatoExtra.dataNascimento, tblCandidatoExtra.id_sexo_fk, tblCandidatoExtra.identificador, tblCandidatoExtra.bairro, tblCandidatoExtra.telefone FROM tblCandidatoEntrevistaExtra INNER JOIN tblCandidatoExtra ON tblCandidatoEntrevistaExtra.id_candidato_extra = tblCandidatoExtra.id_candidato_extra">
                                            </asp:SqlDataSource>
                                            <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                            <asp:SqlDataSource ID="sqldetalhevaga" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                SelectCommand="SELECT tblEmpresa.nome_fantasia, tblCBO.cargo, tblVaga.id_vaga, tblVaga.rua, tblVaga.complemento, tblVaga.bairroent, tblVaga.pontoreferencia, tblEntrevista.comentario, tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblVaga.respEntrevista, tblVaga.respTelefone, tblVaga.respCelular, tblVaga.respEmail FROM tblVaga INNER JOIN tblEntrevista ON tblVaga.id_vaga = tblEntrevista.id_vaga_fk INNER JOIN tblEmpresa ON tblVaga.id_empresa_fk = tblEmpresa.id_empresa INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo WHERE (tblEntrevista.id_entrevista = @id_entrevista)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="id_entrevista" SessionField="id_entrevista" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:Panel ID="Panel12" runat="server" BackColor="#FFAE5E" Height="20px">
                                                <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                                    <span lang="pt-br">&nbsp;&nbsp; 7° Passo - FECHAMENTO DA CAPTAÇÃO - VAGA</span></div>
                                            </asp:Panel>
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <asp:Panel ID="Panel13" runat="server">
                                                        <span class="style23" lang="pt-br"><span class="style34">
                                                        <table class="style39">
                                                            <tr>
                                                                <td class="style45">
                                                                    <asp:Label ID="Label226" runat="server" Text="Status da captação da vaga:" 
                                                                        Font-Bold="False" Font-Size="11px"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="cbofechamento" runat="server" AutoPostBack="True" 
                                                                        DataSourceID="Sqlfechamento" DataTextField="statusEntrevista" 
                                                                        DataValueField="id_statusEntrevista">
                                                                    </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="Sqlfechamento" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                        SelectCommand="SELECT statusEntrevista, id_statusEntrevista FROM tblStatusEntrevista WHERE (id_statusEntrevista &gt; 13) AND (id_statusEntrevista &lt; 16)" 
                                                                        
                                                                        UpdateCommand="UPDATE tblVaga SET fechamento = @fechamento, comentario = @comentario, encerrada = GETDATE() WHERE (id_vaga = @id_vaga_fk)">
                                                                        <UpdateParameters>
                                                                            <asp:ControlParameter ControlID="cbofechamento" Name="fechamento" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:ControlParameter ControlID="cbocomentario" Name="comentario" 
                                                                                PropertyName="SelectedValue" />
                                                                            <asp:SessionParameter Name="id_vaga_fk" SessionField="id_vaga" />
                                                                        </UpdateParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style45">
                                                                    <asp:Label ID="lblcomentario" runat="server" Text="Comentário:" 
                                                                        Font-Bold="False" Font-Size="11px"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <span class="style23" lang="pt-br"><span class="style34">
                                                                    <asp:DropDownList ID="cbocomentario" runat="server" 
                                                                        DataSourceID="sqlcomentario" DataTextField="statusEntrevista" 
                                                                        DataValueField="id_statusEntrevista">
                                                                    </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="sqlcomentario" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                        SelectCommand="SELECT statusEntrevista, id_statusEntrevista FROM tblStatusEntrevista WHERE (id_statusEntrevista &gt; 15) AND (id_statusEntrevista &lt; 20)" 
                                                                        UpdateCommand="UPDATE tblVaga SET fechamento = @fechamento, comentario = @comentario WHERE (id_vaga = @id_vaga_fk)">
                                                                        <UpdateParameters>
                                                                            <asp:Parameter Name="fechamento" />
                                                                            <asp:Parameter Name="comentario" />
                                                                            <asp:Parameter Name="id_vaga_fk" />
                                                                        </UpdateParameters>
                                                                    </asp:SqlDataSource>
                                                                    </span></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style45">
                                                                    <asp:ImageButton ID="ImageButton16" runat="server" ImageAlign="Middle" 
                                                                        ImageUrl="~/Icones/Standard/001_06.gif" />
                                                                    &nbsp;<asp:Label ID="Label228" runat="server" Text="Salvar" Font-Bold="False" 
                                                                        Font-Size="11px"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblfechamento" runat="server" Font-Bold="False" Font-Size="11px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style45">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                        </span></span>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <br />
                                            </span>
                                            </span></span>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </asp:View>
                        </asp:MultiView>
                        
                    </asp:View>
                </asp:MultiView>
            </div>
        </asp:Panel>
                <span lang="pt-br">
              
                </span>
             
    
    </div>
    </form>
</body>
</html>
