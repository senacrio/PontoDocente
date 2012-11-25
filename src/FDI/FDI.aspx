<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FDI.aspx.vb" Inherits="FDI" Theme="FDI"%>

<%@ Register assembly="AspNetMaskedEdit" namespace="AspNetMaskedEdit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de projetos</title>
      <link href="projeto.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function txtBoxFormat(objField, sMask, evtKeyPress) {
        var i, nCount, sValue, fldLen, mskLen, bolMask, sCod, nTecla;
        if (document.all) { // Internet Explorer
            nTecla = evtKeyPress.keyCode;
        } else if (document.layers) { // Nestcape
            nTecla = evtKeyPress.which;
        }

        sValue = objField.value;
        // Limpa todos os caracteres de formatação que
        // já estiverem no campo.
        sValue = sValue.toString().replace("-", "");
        sValue = sValue.toString().replace("-", "");
        sValue = sValue.toString().replace(".", "");
        sValue = sValue.toString().replace(".", "");
        sValue = sValue.toString().replace("/", "");
        sValue = sValue.toString().replace("/", "");
        sValue = sValue.toString().replace("(", "");
        sValue = sValue.toString().replace("(", "");
        sValue = sValue.toString().replace(")", "");
        sValue = sValue.toString().replace(")", "");
        sValue = sValue.toString().replace(":", "");
        sValue = sValue.toString().replace(" ", "");
        fldLen = sValue.length;
        mskLen = sMask.length;

        i = 0;
        nCount = 0;
        sCod = "";
        mskLen = fldLen;

        while (i <= mskLen) {
            bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ":") || (sMask.charAt(i) == ".") || (sMask.charAt(i) == "/"));
            bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " "));

            if (bolMask) {
                sCod += sMask.charAt(i);
                mskLen++;
            } else {
                sCod += sValue.charAt(nCount);
                nCount++;
            }
            i++;
        }
        objField.value = sCod.substring(0, sMask.length);
        // alert('objField.value.length -> ' + objField.value.length + '\nsMask.length -> ' + sMask.length + '\nsMask -> ' + sMask);
        if (objField.value.length >= sMask.length) /* completou a mascara */
            return false;
        if (nTecla != 8) { // backspace
            if (sMask.charAt(i - 1) == "9") { // apenas números...
                return ((nTecla > 47) && (nTecla < 58)); // números de 0 a 9
            } else { // qualquer caracter...
                return true;
            }
        } else {
            return true;
        }
    }              

             
             function formataMoedaeSoma(objTextBox, SeparadorMilesimo, SeparadorDecimal, e) {
                 var sep = 0;
                 var key = '';
                 var i = j = 0;
                 var len = len2 = 0;
                 var strCheck = '0123456789';
                 var aux = aux2 = '';
                 var whichCode = (window.Event) ? e.which : e.keyCode;
                 // 13=enter, 8=backspace as demais retornam 0(zero)
                 // whichCode==0 faz com que seja possivel usar todas as teclas como delete, setas, etc    
                 if ((whichCode == 13) || (whichCode == 0) || (whichCode == 8))
                     return true;
                 key = String.fromCharCode(whichCode); // Valor para o código da Chave


                 if (strCheck.indexOf(key) == -1)
                     return false; // Chave inválida
                 len = objTextBox.value.length;
                 for (i = 0; i < len; i++)
                     if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorDecimal))
                     break;
                 aux = '';
                 for (; i < len; i++)
                     if (strCheck.indexOf(objTextBox.value.charAt(i)) != -1)
                     aux += objTextBox.value.charAt(i);
                 aux += key;
                 len = aux.length;
                 if (len == 0)
                     objTextBox.value = '';
                 if (len == 1)
                     objTextBox.value = '0' + SeparadorDecimal + '0' + aux;
                 if (len == 2)
                     objTextBox.value = '0' + SeparadorDecimal + aux;
                 if (len > 2) {
                     aux2 = '';
                     for (j = 0, i = len - 3; i >= 0; i--) {
                         if (j == 3) {
                             aux2 += SeparadorMilesimo;
                             j = 0;
                         }
                         aux2 += aux.charAt(i);
                         j++;
                     }
                     objTextBox.value = '';
                     len2 = aux2.length;
                     for (i = len2 - 1; i >= 0; i--)
                         objTextBox.value += aux2.charAt(i);
                     objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
                 }
                 soma();

                 document.getElementById('curvalorinvestimento').value = float2moeda(document.getElementById('curvalorinvestimento').value.replace('.','').replace(',', '.'));
                
                 
                 return false;
             }

             function LimpaZero(obj) {
                   
                 if (obj.value == "") {
                    
                     obj.value="0,00"
                     
                 }
                 
             }
             function float2moeda(num) {
                 
                 x = 0;

                 if (num < 0) {
                     num = Math.abs(num);
                     x = 1;
                 } if (isNaN(num)) num = "0";
                 cents = Math.floor((num * 100 + 0.5) % 100);

                 num = Math.floor((num * 100 + 0.5) / 100).toString();

                 if (cents < 10) cents = "0" + cents;
                 for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
                     num = num.substring(0, num.length - (4 * i + 3)) + '.'
               + num.substring(num.length - (4 * i + 3)); ret = num + ',' + cents; if (x == 1) ret = ' - ' + ret;


                 
               
               return ret;
               
             }
             function formataMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e) {
                
                 var sep = 0;
                 var key = '';
                 var i = j = 0;
                 var len = len2 = 0;
                 var strCheck = '0123456789';
                 var aux = aux2 = '';
                 var whichCode = (window.Event) ? e.which : e.keyCode;
                 // 13=enter, 8=backspace as demais retornam 0(zero)
                 // whichCode==0 faz com que seja possivel usar todas as teclas como delete, setas, etc    
                 if ((whichCode == 13) || (whichCode == 0) || (whichCode == 8))
                     return true;
                 key = String.fromCharCode(whichCode); // Valor para o código da Chave


                 if (strCheck.indexOf(key) == -1)
                     return false; // Chave inválida
                 len = objTextBox.value.length;
                 for (i = 0; i < len; i++)
                     if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorDecimal))
                     break;
                 aux = '';
                 for (; i < len; i++)
                     if (strCheck.indexOf(objTextBox.value.charAt(i)) != -1)
                     aux += objTextBox.value.charAt(i);
                 aux += key;
                 len = aux.length;
                 if (len == 0)
                     objTextBox.value = '';
                 if (len == 1)
                     objTextBox.value = '0' + SeparadorDecimal + '0' + aux;
                 if (len == 2)
                     objTextBox.value = '0' + SeparadorDecimal + aux;
                 if (len > 2) {
                     aux2 = '';
                     for (j = 0, i = len - 3; i >= 0; i--) {
                         if (j == 3) {
                             aux2 += SeparadorMilesimo;
                             j = 0;
                         }
                         aux2 += aux.charAt(i);
                         j++;
                     }
                     objTextBox.value = '';
                     len2 = aux2.length;
                     for (i = len2 - 1; i >= 0; i--)
                         objTextBox.value += aux2.charAt(i);
                     objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
                 }
                 
                 return false;
             }

             function formataMilhar(objTextBox, SeparadorMilesimo, SeparadorDecimal, e) {

                 var sep = 0;
                 var key = '';
                 var i = j = 0;
                 var len = len2 = 0;
                 var strCheck = '0123456789';
                 var aux = aux2 = '';
                 var whichCode = (window.Event) ? e.which : e.keyCode;
                 // 13=enter, 8=backspace as demais retornam 0(zero)
                 // whichCode==0 faz com que seja possivel usar todas as teclas como delete, setas, etc    
                 if ((whichCode == 13) || (whichCode == 0) || (whichCode == 8))
                     return true;
                 key = String.fromCharCode(whichCode); // Valor para o código da Chave


                 if (strCheck.indexOf(key) == -1)
                     return false; // Chave inválida
                 len = objTextBox.value.length;
                 for (i = 0; i < len; i++)
                     if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorDecimal))
                     break;
                 aux = '';
                 for (; i < len; i++)
                     if (strCheck.indexOf(objTextBox.value.charAt(i)) != -1)
                     aux += objTextBox.value.charAt(i);
                 aux += key;
                 len = aux.length;
                 if (len == 0)
                     objTextBox.value = '';
                 if (len == 1)
                     objTextBox.value = '0' + SeparadorDecimal + '0' + aux;
                 if (len == 2)
                     objTextBox.value = '0' + SeparadorDecimal + aux;
                 if (len > 2) {
                     aux2 = '';
                     for (j = 0, i = len - 3; i >= 0; i--) {
                         if (j == 3) {
                             aux2 += SeparadorMilesimo;
                             j = 0;
                         }
                         aux2 += aux.charAt(i);
                         j++;
                     }
                     objTextBox.value = '';
                     len2 = aux2.length;
                     for (i = len2 - 1; i >= 0; i--)
                         objTextBox.value += aux2.charAt(i);
                     objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
                 }

             }
             function soma() {

                 var valorSESC
                 if (document.getElementById('curvalorSESC').value == "") {

                   valorSESC=0
                 }
                 else {
                     valorSESC = document.getElementById('curvalorSESC').value
                 };


                 var valorSENAC
                 if (document.getElementById('curvalorSENAC').value=="") {
                       valorSENAC = 0
                 } else {
                 valorSENAC = document.getElementById('curvalorSENAC').value
                 };


                 var valorFECOMERCIO


                 if (document.getElementById('curvalorfecomercio').value == "") {
                   valorFECOMERCIO = 0
               } else {

               valorFECOMERCIO = document.getElementById('curvalorfecomercio').value
                  };


                  var valorFINANCExterno

                  if (document.getElementById('curfinancexterno').value == "") {
                          valorFINANCExterno=0
                  } else {
                  valorFINANCExterno = document.getElementById('curfinancexterno').value
                  
                  };



                  var total = (parseFloat(valorSESC.replace('.', '').replace('.', '').replace('.', '').replace(',', '.')) +
                                parseFloat(valorSENAC.replace('.', '').replace('.', '').replace('.', '').replace(',', '.')) +
                                parseFloat(valorFECOMERCIO.replace('.', '').replace('.', '').replace('.', '').replace(',', '.')) +
                                parseFloat(valorFINANCExterno.replace('.', '').replace('.', '').replace('.', '').replace(',', '.'))).toFixed(2)


                  
                             
                  document.getElementById('curvalorinvestimento').value = total.replace('.',',')
                 
                
                              }


                                     
             
         </script>


    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            width: 65px;
        }
        .style5
        {
        }
        .style6
        {
            width: 407px;
        }
        .style7
        {
            width: 139px;
        }
        .style11
        {
            width: 59px;
        }
        .style12
        {
            width: 95px;
        }
        .style9
        {
            width: 148px;
        }
        .style10
        {
            width: 256px;
        }
        .style14
        {
            width: 132px;
        }
        .style15
        {
            width: 69px;
        }
        .style16
        {
            width: 98px;
        }
        .style17
        {
            width: 149px;
        }
        .style18
        {
            width: 666px;
            height: 17px;
        }
        .style19
        {
            width: 98px;
            height: 17px;
        }
        .style20
        {
            width: 148px;
            height: 17px;
        }
        .style24
        {
            width: 118px;
        }
        .style25
        {
            width: 160px;
        }
        .style26
        {
            width: 122px;
        }
        .style23
        {
            width: 221px;
        }
        .style27
        {
            width: 666px;
        }
        </style>



