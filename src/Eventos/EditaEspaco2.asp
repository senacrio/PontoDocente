<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%response.buffer = true
response.Expires = 0
IdEspaco=trim(CStr(Request.QueryString("IDESPACO")))

Dim UnidadeResp
Dim Unidade_numRows

Set UnidadeResp = Server.CreateObject("ADODB.Recordset")
UnidadeResp.ActiveConnection = MM_CXEVENTO_STRING
UnidadeResp.Source = "SELECT IDUNIDADE, NOMEUNIDADE FROM UNIDADERESP WHERE STATUS='A'"
UnidadeResp.CursorType = 0
UnidadeResp.CursorLocation = 2
UnidadeResp.LockType = 1
UnidadeResp.Open()
Unidade_numRows = 0

Set EventoS = Server.CreateObject("ADODB.Recordset")
EventoS.ActiveConnection = MM_CXEVENTO_STRING
EventoS.Source = "SELECT * FROM ESPACO WHERE IDESPACO= " + IdEspaco 
EventoS.CursorType = 0
EventoS.CursorLocation = 2
EventoS.LockType = 1
EventoS.Open()

wmes=cstr(trim(EventoS.Fields.Item("MES").Value))
wano=cstr(trim(EventoS.Fields.Item("ANO").Value))
wNomeEvento=cstr(trim(EventoS.Fields.Item("NOMEEVENTO").Value))
wUnidade=cstr(trim(EventoS.Fields.Item("UNIDADE").Value))
wResponsavel=cstr(trim(EventoS.Fields.Item("RESPONSAVEL").Value))
wLocatario=cstr(trim(EventoS.Fields.Item("LOCATARIO").Value))
wTelefone=cstr(trim(EventoS.Fields.Item("TELEFONE").Value))
wObjetivo=cstr(trim(EventoS.Fields.Item("OBJETIVO").Value))
wParticipante=cstr(trim(EventoS.Fields.Item("PARTICIPANTE").Value))
wData=cstr(trim(EventoS.Fields.Item("DATA").Value))
wHorario=cstr(trim(EventoS.Fields.Item("HORA").Value))
wDefinicaoQual=cstr(trim(EventoS.Fields.Item("DEFINICAOQUAL").Value))
wEquipamentoQual=cstr(trim(EventoS.Fields.Item("EQUIPAMENTOQUAL").Value))
wLocalQual=cstr(trim(EventoS.Fields.Item("LOCALQUAL").Value))
wValor=cstr(trim(EventoS.Fields.Item("VALOR").Value))
wValorEntrada=cstr(trim(EventoS.Fields.Item("VALORENTRADA").Value))
wObs=cstr(trim(EventoS.Fields.Item("OBS").Value))
wDefinicao=cstr(trim(EventoS.Fields.Item("DEFINICAO").Value))
wForma=cstr(trim(EventoS.Fields.Item("FORMA").Value))
wEquipamento=cstr(trim(EventoS.Fields.Item("EQUIPAMENTO").Value))
wMobilia=cstr(trim(EventoS.Fields.Item("MOBILIARIO").Value))
wEntrada=cstr(trim(EventoS.Fields.Item("ENTRADA").Value))
wLocal=cstr(trim(EventoS.Fields.Item("LOCAL").Value))
wBeneficio=cstr(trim(EventoS.Fields.Item("BENEFICIO").Value))
wMobiliaDesc=cstr(trim(EventoS.Fields.Item("MOBILIADESC").Value))
%>

<title>SENAC = RIO - Cadastro de Eventos</title>
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
<body bgcolor="#FFFFFF" background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="719" height="1222" border=0 align="center" bgcolor="#FFFFff">
<tr align="center"><img src="images/BANNER1.gif" ></tr>
<tr align="center">
<td><!-- Form code created by Web Form Designer 1.2.1 -->
        <script type="text/javascript">
