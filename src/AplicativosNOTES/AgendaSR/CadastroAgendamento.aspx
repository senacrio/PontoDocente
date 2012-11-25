<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroAgendamento.aspx.vb" Inherits="AplicativosNOTES_AgendaSR_CadastroAgendamento" StyleSheetTheme="AgendaSR" Theme="AgendaSR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css">
        


#hintbox{ /*CSS for pop up hint box */
position:absolute;
top: 0;
background-color: lightyellow;
width: 150px; /*Default width of hint.*/ 
padding: 3px;
border:1px solid black;
font:normal 11px Verdana;
line-height:18px;
z-index:100;
border-right: 3px solid black;
border-bottom: 3px solid black;
visibility: hidden;
}

.hintanchor{ /*CSS for link that shows hint onmouseover*/
font-weight: bold;
color: navy;
margin: 3px 8px;
}


.grid th
{
	background-color:#EFEFEF;
	font-weight:normal;
	border-color:#ccc;
}

        .style1
        {
            width: 213px;
        }
        .style4
        {
            width: 100%;
            height: 58px;
        }
        .style5
        {
            width: 720px;
        }
        .style6
        {
            width: 263px;
        }
        .style7
        {
            width: 28px;
        }
        .style12
    {
        width: 100%;
    }
    .style13
    {
        width: 30px;
    }
    .style14
    {
        width: 19px;
    }
        .style15
    {
        font-family: Verdana;
        font-size: x-small;
        font-weight: bold;
    }
        
        
