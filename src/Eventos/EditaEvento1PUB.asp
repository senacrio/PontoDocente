<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="Connections/CXEVENTO.asp" -->

<% Dim IdTipoEvento
IdEvento=trim(CStr(Request.QueryString("IDEVENTO")))
Set EventoS = Server.CreateObject("ADODB.Recordset")
EventoS.ActiveConnection = MM_CXEVENTO_STRING
EventoS.Source = "SELECT * FROM EVENTO WHERE IDEVENTO= " + IdEvento
EventoS.CursorType = 0
EventoS.CursorLocation = 2
EventoS.LockType = 1
'RESPONSE.WRITE(Eventos.Source)
'RESPONSE.END
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
IdCategoria=EventoS.Fields.Item("IDCATEGORIA").Value
Dia=cstr(trim(EventoS.Fields.Item("Dia").Value))
Ano=cstr(trim(EventoS.Fields.Item("Ano").Value))
Mes=cstr(trim(EventoS.Fields.Item("Mes").Value))
DiaF=cstr(trim(EventoS.Fields.Item("DiaF").Value))
AnoF=cstr(trim(EventoS.Fields.Item("AnoF").Value))
MesF=cstr(trim(EventoS.Fields.Item("MesF").Value))
Realizador=cstr(trim(EventoS.Fields.Item("Realizador").Value))
UP=(trim(EventoS.Fields.Item("UPart").Value))
FecObs=cstr(trim(EventoS.Fields.Item("OBS").Value))
GFec=cstr(trim(EventoS.Fields.Item("FECO").Value))
Responsavel=cstr(trim(EventoS.Fields.Item("Responsavel").Value))
Visitante=cstr(trim(EventoS.Fields.Item("Visitante").Value))
Fecomercio=cstr(trim(EventoS.Fields.Item("Fecomercio").Value))
Patrocina=cstr(trim(EventoS.Fields.Item("Patrocina").Value))

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
<table width="746" height="2302" border=0 align="center" bgcolor="#FFFFFF">
  <tr align="center"><img src="images/BANNER1.gif"></tr>
  <tr align="center">
  <td align="center"> <!-- Form code created by Web Form Designer 1.2.1 -->