function CadEspaco_CF(){
var errormessage = new String();
var vF = document.forms["CadEspaco"];
if(CadEventos_WithoutContent(vF["nomeevento"].value)){errormessage += "\n\nNome Evento obrigatório";}
//if(CadEventos_NotAlphanumeric(vF["nomeevento"].value)){errormessage += "\n\n \"nomeevento\" can only contain alphanumeric characters";}
//if(CadEventos_WithoutContent(vF["Horario"].value)){errormessage += "\n\nHorário obrigatório";}
//if(CadEventos_WithoutContent(vF["EstimaPublico"].value)){errormessage += "\n\nEstimativa de Público Obrigatório";}
//if(CadEventos_WithoutContent(vF["PartSenac"].value)){errormessage += "\n\nParticipação Senac obrigatório";}
//if(CadEventos_WithoutContent(vF["Material"].value)){errormessage += "\n\nMaterial utilizado obrigatório";}
//if(CadEventos_WithoutContent(vF["Orcamento"].value)){errormessage += "\n\nOrçamento obrigatório";}
//if(CadEventos_WithoutContent(vF["Receita"].value)){errormessage += "\n\nReceita obrigatória";}
//if(CadEventos_WithoutContent(vF["Parceito"].value)){errormessage += "\n\nParceiro obrigatório";}
//if(CadEventos_WithoutContent(vF["FilmeFoto"].value)){errormessage += "\n\nFilmado e fotografado obrigatório";}
//if(CadEventos_WithoutSelectionValue(vF["mnu_local"])){errormessage += "\n\nPlease select something from the\"mnu_local\" drop-down list";}
if(CadEventos_WithoutSelectionValue(vF["unidade"])){errormessage += "\n\nPlease select something from the\"unidade\" drop-down list";}
//if(!vF.OQUEE[0].checked && !vF.OQUEE[1].checked && !vF.OQUEE[2].checked && !vF.OQUEE[3].checked && !vF.OQUEE[4].checked && !vF.OQUEE[5].checked && !vF.OQUEE[6].checked && !vF.OQUEE[7].checked && !vF.OQUEE[8].checked) {errormessage += "\n\nSelecione alguma opção em 1. O que é o Evento?";}

//if(!vF.Objetivo[0].checked && !vF.Objetivo[1].checked && !vF.Objetivo[2].checked && !vF.Objetivo[3].checked && !vF.Objetivo[4].checked && !vF.Objetivo[5].checked && !vF.Objetivo[6].checked && !vF.Objetivo[7].checked) {errormessage += "\n\nSelecione alguma opção em 1.1. Qual o objetivo da participação do SENAC?";}

//if(!vF.Conhecimento[0].checked && !vF.Conhecimento[1].checked && !vF.Conhecimento[2].checked && !vF.Conhecimento[3].checked && !vF.Conhecimento[4].checked && !vF.Conhecimento[5].checked && !vF.Conhecimento[6].checked && !vF.Conhecimento[7].checked && !vF.Conhecimento[8].checked && !vF.Conhecimento[9].checked && !vF.Conhecimento[10].checked && !vF.Conhecimento[11].checked && !vF.Conhecimento[12].checked && !vF.Conhecimento[13].checked && !vF.Conhecimento[14].checked && !vF.Conhecimento[15].checked && !vF.Conhecimento[16].checked && !vF.Conhecimento[17].checked && !vF.Conhecimento[18].checked) {errormessage += "\n\nSelecione alguma opção em 2. Área de conhecimento?";}

//if(!vF.Acao[0].checked && !vF.Acao[1].checked && !vF.Acao[2].checked && !vF.Acao[3].checked && !vF.Acao[4].checked && !vF.Acao[5].checked ) {errormessage += "\n\nSelecione alguma opção em 3. Ações desenvolvidas?";}

//if(!vF.GVenda[0].checked && !vF.GVenda[1].checked) {errormessage += "\n\nSelecione alguma opção em 3.1.   Previsão de Vendas";}
//if(!vF.Entrada[0].checked && !vF.Entrada[1].checked) {errormessage += "\n\nSelecione alguma opção em 3.2.   Entrada";}

//if(!vF.PJ[0].checked && !vF.PJ[1].checked && !vF.PJ[2].checked && !vF.PJ[3].checked && !vF.PJ[4].checked && !vF.PJ[5].checked) {errormessage += "\n\nSelecione alguma opção em 4.1. Alvo Pessoa Jurídica";}

//if(!vF.PF[0].checked && !vF.PF[1].checked && !vF.PF[2].checked && !vF.PF[3].checked && !vF.PF[4].checked) {errormessage += "\n\nSelecione alguma opção em 4.2. Alvo Pessoa Física";}

//if(!vF.GOutraPar[0].checked && !vF.GOutraPar[1].checked && !vF.GOutraPar[2].checked && !vF.GOutraPar[3].checked && !vF.GOutraPar[4].checked) {errormessage += "\n\nSelecione alguma opção em 4.4. Alvo Outras Participações";}

//if(!vF.GAvaliacao[0].checked && !vF.GAvaliacao[1].checked) {errormessage += "\n\nSelecione alguma opção em 4.5. Avaliação";}

//if(!vF.GDivulgacao[0].checked && !vF.GDivulgacao[1].checked && !vF.GDivulgacao[2].checked && !vF.GDivulgacao[3].checked && !vF.GDivulgacao[4].checked && !vF.GDivulgacao[5].checked && !vF.GDivulgacao[6].checked && !vF.GDivulgacao[7].checked && !vF.GDivulgacao[8].checked) {errormessage += "\n\nSelecione alguma opção em 5.1. Qual é o plano de divulgação?";}

//if(!vF.GCustos[0].checked && !vF.GCustos[1].checked) {errormessage += "\n\nSelecione alguma opção em 6.1. Custos no orçamento";}

//if(!vF.GInvestimento[0].checked && !vF.GInvestimento[1].checked) {errormessage += "\n\nSelecione alguma opção em 6.2 Investimento intangível";}

if (errormessage.length > 2){
    alert("Existem erros no preenchimento do formulário. Favor corrija-os" + errormessage + "\n");
    return false;
    }
return true;
} // end of CadEventos_CF()

