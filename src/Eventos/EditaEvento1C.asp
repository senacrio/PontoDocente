<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->
<%response.buffer = true
response.Expires = 0
IdEvento=trim(CStr(Request.QueryString("IDEVENTO")))

Set EventoS = Server.CreateObject("ADODB.Recordset")
EventoS.ActiveConnection = MM_CXEVENTO_STRING
EventoS.Source = "SELECT * FROM EVENTO WHERE IDEVENTO= " + IdEvento
EventoS.CursorType = 0
EventoS.CursorLocation = 2
EventoS.LockType = 1

EventoS.Open()

NomeEvento=cstr(trim(EventoS.Fields.Item("NOMEEVENTO").Value))
Data=cstr(trim(EventoS.Fields.Item("DATA").value))
Horario=cstr(trim(EventoS.Fields.Item("HORA").Value))
IdLocal=EventoS.Fields.Item("IDLOCAL").Value
IdUnidade=EventoS.Fields.Item("IDUNIDADE").Value
IdSigla=EventoS.Fields.Item("IDSIGLA").Value
IdAreaCon=EventoS.Fields.Item("IDAREACON").Value
GVenda=EventoS.Fields.Item("GVENDA").Value
Entrada=cstr(trim(EventoS.Fields.Item("ENTRADA").Value))
IdTipoEvento=EventoS.Fields.Item("IDTIPOEVENTO").Value
PartSenac=EventoS.Fields.Item("PARTSENAC").Value
IdPF=EventoS.Fields.Item("IDPUBLICOPF").Value
IdPJ=EventoS.Fields.Item("IDPUBLICOPJ").Value
IdOu=EventoS.Fields.Item("IDPUBLICOOUT").Value
IdObjetivo=EventoS.Fields.Item("IDOBJETIVO").Value
EstimaPublico=cstr(trim(EventoS.Fields.Item("ESTIMAPUBLICO").Value))
Avalia=cstr(trim(EventoS.Fields.Item("AVALIA").Value))
IdAcao=EventoS.Fields.Item("IDACAO").Value
Material=cstr(trim(EventoS.Fields.Item("MATERIAL").Value))
FilmeFoto=cstr(trim(EventoS.Fields.Item("FILMEFOTO").Value))
Custo=cstr(trim(EventoS.Fields.Item("CUSTO").Value))
Investimento=cstr(trim(EventoS.Fields.Item("INVESTIMENTO").Value))
Orcamento=cstr(trim(EventoS.Fields.Item("ORCAMENTO").Value))
Receita=EventoS.Fields.Item("RECEITA").Value
ParcPatro=cstr(trim(EventoS.Fields.Item("PARC_PATRO").Value))
GDivulgacao=EventoS.Fields.Item("IDDIVULGACAO").Value
IdStatus=EventoS.Fields.Item("IDSTATUS").Value
TipoEventoOU=cstr(trim(EventoS.Fields.Item("TIPOEVENTOOU").Value))
AcaoQual=cstr(trim(EventoS.Fields.Item("ACAOQUAL").Value))
ObjetivoOu=cstr(trim(EventoS.Fields.Item("OBJETIVOOU").Value))
Venda=cstr(trim(EventoS.Fields.Item("VENDA").Value))
AvaliaQual=cstr(trim(EventoS.Fields.Item("AVALIAQUAL").Value))
ValorEntrada=cstr(trim(EventoS.Fields.Item("VALORENTRADA").Value))
PFOutro=cstr(trim(EventoS.Fields.Item("PFOUTRO").Value))
PJOutro=cstr(trim(EventoS.Fields.Item("PJOUTRO").Value))
POOutro=cstr(trim(EventoS.Fields.Item("POOUTRO").Value))
DivulgaQual=cstr(trim(EventoS.Fields.Item("DIVULGAQUAL").Value))
Ano=cstr(trim(EventoS.Fields.Item("Ano").Value))
Mes=cstr(trim(EventoS.Fields.Item("Mes").Value))
Dia=cstr(trim(EventoS.Fields.Item("Dia").Value))
AnoF=cstr(trim(EventoS.Fields.Item("AnoF").Value))
MesF=cstr(trim(EventoS.Fields.Item("MesF").Value))
DiaF=cstr(trim(EventoS.Fields.Item("DiaF").Value))
Realizador=cstr(trim(EventoS.Fields.Item("Realizador").Value))
UP=(trim(EventoS.Fields.Item("UPart").Value))
FecObs=cstr(trim(EventoS.Fields.Item("OBS").Value))
GFec=cstr(trim(EventoS.Fields.Item("FECO").Value))
Responsavel=cstr(trim(EventoS.Fields.Item("Responsavel").Value))
Visitante=cstr(trim(EventoS.Fields.Item("Visitante").Value))
Fecomercio=cstr(trim(EventoS.Fields.Item("Fecomercio").Value))
Patrocina=cstr(trim(EventoS.Fields.Item("Patrocina").Value))