<script type="text/javascript">
function CadEventos_CF(){
var errormessage = new String();
var vF = document.forms["CadEventos"];
if(CadEventos_WithoutContent(vF["nomeevento"].value)){errormessage += "\n\nNome Evento obrigat�rio";}
//if(CadEventos_NotAlphanumeric(vF["nomeevento"].value)){errormessage += "\n\n \"nomeevento\" can only contain alphanumeric characters";}
//if(CadEventos_WithoutContent(vF["Horario"].value)){errormessage += "\n\nHor�rio obrigat�rio";}
//if(CadEventos_WithoutContent(vF["EstimaPublico"].value)){errormessage += "\n\nEstimativa de P�blico Obrigat�rio";}
//if(CadEventos_WithoutContent(vF["PartSenac"].value)){errormessage += "\n\nParticipa��o Senac obrigat�rio";}
//if(CadEventos_WithoutContent(vF["Material"].value)){errormessage += "\n\nMaterial utilizado obrigat�rio";}
//if(CadEventos_WithoutContent(vF["Orcamento"].value)){errormessage += "\n\nOr�amento obrigat�rio";}
//if(CadEventos_WithoutContent(vF["Receita"].value)){errormessage += "\n\nReceita obrigat�ria";}
//if(CadEventos_WithoutContent(vF["Parceito"].value)){errormessage += "\n\nParceiro obrigat�rio";}
//if(CadEventos_WithoutContent(vF["FilmeFoto"].value)){errormessage += "\n\nFilmado e fotografado obrigat�rio";}
//if(CadEventos_WithoutSelectionValue(vF["mnu_local"])){errormessage += "\n\nPlease select something from the\"mnu_local\" drop-down list";}
if(CadEventos_WithoutSelectionValue(vF["mnu_unidade"])){errormessage += "\n\nPlease select something from the\"mnu_unidade\" drop-down list";}
//if(!vF.OQUEE[0].checked && !vF.OQUEE[1].checked && !vF.OQUEE[2].checked && !vF.OQUEE[3].checked && !vF.OQUEE[4].checked && !vF.OQUEE[5].checked && !vF.OQUEE[6].checked && !vF.OQUEE[7].checked && !vF.OQUEE[8].checked) {errormessage += "\n\nSelecione alguma op��o em 1. O que � o Evento?";}

//if(!vF.Objetivo[0].checked && !vF.Objetivo[1].checked && !vF.Objetivo[2].checked && !vF.Objetivo[3].checked && !vF.Objetivo[4].checked && !vF.Objetivo[5].checked && !vF.Objetivo[6].checked && !vF.Objetivo[7].checked) {errormessage += "\n\nSelecione alguma op��o em 1.1. Qual o objetivo da participa��o do SENAC?";}

//if(!vF.Conhecimento[0].checked && !vF.Conhecimento[1].checked && !vF.Conhecimento[2].checked && !vF.Conhecimento[3].checked && !vF.Conhecimento[4].checked && !vF.Conhecimento[5].checked && !vF.Conhecimento[6].checked && !vF.Conhecimento[7].checked && !vF.Conhecimento[8].checked && !vF.Conhecimento[9].checked && !vF.Conhecimento[10].checked && !vF.Conhecimento[11].checked && !vF.Conhecimento[12].checked && !vF.Conhecimento[13].checked && !vF.Conhecimento[14].checked && !vF.Conhecimento[15].checked && !vF.Conhecimento[16].checked && !vF.Conhecimento[17].checked && !vF.Conhecimento[18].checked) {errormessage += "\n\nSelecione alguma op��o em 2. �rea de conhecimento?";}

//if(!vF.Acao[0].checked && !vF.Acao[1].checked && !vF.Acao[2].checked && !vF.Acao[3].checked && !vF.Acao[4].checked && !vF.Acao[5].checked ) {errormessage += "\n\nSelecione alguma op��o em 3. A��es desenvolvidas?";}

//if(!vF.GVenda[0].checked && !vF.GVenda[1].checked) {errormessage += "\n\nSelecione alguma op��o em 3.1.   Previs�o de Vendas";}
//if(!vF.Entrada[0].checked && !vF.Entrada[1].checked) {errormessage += "\n\nSelecione alguma op��o em 3.2.   Entrada";}

//if(!vF.PJ[0].checked && !vF.PJ[1].checked && !vF.PJ[2].checked && !vF.PJ[3].checked && !vF.PJ[4].checked && !vF.PJ[5].checked) {errormessage += "\n\nSelecione alguma op��o em 4.1. Alvo Pessoa Jur�dica";}

//if(!vF.PF[0].checked && !vF.PF[1].checked && !vF.PF[2].checked && !vF.PF[3].checked && !vF.PF[4].checked) {errormessage += "\n\nSelecione alguma op��o em 4.2. Alvo Pessoa F�sica";}

//if(!vF.GOutraPar[0].checked && !vF.GOutraPar[1].checked && !vF.GOutraPar[2].checked && !vF.GOutraPar[3].checked && !vF.GOutraPar[4].checked) {errormessage += "\n\nSelecione alguma op��o em 4.4. Alvo Outras Participa��es";}

//if(!vF.GAvaliacao[0].checked && !vF.GAvaliacao[1].checked) {errormessage += "\n\nSelecione alguma op��o em 4.5. Avalia��o";}

//if(!vF.GDivulgacao[0].checked && !vF.GDivulgacao[1].checked && !vF.GDivulgacao[2].checked && !vF.GDivulgacao[3].checked && !vF.GDivulgacao[4].checked && !vF.GDivulgacao[5].checked && !vF.GDivulgacao[6].checked && !vF.GDivulgacao[7].checked && !vF.GDivulgacao[8].checked) {errormessage += "\n\nSelecione alguma op��o em 5.1. Qual � o plano de divulga��o?";}

//if(!vF.GCustos[0].checked && !vF.GCustos[1].checked) {errormessage += "\n\nSelecione alguma op��o em 6.1. Custos no or�amento";}

//if(!vF.GInvestimento[0].checked && !vF.GInvestimento[1].checked) {errormessage += "\n\nSelecione alguma op��o em 6.2 Investimento intang�vel";}

if (errormessage.length > 2){
    alert("Existem erros no preenchimento do formul�rio. Favor corrija-os" + errormessage + "\n");
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
         
	    <div id="WFDForm" style="position:relative;left:0px;top:3px;width:602px;height:2220px;background-color:#FFFFFf;">
  <div id="WFDObj113" style="position:absolute; z-index:115; left:-52px; top:12px; width:29px; height:306px; font-size:12pt; font-family:Verdana; font-weight:bold; font-style:normal; text-align:center; color:#E80000; background-color: #FF6600; layer-background-color: #FF6600; border: 1px none #000000;"> 
    <p align="center"><font size="2" face="Arial, Helvetica, sans-serif"><strong><br>
          <font color="#FFFFFF">E</font><font color="#FFFFFF" face="Arial, Helvetica, sans-serif"><font color="#FFFFFF"><br>
      D<BR>
      I<BR>
	  T<BR>
      A<br>
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
          </font></font>          </strong>                 </font>              </div>
         <div id="IMPRESSORA" style="position:absolute; z-index:113; left:610px; top:16px; width:23px; height:17px; background-color: #0000FF; layer-background-color: #0000FF; border: 1px none #000000;">
            <a href="ImprimeEvento.asp?idevento=<%=idevento%>"><img src="images/PRINTERS.ICO" border="0"></a>
		  </div>
		  <form name="CadEventos" action="EDITAGRAVAEVENTOPUB.asp" method="POST" enctype="application/x-www-form-urlencoded" onSubmit="return CadEventos_CF();">
            <div id="CATEGORIA" style="position:absolute; width:589px; height:27px; z-index:241; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px; left: 6px; top: 2175px;"categoria">
                <div align="left"><strong><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">CATEGORIA:</font></strong>                
                      <select name="Categoria">
                        <% While (NOT Cat.EOF)%>
                        <option value="<%=(Cat.Fields.Item("IDCATEGORIA").Value)%>"
					<%IF Cat.Fields.Item("IDCATEGORIA").Value = IdCategoria then%> Selected>
					    <%else%> 
					>
					    <%end if%>
					    <%=(Cat.Fields.Item("DESCCATEGORIA").Value)%></option>
                        <%  Cat.MoveNext()
                  Wend
                  If (Cat.CursorType > 0) Then
                     Cat.MoveFirst
                  Else
                     Cat.Requery
                  End If
              %>
                      </select>
              </div>
            </div>
            <div id="APROVACAO" style="position:absolute; width:234px; height:17px; z-index:2; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000; left: 5px; top: 2204px;">
              <div align="left"><strong>  <font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">RESULTADO</font></strong><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif">:</font><font size="2" face="Verdana, Arial, Helvetica, sans-serif">              <select name="APROVA" disabled="disabled">
                <option value="1" selected>APROVADO
                <option value="2">REJEITADO
              </select>
              </font> </div>
            </div>
          
            <div id="Parceiros" style="position:absolute;z-index:3;left:6px;top:1946px;width:590px;height:53px;background:#FFFFFF;"> 
              <!--#include file="INCPARCEIRO.ASP" --></div>
            <div id="WFDObj3" style="position:absolute;z-index:5;left:6px;top:1896px;width:588px;height:32px;background:#FFFFFF">
              <!--#include file="INCRECEITA.ASP" --></div>
            <div id="WFDObj4" style="position:absolute; z-index:6; left:6px; top:1807px; width:588px; height:23px; background:#FFFFFF">
              <!--#include file="INCINVEST.ASP" --></div>
            <div id="Orcamento" style="position:absolute;z-index:9;left:7px;top:1849px;width:588px;height:32px;background:#FFFFFF;">
              <!--#include file="INCCUSTOORC.ASP" --></div>
            <div id="WFDObj8" style="position:absolute;z-index:10;left:7px;top:1835px;width:214px;height:9px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#FF0000;"> 
              <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>6.3
                OR�AMENTO TOTAL PREVISTO?</strong></font></div>
            </div>
            <div id="WFDObj11" style="position:absolute;z-index:13;left:5px;top:1621px;width:590px;height:56px;background:#FFFFFF;">   
              <!--#include file="INCMATERIAL.ASP" --></div>
            <div id="WFDObj12" style="position:absolute;z-index:14;left:7px;top:1610px;width:541px;height:14px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#FF0000;"> 
              <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>5.2
              INFORMAR QUANTIDADE ESTIMADA DE MATERIAL A SER USADO (folhetos,panfletos,etc)</strong></font></div>
            </div>
            <div id="WFDObj15" style="position:absolute;z-index:17;left:6px;top:1487px;width:225px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;"> 
              <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>5.1
              QUAL O PLANO DE DIVULGA��O?</strong></font></div>
            </div>
			<div id="WFDObj14" style="position:absolute;z-index:14;left:5px;top:1498px;width:589px;height:107px;background:#FFFFFF">                
			  <!--#include file="INCDIVULG.ASP" -->
			</div>
          <div id="WFDObj26" style="position:absolute;z-index:28;left:8px;top:1140px;width:236px;height:17px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#FF0000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>4.3
              HAVER� OUTRAS PARTICIPA��ES?</strong></font></div>
          </div><div id="WFDObj27" style="position:absolute;z-index:27;left:7px;top:1152px;width:588px;height:79px;background:#FFFFFF">  
            <!--#include file="INCOUTP.ASP" -->
			</div>
          <div id="WFDObj61" style="position:absolute;z-index:63;left:9px;top:769px;width:82px;height:10px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#FF0000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>3.2
              ENTRADA</strong></font></div>
          </div><div id="ENTRADA" style="position:absolute;z-index:2005;left:9px;top:782px;width:587px;height:29px;background:#FFFFFF;">
            <!--#include file="INCENTRADA.ASP" --></DIV>
          <div id="WFDObj62" style="position:absolute;z-index:64;left:10px;top:708px;width:424px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>3.1
              PREVIS�O DE VENDAS DE PRODUTOS (livros,cursos,consultoria,etc)</strong></font></div>
          </div><div id="WFDObj53" style="position:absolute;z-index:53;left:9px;top:722px;width:588px;height:45px;background:#FFFFFF">
			<!--#include file="INCVENDA.ASP" -->
			</div>
          <div id="WFDObj68" style="position:absolute;z-index:70;left:6px;top:11px;width:591px;height:198px;background:#FFFFFF;">            
            <!--#include file="INCHEADERa.ASP" -->
          </div>
          <input type="submit" name="Enviar" value="Enviar" tabindex="4" style="position:absolute; z-index:73; left:503px; top:2204px; width:76px; height:24px; font-size:12pt; font-family:Arial; font-weight:normal; font-style:normal; color:#FFFFFF; border-style:inset; background-color: #0000FF; layer-background-color: #0000FF; border: 1px none #000000;">
          <div id="WFDObj85" style="position:absolute;z-index:87;left:9px;top:453px;width:169px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>2. �REA
              DE CONHECIMENTO</strong></font></div>
          </div><div id="WFDObj5" style="position:absolute;z-index:5;left:8px;top:466px;width:588px;height:133px;background:#FFFFFF">
				   <!--#include file="INCAREAC.ASP" -->
			</div>
          
          <div id="WFDObj146" style="position:absolute;z-index:148;left:8px;top:326px;width:283px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#FF0000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>1.1
              OBJETIVO DA PARTICIPA��O SENAC RIO::</strong></font></div>
          </div><div id="WFDObj70" style="position:absolute;z-index:70;left:7px;top:340px;width:589px;height:107px;background:#FFFFFF;">  
			    <!--#include file="INCOBJ1.ASP" -->
		    </div>
          <div id="WFDObj170" style="position:absolute;z-index:172;left:8px;top:604px;width:350px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#FF0000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>3.
              A��ES DESENVOLVIDAS / PROGRAMA��ES SENAC RIO</strong></font></div>
          </div><div id="WFDObj156" style="position:absolute;z-index:156;left:11px;top:617px;width:587px;height:86px;background:#FFFFFF;">
			 <!--#include file="INCACAO.ASP" -->
			 </div>
          <div id="WFDObj173" style="position:absolute;z-index:175;left:9px;top:815px;width:361px;height:14px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>3.3
              DESCRI��O DETALHADA DA PARTICIPA��O SENAC RIO</strong></font></div>
          </div>
          <div id="WFDObj174" style="position:absolute;z-index:176;left:10px;top:828px;width:588px;height:63px;background:#FFFFFF">
            <!--#include file="INCDESCPART.ASP" --></div>
			 <div id="WFDObj234" style="position:absolute; z-index:234; left:8px; top:894px; width:518px; height:12px; font-size:8pt; font-family:Verdana; font-weight:normal; font-style:normal; text-align:center; color:#000000; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;"> 
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>3.4
               EST&Aacute; PREVISTA A PARTICIPA&Ccedil;&Atilde;O DO FECOM&Eacute;RCIO?
               COMO PODERIA SER ESTA PARTICIPA&Ccedil;&Atilde;O?</strong></font></div>
            </div>
			<div id="publico" style="position:absolute;z-index:7;left:8px;top:906px;width:584px;height:55px;background:#FFFFFF;border-color:#FF8040">
              <!--#include file="INCFECOMERCIO.ASP" -->
            </div>
          <div id="WFDObj187" style="position:absolute;z-index:189;left:8px;top:963px;width:268px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#FF0000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>4.1
              QUAL O P�LICO-ALVO (PESSOA F�SICA)?</strong></font></div>
          </div><div id="WFDObj52" style="position:absolute;z-index:52;left:7px;top:974px;width:588px;height:75px;background:#FFFFFF">	 
            <!--#include file="INCPF.ASP" -->
			</div>
          <div id="WFDObj191" style="position:absolute;z-index:193;left:5px;top:1316px;width:588px;height:53px;background:#FFFFFF">
		   <!--#include file="INCPUB.ASP" -->
		  </div>
		   <div id="WFDObj234" style="position:absolute; z-index:234; left:9px; top:1233px; width:518px; height:12px; font-size:8pt; font-family:Verdana; font-weight:normal; font-style:normal; text-align:center; color:#000000; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;"> 
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>4.4
                    INFORMAR OS PATROCINADORES DO EVENTO</strong></font></div>
            </div>
		  	<div id="publico" style="position:absolute;z-index:7;left:8px;top:1246px;width:588px;height:55px;background:#FFFFFF;border-color:#FF8040">
              <!--#include file="INCPATROCINA.ASP" -->
            </div>
          <div id="WFDObj193" style="position:absolute;z-index:195;left:6px;top:1302px;width:231px;height:11px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000040;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>4.5
              QUAL A ESTIMATIVA DE P�BLICO?</strong></font></div>
          </div>
          <div id="WFDObj194" style="position:absolute;z-index:196;left:4px;top:1388px;width:588px;height:41px;background:#FFFFFF;"> 
            <!--#include file="INCREACAO.ASP" -->
          </div>
		   <div id="WFDObj234" style="position:absolute; z-index:234; left:5px; top:1433px; width:330px; height:13px; font-size:8pt; font-family:Verdana; font-weight:normal; font-style:normal; text-align:center; color:#000000; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;"> 
              <div align="left"><font size="1" face="Times New Roman, Times, serif"><strong>4.7
               SER&Aacute; FEITO O CADASTRO DE VISITANTES(MAILING LIST)?</strong></font></div>
            </div>
		  <div id="publico" style="position:absolute;z-index:7;left:4px;top:1447px;width:588px;height:34px;background:#FFFFFF;border-color:#FF8040">
              <!--#include file="INCVISITANTE.ASP" -->
            </div>
          <div id="WFDObj211" style="position:absolute;z-index:213;left:5px;top:1695px;width:588px;height:52px;background:#FFFFFF">
            <!--#include file="INCFOTO.ASP" --></div>
          <div id="WFDObj213" style="position:absolute;z-index:215;left:7px;top:1682px;width:315px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>5.3
              O EVENTO SER� FOTOGRAFADO E /OU FILMADO?</strong></font></div>
          </div>
          <div id="WFDObj219" style="position:absolute;z-index:220;left:5px;top:1750px;width:478px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#FF0000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>6.1
              CUSTOS FORAM LAN�ADOS PREVIAMENTE NO OR�AMENTO DE SUA UNIDADE</strong></font></div>
          </div>
          <div id="WFDObj220" style="position:absolute;z-index:221;left:6px;top:1762px;width:588px;height:23px;background:#FFFFFF;">
            <!--#include file="INCLANCORC.ASP" --></div>
          <div id="WFDObj225" style="position:absolute;z-index:226;left:5px;top:1796px;width:473px;height:17px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000040;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>6.2
              O EVENTO EM QUEST�O CONTA COM INVESTIMENTO INTANG�VEL (da Sede)</strong></font></div>
          </div>
            <div id="WFDObj232" style="position:absolute;z-index:233;left:6px;top:1883px;width:190px;height:10px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#000040;"> 
            <div align="left"><strong><font size="1" face="Times New Roman, Times, serif">6.4
              RECEITA TOTAL PREVISTA?</font></strong></div>
          </div>
          <div id="WFDObj234" style="position:absolute;z-index:235;left:6px;top:1931px;width:518px;height:9px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#FF0000;"> 
            <div align="left"><font color="#000000" size="1" face="Times New Roman, Times, serif"><strong>6.5 � POSSIVEL
              BUSCAR PARCEIROS E/OU PATROCINADORES PARA O EVENTO. QUAIS?</strong></font></div>
          </div>
          <div id="WFDObj235" style="position:absolute;z-index:236;left:8px;top:217px;width:136px;height:8px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <font size="1" face="Times New Roman, Times, serif"><strong>1.
            O QUE � O EVENTO?</strong></font></div>
          <div id="WFDObj236" style="position:absolute;z-index:237;left:9px;top:1052px;width:282px;height:12px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:left;color:#000000;"> <strong><font size="1" face="Times New Roman, Times, serif">4.2
            QUAL O P�BLICO-ALVO (PESSOA JUR�DICA)?</font></strong></div>
          <div id="WFDObj40" style="position:absolute;z-index:40;left:8px;top:1064px;width:588px;height:73px;background:#FFFFFF">
                <!--#include file="INCPJ.ASP" -->
		    </div>
          <div id="WFDObj237" style="position:absolute;z-index:238;left:3px;top:1372px;width:394px;height:13px;font-size:8pt;font-family:Verdana;font-weight:normal;font-style:normal;text-align:center;color:#D90000;"> 
            <div align="left"><strong><font color="#000000" size="1" face="Times New Roman, Times, serif">4.6
              SER� FEITA A AVALIA��O DE REA��O cadastro de vsitantes?</font></strong></div>
          </div>
          <input name="IDEVENTO" type="hidden" value="<%=IDEVENTO%>">
          <div id="WFDObj69" style="position:absolute;z-index:69;left:6px;top:232px;width:588px;height:89px;background:#FFFFFF">
            <!--#include file="INCTIPO1.ASP" -->
          </DIV>
		  <div id="sUPL" style="position:absolute; width:588px; height:168px; background-color:#FFFFFF; layer-background-color:#FFFFFF; border:1px none #000000; z-index:1; left: 7px; top: 2003px;"> 
		    <!--#include file="INCSUPL.ASP" --></div>
		  </form>
      </div>
    </td>
  </tr>
</table>
<div align="center"></div>
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
  <br>
  <a href="MENUAL.ASP"><img src="images/seta03.gif" width="33" height="33" border="0"></a></div>