</head>
<body>
    <form id="form1" runat="server">
    <asp:Menu ID="MenuProjeto" runat="server" 
               OnMenuItemClick="MenuProjeto_MenuItemClick" Orientation="Horizontal" 
                BackColor="#B5C7DE" 
        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
        ForeColor="#284E98" StaticSubMenuIndent="" Height="20px">
               <StaticMenuStyle Width="50px" />
               <StaticSelectedStyle BackColor="#507CD1" />
               <StaticMenuItemStyle Width="110px" HorizontalPadding="5px" ItemSpacing="50px" 
                   VerticalPadding="2px" />
               <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
               <DynamicMenuStyle BackColor="#B5C7DE" />
               <DynamicSelectedStyle BackColor="#507CD1" />
               <DynamicMenuItemStyle VerticalPadding="2px" />
               <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
               <Items>
                   <asp:MenuItem Text="Iniciativa" ToolTip="Cadastro/Alteração da Iniciativa " Value="0" 
                       ImageUrl="~/Icones/projeto.png">
                   </asp:MenuItem>
                   <asp:MenuItem Text="Detalhe" ToolTip="Detalhe da Iniciativa" Value="1" 
                       ImageUrl="~/Icones/detalhe.png">
                   </asp:MenuItem>
                   <asp:MenuItem ImageUrl="~/Icones/unidade.png" Text="Unidades Envolvidas" 
                       ToolTip="Unidades Envolvidas" Value="4"></asp:MenuItem>
                   <asp:MenuItem Text="Núcleo/Áreas Envolvidas" 
                       ToolTip="Núcleo/Áreas Envolvidas " Value="2" 
                       ImageUrl="~/Icones/envolvidos.png"></asp:MenuItem>
                   <asp:MenuItem Text="Entradas/Saídas" ToolTip="Entradas/Saídas da Iniciativa" Value="3" 
                       ImageUrl="~/Icones/retorno.png">
                   </asp:MenuItem>
               </Items>
           </asp:Menu>
    <div id="divPrincipal">
           
           &nbsp;<br />
           <table class="style1">
               <tr>
                   <td class="style24">
                       <asp:Label ID="lblEmpresa" runat="server" EnableTheming="False" ForeColor="#0066CC" 
                           Text="Empresa solicitante:"></asp:Label>
                   </td>
                   <td class="style5" colspan="2">
                       <asp:DropDownList ID="DDL_Empresa" runat="server" AutoPostBack="True" 
                           DataSourceID="SqlEmpresa" DataTextField="Empresa" DataValueField="Id_Empresa" 
                           Width="630px" Enabled="False">
                       </asp:DropDownList>
                                  </td>
                   <td align="right" valign="middle">
                       &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Versão: 1.7" 
                           Font-Bold="True" Font-Size="Medium"></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td class="style24">
                       <asp:Label ID="lblIniciativa" runat="server" EnableTheming="False" ForeColor="#0066CC" 
                           Text="Iniciativa:"></asp:Label>
                   </td>
                   <td class="style7">
           <asp:TextBox ID="txtId_Iniciativa1" runat="server" ReadOnly="True" 
               style="text-align: left" BackColor="#D7DFDF" Width="173px" Font-Bold="False" 
                           ForeColor="#3366CC"></asp:TextBox>
                                  </td>
                   <td class="style6">
                                  <asp:TextBox ID="txtTituloIniciativa1" runat="server" 
               Width="445px" ReadOnly="True" style="text-align: left" BackColor="#D7DFDF" 
                           Font-Bold="False" ForeColor="#3366CC"></asp:TextBox>
           
                   </td>
                   <td>
                       <asp:ImageButton ID="botaoIncluir" runat="server" 
                           ImageUrl="~/Icones/001_03.gif" CssClass="botao" 
                           ToolTip="Incluir nova iniciativa" Height="25px" Width="25px" />
           
                   </td>
               </tr>
               </table>
           <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
               ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
               SelectCommand="SELECT [Id_Empresa], [Nome_Empresa] as Empresa, [CNPJ], [Endereco], [Cidade], [UF] FROM [fdiEmpresa] where [ID_EMPRESA]=@Id_Empresa">
                
               <SelectParameters >
               <asp:SessionParameter Name="Id_Empresa" SessionField="EmpresaGlobal" />
               
               </SelectParameters>
               
               
           </asp:SqlDataSource>
          
           <asp:SqlDataSource ID="sqlStatus" runat="server" 
               ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" SelectCommand="SELECT Status, Sigla_Status FROM fdiStatus WHERE (Sigla_Status = 'ED') OR (Sigla_Status = 'SL')" 
               
               UpdateCommand="UPDATE fdiIniciativa SET Status = @Status WHERE (id_Iniciativa = @id_Iniciativa) AND (id_Empresa = @id_empresa)">
               <UpdateParameters>
                   <asp:ControlParameter ControlID="DDLStatus" Name="Status" 
                       PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_Iniciativa" 
                       PropertyName="SelectedValue" />
                   <asp:SessionParameter Name="id_empresa" SessionField="id_empresa" />
               </UpdateParameters>
           </asp:SqlDataSource>
          
          <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
               <asp:View ID="View1" runat="server">
                   <asp:Panel ID="Panel10" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Cadastro da Iniciativa" ToolTip="Incluir nova Iniciativa" 
                       Width="919px">
                       <table class="style1">
                           <tr>
                               <td class="style24">
                                   <asp:Label ID="lblstatus" runat="server" EnableTheming="False" 
                                       ForeColor="#0066CC" Text="Status:"></asp:Label>
                               </td>
                               <td class="style7">
                                   <asp:DropDownList ID="DDLStatus" runat="server" DataSourceID="sqlStatus" 
                                       DataTextField="Status" DataValueField="Sigla_Status" Enabled="False">
                                   </asp:DropDownList>
                               </td>
                               <td class="style6">
                                   <asp:ImageButton ID="BtnAlteraStatusAprovacao" runat="server" CssClass="botao" 
                                       Enabled="False" EnableTheming="False" Height="25px" 
                                       ImageUrl="~/Icones/001_06.gif" 
                                       onclientclick="javascript: var atualizar = confirm( &quot;Você deseja alterar o status da iniciativa?&quot; );if ( atualizar == true ) {} else {return false;}" 
                                       ToolTip="Altera o status da iniciativa selecionada." Width="25px" />
                               </td>
                               <td>
                                   &nbsp;</td>
                           </tr>
                       </table>
                       <br />
                       <asp:Label ID="lblmensagemProjeto0" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300"></asp:Label>
                       <br />
                       <br />
                       &nbsp;<asp:Label ID="LabelMatric" runat="server" Text="Matric" Visible="False"></asp:Label>
                       &nbsp;<asp:Label ID="LabelUnidLotac" runat="server" Text="UnidLotac" Visible="False"></asp:Label>
                       <asp:GridView ID="GridViewIniciativa" runat="server" AllowPaging="True" 
                           AllowSorting="True" AutoGenerateColumns="False" 
                           DataKeyNames="id_Iniciativa,id_Empresa,Codigo,ValorInvestimento,nMesesSaida,nMesesEntrada,SENAC,SESC,FECOMERCIO,Sigla_Status,ClienteAlvo,TaxaSelic" 
                           DataSourceID="SqlGridIniciativa" Width="900px">
                           <Columns>
                               <asp:CommandField ButtonType="Image" 
                                   SelectImageUrl="~/Icones/grid_selecionar.gif" ShowSelectButton="True">
                               <HeaderStyle HorizontalAlign="Left" />
                               <ItemStyle Width="10px" />
                               </asp:CommandField>
                               <asp:BoundField DataField="id_Iniciativa" HeaderText="id_Iniciativa" 
                                   ReadOnly="True" SortExpression="id_Iniciativa" Visible="False">
                               <HeaderStyle HorizontalAlign="Left" />
                               </asp:BoundField>
                               <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                                   SortExpression="Codigo" />
                               <asp:BoundField DataField="Nome_Empresa" HeaderText="Empresa" 
                                   SortExpression="Nome_Empresa">
                               <HeaderStyle HorizontalAlign="Left" />
                               </asp:BoundField>
                               <asp:BoundField DataField="TituloIniciativa" HeaderText="Título" 
                                   SortExpression="TituloIniciativa">
                               <HeaderStyle HorizontalAlign="Left" />
                               </asp:BoundField>
                               <asp:BoundField DataField="Nome_Solicitante" HeaderText="Solicitante" 
                                   SortExpression="Nome_Solicitante">
                               <HeaderStyle HorizontalAlign="Left" />
                               </asp:BoundField>
                               <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status">
                               <HeaderStyle HorizontalAlign="Left" />
                               </asp:BoundField>
                               <asp:TemplateField ShowHeader="False">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                           CommandName="Delete" ImageUrl="~/Icones/excluir.png" Text="Delete" 
                                           Visible='<%# Bind("desabilita_delete") %>' />
                                   </ItemTemplate>
                                   <ItemStyle Width="10px" />
                               </asp:TemplateField>
                           </Columns>
                           <EmptyDataTemplate>
                               Nenhuma iniciativa cadastrada para a empresa selecionada
                           </EmptyDataTemplate>
                       </asp:GridView>
                       <br />
                       <br />
                       <br />
                   </asp:Panel>
                  <asp:SqlDataSource ID="SqlGridIniciativa" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                      
                      SelectCommand="SELECT fdiIniciativa.id_Iniciativa, fdiIniciativa.TituloIniciativa, CASE WHEN dbo.fdiIniciativa.id_Iniciativa IN (SELECT id_Iniciativa FROM dbo.fdiAreaIniciativa WHERE dbo.fdiAreaIniciativa.id_Iniciativa = fdiIniciativa.id_Iniciativa AND dbo.fdiAreaIniciativa.id_Empresa = fdiIniciativa.id_Empresa) OR dbo.fdiIniciativa.id_Iniciativa IN (SELECT id_Iniciativa FROM dbo.fdiReceitasDespesas WHERE dbo.fdiReceitasDespesas.id_Iniciativa = fdiIniciativa.id_Iniciativa AND dbo.fdiReceitasDespesas.id_Empresa = fdiIniciativa.id_Empresa) THEN 'False' ELSE 'True' END AS desabilita_delete, fdiIniciativa.DescricaoIniciativa, fdiIniciativa.ObjetivoIniciativa, fdiIniciativa.BeneficiosEsperadosIniciativa, fdiIniciativa.id_Solicitante, fdiIniciativa.id_AreaSolicitante, fdiIniciativa.id_Empresa, fdiIniciativa.id_TaxaSelic, fdiIniciativa.ValorInvestimento, fdiIniciativa.FinancExterno, fdiIniciativa.VPL, fdiIniciativa.TIR, fdiIniciativa.DescricaoTIR, fdiIniciativa.PayBack, fdiIniciativa.EsforcoMeses, fdiIniciativa.EsforcoHora, fdiIniciativa.DataHoraCriacao, fdiIniciativa.UsuarioCriacao, fdiIniciativa.NrPessoasEnvolvidas, fdiIniciativa.FlagInstitucional, fdiIniciativa.FlagDesenvOrgan, fdiIniciativa.FlagInovacao, fdiEmpresa.Nome_Empresa, fdiSolicitante.Matric_Solicitante, fdiSolicitante.Nome_Solicitante, fdiArea.Area, fdiStatus.Status, fdiIniciativa.Codigo, fdiIniciativa.nMesesSaida, fdiIniciativa.nMesesEntrada, fdiIniciativa.SENAC, fdiIniciativa.SESC, fdiIniciativa.FECOMERCIO, fdiStatus.Sigla_Status, fdiCliente.ClienteAlvo, fdiIniciativa.TaxaSelic FROM fdiCliente RIGHT OUTER JOIN fdiStatus INNER JOIN fdiIniciativa INNER JOIN fdiSolicitante ON fdiIniciativa.id_Solicitante = fdiSolicitante.id_Solicitante AND fdiIniciativa.id_Empresa = fdiSolicitante.Id_Empresa ON fdiStatus.Sigla_Status = fdiIniciativa.Status INNER JOIN fdiEmpresa ON fdiIniciativa.id_Empresa = fdiEmpresa.Id_Empresa ON fdiCliente.id_clientealvo = fdiIniciativa.id_clientealvo LEFT OUTER JOIN fdiArea ON fdiIniciativa.id_AreaSolicitante = fdiArea.Id_Area AND fdiIniciativa.id_Empresa = fdiArea.Id_Empresa WHERE (fdiIniciativa.id_Empresa = (CASE WHEN @Id_Empresa = 1 THEN fdiIniciativa.id_Empresa ELSE @Id_Empresa END)) AND (fdiIniciativa.UsuarioCriacao = @UsuarioCriacao) ORDER BY fdiIniciativa.Codigo DESC" 
                      
                      
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       DeleteCommand="DELETE FROM fdiIniciativa WHERE (id_Iniciativa = @id_Iniciativa)">
                      <SelectParameters>
                          <asp:SessionParameter Name="Id_Empresa" SessionField="EmpresaGlobal" 
                              Type="Int32" />
                          <asp:SessionParameter Name="UsuarioCriacao" SessionField="c_Nome" 
                              Type="String" />
                      </SelectParameters>
                      <DeleteParameters>
                          <asp:Parameter Name="id_Iniciativa" />
                      </DeleteParameters>
                  </asp:SqlDataSource>
                 
              </asp:View>
              <asp:View ID="View3" runat="server">
              
                  <asp:Panel ID="Panel18" runat="server">
                      <asp:MultiView ID="MultiView3" runat="server" ActiveViewIndex="0">
                          <asp:View ID="ViewDetalhes" runat="server">
                              <fieldset style="font-size: 12px; font-family: Verdana">
                                  <legend>Cadastro da Iniciativa - Detalhes</legend>
                                  <asp:ImageButton ID="botaoVoltar1" runat="server" CausesValidation="False" 
                                      Height="25px" ImageUrl="~/Icones/voltar.jpg" 
                                      ToolTip="Voltar para página principal" Width="25px" />
                                  &nbsp;<asp:Label ID="Label1" runat="server" Text="Voltar"></asp:Label>
                                  <br />
                                  <asp:Label ID="lblmensagemProjeto1" runat="server" EnableTheming="False" 
                                      ForeColor="#CC3300"></asp:Label>
                                  <br />
                                  <table>
                                      <tr>
                                          <td>
                                              <asp:Label ID="lblSolicitante" runat="server" Text="Solicitante:" Width="150px"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:DropDownList ID="cboid_Solicitante" runat="server" 
                                                  DataSourceID="SqlSolicitante" DataTextField="Nome_Solicitante" 
                                                  DataValueField="id_Solicitante" Enabled="False" Width="570px">
                                              </asp:DropDownList>
                                              &nbsp;</td>
                                          <td>
                                              <asp:ImageButton ID="btnIncluirSolicitante" runat="server" 
                                                  CausesValidation="False" Height="20px" ImageUrl="~/Icones/grid_adicionar.gif" 
                                                  ToolTip="Incluir Solicitante" Visible="False" Width="20px" />
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Label ID="lblSolicitante0" runat="server" Text="Unidade Solicitante:" 
                                                  Width="150px"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:DropDownList ID="cboidUnidadeSolicitante" runat="server" 
                                                  DataSourceID="sqlUnidade0" DataTextField="Unidade" 
                                                  DataValueField="Id_Unidade" Width="570px" AutoPostBack="True">
                                              </asp:DropDownList>
                                          </td>
                                          <td>
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Label ID="lblAreaSolicitante" runat="server" 
                                                  Text="Núcleo/Área Solicitante:" Width="150px"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:DropDownList ID="cboid_AreaSolicitante" runat="server" 
                                                  DataSourceID="SqlArea" DataTextField="Área" 
                                                  DataValueField="Id_Area" Width="570px" AutoPostBack="True">
                                              </asp:DropDownList>
                                          </td>
                                          <td>
                                              <asp:RequiredFieldValidator ID="RqCodigo14" runat="server" 
                                                  ControlToValidate="cboid_AreaSolicitante" ErrorMessage="(*)" 
                                                  SetFocusOnError="True" ValidationGroup="iniciativa" Width="120px" 
                                                  Enabled="False"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Label ID="lblEmpresasEnvolvidas" runat="server" 
                                                  Text="Empresas Envolvidas:" Width="150px"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:CheckBox ID="chksenac" runat="server" AutoPostBack="True" Text="SENAC" />
                                              &nbsp;<asp:CheckBox ID="chksesc" runat="server" AutoPostBack="True" Text="SESC" />
                                              &nbsp;<asp:CheckBox ID="chkfecomercio" runat="server" AutoPostBack="True" 
                                                  Text="FECOMÉRCIO" />
                                          </td>
                                          <td>
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Label ID="lblTituloIniciativa" runat="server" Text="Título da Iniciativa:" 
                                                  Width="150px"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:TextBox ID="txtTituloIniciativa" runat="server" MaxLength="80" 
                                                  Width="300px"></asp:TextBox>
                                          </td>
                                          <td>
                                              <asp:RequiredFieldValidator ID="RqCodigo10" runat="server" 
                                                  ControlToValidate="txtTituloIniciativa" ErrorMessage="(*)" 
                                                  ValidationGroup="iniciativa" Width="120px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Label ID="lblDescricaoIniciativa" runat="server" 
                                                  Text="Descrição da Iniciativa:" Width="150px"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:TextBox ID="txtDescricaoIniciativa" runat="server" EnableTheming="False" 
                                                  MaxLength="250" Rows="5" TextMode="MultiLine" Width="570px"></asp:TextBox>
                                          </td>
                                          <td>
                                              <asp:RequiredFieldValidator ID="RqCodigo16" runat="server" 
                                                  ControlToValidate="txtDescricaoIniciativa" ErrorMessage="(*)" 
                                                  ValidationGroup="iniciativa" Width="120px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Label ID="lblObjetivoIniciativa" runat="server" 
                                                  Text="Objetivo da Iniciativa:" Width="150px"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:TextBox ID="txtObjetivoIniciativa" runat="server" EnableTheming="False" 
                                                  Rows="5" TextMode="MultiLine" Width="570px"></asp:TextBox>
                                          </td>
                                          <td>
                                              <asp:RequiredFieldValidator ID="RqCodigo11" runat="server" 
                                                  ControlToValidate="txtObjetivoIniciativa" ErrorMessage="(*)" 
                                                  ValidationGroup="iniciativa" Width="120px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              <asp:Label ID="lblBeneficiosEsperadosIniciativa" runat="server" 
                                                  Text="Benefícios Esperados:" Width="150px"></asp:Label>
                                          </td>
                                          <td style="margin-left: 40px">
                                              <asp:TextBox ID="txtBeneficiosEsperadosIniciativa" runat="server" 
                                                  EnableTheming="False" Rows="5" TextMode="MultiLine" Width="570px"></asp:TextBox>
                                          </td>
                                          <td>
                                              <asp:RequiredFieldValidator ID="RqCodigo12" runat="server" 
                                                  ControlToValidate="txtBeneficiosEsperadosIniciativa" 
                                                  ErrorMessage="(*)" ValidationGroup="iniciativa" Width="120px" 
                                                  SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <caption>
                                          <tr>
                                              <td>
                                                  <asp:Label ID="lblPessoas" runat="server" Text="Nr.Pessoas Envolvidas:" 
                                                      Width="150px"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:TextBox ID="txtNrPessoasEnvolvidas" runat="server" Width="60px"></asp:TextBox>
                                                  <ajaxToolkit:FilteredTextBoxExtender ID="NrPessoasEnvolvidas_FilteredTextBoxExtender" 
                                                      runat="server" Enabled="True" FilterType="Numbers" 
                                                      TargetControlID="txtNrPessoasEnvolvidas">
                                                  </ajaxToolkit:FilteredTextBoxExtender>
                                              </td>
                                              <td>
                                                  <asp:RequiredFieldValidator ID="RqCodigo17" runat="server" 
                                                      ControlToValidate="txtNrPessoasEnvolvidas" ErrorMessage="(*)" 
                                                      ValidationGroup="iniciativa" Width="120px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td>
                                                  <asp:Label ID="lblPessoas0" runat="server" Text="Cliente Alvo:" Width="150px"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:DropDownList ID="cboid_clientealvo" runat="server" 
                                                      DataSourceID="sqlClienteAlvo" DataTextField="ClienteAlvo" 
                                                      DataValueField="id_clientealvo" Width="570px" AutoPostBack="True">
                                                  </asp:DropDownList>
                                              </td>
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td>
                                                  <asp:Label ID="lblDescricaoClienteAlvo" runat="server" 
                                                      Text="Descrição Cliente Alvo:" Width="150px"></asp:Label>
                                              </td>
                                              <td colspan="1">
                                                  <asp:TextBox ID="txtDescClienteAlvo" runat="server" EnableTheming="False" 
                                                      Rows="5" TextMode="MultiLine" Width="570px"></asp:TextBox>
                                              </td>
                                              <td>
                                                  <asp:RequiredFieldValidator ID="RqCodigo18" runat="server" 
                                                      ControlToValidate="txtDescClienteAlvo" ErrorMessage="(*)" 
                                                      ValidationGroup="iniciativa" Width="120px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td>
                                                  <asp:Label ID="lblDescricaoClienteAlvo0" runat="server" 
                                                      Text="Cliente Secundário:" Width="150px"></asp:Label>
                                              </td>
                                              <td colspan="2">
                                                  <div style="border-style: solid; border-width: 1px; width: 570px;">
                                                      <asp:Label ID="lblgoverno" runat="server" EnableTheming="False" Text="Governo:"></asp:Label>
                                                      <asp:CheckBox ID="chkflagGovPrefeituras" runat="server" Text="Prefeituras" />
                                                      &nbsp;&nbsp;&nbsp;&nbsp;
                                                      <asp:CheckBox ID="chkflagGovSecretarias" runat="server" Text="Secretarias" />
                                                      &nbsp;&nbsp;&nbsp;&nbsp;
                                                      <asp:CheckBox ID="chkflagGovEmpPublicas" runat="server" 
                                                          Text="Empresas Públicas" />
                                                      &nbsp;<asp:CheckBox ID="chkflagGovOutros" runat="server" Text="Outros" />
                                                  </div>
                                                  <div style="border-style: solid; border-width: 1px; width: 570px;">
                                                      <asp:Label ID="lblgoverno0" runat="server" EnableTheming="False" 
                                                          ForeColor="White" Text="Governo:"></asp:Label>
                                                      <asp:CheckBox ID="chkflagSindicatos" runat="server" Text="Sindicatos" />
                                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkflagSistemas" runat="server" Text="Sistema S" />
                                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                      <asp:CheckBox ID="chkflagEmpOrganizadas" runat="server" 
                                                          Text="Empresas Organizadas (Filiadas aos Sindicatos)" />
                                                      &nbsp;<br />
                                                      <asp:Label ID="lbltercsetor" runat="server" EnableTheming="False" 
                                                          ForeColor="White" Text="Governo:"></asp:Label>
                                                      <asp:CheckBox ID="chkflagTercSetor" runat="server" Text="Terceiro Setor" />
                                                      <asp:CheckBox ID="chkflagClienteInterno" runat="server" 
                                                          Text="Cliente Interno" />
                                                      <asp:CheckBox ID="chkflagInicPrivada" runat="server" 
                                                          Text="Iniciativa Privada" />
                                                      &nbsp;&nbsp;
                                                      <asp:CheckBox ID="chkflagPublicoGeral" runat="server" Text="Público Geral" />
                                                  </div>
                                              </td>
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td>
                                                  <asp:Label ID="lblDescricaoClienteSec" runat="server" 
                                                      Text="Descrição Cliente Secundário:" Width="150px"></asp:Label>
                                              </td>
                                              <td colspan="1">
                                                  <asp:TextBox ID="txtDescClienteSec" runat="server" EnableTheming="False" 
                                                      Rows="5" TextMode="MultiLine" Width="570px"></asp:TextBox>
                                              </td>
                                              <td>
                                                  <asp:RequiredFieldValidator ID="RqCodigo19" runat="server" 
                                                      ControlToValidate="txtDescClienteSec" ErrorMessage="(*)" 
                                                      ValidationGroup="iniciativa" Width="120px" SetFocusOnError="True" 
                                                      Enabled="False"></asp:RequiredFieldValidator>
                                              </td>
                                          </tr>
                                      </caption>
                                  </table>
                                  <br />
                                  <br />
                                  <br />
                                  <asp:Label ID="LabelIniciativa" runat="server" EnableTheming="False" 
                                      Font-Bold="True" Font-Size="Medium" Text="Tipo de Iniciativa"></asp:Label>
                                  <br />
                                  <br />
                                  <asp:CheckBox ID="chkFlagInstitucional" runat="server" Font-Size="X-Small" 
                                      Text="Institucional (financeiros ou não que resultam também em visibilidade para o sistema. Ex: retorno de imagem, político e aspecto regulamentar)." 
                                      
                                      ToolTip="Institucional (financeiros ou não que resultam também em visibilidade para o sistema. Ex: retorno de imagem, político e aspecto regulamentar)." />
                                  &nbsp;<br />
                                  <br />
                                  <asp:CheckBox ID="chkFlagDesenvOrgan" runat="server" Font-Size="X-Small" 
                                      Text="Desenvolvimento Organizacional (financeiros ou não que resultam no desenvolvimento da organização quanto empresa. Ex: engenharia, processos internos, absorção de conhecimento e redução de custos)." 
                                      
                                      ToolTip="Desenvolvimento Organizacional (financeiros ou não que resultam no desenvolvimento da organização quanto empresa. Ex: engenharia, processos internos, absorção de conhecimento e redução de custos)." />
                                  <br />
                                  <br />
                                  <asp:CheckBox ID="chkFlagInovacao" runat="server" Font-Size="X-Small" 
                                      Text="Inovação (financeiros ou não que resultam no desenvolvimento de produtos área fim. Ex: novos produtos PJ e PF, adequação de portfólio, desenvolvimento de pesquisa, programas e novos nichos de atuação)." 
                                      
                                      ToolTip="Inovação (financeiros ou não que resultam no desenvolvimento de produtos área fim. Ex: novos produtos PJ e PF, adequação de portfólio, desenvolvimento de pesquisa, programas e novos nichos de atuação)." />
                                  <br />
                                  <br />
                                  <table>
                                      <tr>
                                          <td class="style25">
                                              <asp:Label ID="lblDescricaoClienteSec0" runat="server" Text="Justiicativa:" 
                                                  Width="150px"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:TextBox ID="txtjustificativa" runat="server" EnableTheming="False" 
                                                  Rows="5" TextMode="MultiLine" Width="570px"></asp:TextBox>
                                          </td>
                                          <td>
                                              <asp:RequiredFieldValidator ID="RqCodigo20" runat="server" 
                                                  ControlToValidate="txtjustificativa" ErrorMessage="(*)" 
                                                  ValidationGroup="iniciativa" Width="120px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="style25">
                                              <asp:Label ID="lblpayback5" runat="server" EnableTheming="True" 
                                                  Text="Esforço em meses:"></asp:Label>
                                          </td>
                                          <td>
                                              <asp:TextBox ID="txtesforcomeses" runat="server"></asp:TextBox>
                                              <ajaxToolkit:FilteredTextBoxExtender ID="esforcomeses_FilteredTextBoxExtender" 
                                                  runat="server" Enabled="True" FilterType="Numbers" 
                                                  TargetControlID="txtesforcomeses">
                                              </ajaxToolkit:FilteredTextBoxExtender>
                                          </td>
                                          <td>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                  ControlToValidate="txtesforcomeses" ErrorMessage="(*)" 
                                                  ForeColor="Black" ValidationGroup="iniciativa" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="style17">
                                              <asp:Label ID="lblpayback6" runat="server" EnableTheming="True" 
                                                  Text="Esforço em horas:"></asp:Label>
                                          </td>
                                          <td class="style16">
                                              <asp:TextBox ID="txtesforcoHORA" runat="server"></asp:TextBox>
                                              <ajaxToolkit:FilteredTextBoxExtender ID="esforcoHORA_FilteredTextBoxExtender" 
                                                  runat="server" Enabled="True" FilterType="Numbers" 
                                                  TargetControlID="txtesforcoHORA">
                                              </ajaxToolkit:FilteredTextBoxExtender>
                                          </td>
                                          <td class="style9">
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                                  ControlToValidate="txtesforcoHORA" ErrorMessage="(*)" 
                                                  ForeColor="Black" ValidationGroup="iniciativa" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="style17">
                                              <asp:Label ID="lblpayback7" runat="server" EnableTheming="True" 
                                                  Text="Prazo para Realização da Iniciativa:"></asp:Label>
                                          </td>
                                          <td class="style16">
                                              <asp:TextBox ID="txtprazoConclusao" runat="server"></asp:TextBox>
                                              <ajaxToolkit:CalendarExtender ID="prazoConclusao_CalendarExtender" 
                                                  runat="server" Enabled="True" TargetControlID="txtprazoConclusao">
                                              </ajaxToolkit:CalendarExtender>
                                          </td>
                                          <td class="style9">
                                              &nbsp;</td>
                                      </tr>
                                  </table>
                                  <br />
                                  <asp:Label ID="lblinvestimento" runat="server" EnableTheming="False" 
                                      Font-Bold="True" Font-Size="Medium" Text="Investimento"></asp:Label>
                                  <br />
                                  <br />
                                  <table class="style1">
                                      <tr>
                                          <td class="style27">
                                              <asp:Label ID="lblvalorsesc" runat="server" EnableTheming="True" Text="SESC:"></asp:Label>
                                          </td>
                                          <td class="style16">
                                              <asp:TextBox ID="curvalorSESC" runat="server" Enabled="False" Height="22px" 
                                                 onBlur="LimpaZero(this);" onKeyPress="return(formataMoedaeSoma(this,'.',',',event));" Width="150px">0,00</asp:TextBox>
                                          </td>
                                          <td class="style9">
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                                  ControlToValidate="curvalorinvestimento" ErrorMessage="(*)" 
                                                  ForeColor="Black" ValidationGroup="iniciativa" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="style27">
                                              <asp:Label ID="lblvalorsenac" runat="server" EnableTheming="True" Text="SENAC:"></asp:Label>
                                          </td>
                                          <td class="style16">
                                              <asp:TextBox ID="curvalorSENAC" runat="server" Enabled="False" Height="22px" 
                                                 onBlur="LimpaZero(this);" onKeyPress="return(formataMoedaeSoma(this,'.',',',event));" Width="150px">0,00</asp:TextBox>
                                          </td>
                                          <td class="style9">
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                                  ControlToValidate="curvalorinvestimento" ErrorMessage="(*)" 
                                                  ForeColor="Black" ValidationGroup="iniciativa" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="style27">
                                              <asp:Label ID="lblvalorsesc1" runat="server" EnableTheming="True" 
                                                  Text="FECOMÉRCIO:"></asp:Label>
                                          </td>
                                          <td class="style16">
                                              <asp:TextBox ID="curvalorFECOMERCIO" runat="server" Enabled="False" 
                                                  Height="22px" onBlur="LimpaZero(this);" onKeyPress="return(formataMoedaeSoma(this,'.',',',event));" 
                                                  Width="150px">0,00</asp:TextBox>
                                          </td>
                                          <td class="style9">
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                                  ControlToValidate="curvalorinvestimento" ErrorMessage="(*)" 
                                                  ForeColor="Black" ValidationGroup="iniciativa" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="style27">
                                              <asp:Label ID="lblfinanexterno0" runat="server" EnableTheming="True" 
                                                  Text="Externo:"></asp:Label>
                                          </td>
                                          <td class="style16">
                                              <asp:TextBox ID="curfinancexterno" runat="server" 
                                                 onBlur="LimpaZero(this);"  onKeyPress="return(formataMoedaeSoma(this,'.',',',event));">0,00</asp:TextBox>
                                          </td>
                                          <td class="style9">
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td class="style27">
                                              <asp:Label ID="lblfinanexterno1" runat="server" EnableTheming="True" 
                                                  Text="Investimento Total:"></asp:Label>
                                          </td>
                                          <td class="style16">
                                              <asp:TextBox ID="curvalorinvestimento" runat="server" BackColor="Silver" 
                                                  Width="150px"></asp:TextBox>
                                          </td>
                                          <td class="style9">
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td class="style27">
                                              <asp:Label ID="lbldescricao0" runat="server" EnableTheming="True" 
                                                  Text="Descrição do Investimento:"></asp:Label>
                                          </td>
                                          <td class="style16">
                                              <asp:TextBox ID="txtdescricaotir" runat="server" EnableTheming="False" 
                                                  Height="84px" TextMode="MultiLine" Width="570px"></asp:TextBox>
                                          </td>
                                          <td class="style9">
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                  ControlToValidate="txtdescricaotir" ErrorMessage="(*)" 
                                                  ForeColor="Black" ValidationGroup="iniciativa" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="style18">
                                              <asp:Label ID="lblpayback3" runat="server" EnableTheming="True" 
                                                  Text="Taxa Selic (%):" Width="100px"></asp:Label>
                                          </td>
                                          <td class="style19">
                                              <asp:TextBox ID="txttaxaselic" runat="server" BackColor="Silver" 
                                                  EnableTheming="False" ForeColor="Black" Width="70px"></asp:TextBox>
                                              &nbsp;</td>
                                          <td class="style20">
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                  ControlToValidate="txttaxaselic" ErrorMessage="(*)" 
                                                  ValidationGroup="iniciativa" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                          </td>
                                      </tr>
                                  </table>
                                  <asp:SqlDataSource ID="sqlUnidade0" runat="server" 
                                      ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                                      
                                      
                                      SelectCommand="SELECT '' AS Unidade, '' AS Id_Empresa, '' AS Id_Unidade UNION SELECT Unidade, Id_Empresa, Id_Unidade FROM fdiUnidade WHERE (Id_Empresa = (CASE WHEN @Id_Empresa = 1 THEN Id_Empresa ELSE @Id_Empresa END)) ORDER BY Id_Unidade">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="Id_Empresa" SessionField="EmpresaGlobal" 
                                              Type="Int32" />
                                      </SelectParameters>
                                  </asp:SqlDataSource>
                                  <br />
                                  <br />
                                  <asp:ScriptManager ID="ScriptManager1" runat="server" 
                                      EnableScriptGlobalization="True">
                                  </asp:ScriptManager>
                                  <asp:SqlDataSource ID="SqlSolicitante" runat="server" 
                                      ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                                      DeleteCommand="DELETE FROM fdiSolicitante WHERE (Id_Empresa = @Id_Empresa) AND (id_Solicitante = @id_Solicitante)" 
                                      InsertCommand="INSERT INTO fdiSolicitante(Matric_Solicitante, Nome_Solicitante, email, Id_Empresa) VALUES (@Matric_Solicitante, @Nome_Solicitante, @email, @Id_Empresa)" 
                                      SelectCommand="SELECT fdiSolicitante.id_Solicitante, fdiSolicitante.Matric_Solicitante, fdiSolicitante.Nome_Solicitante, fdiSolicitante.email, fdiSolicitante.Id_Empresa, fdiEmpresa.Nome_Empresa FROM fdiEmpresa INNER JOIN fdiSolicitante ON fdiEmpresa.Id_Empresa = fdiSolicitante.Id_Empresa WHERE (fdiSolicitante.Id_Empresa = (CASE WHEN @Id_Empresa = 1 THEN fdiSolicitante.Id_Empresa ELSE @Id_Empresa END)) ORDER BY fdiEmpresa.Id_Empresa, fdiSolicitante.Nome_Solicitante" 
                                      UpdateCommand="UPDATE fdiSolicitante SET Matric_Solicitante = @Matric_Solicitante, Nome_Solicitante = @Nome_Solicitante, email = @email   WHERE (Id_Empresa = @Id_Empresa) AND (id_Solicitante = @id_Solicitante)">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="Id_Empresa" SessionField="EmpresaGlobal" 
                                              Type="Int32" />
                                      </SelectParameters>
                                      <DeleteParameters>
                                          <asp:ControlParameter ControlID="GridSolicitante" Name="Id_Empresa" 
                                              PropertyName="SelectedValue" />
                                          <asp:ControlParameter ControlID="GridSolicitante" Name="id_Solicitante" 
                                              PropertyName="SelectedValue" />
                                      </DeleteParameters>
                                      <UpdateParameters>
                                          <asp:ControlParameter ControlID="txtMatric" Name="Matric_Solicitante" 
                                              PropertyName="Text" />
                                          <asp:ControlParameter ControlID="txtNome" Name="Nome_Solicitante" 
                                              PropertyName="Text" />
                                          <asp:ControlParameter ControlID="txtEMail" Name="email" PropertyName="Text" />
                                          <asp:ControlParameter ControlID="GridSolicitante" Name="Id_Empresa" 
                                              PropertyName="SelectedValue" />
                                          <asp:SessionParameter Name="id_Solicitante" SessionField="Id_Solicitante" />
                                      </UpdateParameters>
                                      <InsertParameters>
                                          <asp:ControlParameter ControlID="txtMatric" Name="Matric_Solicitante" 
                                              PropertyName="Text" />
                                          <asp:ControlParameter ControlID="txtNome" Name="Nome_Solicitante" 
                                              PropertyName="Text" />
                                          <asp:ControlParameter ControlID="txtEMail" Name="email" PropertyName="Text" />
                                          <asp:SessionParameter Name="Id_Empresa" SessionField="EmpresaGlobal" />
                                      </InsertParameters>
                                  </asp:SqlDataSource>
                                  <asp:SqlDataSource ID="SqlArea" runat="server" 
                                      ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                                      DeleteCommand="DELETE FROM fdiArea WHERE (Id_Area = @Id_Area)" 
                                      InsertCommand="INSERT INTO fdiArea(Area, Id_Empresa) VALUES (@Area, @Id_Empresa)" 
                                      SelectCommand="SELECT '' AS Área, 0 AS Id_Area, '' AS Area, '' AS Id_Empresa, '' AS Empresa UNION SELECT  fdiArea.Area AS Área, fdiArea.Id_Area, fdiArea.Area, fdiArea.Id_Empresa, fdiEmpresa.Nome_Empresa AS Empresa FROM fdiArea INNER JOIN fdiEmpresa ON fdiArea.Id_Empresa = fdiEmpresa.Id_Empresa WHERE (fdiArea.Id_Empresa = (CASE WHEN @Id_Empresa = 1 THEN fdiArea.Id_Empresa ELSE @Id_Empresa END)) ORDER BY Id_Empresa, Id_Area" 
                                      
                                      
                                      UpdateCommand="UPDATE fdiArea SET Area = @Area, Id_Empresa = @Id_Empresa WHERE (Id_Area = @Id_Area)">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="Id_Empresa" SessionField="EmpresaGlobal" 
                                              Type="Int32" />
                                      </SelectParameters>
                                      <DeleteParameters>
                                          <asp:ControlParameter ControlID="GridArea" Name="Id_Area" 
                                              PropertyName="SelectedValue" />
                                      </DeleteParameters>
                                      <UpdateParameters>
                                          <asp:ControlParameter ControlID="txtNomeArea" Name="Area" PropertyName="Text" />
                                          <asp:SessionParameter Name="Id_Empresa" SessionField="Id_Empresa" />
                                          <asp:ControlParameter ControlID="GridArea" Name="Id_Area" 
                                              PropertyName="SelectedValue" />
                                      </UpdateParameters>
                                      <InsertParameters>
                                          <asp:ControlParameter ControlID="txtNomeArea" Name="Area" PropertyName="Text" />
                                          <asp:ControlParameter ControlID="DDL_Empresa" Name="Id_Empresa" 
                                              PropertyName="SelectedValue" />
                                      </InsertParameters>
                                  </asp:SqlDataSource>
                                  <asp:SqlDataSource ID="sqlClienteAlvo" runat="server" 
                                      ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                                      
                                      SelectCommand="SELECT '' AS ClienteAlvo, '' AS id_clientealvo UNION SELECT ClienteAlvo, id_clientealvo FROM fdiCliente ORDER BY ClienteAlvo">
                                  </asp:SqlDataSource>
                                  <br />
                                  <table class="TabelaControles">
                                      <tr>
                                          <td>
                                              <asp:ImageButton ID="botaoIncluirIniciativa" runat="server" Height="25px" 
                                                  ImageUrl="~/Icones/001_03.gif" ToolTip="Salvar Iniciativa" 
                                                  ValidationGroup="iniciativa" Width="25px" />
                                          </td>
                                          <td>
                                              <asp:ImageButton ID="botaoAlterarIniciativa" runat="server" Height="25px" 
                                                  ImageUrl="~/Icones/editar.jpg" ToolTip="Salvar Alterações" 
                                                  ValidationGroup="iniciativa" Width="25px" />
                                          </td>
                                          <td>
                                              <asp:ImageButton ID="botaoVoltar" runat="server" CausesValidation="False" 
                                                  Height="25px" ImageUrl="~/Icones/voltar.jpg" 
                                                  ToolTip="Voltar para página principal" Width="25px" />
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                              &nbsp;</td>
                                          <td>
                                              &nbsp;</td>
                                          <td>
                                              &nbsp;</td>
                                      </tr>
                                  </table>
                              </fieldset>
                              <br />
                              <asp:Label ID="lblmensagemProjeto" runat="server" EnableTheming="False" 
                                  ForeColor="#CC3300"></asp:Label>
                              <asp:SqlDataSource ID="SqlIniciativa" runat="server" 
                                  ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                                  DeleteCommand="DELETE FROM [plnProjeto] WHERE [id_projeto] = @id_projeto" 
                                  InsertCommand="INSERT INTO fdiIniciativa(TituloIniciativa, DescricaoIniciativa, ObjetivoIniciativa, BeneficiosEsperadosIniciativa, id_Solicitante, id_AreaSolicitante, id_Empresa, DataHoraCriacao, UsuarioCriacao, NrPessoasEnvolvidas, FlagInstitucional, FlagDesenvOrgan, FlagInovacao, Status, Codigo, SENAC, SESC, FECOMERCIO, Justificativa, DescClienteSec, id_clientealvo, flagPublicoGeral, flagTercSetor, flagClienteInterno, flagInicPrivada, flagGovOutros, flagGovEmpPublicas, flagGovSecretarias, flagGovPrefeituras, flagSistemas, flagEmpOrganizadas, flagSindicatos, DescClienteAlvo, TaxaSelic, valorSESC, valorFECOMERCIO, valorSENAC, ValorInvestimento, DescricaoTIR, EsforcoMeses, EsforcoHora, FinancExterno, prazoConclusao, VPL, idUnidadeSolicitante) VALUES (@TituloIniciativa, @DescricaoIniciativa, @ObjetivoIniciativa, @BeneficiosEsperadosIniciativa, @id_Solicitante, @id_AreaSolicitante, @id_Empresa, GETDATE(), @UsuarioCriacao, @NrPessoasEnvolvidas, @FlagInstitucional, @FlagDesenvOrgan, @FlagInovacao, 'ED', dbo.fncSeqIniciativa(@id_Empresa), @SENAC, @SESC, @FECOMERCIO, @Justificativa, @DescClienteSec, @id_clientealvo, @flagPublicoGeral, @flagTercSetor, @flagClienteInterno, @flagInicPrivada, @flagGovOutros, @flagGovEmpPublicas, @flagGovSecretarias, @flagGovPrefeituras, @flagSistemas, @flagEmpOrganizadas, @flagSindicatos, @DescClienteAlvo, dbo.fncTaxa(), @valorSESC, @valorFECOMERCIO, @valorSENAC, @valorInvestimento, @descTIR, @esforcoMeses, @esforcoHora, @financexterno, @prazoConclusao, 0.00, @id_unidadeSolicitante)" 
                                  ProviderName="<%$ ConnectionStrings:SistemaSConnectionString.ProviderName %>" 
                                  SelectCommand="SELECT fdiIniciativa.id_Iniciativa, fdiIniciativa.TituloIniciativa, fdiIniciativa.DescricaoIniciativa, fdiIniciativa.ObjetivoIniciativa, fdiIniciativa.BeneficiosEsperadosIniciativa, fdiIniciativa.id_Solicitante, fdiIniciativa.id_AreaSolicitante, fdiIniciativa.id_Empresa, fdiIniciativa.id_TaxaSelic, fdiIniciativa.ValorInvestimento, fdiIniciativa.FinancExterno, fdiIniciativa.VPL, fdiIniciativa.TIR, fdiIniciativa.DescricaoTIR, fdiIniciativa.PayBack, fdiIniciativa.EsforcoMeses, fdiIniciativa.EsforcoHora, fdiIniciativa.DataHoraCriacao, fdiIniciativa.UsuarioCriacao, fdiIniciativa.NrPessoasEnvolvidas, fdiIniciativa.FlagInstitucional, fdiIniciativa.FlagDesenvOrgan, fdiIniciativa.FlagInovacao, fdiEmpresa.Nome_Empresa, fdiSolicitante.Matric_Solicitante, fdiSolicitante.Nome_Solicitante, fdiArea.Area, fdiStatus.Status AS Expr1, fdiIniciativa.FECOMERCIO, fdiIniciativa.SESC, fdiIniciativa.SENAC, fdiIniciativa.DescClienteAlvo, fdiIniciativa.flagSindicatos, fdiIniciativa.flagEmpOrganizadas, fdiIniciativa.flagSistemas, fdiIniciativa.flagGovPrefeituras, fdiIniciativa.flagGovSecretarias, fdiIniciativa.flagGovEmpPublicas, fdiIniciativa.flagGovOutros, fdiIniciativa.flagInicPrivada, fdiIniciativa.flagClienteInterno, fdiIniciativa.flagTercSetor, fdiIniciativa.flagPublicoGeral, fdiIniciativa.id_clientealvo, fdiIniciativa.DescClienteSec, fdiIniciativa.Justificativa, fdiIniciativa.valorSESC, fdiIniciativa.valorSENAC, fdiIniciativa.valorFECOMERCIO, fdiIniciativa.TaxaSelic, CONVERT (varchar(10), fdiIniciativa.prazoConclusao, 103) AS prazoConclusao, fdiIniciativa.nMesesSaida, fdiIniciativa.nMesesEntrada, fdiIniciativa.idUnidadeSolicitante FROM fdiIniciativa INNER JOIN fdiSolicitante ON fdiIniciativa.id_Solicitante = fdiSolicitante.id_Solicitante INNER JOIN fdiEmpresa ON fdiIniciativa.id_Empresa = fdiEmpresa.Id_Empresa INNER JOIN fdiStatus ON fdiIniciativa.Status = fdiStatus.Sigla_Status LEFT OUTER JOIN fdiArea ON fdiIniciativa.id_AreaSolicitante = fdiArea.Id_Area WHERE (fdiEmpresa.Id_Empresa = (CASE WHEN @Id_Empresa = 1 THEN fdiEmpresa.Id_Empresa ELSE @Id_Empresa END)) AND (fdiIniciativa.id_Iniciativa = @Id_Iniciativa)" 
                                  
                                  
                                  UpdateCommand="UPDATE fdiIniciativa SET TituloIniciativa = @TituloIniciativa, DescricaoIniciativa = @DescricaoIniciativa, ObjetivoIniciativa = @ObjetivoIniciativa, BeneficiosEsperadosIniciativa = @BeneficiosEsperadosIniciativa, id_Solicitante = @id_Solicitante, id_AreaSolicitante = @id_AreaSolicitante, NrPessoasEnvolvidas = @NrPessoasEnvolvidas, FlagInstitucional = @FlagInstitucional, FlagDesenvOrgan = @FlagDesenvOrgan, FlagInovacao = @FlagInovacao, FECOMERCIO = @FECOMERCIO, SESC = @SESC, SENAC = @SENAC, DescClienteAlvo = @DescClienteAlvo, flagSindicatos = @flagSindicatos, flagSistemas = @flagSistemas, flagEmpOrganizadas = @flagEmpOrganizadas, flagGovPrefeituras = @flagGovPrefeituras, flagGovSecretarias = @flagGovSecretarias, flagGovEmpPublicas = @flagGovEmpPublicas, flagGovOutros = @flagGovOutros, flagInicPrivada = @flagInicPrivada, flagClienteInterno = @flagClienteInterno, flagPublicoGeral = @flagPublicoGeral, id_clientealvo = @id_clientealvo, DescClienteSec = @DescClienteSec, Justificativa = @Justificativa, flagTercSetor = @flagTercSetor, DescricaoTIR = @descricaoTIR, EsforcoMeses = @EsforcoMeses, EsforcoHora = @EsforcoHora, TaxaSelic = @TaxaSelic, valorSESC = @valorSESC, valorSENAC = @valorSENAC, valorFECOMERCIO = @valorFECOMERCIO, FinancExterno = @financexterno, prazoConclusao = @prazoconclusao, nMesesSaida = @nMesesSaida, nMesesEntrada = @nMesesEntrada, ValorInvestimento = @valorInvestimento, idUnidadeSolicitante = @idUnidadeSolicitante WHERE (id_Iniciativa = @id_Iniciativa) AND (id_Empresa = @id_Empresa)">
                                  <InsertParameters>
                                      <asp:ControlParameter ControlID="txtTituloIniciativa" Name="TituloIniciativa" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtDescricaoIniciativa" 
                                          Name="DescricaoIniciativa" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtObjetivoIniciativa" 
                                          Name="ObjetivoIniciativa" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtBeneficiosEsperadosIniciativa" 
                                          Name="BeneficiosEsperadosIniciativa" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="cboid_Solicitante" Name="id_Solicitante" 
                                          PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="cboid_AreaSolicitante" 
                                          Name="id_AreaSolicitante" PropertyName="SelectedValue" />
                                      <asp:SessionParameter Name="id_Empresa" SessionField="EmpresaGlobal" />
                                      <asp:SessionParameter Name="UsuarioCriacao" SessionField="C_nome" />
                                      <asp:ControlParameter ControlID="txtNrPessoasEnvolvidas" 
                                          Name="NrPessoasEnvolvidas" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="chkFlagInstitucional" Name="FlagInstitucional" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkFlagDesenvOrgan" Name="FlagDesenvOrgan" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkFlagInovacao" Name="FlagInovacao" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chksenac" Name="SENAC" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chksesc" Name="SESC" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkfecomercio" Name="FECOMERCIO" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="txtjustificativa" Name="Justificativa" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtDescClienteSec" Name="DescClienteSec" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="cboid_clientealvo" Name="id_clientealvo" 
                                          PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="chkflagPublicoGeral" Name="flagPublicoGeral" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagTercSetor" Name="flagTercSetor" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagClienteInterno" 
                                          Name="flagClienteInterno" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagInicPrivada" Name="flagInicPrivada" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagGovOutros" Name="flagGovOutros" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagGovEmpPublicas" 
                                          Name="flagGovEmpPublicas" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagGovSecretarias" 
                                          Name="flagGovSecretarias" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagGovPrefeituras" 
                                          Name="flagGovPrefeituras" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagSistemas" Name="flagSistemas" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagEmpOrganizadas" 
                                          Name="flagEmpOrganizadas" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagSindicatos" Name="flagSindicatos" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="txtDescClienteAlvo" Name="DescClienteAlvo" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="curvalorsesc" Name="valorSESC" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="curvalorfecomercio" Name="valorFECOMERCIO" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="curvalorsenac" Name="valorSENAC" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="curvalorinvestimento" Name="valorInvestimento" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="txtdescricaotir" Name="descTIR" 
                                          PropertyName="Text" type="String" />
                                      <asp:ControlParameter ControlID="txtesforcomeses" Name="esforcoMeses" 
                                          PropertyName="Text" Type="Int32" />
                                      <asp:ControlParameter ControlID="txtesforcoHORA" Name="esforcoHora" 
                                          PropertyName="Text" Type="Int32" />
                                      <asp:ControlParameter ControlID="curfinancexterno" Name="financexterno" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="txtprazoConclusao" Name="prazoConclusao" 
                                          PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="cboidUnidadeSolicitante" PropertyName="SelectedValue" Type="Int32"   Name="id_unidadeSolicitante" />
                                  </InsertParameters>
                                  <SelectParameters>
                                      <asp:SessionParameter Name="Id_Empresa" SessionField="id_empresa" 
                                          Type="Int32" />
                                      <asp:ControlParameter ControlID="GridViewIniciativa" Name="Id_Iniciativa" 
                                          PropertyName="SelectedValue" />
                                  </SelectParameters>
                                  <DeleteParameters>
                                      <asp:Parameter Name="id_projeto" Type="Int32" />
                                  </DeleteParameters>
                                  <UpdateParameters>
                                      <asp:ControlParameter ControlID="txtTituloIniciativa" Name="TituloIniciativa" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtDescricaoIniciativa" 
                                          Name="DescricaoIniciativa" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtObjetivoIniciativa" 
                                          Name="ObjetivoIniciativa" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtBeneficiosEsperadosIniciativa" 
                                          Name="BeneficiosEsperadosIniciativa" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="cboid_Solicitante" Name="id_Solicitante" 
                                          PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="cboid_AreaSolicitante" 
                                          Name="id_AreaSolicitante" PropertyName="SelectedValue" />
                                      <asp:SessionParameter Name="id_Empresa" SessionField="id_empresa" />
                                      <asp:ControlParameter ControlID="txtNrPessoasEnvolvidas" 
                                          Name="NrPessoasEnvolvidas" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="chkFlagInstitucional" Name="FlagInstitucional" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkFlagDesenvOrgan" Name="FlagDesenvOrgan" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkFlagInovacao" Name="FlagInovacao" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_Iniciativa" 
                                          PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="chkfecomercio" Name="FECOMERCIO" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chksesc" Name="SESC" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chksenac" Name="SENAC" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="txtjustificativa" Name="Justificativa" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtDescClienteSec" Name="DescClienteSec" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="cboid_clientealvo" Name="id_clientealvo" 
                                          PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="chkflagPublicoGeral" Name="flagPublicoGeral" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagTercSetor" Name="flagTercSetor" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagClienteInterno" 
                                          Name="flagClienteInterno" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagInicPrivada" Name="flagInicPrivada" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagGovOutros" Name="flagGovOutros" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagGovEmpPublicas" 
                                          Name="flagGovEmpPublicas" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagGovSecretarias" 
                                          Name="flagGovSecretarias" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagGovPrefeituras" 
                                          Name="flagGovPrefeituras" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagSistemas" Name="flagSistemas" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagEmpOrganizadas" 
                                          Name="flagEmpOrganizadas" PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="chkflagSindicatos" Name="flagSindicatos" 
                                          PropertyName="Checked" />
                                      <asp:ControlParameter ControlID="txtDescClienteAlvo" Name="DescClienteAlvo" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="curvalorinvestimento" Name="valorInvestimento" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="txtdescricaotir" Name="descricaoTIR" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtesforcomeses" Name="EsforcoMeses" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtesforcoHORA" Name="EsforcoHora" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txttaxaselic" Name="TaxaSelic" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="curvalorsesc" Name="valorSESC" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="curvalorsenac" Name="valorSENAC" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="curvalorfecomercio" Name="valorFECOMERCIO" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="curfinancexterno" Name="financexterno" 
                                          PropertyName="Text" Type="Decimal" />
                                      <asp:ControlParameter ControlID="txtprazoConclusao" Name="prazoconclusao" 
                                          PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="txtnMesesSaida" Name="nMesesSaida" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txtnMesesEntrada" Name="nMesesEntrada" 
                                          PropertyName="Text" />
                                      <asp:ControlParameter ControlID="cboidUnidadeSolicitante" PropertyName="SelectedValue" Type="Int32"  Name="idUnidadeSolicitante" />
                                  </UpdateParameters>
                              </asp:SqlDataSource>
                              <br />
                          </asp:View>
                          <br />
                      </asp:MultiView>
                  </asp:Panel>
                  <br />
              
              </asp:View>
              
             
               <asp:View ID="View2" runat="server">
                   <asp:Panel ID="Panel14" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Áreas Envolvidas" Width="895px" Enabled="False">
                       &nbsp;<table class="style1">
                           <tr>
                               <td class="style11">
                                   <asp:Label ID="lblMesAnoR5" runat="server" Text="Empresa:" Width="100px"></asp:Label>
                               </td>
                               <td class="style12">
                                   <asp:DropDownList ID="cboempresa" runat="server" AutoPostBack="True" 
                                       DataSourceID="sqlEmpresa1" DataTextField="NOME_EMPRESA" 
                                       DataValueField="ID_EMPRESA">
                                   </asp:DropDownList>
                               </td>
                               <td>
                                   &nbsp;</td>
                           </tr>
                           <tr>
                               <td class="style11">
                                   <asp:Label ID="lblMesAnoR1" runat="server" Text="Área:" Width="100px"></asp:Label>
                               </td>
                               <td class="style12">
                                   <asp:DropDownList ID="DDLArea" runat="server" DataSourceID="sqlAreas" 
                                       DataTextField="Area" DataValueField="Id_Area">
                                   </asp:DropDownList>
                               </td>
                               <td>
                                   <asp:ImageButton ID="botaoIncluirAreaEnvolvida" runat="server" CssClass="botao" 
                                       Height="20px" ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir Nucleo/Área" 
                                       ValidationGroup="cadastroentsaida" Width="20px" />
                               </td>
                           </tr>
                       </table>
                       &nbsp;<br />
                       &nbsp;<asp:Label ID="lblmsgarea" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300"></asp:Label>
                       <asp:GridView ID="GridAreasEnvolvidas" runat="server" 
                           AutoGenerateColumns="False" DataKeyNames="id_AreaIniciativa,id_Empresa" 
                           DataSourceID="sqlareasenvolvidas" AllowSorting="True">
                           <Columns>
                               <asp:BoundField DataField="empEnvolvida" HeaderText="Empresa" 
                                   SortExpression="Nome_Empresa" />
                               <asp:BoundField DataField="Area" HeaderText="Área" SortExpression="Area" />
                               <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                                   ShowDeleteButton="True">
                               <ItemStyle Width="15px" />
                               </asp:CommandField>
                           </Columns>
                       </asp:GridView>
                       <br />
                       <asp:SqlDataSource ID="sqlareasenvolvidas" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                           DeleteCommand="DELETE FROM fdiAreaIniciativa WHERE (id_AreaIniciativa = @id_AreaIniciativa) AND (id_Empresa = @id_Empresa)" 
                           InsertCommand="INSERT INTO fdiAreaIniciativa(id_Empresa, id_Iniciativa, id_Area, id_EmpresaEnv) VALUES (@id_Empresa, @id_Iniciativa, @id_Area, @id_EmpresaEnv)" 
                           
                           
                           
                           SelectCommand="SELECT fdiAreaIniciativa.id_AreaIniciativa, fdiAreaIniciativa.id_Empresa, fdiArea.Area, fdiEmpresa.Nome_Empresa, fdiAreaIniciativa.id_Iniciativa, fdiEmpresa_1.Nome_Empresa AS empEnvolvida FROM fdiAreaIniciativa INNER JOIN fdiArea ON fdiAreaIniciativa.id_Area = fdiArea.Id_Area INNER JOIN fdiEmpresa ON fdiAreaIniciativa.id_Empresa = fdiEmpresa.Id_Empresa INNER JOIN fdiEmpresa AS fdiEmpresa_1 ON fdiAreaIniciativa.id_EmpresaEnv = fdiEmpresa_1.Id_Empresa WHERE (fdiAreaIniciativa.id_Iniciativa = @id_Iniciativa) AND (fdiAreaIniciativa.id_Empresa = (CASE WHEN @id_Empresa = 1 THEN fdiAreaIniciativa.Id_Empresa ELSE @id_Empresa END))">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_Iniciativa" 
                                   PropertyName="SelectedValue" />
                               <asp:SessionParameter Name="id_Empresa" SessionField="EmpresaGlobal" 
                                   Type="Int32" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:Parameter Name="id_AreaIniciativa" />
                               <asp:Parameter Name="id_Empresa" />
                           </DeleteParameters>
                           <InsertParameters>
                               <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_Iniciativa" 
                                   PropertyName="SelectedValue" />
                               <asp:ControlParameter ControlID="DDLArea" Name="id_Area" 
                                   PropertyName="SelectedValue" />
                               <asp:SessionParameter Name="id_Empresa" SessionField="EmpresaGlobal" />
                               <asp:ControlParameter ControlID="cboempresa" Name="id_EmpresaEnv" 
                                   PropertyName="SelectedValue" Type="Int32" />
                           </InsertParameters>
                       </asp:SqlDataSource>
                       <br />
                       <br />
                       <br />
                   </asp:Panel>
                   <asp:SqlDataSource ID="sqlEmpresa1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" SelectCommand="select '' as ID_EMPRESA,'' as NOME_EMPRESA
