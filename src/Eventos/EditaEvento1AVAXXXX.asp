
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
PartSenac=cstr(trim(EventoS.Fields.Item("PARTSENAC").Value))
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
Receita=cstr(trim(EventoS.Fields.Item("RECEITA").Value))
'response.write(Receita)
'response.end
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
Realizador=cstr(trim(EventoS.Fields.Item("Realizador").Value))
UP=(trim(EventoS.Fields.Item("UPart").Value))
FecObs=cstr(trim(EventoS.Fields.Item("OBS").Value))
GFec=cstr(trim(EventoS.Fields.Item("FECO").Value))
Responsavel=cstr(trim(EventoS.Fields.Item("Responsavel").Value))

Dim Cat
Dim Cat_numRows

Set Cat = Server.CreateObject("ADODB.Recordset")
Cat.ActiveConnection = MM_CXEVENTO_STRING
Cat.Source = "SELECT * FROM CATEGORIA WHERE STATUS='A'"
Cat.CursorType = 0
Cat.CursorLocation = 2
Cat.LockType = 1
Cat.Open()

Cat_numRows = 0
%>

<%
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
<title>SENAC - Analisa Eventos </title>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
<body background="images/FUNDOGS.GIF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table height="2357" border=0 align="center" bgcolor="#FFFFFF">
  <tr align="center" ><img src="images/BANNER1.gif" ></tr>
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
//if(CadEventos_WithoutContent(vF["Parceito"].value)){errormessage += "\n\nParceiro obrigatório";}
//if(CadEventos_WithoutContent(vF["FilmeFoto"].value)){errormessage += "\n\nFilmado e fotografado obrigatório";}

//if(!vF.OQUEE[0].checked && !vF.OQUEE[1].checked && !vF.OQUEE[2].checked && !vF.OQUEE[3].checked && !vF.OQUEE[4].checked && !vF.OQUEE[5].checked && !vF.OQUEE[6].checked && !vF.OQUEE[7].checked && !vF.OQUEE[8].checked) {errormessage += "\n\nSelecione alguma opção em 1. O que é o Evento?";}

