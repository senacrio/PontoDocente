<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admConvocacaoSemVaga.aspx.vb" Inherits="admVagasEdit" Theme="AdmClick" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <script src="js/printDiv.js" type="text/javascript"></script>
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
        {            width: 269px;
        }
        
        .style30
        {
            font-size: small;
        }
                                
        .style39
        {
            width: 100%;
        }
                                
        .style45
        {
            width: 313px;
        }
                                            
        .style46
        {
            width: 152px;
            height: 25px;
        }
        .style47
        {
            width: 313px;
            height: 25px;
        }
                                            
        .style3
        {
            width: 87%;
        }
        .style10
        {
            background-color: #CCCCCC;
        }
        .style8
        {
            width: 388px;
        }
                
        .style50
        {
            width: 28px;
        }
        .style51
        {
            width: 94%;
        }
                
        .style35
        {
            width: 29%;
            font-size:x-small; 
        }
        
        .style41
        {
            width: 34px;
        }
        .style40
        {
        }
        .style26
        {
            width: 138px;
        }
        
        .style42
        {
        }
        
        .style34
        {
            font-size: small;
        }
        
        .style52
        {
        }
        
        .style53
        {
        }
        
        .style54
        {
            width: 220px;
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
                        <asp:Label ID="lblTitulo" runat="server" Text="Captação de candidatos sem vaga definida" 
                            style="font-size: medium; font-weight: 700"></asp:Label>
                            <br />
                            <br />
                                    <asp:ScriptManager ID="ScriptManager1" runat="server" 
                                        EnableScriptGlobalization="True">
                                    </asp:ScriptManager>
                </span>
    
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10px" 
                            ForeColor="#FF6600" 
                            Text="*Atenção: Qualquer operação efetuada nessa área é de responsabilidade única do Click Oportunidades, essas operações são registradas." 
                            Width="650px"></asp:Label>
                        &nbsp;
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; ">
    
        <span lang="pt-br">
 
  

                        <asp:Label ID="Label2" runat="server" Text="Usuário/Responsável:"></asp:Label>

                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlUsuario" 
                            DataTextField="Nome" DataValueField="IdUsuario" Font-Size="8pt" 
                            style="margin-top: 11px; margin-bottom: 0px">
                        </asp:DropDownList>
                    
                                    </span>
              
                    </td>
                </tr>
                </table>
           
  

                        <asp:SqlDataSource ID="SqlUsuario" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT [IdUsuario], [Nome] FROM [admPortalUsuario]
where nome = @nome">
                            <SelectParameters>
                                <asp:SessionParameter Name="nome" SessionField="c_nome" />
                            </SelectParameters>
                        </asp:SqlDataSource>
           
  
                        <asp:Panel ID="Panel10" runat="server" BorderWidth="2px" Height="25px" 
                            Width="401px" BackColor="White" BorderColor="Black">
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
                                         <td>
                                        <span lang="pt-br">&nbsp;<a href="#Passo8">Passo 8</a></span></td>
                                         <td>
                                        <span lang="pt-br">&nbsp;<a href="#Passo9">Passo 9</a></span></td>
                                </tr>
                            </table>
                        </asp:Panel>

                        <ajaxToolkit:AlwaysVisibleControlExtender ID="Panel10_AlwaysVisibleControlExtender" 
                            runat="server" Enabled="True" HorizontalOffset="10" HorizontalSide="Right" 
                            TargetControlID="Panel10" VerticalOffset="10">
                        </ajaxToolkit:AlwaysVisibleControlExtender>
           <a name="Passo1"></a>
  
                        <asp:Panel ID="Panel12" runat="server" BackColor="#009900" 
            Height="20px">
                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                <span lang="pt-br">&nbsp;&nbsp; 1° Passo - ESCOLHER PROGRAMAÇÃO DE INTERESSE</span></div>
                        </asp:Panel>
                     
                                           
                                                    <asp:MultiView ID="MultiView4" runat="server" ActiveViewIndex="0">
                                                        <asp:View ID="ViewInteresse" runat="server">
                                                            <span lang="pt-br"><b>
                                                            <table cellpadding="0" cellspacing="0" class="style3" 
                                                                style="font-weight: normal; font-family: verdana; font-size: 11px">
                                                                <tr>
                                                                    <td class="style50">
                                                                        &nbsp;</td>
                                                                    <td class="style51">
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style50">
                                                                        <span lang="pt-br">
                                                                        <asp:Label ID="lblfamilia1" runat="server" Text="Unidade:"></asp:Label>
                                                                        </span>
                                                                    </td>
                                                                    <td class="style51">
                                                                        <asp:DropDownList ID="cboid_local_fk" runat="server" AutoPostBack="True" 
                                                                            DataSourceID="Sqlunidade" DataTextField="RAZAO_SOCIAL" 
                                                                            DataValueField="id_unidade">
                                                                        </asp:DropDownList>
                                                                        <asp:SqlDataSource ID="Sqlunidade" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                            
                                                                            SelectCommand="SELECT DISTINCT tblSgaUnidade.RAZAO_SOCIAL, tblSgaUnidade.id_unidade FROM tblSGA_Ofertas INNER JOIN tblSGA_AreasConhecimento ON tblSGA_Ofertas.area_operacional_rj = tblSGA_AreasConhecimento.codigo RIGHT OUTER JOIN tblSgaUnidade ON tblSGA_AreasConhecimento.uo = tblSgaUnidade.id_unidade ORDER BY tblSgaUnidade.RAZAO_SOCIAL"></asp:SqlDataSource>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style50">
                                                                        <asp:Label ID="lblfamilia" runat="server" Text="Área:"></asp:Label>
                                                                    </td>
                                                                    <td class="style51">
                                                                        <asp:DropDownList ID="cbocodigo" runat="server" DataSourceID="SqlArea" 
                                                                            DataTextField="area" DataValueField="codigo">
                                                                        </asp:DropDownList>
                                                                        <asp:SqlDataSource ID="SqlArea" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                            
                                                                            
                                                                            
                                                                            SelectCommand="SELECT replace(codigo,' ','') as codigo, area FROM tblSGA_AreasConhecimento WHERE (uo = @uo)">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="cboid_local_fk" DefaultValue="" Name="uo" 
                                                                                    PropertyName="SelectedValue" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                        <span lang="pt-br">
                                                                        <asp:SqlDataSource ID="SqlCursoSenac" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                            
                                                                            
                                                                            
                                                                            SelectCommand="SELECT oferta + '- ' + nome AS nomes, oferta FROM tblSGA_Ofertas WHERE (area_operacional_rj = @codigo) AND (nome NOT LIKE '%OFICINA%') AND (nome LIKE + @nome + '%') ORDER BY nome">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="busca" DefaultValue="%" Name="nome" 
                                                                                    PropertyName="Text" />
                                                                                <asp:ControlParameter ControlID="cbocodigo" DefaultValue="" Name="codigo" 
                                                                                    PropertyName="SelectedValue" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style50">
                                                                        <span lang="pt-br">
                                                                        <asp:Label ID="lblbusca" runat="server" Text="Busca:"></asp:Label>
                                                                        </span>
                                                                    </td>
                                                                    <td class="style51">
                                                                        <asp:TextBox ID="busca" runat="server" Width="180px"></asp:TextBox>
                                                                        <span lang="pt-br">
                                                                        <asp:ImageButton ID="ImageButton9" runat="server" ImageAlign="Middle" 
                                                                            ImageUrl="~/Icones/pesquisar.gif" />
                                                                        <b>&nbsp;<asp:Label ID="lblfamilia2" runat="server" 
                                                                            Text="Clique aqui para buscar as programações dos cursos Senac"></asp:Label>
                                                                        </b></span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style4" colspan="2">
                                                                      
                                                                                <span lang="pt-br"><b>
                                                                                <asp:Label ID="lblSelecionada" runat="server"></asp:Label>
                                                                                </b></span>
                                                                                <br />
                                                                                <br />
                                                                                <table class="style3">
                                                                                    <tr>
                                                                                        <td class="style10">
                                                                                            <asp:Label ID="Label7" runat="server" Text="Selecione a oferta desejada"></asp:Label>
                                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="style8">
                                                                                            <asp:Panel ID="Panel2" runat="server" GroupingText="Ofertas - área de inserção" Height="150px" 
                                                                                                ScrollBars="Vertical" Width="727px">
                                                                                                <asp:CheckBoxList ID="Chkoferta" runat="server" DataSourceID="SqlCursoSenac" 
                                                                                                    DataTextField="NOMEs" DataValueField="OFERTA" Font-Bold="False">
                                                                                                </asp:CheckBoxList>
                                                                                            </asp:Panel>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="style10">
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                </table>
                                                                           
                                                                        <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
                                                                        <span lang="pt-br"><b><span class="style22">
                                                                        <br />
                                                                        </span></b></span>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:SqlDataSource ID="SqlrelacionaInserir" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                
                                                                InsertCommand="INSERT INTO tblProgramacaoEntrevista(id_entrevista_fk, id_oferta_fk, codigo) VALUES (@id_entrevista_fk, @id_oferta_fk, @codigo)">
                                                                <InsertParameters>
                                                                    <asp:Parameter Name="id_oferta_fk" />
                                                                    <asp:Parameter Name="id_entrevista_fk" />
                                                                    <asp:Parameter Name="codigo" />
                                                                </InsertParameters>
                                                            </asp:SqlDataSource>
                                                            </b></span>
                                                        </asp:View>
                                                    </asp:MultiView>
                                               
       
        <a name="Passo2"></a>
                                <asp:Panel ID="Panel7" runat="server" 
            BackColor="#009900" Height="20px">
                                    <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                        <span lang="pt-br">&nbsp;&nbsp; 2° Passo - AGENDAR ORIENTAÇÃO SEM VAGA - No Click 
                                        Oportunidades ou na Unidade Senac</span></div>
                                </asp:Panel>
                                <b>
                                <span class="style22">
                                
                                        <asp:Panel ID="Panel11" runat="server">
                                            <asp:MultiView ID="MultiView3" runat="server" ActiveViewIndex="0">
                        
                            <asp:View ID="ViewEntrevistaEmpresa" runat="server">
                                <span class="style23" lang="pt-br"><span class="style30">
</span>
                                <asp:Label ID="Label44" runat="server" 
                                    Text="Check list para agendamento  de orientação na Unidade: "></asp:Label>
                                <span class="style22"> </span>
                                </span>
                                <span class="style22"><b>
                                <br />
                                <br />
                                <asp:Label ID="Label45" runat="server" 
                                    
                                    Text="Fazer contato com pessoa responsável na Unidade para agendar orientação (se cancelar, é necessário desmarcar com a Unidade )" 
                                    Font-Size="11px"></asp:Label>
                                <br />
                                
                                        <br />
                                        <asp:Label ID="Label46" runat="server" Text="Agendar ambiente de aprendizagem:"></asp:Label>
                                        <span class="style22">
                                        <br />
                                        <asp:Label ID="lblMsg" runat="server" style="color: #FF0000; font-weight: 700"></asp:Label>
                                        </span>
                                        <br />
                                        <table class="style1" height="200" 
                                            
                                    style="font-family: Verdana; font-size: 12px; color: #000000; font-weight: normal">
                                            <tr>
                                                <td class="style53">
                                                    &nbsp;</td>
                                                <td class="style45">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style53" 
                                                    style="font-family: verdana; font-size: 11px; color: #000000; font-weight: normal;">
                                                    <asp:Label ID="lbldataClick" runat="server" Text="Data:"></asp:Label>
                                                </td>
                                                <td class="style45">
                                                    <asp:TextBox ID="datdataClick" runat="server" CausesValidation="True" 
                                                        ToolTip="Digite a data da entrevista no Click" 
                                                        ValidationGroup="InsereEntrevista" Width="65px"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" 
                                                        Format="dd/MM/yyyy" TargetControlID="datdataclick">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style53" 
                                                    style="font-family: verdana; font-size: 11px; color: #000000; font-weight: normal;">
                                                    <asp:Label ID="lblhoraclick" runat="server" Text="Hora:"></asp:Label>
                                                </td>
                                                <td class="style45">
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
                                                <td class="style53" 
                                                    style="font-family: verdana; font-size: 11px; color: #000000; font-weight: normal;">
                                                    <asp:Label ID="lblcaptadorent2" runat="server" 
                                                        Text="Responsável pelo agendamento:"></asp:Label>
                                                </td>
                                                <td class="style45">
                                                    <asp:DropDownList ID="cbocaptador2" runat="server" DataSourceID="Sqloperador" 
                                                        DataTextField="Nome" DataValueField="Nome">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style53" 
                                                    style="font-family: verdana; font-size: 11px; color: #000000; font-weight: normal;">
                                                    &nbsp;</td>
                                                <td class="style45">
                                                    <span lang="pt-br"><b>
                                                    <asp:Panel ID="Panel14" runat="server" GroupingText="Ofertas - área de edição" Height="150px" 
                                                        ScrollBars="Vertical" Width="569px">
                                                        <asp:CheckBoxList ID="Chkoferta0" runat="server" DataSourceID="Sqlsenac" 
                                                            DataTextField="NOMEs" DataValueField="OFERTA" Font-Bold="False" 
                                                            Font-Size="11px">
                                                        </asp:CheckBoxList>
                                                        <span lang="pt-br"><b><span class="style22">
                                                        <asp:SqlDataSource ID="Sqlsenac" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                            SelectCommand="SELECT oferta + '- ' + nome AS nomes, oferta FROM tblSGA_Ofertas WHERE (area_operacional_rj = @codigo) AND (nome NOT LIKE '%OFICINA%') ORDER BY nome">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="codigo" SessionField="codigo" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        </span></b></span>
                                                    </asp:Panel>
                                                    </b></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style53" 
                                                    style="font-family: verdana; font-size: 11px; color: #000000; font-weight: normal;">
                                                    <asp:Label ID="Label47" runat="server" Text="Quantidade mínima de candidatos:"></asp:Label>
                                                </td>
                                                <td class="style45">
                                                    <asp:TextBox ID="txtquantcandidatos" runat="server" Width="50px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style53" 
                                                    style="font-family: verdana; font-size: 11px; color: #000000; font-weight: normal;">
                                                    <asp:Label ID="lblhoraclick0" runat="server" Text="Data da Captação:"></asp:Label>
                                                </td>
                                                <td class="style45">
                                                    <span class="style22"><b>
                                                    <asp:TextBox ID="datdatacaptacao" runat="server" CausesValidation="True" 
                                                        ToolTip="Digite a data da entrevista no Click" 
                                                        ValidationGroup="InsereEntrevista" Width="65px"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="datacaptacao_CalendarExtender" runat="server" 
                                                        Format="dd/MM/yyyy" TargetControlID="datdatacaptacao">
                                                    </ajaxToolkit:CalendarExtender>
                                                    </b></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style53" valign="top" 
                                                    style="font-family: verdana; font-size: 11px; color: #000000; font-weight: normal;">
                                                    <span lang="pt-br"><span class="style22"><b>
                                                    <asp:Label ID="lblstatusentrevista" runat="server" Text="Captador responsável:" 
                                                        Font-Bold="False" Font-Size="11px"></asp:Label>
                                                    </b></span></span>
                                                </td>
                                                <td>
                                                    <asp:CheckBoxList ID="chkCaptadores" runat="server" 
                                                        DataSourceID="sqlCaptadores" DataTextField="nome" DataValueField="nome" 
                                                        ForeColor="Black" RepeatColumns="3" RepeatDirection="Horizontal" 
                                                        Font-Bold="False">
                                                    </asp:CheckBoxList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style46" valign="top" 
                                                    style="font-family: verdana; font-size: 11px; color: #000000; font-weight: normal;">
                                                    <span lang="pt-br"><b><span class="style22">
                                                    <asp:Label ID="lblhoraclick2" runat="server" Text="Status da entrevista:" 
                                                        Font-Bold="False" Font-Size="11px"></asp:Label>
                                                    </span></b></span></td>
                                                <td class="style47">
                                                    <span lang="pt-br">
                                                    <b><span class="style22">
                                                    <asp:DropDownList ID="cboid_statusEntrevistaClick" runat="server" 
                                                        DataSourceID="Sqlstatusentrevista" DataTextField="statusEntrevista" 
                                                        DataValueField="id_statusEntrevista">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="Sqlstatusentrevista" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        
                                                        SelectCommand="SELECT id_statusEntrevista, statusEntrevista FROM tblStatusEntrevista WHERE (id_statusEntrevista &gt; 10) AND (id_statusEntrevista &lt; 16) AND (id_statusEntrevista &lt;&gt; 13)">
                                                    </asp:SqlDataSource>
                                                    </span></b>
                                                    </span></td>
                                            </tr>
                                            <tr>
                                                <td class="style53" valign="top">
                                                    &nbsp;</td>
                                                <td class="style45">
                                                    <span lang="pt-br">
                                                    <b><span class="style22">
                                                    <asp:Label ID="lblerro" runat="server" ForeColor="#0066CC" 
                                                        style="color: #FF0000; font-weight: 700"></asp:Label>
                                                    </span></b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style53" valign="top" colspan="2">
                                                    <span lang="pt-br"><b><span class="style22">
                                                    <asp:ImageButton ID="btnInserirEntEmp" runat="server" ImageAlign="Middle" 
                                                        ImageUrl="~/clickoportunidades/icones/Standard/001_01.gif" 
                                                        ValidationGroup="AlteraEntrevista" />
                                                    &nbsp;<asp:Label ID="lblsalvaEnt" runat="server" Font-Bold="False" 
                                                        ForeColor="#0066CC" style="color: #0066CC; font-weight: none">Adicionar entrevista</asp:Label>
                                                    <br />
                                                    <asp:ImageButton ID="btnatualizaEntrevistaEmp1" runat="server" 
                                                        ImageAlign="Middle" ImageUrl="~/clickoportunidades/icones/Standard/001_06.gif" 
                                                        ToolTip="Inserir novo agendamento na empresa" 
                                                        ValidationGroup="AlteraEntrevista" Visible="False" />
                                                    &nbsp;<asp:Label ID="lblalteraEnt" runat="server" Font-Bold="False" 
                                                        ForeColor="#0066CC" style="color: #0066CC; font-weight: none">Atualizar entrevista</asp:Label>
                                                    <br />
                                                    <asp:ImageButton ID="btnCancelarEmp" runat="server" ImageAlign="Middle" 
                                                        ImageUrl="~/clickoportunidades/icones/Standard/001_02.gif" Visible="False" />
                                                    &nbsp;<asp:Label ID="lblcancelaEnt" runat="server" Font-Bold="False" 
                                                        ForeColor="#0066CC" style="color: #0066CC; font-weight: none">Cancelar entrevista</asp:Label>
                                                    </span></b></span>
                                                </td>
                                            </tr>
                                        </table>
                                        <span lang="pt-br">
                                        <span class="style22"><asp:SqlDataSource ID="sqlEntrevistaRelac" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                            DeleteCommand="DELETE FROM tblEntrevista WHERE (id_entrevista = @id_entrevista)" 
                                            InsertCommand="INSERT INTO tblEntrevista(captador, dataClick, horaClick, dataCaptacao, id_statusEntrevista, quantcandidatos, cancelamento, id_local_fk, tipoEntrevista) VALUES (@captador, @dataclick, @horaclick, @dataCaptacao, @id_statusEntrevista, @quantcandidatos, 0, @id_local_fk, 'Sem vaga')" 
                                            SelectCommand="SELECT DISTINCT tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.id_entrevista, tblStatusEntrevista.statusEntrevista, tblEntrevista.quantcandidatos, tblEntrevista.dataCaptacao, tblCaptadorEntrevista.captador, tblEntrevista.id_local_fk, tblProgramacaoEntrevista.codigo, tblSgaUnidade.RAZAO_SOCIAL FROM tblEntrevista LEFT OUTER JOIN tblSgaUnidade ON tblEntrevista.id_local_fk = tblSgaUnidade.id_unidade LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista LEFT OUTER JOIN tblCaptadorEntrevista ON tblEntrevista.id_entrevista = tblCaptadorEntrevista.id_entrevista_fk LEFT OUTER JOIN tblProgramacaoEntrevista ON tblEntrevista.id_entrevista = tblProgramacaoEntrevista.id_entrevista_fk WHERE (tblEntrevista.cancelamento = 0) AND (tblEntrevista.tipoEntrevista IS NOT NULL) ORDER BY tblEntrevista.id_entrevista DESC" 
                                           
                                    
                                    UpdateCommand="UPDATE tblEntrevista SET cancelamento = 1 WHERE (id_entrevista = @id_entrevista)">
                                            <DeleteParameters>
                                                <asp:Parameter Name="id_entrevista" />
                                                <asp:Parameter Name="id_entrevista" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:ControlParameter ControlID="GridEntrevistaRelac" Name="id_entrevista" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="GridEntrevistaRelac" Name="id_entrevista" 
                                                    PropertyName="SelectedValue" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="cbocaptador2" Name="captador" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="datdataClick" DbType="DateTime" 
                                                    Name="dataclick" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="horhoraclick" Name="horaclick" 
                                                    PropertyName="Text" />
                                                <asp:ControlParameter ControlID="datdatacaptacao" DbType="DateTime" 
                                                    Name="dataCaptacao" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="cboid_statusEntrevistaClick" 
                                                    Name="id_statusEntrevista" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="txtquantcandidatos" Name="quantcandidatos" 
                                                    PropertyName="Text" />
                                                <asp:ControlParameter ControlID="cboid_local_fk" Name="id_local_fk" 
                                                    PropertyName="SelectedValue" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                      <a name="Passo3"></a>
                                        <asp:SqlDataSource ID="Sqlcaptadores" runat="server" 
                                    CacheExpirationPolicy="Sliding" 
                                    ConnectionString="<%$ ConnectionStrings:ServidorBD %>" EnableCaching="True" 
                                    EnableViewState="False" 
                                    SelectCommand="SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario WHERE (admPortalPerfilUsuario.IdPerfil = 5) AND (admPortalUsuario.Ativo = 'true')  ORDER BY nome">
                                </asp:SqlDataSource>
                                        <asp:Panel ID="Panel13" runat="server" 
                                            BackColor="#009900" Height="20px">
                                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                                <span lang="pt-br"> 3° Passo - ESCOLHER CAPTAÇÃO SEM VAGA</span></div>
                                        </asp:Panel>
                                        <b>
                                        <asp:GridView ID="GridEntrevistaRelac" runat="server" AllowPaging="True" 
                                            AlternatingRowStyle-CssClass="altrowstyle" AutoGenerateColumns="False" 
                                            CssClass="grid" DataKeyNames="id_entrevista,codigo" 
                                            DataSourceID="sqlEntrevistaRelac" Font-Bold="False" PageSize="5" 
                                    Width="850px" Font-Size="11px">
                                            <PagerStyle CssClass="pagerstyle" />
                                            <Columns>
                                                <asp:CommandField ButtonType="Image" HeaderText="Selecione a captação" 
                                                    SelectImageUrl="~/clickoportunidades/icones/Standard/001_60.gif" 
                                                    ShowSelectButton="True">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:CommandField>
                                                <asp:BoundField DataField="id_entrevista" HeaderText="Código da entrevista" 
                                                    InsertVisible="False" ReadOnly="True" SortExpression="id_entrevista">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="captador" HeaderText="Encaminhado para:" 
                                                    SortExpression="captador">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Programação">
                                                    <ItemTemplate>
                                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                                            AutoGenerateColumns="False" BackColor="White" BorderStyle="None" 
                                                            DataSourceID="Sqlprogramacaoent" Font-Size="8px" ForeColor="White" 
                                                            GridLines="None" PageSize="3" ShowHeader="False">
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
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Data da captação sem vaga" 
                                                    SortExpression="dataCaptacao">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" 
                                                            Text='<%# Bind("dataCaptacao", "{0:D}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dataCaptacao") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Data e hora da orientação no Click/Unidade" 
                                                    SortExpression="dataClick">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("dataClick", "{0:D}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dataClick") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="RAZAO_SOCIAL" 
                                                    HeaderText="Local da orientação sem vaga" SortExpression="RAZAO_SOCIAL">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="quantcandidatos" 
                                                    HeaderText="Qt. mín. de candidatos a serem orientados" 
                                                    SortExpression="quantcandidatos">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                &nbsp; <span lang="pt-br" 
                                                    style="font-family: Verdana; font-size: 11px; font-weight: bold; color: #FF6600">
                                                Não existe registro no momento.</span>
                                            </EmptyDataTemplate>
                                            <AlternatingRowStyle CssClass="altrowstyle" />
                                            <SelectedRowStyle BackColor="#D1DDF1" />
                                        </asp:GridView>
                                        </b>
                                        <asp:SqlDataSource ID="sqlcaptadorencaminhar" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" SelectCommand="SELECT admPortalUsuario.Matricula, admPortalUsuario.Nome 
	FROM admPortalUsuario INNER JOIN admPortalPerfilUsuario 
	ON admPortalUsuario.IdUsuario = admPortalPerfilUsuario.IdUsuario 
	WHERE (admPortalPerfilUsuario.IdPerfil = 5)
	order by nome "></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="sqlIncluirCaptadores" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                            DeleteCommand="DELETE FROM [tblCaptadorEntrevista] WHERE [id_captador_entrevista] = @id_captador_entrevista" 
                                            InsertCommand="INSERT INTO [tblCaptadorEntrevista] ([id_entrevista_fk], [captador]) VALUES (@id_entrevista_fk, @captador)" 
                                            SelectCommand="SELECT [id_entrevista_fk], [captador], [id_captador_entrevista] FROM [tblCaptadorEntrevista]" 
                                            UpdateCommand="UPDATE [tblCaptadorEntrevista] SET [id_entrevista_fk] = @id_entrevista_fk, [captador] = @captador WHERE [id_captador_entrevista] = @id_captador_entrevista">
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
                                        <asp:Label ID="Label48" runat="server" 
                                            Text='<%# Bind("dataClick", "{0:d}") %>'></asp:Label>
                                        <asp:SqlDataSource ID="sqlEntrevistaEmp" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                            DeleteCommand="DELETE FROM tblEntrevista WHERE (id_entrevista = @id_entrevista)" 
                                            InsertCommand="INSERT INTO tblEntrevista(dataEmpresa, horaEmpresa, captador, id_vaga_fk, dataClick, horaClick, dataCaptacao, id_statusEntrevista, cancelamento, comentario) VALUES (@dataEmpresa, @horaEmpresa, @captador, @id_vaga_fk, @dataclick, @horaclick, @dataCaptacao, @id_statusEntrevista, 0, @comentario)" 
                                            
                                            
                                            UpdateCommand="UPDATE tblEntrevista SET captador = @captador, id_statusEntrevista = @id_statusEntrevista, dataClick = @dataClick, horaClick = @horaclick, dataCaptacao = @datacaptacao, quantcandidatos = @quantcandidatos WHERE (id_entrevista = @id_entrevista)">
                                            <DeleteParameters>
                                                <asp:Parameter Name="id_entrevista" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:ControlParameter ControlID="cbocaptador2" Name="captador" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="GridEntrevistaRelac" Name="id_entrevista" 
                                                    PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="cboid_statusEntrevistaClick" 
                                                    Name="id_statusEntrevista" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="datdataClick" Name="dataClick" DbType="DateTime"
                                                    PropertyName="Text" />
                                                <asp:ControlParameter ControlID="horhoraclick" Name="horaclick" 
                                                    PropertyName="Text" />
                                                <asp:ControlParameter ControlID="datdatacaptacao" Name="datacaptacao" DbType="DateTime"
                                                    PropertyName="Text" />
                                                <asp:ControlParameter ControlID="txtquantcandidatos" Name="quantcandidatos" 
                                                    PropertyName="Text" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="datdataempresa" DbType="DateTime" 
                                                    Name="dataEmpresa" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="horhoraempresa" Name="horaEmpresa" 
                                                    PropertyName="Text" />
                                                <asp:ControlParameter ControlID="cbocaptador2" Name="captador" 
                                                    PropertyName="SelectedValue" />
                                                <asp:SessionParameter Name="id_vaga_fk" SessionField="id_vaga" />
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
                                        <asp:SqlDataSource ID="sqlprogramacaoEnt" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                            DeleteCommand="DELETE FROM tblProgramacaoEntrevista WHERE (id_entrevista_fk = @id_entrevista_fk)" 
                                            InsertCommand="INSERT INTO tblProgramacaoEntrevista(id_entrevista_fk, id_oferta_fk, codigo) VALUES (@id_entrevista_fk, @id_oferta_fk, @codigo)" 
                                            SelectCommand="SELECT tblProgramacaoEntrevista.id_oferta_fk, tblSGA_Ofertas.nome, tblSgaUnidade.RAZAO_SOCIAL, tblSGA_AreasConhecimento.area FROM tblProgramacaoEntrevista INNER JOIN tblSGA_Ofertas ON tblProgramacaoEntrevista.id_oferta_fk = tblSGA_Ofertas.oferta INNER JOIN tblEntrevista ON tblProgramacaoEntrevista.id_entrevista_fk = tblEntrevista.id_entrevista INNER JOIN tblSgaUnidade ON tblEntrevista.id_local_fk = tblSgaUnidade.id_unidade INNER JOIN tblSGA_AreasConhecimento ON tblSGA_Ofertas.area_operacional_rj = tblSGA_AreasConhecimento.codigo WHERE (tblProgramacaoEntrevista.id_entrevista_fk = @id_entrevista_fk)" 
                                            
                                            UpdateCommand="UPDATE tblEntrevista SET cancelamento = 1 WHERE (id_entrevista = @id_entrevista)" 
                                            CacheExpirationPolicy="Sliding">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="GridEntrevistaRelac" Name="id_entrevista_fk" 
                                                    PropertyName="SelectedValue" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:ControlParameter ControlID="GridEntrevistaRelac" Name="id_entrevista_fk" 
                                                    PropertyName="SelectedValue" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:ControlParameter ControlID="GridEntrevistaRelac" Name="id_entrevista" 
                                                    PropertyName="SelectedValue" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="id_entrevista_fk" />
                                                <asp:Parameter Name="id_oferta_fk" />
                                                <asp:Parameter Name="codigo" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="sqlEntrevistaRelac0" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                            DeleteCommand="DELETE FROM tblEntrevista WHERE (id_entrevista = @id_entrevista)" 
                                            InsertCommand="INSERT INTO tblEntrevista(captador, dataClick, horaClick, dataCaptacao, id_statusEntrevista, quantcandidatos, id_local_fk, cancelamento) VALUES (@captador, @dataclick, @horaclick, @dataCaptacao, @id_statusEntrevista, @quantcandidatos, @id_local_fk, 0)" 
                                            SelectCommand="SELECT tblEntrevista.dataClick, tblEntrevista.horaClick, tblEntrevista.id_statusEntrevista, tblEntrevista.captador, tblEntrevista.id_entrevista, tblStatusEntrevista.statusEntrevista, tblEntrevista.quantcandidatos, tblEntrevista.dataCaptacao, tblSgaUnidade.RAZAO_SOCIAL FROM tblEntrevista LEFT OUTER JOIN tblSgaUnidade ON tblEntrevista.id_local_fk = tblSgaUnidade.id_unidade LEFT OUTER JOIN tblStatusEntrevista ON tblEntrevista.id_statusEntrevista = tblStatusEntrevista.id_statusEntrevista WHERE (tblEntrevista.cancelamento = 0) ORDER BY tblEntrevista.id_entrevista DESC" 
                                            UpdateCommand="UPDATE tblEntrevista SET cancelamento = 1 WHERE (id_entrevista = @id_entrevista)">
                                            <DeleteParameters>
                                                <asp:ControlParameter ControlID="GridEntrevistaRelac" Name="id_entrevista_fk" 
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
                                        <asp:SqlDataSource ID="sqlDeletaCaptadores" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                            DeleteCommand="DELETE FROM tblCaptadorEntrevista WHERE (id_entrevista_fk = @id_entrevista_fk)" 
                                            InsertCommand="INSERT INTO [tblCaptadorEntrevista] ([id_entrevista_fk]) VALUES (@id_entrevista_fk)" 
                                            SelectCommand="SELECT [id_entrevista_fk], [id_captador_entrevista] FROM [tblCaptadorEntrevista]" 
                                            UpdateCommand="UPDATE [tblCaptadorEntrevista] SET [id_entrevista_fk] = @id_entrevista_fk WHERE [id_captador_entrevista] = @id_captador_entrevista">
                                       <DeleteParameters>
                                                <asp:ControlParameter ControlID="GridEntrevistaRelac" Name="id_entrevista_fk" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </DeleteParameters>
                                        
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="Sqloperador" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ServidorBD %>" 
                                            SelectCommand="SELECT Matricula, Nome FROM admPortalUsuario WHERE (Matricula = '10770') OR (Matricula = ' 9387') OR (Matricula = '10702') ORDER BY Nome">
                                        </asp:SqlDataSource>
                                        </span>
                                        </b></span>
                                    </span>
                            </asp:View>
                            
                        </asp:MultiView>
                                        </asp:Panel>
                                   
                                </span></b>
           
                        <asp:Panel ID="Panel3" runat="server" BackColor="#009900" 
            Height="20px">
                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                <span lang="pt-br">&nbsp;&nbsp; 4° Passo - INICIAR CAPAÇÃO SEM VAGA</span></div>
                            <br />
                        </asp:Panel>
                        <a name="Passo4"></a>
                        
                                <span lang="pt-br">
                                <table class="style1" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td class="style54">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Nome:      <td class="style54">
                                            <span lang="pt-br">
                                            <asp:TextBox ID="txbNomeBusca" runat="server"></asp:TextBox>
                                            </span>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            CPF:</td>
                                        <td class="style54">
                                            <span lang="pt-br">
                                            <asp:TextBox ID="txbCPF" runat="server"></asp:TextBox>
                                            <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                                ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" 
                                                ImageAlign="Middle" />
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                                </span><b>
                                <br />
                                <asp:DetailsView ID="dtvDetalheVaga2" runat="server" AutoGenerateRows="False" 
                                    DataSourceID="sqldetalhevaga" GridLines="Horizontal" Height="50px" 
                                    Width="306px">
                                    <FieldHeaderStyle Width="90px" />
                                    <Fields>
                                        <asp:BoundField DataField="dataclick" HeaderText="Data no Click:" 
                                            ReadOnly="True" SortExpression="dataclick" />
                                    </Fields>
                                </asp:DetailsView>
                                <br />
                                <asp:Label ID="lblMsg0" runat="server" 
                                    style="font-weight: 700; color: #FF0000; background-color: #FFFFFF"></asp:Label>
                                <br />
                                <br />
                                <asp:GridView ID="Gridcandidato0" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" CssClass="grid" 
                                    DataKeyNames="id_candidato,nome" 
            DataSourceID="SqlCandidatos0" Font-Bold="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Entrevista">
                                            <ItemTemplate>
                                                <table class="style35">
                                                    <tr>
                                                        <td align="left">
                                                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id_candidato" HeaderText="Cód. Candidato" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="id_candidato">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="identificador" HeaderText="CPF" 
                                            SortExpression="identificador">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" Width="90px" />
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
                                            <ItemStyle HorizontalAlign="Center" Width="200px" />
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
                                            SortExpression="municipio">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nascimento" HeaderText="Data de nascimento" 
                                            SortExpression="nascimento">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="formacao" HeaderText="Escolaridade" 
                                            SortExpression="formacao">
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
                                </b>
                            
                    
        
                                    <asp:SqlDataSource ID="SqlCandidatos0" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
            
            
            SelectCommand="SELECT DISTINCT '0' AS selecionado, tblCandidato.id_tipo_fk, tblCandidato.nome, tblCandidato.telefone, tblCandidato.celular, tblCandidato.email, tblCandidato.id_candidato, tblCandidato.bairro, tblCandidato.nascimento, tblMunicipio.nome AS municipio, (SELECT TOP (1) b.formacao FROM tblCandidatoFormacao AS a INNER JOIN tblFormacaoNivel AS b ON a.id_formacaonivel_fk = b.id_formacaonivel WHERE (a.id_candidato_fk = tblCandidato.id_candidato) ORDER BY b.id_formacaonivel DESC) AS formacao, tblSexo.sexo, tblCandidato.cidade, tblSGA_ClientesComOferta.id_oferta, tblCandidato.identificador FROM tblCandidato INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio INNER JOIN tblSexo ON tblCandidato.sexo = tblSexo.id_sexo INNER JOIN tblSGA_ClientesComOferta ON tblCandidato.identificador = tblSGA_ClientesComOferta.IDENTIFICADOR WHERE (tblCandidato.id_candidato NOT IN (SELECT id_cadidato_fk FROM tblCandidatoEntrevista AS tblCandidatoEntrevista_1)) AND (tblSGA_ClientesComOferta.id_oferta IN (SELECT id_oferta_fk FROM tblProgramacaoEntrevista WHERE (id_entrevista_fk = @id_entrevista))) AND (tblCandidato.identificador LIKE @identificador + '%') AND (tblCandidato.nome LIKE @nome + '%') ORDER BY tblCandidato.nome">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txbCPF" Name="identificador" 
                                                PropertyName="Text" DefaultValue="%" />
                                            <asp:ControlParameter ControlID="txbNomeBusca" Name="nome" PropertyName="Text" 
                                                DefaultValue="%" />
                                            <asp:ControlParameter ControlID="GridEntrevistaRelac" DefaultValue="" 
                                                Name="id_entrevista" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <b>
                                <br />
                                <asp:ImageButton ID="ImageButton7" runat="server" 
                                    ImageUrl="~/Icones/Standard/001_51.gif" 
                                    
            onclientclick="return confirm('Deseja encaminhar esses candidatos?')" 
            ImageAlign="Middle" />
                                <span class="style22">&nbsp;<asp:Label ID="lblhoraclick3" runat="server" Text="Clique na seta laranja para incluir os candidatos selecionados na LISTA DE ENCAMINHADOS" 
                                                        Font-Bold="True" 
            Font-Size="11px"></asp:Label>
                                   
                                </span>
                                </b>
                                    </a>
                    
                                <br />
                    
                                <b>
                                            <br />
                                            <asp:Label ID="lblerro1" runat="server" 
                                                
            style="font-weight: 700; color: #FF0000; background-color: #FFFFFF"></asp:Label>
                                            </b>
                    
                                    </span>
              
                                            
                                                   </span>
                              
        <br />
                                                    <span class="style23" lang="pt-br">
        <span class="style34"><span lang="pt-br">
        
        <a name="Passo5"></a>
                                                    <asp:Panel ID="Panel20" 
            runat="server" BackColor="#009900" Height="20px">
                                                        <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                                            <span lang="pt-br">&nbsp;&nbsp; 5° Passo - LISTA DOS NOVOS CANDIDATOS CAPTADOS SEM VAGA 
                                                            DEFINIDA
                                                            </span>
                                                        </div>
                                                    </asp:Panel>
                                                    </span></span></span>
                              
    </div>
  
                                        <asp:MultiView ID="MultiView5" 
        runat="server" ActiveViewIndex="0">
                                        <asp:View ID="ViewNovosCandidatos" runat="server">
                                            <table class="style39">
                                                <tr>
                                                    <td class="style41">
                                                        CPF:</td>
                                                    <td class="style40">
                                                        <asp:TextBox ID="txbCPFNovo" runat="server"></asp:TextBox>
                                                        <asp:ImageButton ID="ImageButton11" runat="server" 
                                                            ImageUrl="~/clickoportunidades/icones/Standard/001_38.gif" 
                                                            ImageAlign="Middle" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                          
                                                    <asp:GridView ID="GridNovosCandidatos" runat="server" AllowPaging="True" 
                                                        AllowSorting="True" AutoGenerateColumns="False" CssClass="grid" 
                                                        DataKeyNames="id_candidato,identificador" 
                                                DataSourceID="sqlCandidatosNovo" Font-Size="11px">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="ImageButton14" runat="server" CommandName="Select" 
                                                                        ImageUrl="~/Icones/Standard/001_59.gif" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="id_candidato" HeaderText="ID Candidato" 
                                                                InsertVisible="False" ReadOnly="True" SortExpression="id_candidato" />
                                                            <asp:BoundField DataField="identificador" HeaderText="CPF" 
                                                                SortExpression="identificador" />
                                                            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                                                            <asp:TemplateField HeaderText="Programação">
                                                                <ItemTemplate>
                                                                    <span lang="pt-br"><b><span class="style22">
                                                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                                                        AutoGenerateColumns="False" BackColor="White" BorderStyle="None" 
                                                                        DataSourceID="Sqlprogramacaoent" Font-Size="8px" ForeColor="White" 
                                                                        GridLines="None" PageSize="3" ShowHeader="False">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="nome" ShowHeader="False" SortExpression="nome">
                                                                                <FooterStyle BackColor="White" ForeColor="Black" />
                                                                            </asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle ForeColor="Black" />
                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="Sqlprogramacaoent" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                        SelectCommand="SELECT tblSGA_Ofertas.oferta, tblSGA_Ofertas.nome FROM tblSGA_Ofertas INNER JOIN tblSGA_ClientesComOferta ON tblSGA_Ofertas.oferta = tblSGA_ClientesComOferta.id_oferta WHERE (tblSGA_ClientesComOferta.IDENTIFICADOR = @identificador)">
                                                                        <SelectParameters>
                                                                            <asp:Parameter Name="identificador" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    </span></b></span>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
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
                                                            Não existe candidatos registrados no momento.</span>
                                                        </EmptyDataTemplate>
                                                        <SelectedRowStyle BackColor="#D1DDF1" />
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="sqlCandidatosNovo" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                        SelectCommand="SELECT tblMunicipio.nome AS Municipio, CASE WHEN dbo.tblCandidatoEntrevista.id_candidatoentr IS NULL THEN 'True' ELSE 'False' END AS habilitaEncaminhar, CASE WHEN dbo.tblCandidatoEntrevista.id_candidatoentr IS NULL THEN 'False' ELSE 'True' END AS habilitaTipoEnc, tblCandidato.id_candidato, tblCandidato.nome, tblCandidato.identificador_tipo, tblCandidato.identificador, tblCandidato.rg, tblCandidato.id_nacionalidade, tblCandidato.nascimento, tblCandidato.sexo, tblCandidato.id_estadocivil, tblCandidato.endereco, tblCandidato.numero, tblCandidato.complemento, tblCandidato.bairro, tblCandidato.id_municipio, tblCandidato.estado_fk, tblCandidato.cep, tblCandidato.telefone, tblCandidato.celular, tblCandidato.telefone_recado, tblCandidato.email, tblCandidato.dependentes, tblCandidato.observacao, tblCandidato.id_contato, tblCandidato.ultima_atualizacao, tblCandidato.id_descobriu_fk, tblCandidato.descobriu_outros, tblCandidato.observacoes, tblCandidato.senha, tblCandidato.id_deficiente_fk, tblCandidato.emailnao, tblCandidato.nomePai, tblCandidato.nomeMae, tblCandidato.cidade, tblCandidato.lembrete, tblCandidato.id_evento, tblCandidato.id_unidade, tblCandidato.id_tipo_fk, tblSGA_Ofertas.oferta, tblSGA_Ofertas.nome AS Expr1, tblCandidato.tipoSistema FROM tblSGA_Ofertas INNER JOIN tblSGA_ClientesComOferta ON tblSGA_Ofertas.oferta = tblSGA_ClientesComOferta.id_oferta INNER JOIN tblMunicipio INNER JOIN tblCandidato ON tblMunicipio.id_municipio = tblCandidato.id_municipio ON tblSGA_ClientesComOferta.IDENTIFICADOR = tblCandidato.identificador LEFT OUTER JOIN tblCandidatoEntrevista ON tblCandidato.id_candidato = tblCandidatoEntrevista.id_cadidato_fk WHERE (tblCandidato.tipoSistema IS NOT NULL)">
                                                    </asp:SqlDataSource>
                                                    <br />
                                                    <asp:Label ID="lblmsgcandidatoextra" runat="server"></asp:Label>
                                                    <a name="Passo6"></a>
                                                    <br />
                                                    <br />
                                                
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
                                            <asp:SqlDataSource ID="sqlUnidade0" runat="server" 
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
                                                InsertCommand="INSERT INTO tblCandidato(nome, nascimento, sexo, identificador, bairro, id_municipio, telefone, id_tipo_fk, senha, tipoSistema) VALUES (@nome, @dataNascimento, @id_sexo_fk, @identificador, @bairro, @id_municipio_fk, @telefone, 2, '123', @tiposistema)" 
                                                SelectCommand="SELECT tblCandidatoExtra.* FROM tblCandidatoExtra" 
                                                
                                                
                                                
                                                UpdateCommand="UPDATE tblCandidato SET nome = @nome, nascimento = @nascimento, sexo = @sexo, identificador = @identificador, id_municipio = @id_municipio, bairro = @bairro, telefone = @telefone WHERE (id_candidato = @id_candidato)">
                                                <UpdateParameters>
                                                    <asp:ControlParameter ControlID="txtnome" Name="nome" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="txtidentificador" Name="identificador" 
                                                        PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="txtbairro" Name="bairro" PropertyName="Text" />
                                                    <asp:ControlParameter ControlID="txttelefone" Name="telefone" 
                                                        PropertyName="Text" />
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
                                                    <asp:ControlParameter ControlID="rdtiposistema" Name="tiposistema" 
                                                        PropertyName="SelectedValue" />
                                                </InsertParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlConvocacaoForm" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                SelectCommand="SELECT tblCandidatoEntrevista.id_candidatoentr, tblCandidatoEntrevista.id_cadidato_fk, tblCandidatoEntrevista.id_entrevista_fk, tblCandidatoEntrevista.DataCaptacao, tblCandidatoEntrevista.FormaEnc, tblCandidatoEntrevista.observacao, tblCandidatoEntrevista.Captador, tblCandidato.nome AS NomeCandidato FROM tblCandidatoEntrevista INNER JOIN tblCandidato ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidato.id_candidato WHERE (tblCandidatoEntrevista.id_candidatoentr = @id_candidatoentr)" 
                                                DeleteCommand="DELETE FROM [tblCandidatoEntrevista] WHERE [id_candidatoentr] = @id_candidatoentr" 
                                                InsertCommand="INSERT INTO tblCandidatoEntrevista(id_cadidato_fk, id_entrevista_fk, Captador, FormaEnc, DataCaptacao) VALUES (@id_cadidato_fk, @id_entrevista_fk, @Captacao, @formaenc, GETDATE())" 
                                                UpdateCommand="UPDATE tblCandidatoEntrevista SET id_cadidato_fk = @id_cadidato_fk, id_entrevista_fk = @id_entrevista_fk, DataCaptacao = @DataCaptacao, FormaEnc = @FormaEnc, observacao = @observacao, Captador = @captador WHERE (id_candidatoentr = @id_candidatoentr)">
                                                <SelectParameters>
                                                    <asp:Parameter Name="id_candidatoentr" />
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
                                                    <asp:sessionParameter Name="id_entrevista_fk" SessionField="id_entrevista" />
                                                    <asp:SessionParameter Name="Captacao" SessionField="c_Nome" />
                                                    <asp:Parameter Name="formaenc" />
                                                </InsertParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqldetalhevaga" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                SelectCommand="SELECT CONVERT (varchar, dataClick, 103) + ' ' + CONVERT (VARCHAR, horaClick, 103) AS dataclick, CONVERT (varchar, dataEmpresa, 103) + ' ' + horaEmpresa AS dataempresa FROM tblEntrevista WHERE (id_entrevista = @id_entrevista)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="id_entrevista" SessionField="id_entrevista" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlEncaminhadosExtra" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                SelectCommand="SELECT tblCandidatoEntrevistaExtra.Id_captacao_extra, tblCandidatoEntrevistaExtra.id_candidato_extra, tblCandidatoEntrevistaExtra.id_entrevista, tblCandidatoExtra.nome, tblCandidatoExtra.dataNascimento, tblCandidatoExtra.id_sexo_fk, tblCandidatoExtra.identificador, tblCandidatoExtra.bairro, tblCandidatoExtra.telefone FROM tblCandidatoEntrevistaExtra INNER JOIN tblCandidatoExtra ON tblCandidatoEntrevistaExtra.id_candidato_extra = tblCandidatoExtra.id_candidato_extra">
                                            </asp:SqlDataSource>
                                        </asp:View>
                                    </asp:MultiView>
  
                                                    <asp:Panel ID="Panel21" 
        runat="server" BackColor="#009900" Height="20px">
                                                        <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                                            <span lang="pt-br">&nbsp;&nbsp; 6° Passo - INCLUIR&nbsp; CANDIDATOS NA CAPTAÇÃO SEM VAGA (SGA E 
                                                            SCA)</span></div>
                                                    </asp:Panel>
                                                    <asp:MultiView ID="MultiView6" 
        runat="server" ActiveViewIndex="0">
                                                        <asp:View ID="View1" runat="server">
                                                            <table class="style39">
                                                                <tr>
                                                                    <td class="style26">
                                                                        <asp:Label ID="lblNomeCandidato" runat="server" Text="Nome do Candidato:"></asp:Label>
                                                                    </td>
                                                                    <td class="style42" colspan="2">
                                                                        <asp:TextBox ID="txtnome" runat="server" Width="250px"></asp:TextBox>
                                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                            ControlToValidate="txtnome" ErrorMessage="* Campo Obrigatório" 
                                                                            ValidationGroup="novocandidato"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style26">
                                                                        <asp:Label ID="Label229" runat="server" Text="Selecione o sistema:"></asp:Label>
                                                                    </td>
                                                                    <td class="style42" colspan="2">
                                                                        <asp:RadioButtonList ID="rdtiposistema" runat="server" AutoPostBack="True" 
                                                                            RepeatDirection="Horizontal">
                                                                            <asp:ListItem Value="0">SGA</asp:ListItem>
                                                                            <asp:ListItem Value="1">CGA</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style26">
                                                                        <asp:Label ID="lblunidade" runat="server" Text="Unidade:"></asp:Label>
                                                                    </td>
                                                                    <td class="style42" colspan="2">
                                                                        <asp:DropDownList ID="cboid_unidade_fk" runat="server" 
                                                                            DataSourceID="Sqlunidade" DataTextField="RAZAO_SOCIAL" 
                                                                            DataValueField="id_unidade" Font-Size="X-Small" Width="250px">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style26">
                                                                        &nbsp;</td>
                                                                    <td class="style42" colspan="2">
                                                                        <span lang="pt-br"><b><span class="style22">
                                                                        <asp:Panel ID="Panel18" runat="server" GroupingText="Ofertas CGA" 
                                                                            Height="173px" ScrollBars="Vertical" Width="493px">
                                                                            <br />
                                                                            <asp:CheckBoxList ID="Chkoferta1" runat="server" DataSourceID="SqlCursoSenac0" 
                                                                                DataTextField="NOMEs" DataValueField="OFERTA" Font-Bold="False">
                                                                            </asp:CheckBoxList>
                                                                            <span lang="pt-br"><b>
                                                                            <asp:SqlDataSource ID="SqlCursoSenac0" runat="server" 
                                                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                                SelectCommand="SELECT oferta + '- ' + nome AS nomes, oferta FROM tblSGA_Ofertas WHERE (nome NOT LIKE '%OFICINA%') ORDER BY nome">
                                                                            </asp:SqlDataSource>
                                                                            </b></span>
                                                                        </asp:Panel>
                                                                        </span></b></span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style26">
                                                                        <asp:Label ID="lbldataNascimento" runat="server" Text="Data Nascimento:"></asp:Label>
                                                                    </td>
                                                                    <td class="style42" colspan="2">
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
                                                                        <asp:ImageButton ID="btnCalendario" runat="server" ImageAlign="Middle" 
                                                                            ImageUrl="~/clickoportunidades/icones/Standard/001_44.gif" />
                                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
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
                                                                        <asp:TextBox ID="txtidentificador" runat="server" MaxLength="14" 
                                                                            onkeyup="FormataCpf(this,event)" Width="150px"></asp:TextBox>
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
                                                                    <td class="style42" colspan="2">
                                                                        <asp:TextBox ID="txtbairro" runat="server" Width="200px"></asp:TextBox>
                                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                            ControlToValidate="txtbairro" ErrorMessage="* Campo Obrigatório" 
                                                                            ValidationGroup="novocandidato"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style26">
                                                                        <asp:Label ID="lbltelefone" runat="server" Text="Telefone:"></asp:Label>
                                                                    </td>
                                                                    <td class="style42">
                                                                        <asp:TextBox ID="txttelefone" runat="server" MaxLength="13" 
                                                                            onkeypress="Mascara(this);"></asp:TextBox>
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
                                                                            ToolTip="Adicionar candidato" ValidationGroup="novocandidato" />
                                                                        <asp:ImageButton ID="btnSalvar" runat="server" 
                                                                            ImageUrl="~/Icones/Standard/001_06.gif" ToolTip="Atualizar candidato" 
                                                                            ValidationGroup="novocandidato" Visible="False" />
                                                                        <asp:ImageButton ID="ImageButton13" runat="server" 
                                                                            ImageUrl="~/Icones/Standard/001_02.gif" ToolTip="Cancelar cadastro" />
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </asp:View>
    </asp:MultiView>
                                                    <span class="style23" 
        lang="pt-br"><span class="style34"><span lang="pt-br">
                                                    
                                                    
                                                    <asp:Panel ID="Panel15" 
        runat="server" BackColor="#009900" Height="20px">
                                                        <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                                            <span lang="pt-br">&nbsp;&nbsp; 7° Passo - LISTA DOS NOVOS CANDIDATOS EXTRAS ENCAMINHADOS 
                                                            SEM VAGA
                                                            </span>
                                                            <br />
                                                        </div>
                                                    </asp:Panel>
                                                    </span></span></span>
                                                    <br />
                                                    <asp:DetailsView ID="dtvDetalheVaga0" runat="server" AutoGenerateRows="False" 
                                                        
        DataSourceID="sqldetalhevaga" GridLines="Horizontal" Height="50px" 
                                                        Width="306px">
                                                        <FieldHeaderStyle Width="90px" />
                                                        <Fields>
                                                            <asp:BoundField DataField="dataclick" HeaderText="Data no Click:" 
                                                                ReadOnly="True" SortExpression="dataclick" />
                                                        </Fields>
                                                    </asp:DetailsView>
                                                    <br />
                                                    <asp:Label ID="Label41" 
        runat="server" Font-Bold="True" 
                                                        
        Text="Candidatos Extras Encaminhados"></asp:Label>
                                            <br />
                                            <asp:SqlDataSource ID="sqlEncaminhados0" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                DeleteCommand="DELETE FROM tblCandidatoEntrevista WHERE (id_cadidato_fk = @id_candidato)" 
                                                
        
        SelectCommand="SELECT tblCandidato.nome, tblCandidato.sexo, tblCandidato.nascimento, tblCandidato.identificador, tblCandidato.bairro, tblCandidato.telefone, tblMunicipio.nome AS municipio, tblStatusEntrevista.statusEntrevista, tblCandidatoEntrevista.id_candidatoentr, tblCandidato.id_tipo_fk, tblEntrevista.id_entrevista, tblCandidatoEntrevista.id_entrevista_fk, tblCandidato.id_candidato, tblCandidatoEntrevista.id_cadidato_fk FROM tblCandidatoEntrevista INNER JOIN tblCandidato ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidato.id_candidato INNER JOIN tblMunicipio ON tblCandidato.id_municipio = tblMunicipio.id_municipio INNER JOIN tblStatusEntrevista ON tblCandidatoEntrevista.FormaEnc = tblStatusEntrevista.id_statusEntrevista INNER JOIN tblEntrevista ON tblCandidatoEntrevista.id_entrevista_fk = tblEntrevista.id_entrevista WHERE (tblEntrevista.id_entrevista = @id_entrevista) ORDER BY tblCandidatoEntrevista.id_candidatoentr DESC">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="GridEntrevistaRelac" Name="id_entrevista" 
                                                        PropertyName="SelectedValue" />
                                                </SelectParameters>
                                                <DeleteParameters>
                                                    <asp:ControlParameter ControlID="GridEncaminhadosExtra" Name="id_candidato" 
                                                        PropertyName="SelectedValue" />
                                                </DeleteParameters>
                                            </asp:SqlDataSource>
                                                    <br />
                                                    <asp:GridView ID="GridEncaminhadosExtra" runat="server" AllowPaging="True" 
                                                        AllowSorting="True" 
        AutoGenerateColumns="False" CssClass="grid" 
                                                        DataKeyNames="id_cadidato_fk,id_entrevista_fk" 
                                                        
        DataSourceID="sqlEncaminhados0">
                                                        <Columns>
                                                            <asp:BoundField DataField="nome" HeaderText="Nome do Candidato" 
                                                                SortExpression="nome" />
                                                            <asp:TemplateField HeaderText="Programação" SortExpression="cargo">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("cargo") %>'></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <span lang="pt-br"><b>
                                                                    <span class="style22">
                                                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                                                                        AutoGenerateColumns="False" BackColor="White" BorderStyle="None" 
                                                                        DataSourceID="Sqlprogramacaoent0" Font-Size="8px" ForeColor="White" 
                                                                        GridLines="None" PageSize="3" ShowHeader="False">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="nome" ShowHeader="False" SortExpression="nome">
                                                                                <FooterStyle BackColor="White" ForeColor="Black" />
                                                                            </asp:BoundField>
                                                                        </Columns>
                                                                        <FooterStyle ForeColor="Black" />
                                                                    </asp:GridView>
                                                                    </span></b></span>
                                                                    <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br"><b>
                                                                    <span class="style22">
                                                                    <asp:SqlDataSource ID="Sqlprogramacaoent0" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                        SelectCommand="SELECT DISTINCT tblProgramacaoEntrevista.id_entrevista_fk, tblSGA_Ofertas.nome, tblSgaUnidade.RAZAO_SOCIAL, tblSGA_ClientesComOferta.id_oferta, tblSGA_ClientesComOferta.IDENTIFICADOR FROM tblProgramacaoEntrevista INNER JOIN tblSGA_Ofertas ON tblProgramacaoEntrevista.id_oferta_fk = tblSGA_Ofertas.oferta INNER JOIN tblSGA_AreasConhecimento ON tblSGA_Ofertas.area_operacional_rj = tblSGA_AreasConhecimento.codigo INNER JOIN tblSgaUnidade ON tblSGA_AreasConhecimento.uo = tblSgaUnidade.id_unidade INNER JOIN tblSGA_ClientesComOferta ON tblSGA_Ofertas.oferta = tblSGA_ClientesComOferta.id_oferta WHERE (tblSGA_ClientesComOferta.IDENTIFICADOR = @identificador)">
                                                                        <SelectParameters>
                                                                            <asp:Parameter Name="identificador" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    </span></b></span></span></span>
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
                                                            <asp:CommandField ButtonType="Image" HeaderText="Voltar para captação" 
                                                                SelectImageUrl="~/clickoportunidades/icones/Standard/voltar.jpg" SelectText="" 
                                                                ShowSelectButton="True">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            </asp:CommandField>
                                                        </Columns>
                                                        <EmptyDataTemplate>
                                                            <span lang="pt-br" 
                                                                
                                                                
                                                                style="font-family: verdana; font-size: 10px; font-weight: bold; color: #FF6600">
                                                            Não existe candidatos encaminhados no momento. </span>
                                                        </EmptyDataTemplate>
                                                        <SelectedRowStyle BackColor="#D1DDF1" />
                                                    </asp:GridView>
                                            <span class="style23" lang="pt-br">
    <span class="style34"><span lang="pt-br">
                                            
                                            <asp:Panel ID="Panel16" runat="server" 
        BackColor="#009900" Height="20px">
                                                <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                                    <span lang="pt-br">&nbsp;&nbsp; 8° Passo - ORIENTAR CANDIDATOS SEM VAGA DEFINIDA</span></div>
                                            </asp:Panel>
                                            </span></span></span>
                                            <span class="style23" lang="pt-br">
    <span class="style34"><span lang="pt-br">
                                            
                                            <asp:DetailsView ID="dtvDetalheVaga1" 
        runat="server" AutoGenerateRows="False" 
                                                CssClass="grid" 
        DataSourceID="sqldetalhevaga" Font-Bold="False" 
                                                Font-Size="11px" 
        GridLines="Horizontal" Height="50px" Width="222px">
                                                <FieldHeaderStyle Width="90px" />
                                                <Fields>
                                                    <asp:BoundField DataField="dataclick" HeaderText="Data no Click:" 
                                                        ReadOnly="True" SortExpression="dataclick" />
                                                </Fields>
                                            </asp:DetailsView>
                                            <br />
                                            <asp:Label ID="Label230" runat="server" 
        Font-Bold="False" Font-Size="11px" 
                                                
        Text="Selecione uma entrevista para efetuar a orientação:"></asp:Label>
                                            <br />
                                            <br />
                                            <div id="div_print1">
                                            <span class="style23" lang="pt-br">
    <span class="style34"><span lang="pt-br">
                                            
                                                        <asp:GridView ID="gridorientados" runat="server" AutoGenerateColumns="False" 
                                                            DataKeyNames="id_entrevista_fk,id_cadidato_fk" 
                                                            
        DataSourceID="SqlorientadosSemVaga" Font-Size="11px">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Código do candidato" 
                                                                    SortExpression="id_cadidato_fk">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblcandidato" runat="server" 
                                                                            Text='<%# Bind("id_cadidato_fk") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("id_cadidato_fk") %>'></asp:TextBox>
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
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("nome") %>'></asp:Label>
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
                                                                        &nbsp;às <span class="style23" lang="pt-br">
                                                                        <span class="style34">
                                                                        <span lang="pt-br" 
                                                                            style="font-size: 10px; font-weight: normal">
                                                                        <asp:Label ID="Label232" runat="server" Text='<%# Bind("horaClick", "{0}") %>' 
                                                                            Font-Size="10px"></asp:Label>
                                                                        h<br />
                                                                        <asp:Label ID="Label233" runat="server" Font-Size="10px" 
                                                                            Text='<%# Bind("RAZAO_SOCIAL", "{0}") %>'></asp:Label>
                                                                        </span></span></span>
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
                                                                            Width="200px"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox3" runat="server" 
                                                                            Text='<%# Bind("orientacaocandidato") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField SortExpression="id_aptoEncam">
                                                                    <ItemTemplate>
                                                                        <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                                                        <asp:RadioButtonList ID="rdid_aptoEncam" runat="server" ForeColor="White" 
                                                                            RepeatDirection="Horizontal">
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
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="grid" />
                                                        </asp:GridView>
                                            </span></span></span>
                                       </div>
                                            </span><span lang="pt-br" id="PrintDiv2">
                                            
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
                                                                    &nbsp;<span class="style23" lang="pt-br"><span 
                                                                        class="style34"><span lang="pt-br"><asp:Label 
                                                                        ID="lblfechamento0" runat="server" Font-Bold="False" Font-Size="11px"></asp:Label>
                                                                    </span></span></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style52" colspan="2">
                        <span class="style23" lang="pt-br">
                                    <span lang="pt-br"><span class="style23" lang="pt-br"><span class="style34">
                                    <asp:ImageButton ID="ImageButton18" runat="server" ImageAlign="Middle" 
                                        ImageUrl="~/clickoportunidades/icones/Standard/imprimir.jpg" onclientclick="printdiv('div_print1');" />
                                    </span></span></span>
                                                                    <span class="style34">
                                    <span lang="pt-br">&nbsp;<asp:Label ID="Label251" runat="server" Font-Bold="False" Font-Size="11px" 
                                        Text="Imprimir formulário de orientação"></asp:Label>
                                                                    </span>
                                                                    </span></span>
                        
                                                                </td>
                                                            </tr>
                                                        </table>
                                            <asp:SqlDataSource ID="SqlorientadosSemVaga" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                
                                                SelectCommand="SELECT tblCandidato.nome, tblEntrevista.dataClick, tblEntrevista.horaClick, tblStatusEntrevista.statusEntrevista, tblCandidatoEntrevista.id_entrevista_fk, tblCandidatoOrientado_1.orientacaocandidato, tblCandidatoOrientado_1.id_aptoEncam, tblCandidatoOrientado_1.id_statusOrient, tblCandidatoEntrevista.id_cadidato_fk, tblSgaUnidade.RAZAO_SOCIAL FROM tblCandidatoEntrevista INNER JOIN tblCandidato ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidato.id_candidato INNER JOIN tblEntrevista ON tblCandidatoEntrevista.id_entrevista_fk = tblEntrevista.id_entrevista INNER JOIN tblStatusEntrevista ON tblCandidatoEntrevista.FormaEnc = tblStatusEntrevista.id_statusEntrevista INNER JOIN tblSgaUnidade ON tblEntrevista.id_local_fk = tblSgaUnidade.id_unidade LEFT OUTER JOIN tblCandidatoOrientado AS tblCandidatoOrientado_1 ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidatoOrientado_1.id_candidato_fk WHERE (tblCandidatoEntrevista.id_entrevista_fk = @id_entrevista) AND (tblCandidato.id_candidato NOT IN (SELECT id_candidato_fk FROM tblCandidatoOrientado AS tblCandidatoorientado))" 
                                                InsertCommand="INSERT INTO tblCandidatoOrientado(id_candidato_fk, id_aptoEncam, id_entrevista_fk, id_statusOrient, orientacaocandidato) VALUES (@id_candidato_fk, @id_aptoEncam, @id_entrevista_fk, @id_statusOrient, @orientacaocandidato)" 
                                                
                                                
        
        UpdateCommand="UPDATE tblCandidatoOrientado SET orientacaocandidato = @orientacaocandidato, id_candidato_fk = @id_candidato_fk, id_aptoEncam = @id_aptoencam, id_entrevista_fk = @id_entrevista_fk, id_statusOrient = @id_statusorient WHERE (id_candidatoOrient = @id_candidatoorient)" 
        
        
        
        DeleteCommand="DELETE FROM tblCandidatoOrientado WHERE (id_candidato_fk = @id_candidato)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="GridEntrevistaRelac" DbType="Int32" 
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
                                                        
                                                        <asp:Panel ID="Panel19" 
        runat="server" BackColor="#009900" Height="20px">
                                                            <div style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold;">
                                                                <span lang="pt-br">&nbsp;&nbsp; 9° Passo - VER LISTA DE CANDIDATOS ORIENTAOS SEM VAGA</span></div>
                                                        </asp:Panel>
                                            <br />
    <div id="div_print2">
                                            <span class="style23" lang="pt-br">
    <span class="style34"><span lang="pt-br">
                                            
                                                        <asp:GridView ID="GridorientadosOK" runat="server" AutoGenerateColumns="False" 
                                                            
        DataSourceID="SqlorientadosSemVaga0" DataKeyNames="id_entrevista_fk" 
                                                            CssClass="grid" 
        Font-Size="11px">
                                                            <Columns>
                                                                <asp:BoundField DataField="id_entrevista_fk" HeaderText="Código da entrevista" 
                                                                    SortExpression="id_entrevista_fk" >
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="Programação/Unidade">
                                                                    <ItemTemplate>
                                                                        <asp:GridView ID="gridprogramacao" runat="server" AutoGenerateColumns="False" 
                                                                            DataSourceID="Sqlprogramacaoent0" ShowHeader="False" AllowPaging="True" 
                                                                            BorderStyle="None" GridLines="None">
                                                                            <Columns>
                                                                                <asp:TemplateField SortExpression="nome">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label1" runat="server" Font-Size="11px" 
                                                                                            Text='<%# Bind("nome") %>'></asp:Label>
                                                                                        /<br />
                                                                                        <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                                                                        <asp:Label ID="Label2" runat="server" Font-Size="11px" 
                                                                                            Text='<%# Bind("RAZAO_SOCIAL", "{0}") %>'></asp:Label>
                                                                                        </span></span></span>
                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nome") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                        <span lang="pt-br"><b>
                                                                        <span class="style22">
                                                                        <asp:SqlDataSource ID="Sqlprogramacaoent0" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                                            
                                                                            
                                                                            
                                                                            SelectCommand="SELECT DISTINCT tblProgramacaoEntrevista.id_entrevista_fk, tblSGA_Ofertas.nome, tblSgaUnidade.RAZAO_SOCIAL FROM tblSGA_AreasConhecimento INNER JOIN tblSGA_Ofertas ON tblSGA_AreasConhecimento.codigo = tblSGA_Ofertas.area_operacional_rj INNER JOIN tblSgaUnidade ON tblSGA_AreasConhecimento.uo = tblSgaUnidade.id_unidade INNER JOIN tblProgramacaoEntrevista ON tblSGA_Ofertas.oferta = tblProgramacaoEntrevista.id_oferta_fk WHERE (tblProgramacaoEntrevista.id_entrevista_fk = @id_entrevista_fk)">
                                                                            <SelectParameters>
                                                                                <asp:Parameter Name="id_entrevista_fk" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                        </span></b></span>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="nome" HeaderText="Nome do candidato" 
                                                                    SortExpression="nome" >
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="Apto para encaminhar?" 
                                                                    SortExpression="id_aptoEncam">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label233" runat="server" Text='<%# Bind("id_aptoEncam") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_aptoEncam") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="orientacaocandidato" HeaderText="Orientação" 
                                                                    SortExpression="orientacaocandidato">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="Status da orientação no Click" 
                                                                    SortExpression="id_statusOrient">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label234" runat="server" 
                                                                            Text='<%# Eval("statusorientacao", "{0}") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("id_statusOrient") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <EmptyDataTemplate>
                                                                <span class="style23" lang="pt-br"><span class="style34"><span lang="pt-br">
                                                                <asp:Label ID="lblnaoexiste1" runat="server" BorderStyle="None" 
                                                                    Font-Bold="False" Font-Size="11px" ForeColor="#FF6600">Não existe orientações no momento.</asp:Label>
                                                                </span></span></span>
                                                            </EmptyDataTemplate>
                                                        </asp:GridView>
                                            </span></span></span>
                                            </div>
                                            
                                            <asp:SqlDataSource ID="SqlorientadosSemVaga0" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SENACRJConnectionString %>" 
                                                
                                                
                                                SelectCommand="SELECT tblCandidato.nome, tblEntrevista.dataClick, tblEntrevista.horaClick, tblStatusEntrevista.statusEntrevista, tblCandidatoEntrevista.id_cadidato_fk, tblCandidatoEntrevista.id_entrevista_fk, tblCandidatoOrientado_1.orientacaocandidato, tblCandidatoOrientado_1.id_aptoEncam, tblCandidatoOrientado_1.id_candidato_fk, tblstatusOrientacao.statusorientacao FROM tblstatusOrientacao INNER JOIN tblCandidatoOrientado AS tblCandidatoOrientado_1 ON tblstatusOrientacao.id_statusOrientacao = tblCandidatoOrientado_1.id_statusOrient RIGHT OUTER JOIN tblCandidatoEntrevista INNER JOIN tblCandidato ON tblCandidatoEntrevista.id_cadidato_fk = tblCandidato.id_candidato INNER JOIN tblEntrevista ON tblCandidatoEntrevista.id_entrevista_fk = tblEntrevista.id_entrevista INNER JOIN tblStatusEntrevista ON tblCandidatoEntrevista.FormaEnc = tblStatusEntrevista.id_statusEntrevista ON tblCandidatoOrientado_1.id_candidato_fk = tblCandidatoEntrevista.id_cadidato_fk WHERE (tblCandidatoEntrevista.id_entrevista_fk = @id_entrevista)" 
                                                InsertCommand="INSERT INTO tblCandidatoOrientado(id_candidato_fk, id_aptoEncam, id_entrevista_fk, id_statusOrient, orientacaocandidato) VALUES (@id_candidato_fk, @id_aptoEncam, @id_entrevista_fk, @id_statusOrient, @orientacaocandidato)" 
                                                
                                                
        
        UpdateCommand="UPDATE tblCandidatoOrientado SET orientacaocandidato = @orientacaocandidato, id_candidato_fk = @id_candidato_fk, id_aptoEncam = @id_aptoencam, id_entrevista_fk = @id_entrevista_fk, id_statusOrient = @id_statusorient WHERE (id_candidatoOrient = @id_candidatoorient)" 
        DeleteCommand="DELETE FROM tblCandidatoOrientado WHERE (id_candidato_fk = @id_candidato_fk)">
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
                                                        
                                            </span></span></span>
  
    <br />
                <span lang="pt-br">

        <span class="style23" lang="pt-br"><span class="style34">
                                    <asp:ImageButton ID="ImageButton17" 
        runat="server" ImageAlign="Middle" 
                                        
        ImageUrl="~/clickoportunidades/icones/Standard/imprimir.jpg" 
        onclientclick="printdiv('div_print2');" />
                                    &nbsp;</span><asp:Label ID="Label252" 
        runat="server" Text="Imprimir lista de candidatos orientados"></asp:Label>
    </span>
                                </span>
  
    </form>
</body>
</html>