union
SELECT ID_EMPRESA,NOME_EMPRESA FROM FDIEMPRESA
WHERE ID_EMPRESA IN (
SELECT case when @sesc=1 then '2' end from fdiiniciativa
UNION
SELECT case when @SENAC=1 then '3' end  from fdiiniciativa
UNION
SELECT case when @FECOMERCIO=1 then '4' end  from fdiiniciativa)">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="chksesc" Name="sesc" PropertyName="Checked" 
                               Type="Int32" />
                           <asp:ControlParameter ControlID="chksenac" Name="SENAC" PropertyName="Checked" 
                               Type="Int32" />
                           <asp:ControlParameter ControlID="chkfecomercio" Name="FECOMERCIO" 
                               PropertyName="Checked" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <br />
                   <asp:SqlDataSource ID="sqlAreas" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                       
                       
                       
                       SelectCommand="SELECT Area, Id_Area, Id_Empresa FROM fdiArea WHERE (Id_Empresa =@id_empresa) order by Id_Area">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="cboempresa" Name="id_empresa" 
                               PropertyName="SelectedValue" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <br />
                   <br />
               </asp:View>
              <br />
              <asp:View ID="View5" runat="server">
                  <br />
                  <asp:Panel ID="Panel9" runat="server" CssClass="TabelaControlesTopo" 
                      GroupingText="Cadastro de Iniciativa - Entrada/Saída" Width="765px">
                      &nbsp;<table class="style1">
                          <tr>
                              <td class="style26">
                                  <asp:Label ID="lblDescricaoClienteSec1" runat="server" 
                                      Text="Número de meses previsto (Entrada):" Width="219px" 
                                      EnableTheming="False"></asp:Label>
                              </td>
                              <td class="style16">
                                  <asp:TextBox ID="txtnMesesEntrada" runat="server" ValidationGroup="nmeses" 
                                      Width="30px"></asp:TextBox>
                                  <ajaxToolkit:FilteredTextBoxExtender ID="nMesesEntrada_FilteredTextBoxExtender" 
                                      runat="server" Enabled="True" FilterType="Numbers" 
                                      TargetControlID="txtnMesesEntrada">
                                  </ajaxToolkit:FilteredTextBoxExtender>
                              </td>
                              <td class="style16">
                                  <asp:ImageButton ID="btnAtulizaMeses" runat="server" 
                                      ImageUrl="~/Icones/refresh.gif" ToolTip="Atulizar número de meses" 
                                      ValidationGroup="nmeses" />
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                      ControlToValidate="txtnMesesEntrada" ErrorMessage="Campo obrigatório" 
                                      ValidationGroup="nmeses"></asp:RequiredFieldValidator>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                      ControlToValidate="txtnMesesEntrada" ErrorMessage="Campo obrigatório" 
                                      ValidationGroup="cadastroentsaida"></asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td class="style26">
                                  <asp:Label ID="lblDescricaoClienteSec2" runat="server" 
                                      Text="Número de meses previsto (Saída):" Width="213px" 
                                      EnableTheming="False"></asp:Label>
                              </td>
                              <td class="style16">
                                  <asp:TextBox ID="txtnMesesSaida" runat="server" ValidationGroup="nmeses" 
                                      Width="30px"></asp:TextBox>
                                  <ajaxToolkit:FilteredTextBoxExtender ID="nMesesSaida_FilteredTextBoxExtender" 
                                      runat="server" Enabled="True" FilterType="Numbers" 
                                      TargetControlID="txtnMesesSaida">
                                  </ajaxToolkit:FilteredTextBoxExtender>
                              </td>
                              <td class="style16">
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                      ControlToValidate="txtnMesesSaida" ErrorMessage="Campo obrigatório" 
                                      ValidationGroup="nmeses"></asp:RequiredFieldValidator>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                      ControlToValidate="txtnMesesSaida" ErrorMessage="Campo obrigatório" 
                                      ValidationGroup="cadastroentsaida"></asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td class="style26">
                                  &nbsp;</td>
                              <td>
                                  &nbsp;</td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                      </table>
                      <table class="style1">
                          <tr>
                              <td>
                                  <asp:Label ID="lblMesAnoR0" runat="server" Text="Tipo:"></asp:Label>
                              </td>
                              <td>
                                  <asp:DropDownList ID="ddlid_receitadespesa" runat="server" AutoPostBack="True">
                                      <asp:ListItem Value="100"> SELECIONE O TIPO</asp:ListItem>
                                      <asp:ListItem Value="0">Entrada</asp:ListItem>
                                      <asp:ListItem Value="1">Saída</asp:ListItem>
                                  </asp:DropDownList>
                                  &nbsp;
                                  <asp:CheckBox ID="chkperpetuidade" runat="server" 
                                      Text="Aplicar Perpetuidade para os próximos meses" Visible="False" />
                              </td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="lblMesAnoR" runat="server" Text="Mês:"></asp:Label>
                              </td>
                              <td>
                                  <asp:DropDownList ID="DDLMesDespesa" runat="server">
                                  </asp:DropDownList>
                              </td>
                              <td>
                                  <asp:RequiredFieldValidator ID="rqValorMesAnoR" runat="server" 
                                      ControlToValidate="DDLMesDespesa" ErrorMessage="Campo obrigatório" 
                                      ValidationGroup="cadastroentsaida" Width="180px"></asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="lblDespesas" runat="server" Text="Valor R$:"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="txbValorDespesa" runat="server" Height="22px" 
                                      onKeyPress="return(formataMoeda(this,'.',',',event));" Width="128px"></asp:TextBox>
                              </td>
                              <td>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                      ControlToValidate="txbValorDespesa" ErrorMessage="Campo obrigatório" 
                                      ValidationGroup="cadastroentsaida"></asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="lbldescDespesa" runat="server" Text="Descrição:"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="txbDescricaoDesp" runat="server" EnableTheming="False" 
                                      Height="59px" Rows="4" TextMode="MultiLine" Width="448px"></asp:TextBox>
                              </td>
                              <td>
                                  <asp:ImageButton ID="botaoIncluirDespesa" runat="server" CssClass="botao" 
                                      Height="20px" ImageUrl="~/Icones/adicionar.gif" 
                                      ToolTip="Incluir Entrada/Saída" ValidationGroup="cadastroentsaida" 
                                      Width="20px" />
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                      ControlToValidate="txbDescricaoDesp" ErrorMessage="Campo obrigatório" 
                                      ValidationGroup="cadastroentsaida"></asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="lbldescDespesa0" runat="server" Text="Taxa Selic (%):"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="txbtaxaselic" runat="server" BackColor="Silver" 
                                      EnableTheming="False" ForeColor="Black" Width="70px"></asp:TextBox>
                              </td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                      </table>
                      <br />
                      &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
                      &nbsp;<asp:SqlDataSource ID="sqlAtualizaMeses" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                          DeleteCommand="DELETE FROM [fdiIniciativa] WHERE [id_Iniciativa] = @id_Iniciativa AND [id_Empresa] = @id_Empresa" 
                          InsertCommand="INSERT INTO [fdiIniciativa] ([id_Empresa], [nMesesEntrada], [nMesesSaida]) VALUES (@id_Empresa, @nMesesEntrada, @nMesesSaida)" 
                          SelectCommand="SELECT [id_Iniciativa], [id_Empresa], [nMesesEntrada], [nMesesSaida] FROM [fdiIniciativa]" 
                          UpdateCommand="UPDATE [fdiIniciativa] SET [nMesesEntrada] = @nMesesEntrada, [nMesesSaida] = @nMesesSaida WHERE [id_Iniciativa] = @id_Iniciativa AND [id_Empresa] = @id_Empresa">
                          <DeleteParameters>
                              <asp:Parameter Name="id_Iniciativa" Type="Int32" />
                              <asp:Parameter Name="id_Empresa" Type="Int32" />
                          </DeleteParameters>
                          <UpdateParameters>
                              <asp:ControlParameter ControlID="txtnMesesEntrada" Name="nMesesEntrada" 
                                  PropertyName="Text" Type="Int32" />
                              <asp:ControlParameter ControlID="txtnMesesSaida" Name="nMesesSaida" 
                                  PropertyName="Text" Type="Int32" />
                              <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_Iniciativa" 
                                  PropertyName="SelectedValue" Type="Int32" />
                              <asp:SessionParameter Name="id_Empresa" SessionField="id_empresa" 
                                  Type="Int32" />
                          </UpdateParameters>
                          <InsertParameters>
                              <asp:Parameter Name="id_Empresa" Type="Int32" />
                              <asp:Parameter Name="nMesesEntrada" Type="Int32" />
                              <asp:Parameter Name="nMesesSaida" Type="Int32" />
                          </InsertParameters>
                      </asp:SqlDataSource>
                      <br />
                      <asp:Label ID="lblmensagemRetorno" runat="server" EnableTheming="False" 
                          ForeColor="#CC3300"></asp:Label>
                      <asp:GridView ID="gridDespesas" runat="server" AllowSorting="True" 
                          AutoGenerateColumns="False" DataKeyNames="id_ReceitaDespesa,id_Empresa" 
                          DataSourceID="SqlGridDespesas">
                          <Columns>
                              
                              <asp:BoundField DataField="Mes" HeaderText="Mês" SortExpression="Mes" />
                              <asp:BoundField DataField="despinvest" HeaderText="Entrada/Saída" 
                                  ReadOnly="True" SortExpression="despinvest" />
                              <asp:BoundField DataField="valorDespesaReceita" HeaderText="Valor" 
                                  SortExpression="valorDespesaReceita" DataFormatString="{0:c}" />
                              <asp:BoundField DataField="Descricao" HeaderText="Descrição" 
                                  SortExpression="Descricao" />
                              <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                                  ShowDeleteButton="True" />
                          </Columns>
                      </asp:GridView>
                      <br />
                      <br />
                      <asp:SqlDataSource ID="SqlGridDespesas" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                          DeleteCommand="DELETE FROM fdiReceitasDespesas WHERE (id_ReceitaDespesa = @id_ReceitaDespesa) AND (Id_Empresa = @Id_Empresa)" 
                          InsertCommand="INSERT INTO fdiReceitasDespesas(id_Iniciativa, Mes, flagDespesaReceita, valorDespesaReceita, Descricao, Id_Empresa) VALUES (@id_iniciativa,  @mes, @flagdespesareceita, @valordespesa, @descricao, @id_Empresa)" 
                          
                          
                          
                          
                          SelectCommand="SELECT fdiReceitasDespesas.id_ReceitaDespesa,  fdiReceitasDespesas.Mes, CASE WHEN fdiReceitasDespesas.flagDespesaReceita = 0 THEN 'Entrada' WHEN fdiReceitasDespesas.flagDespesaReceita = 1 THEN 'Saída' END AS despinvest, fdiReceitasDespesas.valorDespesaReceita, fdiReceitasDespesas.Descricao, fdiReceitasDespesas.id_Iniciativa, fdiReceitasDespesas.Id_Empresa FROM fdiReceitasDespesas INNER JOIN fdiIniciativa ON fdiReceitasDespesas.id_Iniciativa = fdiIniciativa.id_Iniciativa WHERE (fdiReceitasDespesas.id_Iniciativa = @Id_Iniciativa) AND (fdiReceitasDespesas.Id_Empresa = (CASE WHEN @id_Empresa = 1 THEN fdiReceitasDespesas.Id_Empresa ELSE @id_Empresa END)) ORDER BY fdiReceitasDespesas.Mes, fdiReceitasDespesas.flagDespesaReceita">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="GridViewIniciativa" Name="Id_Iniciativa" 
                                  PropertyName="SelectedValue" />
                              <asp:SessionParameter Name="id_Empresa" SessionField="EmpresaGlobal" 
                                  Type="Int32" />
                          </SelectParameters>
                          <DeleteParameters>
                              <asp:Parameter Name="id_ReceitaDespesa" />
                              <asp:Parameter Name="Id_Empresa" />
                          </DeleteParameters>
                          <InsertParameters>
                              <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_iniciativa" 
                                  PropertyName="SelectedValue" />
                             
                              <asp:ControlParameter ControlID="DDLMesDespesa" Name="mes" 
                                  PropertyName="SelectedValue" />
                              <asp:ControlParameter ControlID="ddlid_receitadespesa" 
                                  Name="flagdespesareceita" PropertyName="SelectedValue"  />
                              <asp:ControlParameter ControlID="txbValorDespesa" Type="Decimal" 
                                  Name="valordespesa" PropertyName="Text" />
                              <asp:ControlParameter ControlID="txbDescricaoDesp" Type="String" 
                                  Name="descricao" PropertyName="Text" />
                            <asp:SessionParameter Name="id_Empresa" SessionField="EmpresaGlobal" />
                          </InsertParameters>
                      </asp:SqlDataSource>
                      <br />
                  </asp:Panel>
                  <asp:Panel ID="Panel17" runat="server" EnableTheming="False" 
                      GroupingText="Entrada Verba ou Redução de Custo / Saída " Width="740px">
                      <table class="style1">
                          <tr>
                              <td class="style23">
                                  <asp:Label ID="lblentrada" runat="server" 
                                      Text="Entrada Verba ou Redução de Custo:"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="txbentrada" runat="server" BackColor="Silver" 
                                      EnableTheming="False" ReadOnly="True"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="style23">
                                  <asp:Label ID="lblsaida" runat="server" Text="Saída:"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="txbsaida" runat="server" BackColor="Silver" 
                                      EnableTheming="False" ReadOnly="True"></asp:TextBox>
                              </td>
                          </tr>
                      </table>
                  </asp:Panel>
                  <asp:Panel ID="Panel13" runat="server" CssClass="TabelaControlesTopo" 
                      GroupingText="Análise Financeira" ToolTip="Incluir nova Iniciativa" 
                      Width="919px">
                      <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                          <asp:View ID="View4" runat="server">
                              <br />
                              <table class="style1">
                                  <tr>
                                      <td class="style15" width="150">
                                          <asp:Label ID="lblvpl" runat="server" Text="VPL:" Width="60px"></asp:Label>
                                      </td>
                                      <td class="style16">
                                          <asp:TextBox ID="curVPL" runat="server" ReadOnly="True" Width="150px" 
                                              BackColor="#CCCCCC"></asp:TextBox>
                                      </td>
                                      <td class="style9">
                                          &nbsp;</td>
                                      <td class="style10">
                                          &nbsp;</td>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td class="style15" width="150">
                                          <asp:Label ID="lbltir" runat="server" Text="TIR:"></asp:Label>
                                      </td>
                                      <td class="style16">
                                          <asp:TextBox ID="txttir" runat="server" ReadOnly="True" Width="150px" 
                                              BackColor="#CCCCCC"></asp:TextBox>
                                      </td>
                                      <td class="style9">
                                          &nbsp;</td>
                                      <td class="style10">
                                          &nbsp;</td>
                                      <td>
                                          <asp:ImageButton ID="ImageButton1" runat="server" 
                                              ImageUrl="~/Icones/refresh.gif" ToolTip="Calcular" 
                                              ValidationGroup="analisefinanceira" />
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style15" width="150">
                                          <asp:Label ID="lblpayback" runat="server" Text="Pay Back:"></asp:Label>
                                      </td>
                                      <td class="style4" colspan="3">
                                          <asp:TextBox ID="txtpayback" runat="server" ReadOnly="True" Width="500px" 
                                              BackColor="#CCCCCC"></asp:TextBox>
                                      </td>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                              </table>
                              <table class="style1">
                                  <tr>
                                      <td class="style14">
                                          &nbsp;</td>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                              </table>
                              <br />
                              <asp:Label ID="lblmsg" runat="server" EnableTheming="False"></asp:Label>
                              <br />
                          </asp:View>
                      </asp:MultiView>
                      <br />
                      <asp:SqlDataSource ID="sqlatualizainiciativa" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                          DeleteCommand="DELETE FROM [fdiIniciativa] WHERE [id_Iniciativa] = @id_Iniciativa" 
                          InsertCommand="INSERT INTO [fdiIniciativa] ([VPL], [TIR], [PayBack], [ValorInvestimento], [FinancExterno], [EsforcoMeses], [EsforcoAno], [DescricaoTIR]) VALUES (@VPL, @TIR, @PayBack, @ValorInvestimento, @FinancExterno, @EsforcoMeses, @EsforcoAno, @DescricaoTIR)" 
                          SelectCommand="SELECT id_Iniciativa, VPL, TIR, PayBack, ValorInvestimento, FinancExterno, EsforcoMeses, EsforcoHora, DescricaoTIR, TaxaSelic, id_Empresa FROM fdiIniciativa WHERE (id_Iniciativa = @id_iniciativa) AND (id_Empresa = (CASE WHEN @id_Empresa = 1 THEN id_Empresa ELSE @id_Empresa END))" 
                          
                          
                          
                          UpdateCommand="UPDATE fdiIniciativa SET VPL = @VPL, TIR = @TIR, PayBack = @PayBack, ValorInvestimento = @ValorInvestimento, FinancExterno = @FinancExterno, EsforcoMeses = @EsforcoMeses, EsforcoHora = @EsforcoHora, DescricaoTIR = @DescricaoTIR, TaxaSelic = @TaxaSelic WHERE (id_Iniciativa = @id_Iniciativa) AND (id_Empresa = @id_Empresa)">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_iniciativa" 
                                  PropertyName="SelectedValue" />
                              <asp:SessionParameter Name="id_Empresa" SessionField="EmpresaGlobal" 
                                  Type="Int32" />
                          </SelectParameters>
                          <DeleteParameters>
                              <asp:Parameter Name="id_Iniciativa" Type="Int32" />
                          </DeleteParameters>
                          <UpdateParameters>
                              <asp:ControlParameter ControlID="curVPL" Name="VPL" PropertyName="Text" 
                                  Type="Decimal" />
                              <asp:ControlParameter ControlID="txttir" Name="TIR" PropertyName="Text" 
                                  Type="Decimal" />
                              <asp:ControlParameter ControlID="txtpayback" Name="PayBack" PropertyName="Text" 
                                  Type="String" />
                              <asp:ControlParameter ControlID="curvalorinvestimento" Name="ValorInvestimento" 
                                  PropertyName="Text" Type="Decimal" />
                              <asp:ControlParameter ControlID="curfinancexterno" Name="FinancExterno" 
                                  PropertyName="Text" Type="Decimal" />
                              <asp:ControlParameter ControlID="txtesforcomeses" Type="Int32" 
                                  Name="EsforcoMeses" PropertyName="Text" />
                              <asp:ControlParameter ControlID="txtDescricaotir" Name="DescricaoTIR" 
                                  PropertyName="Text" Type="String" />
                              <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_Iniciativa" 
                                  PropertyName="SelectedValue" Type="Int32" />
                              <asp:ControlParameter ControlID="txtesforcoHORA" Type="Int32" 
                                  Name="EsforcoHora" PropertyName="Text" />
                              <asp:ControlParameter ControlID="txttaxaselic" Type="Decimal" 
                                  Name="TaxaSelic" PropertyName="Text" />
                              <asp:SessionParameter Name="id_Empresa" SessionField="EmpresaGlobal" />
                          </UpdateParameters>
                          <InsertParameters>
                              <asp:Parameter Name="VPL" Type="Decimal" />
                              <asp:Parameter Name="TIR" Type="Decimal" />
                              <asp:Parameter Name="PayBack" Type="String" />
                              <asp:Parameter Name="ValorInvestimento" Type="Decimal" />
                              <asp:Parameter Name="FinancExterno" Type="Decimal" />
                              <asp:Parameter Name="EsforcoMeses" Type="String" />
                              <asp:Parameter Name="EsforcoAno" Type="String" />
                              <asp:Parameter Name="DescricaoTIR" Type="String" />
                          </InsertParameters>
                      </asp:SqlDataSource>
                      <br />
                  </asp:Panel>
                  <br />
                  <br />
              </asp:View>
               <asp:View ID="View6" runat="server">
                   <asp:Panel ID="Panel15" runat="server" CssClass="TabelaControlesTopo" 
                       GroupingText="Unidades Envolvidas" Width="895px">
                       &nbsp;<table class="style1">
                           <tr>
                               <td class="style11">
                                   <asp:Label ID="lblMesAnoR6" runat="server" Text="Empresa:" Width="100px"></asp:Label>
                               </td>
                               <td class="style12">
                                   <asp:DropDownList ID="cboempresa0" runat="server" AutoPostBack="True" 
                                       DataSourceID="sqlEmpresa2" DataTextField="NOME_EMPRESA" 
                                       DataValueField="ID_EMPRESA">
                                   </asp:DropDownList>
                               </td>
                               <td>
                                   &nbsp;</td>
                           </tr>
                           <tr>
                               <td class="style11">
                                   <asp:Label ID="lblMesAnoR4" runat="server" Text="Unidade:" Width="100px"></asp:Label>
                               </td>
                               <td class="style12">
                                   <asp:DropDownList ID="DDLUnidade" runat="server" DataSourceID="sqlUnidade" 
                                       DataTextField="Unidade" DataValueField="Id_Unidade">
                                   </asp:DropDownList>
                               </td>
                               <td>
                                   <asp:ImageButton ID="botaoIncluirAreaEnvolvida0" runat="server" 
                                       CssClass="botao" Height="20px" ImageUrl="~/Icones/adicionar.gif" 
                                       ToolTip="Incluir Unidades" ValidationGroup="cadastroentsaida" Width="20px" />
                               </td>
                           </tr>
                       </table>
                       &nbsp;<br />
                       &nbsp;<asp:Label ID="lblmsgunidade" runat="server" EnableTheming="False" 
                           ForeColor="#CC3300"></asp:Label>
                       <asp:GridView ID="GridUnidadesEnvolvidas" runat="server" AllowSorting="True" 
                           AutoGenerateColumns="False" DataKeyNames="id_Empresa,id_UnidadeIniciativa" 
                           DataSourceID="sqlunidadesenvolvidas">
                           <Columns>
                               <asp:BoundField DataField="Nome_Empresa" HeaderText="Empresa" 
                                   SortExpression="Nome_Empresa" />
                               <asp:BoundField DataField="Unidade" HeaderText="Unidade" 
                                   SortExpression="Unidade" />
                               <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Icones/excluir.png" 
                                   ShowDeleteButton="True">
                               <ItemStyle Width="10px" />
                               </asp:CommandField>
                           </Columns>
                       </asp:GridView>
                       <br />
                       <asp:SqlDataSource ID="sqlunidadesenvolvidas" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                           DeleteCommand="DELETE FROM fdiUnidadeIniciativa WHERE (id_Empresa = @id_Empresa) AND (id_UnidadeIniciativa = @id_UnidadeIniciativa)" 
                           InsertCommand="INSERT INTO fdiUnidadeIniciativa(id_Empresa, id_Unidade, id_Iniciativa, id_EmpresaEnv) VALUES (@id_Empresa, @id_Unidade, @id_Iniciativa, @id_EmpresaEnv)" 
                           
                           
                           
                           SelectCommand="SELECT fdiEmpresa.Nome_Empresa, fdiUnidade.Unidade, fdiUnidadeIniciativa.id_Unidade, fdiUnidadeIniciativa.id_Iniciativa, fdiUnidadeIniciativa.id_UnidadeIniciativa, fdiUnidadeIniciativa.id_Empresa FROM fdiEmpresa INNER JOIN fdiUnidade ON fdiEmpresa.Id_Empresa = fdiUnidade.Id_Empresa INNER JOIN fdiUnidadeIniciativa ON fdiUnidade.Id_Unidade = fdiUnidadeIniciativa.id_Unidade WHERE (fdiUnidadeIniciativa.id_Iniciativa = @id_iniciativa) AND (fdiUnidadeIniciativa.id_Empresa = (CASE WHEN @id_Empresa = 1 THEN fdiUnidadeIniciativa.id_Empresa ELSE @id_Empresa END))">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_iniciativa" 
                                   PropertyName="SelectedValue" />
                               <asp:SessionParameter Name="id_Empresa" SessionField="EmpresaGlobal" 
                                   Type="Int32" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:Parameter Name="id_Empresa" />
                               <asp:Parameter Name="id_UnidadeIniciativa" />
                           </DeleteParameters>
                           <InsertParameters>
                               <asp:ControlParameter ControlID="DDLUnidade" Name="id_Unidade" 
                                   PropertyName="SelectedValue" />
                               <asp:ControlParameter ControlID="GridViewIniciativa" Name="id_Iniciativa" 
                                   PropertyName="SelectedValue" />
                               <asp:SessionParameter Name="id_Empresa" SessionField="EmpresaGlobal" 
                                   Type="Int32" />
                               <asp:ControlParameter ControlID="cboempresa0" Name="id_EmpresaEnv" 
                                   PropertyName="SelectedValue"  />
                           </InsertParameters>
                       </asp:SqlDataSource>
                       <br />
                       <br />
                       <br />
                   </asp:Panel>
                   <asp:SqlDataSource ID="sqlEmpresa2" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" SelectCommand="select '' as ID_EMPRESA,'' as NOME_EMPRESA