</style>
        
        
        
         <script type="text/javascript" >

             /***********************************************
             * Show Hint script- © Dynamic Drive (www.dynamicdrive.com)
             * This notice MUST stay intact for legal use
             * Visit http://www.dynamicdrive.com/ for this script and 100s more.
             ***********************************************/

             var horizontal_offset = "9px" //horizontal offset of hint box from anchor link

             /////No further editting needed

             var vertical_offset = "0" //horizontal offset of hint box from anchor link. No need to change.
             var ie = document.all
             var ns6 = document.getElementById && !document.all

             function getposOffset(what, offsettype) {
                 var totaloffset = (offsettype == "left") ? what.offsetLeft : what.offsetTop;
                 var parentEl = what.offsetParent;
                 while (parentEl != null) {
                     totaloffset = (offsettype == "left") ? totaloffset + parentEl.offsetLeft : totaloffset + parentEl.offsetTop;
                     parentEl = parentEl.offsetParent;
                 }
                 return totaloffset;
             }

             function iecompattest() {
                 return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body
             }

             function clearbrowseredge(obj, whichedge) {
                 var edgeoffset = (whichedge == "rightedge") ? parseInt(horizontal_offset) * -1 : parseInt(vertical_offset) * -1
                 if (whichedge == "rightedge") {
                     var windowedge = ie && !window.opera ? iecompattest().scrollLeft + iecompattest().clientWidth - 30 : window.pageXOffset + window.innerWidth - 40
                     dropmenuobj.contentmeasure = dropmenuobj.offsetWidth
                     if (windowedge - dropmenuobj.x < dropmenuobj.contentmeasure)
                         edgeoffset = dropmenuobj.contentmeasure + obj.offsetWidth + parseInt(horizontal_offset)
                 }
                 else {
                     var windowedge = ie && !window.opera ? iecompattest().scrollTop + iecompattest().clientHeight - 15 : window.pageYOffset + window.innerHeight - 18
                     dropmenuobj.contentmeasure = dropmenuobj.offsetHeight
                     if (windowedge - dropmenuobj.y < dropmenuobj.contentmeasure)
                         edgeoffset = dropmenuobj.contentmeasure - obj.offsetHeight
                 }
                 return edgeoffset
             }

             function showhint(menucontents, obj, e, tipwidth) {
                 if ((ie || ns6) && document.getElementById("hintbox")) {
                     dropmenuobj = document.getElementById("hintbox")
                     dropmenuobj.innerHTML = menucontents
                     dropmenuobj.style.left = dropmenuobj.style.top = -500
                     if (tipwidth != "") {
                         dropmenuobj.widthobj = dropmenuobj.style
                         dropmenuobj.widthobj.width = tipwidth
                     }
                     dropmenuobj.x = getposOffset(obj, "left")
                     dropmenuobj.y = getposOffset(obj, "top")
                     dropmenuobj.style.left = dropmenuobj.x - clearbrowseredge(obj, "rightedge") + obj.offsetWidth + "px"
                     dropmenuobj.style.top = dropmenuobj.y - clearbrowseredge(obj, "bottomedge") + "px"
                     dropmenuobj.style.visibility = "visible"
                     obj.onmouseout = hidetip
                 }
             }

             function hidetip(e) {
                 dropmenuobj.style.visibility = "hidden"
                 dropmenuobj.style.left = "-500px"
             }

             function createhintbox() {
                 var divblock = document.createElement("div")
                 divblock.setAttribute("id", "hintbox")
                 document.body.appendChild(divblock)
             }

             if (window.addEventListener)
                 window.addEventListener("load", createhintbox, false)
             else if (window.attachEvent)
                 window.attachEvent("onload", createhintbox)
             else if (document.getElementById)
                 window.onload = createhintbox

 
         





            function mascara(o, f) {
                v_obj = o
                v_fun = f
                setTimeout("execmascara()", 1)
            }

            function execmascara() {
                v_obj.value = v_fun(v_obj.value)
            }

            function telefone(v) {
                v = v.replace(/\D/g, "")                 //Remove tudo o que não é dígito
                v = v.replace(/^(\d\d)(\d)/g, "($1) $2") //Coloca parênteses em volta dos dois primeiros dígitos
                v = v.replace(/(\d{4})(\d)/, "$1-$2")    //Coloca hífen entre o quarto e o quinto dígitos
                return v
            }
  
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="dhtmltooltip"></div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ScriptManager>
                            <asp:Label ID="Label13" runat="server" EnableTheming="False" 
                                EnableViewState="False" Font-Bold="True" Font-Size="Medium" 
                                style="font-size: small" 
                                
            Text="REUNIÃO SEDE - Reservas de salas do 2°,4° e 10° andares "></asp:Label>
        <br />
        <asp:MultiView ID="mvAgendamento" runat="server" ActiveViewIndex="0">
            <asp:View ID="vwPainel" runat="server" EnableViewState="False">
                <table class="style4">
                    <tr>
                        <td>
                           <asp:Panel ID="pnlAgendar" runat="server">
                                <table class="style4">
                                    <tr>
                                        <td class="style7">
                                            <asp:ImageButton Visible="false" ID="btnIncluir" runat="server" 
                                                ImageUrl="~/Icones/Standard/001_44.gif" />
                                        </td>
                                        <td valign="middle">
                                            <asp:Label ID="lblIncluiragd" runat="server" EnableViewState="False" 
                                                Font-Bold="True" Text="Agendar "></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <table class="style12">
                                <tr>
                                    <td class="style14">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Icones/clock.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="Agendamento ativo"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Icones/clock_add.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" Text="Agendamento no dia corrente"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Icones/clock_stop.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="Agendamento cancelado"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <asp:Label ID="lblEmail" runat="server" EnableTheming="False" 
                                ForeColor="#FF3300" 
                                style="color: #FF0000; font-weight: 700; font-size: small"></asp:Label>
                            <br />
                            <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
                                AssociatedUpdatePanelID="UpdatePanel6" DisplayAfter="1">
                                <ProgressTemplate>
                                    <div align="center" 
                                        
                                        style="background-color: #FFFFFF; vertical-align: middle; text-align: center; border: 2px solid #000000; width: 244px;">
                                        <table class="style12">
                                            <tr>
                                                <td align="center">
                                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Imagens/Carregando4.gif" />
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" class="style15">
                                                    Carregando...</td>
                                            </tr>
                                        </table>
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                            <ajaxToolkit:AlwaysVisibleControlExtender ID="UpdateProgress2_AlwaysVisibleControlExtender" 
                                runat="server" Enabled="True" TargetControlID="UpdateProgress2" 
                                HorizontalOffset="150" HorizontalSide="Center" VerticalOffset="100" 
                                VerticalSide="Middle">
                            </ajaxToolkit:AlwaysVisibleControlExtender>
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlCalendario" runat="server">
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                                            BorderColor="Black" CellPadding="12" DayNameFormat="Shortest" 
                                            Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" 
                                            NextPrevFormat="FullMonth" Width="906px" SelectionMode="None">
                                            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" 
                                                Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                            <TodayDayStyle BackColor="#CCCC99" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <DayStyle BorderColor="Black" BorderWidth="1px" Height="80px" 
                                                HorizontalAlign="Left" VerticalAlign="Top" Width="14%" />
                                            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                            <DayHeaderStyle BackColor="White" Font-Bold="True" Font-Size="Small" 
                                                ForeColor="#333333" Height="10pt" VerticalAlign="Top" />
                                            <TitleStyle BackColor="#A4BBFF" Font-Bold="True" Font-Size="13pt" 
                                                ForeColor="White" Height="14pt" />
                                        </asp:Calendar>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