function CadEventos_WithoutContent(ss){
  if (ss.length>0){return false;}
return true;
}

function CadEventos_WithoutCheck(ss){
  if(ss.checked){return false;}
return true;
}

function CadEventos_NotAlphanumeric(ss){
  var charpos = ss.search("[^ A-Za-z0-9']");
  if(ss.length > 0 &&  charpos >= 0){return true;}
return false;
}

function CadEventos_WithoutSelectionValue(ss){
   for(var i = 0; i < ss.length; i++){
     if(ss[i].selected){
       if(ss[i].value.length){return false;}
     }
   }
return true;
}
  </script>
        <noscript>
        <strong>Your browser either does not support JavaScript or it is turned
        off.<br>
      Without Javascript enabled, this form will not function correctly</strong>
        </noscript>
        <div id="WFDForm" style="position:relative; left:0px; top:-15px; width:600px; height:1176px;">
          <form name="CadEspaco" action="GRAVAESPACO1.asp" method="POST" enctype="application/x-www-form-urlencoded" onSubmit="return CadEspaco_CF();">
            <div id="WFDObj26" style="position:absolute;z-index:26;left:8px;top:916px;width:236px;height:10px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>9.
                    MOBILI&Aacute;RIO</strong></font></div>
            </div>
            <div id="WFDObj54" style="position:absolute;z-index:54;left:8px;top:754px;width:590px;height:29px;background:#FFFFFF;border-color:#FF8040">
              <!--#include file="INCENTRADAESP.ASP" -->
            </div>
            <div id="WFDObj68" style="position:absolute;z-index:68;left:4px;top:4px;width:592px;height:224px;background:#FFFFFF;border-color:#0000FF">
              <!--#include file="INCheaderEsp.ASP" -->
            </div>
            <div id="WFDObj61" style="position:absolute;z-index:61;left:8px;top:742px;width:85px;height:11px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>7
                    ENTRADA</strong></font></div>
            </div>
            <div id="WFDObj61" style="position:absolute;z-index:61;left:6px;top:621px;width:85px;height:9px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>6.
                    .LOCAL</strong></font></div>
            </div>
            <div id="WFDObj62" style="position:absolute;z-index:62;left:3px;top:498px;width:424px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>5.
                    DEFINI&Ccedil;&Atilde;O DO EVENTO:</strong></font></div>
            </div>
            <div id="WFDObj53" style="position:absolute;z-index:53;left:6px;top:511px;width:586px;height:109px;background:#FFFFFF">
              <!--#include file="INCDEFESP.ASP" -->
            </div>
            <div id="WFDObj53" style="position:absolute; z-index:53; left:7px; top:630px; w   idth:586px;height:109px; background:#FFFFFF; width: 587px;">
              <!--#include file="INCLOCALESP.ASP" -->
            </div>
            <input type="submit" name="Enviar" value="Enviar" tabindex="201" style="position:absolute; z-index:71; left:514px; top:1160px; width:76px; height:24px; font-size:12pt; font-family:Arial; font-weight:normal; font-style:normal; color:#FFFFFF; border-style:inset; background-color: #0000FF; layer-background-color: #0000FF; border: 1px none #000000;">
            <input type="reset" name="Limpar" value="Limpar" tabindex="200" style="position:absolute; z-index:72; left:14px; top:1159px; width:76px; height:24px; font-size:12pt; font-family:Arial; font-weight:normal; font-style:normal; color:#FFFFFF; border-style:inset; background-color: #0000FF; layer-background-color: #0000FF; border: 1px none #000000;">
            <div id="WFDObj5" style="position:absolute;z-index:5;left:5px;top:379px;width:589px;height:54px;background:#FFFFFF">
              <!--#include file="INCpartesp.ASP" -->
            </div>
            <div id="WFDObj113" style="position:absolute; z-index:113; left:-38px; top:15px; width:28px; height:459px; font-size:13pt; font-family:Verdana; font-weight:Bold; font-style:normal; text-align:center; color:#E80000; background-color: #FF6600; layer-background-color: #FF6600; border: 1px none #000000;">
              <p align="center"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif"><strong><br>
                      <font color="#FFFFFF">C<br>
              A<br>
              D<br>
              A<br>
              S<br>
              T<br>
              R<br>
              O<br>
              <br>
              C<br>
              E<br>
              S<br>
              S<br>