union
SELECT ID_EMPRESA,NOME_EMPRESA FROM FDIEMPRESA
WHERE ID_EMPRESA IN (
SELECT case when @sesc=1 then '2' end from fdiiniciativa
UNION
SELECT case when @SENAC=1 then '3' end  from fdiiniciativa
)">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="chksesc" Name="sesc" PropertyName="Checked" 
                               Type="Int32" />
                           <asp:ControlParameter ControlID="chksenac" Name="SENAC" PropertyName="Checked" 
                               Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <br />
                   <asp:SqlDataSource ID="sqlUnidade" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                       
                       
                       SelectCommand="SELECT Unidade, Id_Empresa, Id_Unidade FROM fdiUnidade WHERE (Id_Empresa = @Id_Empresa)
order by Id_Unidade">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="cboempresa0" Name="Id_Empresa" 
                               PropertyName="SelectedValue" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                   <br />
                   <br />
               </asp:View>
               <asp:View ID="View7" runat="server">
                   
                       <asp:Panel ID="Panel1" runat="server" 
                           CssClass="TabelaControlesTopo" GroupingText="Cadastro de Solicitante">
                           <br />
                           <asp:Label ID="lblMatric0" runat="server" Text="Matrícula:" Width="150px"></asp:Label>
                           <asp:TextBox ID="txtMatric" runat="server"></asp:TextBox>
                           <br />
                           <asp:Label ID="lblNome" runat="server" Text="Nome do Solicitante:" 
                               Width="150px"></asp:Label>
                           <asp:TextBox ID="txtNome" runat="server" MaxLength="50" 
                               style="margin-left: 0px" ToolTip="Entre com o nome do Solicitante" 
                               Width="350px"></asp:TextBox>
                           <br />
                           <asp:Label ID="lblLogin" runat="server" Text="Login do Solicitante:" 
                               Width="150px"></asp:Label>
                           <asp:TextBox ID="txtLogin" runat="server" MaxLength="50" 
                               style="margin-left: 0px" ToolTip="Entre com o login do Solicitante" 
                               Width="350px" Enabled="False"></asp:TextBox>
                           <br />
                           <asp:Label ID="lblArea" runat="server" Text="Área do Solicitante:" 
                               Width="150px"></asp:Label>
                           <asp:DropDownList ID="DDLArea0" runat="server" DataSourceID="SDSArea" 
                               DataTextField="Area" DataValueField="Id_Area">
                           </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                               ControlToValidate="DDLArea0" ErrorMessage="* Campo obrigatório" 
                               ValidationGroup="incluirsolicitante"></asp:RequiredFieldValidator>
                           <br />
                           <asp:Label ID="lblEmail" runat="server" Text="E-Mail:" Width="150px"></asp:Label>
                           <asp:TextBox ID="txtEMail" runat="server" MaxLength="50" 
                               style="margin-left: 0px" ToolTip="Entre com o e-mail do Solicitante" 
                               Width="498px"></asp:TextBox>
                           <asp:ImageButton ID="ImIncSolic" runat="server" CssClass="botao" Height="20px" 
                               ImageUrl="~/Icones/adicionar.gif" ToolTip="Incluir Novo Solicitante" 
                               Width="20px" ValidationGroup="incluirsolicitante" />
                           <asp:ImageButton ID="botaoAlterarSolic" runat="server" Height="20px" 
                               ImageUrl="~/Icones/editar.jpg" ToolTip="Alterar Dados do Solicitante" 
                               Width="20px" ValidationGroup="incluirsolicitante" Visible="False" />
                           <asp:ImageButton ID="botaoVoltar0" runat="server" CausesValidation="False" 
                               Height="20px" ImageUrl="~/Icones/voltar.jpg" ToolTip="Limpar Dados da Área" 
                               Width="20px" />
                           <br />
                           <br />
                           &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="lblmsgemail" 
                               runat="server" ForeColor="Red"></asp:Label>
