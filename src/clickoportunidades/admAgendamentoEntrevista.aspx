<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admAgendamentoEntrevista.aspx.vb" Inherits="admVagasEdit" Theme="AdmClick" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

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

        .style11
        {
        }
                        
        .style22
        {
            /*color: #0066FF;*/
            font-size: small;
        }
        .style23
        {
           /* font-weight: bold;*/
        }
        
        .style1
        {
            width: 100%;
            height: 30px;
        }
        
        .style28
        {
        }
                
        .style30
        {
            font-size: small;
        }
                        
        .style34
        {
            width: 146px;
        }
                        
        .style39
        {
            width: 100%;
        }
                                
        .style35
        {
            width: 54%;
            font-size:x-small; 
        }
        
        .style36
        {
        }
                                        
        .style41
        {
            width: 303px;
        }
        .style43
        {
            width: 126px;
        }
                                            
        .style46
        {
            width: 282px;
        }
        .style47
        {
        }
        .style48
        {
            width: 90px;
        }
                                            
        .style49
        {
            width: 699px;
        }
                                            
        .style50
        {
            width: 26px;
        }
                                            
        .style3
        {
            width: 67%;
        }
        .style51
        {
            width: 94%;
        }
                
        .style10
        {
            background-color: #CCCCCC;
        }
        .style8
        {
            width: 51px;
        }
                
        .style52
        {
            width: 10px;
        }
                
        .style53
        {
            width: 149px;
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
                        <asp:Label ID="lblTitulo" runat="server" Text="Agendamentos" 
                            style="font-size: medium; font-weight: 700"></asp:Label>
                            <br />
                            <br />
                                    <asp:ScriptManager ID="ScriptManager1" runat="server" 
                                        EnableScriptGlobalization="True" EnableViewState="False">
                                    </asp:ScriptManager>
                </span>
    
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10px" 
                            ForeColor="#FF6600" 
                            Text="*Atenção: Qualquer operação efetuada nessa área é de responsabilidade única do Click Oportunidades, essas operações são registradas." 
                            Width="650px" EnableViewState="False"></asp:Label>
                        &nbsp;
                        <br />
                    </td>
                </tr>
                </table>
           
  

                        <asp:Label ID="Label2" runat="server" 
            Text="Usuário/Responsável:" EnableViewState="False"></asp:Label>

                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlUsuario" 
                            DataTextField="Nome" DataValueField="IdUsuario" Font-Size="8pt" 
                            style="margin-top: 11px; margin-bottom: 0px" 
            EnableViewState="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlUsuario" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
            SelectCommand="SELECT IdUsuario, Nome FROM admPortalUsuario WHERE (Nome = @nome)" 
            EnableViewState="False">
                            <SelectParameters>
                                <asp:SessionParameter Name="nome" SessionField="c_nome" />
                            </SelectParameters>
                        </asp:SqlDataSource>
           
  
                        <asp:Panel ID="Panel10" runat="server" BorderWidth="2px" Height="43px" 
                            Width="270px" BackColor="White" BorderColor="Black" 
            EnableViewState="False">
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
                                </tr>
                            </table>
                        </asp:Panel>

                        <ajaxToolkit:AlwaysVisibleControlExtender ID="Panel10_AlwaysVisibleControlExtender" 
                            runat="server" Enabled="True" HorizontalOffset="10" HorizontalSide="Right" 
                            TargetControlID="Panel10" VerticalOffset="10">
                        </ajaxToolkit:AlwaysVisibleControlExtender>
           
  
        <a name="Passo1"></a>
                        <asp:Panel ID="Panel2" runat="server" BackColor="#3399FF" 
            Height="20px" EnableViewState="False">
                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                <span lang="pt-br">&nbsp;&nbsp; 1° Passo - M</span>APA DE ENTREVISTA NO CLICK - 
                                PESQUISAR ENTREVISTAS AGENDADAS</div>
                        </asp:Panel>
                        
                <table class="style1">
                    <tr>
                        <td>
                            <span lang="pt-br">
                            <table class="style35">
                                <tr>
                                    <td class="style48">
                                        Captador:</td>
                                    <td class="style46">
                                        <asp:DropDownList ID="cbocaptadorBusca" runat="server" 
                                            AppendDataBoundItems="True" DataSourceID="sqlCaptadores1" DataTextField="Nome" 
                                            DataValueField="Nome" Font-Size="X-Small" style="margin-left: 0px" 
                                            EnableViewState="False">
                                            <asp:ListItem Value="%">TODOS</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style48">
                                        Período Inicial:</td>
                                    <td class="style46">
                                        <asp:TextBox ID="txtperiodoInicial" runat="server" Font-Size="X-Small" 
                                            Width="80px" EnableViewState="False"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="txtperiodoInicial_CalendarExtender" 
                                            runat="server" Enabled="True" TargetControlID="txtperiodoInicial">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style48">
                                        Período Final:</td>
                                    <td class="style46">
                                        <span lang="pt-br">
                                        <asp:TextBox ID="txtperiodofinal" runat="server" Font-Size="X-Small" 
                                            Width="80px" EnableViewState="False"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="txtperiodofinal_CalendarExtender" 
                                            runat="server" Enabled="True" TargetControlID="txtperiodofinal">
                                        </ajaxToolkit:CalendarExtender>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style48">
                                        Empresa:</td>
                                    <td class="style46">
                                        <asp:DropDownList ID="cboempresabusca" runat="server" 
                                            AppendDataBoundItems="True" DataSourceID="sqlEmpresas" 
                                            DataTextField="nome_fantasia" DataValueField="id_empresa" 
                                            Font-Size="X-Small" EnableViewState="False">
                                            <asp:ListItem Value="0">TODOS</asp:ListItem>
                                        </asp:DropDownList>
                                        <span lang="pt-br">
                                        <asp:ImageButton ID="ImageButton6" runat="server" ImageAlign="Middle" 
                                            ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" />
                                        &nbsp;Clique aqui para buscar</span></td>
                                </tr>
                                <tr>
                                    <td class="style47" colspan="2">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            </span></td>
                    </tr>
                </table>
                <span lang="pt-br">
                <asp:SqlDataSource ID="sqlVagaClick0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    
                    
            SelectCommand="SELECT tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.id_entrevista FROM tblVaga INNER JOIN tblEmpresa ON tblVaga.id_empresa_fk = tblEmpresa.id_empresa INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo RIGHT OUTER JOIN tblEntrevista ON tblVaga.id_vaga = tblEntrevista.id_vaga_fk WHERE (tblEntrevista.dataClick = @id_entrevista) AND (tblEntrevista.tipoEntrevista = 'Sem vaga')" 
            EnableViewState="False">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Calendar1" Name="id_entrevista" 
                            PropertyName="SelectedDate" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <table class="style1">
                    <tr>
                        <td class="style49">
                            <span lang="pt-br">
                            <asp:GridView ID="GridEntrevistaGeral" runat="server" AllowPaging="True" 
                                AllowSorting="True" AlternatingRowStyle-CssClass="altrowstyle" 
                                AutoGenerateColumns="False" DataKeyNames="id_entrevista,id_vaga_fk" 
                                DataSourceID="SqlGridEntrevistaGeral" PageSize="5" style="margin-right: 0px" 
                                Width="666px" EnableViewState="False">
                                <PagerStyle CssClass="pagerstyle" />
                                <Columns>
                                    
                                    <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                        InsertVisible="False" SortExpression="id_entrevista">
                                        <ItemStyle Width="10px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_vaga_fk" HeaderText="Código da vaga" 
                                        SortExpression="id_vaga_fk" />
                                    <asp:TemplateField HeaderText="Data no Click" SortExpression="dataClick">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label25" runat="server" Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="horaClick" HeaderText="Hora no Click" 
                                        SortExpression="horaClick">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="captador" HeaderText="Responsável pelo agendamento" 
                                        SortExpression="captador" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Captador" SortExpression="captador">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("captador") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                DataKeyNames="id_captador_entrevista" DataSourceID="sqlgrupoCaptadores" 
                                                BorderStyle="None" GridLines="None" ShowHeader="False">
                                                <Columns>
                                                    <asp:BoundField DataField="captador" HeaderText="Captadores" 
                                                        SortExpression="captador" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="sqlgrupoCaptadores" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                SelectCommand="SELECT id_captador_entrevista, captador, id_entrevista_fk FROM tblCaptadorEntrevista WHERE (id_entrevista_fk = @id_entrevista)">
                                                <SelectParameters>
                                                    <asp:Parameter Name="id_entrevista" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Atualização" SortExpression="dataStatus">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label20" runat="server" Text='<%# Eval("dataStatus") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("dataStatus") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                                <EmptyDataTemplate>
                                    <span lang="pt-br" 
                                        style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                    Não existe entrevista para essa vaga. </span>
                                </EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#D1DDF1" />
                                <AlternatingRowStyle CssClass="altrowstyle" />
                            </asp:GridView>
                            </span>
                        </td>
                        <td>
                            <span lang="pt-br">
                            <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderWidth="1px" 
                                Width="435px">
                                <asp:Panel ID="Panel8" runat="server" Width="435px">
                                    <table class="style1" width="435px">
                                        <tr>
                                            <td class="style41" 
                                                
                                                
                                                style="font-family: verdana; font-size: 12px; background-color: #C0C0C0; width: 375px; font-weight: bold;">
                                                Mapa de Orientações no Click</td>
                                            <td align="right" 
                                                style="font-family: verdana; font-size: 12px; background-color: #C0C0C0" 
                                                width="60px">
                                                <asp:LinkButton ID="LinkButton1" runat="server">Fechar[x]</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="border: 1px solid #006699">
                                        <span lang="pt-br">
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                                            BorderColor="Black" DayNameFormat="Shortest" Font-Names="Verdana" 
                                            Font-Size="10pt" ForeColor="Black" NextPrevFormat="ShortMonth" 
                                            onselectionchanged="Calendar1_SelectionChanged" ShowGridLines="True" 
                                            TitleFormat="Month" Width="434px" EnableViewState="False">
                                            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" 
                                                Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                            <TodayDayStyle BackColor="#CCCC99" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <DayStyle Width="14%" />
                                            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" 
                                                ForeColor="#333333" Height="10pt" />
                                            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" 
                                                ForeColor="White" Height="14pt" />
                                        </asp:Calendar>
                                        </span>
                                    </div>
                                </asp:Panel>
                                </div>
                                </div>
                                <asp:SqlDataSource ID="sqlEmpresaDetalhe" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                    SelectCommand="SELECT tblEmpresaRepresentantes.telefones, tblEmpresaRepresentantes.celular, tblEmpresaRepresentantes.emailrep, tblEmpresa.email, tblEmpresaRepresentantes.representante FROM tblEmpresa INNER JOIN tblEmpresaRepresentantes ON tblEmpresa.id_empresa = tblEmpresaRepresentantes.id_empresa_fk INNER JOIN tblVaga ON tblEmpresa.id_empresa = tblVaga.id_empresa_fk WHERE (tblVaga.id_vaga = @id_vaga)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </asp:Panel>
                            <ajaxToolkit:DragPanelExtender ID="Panel1_DragPanelExtender2" runat="server" 
                                TargetControlID="Panel1">
                            </ajaxToolkit:DragPanelExtender>
                            </span>
                        </td>
                    </tr>
                    </table>
                <asp:SqlDataSource ID="SqlGridEntrevistaGeral" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    OldValuesParameterFormatString="" 
                    
                    
                    
                    
                    
                    
                    
            
            
            SelectCommand="SELECT tblEntrevista.id_entrevista, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.dataStatus, tblStatusEntrevista.statusEntrevista, tblEntrevista.id_statusEntrevista, tblEntrevista.id_vaga_fk, tblEntrevista.cancelamento, tblCaptadorEntrevista.captador, tblVaga.id_empresa_fk FROM tblEntrevista LEFT OUTER JOIN tblCaptadorEntrevista ON tblEntrevista.id_entrevista = tblCaptadorEntrevista.id_entrevista_fk LEFT OUTER JOIN tblVaga ON tblEntrevista.id_vaga_fk = tblVaga.id_vaga LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_vaga_fk IS NOT NULL) AND (tblEntrevista.tipoEntrevista IS NULL) AND (ISNULL(tblEntrevista.dataClick, '1900-01-01') BETWEEN @dataInicialclick AND @dataFinalclick) AND (tblCaptadorEntrevista.captador LIKE RTRIM(LTRIM(@captador)) + '%') AND (tblVaga.id_empresa_fk = (CASE WHEN @id_empresa = 0 THEN tblVaga.id_empresa_fk ELSE @id_empresa END)) ORDER BY tblEntrevista.id_entrevista DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboempresabusca" DefaultValue="" 
                            Name="id_empresa" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtperiodoInicial" DbType="DateTime" 
                            DefaultValue="1900-01-01" Name="dataInicialclick" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtperiodofinal" DbType="DateTime" 
                            DefaultValue="2030-01-01" Name="dataFinalclick" PropertyName="Text" />
                        <asp:ControlParameter ControlID="cbocaptadorBusca" DefaultValue="" 
                            Name="captador" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </span>
          
        <a name="Passo2"></a>
                        <asp:Panel ID="Panel3" runat="server" BackColor="#3399FF" 
            Height="20px">
                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                <span lang="pt-br">&nbsp;&nbsp; 2° Passo - M</span>APA DAS ENTREVISTAS AGENDADAS 
                                POR CAPTADORES</div>
                            <br />
                        </asp:Panel>
                       
                                <span lang="pt-br">
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <span lang="pt-br">
                                            <table class="style35">
                                                <tr>
                                                    <td class="style36">
                                                        Captador:</td>
                                                    <td class="style38">
                                                        <asp:DropDownList ID="cbocaptadorBusca0" runat="server" 
                                            AppendDataBoundItems="True" DataSourceID="sqlCaptadores" DataTextField="nome" 
                                            DataValueField="nome" Font-Size="X-Small" style="margin-left: 0px" EnableViewState="False">
                                                            <asp:ListItem Value="%">TODOS</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style36">
                                                        Período Inicial:</td>
                                                    <td class="style38" colspan="2">
                                                        <asp:TextBox ID="txtperiodoInicial0" runat="server" Font-Size="X-Small" 
                                            Width="80px" EnableViewState="False"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="txtperiodoInicial0_CalendarExtender" 
                                            runat="server" Enabled="True" TargetControlID="txtperiodoInicial0">
                                                        </ajaxToolkit:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style36">
                                                        Período Final:</td>
                                                    <td class="style38" colspan="2">
                                                        <span lang="pt-br">
                                                        <asp:TextBox ID="txtperiodofinal0" runat="server" Font-Size="X-Small" 
                                            Width="80px" EnableViewState="False"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="txtperiodofinal0_CalendarExtender" 
                                            runat="server" Enabled="True" TargetControlID="txtperiodofinal0">
                                                        </ajaxToolkit:CalendarExtender>
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style36">
                                                        Empresa:</td>
                                                    <td class="style37" colspan="2">
                                                        <asp:DropDownList ID="cboempresabusca0" runat="server" 
                                            AppendDataBoundItems="True" DataSourceID="sqlEmpresas" 
                                            DataTextField="nome_fantasia" DataValueField="id_empresa" 
                                            Font-Size="X-Small" EnableViewState="False">
                                                            <asp:ListItem Value="0">TODOS</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span lang="pt-br">
                                                        <asp:ImageButton ID="ImageButton7" runat="server" ImageAlign="Middle" 
                                            ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" />
                                                        &nbsp;Clique aqui para buscar</span></td>
                                                </tr>
                                            </table>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span lang="pt-br">
                                            <asp:GridView ID="GridEntrevistaGeral1" runat="server" AllowPaging="True" 
                                AllowSorting="True" AlternatingRowStyle-CssClass="altrowstyle" 
                                AutoGenerateColumns="False" DataKeyNames="id_entrevista,id_vaga_fk" 
                                DataSourceID="SqlGridEntrevistacaptacao" style="margin-right: 0px" 
                                Width="666px" EnableViewState="False">
                                                <PagerStyle CssClass="pagerstyle" />
                                                <Columns>
                                                    <asp:BoundField DataField="captador" HeaderText="Captador" 
                                        SortExpression="captador" >
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="nome_fantasia" HeaderText="Empresa" 
                                        SortExpression="nome_fantasia" >
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" >
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="QuantVaga" HeaderText="Qt. de vaga" 
                                                        SortExpression="QuantVaga">
                                                        <ItemStyle Width="90px" HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Data e horário no Click" 
                                                        SortExpression="dataClick">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label37" runat="server" Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                                                            &nbsp;<span lang="pt-br"><br />
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("horaClick") %>'></asp:Label>
                                                            </span>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Data e horário na Empresa" 
                                                        SortExpression="dataEmpresa">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("dataEmpresa") %>'></asp:Label>
                                                            <br />
                                                            <span lang="pt-br">
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("horaEmpresa") %>'></asp:Label>
                                                            </span>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Data da captação" SortExpression="dataStatus">
                                                        <EditItemTemplate>
                                                            <asp:Label ID="Label38" runat="server" Text='<%# Eval("dataStatus") %>'></asp:Label>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label39" runat="server" Text='<%# Bind("dataStatus") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <span lang="pt-br" 
                                        
                                        style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">Não existe entrevista para essa vaga.
                                                    </span>
                                                </EmptyDataTemplate>
                                                <SelectedRowStyle BackColor="#D1DDF1" />
                                                <AlternatingRowStyle CssClass="altrowstyle" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlGridEntrevistacaptacao" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                    OldValuesParameterFormatString="" 
                    
                    
                                                
                                                
                                                
                                                SelectCommand="SELECT tblEntrevista.id_entrevista, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.dataStatus, tblStatusEntrevista.statusEntrevista, tblCBO.cargo, tblEmpresa.nome_fantasia, tblVaga.QuantVaga, tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.id_vaga_fk, tblCaptadorEntrevista.captador, tblEmpresa.id_empresa FROM tblCaptadorEntrevista RIGHT OUTER JOIN tblEntrevista ON tblCaptadorEntrevista.id_entrevista_fk = tblEntrevista.id_entrevista LEFT OUTER JOIN tblCBO INNER JOIN tblVaga ON tblCBO.id_cargo = tblVaga.id_cargo_fk INNER JOIN tblEmpresa ON tblVaga.id_empresa_fk = tblEmpresa.id_empresa ON tblEntrevista.id_vaga_fk = tblVaga.id_vaga LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.id_vaga_fk IS NOT NULL) AND (tblEntrevista.tipoEntrevista IS NULL) AND (ISNULL(tblEntrevista.dataClick, '1900-01-01') BETWEEN @dataInicialclick AND @dataFinalclick) AND (tblCaptadorEntrevista.captador LIKE LTRIM(RTRIM(@captador)) + '%') AND (tblVaga.id_empresa_fk = (CASE WHEN @id_empresa = 0 THEN tblVaga.id_empresa_fk ELSE @id_empresa END)) ORDER BY tblEntrevista.captador" 
                                                EnableViewState="False">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="cboempresabusca0" DefaultValue="" 
                            Name="id_empresa" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="txtperiodoInicial0" DbType="DateTime" 
                            DefaultValue="1900-01-01" Name="dataInicialclick" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="txtperiodofinal0" DbType="DateTime" 
                            DefaultValue="2030-01-01" Name="dataFinalclick" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="cbocaptadorBusca0" 
                            Name="captador" PropertyName="SelectedValue" DefaultValue="" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                                </span>
                           
        <a name="Passo3"></a>
                        <asp:Panel ID="Panel4" runat="server" BackColor="#3399FF" 
            Height="20px" EnableViewState="False">
                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                <span lang="pt-br">&nbsp;&nbsp; 3° Passo - BUSCAR AS VAGAS A SEREM AGENDADAS
                                <span style="font-size:12.0px; font-family:VERdana; language:pt-BR;
font-weight:bold">- SELECIONE O OPÇÃO POR STATUS, DATA, EMPRESA OU CARGO </span></span></div>
                                              </asp:Panel>
                        <br />
       
                <span lang="pt-br">
                <table cellpadding="0" cellspacing="0" style="width: 788px">
                    <tr>
                        <td class="style34" valign="top">
                            <span lang="pt-br">
                            <asp:Label ID="lbltituloVagas0" runat="server" ForeColor="#006699" 
                                style="font-weight: 700" Text="Buscar vagas por status:" 
                                EnableViewState="False"></asp:Label>
                            </span>
                        </td>
                        <td class="style28" valign="middle">
                            <asp:DropDownList ID="cboStatusBusca" runat="server" Font-Size="8pt" 
                                EnableViewState="False">
                               
                                <asp:ListItem Value="1">Ativada</asp:ListItem>
                                <asp:ListItem Value="2">Em análise</asp:ListItem>
                                <asp:ListItem Value="0">Desativada</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style28" colspan="2" valign="middle">
                            &nbsp;</td>
                        <td class="style11" valign="middle">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style34" valign="top">
                            <span lang="pt-br">
                            <asp:Label ID="lbltituloVagas1" runat="server" ForeColor="#006699" 
                                style="font-weight: 700" Text="Período:" EnableViewState="False"></asp:Label>
                            </span>
                        </td>
                        <td class="style28" valign="middle">
                            <span lang="pt-br">
                            <asp:TextBox ID="txtDtInicial" runat="server" EnableViewState="False" 
                                Height="22px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtDtInicial_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="txtDtInicial">
                            </ajaxToolkit:CalendarExtender>
                            <asp:TextBox ID="txtDtFinal" runat="server" EnableViewState="False"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtDtFinal_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="txtDtFinal">
                            </ajaxToolkit:CalendarExtender>
                            </span>
                        </td>
                        <td class="style28" colspan="2" valign="middle">
                            &nbsp;</td>
                        <td class="style11" valign="middle">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style34" valign="top">
                            <span lang="pt-br">
                            <asp:Label ID="lbltituloVagas" runat="server" ForeColor="#006699" 
                                style="font-weight: 700" Text="Empresa:" EnableViewState="False"></asp:Label>
                            </span>
                        </td>
                        <td class="style28" valign="middle">
                            <asp:DropDownList ID="cboempresabusca1" runat="server" 
                                DataSourceID="sqlEmpresas" DataTextField="nome_fantasia" 
                                DataValueField="id_empresa" Font-Size="10px" EnableViewState="False" 
                                AppendDataBoundItems="True">
                                <asp:ListItem Value="0">TODOS</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style28" colspan="2" valign="middle">
                            &nbsp;</td>
                        <td class="style11" valign="middle">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style34" valign="middle">
                            <span lang="pt-br">
                            <asp:Label ID="lbltituloVagas3" runat="server" ForeColor="#006699" 
                                style="font-weight: 700" Text="CNPJ:" EnableViewState="False"></asp:Label>
                            </span>
                        </td>
                        <td class="style28" valign="middle">
                            <span lang="pt-br">
                            <asp:TextBox ID="txtCNPJ" runat="server" EnableViewState="False"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="txtCNPJ_MaskedEditExtender" runat="server" 
                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                Mask="99.999.999/9999-99" TargetControlID="txtCNPJ">
                            </ajaxToolkit:MaskedEditExtender>
                            </span>
                        </td>
                        <td class="style28" colspan="2" valign="middle">
                            &nbsp;</td>
                        <td class="style11" valign="middle">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style34" valign="middle">
                            <span lang="pt-br">
                            <asp:Label ID="lbltituloVagas2" runat="server" ForeColor="#006699" 
                                style="font-weight: 700" Text="Cargo:" EnableViewState="False"></asp:Label>
                            </span>
                        </td>
                        <td class="style28" colspan="2" valign="middle">
                            <asp:TextBox ID="txtCargo" runat="server" EnableViewState="False"></asp:TextBox>
                            <span lang="pt-br">
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="Middle" 
                                ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" />
                            Clique aqui para buscar</span></td>
                        <td class="style28" colspan="2" valign="middle">
                            &nbsp;</td>
                    </tr>
                </table>
                <a name="Passo4"></a>
                <asp:Panel ID="Panel5" runat="server" BackColor="#3399FF" Height="20px" 
                    EnableViewState="False">
                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                        <span lang="pt-br">&nbsp;&nbsp; 4° Passo - ESCOLHER AS VAGAS A SEREM AGENDADAS </span>
                    </div>
                    <br />
                </asp:Panel>
                <asp:GridView ID="GridVaga" runat="server" AutoGenerateColumns="False" 
            CssClass="grid" DataKeyNames="id_vaga,idevaga" 
            DataSourceID="SqlBuscaVagas" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ButtonType="Image" HeaderText="Clique para ver detalhes" 
                            SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                            ShowHeader="True" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:BoundField DataField="id_vaga" HeaderText="Código" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id_vaga">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="QuantVaga" HeaderText="Quantidade de vagas" 
                            SortExpression="QuantVaga">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nome_fantasia" HeaderText="Empresa" 
                            SortExpression="nome_fantasia">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="statusvaga" HeaderText="Status da vaga" 
                            ReadOnly="True" SortExpression="statusvaga">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Data da entrada da vaga" SortExpression="Data">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Data") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" 
                                    Text='<%# Bind("ultima_atualizacao", "{0:D}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Representantes - Telefone/Celular/E-mail">
                            <ItemTemplate>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="id_representante" DataSourceID="Sqlrepresentantes" 
                                    GridLines="None" ShowHeader="False">
                                    <Columns>
                                        <asp:BoundField DataField="representante" SortExpression="representante" />
                                        <asp:TemplateField SortExpression="telefones">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("telefones") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                Tel:.<asp:Label ID="Label1" runat="server" 
                                                    Text='<%# Bind("telefones", "{0}") %>'></asp:Label>
                                                &nbsp;/ Cel:.<span lang="pt-br"><asp:Label ID="Label2" runat="server" 
                                                    Text='<%# Bind("celular", "{0}") %>'></asp:Label>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="emailrep" SortExpression="emailrep" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="Sqlrepresentantes" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                    SelectCommand="SELECT id_representante, representante, telefones, celular, emailrep FROM tblEmpresaRepresentantes WHERE (id_empresa_fk = @id_empresa)">
                                    <SelectParameters>
                                        <asp:Parameter Name="id_empresa" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
        </asp:GridView>
               
                      <a name="Passo5"></a>
                <asp:Panel ID="Panel12" runat="server" BackColor="#3399FF" Height="20px">
                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                        <span lang="pt-br">&nbsp;&nbsp; 5° Passo - EDITAR A VAGA</span></div>
                    <br />
                </asp:Panel>
                <asp:MultiView ID="MultiView4" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server" EnableViewState="False">
                        <asp:Label ID="lblareaedicao" runat="server" Font-Bold="True" Font-Size="15px" 
                            Text="Área de edição dos dados da vaga"></asp:Label>
                        <span lang="pt-br">
                        <asp:SqlDataSource ID="SqlLogAlteracao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            InsertCommand="INSERT INTO tblLogAlteraVaga(id_vaga, usuario, status) VALUES (@id_vaga, @usuario, @status)" 
                            SelectCommand="SELECT id_vaga FROM tblVaga" EnableCaching="False" 
                            EnableViewState="False">
                            <InsertParameters>
                                <asp:SessionParameter Name="usuario" SessionField="c_nome" />
                                <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                                <asp:Parameter DefaultValue="área administrativa" Name="status" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlCaptadores2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                            
                            
                            SelectCommand="SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario WHERE (admPortalPerfilUsuario.IdPerfil = 5) AND (admPortalUsuario.Ativo = 'true') ORDER BY admPortalUsuario.Nome" 
                            EnableCaching="False" EnableViewState="False">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlCaptadores1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                            SelectCommand="SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario WHERE (admPortalPerfilUsuario.IdPerfil = 5) AND (admPortalUsuario.Ativo = 'true') ORDER BY admPortalUsuario.Nome" 
                            EnableViewState="False"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="sqlVagaForm" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            InsertCommand="INSERT INTO tblVaga(id_cargo_fk, id_empresa_fk, modalidade, id_escolaridade_fk, modalidade_inicio, modalidade_fim, descricao, perfil, id_localtrabalho_fk, Faixaetariainicial, Faixaetariafinal, sexo, estado_civil, horario_entrada, horario_saida, domingo, segunda, terca, quarta, quinta, sexta, sabado, horario_obs, salario, vale_refeicao, refeicao_local, salario_observacao, dados_qualitativos, vale_alimentacao, plano_saude, Bairro, id_cargo_fkPai, QuantVaga, Valetransporte, ativada, rua, complemento, bairroent, id_municipio_fk, pontoreferencia, resp_vaga) VALUES (@id_cargo_fk, @id_empresa_fk, @modalidade, @id_escolaridade_fk, @modalidade_inicio, @modalidade_fim, @descricao, @perfil, @id_localtrabalho_fk, @faixaetariainicial, @faixaetariafinal, @sexo, @estado_civil, @horario_entrada, @horario_saida, @domingo, @segunda, @terca, @quarta, @quinta, @sexta, @sabado, @horario_obs, @salario, @vale_refeicao, @refeicao_local, @salario_observacao, @dados_qualitativos, @vale_alimentacao, @plano_saude, @bairro, @id_cargo_fkPai, @QuantVaga, @valetransporte, NULL, @rua, @complemento, @bairroent, @id_municipio_fk, @pontoreferencia, @resp_vaga)" 
                            SelectCommand="SELECT tblVaga.id_vaga, tblVaga.modalidade, tblVaga.modalidade_inicio, tblVaga.modalidade_fim, tblVaga.descricao, tblVaga.perfil, tblVaga.id_localtrabalho_fk, tblVaga.Faixaetariainicial, tblVaga.Faixaetariafinal, tblVaga.sexo, tblVaga.estado_civil, tblVaga.horario_entrada, tblVaga.horario_saida, tblVaga.domingo, tblVaga.segunda, tblVaga.terca, tblVaga.quarta, tblVaga.quinta, tblVaga.sexta, tblVaga.sabado, tblVaga.horario_obs, CONVERT (numeric(8 , 2), tblVaga.salario) AS salario, tblVaga.salario_dia, tblVaga.salario_dia_mes, tblVaga.vale_transporte, tblVaga.vale_refeicao, tblVaga.vale_alimentacao, tblVaga.plano_saude, tblVaga.refeicao_local, tblVaga.salario_observacao, tblVaga.dados_qualitativos, tblVaga.ultima_atualizacao, tblVaga.encerrada, tblVaga.Bairro, tblVaga.QuantVaga, CONVERT (numeric(8 , 2), tblVaga.Valetransporte) AS Valetransporte, tblVaga.rua, tblVaga.complemento, tblVaga.bairroent, tblVaga.id_municipio_fk, tblVaga.pontoreferencia, tblVaga.id_cargo_fk, tblVaga.id_empresa_fk, tblVaga.id_cargo_fkPai, tblCBO.cargo, tblCBO.tipo, tblVaga.id_escolaridade_fk, CASE WHEN tblVaga.ativada IS NULL THEN '0' WHEN tblVaga.ativada = 0 THEN '2' WHEN tblVaga.ativada = 1 THEN '1' END AS ativada, tblVaga.ativada_obs, tblVaga.resp_vaga, tblEmpresa.id_sindicato_fk FROM tblEmpresa RIGHT OUTER JOIN tblVaga INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo ON tblEmpresa.id_empresa = tblVaga.id_empresa_fk WHERE (tblVaga.id_vaga = @id_vaga)" 
                            
                            UpdateCommand="UPDATE tblVaga SET id_cargo_fk = @id_cargo_fk, modalidade = @modalidade, modalidade_inicio = @modalidade_inicio, modalidade_fim = @modalidade_fim, descricao = @descricao, perfil = @perfil, id_localtrabalho_fk = @id_localtrabalho_fk, id_escolaridade_fk = @id_escolaridade_fk, Faixaetariainicial = @faixaetariainicial, Faixaetariafinal = @faixaetariafinal, sexo = @sexo, estado_civil = @estado_civil, horario_entrada = @horario_entrada, horario_saida = @horario_saida, domingo = @domingo, segunda = @segunda, terca = @terca, quarta = @quarta, quinta = @quinta, sexta = @sexta, sabado = @sabado, horario_obs = @horario_obs, salario = @salario, vale_refeicao = @vale_refeicao, vale_alimentacao = @vale_alimentacao, plano_saude = @plano_saude, refeicao_local = @refeicao_local, salario_observacao = @salario_observacao, dados_qualitativos = @dados_qualitativos, Bairro = @bairro, id_cargo_fkPai = @id_cargo_fkPai, QuantVaga = @QuantVaga, rua = @rua, complemento = @complemento, bairroent = @bairroent, id_municipio_fk = @id_municipio_fk, pontoreferencia = @pontoreferencia, Valetransporte = REPLACE(@valetransporte, ',', '.'), ativada = (CASE WHEN @ativada = 0 THEN NULL WHEN @ativada = 1 THEN '1' WHEN @ativada = 2 THEN '0' END), ativada_obs = @ativada_obs, resp_vaga = @resp_vaga WHERE (id_vaga = @id_vaga)" 
                            EnableCaching="False" EnableViewState="False">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
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
                                <asp:ControlParameter ControlID="cboid_cargo_fkPai"
                                 Name="id_cargo_fkPai" PropertyName="SelectedValue" Type="String"/>
                                    
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
                                <asp:ControlParameter ControlID="cboid_empresa_fk" Name="id_empresa_fk" 
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
                        <asp:SqlDataSource ID="sqlSindicato" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            SelectCommand="select * from tblsindicatos" EnableCaching="False" 
                            EnableViewState="False"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="Sqloperador" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                            
                            SelectCommand="SELECT Matricula, Nome FROM admPortalUsuario WHERE (Matricula = '10770') OR (Matricula = ' 9387') OR (Matricula = '10702') ORDER BY Nome" 
                            EnableCaching="False" EnableViewState="False">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="Sqlcaptadores" runat="server" 
                            CacheExpirationPolicy="Sliding" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                            
                            
                            SelectCommand="SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario WHERE (admPortalPerfilUsuario.IdPerfil = 5) AND (admPortalUsuario.Ativo = 'true')  ORDER BY nome" 
                            EnableCaching="False" EnableViewState="False">
                        </asp:SqlDataSource>
                        </span>
                        <br />
                        <table class="style4" style="font-size: 12px">
                            <tr>
                                <td class="style53">
                                    &nbsp;</td>
                                <td colspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Responsável:</td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cboresp_vaga" runat="server" 
                                        DataSourceID="sqlCaptadores1" DataTextField="Nome" DataValueField="Nome" 
                                        Font-Size="8pt" EnableViewState="False">
                                        <asp:ListItem>Empresa</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    <span lang="pt-br">Empresa:</span></td>
                                <td colspan="2">
                                    <asp:SqlDataSource ID="sqlEmpresas" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        
                                        SelectCommand="SELECT [nome_fantasia], [id_empresa] FROM [tblEmpresa] WHERE [nome_fantasia] is not null ORDER BY [nome_fantasia]" 
                                        EnableViewState="False">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="cboid_empresa_fk" runat="server" 
                                        DataSourceID="sqlEmpresas" DataTextField="nome_fantasia" 
                                        DataValueField="id_empresa" Font-Size="8pt" Width="440px" 
                                        EnableTheming="False" EnableViewState="False">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Sindicato:</td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cboid_sindicato_fk" runat="server" 
                                        DataSourceID="sqlSindicato" DataTextField="sindicato" 
                                        DataValueField="id_sindicato" Enabled="False" Font-Size="8pt" 
                                        Width="440px" EnableTheming="False">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Cargo:</td>
                                <td colspan="2">
                                    <asp:DropDownList ID="cboid_cargo_fkPai" runat="server" 
                                        AppendDataBoundItems="True" AutoPostBack="True" datasourceid="sqlCBOLista0" 
                                        DataTextField="cargo" DataValueField="id_cargo" Font-Size="8pt" 
                                        Width="440px" EnableTheming="False">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlCBOLista0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        SelectCommand="SELECT id_cargo, cargo FROM tblCBO WHERE (tipo = 'Família') ORDER BY cargo" 
                                        EnableCaching="False" EnableViewState="False">
                                    </asp:SqlDataSource>
                                    <br />
                                    <asp:DropDownList ID="cboid_cargo_fk" runat="server" 
                                        datasourceid="sqlCBOEmpresaVaga0" DataTextField="cargo" 
                                        DataValueField="id_cargo" Font-Size="8pt" Font-Strikeout="False" 
                                        Width="380px" EnableTheming="False">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlCBOEmpresaVaga0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        
                                        SelectCommand="SELECT id_cargo, cargo, tipo FROM tblCBO WHERE (SUBSTRING(id_cargo, 1, 4) = SUBSTRING(@id_cargo, 1, 4)) AND (tipo &lt;&gt; 'Família')" 
                                        EnableViewState="False">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboid_cargo_fkPai" Name="id_cargo" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Modalidade:</td>
                                <td class="style5">
                                    <br />
                                    <asp:DropDownList ID="cbomodalidade" runat="server" AutoPostBack="True" 
                                        Font-Size="8pt" EnableTheming="False">
                                        <asp:ListItem Value="E">Efetiva</asp:ListItem>
                                        <asp:ListItem Selected="True" Value="T">Temporária</asp:ListItem>
                                        <asp:ListItem Value="F">Freelancer</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Quantidade de vagas:</td>
                                <td class="style5" colspan="2">
                                    <asp:TextBox ID="txtQuantVaga" runat="server" CausesValidation="True" 
                                        MaxLength="10" Width="60px" EnableTheming="False" />
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtQuantVaga" ErrorMessage="Campo obrigatório" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Período inicial:</td>
                                <td class="style5" colspan="2">
                                    <asp:TextBox ID="txtmodalidade_inicio" runat="server" CausesValidation="True" 
                                        MaxLength="7" Text='<%# Bind("modalidade_inicio", "{0:d}") %>' 
                                        ToolTip="Data inicial. Formato mês/ano ex. 12/2008" Width="100px" 
                                        Wrap="False" EnableTheming="False" />
                                    &nbsp;<ajaxToolkit:MaskedEditExtender ID="modalidade_inicio_MaskedEditExtender" 
                                        runat="server" AcceptNegative="Right" Enabled="True" Mask="99/9999" 
                                        MaskType="Date" TargetControlID="txtmodalidade_inicio">
                                    </ajaxToolkit:MaskedEditExtender>
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="rqPeriodoInicial" runat="server" 
                                        ControlToValidate="txtmodalidade_inicio" 
                                        ErrorMessage="Campo obrigatório. Digite mês/Ano ex. 12/2008" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Período final:</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtmodalidade_fim" runat="server" MaxLength="7" 
                                        Text='<%# Bind("modalidade_fim", "{0:D}") %>' 
                                        ToolTip="Data final. Formato mês/ano ex. 12/2008. Caso modalidade seja efetiva o campo não é preenchido." 
                                        Width="100px" EnableTheming="False" />
                                    <ajaxToolkit:MaskedEditExtender ID="modalidade_fim_MaskedEditExtender" 
                                        runat="server" Enabled="True" Mask="99/9999" MaskType="Date" 
                                        TargetControlID="txtmodalidade_fim">
                                    </ajaxToolkit:MaskedEditExtender>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Descrição da função:</td>
                                <td class="style5" colspan="2">
                                    <asp:TextBox ID="txtdescricao" runat="server" MaxLength="1000" Rows="3" 
                                        Text='<%# Bind("descricao") %>' TextMode="MultiLine" Width="175px" 
                                        EnableTheming="False" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Perfil:</td>
                                <td class="style5" colspan="2">
                                    <asp:TextBox ID="txtperfil" runat="server" MaxLength="2000" Rows="3" 
                                        style="margin-left: 0px" Text='<%# Bind("perfil") %>' TextMode="MultiLine" 
                                        Width="250px" EnableTheming="False" />
                                    <span lang="pt-br">&nbsp;<asp:RequiredFieldValidator ID="valPerfil" runat="server" 
                                        ControlToValidate="txtperfil" ErrorMessage="Campo obrigatório" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Local de trabalho:</td>
                                <td class="style5">
                                    <asp:DropDownList ID="cboid_localtrabalho_fk" runat="server" 
                                        DataSourceID="sqlMunicipioLista0" DataTextField="nome" 
                                        DataValueField="id_municipio" Font-Size="8pt" EnableTheming="False">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlMunicipioLista0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" SelectCommand="SELECT isnull([id_municipio], '') as id_municipio, [nome] FROM [tblMunicipio] 