&nbsp;<br />
                            <br />
                            <br />
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                
                <br />
                <br />
            </asp:View>
            <asp:View ID="vwAgendamento" runat="server">
                <asp:ImageButton ID="btnVoltar" ToolTip="Voltar" runat="server" ImageUrl="~/Icones/voltar.jpg" 
                    Width="26px" />
                <br />
            <br />
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                                        AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1">
                                        <ProgressTemplate>
                                            <asp:Label ID="lblcarregando" runat="server" BackColor="Red" 
                                                Text="Carregando..." EnableTheming="False" Font-Bold="True" 
                                                ForeColor="White" style="color: #FFFFFF"></asp:Label>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                <asp:Panel ID="pnlComandos" runat="server">
                    <table class="style12">
                        <tr>
                            <td class="style13">
                                <asp:ImageButton ID="btnCancelar" runat="server" 
                                    ImageUrl="~/Icones/Standard/001_05.gif" 
                                    onclientclick="return confirm('Deseja cancelar esse agendamento?')" 
                                    style="width: 24px" />
                            </td>
                            <td>
                                <asp:Label ID="Label12" runat="server" EnableTheming="False" Font-Bold="True" 
                                    Text="Cancelar Agendamento"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Label ID="lblmsg" runat="server" EnableTheming="False" 
                    style="font-weight: 700; color: #FF0000"></asp:Label>
                <br />
                <asp:Panel ID="pnlAgenda" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="style1" style="width: 831px">
                                <tr>
                                    <td class="style5" valign="top">
                                        <asp:Label ID="lblTipo" runat="server" EnableViewState="False" 
                                            Font-Size="Small" Text="Tipo de uso:" Font-Bold="True"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="ddlTipo" runat="server" DataTextField="Nm_Tipo" 
                                            DataValueField="Cd_Tipo" Font-Size="X-Small">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="lblData" runat="server" EnableViewState="False" Font-Bold="True" 
                                            Font-Size="Small" Height="16px" Text="Data de utilização:"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:TextBox ID="txtData" runat="server" EnableViewState="False"></asp:TextBox>
                                        <ajaxToolkit:MaskedEditExtender ID="txtData_MaskedEditExtender" runat="server" 
                                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                            Mask="99/99/9999" MaskType="Date" TargetControlID="txtData">
                                        </ajaxToolkit:MaskedEditExtender>
                                        <ajaxToolkit:CalendarExtender ID="txtData_CalendarExtender" runat="server" 
                                            Enabled="True" Format="dd/MM/yyyy" PopupButtonID="btncalendar" 
                                            TargetControlID="txtData">
                                        </ajaxToolkit:CalendarExtender>
                                        <asp:ImageButton ID="btncalendar" runat="server" 
                                            ImageUrl="~/Icones/calendario.jpg" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtData" ErrorMessage="Campo Obrigatório" 
                                            SetFocusOnError="True" ValidationGroup="agendamento"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                        <asp:Label ID="lblLocal" runat="server" EnableViewState="False" 
                                            Font-Bold="True" Text="Local:"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="ddlLocal" runat="server" DataTextField="Nm_Local" 
                                            DataValueField="Cd_Local" Font-Size="X-Small">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="lblHorario" runat="server" EnableViewState="False" 
                                            Font-Bold="True" Font-Size="Small" Height="16px" Text="Horário:"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="ddlHoraInicial" runat="server" 
                                            DataTextField="disponibilidade" DataValueField="disponibilidade" 
                                            Font-Size="X-Small">
                                        </asp:DropDownList>
                                        &nbsp;a
                                        <asp:DropDownList ID="ddlHoraFinal" runat="server" 
                                            DataTextField="disponibilidade" DataValueField="disponibilidade" 
                                            Font-Size="X-Small">
                                        </asp:DropDownList>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToCompare="ddlHoraInicial" ControlToValidate="ddlHoraFinal" 
                                            ErrorMessage="Erro no horário" Operator="GreaterThan" SetFocusOnError="True" 
                                            ValidationGroup="agendamento"></asp:CompareValidator>
                                        <br />
                                        <br />
                                        <asp:Label ID="lblTelefone" runat="server" EnableViewState="False" 
                                            Font-Bold="True" Font-Size="Small" Text="Telefone:"></asp:Label>
                                    </td>
                                    <td class="style5">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <table class="style4">
                                                    <tr>
                                                        <td class="style6">
                                                            <table class="style12">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblArea0" runat="server" EnableViewState="False" 
                                                                            Font-Bold="True" Font-Size="Small" Text="Área:"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Panel ID="pnlArea" runat="server" Height="300px" ScrollBars="Vertical" 
                                                                Width="250px">
                                                                <asp:CheckBoxList ID="chkArea" runat="server" AutoPostBack="True" 
                                                                    DataTextField="des_unid_lotac" DataValueField="cod_unid_lotac" 
                                                                    Font-Size="X-Small" Width="250px">
                                                                </asp:CheckBoxList>
                                                            </asp:Panel>
                                                        </td>
                                                        <td>
                                                            <table class="style12">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblParticipante0" runat="server" EnableViewState="False" 
                                                                            Font-Bold="True" Font-Size="Small" Height="16px" Text="Participante:"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Panel ID="pnlParticipante" runat="server" Height="300px" 
                                                                ScrollBars="Vertical" Width="250px">
                                                                <asp:CheckBoxList ID="chkParticipante" runat="server" DataTextField="Nome" 
                                                                    DataValueField="Matricula" Font-Size="X-Small" Width="250px">
                                                                </asp:CheckBoxList>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5" valign="top">
                                        <br />
                                        <asp:TextBox ID="txtTelefone" runat="server" EnableViewState="False" 
                                            Font-Size="Small" MaxLength="14" onkeypress="mascara(this,telefone)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtTelefone" ErrorMessage="Campo Obrigatório" 
                                            SetFocusOnError="True" ValidationGroup="agendamento"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                        <asp:Label ID="lblObs" runat="server" EnableViewState="False" Font-Bold="True" 
                                            Font-Size="Small" Text="Observação:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtObservacao" runat="server" Height="200px" 
                                            TextMode="MultiLine" Width="350px"></asp:TextBox>
                                    </td>
                                    <td class="style5">
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <asp:Panel ID="pnlRecurso" runat="server" Height="300px" ScrollBars="Vertical" 
                                            Width="250px">
                                            <asp:Label ID="lblRecurso" runat="server" EnableViewState="False" 
                                                Font-Bold="True" Font-Size="Small" Height="16px" Text="Recursos:"></asp:Label>
                                            <asp:CheckBoxList ID="chkRecurso" runat="server" DataTextField="Nm_Recurso" 
                                                DataValueField="Cd_Recurso" Font-Size="X-Small" Width="250px">
                                            </asp:CheckBoxList>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:CheckBox ID="chkConvite" runat="server" Font-Size="Small" 
                        Text="Enviar convite para outlook" 
                        ToolTip="Enviar convite para o email dos participantes selecionados" />
                    <br />
                    <br />
                    <asp:ImageButton ID="btnSalvar" ToolTip="Salvar" runat="server" ImageUrl="~/Icones/disquete.jpg" 
                        style="height: 22px" ValidationGroup="agendamento" Width="22px" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="btnVoltar0" ToolTip="Voltar" runat="server" ImageUrl="~/Icones/voltar.jpg" 
                        Width="22px" />
                </asp:Panel>
                <br />
                
                <br />
                <br />
                &nbsp;
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </asp:View>
            <br />
            <br />
            <br />
        </asp:MultiView>
        <br />
    
    </div>
    </form>
</body>
</html>
