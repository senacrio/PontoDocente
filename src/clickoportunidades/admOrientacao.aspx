<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admOrientacao.aspx.vb" Inherits="admVagasEdit" Theme="AdmClick" %>

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

    <script src="js/printDiv.js" type="text/javascript"></script>
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

        .style52
        {
        }
        
        .grid
        {
            margin-top: 1px;
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
                        <asp:Label ID="lblTitulo" runat="server" Text="Orientação de candidatos:" 
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
                            <asp:SqlDataSource ID="sqlCaptadores" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                                
                                
                            SelectCommand="SELECT '' AS Matricula, 'Empresa' AS nome UNION SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario WHERE (admPortalPerfilUsuario.IdPerfil = 5) ORDER BY nome">
                            </asp:SqlDataSource>

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
                        <asp:Panel ID="Panel2" runat="server" BackColor="#009999" Height="20px">
                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                <span lang="pt-br">&nbsp;&nbsp; 1° Passo - BUSCAR ORIENTAÇÕES - para visualizar utilize 
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
                            </table>
                        <span lang="pt-br">

        <a name="Passo2"></a>
                        <asp:Panel ID="Panel4" runat="server" BackColor="#009999" 
            Height="20px">
                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                <span lang="pt-br">&nbsp;&nbsp; 2° Passo - ORIENTAÇÕES DE CANDIDATOS NO CLICK 
                                OPORTUNIDADES</span></div>
                            <br />
                            <br />
                        </asp:Panel>

                        <br />

                        <b>Selecione uma orientação clicando na seta azul</b><br />

                </span>&nbsp;
                        <span lang="pt-br">

                                <asp:SqlDataSource ID="SqlGridEntrevistaGeral" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                    OldValuesParameterFormatString=""                                                                                                
                                    
                                    
                                    
                        
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            SelectCommand="SELECT DISTINCT tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.captador, tblEntrevista.id_entrevista, tblEntrevista.id_vaga_fk, CASE WHEN tblVaga.ativada IS NULL THEN 'Em análise' WHEN tblVaga.ativada = 0 THEN 'Desativada' WHEN tblVaga.ativada = 1 THEN 'Ativada' END AS statusvaga, tblStatusEntrevista.statusEntrevista, tblProgramacaoEntrevista.codigo, tblEmpresa.nome_fantasia, tblEntrevista.quantcandidatos, tblCBO.cargo, tblVaga.fechamento, tblVaga.comentario, CASE WHEN tblVaga.fechamento IS NULL THEN 'Sem Status' WHEN tblVaga.fechamento = 15 THEN 'Encerrada' WHEN tblVaga.fechamento = 16 THEN 'Em aberto' END AS StatusFecha, tblVaga.encerrada, tblEntrevista.tipoEntrevista, tblEmpresa.id_empresa FROM tblStatusEntrevista INNER JOIN tblEntrevista ON tblStatusEntrevista.id_statusEntrevista = tblEntrevista.id_statusEntrevista INNER JOIN tblEmpresa INNER JOIN tblVaga ON tblEmpresa.id_empresa = tblVaga.id_empresa_fk INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo ON tblEntrevista.id_vaga_fk = tblVaga.id_vaga LEFT OUTER JOIN tblProgramacaoEntrevista ON tblEntrevista.id_entrevista = tblProgramacaoEntrevista.id_entrevista_fk ORDER BY tblEntrevista.dataClick">
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
                </span>
                    </td>
                </tr>
                </table>
           
  &nbsp;<span class="style23" lang="pt-br"><span class="style34"><b><span class="style22"><asp:GridView 
            ID="GridEntrevistaGeral" runat="server" AllowPaging="True" 
                                AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                                CssClass="grid" 
            DataKeyNames="id_entrevista,id_vaga_fk,id_empresa" DataSourceID="SqlGridEntrevistaGeral" 
                                EnableViewState="False" Font-Bold="False" PageSize="5" 
            Font-Size="10px">
                                <PagerStyle CssClass="pagerstyle" />
                                <Columns>
                                    <asp:CommandField HeaderText="Selecione a orientação" 
                                        ShowSelectButton="True" ButtonType="Image" 
                                        SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="id_entrevista" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="captador" HeaderText="Captador responsável" 
                                        SortExpression="captador" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nome_fantasia" HeaderText="Empresa" 
                                        SortExpression="nome_fantasia" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Programações necessárias">
                                        <ItemTemplate>
                                            <span lang="pt-br"><b><span class="style22">
                                            <asp:GridView ID="GridView7" runat="server" AllowPaging="True" 
                                                AutoGenerateColumns="False" BackColor="White" BorderStyle="None" 
                                                DataSourceID="Sqlprogramacaoent" Font-Bold="False" Font-Size="8px" 
                                                ForeColor="White" GridLines="None" PageSize="3" ShowHeader="False">
                                                <Columns>
                                                    <asp:BoundField DataField="nome" SortExpression="nome" HeaderText="nome">
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
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Representante/Telefone/Celular">
                                        <ItemTemplate>
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                                DataSourceID="SqlRepresentantes" Font-Bold="False" 
                                                ShowHeader="False" AllowPaging="True" Font-Size="11px" ForeColor="Black" 
                                                GridLines="None">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="representante" SortExpression="representante">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label242" runat="server" 
                                                                Text='<%# Bind("representante", "{0}") %>' Font-Size="10px"></asp:Label>
                                                            /<span lang="pt-br"><b><span class="style22" 
                                                                style="color: #000000; font-size: 11px; font-weight: normal;"><br />
                                                            <asp:Label ID="Label243" runat="server" Font-Bold="False" 
                                                                Text='<%# Bind("telefones", "{0}") %>' Font-Size="10px" ForeColor="Black"></asp:Label>
                                                            /<asp:Label ID="Label244" runat="server" Font-Bold="False" 
                                                                Text='<%# Bind("celular", "{0}") %>' Font-Size="10px" ForeColor="Black"></asp:Label>
                                                            </span></b></span>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("representante") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlRepresentantes" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                SelectCommand="SELECT [representante], [telefones], [celular], [id_empresa_fk] FROM [tblEmpresaRepresentantes]
where id_empresa_fk=@id_empresa">
                                                <SelectParameters>
                                                    <asp:Parameter Name="id_empresa" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="quantcandidatos" HeaderText="Quantidade de vagas" 
                                        SortExpression="quantcandidatos" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Data e horário no Click" 
                                        SortExpression="dataClick">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label245" runat="server" 
                                                Text='<%# Bind("dataEmpresa", "{0:D}") %>' Font-Size="10px"></asp:Label>
                                            &nbsp;às <span lang="pt-br" 
                                                style="font-size: 11px; font-weight: normal; color: #000000"><b>
                                            <span class="style22" 
                                                style="font-size: 11px; font-weight: normal; color: #000000;">
                                            <asp:Label ID="Label246" runat="server" Font-Bold="False" 
                                                Text='<%# Bind("horaEmpresa", "{0}") %>' Font-Size="10px" 
                                                ForeColor="Black"></asp:Label>
                                            h</span></b></span>
                                        </ItemTemplate>
                                        <HeaderStyle Width="150px" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" ForeColor="Black" 
                                            Width="250px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Data e horário na Empresa" 
                                        SortExpression="dataEmpresa">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label247" runat="server" 
                                                Text='<%# Bind("dataClick", "{0:D}") %>' ForeColor="Black" 
                                                Font-Size="10px"></asp:Label>
                                            &nbsp;às <span lang="pt-br"><b><span class="style22" 
                                                style="font-size: 11px; font-weight: normal; color: #000000">
                                            <asp:Label ID="Label248" runat="server" Font-Bold="False" 
                                                Text='<%# Bind("horaEmpresa", "{0}") %>' ForeColor="Black" 
                                                Font-Size="10px"></asp:Label>
                                            h</span></b></span>
                                        </ItemTemplate>
                                        <HeaderStyle Width="150px" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" ForeColor="Black" 
                                            Width="250px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Encaminhado para:">
                                        <ItemTemplate>
                                            <span lang="pt-br"><b><span class="style22">
                                            <asp:GridView ID="gridCaptadores" runat="server" AllowPaging="True" 
                                                AutoGenerateColumns="False" DataKeyNames="id_captador_entrevista" 
                                                DataSourceID="sqlCaptadores" Font-Bold="False" GridLines="None" PageSize="3" 
                                                ShowHeader="False" Width="152px" Font-Size="11px" ForeColor="Black">
                                                <Columns>
                                                    <asp:BoundField DataField="captador" HeaderText="captador" 
                                                        SortExpression="captador">
                                                        <ItemStyle Width="80px" />
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="sqlCaptadores" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                DeleteCommand="DELETE FROM [tblCaptadorEntrevista] WHERE [id_captador_entrevista] = @id_captador_entrevista" 
                                                InsertCommand="INSERT INTO [tblCaptadorEntrevista] ([id_entrevista_fk], [captador]) VALUES (@id_entrevista_fk, @captador)" 
                                                SelectCommand="SELECT id_entrevista_fk, captador, id_captador_entrevista FROM tblCaptadorEntrevista WHERE (id_entrevista_fk = @id_entrevista_fk)" 
                                                
                                                UpdateCommand="UPDATE [tblCaptadorEntrevista] SET [id_entrevista_fk] = @id_entrevista_fk, [captador] = @captador WHERE [id_captador_entrevista] = @id_captador_entrevista" 
                                                CacheExpirationPolicy="Sliding">
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
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="statusfecha" 
                                        HeaderText="Status da vaga após entrevista" SortExpression="statusfecha">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Data de encerramento da vaga após captação" 
                                        SortExpression="encerrada">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("encerrada") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label249" runat="server" 
                                                Text='<%# Bind("encerrada", "{0:D}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
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
                <asp:Panel 
            ID="Panel5" runat="server" BackColor="#009999" Height="20px">
                                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                        <span lang="pt-br">&nbsp;&nbsp; 3° Passo - VISUALIZAR DETALHES DA ORIENTAÇÃO E COLOCAR 
                                        STATUS PARA ENCAMINHAMENTO</span></div>
                                    <br />
                                </asp:Panel>
                                </span></span>
                                </span>
  
                                <span class="style23" lang="pt-br">
        <span class="style34">
                                <span lang="pt-br">
                                <br />
                                    <asp:DetailsView ID="dtvDetalheVaga2" 
            runat="server" AutoGenerateRows="False" 
                                        DataSourceID="sqldetalhevaga" Height="50px" 
                                        Width="547px" Font-Bold="False" 
            Font-Size="11px">
                                        <FieldHeaderStyle Width="90px" />
                                        <EmptyDataTemplate>
                                            Não existe registro no momento.
                                        </EmptyDataTemplate>
                                        <Fields>
                                            <asp:BoundField DataField="nome_fantasia" HeaderText="Nome da empresa:" 
                                                SortExpression="nome_fantasia" />
                                            <asp:TemplateField HeaderText="Endereço da entrevista:" SortExpression="rua">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="False" 
                                                        Text='<%# Bind("rua") %>'></asp:Label>
                                                    , <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="False" 
                                                        Text='<%# Bind("complemento", "{0}") %>' Font-Size="11px"></asp:Label>
                                                    &nbsp;,
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="False" 
                                                        Text='<%# Bind("bairroent", "{0}") %>' Font-Size="11px"></asp:Label>
                                                    </span></span></span>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("rua") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("rua") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemStyle Font-Size="11px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="pontoreferencia" HeaderText="Ponto de referência" 
                                                SortExpression="pontoreferencia" >
                                            <ItemStyle Font-Size="11px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Data da entrevista na Empresa:" 
                                                SortExpression="dataempresa">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" 
                                                        Text='<%# Bind("dataEmpresa", "{0:D}") %>'></asp:Label>
                                                    &nbsp;às <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                                                        style="font-size: 11px; font-weight: normal">
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Size="11px" 
                                                        Text='<%# Bind("horaEmpresa", "{0}") %>'></asp:Label>
                                                    h</span></span></span>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("dataempresa") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dataempresa", "{0:D}") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemStyle Font-Size="11px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Data da entrevista no Click:" 
                                                SortExpression="dataclick">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                                                    &nbsp;às <span class="style23" lang="pt-br"><span class="style34">
                                                    <span lang="pt-br" 
                                                        style="font-weight: normal; font-size: 11px;">
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="False" 
                                                        Text='<%# Bind("horaClick", "{0}") %>'></asp:Label>
                                                    h</span></span></span>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("dataclick") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("dataclick") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemStyle Font-Size="11px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="comentario" 
                                                HeaderText="Obs:" 
                                                SortExpression="comentario" >
                                            <ItemStyle Font-Size="11px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Dados do responsável da entrevista:">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label238" runat="server" Font-Bold="False" 
                                                        Text='<%# Eval("respEntrevista", "{0}") %>'></asp:Label>
                                                    &nbsp;/ <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                                                        style="font-weight: normal">
                                                    <asp:Label ID="Label239" runat="server" Font-Bold="False" 
                                                        Text='<%# Eval("respTelefone") %>' Font-Size="11px"></asp:Label>
                                                    &nbsp;/
                                                    <asp:Label ID="Label240" runat="server" Font-Bold="False" 
                                                        Text='<%# Eval("respCelular", "{0}") %>' Font-Size="11px"></asp:Label>
                                                    &nbsp;/<asp:Label ID="Label241" runat="server" 
                                                        Text='<%# Bind("respEmail", "{0}") %>' Font-Size="11px"></asp:Label>
                                                    </span></span></span>
                                                </ItemTemplate>
                                                <ItemStyle Font-Size="11px" />
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                            <asp:SqlDataSource ID="sqldetalhevaga" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                
                                                
                                                
            
            
            SelectCommand="SELECT tblEmpresa.nome_fantasia, tblCBO.cargo, tblVaga.id_vaga, tblVaga.rua, tblVaga.complemento, tblVaga.bairroent, tblVaga.pontoreferencia, tblEntrevista.comentario, tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblVaga.respEntrevista, tblVaga.respTelefone, tblVaga.respCelular, tblVaga.respEmail FROM tblVaga INNER JOIN tblEntrevista ON tblVaga.id_vaga = tblEntrevista.id_vaga_fk INNER JOIN tblEmpresa ON tblVaga.id_empresa_fk = tblEmpresa.id_empresa INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo WHERE (tblEntrevista.id_entrevista = @id_entrevista)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="id_entrevista" SessionField="id_entrevista" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <br />
                                <asp:Panel ID="Panel11" runat="server" 
            BackColor="#009999" Height="20px">
                                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                        <span lang="pt-br">&nbsp;&nbsp; DADOS DA VAGA</span></div>
                                    <br />
                                </asp:Panel>
                                <asp:SqlDataSource ID="Sqlvagas0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
            
            
            SelectCommand="SELECT tblVaga.descricao, tblVaga.Bairro, tblVaga.QuantVaga, tblVaga.horario_entrada, tblVaga.horario_saida, tblVaga.horario_obs, tblCBO.cargo, tblVagaModalidade.modalidade, tblMunicipio.nome, tblEntrevista.id_entrevista, CASE WHEN tblvaga.segunda = 'true' THEN 'Segunda' ELSE '-' END AS Segunda, CASE WHEN tblvaga.terca = 'true' THEN 'Terça' ELSE '-' END AS terca, CASE WHEN tblvaga.Quarta = 'true' THEN 'Quarta' ELSE '-' END AS Quarta, CASE WHEN tblvaga.Quinta = 'true' THEN 'Quinta' ELSE '-' END AS Quinta, CASE WHEN tblvaga.Sexta = 'true' THEN 'Sexta' ELSE '-' END AS Sexta, CASE WHEN tblvaga.sabado = 'true' THEN 'Sábado' ELSE '-' END AS sabado, CASE WHEN tblvaga.domingo = 'true' THEN 'Domingo' ELSE '-' END AS domingo FROM tblVaga INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo INNER JOIN tblVagaModalidade ON tblVaga.modalidade = tblVagaModalidade.id_modalidade INNER JOIN tblMunicipio ON tblVaga.id_localtrabalho_fk = tblMunicipio.id_municipio INNER JOIN tblEntrevista ON tblVaga.id_vaga = tblEntrevista.id_vaga_fk WHERE (tblEntrevista.id_entrevista = @id_entrevista)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GridEntrevistaGeral" Name="id_entrevista" 
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            DataSourceID="Sqlvagas0" Font-Bold="False" CssClass="grid" 
            Font-Size="11px">
            <Columns>
                <asp:BoundField DataField="descricao" HeaderText="Descrição da função" 
                    SortExpression="descricao">
                <HeaderStyle HorizontalAlign="Center" Width="100px" />
                <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                </asp:BoundField>
                <asp:BoundField DataField="modalidade" HeaderText="Modalidade" 
                    SortExpression="modalidade">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Município e bairro de trabalho" 
                    SortExpression="nome">
                    <ItemTemplate>
                        Descrição da função
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        Modalidade
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        Município e bairro de trabalho
                    </EditItemTemplate>
                    <FooterTemplate>
                        Obs. sobre horário de trabalho
                    </FooterTemplate>
                    <HeaderTemplate>
                        Dias e horário de trabalho
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dias e horário de trabalho" 
                    SortExpression="horario_entrada">
                    <ItemTemplate>
                        <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                            style="font-size: 11px; font-weight: normal;">
                        <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Size="11px" 
                            Text='<%# Bind("Segunda", "{0}") %>'></asp:Label>
                        ,
                        <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Size="11px" 
                            Text='<%# Bind("terca", "{0}") %>'></asp:Label>
                        ,
                        <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Size="11px" 
                            Text='<%# Bind("Quarta", "{0}") %>'></asp:Label>
                        ,
                        <asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Size="11px" 
                            Text='<%# Bind("Quinta", "{0}") %>'></asp:Label>
                        ,
                        <asp:Label ID="Label8" runat="server" Font-Bold="False" Font-Size="11px" 
                            Text='<%# Bind("Quinta", "{0}") %>'></asp:Label>
                        ,
                        <asp:Label ID="Label9" runat="server" Font-Bold="False" Font-Size="11px" 
                            Text='<%# Bind("Sexta", "{0}") %>'></asp:Label>
                        ,
                        <asp:Label ID="Label10" runat="server" Font-Bold="False" Font-Size="11px" 
                            Text='<%# Bind("domingo", "{0}") %>'></asp:Label>
                        &nbsp;<br />
                        das</span></span></span>
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# Bind("horario_entrada", "{0}") %>' Font-Size="11px"></asp:Label>
                        &nbsp;às <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                            style="font-size: 11px; font-weight: normal;">
                        <asp:Label ID="Label3" runat="server" 
                            Text='<%# Bind("horario_saida", "{0}") %>' Font-Bold="False" 
                            Font-Size="11px"></asp:Label>
                        h</span></span></span>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("horario_entrada") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                </asp:TemplateField>
                <asp:BoundField DataField="horario_obs" 
                    HeaderText="Obs. sobre horário de trabalho" SortExpression="horario_obs">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>
                <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                    style="font-size: 11px; font-weight: normal">Não existe registro no momento.</span></span></span>
            </EmptyDataTemplate>
        </asp:GridView>
                                <asp:Panel ID="Panel12" runat="server" 
            BackColor="#009999" Height="20px">
                                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                        <span lang="pt-br">&nbsp;&nbsp; DADOS DA REMUNERAÇÃO DA VAGA</span></div>
                                    <br />
                                </asp:Panel>
                                <asp:GridView ID="GridView6" runat="server" 
            AutoGenerateColumns="False" DataSourceID="Sqlvagas1" Font-Bold="False" 
            CssClass="grid" Width="437px" Font-Size="11px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Remuneração" SortExpression="salario">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("salario", "{0:C}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("salario") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="150px" />
                                            <ItemStyle Font-Size="11px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="salario_observacao" 
                                            HeaderText="Obs. sobre a remuneração" SortExpression="salario_observacao">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="VT" SortExpression="Valetransporte">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" 
                                                    Text='<%# Bind("Valetransporte", "{0:C}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Valetransporte") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle Font-Size="11px" HorizontalAlign="Center" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Valetransporte_obs" HeaderText="Outras observações" 
                                            SortExpression="Valetransporte_obs">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br" 
                                            style="font-size: 11px; font-weight: normal">Não existe registro no momento.</span></span></span>
                                    </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="Sqlvagas1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
            
            SelectCommand="SELECT tblVaga.id_vaga, tblVaga.salario, tblVaga.salario_observacao, tblVaga.vale_transporte, tblVaga.vale_refeicao, tblVaga.vale_alimentacao, tblVaga.plano_saude, tblVaga.refeicao_local, tblVaga.Valetransporte, tblVaga.Valetransporte_obs FROM tblEntrevista INNER JOIN tblVaga ON tblEntrevista.id_vaga_fk = tblVaga.id_vaga WHERE (tblEntrevista.id_entrevista = @id_entrevista)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridEntrevistaGeral" Name="id_entrevista" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
                                <asp:Panel ID="Panel13" runat="server" 
            BackColor="#009999" Height="20px">
                                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                        <span lang="pt-br">&nbsp;&nbsp; DADOS DO PERFIL DO CANDIDADO PARA VAGA</span></div>
                                </asp:Panel>
                                </span>
        <asp:SqlDataSource ID="Sqlvagas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
            
            SelectCommand="SELECT tblVaga.id_vaga, tblVaga.Faixaetariainicial, tblVaga.Faixaetariafinal, tblEstadoCivil.estadocivil, tblSexo.sexo, tblFormacaoNivel.formacao, tblVaga.perfil FROM tblVaga INNER JOIN tblEstadoCivil ON tblVaga.estado_civil = tblEstadoCivil.id_estadocivil INNER JOIN tblSexo ON tblVaga.sexo = tblSexo.id_sexo INNER JOIN tblFormacaoNivel ON tblVaga.id_escolaridade_fk = tblFormacaoNivel.id_formacaonivel INNER JOIN tblEntrevista ON tblVaga.id_vaga = tblEntrevista.id_vaga_fk WHERE (tblEntrevista.id_entrevista = @id_entrevista)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridEntrevistaGeral" Name="id_entrevista" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
                                <span lang="pt-br">
                                <asp:GridView ID="GridView4" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="id_vaga" DataSourceID="Sqlvagas" 
            Font-Bold="False" CssClass="grid">
                                    <Columns>
                                        <asp:BoundField DataField="perfil" HeaderText="Perfil" SortExpression="perfil">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="formacao" HeaderText="Escolaridade" 
                                            SortExpression="formacao">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Faixa etária" 
                                            SortExpression="Faixaetariainicial">
                                            <ItemTemplate>
                                                de
                                                <asp:Label ID="Label1" runat="server" 
                                                    Text='<%# Bind("Faixaetariainicial", "{0}") %>'></asp:Label>
                                                &nbsp;a <span class="style23" lang="pt-br"><span class="style34">
                                                <span lang="pt-br" style="font-weight: normal">
                                                <asp:Label ID="Label2" runat="server" 
                                                    Text='<%# Bind("Faixaetariafinal", "{0}") %>' Font-Bold="False"></asp:Label>
                                                &nbsp;anos</span></span></span>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" 
                                                    Text='<%# Bind("Faixaetariainicial") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="estadocivil" HeaderText="Estado civil" 
                                            SortExpression="estadocivil">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Font-Size="11px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                        <span lang="pt-br" style="font-size: 11px; font-weight: normal">Não existe 
                                        registro no momento.</span></span></span></span>
                                    </EmptyDataTemplate>
        </asp:GridView>
                                <asp:Panel 
            ID="Panel14" runat="server" BackColor="#009999" Height="20px">
                                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                        <span lang="pt-br">&nbsp;&nbsp; CANDIDATOS PARA ORIENTAÇÃO</span></div>
                                    <br />
                                </asp:Panel>
                                </span>
                                </span></span><asp:Panel ID="Panel1" runat="server" Width="1000px">
            <div style="border: 1px solid #006699">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
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
                        <%--<a href="DetalheVaga.aspx" target="_blank"  >Detalhes da vaga</a>--%><span 
                            class="style23" lang="pt-br"><span class="style34"><span lang="pt-br"><asp:Label 
                            ID="Label230" runat="server" Font-Bold="False" Font-Size="11px" 
                            Text="Selecione uma entrevista para efetuar a orientação:"></asp:Label>
                        </span></span></span>
                        <asp:SqlDataSource ID="sqlEscolaridadeLista0" runat="server" 
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
                        <asp:SqlDataSource ID="sqlCBOEmpresaVaga0" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        
                            
                            SelectCommand="SELECT id_cargo, cargo, tipo FROM tblCBO WHERE (tipo &lt;&gt; 'Família')">
                                                    </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlCBOLista0" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        SelectCommand="SELECT id_cargo, cargo FROM tblCBO WHERE (tipo = 'Família') ORDER BY cargo">
                                                    </asp:SqlDataSource>
                        
                        <asp:Label ID="lblMsg" runat="server" Font-Bold="False" Font-Size="11px" 
                            ForeColor="#FF6600"></asp:Label>
                        <div id="div_print1">
                            <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                            <asp:GridView ID="gridorientados" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="id_entrevista_fk,id_cadidato_fk" 
                                DataSourceID="SqlorientadosSemVaga" Font-Size="11px" CssClass="grid" 
                                Font-Bold="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Código do candidato" 
                                        SortExpression="id_cadidato_fk">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcandidato" runat="server" 
                                                Text='<%# Bind("id_cadidato_fk") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("id_cadidato_fk") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Código da entrevista" 
                                        SortExpression="id_entrevista_fk">
                                        <ItemTemplate>
                                            <asp:Label ID="lblentrevista" runat="server" 
                                                Text='<%# Bind("id_entrevista_fk") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" 
                                                Text='<%# Bind("id_entrevista_fk") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nome do candidato" SortExpression="nome">
                                        <ItemTemplate>
                                            <asp:Label ID="Label233" runat="server" Text='<%# Bind("nome") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nome") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Data, hora e local da orientação sem vaga" 
                                        SortExpression="dataClick">
                                        <ItemTemplate>
                                            <asp:Label ID="Label231" runat="server" 
                                                Text='<%# Bind("dataClick", "{0:D}") %>' Font-Size="10px"></asp:Label>
                                            &nbsp;às <span class="style23" lang="pt-br"><span class="style34">
                                            <span lang="pt-br" style="font-size: 10px; font-weight: normal">
                                            <asp:Label ID="Label232" runat="server" Text='<%# Bind("horaClick", "{0}") %>' 
                                                Font-Bold="False" Font-Size="10px"></asp:Label>
                                            h</span></span></span>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="rdid_statusOrient" runat="server" ForeColor="White" 
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1"></asp:ListItem>
                                                <asp:ListItem Value="2"></asp:ListItem>
                                                <asp:ListItem Value="3"></asp:ListItem>
                                                <asp:ListItem Value="4"></asp:ListItem>
                                                <asp:ListItem Value="5"></asp:ListItem>
                                                <asp:ListItem Value="6"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:Image ID="Image1" runat="server" 
                                                ImageUrl="~/clickoportunidades/Img/radios_imagem.jpg" />
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Observação sobre o candidato" 
                                        SortExpression="orientacaocandidato">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtorientacaocandidato" runat="server" Rows="3" 
                                                Text='<%# Bind("orientacaocandidato", "{0}") %>' TextMode="MultiLine" 
                                                Height="80px" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox17" runat="server" 
                                                Text='<%# Bind("orientacaocandidato") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="id_aptoEncam">
                                        <ItemTemplate>
                                            <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                            <asp:RadioButtonList ID="rdid_aptoEncam" runat="server" ForeColor="White" 
                                                RepeatDirection="Horizontal" Font-Size="11px" Width="61px">
                                                <asp:ListItem Value="Sim"></asp:ListItem>
                                                <asp:ListItem Value="Não"></asp:ListItem>
                                            </asp:RadioButtonList>
                                            </span></span></span>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" 
                                                Text='<%# Bind("id_statusOrient") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderTemplate>
                                            <asp:Image ID="Image2" runat="server" 
                                                ImageUrl="~/clickoportunidades/Img/radios_imagem2.jpg" />
                                        </HeaderTemplate>
                                        <HeaderStyle Width="65px" />
                                        <ItemStyle Width="65px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                    <span lang="pt-br" style="font-size: 11px; font-weight: normal">Não existe 
                                    registro no momento.</span></span></span></span>
                                </EmptyDataTemplate>
                                <HeaderStyle CssClass="grid" />
                            </asp:GridView>
                            </span></span></span>
                        </div>
                        <table class="style39">
                            <tr>
                                <td class="style52">
                                    <asp:ImageButton ID="ImageButton16" runat="server" ImageAlign="Middle" 
                                        ImageUrl="~/Icones/Standard/001_06.gif" />
                                    &nbsp;
                                    <asp:Label ID="Label228" runat="server" Font-Bold="False" Font-Size="11px" 
                                        Text="Salvar Status"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblfechamento" runat="server" Font-Bold="False" Font-Size="11px" 
                                        ForeColor="#FF6600"></asp:Label>
                                    &nbsp;<span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br"><asp:Label 
                                        ID="lblfechamento0" runat="server" Font-Bold="False" Font-Size="11px"></asp:Label>
                                    &nbsp;<asp:Label ID="lblentrevista" runat="server" Font-Bold="False" 
                                        Font-Size="11px" ForeColor="#FF6600"></asp:Label>
                                    </span></span></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style52" colspan="2">
                                    <span lang="pt-br"><span class="style23" lang="pt-br"><span class="style34">
                                    <asp:ImageButton ID="ImageButton18" runat="server" ImageAlign="Middle" 
                                        ImageUrl="~/clickoportunidades/icones/Standard/imprimir.jpg" 
                                        onclientclick="printdiv('div_print1');" />
                                    &nbsp;
                                    <asp:Label ID="Label251" runat="server" Font-Bold="False" Font-Size="11px" 
                                        Text="Imprimir formulário de orientação"></asp:Label>
                                    </span></span></span>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlorientadosSemVaga0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            DeleteCommand="DELETE FROM tblCandidatoOrientado WHERE (id_candidato_fk = @id_candidato_fk)" 
                            InsertCommand="INSERT INTO tblCandidatoOrientado(id_candidato_fk, id_aptoEncam, id_entrevista_fk, id_statusOrient, orientacaocandidato) VALUES (@id_candidato_fk, @id_aptoEncam, @id_entrevista_fk, @id_statusOrient, @orientacaocandidato)" 
                            SelectCommand="SELECT tblCandidato.nome, tblEntrevista.dataClick, tblEntrevista.horaClick, tblStatusEntrevista.statusEntrevista, tblCandidatoEntrevista.id_cadidato_fk, tblCandidatoEntrevista.id_entrevista_fk, tblCandidatoOrientado_1.orientacaocandidato, tblCandidatoOrientado_1.id_aptoEncam, tblCandidatoOrientado_1.id_candidato_fk, tblstatusOrientacao.statusorientacao, tblSexo.sexo, tblCandidato.nascimento, tblCandidato.bairro, tblMunicipio.nome AS Expr1 FROM tblSexo INNER JOIN tblCandidatoEntrevista INNER JOIN tblCandidato ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidato.id_candidato INNER JOIN tblEntrevista ON tblCandidatoEntrevista.id_entrevista_fk = tblEntrevista.id_entrevista INNER JOIN tblStatusEntrevista ON tblCandidatoEntrevista.FormaEnc = tblStatusEntrevista.id_statusEntrevista ON tblSexo.id_sexo = tblCandidato.sexo INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio LEFT OUTER JOIN tblstatusOrientacao INNER JOIN tblCandidatoOrientado AS tblCandidatoOrientado_1 ON tblstatusOrientacao.id_statusOrientacao = tblCandidatoOrientado_1.id_statusOrient ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidatoOrientado_1.id_candidato_fk WHERE (tblCandidatoEntrevista.id_entrevista_fk = @id_entrevista)" 
                            
                            UpdateCommand="UPDATE tblCandidatoOrientado SET orientacaocandidato = @orientacaocandidato, id_candidato_fk = @id_candidato_fk, id_aptoEncam = @id_aptoencam, id_entrevista_fk = @id_entrevista_fk, id_statusOrient = @id_statusorient WHERE (id_candidatoOrient = @id_candidatoorient)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_entrevista" SessionField="id_entrevista" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:SessionParameter Name="id_candidato_fk" SessionField="id_candidato" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="id_candidatoorient" />
                                <asp:Parameter Name="id_candidato_fk" />
                                <asp:Parameter Name="id_aptoencam" />
                                <asp:Parameter Name="id_entrevista_fk" />
                                <asp:Parameter Name="id_statusorient" />
                                <asp:Parameter Name="orientacaocandidato" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="id_candidato_fk" />
                                <asp:Parameter Name="id_aptoEncam" />
                                <asp:Parameter Name="id_entrevista_fk" />
                                <asp:Parameter Name="id_statusOrient" />
                                <asp:Parameter Name="orientacaocandidato" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlorientadosSemVaga" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            DeleteCommand="DELETE FROM tblCandidatoOrientado WHERE (id_candidato_fk = @id_candidato)" 
                            InsertCommand="INSERT INTO tblCandidatoOrientado(id_candidato_fk, id_aptoEncam, id_entrevista_fk, id_statusOrient, orientacaocandidato) VALUES (@id_candidato_fk, @id_aptoEncam, @id_entrevista_fk, @id_statusOrient, @orientacaocandidato)" 
                            SelectCommand="SELECT tblCandidato.nome, tblEntrevista.dataClick, tblEntrevista.horaClick, tblStatusEntrevista.statusEntrevista, tblCandidatoEntrevista.id_entrevista_fk, tblCandidatoOrientado_1.orientacaocandidato, tblCandidatoOrientado_1.id_aptoEncam, tblCandidatoOrientado_1.id_statusOrient, tblCandidatoEntrevista.id_cadidato_fk FROM tblCandidatoEntrevista INNER JOIN tblCandidato ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidato.id_candidato INNER JOIN tblEntrevista ON tblCandidatoEntrevista.id_entrevista_fk = tblEntrevista.id_entrevista INNER JOIN tblStatusEntrevista ON tblCandidatoEntrevista.FormaEnc = tblStatusEntrevista.id_statusEntrevista LEFT OUTER JOIN tblCandidatoOrientado AS tblCandidatoOrientado_1 ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidatoOrientado_1.id_candidato_fk WHERE (tblCandidatoEntrevista.id_entrevista_fk = @id_entrevista) AND (tblCandidato.id_candidato NOT IN (SELECT id_candidato_fk FROM tblCandidatoOrientado AS tblCandidatoorientado))" 
                            UpdateCommand="UPDATE tblCandidatoOrientado SET orientacaocandidato = @orientacaocandidato, id_candidato_fk = @id_candidato_fk, id_aptoEncam = @id_aptoencam, id_entrevista_fk = @id_entrevista_fk, id_statusOrient = @id_statusorient WHERE (id_candidatoOrient = @id_candidatoorient)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridEntrevistaGeral" DbType="Int32" 
                                    Name="id_entrevista" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="GridEncaminhadosExtra" Name="id_candidato" 
                                    PropertyName="SelectedValue" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="id_candidatoorient" />
                                <asp:Parameter Name="id_candidato_fk" />
                                <asp:Parameter Name="id_aptoencam" />
                                <asp:Parameter Name="id_entrevista_fk" />
                                <asp:Parameter Name="id_statusorient" />
                                <asp:Parameter Name="orientacaocandidato" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="id_candidato_fk" />
                                <asp:Parameter Name="id_aptoEncam" />
                                <asp:Parameter Name="id_entrevista_fk" />
                                <asp:Parameter Name="id_statusOrient" />
                                <asp:Parameter Name="orientacaocandidato" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        </span></span></span>
                        
                    </asp:View>
                </asp:MultiView>
            </div>
        </asp:Panel>
                <span lang="pt-br">

        <span class="style23" lang="pt-br"><span class="style34">
        <asp:Panel 
            ID="Panel15" runat="server" BackColor="#009999" Height="20px">
                                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                        <span lang="pt-br">&nbsp;&nbsp; 5° Passo - VISUALIZAR DETALHES DA ORIENTAÇÃO E COLOCAR 
                                        STATUS PARA ENCAMINHAMENTO</span></div>
                                    <br />
                                    <span lang="pt-br"><span class="style23" lang="pt-br"><span class="style34">
                                    <div ID="div_print2">
                                        <asp:GridView ID="GridorientadosOK" runat="server" AutoGenerateColumns="False" 
                                            CssClass="grid" DataKeyNames="id_entrevista_fk,id_cadidato_fk,id_candidato_fk" 
                                            DataSourceID="SqlorientadosSemVaga0" Font-Size="11px">
                                            <Columns>
                                                <asp:BoundField DataField="id_entrevista_fk" HeaderText="Código da entrevista" 
                                                    SortExpression="id_entrevista_fk">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="nome" HeaderText="Nome do candidato" 
                                                    SortExpression="nome">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Programação/Unidade">
                                                    <ItemTemplate>
                                                        <span lang="pt-br"><b><span class="style22">
                                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                                            AutoGenerateColumns="False" BackColor="White" BorderStyle="None" 
                                                            DataSourceID="Sqlprogramacaoent" Font-Bold="False" Font-Size="8px" 
                                                            ForeColor="White" GridLines="None" PageSize="3" ShowHeader="False">
                                                            <Columns>
                                                                <asp:BoundField DataField="Oferta" HeaderText="Oferta" 
                                                                    SortExpression="Oferta" />
                                                                <asp:BoundField DataField="RAZAO_SOCIAL" HeaderText="RAZAO_SOCIAL" 
                                                                    SortExpression="RAZAO_SOCIAL" />
                                                            </Columns>
                                                            <FooterStyle ForeColor="Black" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="Sqlprogramacaoent" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                            SelectCommand="SELECT tblSgaUnidade.RAZAO_SOCIAL, tblSGA_Ofertas.nome AS Oferta FROM tblProgramacaoEntrevista INNER JOIN tblSGA_ClientesComOferta ON tblProgramacaoEntrevista.id_oferta_fk = tblSGA_ClientesComOferta.id_oferta INNER JOIN tblCandidato ON tblSGA_ClientesComOferta.IDENTIFICADOR = tblCandidato.identificador INNER JOIN tblSgaUnidade ON tblSGA_ClientesComOferta.id_unidade = tblSgaUnidade.id_unidade INNER JOIN tblSGA_Ofertas ON tblProgramacaoEntrevista.id_oferta_fk = tblSGA_Ofertas.oferta WHERE (tblProgramacaoEntrevista.id_entrevista_fk = @id_entrevista_fk) AND (tblCandidato.id_candidato = @id_candidato)">
                                                            <SelectParameters>
                                                                <asp:Parameter Name="id_entrevista_fk" />
                                                                <asp:Parameter Name="id_candidato" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        </span></b></span>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Data de nascimento" SortExpression="nascimento">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label252" runat="server" 
                                                            Text='<%# Bind("nascimento", "{0:d}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("nascimento") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Expr1" HeaderText="Município" SortExpression="Expr1">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="orientacaocandidato" 
                                                    HeaderText="Parecer da orientação" SortExpression="orientacaocandidato">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Status da orientação no Click" 
                                                    SortExpression="id_statusOrient">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label234" runat="server" 
                                                            Text='<%# Eval("statusorientacao", "{0}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox20" runat="server" 
                                                            Text='<%# Bind("id_statusOrient") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:CommandField ButtonType="Image" 
                                                    DeleteImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                                    HeaderText="Excluir Orientação" ShowDeleteButton="True">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:CommandField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                                <asp:Label ID="lblnaoexiste1" runat="server" BorderStyle="None" 
                                                    Font-Bold="False" Font-Size="11px" ForeColor="#FF6600">Não existe orientações no momento.</asp:Label>
                                                </span></span></span>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </div>
                                    </span></span></span>
                                    <span class="style23" lang="pt-br"><span class="style34" 
                                        style="font-weight: normal; font-size: 11px"><span lang="pt-br">
                                    <br />
                                    <asp:ImageButton ID="ImageButton17" runat="server" ImageAlign="Middle" 
                                        ImageUrl="~/clickoportunidades/icones/Standard/imprimir.jpg" 
                                        onclientclick="printdiv('div_print2');" />
                                    &nbsp;</span><asp:Label ID="Label250" runat="server" 
                                        Text="Imprimir detalhes da orientação"></asp:Label>
                                    </span></span>
                                </asp:Panel>
                                </span></span>
                                </span>
  
                                <br />
             
    
    </div>
    </form>
</body>
</html>