//if(!vF.Objetivo[0].checked && !vF.Objetivo[1].checked && !vF.Objetivo[2].checked && !vF.Objetivo[3].checked && !vF.Objetivo[4].checked && !vF.Objetivo[5].checked && !vF.Objetivo[6].checked && !vF.Objetivo[7].checked) {errormessage += "\n\nSelecione alguma opção em 1.1. Qual o objetivo da participação do SENAC?";}

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
        <div id="WFDForm" style="position:relative; left:0px; top:-1px; width:603px; height:2477px; background-color:#FFFFFF; z-index: 1;">
          <form name="CadEventos" action="EDITAGRAVAEVENTOAVA.asp" method="POST" enctype="application/x-www-form-urlencoded" onSubmit="return CadEventos_CF();">
            <div id="RECEITA1" style="position:absolute; z-index:2005; left:9px; top:2183px; width:587px; height:50px; background:#FFFFFF">
            <!--#include file="INCRECEITA1.ASP" -->
          </div>
          <div id="OPORTUNIDADE" style="position:absolute;z-index:2005;left:7px;top:1914px;width:588px;height:56px;background:#FFFFFF;">
           <!--#include file="INCoportunidade.ASP" -->
          </div>

			<div id="ORCAMENTO" style="position:absolute; z-index:2005; left:9px; top:2133px; width:588px; height:32px; background:#FFFFFF;">
              <!--#include file="INCCUSTOORC.ASP" -->
            </div>
            <div id="WFDObj8" style="position:absolute;z-index:12;left:10px;top:2122px;width:214px;height:14px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">8.1.
                    CUSTO TOTAL DO EVENTO</font></strong></div>
            </div>
            <div id="WFDObj8" style="position:absolute;z-index:12;left:9px;top:2171px;width:587px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">8.2.
                    RECEITA(valor da receita e forma de aquisi&ccedil;&atilde;o:patroc&iacute;nio,fornecedores,vendas
                    de ingresso,material</font></strong></div>
            </div>
            <div id="WFDObj8" style="position:absolute;z-index:12;left:11px;top:2108px;width:214px;height:14px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>8.
                    CUSTOS</strong></font></div>
            </div>
            <div id="TitMaterial" style="position:absolute;z-index:16;left:8px;top:1416px;width:541px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>5.2
                    INFORMAR QUANTIDADE ESTIMADA DE MATERIAL USADO (folhetos,panfletos,etc)</strong></font></div>
            </div>
            <div id="MATERIAL" style="position:absolute;z-index:2005;left:9px;top:1430px;width:588px;height:53px;background:#FFFFFF;">
              <!--#include file="INCMATERIAL.ASP" -->
            </div>
            <div id="WFDObj15" style="position:absolute;z-index:19;left:10px;top:1273px;width:269px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">5.DIVULGA&Ccedil;&Atilde;O</font></strong></div>
            </div>
            <div id="WFDObj15" style="position:absolute;z-index:19;left:11px;top:1289px;width:269px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>5.1
                    QUAL A DIVULGA&Ccedil;&Atilde;O QUE FOI FEITA?</strong></font></div>
            </div>
            <div id="DIVULGACAO" style="position:absolute;z-index:2005;left:8px;top:1301px;width:586px;height:108px;background:#FFFFFF">
              <!--#include file="INCDIVULG.ASP" -->
            </div>
            <div id="ENTRADATIT" style="position:absolute;z-index:2005;left:11px;top:799px;width:82px;height:9px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>3.2.
                    ENTRADA</strong></font></div>
            </div>
            <div id="TITOU" style="position:absolute;z-index:2005;left:8px;top:1108px;width:314px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <strong><font size="1" face="Times New Roman, Times, serif">4.3
                  ALGUMA OUTRA PARTICIPAÇÃO</font></strong></div>
            <div id="OUTRAPART" style="position:absolute;z-index:2005;left:6px;top:1122px;width:588px;height:79px;background:#FFFFFF;">
              <!--#include file="INCOUTP.ASP" -->
            </div>
            <div id="PF" style="position:absolute;z-index:2005;left:7px;top:941px;width:588px;height:75px;background:#FFFFFF;">
              <!--#include file="INCPF.ASP" -->
            </div>
            <div id="ENTRADA" style="position:absolute;z-index:2005;left:11px;top:810px;width:587px;height:30px;background:#FFFFFF;">
              <!--#include file="INCENTRADA.ASP" -->
            </div>
            <div id="TITVENDA" style="position:absolute;z-index:2005;left:12px;top:737px;width:424px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>3.1
                    HOUVE VENDA DE PRODUTOS (livros,cursos,consultoria,etc)</strong></font></div>
            </div>
            <div id="VENDA" style="position:absolute;z-index:2005;left:11px;top:752px;width:588px;height:44px;background:#FFFFFF">
              <!--#include file="INCVENDA.ASP" -->
            </div>
            <div id="WFDObj68" style="position:absolute;z-index:72;left:6px;top:8px;width:592px;height:197px;background:#FFFFFF;">
              <!--#include file="INCHEADER.ASP" -->
            </div>
            <div id="WFDObj146" style="position:absolute;z-index:149;left:-10px;top:-155px;width:283px;height:17px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;"> </div>
            <input type="submit" name="Enviar" value="Enviar" tabindex="4" style="position:absolute;z-index:75;left:522px;top:2438px;width:76px;height:27px;font-size:10pt;font-family:Arial;font-weight:normal;font-style:normal;color:#FFFFFF;background-color:#0000FF;border-style:inset;">
            <div id="sUPL" style="position:absolute; width:584px; height:164px; background-color:#FFFFFF; layer-background-color:#FFFFFF; border:1px none #000000; z-index:2; left: 10px; top: 2242px;">
              <!--#include file="INCSUPL.ASP" -->
            </div>
            <div id="TITAREA" style="position:absolute;z-index:2005;left:8px;top:491px;width:169px;height:10px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>2. ÁREA
                    DE CONHECIMENTO</strong></font></div>
            </div>
            <div id="Area" style="position:absolute;z-index:2005;left:7px;top:503px;width:588px;height:129px;background:#FFFFFF;border-width:0">
              <!--#include file="INCAREAC.ASP" -->
            </div>
            <div id="TITOBJETIVO" style="position:absolute;z-index:2005;left:5px;top:425px;width:259px;height:7px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>1.2
                    OBJETIVO ATINGIDO? DE QUE FORMA?</strong></font></div>
            </div>
            <div id="OBJETIVOALC" style="position:absolute;z-index:2005;left:6px;top:435px;width:590px;height:53px;background:#FFFFFF;border-width:0">
            <!--#include file="INCOBJALC.ASP" -->
            </div>
            <div id="WFDObj113" style="position:absolute; z-index:116; left:-46px; top:10px; width:34px; height:466px; font-size:12pt; font-family:Verdana; font-weight:bold; font-style:normal; text-align:center; color:#E80000; background-color: #FF6600; layer-background-color: #FF6600; border: 1px none #000000;">
              <div align="center"><font color="#FFFFFF" size="3" face="Arial, Helvetica, sans-serif"><br>
              A<br>
              V<br>
              A<br>
              L<br>
              I<br>
              A<br>
&Ccedil; 
              <br>
&Atilde; 
              <br>
              O<br>
              <br>
              D<br>
              E<br>
              <br>
              R<br>
              E<br>
              S<br>
              U<br>
              L<br>
              T<br>
              A<br>
              D<br>
              O<br>
              S <br>
              </font></div>
            </div>
            <div id="Tit3" style="position:absolute;z-index:2005;left:8px;top:635px;width:395px;height:11px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">2.1
                    AC&Otilde;ES DESENVOLVIDAS / PROGRAMA&Ccedil;&Atilde;O SENAC
                    - RIO</font></strong></div>
            </div>
            <div id="ACAO" style="position:absolute;z-index:2003;left:8px;top:648px;width:588px;height:85px;background:#FFFFFF;">
              <!--#include file="INCACAO.ASP" -->
            </div>
            <div id="WFDObj170" style="position:absolute;z-index:173;left:5px;top:305px;width:350px;height:10px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>1.1
                    OBJETIVO DA PARTICIPA&Ccedil;&Atilde;O SENAC - RIO</strong></font></div>
            </div>
            <div id="OBJETIVO" style="position:absolute;z-index:74;left:6px;top:318px;width:591px;height:105px;background:#FFFFFF;">
              <!--#include file="INCOBJ1.ASP" -->
            </div>
            <div id="TITPART" style="position:absolute;z-index:2005;left:10px;top:843px;width:361px;height:11px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>3.3
                    DESCRIÇÃO DETALHADA DA PARTICIPAÇÃO SENAC RIO</strong></font></div>
            </div>
            <div id="PARTSENAC" style="position:absolute;z-index:2005;left:8px;top:857px;width:588px;height:53px;background:#FFFFFF">
              <!--#include file="INCDESCPART.ASP" -->
            </div>
            <div id="WFDObj187" style="position:absolute;z-index:190;left:6px;top:913px;width:268px;height:11px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">4.
                    PÚLICO PRESENTE</font></strong></div>
            </div>
            <div id="WFDObj187" style="position:absolute;z-index:190;left:7px;top:928px;width:268px;height:8px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>4.1
                    QUAL O PÚLICO? - ALVO PESSOA FÍSICA</strong></font></div>
            </div>
            <div id="PUBLICO" style="position:absolute;z-index:2005;left:8px;top:1218px;width:588px;height:53px;background:#FFFFFF">
              <!--#include file="INCPUB.ASP" -->
            </div>
            <div id="TITNUMVIS" style="position:absolute;z-index:196;left:6px;top:1205px;width:379px;height:11px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000040;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>4.4
                    QUAL O NUMERO DE VISITANTES E PARTICIPANTES:</strong></font></div>
            </div>
            <div id="PATROCINIO" style="position:absolute;z-index:2005;left:7px;top:1762px;width:588px;height:53px;background:#FFFFFF;">
            <!--#include file="INCPATROCINIO.ASP" -->
            </div>
            <div id="AVALIAQUAL" style="position:absolute;z-index:2005;left:7px;top:1844px;width:588px;height:53px;background:#FFFFFF;">
            <!--#include file="INCACEITAPUB.ASP" -->
            </div>
            <div id="PARCEIROA" style="position:absolute;z-index:2005;left:9px;top:2052px;width:588px;height:54px;background:#FFFFFF;">
              <!--#include file="INCPARCEIRO.ASP" -->
            </div>
            <div id="NOVOPRODUTO" style="position:absolute;z-index:2005;left:7px;top:1987px;width:590px;height:48px;background:#FFFFFF;">
                 <!--#include file="INCNPROD.ASP" -->
            </div>
            <div id="TitImprensa" style="position:absolute;z-index:16;left:10px;top:1492px;width:584px;height:14px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><strong><font size="1">5.3.ASSESSORIA DE IMPRENSA:
                    HOUVE PUBLICA&Ccedil;&Atilde;O DE MATERIA? EM QUE VE&Iacute;CULOS
                    DE COMUNICA&Ccedil;&Atilde;O</font></strong></div>
            </div>
            <div id="IMPRENSA" style="position:absolute;z-index:2005;left:8px;top:1506px;width:589px;height:60px;background:#FFFFFF">    
              <!--#include file="INCimprensa.ASP" --></div>
            <div id="P" style="position:absolute;z-index:2005;left:9px;top:1685px;width:588px;height:58px;background:#FFFFFF;">
              <!--#include file="INCPERMUTA.ASP" -->
            </div>
            <div id="FILMEFOTO" style="position:absolute;z-index:2005;left:9px;top:1587px;width:588px;height:60px;background:#FFFFFF">
              <!--#include file="INCFOTO.ASP" -->
            </div>
            <div id="WFDObj213" style="position:absolute; z-index:216; left:10px; top:1574px; width:488px; height:14px; font-size:8pt; font-family:Verdana; font-weight:normal; font-style:normal; text-align:center; color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>5.4
                    O EVENTO FOI FOTOGRAFADO E /OU FILMADO? FOI DISPONIBILIZDO?
                    ONDE?</strong></font></div>
            </div>
            <div id="WFDObj219" style="position:absolute;z-index:222;left:9px;top:1817px;width:115px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>7.
                    RESULTADOS</strong></font></div>
            </div>
            <div id="WFDObj219" style="position:absolute;z-index:222;left:7px;top:1832px;width:481px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>7.1
                    ACEITAÇÃO DO PÚBLICO: BASEADA NA AVALIAÇÃO DA REAÇÃO</strong></font></div>
            </div>
            <div id="WFDObj219" style="position:absolute;z-index:222;left:9px;top:1901px;width:592px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>7.2
                    ALGUMA OPORTUNIDADE IDENTIFICADA. CHANCES DE NEGOCIO IMEDIATOs
                    (permuta,corporate,etc.)</strong></font></div>
            </div>
            <div id="WFDObj219" style="position:absolute;z-index:222;left:8px;top:1974px;width:574px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"> <strong><font size="1" face="Times New Roman, Times, serif">IDENTIFICA&Ccedil;&Atilde;O
                    DE NOVOS PRODUTOS? AMPLIA&Ccedil;&Atilde;O E INOVA&Ccedil;&Atilde;O
                    DE PORTIF&Oacute;LIO?</font></strong></div>
            </div>
            <div id="WFDObj225" style="position:absolute;z-index:228;left:9px;top:2039px;width:473px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000040;">
              <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>7.3
                    PROSPEC&Ccedil;&Atilde;O DE NOVOS CLIENTES /PARCEIROS (PF/PJ)</strong></font></div>
            </div>
            <div id="WFDObj234" style="position:absolute;z-index:235;left:10px;top:1652px;width:191px;height:11px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>6.PARCERIAS</strong></font></div>
            </div>
            <div id="WFDObj234" style="position:absolute;z-index:235;left:11px;top:1672px;width:400px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <strong><font size="1" face="Times New Roman, Times, serif">6.1
                  APOIO E PERMUTAS REALIZADAS. QUE TIPO DE PERMUTA/APOIO </font> </strong></div>
            <div id="WFDObj234" style="position:absolute;z-index:235;left:9px;top:1750px;width:493px;height:15px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;">
              <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>6.2
                    PATROCÍNIO: SE HOUVE. QUAIS AS EMPRESAS E EM QUE CONDIÇÕES</strong></font></div>
            </div>
            <div id="TITOQUE" style="position:absolute;z-index:2005;left:6px;top:208px;width:170px;height:11px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <font size="1" face="Times New Roman, Times, serif"><strong>1.
                  O QUE FOI O EVENTO?</strong></font></div>
            <div id="EVENTO" style="position:absolute;z-index:2005;left:6px;top:219px;width:592px;height:86px;background:#FFFFFF;border-width:0">
              <!--#include file="INCTIPO1.ASP" -->
            </div>
            <div id="TITPJ" style="position:absolute;z-index:2005;left:8px;top:1015px;width:314px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <strong><font size="1" face="Times New Roman, Times, serif">4.2
                  QUAL FOI O PÚBLICO - ALVO PESSOA JURÍDICA</font></strong></div>
            <div id="PJUR" style="position:absolute;z-index:2005;left:7px;top:1031px;width:588px;height:73px;background:#FFFFFF;border-width:0">
              <!--#include file="INCPJ.ASP" -->
            </div>
            <input name="IDEVENTO" type="hidden" value="<%=IDEVENTO%>">
          </form>
        </div>
    </td>
  </tr>
</table>
<div align="center">
<%
Unidade.Close()
Set Unidade = Nothing
%>
  <%
EventoS.Close()
Set EventoS = Nothing
%>
  <%
Cat.Close()
Set Cat = Nothing
%>
<a href="EDITAEVENTOAVAL.asp"><img src="images/seta03.gif" width="33" height="33" border="0"></a></div>