&nbsp;<asp:GridView ID="GridSolicitante" runat="server" AllowPaging="True" 
                               AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                               DataKeyNames="Id_Empresa,id_Solicitante" DataSourceID="SqlSolicitante0" 
                               ForeColor="#333333" GridLines="None">
                               <RowStyle BackColor="#EFF3FB" />
                               <Columns>
                                   <asp:CommandField AccessibleHeaderText="Editar" ButtonType="Image" 
                                       SelectImageUrl="~/Icones/grid_selecionar.gif" ShowSelectButton="True" />
                                   <asp:BoundField DataField="Id_Empresa" HeaderText="Id_Empresa" 
                                       SortExpression="Id_Empresa" />
                                   <asp:BoundField DataField="Nome_Empresa" HeaderStyle-HorizontalAlign="Left" 
                                       HeaderText="Empresa" SortExpression="Nome_Empresa">
                                   <HeaderStyle HorizontalAlign="Left" />
                                   </asp:BoundField>
                                   <asp:BoundField DataField="Id_Area" HeaderText="Id_Area" InsertVisible="False" 
                                       SortExpression="Id_Area" />
                                   <asp:BoundField DataField="Area" HeaderText="Área" SortExpression="Area" />
                                   <asp:BoundField DataField="Matric_Solicitante" 
                                       HeaderStyle-HorizontalAlign="Left" HeaderText="Matrícula" 
                                       SortExpression="Matric_Solicitante">
                                   <HeaderStyle HorizontalAlign="Left" />
                                   </asp:BoundField>
                                   <asp:BoundField DataField="Nome_Solicitante" HeaderText="Nome" 
                                       SortExpression="Nome_Solicitante" />
                                   <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                   <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                                   <asp:TemplateField ShowHeader="False">
                                       <ItemTemplate>
                                           <asp:ImageButton ID="ImDelSolic" runat="server" CausesValidation="False" 
                                               CommandName="Delete" ImageUrl="~/Icones/excluir.png" onclick="ImDelSolic_Click" 
                                               Text="Delete" Visible="False" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <EditRowStyle BackColor="#2461BF" />
                               <AlternatingRowStyle BackColor="White" />
                           </asp:GridView>
                           <br />
                           <asp:SqlDataSource ID="SqlSolicitante0" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                               DeleteCommand="DELETE FROM fdiSolicitante WHERE (Id_Empresa = @Id_Empresa) AND (id_Solicitante = @id_Solicitante)" 
                               InsertCommand="INSERT INTO fdiSolicitante(Matric_Solicitante, Nome_Solicitante, email, Id_Empresa, Id_Area, Login) VALUES (@Matric_Solicitante, @Nome_Solicitante, @email, @Id_Empresa, @Id_Area, @Login)" 
                               SelectCommand="SELECT fdiSolicitante.id_Solicitante, fdiSolicitante.Matric_Solicitante, fdiSolicitante.Nome_Solicitante, fdiSolicitante.email, fdiSolicitante.Id_Empresa, fdiEmpresa.Nome_Empresa, fdiSolicitante.Login, fdiArea.Id_Area, fdiArea.Cod_Area, fdiArea.Area FROM fdiEmpresa INNER JOIN fdiSolicitante ON fdiEmpresa.Id_Empresa = fdiSolicitante.Id_Empresa INNER JOIN fdiArea ON fdiSolicitante.Id_Area = fdiArea.Id_Area AND fdiSolicitante.Id_Empresa = fdiArea.Id_Empresa WHERE (fdiSolicitante.Id_Empresa = @Id_Empresa) ORDER BY fdiEmpresa.Id_Empresa, fdiSolicitante.id_Solicitante" 
                               
                               UpdateCommand="UPDATE fdiSolicitante SET Matric_Solicitante = @Matric_Solicitante, Nome_Solicitante = @Nome_Solicitante, email = @email, Login = @Login, Id_Area = @Id_Area WHERE (Id_Empresa = @Id_Empresa) AND (id_Solicitante = @id_Solicitante)">
                               <SelectParameters>
                                   <asp:SessionParameter SessionField="EmpresaGlobal" Name="Id_Empresa"  Type="Int32"  />
                                       
                               </SelectParameters>
                               <DeleteParameters>
                                   <asp:ControlParameter ControlID="GridSolicitante" Name="Id_Empresa" 
                                       PropertyName="SelectedValue" />
                                   <asp:ControlParameter ControlID="GridSolicitante" Name="id_Solicitante" 
                                       PropertyName="SelectedValue" />
                               </DeleteParameters>
                               <UpdateParameters>
                                   <asp:ControlParameter ControlID="txtMatric" Name="Matric_Solicitante" 
                                       PropertyName="Text" />
                                   <asp:ControlParameter ControlID="txtNome" Name="Nome_Solicitante" 
                                       PropertyName="Text" />
                                   <asp:ControlParameter ControlID="txtEMail" Name="email" PropertyName="Text" />
                                   <asp:ControlParameter ControlID="GridSolicitante" Name="Id_Empresa" 
                                       PropertyName="SelectedValue" />
                                   <asp:SessionParameter Name="id_Solicitante" SessionField="Id_Solicitante" />
                                   <asp:ControlParameter ControlID="txtLogin" Name="Login" PropertyName="Text" />
                                   <asp:ControlParameter ControlID="DDLArea0" Name="Id_Area" 
                                       PropertyName="SelectedValue" Type="Int32"/>
                               </UpdateParameters>
                               <InsertParameters>
                                   <asp:ControlParameter ControlID="txtMatric" Name="Matric_Solicitante" 
                                       PropertyName="Text" />
                                   <asp:ControlParameter ControlID="txtNome" Name="Nome_Solicitante" 
                                       PropertyName="Text" />
                                   <asp:ControlParameter ControlID="txtEMail" Name="email" PropertyName="Text" />
                                   <asp:SessionParameter Name="Id_Empresa" SessionField="EmpresaGlobal" 
                                       Type="Int32" />
                                   <asp:ControlParameter ControlID="txtLogin" Name="Login" PropertyName="Text" />
                                   <asp:ControlParameter ControlID="DDLArea0" Name="Id_Area" 
                                       PropertyName="SelectedValue" Type="Int32" />
                               </InsertParameters>
                           </asp:SqlDataSource>
                           <asp:SqlDataSource ID="SDSArea" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:SistemaSConnectionString %>" 
                               SelectCommand="select '' as Id_Empresa,'' as Id_Area,'' as Cod_Area,'' as Area
union
SELECT Id_Empresa, Id_Area, Cod_Area, Area FROM fdiArea WHERE (Id_Empresa = @Id_Empresa)">
                               <SelectParameters>
                                   <asp:SessionParameter SessionField="EmpresaGlobal" Name="Id_Empresa"  Type="Int32"  />
                               </SelectParameters>
                           </asp:SqlDataSource>
                           <br />
                           <br />
                           <asp:Label ID="txtAviso" runat="server" BorderStyle="None" 
                               EnableTheming="False" Font-Bold="False" Height="19px" style="color: #FF3300" 
                               Width="600px"></asp:Label>
                           <br />
                           <br />
                       </asp:Panel>
                       
                   
                   <br />
                   <br />
               </asp:View>
                     
          </asp:MultiView>
     
       
                
    
    </div>
    </form>
</body>
</html>