&Atilde;<br>
              O<br>
              <br>
              E<br>
              S<br>
              P<br>
                      </font><font color="#FFFFFF">A</font><br>
                      <font color="#FFFFFF">&Ccedil;</font><br>
                      <font color="#FFFFFF">O</font></strong> </font> </p>
            </div>
			 <div id="IMPRESSORA" style="position:absolute; z-index:113; left:610px; top:16px; width:23px; height:17px; background-color: #0000FF; layer-background-color: #0000FF; border: 1px none #000000;">
            <a href="ImprimeEspaco.asp?idespaco=<%=idespaco%>"><img src="images/PRINTERS.ICO" border="0"></a>
			</div>
            <div id="WFDObj146" style="position:absolute;z-index:146;left:7px;top:367px;width:427px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">3.
                    PARTICIPANTES (Fecom&eacute;rcio, sindicatos,clientes,colaboradores,
                    clientes, etc.)</font></strong></div>
            </div>
            <div id="WFDObj70" style="position:absolute;z-index:70;left:3px;top:243px;width:590px;height:56px;background:#FFFFFF;">
              <!--#include file="INCOBJESP.ASP" -->
            </div>
			<div id="WFDObj70" style="position:absolute;z-index:70;left:5px;top:309px;width:590px;height:56px;background:#FFFFFF;">
              <!--#include file="INCBENEFICIO.ASP" -->
            </div>
			
            <div id="WFDObj170" style="position:absolute;z-index:170;left:6px;top:434px;width:350px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">4.
                    FORMA DE EXECU&Ccedil;&Atilde;O DA CESS&Atilde;O DE ESPA&Ccedil;O:</font></strong></div>
            </div>
            <div id="WFDObj156" style="position:absolute;z-index:156;left:6px;top:446px;width:587px;height:46px;background:#FFFFFF;">
              <!--#include file="INCFORMAESP.ASP" -->
            </div>
            <div id="WFDObj173" style="position:absolute;z-index:173;left:8px;top:1013px;width:361px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>10..
                    QUAL O VALOR DO CONTRATO?</strong></font></div>
            </div>
            <div id="WFDObj173" style="position:absolute;z-index:173;left:7px;top:1085px;width:361px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>11.
                    OBSERVA&Ccedil;&Otilde;ES FINAIS</strong></font></div>
            </div>
            <div id="WFDObj174" style="position:absolute;z-index:174;left:7px;top:1026px;width:588px;height:53px;background:#FFFFFF">
              <!--#include file="INCVALORESP.ASP" -->
            </div>
            <div id="OBS1" style="position:absolute;z-index:174;left:7px;top:1099px;width:588px;height:53px;background:#FFFFFF">
              <!--#include file="INCOBSESP.ASP" -->
            </div>
            <div id="WFDObj187" style="position:absolute;z-index:187;left:9px;top:787px;width:268px;height:9px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>8.
                    EQUIPAMENTO</strong></font></div>
            </div>
            <div id="WFDObj52" style="position:absolute;z-index:52;left:7px;top:801px;width:588px;height:110px;background:#FFFFFF">
              <!--#include file="INCEQUIPAESP.ASP" -->
            </div>
            <div id="WFDObj235" style="position:absolute;z-index:235;left:7px;top:232px;width:346px;height:7px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <strong><font size="1" face="Times New Roman, Times, serif">&nbsp;1.
                  OBJETIVO DO LOCAT&Aacute;RIO COM A CESS&Atilde;O DE ESPA&Ccedil;O</font></strong></div>
             <div id="WFDObj235" style="position:absolute;z-index:235;left:7px;top:299px;width:584px;height:7px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <strong><font size="1" face="Times New Roman, Times, serif">&nbsp;2.
                  OBJETIVO DA CESS&Atilde;O PARA O SENAC. QUAL O BENEF&Iacute;CIO
                  DO SENAC COM ESSA CESS&Atilde;O (CONTRAPARTIDA)?</font></strong></div>
			 <div id="WFDObj40" style="position:absolute;z-index:40;left:8px;top:930px;width:588px;height:78px;background:#FFFFFF">
              <!--#include file="INCMOBESP.ASP" -->
            </div>
			<input name="IDESPACO" type="hidden" value="<%=IDESPACO%>">
          </form>
      </div>
    </td>
  </tr>
</table>
<%
UnidadeResp.Close()
Set UnidadeResp = Nothing
%>
<div align="center"><a href="MENUCE.ASP"><br>
  <img src="images/seta03.gif" width="33" height="33" border="0"></a></div>