where estado_fk='rj'
ORDER BY [nome]" EnableCaching="False" EnableViewState="False"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Bairro:</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtBairro" runat="server" MaxLength="40" EnableTheming="False"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Escolaridade:</td>
                                <td class="style5">
                                    <asp:DropDownList ID="cboid_escolaridade_fk" runat="server" 
                                        datasourceid="sqlEscolaridadeLista0" DataTextField="formacao" 
                                        DataValueField="id_formacaonivel" Font-Size="8pt" EnableTheming="False">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlEscolaridadeLista0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        SelectCommand="SELECT [id_formacaonivel], [formacao] FROM [tblFormacaoNivel] ORDER BY [id_formacaonivel]" 
                                        EnableCaching="False" EnableViewState="False">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Faixa etária:</td>
                                <td class="style5" colspan="2">
                                    <asp:DropDownList ID="cboFaixaetariainicial" runat="server" 
                                        datasourceid="sqlFaixaEtariaLista0" DataTextField="faixa" 
                                        DataValueField="faixa" Font-Size="8pt" EnableTheming="False">
                                    </asp:DropDownList>
                                    &nbsp;a&nbsp;
                                    <asp:DropDownList ID="cboFaixaetariaFinal" runat="server" 
                                        datasourceid="sqlFaixaEtariaLista0" DataTextField="faixa" 
                                        DataValueField="faixa" Font-Size="8pt" EnableTheming="False">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlFaixaEtariaLista0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT faixa FROM tblFaixaEtaria ORDER BY faixa" 
                                        EnableCaching="False" EnableViewState="False">
                                    </asp:SqlDataSource>
                                    <span lang="pt-br">
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToCompare="CBOfaixaetariafinal" 
                                        ControlToValidate="CBOfaixaetariainicial" 
                                        ErrorMessage="Valor maior do que a Faixa Etária Final" Operator="LessThan" 
                                        ValidationGroup="empresa" ValueToCompare="CBOfaixaetariaFinal" Width="220px"></asp:CompareValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Sexo:<br />
                                </td>
                                <td class="style5">
                                    <asp:DropDownList ID="CBOsexo" runat="server" datasourceid="sqlSexo0" 
                                        DataTextField="sexo" DataValueField="id_sexo" Font-Size="8pt" 
                                        EnableTheming="False">
                                        <asp:ListItem Value="M">Masculino</asp:ListItem>
                                        <asp:ListItem Value="F">Feminino</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlSexo0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        SelectCommand="SELECT [id_sexo], [sexo] FROM [tblSexo] ORDER BY [id_sexo]" 
                                        EnableCaching="False" EnableViewState="False">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Estado civil:</td>
                                <td class="style5">
                                    <asp:DropDownList ID="CBOEstado_civil" runat="server" 
                                        datasourceid="sqlEstadoCivilLista0" DataTextField="estadocivil" 
                                        DataValueField="id_estadocivil" Font-Size="8pt" EnableTheming="False">
                                        <asp:ListItem Value="S">Solteiro</asp:ListItem>
                                        <asp:ListItem Value="C">Casado</asp:ListItem>
                                        <asp:ListItem Value="D">Desquitado</asp:ListItem>
                                        <asp:ListItem Value="R">Divorciado</asp:ListItem>
                                        <asp:ListItem Value="V">Viúvo</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlEstadoCivilLista0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        SelectCommand="SELECT [id_estadocivil], [estadocivil] FROM [tblEstadoCivil] ORDER BY [estadocivil]" 
                                        EnableCaching="False" EnableViewState="False">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53" colspan="0" dir="ltr" style="text-align: left;">
                                    Horário de trabalho&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td class="style5" colspan="2">
                                    <span lang="pt-br">Entrada:</span><asp:TextBox ID="txtHorario_entrada" 
                                        runat="server" MaxLength="5" Text='<%# Bind("horario_entrada") %>' 
                                        ToolTip="Digite no formato HH:MM, inclusive os dois pontos." Width="70px" 
                                        EnableViewState="False" />
                                    <ajaxToolkit:MaskedEditExtender ID="Horario_entrada_MaskedEditExtender" 
                                        runat="server" Mask="99:99" MaskType="Time" 
                                        TargetControlID="txtHorario_entrada">
                                    </ajaxToolkit:MaskedEditExtender>
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="valEntrada" runat="server" 
                                        ControlToValidate="txtHorario_entrada" ErrorMessage="Campo obrigatório" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="text-align: right;">
                                    &nbsp;</td>
                                <td class="style5" colspan="2">
                                    <span lang="pt-br">&nbsp;&nbsp; Saida:</span><asp:TextBox ID="txtHorario_saida" 
                                        runat="server" MaxLength="5" Text='<%# Bind("horario_saida") %>' 
                                        ToolTip="Digite no formato HH:MM, inclusive os dois pontos." Width="70px" 
                                        EnableViewState="False" />
                                    <ajaxToolkit:MaskedEditExtender ID="Horario_saida_MaskedEditExtender" 
                                        runat="server" Mask="99:99" MaskType="Time" TargetControlID="txtHorario_saida">
                                    </ajaxToolkit:MaskedEditExtender>
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="valSaida" runat="server" 
                                        ControlToValidate="txtHorario_saida" ErrorMessage="Campo obrigatório" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Dias trabalhados:</td>
                                <td class="style5">
                                    <asp:CheckBox ID="chkSegunda" runat="server" Checked='<%# Bind("segunda") %>' 
                                        Font-Size="7pt" Text="Seg" EnableViewState="False" />
                                    <asp:CheckBox ID="chkTerca" runat="server" Checked='<%# Bind("terca") %>' 
                                        Font-Size="7pt" Text="Ter" EnableViewState="False" />
                                    &nbsp;<asp:CheckBox ID="chkQuarta" runat="server" Checked='<%# Bind("quarta") %>' 
                                        Font-Size="7pt" Text="Quar" EnableViewState="False" />
                                    &nbsp;<asp:CheckBox ID="chkQuinta" runat="server" Checked='<%# Bind("quinta") %>' 
                                        Font-Size="7pt" Text="Qui" EnableViewState="False" />
                                    <br />
                                    <asp:CheckBox ID="chkSexta" runat="server" Checked='<%# Bind("sexta") %>' 
                                        Font-Size="7pt" Text="Sex" EnableViewState="False" />
                                    <asp:CheckBox ID="chkSabado" runat="server" Checked='<%# Bind("sabado") %>' 
                                        Font-Size="7pt" Text="Sab" EnableViewState="False" />
                                    &nbsp;<asp:CheckBox ID="chkDomingo" runat="server" Checked='<%# Bind("domingo") %>' 
                                        Font-Size="7pt" Text="Dom" EnableViewState="False" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Observações sobre horário de trabalho:</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtHorario_obs" runat="server" MaxLength="500" Rows="3" 
                                        Text='<%# Bind("horario_obs") %>' TextMode="MultiLine" Width="300px" 
                                        EnableViewState="False"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Remuneração/Salário: R$
                                </td>
                                <td class="style5" colspan="2" style="font-size: 10px;">
                                    <asp:TextBox ID="moeSalario" runat="server" MaxLength="10" 
                                        Text='<%# Bind("salario") %>' 
                                        ToolTip="Digite o valor monetário (ex.1.000,00) com ponto e vírgula." 
                                        EnableViewState="False" />
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="valSalario" runat="server" 
                                        ControlToValidate="moeSalario" ErrorMessage="Campo obrigatório" 
                                        SetFocusOnError="True" ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    &nbsp;<asp:RegularExpressionValidator ID="regValSalario" runat="server" 
                                        ControlToValidate="moeSalario" ErrorMessage="Formato incorreto. Ex 1000,00" 
                                        SetFocusOnError="True" 
                                        ValidationExpression="^([0-9]*\,?[0-9]+|[0-9]+\,?[0-9]*)?$"></asp:RegularExpressionValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Obs. sobre salário:</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtsalario_observacao" runat="server" MaxLength="500" Rows="3" 
                                        Text='<%# Bind("salario_observacao") %>' TextMode="MultiLine" 
                                        Width="300px" EnableViewState="False" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53" style="text-align: left; ">
                                    Benefícios:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                </td>
                                <td colspan="2">
                                    <asp:CheckBox ID="chkrefeicao_local" runat="server" 
                                        Checked='<%# Bind("refeicao_local") %>' Font-Size="8pt" 
                                        Text="Refeição no local" EnableViewState="False" />
                                    <asp:CheckBox ID="chkVale_alimentacao" runat="server" Font-Size="8pt" 
                                        Text="Vale alimentação" EnableViewState="False" />
                                    &nbsp;&nbsp;<br />
                                    <asp:CheckBox ID="chkPlano_saude" runat="server" 
                                        Checked='<%# Bind("plano_saude") %>' Font-Size="8pt" Text="Plano de saúde" 
                                        EnableViewState="False" />
                                    &nbsp;&nbsp;
                                    <asp:CheckBox ID="chkVale_refeicao" runat="server" 
                                        Checked='<%# Bind("vale_refeicao") %>' Font-Size="8pt" 
                                        Text="Vale refeição" EnableViewState="False" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="text-align: left;">
                                    Vale transporte/Valor diário: R$</td>
                                <td class="style5" colspan="2" style="font-size: 10px;">
                                    <asp:TextBox ID="moeValetransporte" runat="server" MaxLength="10" 
                                        Text='<%# Bind("salario") %>' 
                                        ToolTip="Digite o valor monetário (ex.1.000,00) com ponto e vírgula." 
                                        Width="60px" EnableViewState="False" />
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="valValetransporte" runat="server" 
                                        ControlToValidate="moeValetransporte" Enabled="False" 
                                        ErrorMessage="Campo obrigatório" SetFocusOnError="True" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    &nbsp;<asp:RegularExpressionValidator ID="regValValeTransporte" runat="server" 
                                        ControlToValidate="moeValetransporte" 
                                        ErrorMessage="Formato incorreto. Ex 1000,00" SetFocusOnError="True" 
                                        ValidationExpression="^([0-9]*\,?[0-9]+|[0-9]+\,?[0-9]*)?$"></asp:RegularExpressionValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Outras informações sobre a vaga:</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtdados_qualitativos" runat="server" MaxLength="1000" 
                                        Rows="3" Text='<%# Bind("dados_qualitativos") %>' TextMode="MultiLine" 
                                        Width="300px" EnableViewState="False" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style17" colspan="3">
                                    Endereço da entrevista:</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Rua:</td>
                                <td class="style5" colspan="2">
                                    <asp:TextBox ID="txtRua" runat="server" Width="300px" EnableViewState="False"></asp:TextBox>
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="rqRua" runat="server" 
                                        ControlToValidate="txtRua" ErrorMessage="Campo obrigatório" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Complemento:</td>
                                <td class="style5" colspan="2">
                                    <asp:TextBox ID="txtcomplemento" runat="server" Width="80px" 
                                        EnableViewState="False"></asp:TextBox>
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="rqcomplemento" runat="server" 
                                        ControlToValidate="txtcomplemento" ErrorMessage="Campo obrigatório" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Município:</td>
                                <td class="style5">
                                    <asp:DropDownList ID="cboid_municipio_fk" runat="server" 
                                        DataSourceID="SqlmunicipioEntrevista" DataTextField="nome" 
                                        DataValueField="id_municipio" Font-Size="8pt" EnableViewState="False">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlmunicipioEntrevista" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        SelectCommand="SELECT ISNULL(id_municipio, '') AS id_municipio, nome FROM tblMunicipio WHERE (estado_fk = 'rj') ORDER BY nome" 
                                        EnableViewState="False">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Bairro:</td>
                                <td class="style5" colspan="2">
                                    <asp:TextBox ID="txtBairroEnt" runat="server" EnableViewState="False"></asp:TextBox>
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="rqbairro" runat="server" 
                                        ControlToValidate="txtBairroEnt" ErrorMessage="Campo obrigatório" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Ponto de referência:</td>
                                <td class="style5" colspan="2">
                                    <asp:TextBox ID="txtpontoreferencia" runat="server" MaxLength="1000" Rows="3" 
                                        TextMode="MultiLine" Width="300px" EnableViewState="False"></asp:TextBox>
                                    <span lang="pt-br">
                                    <asp:RequiredFieldValidator ID="rqpontoreferencia" runat="server" 
                                        ControlToValidate="txtpontoreferencia" ErrorMessage="Campo obrigatório" 
                                        ValidationGroup="empresa"></asp:RequiredFieldValidator>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Status:</td>
                                <td class="style5">
                                    <asp:DropDownList ID="cboativada" runat="server" Enabled="False" 
                                        Font-Size="8pt" EnableViewState="False">
                                        <asp:ListItem Value="0">Em análise</asp:ListItem>
                                        <asp:ListItem Value="1">Ativada</asp:ListItem>
                                        <asp:ListItem Value="2">Desativada</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    Obs Status:</td>
                                <td class="style5">
                                    <asp:TextBox ID="txtativada_obs" runat="server" Height="52px" 
                                        TextMode="MultiLine" Width="300px" EnableViewState="False"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style53">
                                    <table class="style8">
                                        <tr>
                                            <td align="center" class="style52">
                                                <asp:ImageButton ID="ibtSalvarAlterar" runat="server" ImageAlign="Middle" 
                                                    ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                                    ToolTip="Atualizar vaga selecionada" ValidationGroup="empresa" 
                                                    EnableViewState="False" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="justify" class="style52">
                                                <asp:Label ID="lblAlterar" runat="server" Text="Atualizar"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="style5">
                                    <span lang="pt-br">
                                    <asp:Label ID="lblaviso" runat="server" ForeColor="#FF6600"></asp:Label>
                                    </span>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <span lang="pt-br">
                     
                        </span>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                            
                            SelectCommand="SELECT tblEmpresaRepresentantes.telefones, tblEmpresaRepresentantes.celular, tblEmpresaRepresentantes.emailrep, tblEmpresa.email, tblEmpresaRepresentantes.representante FROM tblEmpresa INNER JOIN tblEmpresaRepresentantes ON tblEmpresa.id_empresa = tblEmpresaRepresentantes.id_empresa_fk INNER JOIN tblVaga ON tblEmpresa.id_empresa = tblVaga.id_empresa_fk WHERE (tblVaga.id_vaga = @id_vaga)" 
                            EnableViewState="False">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_vaga" SessionField="id_vaga" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:View>
                </asp:MultiView>
           
                <asp:GridView ID="GridEntrevistaGeral0" runat="server" 
                    AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                    CssClass="grid" DataSourceID="sqlEmpresaDetalhe" Font-Underline="False" 
                    PageSize="5" style="margin-right: 0px">
                    <PagerStyle CssClass="pagerstyle" />
                    <Columns>
                        <asp:BoundField DataField="representante" HeaderText="Representante" 
                            SortExpression="representante">
                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="telefones" HeaderText="Telefones / Representante" 
                            SortExpression="telefones">
                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="celular" HeaderText="Celular / Representante" 
                            SortExpression="celular">
                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="emailrep" HeaderText="Email / Representante" 
                            SortExpression="emailrep">
                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="Email / Empresa" 
                            SortExpression="email">
                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                        </asp:BoundField>
                    </Columns>
                    <PagerTemplate>
                        <asp:Label ID="Label31" runat="server" Text="Mostrar filas:" />
                        <asp:DropDownList ID="RegsPag2" runat="server" AutoPostBack="true" 
                            CssClass="LetraNormal" OnSelectedIndexChanged="RegsPag_SelectedIndexChanged">
                            <asp:ListItem Value="3" />
                            <asp:ListItem Value="5" />
                            <asp:ListItem Value="10" />
                            <asp:ListItem Value="15" />
                        </asp:DropDownList>
                        &nbsp; Ir a de
                        <asp:Label ID="lblTotalNumberOfPages2" runat="server" />
                        &nbsp;
                        <asp:Button ID="Button13" runat="server" CommandArgument="First" 
                            CommandName="Page" CssClass="primero" ToolTip="Prim. Pag" />
                        <asp:Button ID="Button14" runat="server" CommandArgument="Prev" 
                            CommandName="Page" CssClass="anterior" ToolTip="Pág. anterior" />
                        <asp:Button ID="Button15" runat="server" CommandArgument="Next" 
                            CommandName="Page" CssClass="siguiente" ToolTip="Próx. página" />
                        <asp:Button ID="Button16" runat="server" CommandArgument="Last" 
                            CommandName="Page" CssClass="ultimo" ToolTip="Últ. Pag" />
                    </PagerTemplate>
                    <EmptyDataTemplate>
                        <span lang="pt-br" 
                            style="font-family: Verdana; font-size: 11px; font-weight: bold; color: #FF6600">
                        Não existe registro no momento.</span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#D1DDF1" />
                    <AlternatingRowStyle CssClass="altrowstyle" />
                </asp:GridView>
                </a>
                </span>
              
     
           <a name="Passo6"></a>
                                <asp:Panel ID="Panel7" runat="server" 
            BackColor="#3399FF" Height="20px">
                                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                        <span lang="pt-br">&nbsp;&nbsp; 6° Passo - AGENDAMENTO DA ENTREVISTA</span></div>
                                </asp:Panel>
       
                <span lang="pt-br"><b><span class="style22">

                <asp:Panel ID="Panel11" runat="server">
                    <asp:MultiView ID="MultiView3" runat="server" ActiveViewIndex="0">
                        <asp:View ID="ViewEntrevistaEmpresa" runat="server" EnableViewState="False">
                            <span class="style23" lang="pt-br"><span class="style30">Agendar entrevista na 
                            empresa&nbsp;e no Click</span><span class="style22"> </span></span>
                            <span class="style22">
                          
                                    <span lang="pt-br">
                                    <b>
                                    <table cellpadding="0" cellspacing="0" class="style3">
                                        <tr>
                                            <td class="style50">
                                                &nbsp;</td>
                                            <td class="style51">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style50">
                                                <asp:Label ID="lblfamilia" runat="server" EnableViewState="False" 
                                                    Font-Bold="False" Text="Área:"></asp:Label>
                                            </td>
                                            <td class="style51">
                                                <asp:DropDownList ID="cbocodigo" runat="server" 
                                                    DataSourceID="SqlArea" DataTextField="area" 
                                                    DataValueField="codigo" EnableViewState="False" AutoPostBack="True">
                                                    <asp:ListItem>Família</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlArea" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                    
                                                    SelectCommand="SELECT codigo, area FROM tblSGA_AreasConhecimento " 
                                                    EnableViewState="False">
                                                </asp:SqlDataSource>
                                                <span lang="pt-br">
                                                <asp:SqlDataSource ID="SqlCursoSenac" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                    EnableViewState="False" 
                                                    
                                                    SelectCommand="SELECT oferta + '- ' + nome AS nomes, oferta FROM tblSGA_Ofertas WHERE (area_operacional_rj = @area) AND (nome LIKE '' + @nome + '%') AND (nome NOT LIKE '%OFICINA%') ORDER BY nome">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="cbocodigo" DefaultValue="%" Name="area" 
                                                            PropertyName="SelectedValue" />
                                                        <asp:ControlParameter ControlID="busca" DefaultValue="%" Name="nome" 
                                                            PropertyName="Text" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style50">
                                                <span lang="pt-br">
                                                <asp:Label ID="lblbusca" runat="server" Text="Busca:" EnableViewState="False" 
                                                    Font-Bold="False"></asp:Label>
                                                </span>
                                            </td>
                                            <td class="style51">
                                                <asp:TextBox ID="busca" runat="server" Width="180px" EnableViewState="False"></asp:TextBox>
                                                <span lang="pt-br">
                                                <asp:ImageButton ID="ImageButton9" runat="server" ImageAlign="Middle" 
                                                    ImageUrl="~/Icones/pesquisar.gif" />
                                              <asp:Label ID="lblfamilia2" runat="server" 
                                                    Text="Clique aqui para buscar as programações dos cursos Senac" 
                                                    EnableViewState="False" Font-Bold="False"></asp:Label>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4" colspan="2">
                                               
                                                        <asp:Label ID="lblSelecionada" runat="server" EnableViewState="False" 
                                                            Font-Bold="False"></asp:Label>
                                                        <br />
                                                      
                                                        <table class="style3">
                                                            <tr>
                                                                <td class="style10">
                                                                    <asp:Label ID="Label7" runat="server" Text="Selecione a oferta desejada" 
                                                                        EnableViewState="False" Font-Bold="False"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style8">
                                                                    <asp:Panel ID="Panel13" runat="server" GroupingText="Ofertas" Height="150px" 
                                                                        ScrollBars="Vertical" Width="727px">
                                                                        <asp:CheckBoxList ID="Chkoferta" runat="server" DataSourceID="SqlCursoSenac" 
                                                                            DataTextField="NOMEs" DataValueField="OFERTA" EnableViewState="False" 
                                                                            Font-Bold="False">
                                                                        </asp:CheckBoxList>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style10">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                              
                                                <span lang="pt-br"><b>
                                                <asp:SqlDataSource ID="SqlrelacionaInserir" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                    
                                                    
                                                    InsertCommand="INSERT INTO tblProgramacaoEntrevista(id_entrevista_fk, id_oferta_fk, codigo) VALUES (@id_entrevista_fk, @id_oferta_fk, @codigo)" 
                                                    EnableViewState="False">
                                                    <InsertParameters>
                                                        <asp:Parameter Name="id_oferta_fk" />
                                                        <asp:Parameter Name="id_entrevista_fk" />
                                                        <asp:Parameter Name="codigo" />
                                                    </InsertParameters>
                                                </asp:SqlDataSource>
                                                </b></span>
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
                                                <span lang="pt-br"><b><span class="style22">
                                         
                                                </span></span>
                                            </td>
                                        </tr>
                                    </table>
                           
                                    </span>
                                    <span class="style22">
                             
                                    <asp:Label ID="lblMsg" runat="server" style="color: #FF0000; font-weight: 700"></asp:Label>
                                    </span>
                            
                                    <table class="style1" height="200" 
                                        style="font-family: Verdana; font-size: 12px; color: #0066FF; font-weight: bold">
                                        <tr>
                                            <td class="style43">
                                                <asp:Label ID="lbldataEmp1" runat="server" Text="Data na Empresa:" 
                                                    EnableViewState="False" Font-Bold="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="datdataempresa" runat="server" 
                                                    ToolTip="Digite a data da entrevista na Empresa" Width="65px" 
                                                    EnableViewState="False"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="empresa_CalendarExtender" runat="server" 
                                                    BehaviorID="empresa_CalendarExtender" Enabled="True" Format="dd/MM/yyyy" 
                                                    TargetControlID="datdataempresa">
                                                </ajaxToolkit:CalendarExtender>
                                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="datdataempresa" ErrorMessage="Campo Obrigatório" 
                                                    SetFocusOnError="True" ValidationGroup="valentrevista"></asp:RequiredFieldValidator>
                                            </td>
                                            <td rowspan="12">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style43">
                                                <asp:Label ID="lblhoraemp1" runat="server" Text="Hora na empresa:" 
                                                    EnableViewState="False" Font-Bold="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="horhoraempresa" runat="server" 
                                                    ToolTip="Digite o horário da entrevista na empresa" Width="45px"></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="empresa_MaskedEditExtender" runat="server" 
                                                    BehaviorID="empresa_MaskedEditExtender" ClearMaskOnLostFocus="False" 
                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                    Mask="99:99" PromptCharacter="_" TargetControlID="horhoraempresa">
                                                </ajaxToolkit:MaskedEditExtender>
                                                <span lang="pt-br"><b><span class="style22">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="horhoraempresa" ErrorMessage="Campo Obrigatório" 
                                                    SetFocusOnError="True" ValidationGroup="valentrevista"></asp:RequiredFieldValidator>
                                                </span></b></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style43">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style43">
                                                <asp:Label ID="lbldataClick" runat="server" Text="Data no Click:" 
                                                    EnableViewState="False" Font-Bold="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="datdataClick" runat="server" CausesValidation="True" 
                                                    ToolTip="Digite a data da entrevista no Click" 
                                                    ValidationGroup="InsereEntrevista" Width="65px"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" 
                                                    Format="dd/MM/yyyy" TargetControlID="datdataclick">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style43">
                                                <asp:Label ID="lblhoraclick" runat="server" Text="Hora no Click:" 
                                                    EnableViewState="False" Font-Bold="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="horhoraclick" runat="server" CausesValidation="True" 
                                                    ToolTip="Digite o horário da entrevista no Click" 
                                                    ValidationGroup="InsereEntrevista" Width="45px"></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="raclick_MaskedEditExtender" runat="server" 
                                                    BehaviorID="raclick_MaskedEditExtender" ClearMaskOnLostFocus="False" 
                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                    Mask="99:99" TargetControlID="horhoraclick">
                                                </ajaxToolkit:MaskedEditExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style43">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style43">
                                                <asp:Label ID="lblcaptadorent2" runat="server" 
                                                    Text="Responsável pelo agendamento:" EnableViewState="False" 
                                                    Font-Bold="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cbocaptador" runat="server" DataSourceID="Sqloperador" 
                                                    DataTextField="Nome" DataValueField="Nome">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style43">
                                                &nbsp;</td>
                                            <td>
                                                <span lang="pt-br"><b><span class="style22">
                                                <table class="style3">
                                                    <tr>
                                                        <td class="style10">
                                                            <asp:Label ID="Label44" runat="server" EnableViewState="False" 
                                                                Font-Bold="False" Text="Apenas para edição - Selecione a oferta desejada"></asp:Label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style8">
                                                            <asp:Panel ID="Panel14" runat="server" GroupingText="Ofertas" Height="150px" 
                                                                ScrollBars="Vertical" Width="589px">
                                                                <asp:CheckBoxList ID="Chkoferta0" runat="server" DataSourceID="Sqlsenac" 
                                                                    DataTextField="nomes" DataValueField="oferta" 
                                                                    Font-Bold="False">
                                                                </asp:CheckBoxList>
                                                                <asp:SqlDataSource ID="Sqlsenac" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                    SelectCommand="SELECT oferta + '- ' + nome AS nomes, oferta FROM tblSGA_Ofertas WHERE (area_operacional_rj = @codigo) AND (nome NOT LIKE '%OFICINA%') ORDER BY nome">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="codigo" SessionField="codigo" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                                </span></b></span></td>
                                        </tr>
                                        <tr>
                                            <td class="style43">
                                                <asp:Label ID="lblhoraclick0" runat="server" Text="Data da Captação:" 
                                                    EnableViewState="False" Font-Bold="False"></asp:Label>
                                            </td>
                                            <td>
                                                <span class="style22"><b>
                                                <asp:TextBox ID="datdatacaptacao" runat="server" CausesValidation="True" 
                                                    ToolTip="Digite a data da entrevista no Click" 
                                                    ValidationGroup="InsereEntrevista" Width="65px"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="captacao_CalendarExtender" 
                                                    runat="server" Format="dd/MM/yyyy" TargetControlID="datdatacaptacao">
                                                </ajaxToolkit:CalendarExtender>
                                                </b></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style43" valign="top">
                                                <span lang="pt-br"><span class="style22"><b>
                                                <asp:Label ID="lblstatusentrevista" runat="server" Text="Captador responsável:" 
                                                    EnableViewState="False" Font-Bold="False"></asp:Label>
                                                </b></span></span>
                                            </td>
                                            <td>
                                                <asp:CheckBoxList ID="chCaptadores" runat="server" 
                                                    DataSourceID="sqlCaptadores" DataTextField="nome" DataValueField="nome" 
                                                    ForeColor="Black" RepeatColumns="3" RepeatDirection="Horizontal" 
                                                    Font-Bold="False">
                                                </asp:CheckBoxList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style43" valign="top">
                                                <span lang="pt-br"><b><span class="style22">
                                                <asp:Label ID="lblhoraclick2" runat="server" Text="Status da entrevista:" 
                                                    EnableViewState="False" Font-Bold="False"></asp:Label>
                                                </span></b></span>
                                            </td>
                                            <td>
                                                <span lang="pt-br"><b><span class="style22">
                                                <asp:DropDownList ID="cboid_statusEntrevistaClick" runat="server" DataSourceID="Sqlstatusentrevista" 
                                                    DataTextField="statusEntrevista" DataValueField="id_statusEntrevista">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="Sqlstatusentrevista" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                    
                                                    SelectCommand="SELECT id_statusEntrevista, statusEntrevista FROM tblStatusEntrevista WHERE (id_statusEntrevista &gt; 10) AND (id_statusEntrevista &lt; 16) AND (id_statusEntrevista &lt;&gt; 13)" 
                                                    EnableViewState="False">
                                                </asp:SqlDataSource>
                                                </span></b></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style43" valign="top">
                                                <span lang="pt-br"><b><span class="style22">
                                                <asp:Label ID="lblcomentario" runat="server" Text="Comentário:" 
                                                    EnableViewState="False" Font-Bold="False"></asp:Label>
                                                </span></b></span>
                                            </td>
                                            <td>
                                                <span lang="pt-br"><b><span class="style22">
                                                <asp:TextBox ID="txtcomentario" runat="server" CausesValidation="True" 
                                                    Height="50px" TextMode="MultiLine" 
                                                    ToolTip="Digite o horário da entrevista no Click" 
                                                    ValidationGroup="InsereEntrevista" Width="250px"></asp:TextBox>
                                                </span></b></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style43" valign="top">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style43" valign="top">
                                                <span lang="pt-br"><b><span class="style22">
                                                <asp:ImageButton ID="btnInserirEntEmp" runat="server" ImageAlign="Baseline" 
                                                    ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" 
                                                    ToolTip="Adicionar agendamento" ValidationGroup="valentrevista" />
                                                &nbsp;<asp:ImageButton ID="btnatualizaEntrevistaEmp1" runat="server" 
                                                    ImageAlign="Baseline" 
                                                    ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                                    ToolTip="Atualizar agendamento" ValidationGroup="valentrevista" 
                                                    Visible="False" />
                                                &nbsp;<asp:ImageButton ID="btnCancelarEmp" runat="server" ImageAlign="Baseline" 
                                                    ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" 
                                                    ToolTip="Cancelar agendamento" Visible="False" />
                                                </span></b> </span>
                                            </td>
                                            <td>
                                                <span lang="pt-br"><b><span class="style22">
                                                <asp:Label ID="lblerro" runat="server"></asp:Label>
                                                </span></b></span>
                                            </td>
                                        </tr>
                                    </table>
                                    <span class="style22"><span lang="pt-br"><b>
                            
                                    </b></span>
                                    <asp:SqlDataSource ID="sqlDeletaCaptadores" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        DeleteCommand="DELETE FROM tblCaptadorEntrevista WHERE (id_entrevista_fk = @id_entrevista_fk)" 
                                        InsertCommand="INSERT INTO [tblCaptadorEntrevista] ([id_entrevista_fk]) VALUES (@id_entrevista_fk)" 
                                        SelectCommand="SELECT [id_entrevista_fk], [id_captador_entrevista] FROM [tblCaptadorEntrevista]" 
                                        
                                        UpdateCommand="UPDATE [tblCaptadorEntrevista] SET [id_entrevista_fk] = @id_entrevista_fk WHERE [id_captador_entrevista] = @id_captador_entrevista" 
                                        EnableViewState="False">
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista_fk" 
                                                PropertyName="SelectedValue" Type="Int32" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="id_entrevista_fk" Type="Int32" />
                                            <asp:Parameter Name="id_captador_entrevista" Type="Int32" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="id_entrevista_fk" Type="Int32" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    </span>
                           
                            &nbsp;</b></span><asp:SqlDataSource ID="sqlEntrevistaEmp" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                DeleteCommand="DELETE FROM tblEntrevista WHERE (id_entrevista = @id_entrevista)" 
                                InsertCommand="INSERT INTO tblEntrevista(dataEmpresa, horaEmpresa, captador, id_vaga_fk, dataClick, horaClick, dataCaptacao, id_statusEntrevista, cancelamento, comentario) VALUES (@dataEmpresa, @horaEmpresa, @captador, @id_vaga_fk, @dataclick, @horaclick, @dataCaptacao, @id_statusEntrevista, 0, @comentario)" 
                                SelectCommand="SELECT DISTINCT tblEntrevista.dataEmpresa, tblEntrevista.horaEmpresa, tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.id_statusEntrevista, tblEntrevista.captador, tblEntrevista.id_entrevista, tblEntrevista.id_vaga_fk, CASE WHEN tblVaga.ativada IS NULL THEN 'Em análise' WHEN tblVaga.ativada = 0 THEN 'Desativada' WHEN tblVaga.ativada = 1 THEN 'Ativada' END AS statusvaga, tblStatusEntrevista.statusEntrevista, tblEntrevista.dataCaptacao, tblProgramacaoEntrevista.codigo FROM tblEntrevista INNER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista INNER JOIN tblVaga ON tblEntrevista.id_vaga_fk = tblVaga.id_vaga INNER JOIN tblProgramacaoEntrevista ON tblEntrevista.id_entrevista = tblProgramacaoEntrevista.id_entrevista_fk WHERE (tblEntrevista.id_vaga_fk = @id_vaga_fk) AND (tblEntrevista.cancelamento = 0) AND (tblEntrevista.tipoEntrevista is null) ORDER BY tblEntrevista.id_entrevista DESC" 
                                
                                
                                UpdateCommand="UPDATE tblEntrevista SET dataEmpresa = @dataEmpresa, horaEmpresa = @horaEmpresa, captador = @captador, id_statusEntrevista = @id_statusEntrevista, dataClick = @dataclick, horaClick = @horaclick, comentario = @comentario, dataCaptacao = @datacaptacao WHERE (id_entrevista = @id_entrevista)" 
                                EnableViewState="False">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridVaga" Name="id_vaga_fk" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="id_entrevista" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="datdataempresa" dbtype="DateTime" 
                                        Name="dataEmpresa" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="horhoraempresa" Name="horaEmpresa" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cbocaptador" Name="captador" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="cboid_statusEntrevistaClick" 
                                        Name="id_statusEntrevista" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="datdataClick" dbtype="DateTime" 
                                        Name="dataclick" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="horhoraclick" Name="horaclick" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtcomentario" Name="comentario" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="datdatacaptacao" dbtype="DateTime" 
                                        Name="datacaptacao" PropertyName="Text" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="datdataempresa" DbType="DateTime" 
                                        Name="dataEmpresa" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="horhoraempresa" Name="horaEmpresa" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cbocaptador" Name="captador" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="GridVaga" Name="id_vaga_fk" 
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="datdataClick" DbType="DateTime" 
                                        Name="dataclick" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="horhoraclick" Name="horaclick" 
                                        PropertyName="Text" />
                                    <asp:ControlParameter ControlID="datdatacaptacao" DbType="DateTime" 
                                        Name="dataCaptacao" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="cboid_statusEntrevistaClick" 
                                        Name="id_statusEntrevista" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtcomentario" Name="comentario" 
                                        PropertyName="Text" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <b><span lang="pt-br"><span class="style22">
                            <asp:GridView ID="GridEntrevistaEmp0" runat="server" AllowPaging="True" 
                                AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                                CssClass="grid" DataKeyNames="id_entrevista,codigo" DataSourceID="sqlEntrevistaEmp" 
                                EnableViewState="False" Font-Bold="False" PageSize="5" Width="850px">
                                <PagerStyle CssClass="pagerstyle" />
                                <Columns>
                                    <asp:CommandField ButtonType="Image" HeaderText="Editar entrevista" 
                                        SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                        ShowSelectButton="True">
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:CommandField>
                                    <asp:TemplateField HeaderText="Cancelar entrevista" ShowHeader="False">
                                        <ItemTemplate>
                                            <span lang="pt-br"><b><span class="style22">
                                            <asp:ImageButton ID="ImageButton8" runat="server" 
                                                CommandArgument='<%# Eval("id_entrevista") %>' 
                                                ImageUrl="~/clickoportunidades/icones/Standard/001_05.gif" 
                                                onclick="ImageButton8_Click" ToolTip="Cancelar entrevista" />
                                            </span></b></span>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                        InsertVisible="False" ReadOnly="True" SortExpression="id_entrevista" />
                                    <asp:BoundField DataField="captador" HeaderText="Responsável" 
                                        SortExpression="captador" />
                                    <asp:TemplateField HeaderText="Programação">
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
                                            <asp:SqlDataSource ID="Sqlprogramacaoent" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                SelectCommand="SELECT tblProgramacaoEntrevista.id_entrevista_fk, tblSGA_Ofertas.nome FROM tblProgramacaoEntrevista INNER JOIN tblSGA_Ofertas ON tblProgramacaoEntrevista.id_oferta_fk = tblSGA_Ofertas.oferta WHERE (tblProgramacaoEntrevista.id_entrevista_fk = @id_entrevista_fk)">
                                                <SelectParameters>
                                                    <asp:Parameter Name="id_entrevista_fk" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            </span></b></span>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="200px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Data na Empresa" SortExpression="dataEmpresa">
                                        <EditItemTemplate>
                                            &nbsp;
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            &nbsp;
                                        </FooterTemplate>
                                        <HeaderTemplate>
                                            Entrevista na empresa
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <span lang="pt-br"><b><span class="style22">
                                            <asp:Label ID="Label40" runat="server" Font-Bold="False" Font-Size="10px" 
                                                Text='<%# Bind("dataEmpresa", "{0:D}") %>'></asp:Label>
                                            </span></b></span>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="horaEmpresa" HeaderText="Hora na Empresa" 
                                        SortExpression="horaEmpresa" />
                                    <asp:BoundField DataField="dataClick" DataFormatString="{0:d}" 
                                        HeaderText="Data no Click" SortExpression="dataClick" />
                                    <asp:BoundField DataField="horaClick" HeaderText="Hora no Click" 
                                        SortExpression="horaClick" />
                                    <asp:BoundField DataField="statusEntrevista" HeaderText="Status da Entrevista" 
                                        SortExpression="statusEntrevista" />
                                    <asp:BoundField DataField="statusvaga" HeaderText="Status da Vaga" 
                                        SortExpression="statusvaga" />
                                    <asp:TemplateField HeaderText="Captadores">
                                        <ItemTemplate>
                                            <asp:GridView ID="gridCaptadores" runat="server" AllowPaging="True" 
                                                AutoGenerateColumns="False" DataKeyNames="id_captador_entrevista" 
                                                DataSourceID="sqlCaptadores" Font-Bold="False" GridLines="None" 
                                                ShowHeader="False" Width="152px">
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
                                        </ItemTemplate>
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
                                <AlternatingRowStyle CssClass="altrowstyle" />
                                <SelectedRowStyle BackColor="#D1DDF1" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="sqlEntrevistacancela" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                
                                UpdateCommand="UPDATE tblEntrevista SET cancelamento = 1 WHERE (id_entrevista = @id_entrevista)" 
                                EnableViewState="False">
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista" 
                                        PropertyName="SelectedValue" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sqlprogramacaoEnt" runat="server" 
                                CacheExpirationPolicy="Sliding" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                DeleteCommand="DELETE FROM tblProgramacaoEntrevista WHERE (id_entrevista_fk = @id_entrevista_fk)" 
                                InsertCommand="INSERT INTO tblProgramacaoEntrevista(id_entrevista_fk, id_oferta_fk, codigo) VALUES (@id_entrevista_fk, @id_oferta_fk, @codigo)" 
                                SelectCommand="SELECT tblProgramacaoEntrevista.id_oferta_fk, tblSGA_Ofertas.nome, tblSgaUnidade.RAZAO_SOCIAL, tblSGA_AreasConhecimento.area FROM tblProgramacaoEntrevista INNER JOIN tblSGA_Ofertas ON tblProgramacaoEntrevista.id_oferta_fk = tblSGA_Ofertas.oferta INNER JOIN tblEntrevista ON tblProgramacaoEntrevista.id_entrevista_fk = tblEntrevista.id_entrevista INNER JOIN tblSgaUnidade ON tblEntrevista.id_local_fk = tblSgaUnidade.id_unidade INNER JOIN tblSGA_AreasConhecimento ON tblSGA_Ofertas.area_operacional_rj = tblSGA_AreasConhecimento.codigo WHERE (tblProgramacaoEntrevista.id_entrevista_fk = @id_entrevista_fk)" 
                                
                                UpdateCommand="UPDATE tblEntrevista SET cancelamento = 1 WHERE (id_entrevista = @id_entrevista)" 
                                EnableViewState="False">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista_fk" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista_fk" 
                                        PropertyName="SelectedValue" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="GridEntrevistaEmp0" Name="id_entrevista" 
                                        PropertyName="SelectedValue" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="id_entrevista_fk" />
                                    <asp:Parameter Name="id_oferta_fk" />
                                    <asp:Parameter Name="codigo" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sqlcaptadorencaminhar" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome 
	FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario 
	ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario 
	WHERE (admPortalPerfilUsuario.IdPerfil = 5)
	order by nome " EnableViewState="False"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="sqlIncluirCaptadores" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                DeleteCommand="DELETE FROM [tblCaptadorEntrevista] WHERE [id_captador_entrevista] = @id_captador_entrevista" 
                                InsertCommand="INSERT INTO [tblCaptadorEntrevista] ([id_entrevista_fk], [captador]) VALUES (@id_entrevista_fk, @captador)" 
                                SelectCommand="SELECT [id_entrevista_fk], [captador], [id_captador_entrevista] FROM [tblCaptadorEntrevista]" 
                                
                                UpdateCommand="UPDATE [tblCaptadorEntrevista] SET [id_entrevista_fk] = @id_entrevista_fk, [captador] = @captador WHERE [id_captador_entrevista] = @id_captador_entrevista" 
                                EnableViewState="False">
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
                            </span></span></b>
                        
                        </asp:View>
                    </asp:MultiView>
                </asp:Panel>
                </span></b></span>
       
        
                    
                                    <asp:SqlDataSource ID="SqlBuscaVagas" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        
                        
                        
                        
                        
                        
            
            
            
            
            SelectCommand="SELECT tblCBO.cargo, tblVaga.id_vaga, CAST(tblVaga.id_vaga AS varchar) + ' ' + tblCBO.cargo AS idevaga, CASE WHEN tblVaga.ativada IS NULL THEN 'Em análise' WHEN tblVaga.ativada = 0 THEN 'Desativada' WHEN tblVaga.ativada = 1 THEN 'Ativada' END AS statusvaga, tblVaga.QuantVaga, tblEmpresa.nome_fantasia, tblEmpresa.id_empresa, tblVaga.ativada, tblEmpresa.cnpj, tblVaga.ultima_atualizacao FROM tblVaga INNER JOIN tblCBO ON tblVaga.id_cargo_fk = tblCBO.id_cargo INNER JOIN tblEmpresa ON tblVaga.id_empresa_fk = tblEmpresa.id_empresa WHERE (tblVaga.ultima_atualizacao BETWEEN CONVERT (smalldatetime, @dtInicio + ' 00:00', 103) AND CONVERT (smalldatetime, @dtfim + ' 23:59', 103)) AND (tblCBO.cargo LIKE @cargo + '%') AND (tblVaga.ativada = CASE WHEN @status = 2 THEN NULL ELSE @status END) AND (tblEmpresa.cnpj LIKE @cnpj + '%') AND (tblVaga.id_empresa_fk = (CASE WHEN @id_empresa = 0 THEN tblVaga.id_empresa_fk ELSE @id_empresa END)) ORDER BY tblVaga.id_vaga DESC" 
            EnableViewState="False">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtDtInicial" Name="dtInicio" 
                                                PropertyName="Text" DefaultValue="1900-01-01" />
                                            <asp:ControlParameter ControlID="txtDtFinal" Name="dtfim" PropertyName="Text" 
                                                DefaultValue="2070-01-01" />
                                            <asp:ControlParameter ControlID="txtCargo" DefaultValue="%" Name="cargo" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="cboStatusBusca" DefaultValue="" Name="status" 
                                                PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="txtCNPJ" DefaultValue="%" Name="cnpj" 
                                                PropertyName="Text" />
                                            <asp:ControlParameter ControlID="cboempresabusca1" DefaultValue="%" 
                                                Name="id_empresa" PropertyName="SelectedValue" />
                                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                        
                        
                        
                        
            
            SelectCommand="SELECT id_empresa, nome_fantasia, razao_social FROM tblEmpresa WHERE (nome_fantasia IS NOT NULL) AND (razao_social IS NOT NULL) AND (nome_fantasia=@nome_fantasia) AND (REPLACE(REPLACE(REPLACE(cnpj, '.', ''), '/', ''), '-', '') LIKE @CNPJ + '%') ORDER BY nome_fantasia" 
            EnableCaching="False" EnableViewState="False">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cboempresabusca1" DefaultValue="%" 
                                Name="nome_fantasia" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="txtCNPJ" DefaultValue="%" Name="CNPJ" 
                                PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                      <a name="Passo5"></a>
                    
                                    </span>
              
        </span>
                                            
    </div>
    </form>
</body>
</html>