Dim Unidade
Dim Unidade_numRows

Set Unidade = Server.CreateObject("ADODB.Recordset")
Unidade.ActiveConnection = MM_CXEVENTO_STRING
Unidade.Source = "SELECT IDUNIDADE, NOMEUNIDADE FROM UNIDADERESP WHERE STATUS='A'"
Unidade.CursorType = 0
Unidade.CursorLocation = 2
Unidade.LockType = 1
Unidade.Open()

Unidade_numRows = 0
%>
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
<style>
body { 
SCROLLBAR-FACE-COLOR: #6699FF;
SCROLLBAR-HIGHLIGHT-COLOR: #6699FF;
SCROLLBAR-SHADOW-COLOR: yellow;
SCROLLBAR-3DLIGHT-COLOR: blue;
SCROLLBAR-ARROW-COLOR: white;
SCROLLBAR-TRACK-COLOR: white;
SCROLLBAR-DARKSHADOW-COLOR: white;
}
</style>
<title>SENAC - RIO - Edita Ficha de Eventos não publicados</title><body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="758" height="2076" border=0 align="center" bgcolor="#FFFFFF">
  <tr align="center" ><img src="images/BANNER1.gif"></tr>
  <tr align="center">
    <td><!-- Form code created by Web Form Designer 1.2.1 -->
 <script type="text/javascript">
function CadEventos_CF(){
var errormessage = new String();
var vF = document.forms["CadEventos"];
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
if(CadEventos_WithoutSelectionValue(vF["mnu_unidade"])){errormessage += "\n\nPlease select something from the\"mnu_unidade\" drop-down list";}
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
        <div id="WFDForm" style="position:relative;left:0px;top:20px;width:600px;height:2231px;background-color:#FFFFFF;">
          <form name="CadEventos" action="EDITAGRAVAEVENTO.asp" method="POST" enctype="application/x-www-form-urlencoded" onSubmit="return CadEventos_CF();">
            <div id="PARCEIRO" style="position:absolute;z-index:2005;left:5px;top:1939px;width:590px;height:53px;background:#FFFFFF;"> 
              <!--#include file="INCPARCEIRO.ASP" --></div>
            <div id="RECEITA" style="position:absolute;z-index:2005;left:4px;top:1889px;width:588px;height:32px;background:#FFFFFF">
              <!--#include file="INCRECEITA.ASP" -->
            </div>
            
            <div id="WFDObj7" style="position:absolute;z-index:7;left:5px;top:1842px;width:588px;height:32px;background:#FFFFFF">
              <!--#include file="INCCUSTOORC.ASP" --></div>
            <div id="WFDObj8" style="position:absolute;z-index:8;left:5px;top:1833px;width:214px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;"> 
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>6<font color="#333333">.3
                ORÇAMENTO TOTAL PREVISTO?</font></strong></font></div>
            </div>
            <div id="WFDObj11" style="position:absolute;z-index:11;left:4px;top:1618px;width:590px;height:53px;background:#FFFFFF;">
              <!--#include file="INCMATERIAL.ASP" -->
            </div>
            <div id="WFDObj12" style="position:absolute;z-index:12;left:5px;top:1607px;width:541px;height:14px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">5.2 INFORMAR QUANTIDADE ESTIMADA DE MATERIAL
                A SER USADO (folhetos,panfletos,etc)</font></strong></div>
            </div>
            <div id="WFDObj15" style="position:absolute;z-index:15;left:4px;top:1482px;width:225px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">5.1 QUAL O PLANO DE DIVULGAÇÃO?</font></strong></div>
            </div>
            <div id="WFDObj14" style="position:absolute;z-index:14;left:5px;top:1494px;width:590px;height:109px;background:#FFFFFF">
              <!--#include file="INCDIVULG.ASP" -->
            </div>
            <div id="WFDObj26" style="position:absolute;z-index:26;left:3px;top:1125px;width:236px;height:11px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>4.3
              HAVERÁ OUTRAS PARTICIPAÇÕES?</strong></font></div>
            </div>
            <div id="WFDObj27" style="position:absolute;z-index:27;left:3px;top:1137px;width:588px;height:79px;background:#FFFFFF">
              <!--#include file="INCOUTP.ASP" -->
            </div>
            <div id="WFDObj61" style="position:absolute;z-index:61;left:6px;top:744px;width:85px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">3.2 ENTRADA</font></strong></div>
            </div>
            <div id="ENTRADA" style="position:absolute;z-index:2007;left:4px;top:756px;width:587px;height:29px;background:#FFFFFF;">
              <!--#include file="INCENTRADA.ASP" -->
            </div>
            <div id="WFDObj62" style="position:absolute;z-index:62;left:6px;top:682px;width:424px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">3.1
              PREVISÃO DE VENDAS DE PRODUTOS (livros,cursos,consultoria,etc)</font></strong></div>
            </div>
            <div id="WFDObj53" style="position:absolute;z-index:53;left:7px;top:693px;width:588px;height:45px;background:#FFFFFF">
              <!--#include file="INCVENDA.ASP" -->
            </div>
            <div id="WFDObj68" style="position:absolute;z-index:68;left:6px;top:7px;width:590px;height:199px;background:#FFFFFF;"> 
              <!--#include file="INCheadera.ASP" --></div>
            <input type="submit" name="Enviar" value="Enviar" tabindex="4" style="position:absolute;z-index:71;left:512px;top:2169px;width:78px;height:31px;font-size:10pt;font-family:Arial;font-weight:normal;font-style:normal;color:#FFFFFF;background-color:#0000FF;border-style:inset;">
            <div id="Layer1" style="position:absolute; width:589px; height:165px; background-color:#FFFFFF; layer-background-color:#FFFFFF; border:1px none #000000; z-index:1; left: 6px; top: 1998px;">
              <!--#include file="INCSUPL.ASP" --></div>
            <div id="WFDObj85" style="position:absolute;z-index:85;left:6px;top:432px;width:169px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>2. ÁREA
              DE CONHECIMENTO</strong></font></div>
            </div>
            <div id="WFDObj5" style="position:absolute;z-index:5;left:6px;top:445px;width:588px;height:128px;background:#FFFFFF">
              <!--#include file="INCAREAC.ASP" -->
            </div>
            <div id="IMPRESSORA" style="position:absolute; z-index:113; left:612px; top:8px; width:34px; height:28px; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;">
            <a href="ImprimeEvento.asp?idevento=<%=idevento%>"><img src="images/PRINTERS.ICO" border="0"></a>
			</div>
			
			
			
			
			<div id="WFDObj113" style="position:absolute; z-index:113; left:-43px; top:4px; width:25px; height:248px; font-size:12pt; font-family:Verdana; font-weight:bold; font-style:normal; text-align:center; color:#E80000; background-color: #6699FF; layer-background-color: #6699FF; border: 1px none #000000;"> 
			
			
			
			  <div align="center"><font color="#FFFFFF">		          <font size="2" face="Arial, Helvetica, sans-serif"><font color="#0066FF" size="2" face="Arial, Helvetica, sans-serif"><strong><br>
                    <font color="#FFFFFF">E<br>
              D<br>
              I<br>
              T<br>
              A<br>
              <br>
              E<br>
              V<br>
              E<br>
              N<br>
              T<br>
              O<br>
              <br>
              N<br>
              &Atilde;<br>
              O<br>
              <br>
              P<br>
              U<br>
              B<br>
              L<br>
              I<br>
              C<br>
              A<br>
              D<br>
              O<br>
              <br>
              </font></strong></font></div>
            </div>
            <div id="WFDObj146" style="position:absolute;z-index:146;left:7px;top:308px;width:283px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">1.1
              OBJETIVO DA PARTICIPAÇÃO SENAC RIO:</font></strong></div>
            </div>
            <div id="WFDObj70" style="position:absolute;z-index:70;left:7px;top:324px;width:588px;height:104px;background:#FFFFFF;">
              <!--#include file="INCOBJ1.ASP" -->
            </div>
            <div id="WFDObj170" style="position:absolute;z-index:170;left:7px;top:577px;width:350px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">3.
                    AÇÕES DESENVOLVIDAS / PROGRAMAÇÕES
              SENAC RIO</font></strong></div>
            </div>
            <div id="WFDObj156" style="position:absolute;z-index:156;left:6px;top:591px;width:589px;height:86px;background:#FFFFFF;">
              <!--#include file="INCACAO.ASP" -->
            </div>
            <div id="WFDObj173" style="position:absolute;z-index:173;left:7px;top:789px;width:361px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>3.3
                  DESCRIÇÃO DETALHADA DA PARTICIPAÇÃO SENAC
                RIO</strong></font></div>
            </div>
            <div id="WFDObj174" style="position:absolute;z-index:174;left:6px;top:801px;width:588px;height:53px;background:#FFFFFF">
              <!--#include file="INCDESCPART.ASP" -->
            </div>
			<div id="WFDObj234" style="position:absolute; z-index:234; left:7px; top:864px; width:518px; height:12px; font-size:8pt; font-family:Verdana; font-weight:normal; font-style:normal; text-align:center; color:#000000; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;"> 
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>3.4
               EST&Aacute; PREVISTA A PARTICIPA&Ccedil;&Atilde;O DO FECOM&Eacute;RCIO?
               COMO PODERIA SER ESTA PARTICIPA&Ccedil;&Atilde;O?</strong></font></div>
            </div>
			<div id="publico" style="position:absolute;z-index:7;left:7px;top:877px;width:584px;height:55px;background:#FFFFFF;border-color:#FF8040">
              <!--#include file="INCFECOMERCIO.ASP" -->
            </div>
            <div id="WFDObj187" style="position:absolute;z-index:187;left:3px;top:945px;width:268px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">4.1
                    QUAL O PÚLICO-ALVO (PESSOA FÍSICA)?</font></strong></div>
            </div>
            <div id="WFDObj52" style="position:absolute;z-index:52;left:3px;top:956px;width:588px;height:77px;background:#FFFFFF">
              <!--#include file="INCPF.ASP" -->
            </div>
            <div id="WFDObj191" style="position:absolute;z-index:191;left:4px;top:1307px;width:588px;height:53px;background:#FFFFFF"> 
              <!--#include file="INCPUB.ASP" --></div>
            <div id="WFDObj193" style="position:absolute;z-index:193;left:5px;top:1293px;width:231px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000040;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">4.5
              QUAL A ESTIMATIVA DE PÚBLICO?</font></strong></div>
            </div>
            <div id="WFDObj194" style="position:absolute;z-index:194;left:2px;top:1379px;width:588px;height:42px;background:#FFFFFF;">
              <!--#include file="INCREACAO.ASP" -->
            </div>
			<div id="publico" style="position:absolute;z-index:7;left:2px;top:1444px;width:588px;height:33px;background:#FFFFFF;border-color:#FF8040">
              <!--#include file="INCVISITANTE.ASP" -->
            </div>
			<div id="publico" style="position:absolute;z-index:7;left:7px;top:1235px;width:588px;height:55px;background:#FFFFFF;border-color:#FF8040">
              <!--#include file="INCPATROCINA.ASP" -->
            </div>
			 <div id="WFDObj234" style="position:absolute; z-index:234; left:4px; top:1219px; width:518px; height:8px; font-size:8pt; font-family:Verdana; font-weight:normal; font-style:normal; text-align:center; color:#000000; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;"> 
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>4.4
                    INFORMAR OS PATROCINADORES DO EVENTO</strong></font></div>
            </div>
			<div id="WFDObj234" style="position:absolute; z-index:234; left:4px; top:1430px; width:330px; height:11px; font-size:8pt; font-family:Verdana; font-weight:normal; font-style:normal; text-align:center; color:#000000; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;"> 
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>4.7
               SER&Aacute; FEITO O CADASTRO DE VISITANTES(MAILING LIST)?</strong></font></div>
            </div>
            <div id="WFDObj211" style="position:absolute;z-index:211;left:3px;top:1688px;width:588px;height:60px;background:#FFFFFF">
              <!--#include file="INCFOTO.ASP" --></div>
        
          <div id="WFDObj213" style="position:absolute;z-index:213;left:4px;top:1677px;width:315px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
            <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">5.3 O EVENTO SERÁ FOTOGRAFADO
            E /OU FILMADO?</font></strong></div>
          </div>
          <div id="WFDObj219" style="position:absolute;z-index:219;left:4px;top:1754px;width:478px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;"> 
            <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">6.1
              CUSTOS FORAM LANÇADOS PREVIAMENTE NO ORÇAMENTO DE SUA UNIDADE</font></strong></div>
          </div>
          <div id="WFDObj220" style="position:absolute;z-index:220;left:4px;top:1766px;width:588px;height:20px;background:#FFFFFF;">
<!--#include file="INCLANCORC.ASP" -->
</div>
          <div id="WFDObj225" style="position:absolute;z-index:225;left:5px;top:1791px;width:473px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000040;"> 
            <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>6.2
              O EVENTO EM QUESTÃO CONTA COM INVESTIMENTO INTANGÍVEL (da Sede)</strong></font></div>
          </div>

		  <div id="WFDObj4" style="position:absolute;z-index:4;left:4px;top:1802px;width:588px;height:23px;background:#FFFFFF">
         <!--#include file="INCINVEST.ASP" -->
		 </DIV>
          <div id="WFDObj232" style="position:absolute;z-index:232;left:5px;top:1879px;width:190px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000040;"> 
            <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>6.4
              RECEITA TOTAL PREVISTA?</strong></font></div>
          </div>
          <div id="WFDObj234" style="position:absolute;z-index:234;left:6px;top:1925px;width:410px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;"> 
            <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">6.5 É POSSIVEL
              BUSCAR PARCEIROS E/OU PATROCINADORES PARA O EVENTO. QUAIS?</font></strong></div>
          </div>
          <div id="WFDObj235" style="position:absolute;z-index:235;left:6px;top:207px;width:136px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <strong><font size="1" face="Times New Roman, Times, serif">1.
            O QUE É O EVENTO?</font></strong></div>
          <div id="WFDObj69" style="position:absolute;z-index:69;left:6px;top:219px;width:588px;height:87px;background:#FFFFFF">
            <!--#include file="INCTIPO1.ASP" -->
          </div>
          <div id="WFDObj236" style="position:absolute;z-index:236;left:3px;top:1037px;width:282px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <font size="1" face="Times New Roman, Times, serif"><strong>4.2
            QUAL O PÚBLICO-ALVO (PESSOA JURÍDICA)?</strong></font></div>
          <div id="WFDObj40" style="position:absolute;z-index:40;left:3px;top:1049px;width:588px;height:73px;background:#FFFFFF">
            <!--#include file="INCPJ.ASP" -->
          </div>
          <div id="WFDObj237" style="position:absolute;z-index:237;left:2px;top:1364px;width:394px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#D90000;">
            <div align="left"><strong><font color="#000000" size="1" face="Times New Roman, Times, serif">4.6
                  SERÁ FEITA A AVALIAÇÃO DE REAÇÃO cadastro de vsitantes?</font></strong></div>
          </div>
<input name="IDEVENTO" type="hidden" value="<%=IDEVENTO%>">
          </form>
      </div>
        <br>
    </td>
  </tr>
</table>
<div align="center">  <%
Unidade.Close()
Set Unidade = Nothing
%>
  <%
EventoS.Close()
Set EventoS = Nothing
%>
  <a href="MENUEL.ASP"><img src="images/seta03.gif" width="33" height="33" border="0"></a></div>
