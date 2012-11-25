<div id="WFDObj81" style="position:absolute;z-index:81;left:0px;top:8px;width:79px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> 
  Nome do Evento</div>
  
<div id="WFDObj82" style="position:absolute;z-index:82;left:1px;top:34px;width:29px;height:18px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> Per&iacute;odo:</div>
<div id="WFDObj82" style="position:absolute;z-index:82;left:-1px;top:126px;width:29px;height:15px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> 
  Horário:</div>
<div id="Responsavel" style="position:absolute;z-index:82;left:-1px;top:174px;width:29px;height:16px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> 
  Responsável:</div>  


<div id="WFDObj83" style="position:absolute;z-index:83;left:-1px;top:82px;width:33px;height:15px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:;"> 
  Local:</div>
  
<div id="WFDObj155" style="position:absolute;z-index:155;left:0px;top:151px;width:73px;height:14px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;text-align:left;color:#;"> 
  Unidade</div>

<textarea name="Local" cols="40"  onBlur="Local1()" style="position:absolute;z-index:80;left:80px;top:81px;width:497px;height:36px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="5"><%=IdLocal%></textarea>  
  
<input name="Horario" type="text" style="position:absolute;z-index:80;left:81px;top:122px;width:495px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="6" value="<%=Horario%>" size="40" maxlength="200">

<input name="Responsavel" type="text" style="position:absolute;z-index:80;left:81px;top:172px;width:495px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="8" value="<%=Responsavel%>" size="40" maxlength="200">
  
<input type="text" name="nomeevento" value="<%=nomeevento%>" size="40" maxlength="300" tabindex="1" style="position:absolute;z-index:79;left:81px;top:7px;width:496px;height:20px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;">
<select name="DiaF" size="1" 
style="position:absolute;z-index:216;left:81px;top:56px;width:37px;height:19px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="2">
  <option value="1" 
<%if diaf=1 then%> selected
<%end if%>
>1
  <option value="2"
<%if diaf=2 then%> selected
<%end if%>
>2
  <option value="3"
<%if diaf=3 then%> selected
<%end if%>
>3
  <option value="4"
<%if diaf=4 then%> selected
<%end if%>
>4
  <option value="5"
<%if diaf=5 then%> selected
<%end if%>
>5
  <option value="6"
<%if diaf=6 then%> selected
<%end if%>
>6
  <option value="7"
<%if diaf=7 then%> selected
<%end if%>
>7
  <option value="8"
<%if diaf=8 then%> selected
<%end if%>
>8
  <option value="9"
<%if diaf=9 then%> selected
<%end if%>
>9
  <option value="10"
<%if diaf=10 then%> selected
<%end if%>
>10
  <option value="11"
<%if diaf=11 then%> selected
<%end if%>
>11
  <option value="12"
<%if diaf=12 then%> selected
<%end if%>
>12

<option value="13" 
<%if diaf=13 then%> selected
<%end if%>
>13
  <option value="14"
<%if diaf=14 then%> selected
<%end if%>
>14
  <option value="15"
<%if diaf=15 then%> selected
<%end if%>
>15
  <option value="16"
<%if diaf=16 then%> selected
<%end if%>
>16
  <option value="17"
<%if diaf=17 then%> selected
<%end if%>
>17
  <option value="18"
<%if diaf=18 then%> selected
<%end if%>
>18

<option value="19"
<%if diaf=19 then%> selected
<%end if%>
>19

<option value="20"
<%if diaf=20 then%> selected
<%end if%>
>20

<option value="21"
<%if diaf=21 then%> selected
<%end if%>
>21

<option value="22"
<%if diaf=22 then%> selected
<%end if%>
>22

<option value="23"
<%if diaf=23 then%> selected
<%end if%>
>23

<option value="24"
<%if diaf=24 then%> selected
<%end if%>
>24

<option value="25"
<%if diaf=25 then%> selected
<%end if%>
>25

<option value="26"
<%if diaf=26 then%> selected
<%end if%>
>26

<option value="27"
<%if diaf=27 then%> selected
<%end if%>
>27

<option value="28"
<%if diaf=28 then%> selected
<%end if%>
>28

<option value="29"
<%if diaf=29 then%> selected
<%end if%>
>29

<option value="30"
<%if diaf=30 then%> selected
<%end if%>
>30

<option value="31"
<%if diaf=31 then%> selected
<%end if%>
>31
</select>
<select name="Dia" size="1" 
style="position:absolute;z-index:216;left:81px;top:33px;width:37px;height:19px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="2">
  <option value="1" 
<%if dia=1 then%> selected
<%end if%>
>1
  <option value="2"
<%if dia=2 then%> selected
<%end if%>
>2
  <option value="3"
<%if dia=3 then%> selected
<%end if%>
>3
  <option value="4"
<%if dia=4 then%> selected
<%end if%>
>4
  <option value="5"
<%if dia=5 then%> selected
<%end if%>
>5
  <option value="6"
<%if dia=6 then%> selected
<%end if%>
>6
  <option value="7"
<%if dia=7 then%> selected
<%end if%>
>7
  <option value="8"
<%if dia=8 then%> selected
<%end if%>
>8
  <option value="9"
<%if dia=9 then%> selected
<%end if%>
>9
  <option value="10"
<%if dia=10 then%> selected
<%end if%>
>10
  <option value="11"
<%if dia=11 then%> selected
<%end if%>
>11
  <option value="12"
<%if dia=12 then%> selected
<%end if%>
>12

<option value="13" 
<%if dia=13 then%> selected
<%end if%>
>13
  <option value="14"
<%if dia=14 then%> selected
<%end if%>
>14
  <option value="15"
<%if dia=15 then%> selected
<%end if%>
>15
  <option value="16"
<%if dia=16 then%> selected
<%end if%>
>16
  <option value="17"
<%if dia=17 then%> selected
<%end if%>
>17
  <option value="18"
<%if dia=18 then%> selected
<%end if%>
>18

<option value="19"
<%if dia=19 then%> selected
<%end if%>
>19

<option value="20"
<%if dia=20 then%> selected
<%end if%>
>20

<option value="21"
<%if dia=21 then%> selected
<%end if%>
>21

<option value="22"
<%if dia=22 then%> selected
<%end if%>
>22

<option value="23"
<%if dia=23 then%> selected
<%end if%>
>23

<option value="24"
<%if dia=24 then%> selected
<%end if%>
>24

<option value="25"
<%if dia=25 then%> selected
<%end if%>
>25

<option value="26"
<%if dia=26 then%> selected
<%end if%>
>26

<option value="27"
<%if dia=27 then%> selected
<%end if%>
>27

<option value="28"
<%if dia=28 then%> selected
<%end if%>
>28

<option value="29"
<%if dia=29 then%> selected
<%end if%>
>29

<option value="30"
<%if dia=30 then%> selected
<%end if%>
>30

<option value="31"
<%if dia=31 then%> selected
<%end if%>
>31
</select>
<select name="MesF" size="1" 
style="position:absolute;z-index:216;left:118px;top:56px;width:37px;height:19px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="2">
  <option value="1" 
<%if mesf=1 then%> selected
<%end if%>
>1
  <option value="2"
<%if mesf=2 then%> selected
<%end if%>
>2
  <option value="3"
<%if mesf=3 then%> selected
<%end if%>
>3
  <option value="4"
<%if mesf=4 then%> selected
<%end if%>
>4
  <option value="5"
<%if mesf=5 then%> selected
<%end if%>
>5
  <option value="6"
<%if mesf=6 then%> selected
<%end if%>
>6
  <option value="7"
<%if mesf=7 then%> selected
<%end if%>
>7
  <option value="8"
<%if mesf=8 then%> selected
<%end if%>
>8
  <option value="9"
<%if mesf=9 then%> selected
<%end if%>
>9
  <option value="10"
<%if mesf=10 then%> selected
<%end if%>
>10
  <option value="11"
<%if mesf=11 then%> selected
<%end if%>
>11
  <option value="12"
<%if mesf=12 then%> selected
<%end if%>
>12
</select>
<select name="Mes" size="1" 
style="position:absolute;z-index:216;left:119px;top:33px;width:36px;height:19px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="2">
  <option value="1" 
<%if mes=1 then%> selected
<%end if%>
>1
  <option value="2"
<%if mes=2 then%> selected
<%end if%>
>2
  <option value="3"
<%if mes=3 then%> selected
<%end if%>
>3
  <option value="4"
<%if mes=4 then%> selected
<%end if%>
>4
  <option value="5"
<%if mes=5 then%> selected
<%end if%>
>5
  <option value="6"
<%if mes=6 then%> selected
<%end if%>
>6
  <option value="7"
<%if mes=7 then%> selected
<%end if%>
>7
  <option value="8"
<%if mes=8 then%> selected
<%end if%>
>8
  <option value="9"
<%if mes=9 then%> selected
<%end if%>
>9
  <option value="10"
<%if mes=10 then%> selected
<%end if%>
>10
  <option value="11"
<%if mes=11 then%> selected
<%end if%>
>11
  <option value="12"
<%if mes=12 then%> selected
<%end if%>
>12
</select>
<select name="AnoF" size="1" style="position:absolute;z-index:216;left:157px;top:56px;width:36px;height:19px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="3">
  <option value="2008" 
  <%IF ANOF="2008" THEN%>selected>08
  <%ELSE%>>08
  <%END IF%>
  <option value="2009"
  <%IF ANOF="2009" THEN%>selected>09
  <%ELSE%>>09
  <%END IF%>
  <option value="2010"
  <%IF ANOF="2010" THEN%>selected>10
  <%ELSE%>>10
  <%END IF%>
  <option value="2011"
  <%IF ANOF="2011" THEN%>selected>11
  <%ELSE%>>11
  <%END IF%>
  <option value="2012"
  <%IF ANOF="2012" THEN%>selected>12
  <%ELSE%>>12
  <%END IF%>
  <option value="2013"
  <%IF ANOF="2013" THEN%>selected>13
  <%ELSE%>>13
  <%END IF%>
</select>
<select name="Ano" size="1" style="position:absolute;z-index:216;left:157px;top:33px;width:36px;height:19px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;" tabindex="3">
 <option value="2008" 
  <%IF ANO="2008" THEN%>selected>08
  <%ELSE%>>08
  <%END IF%>
  <option value="2009"
  <%IF ANO="2009" THEN%>selected>09
  <%ELSE%>>09
  <%END IF%>
  <option value="2010"
  <%IF ANO="2010" THEN%>selected>10
  <%ELSE%>>10
  <%END IF%>
  <option value="2011"
  <%IF ANO="2011" THEN%>selected>11
  <%ELSE%>>11
  <%END IF%>
  <option value="2012"
  <%IF ANO="2012" THEN%>selected>12
  <%ELSE%>>12
  <%END IF%>
  <option value="2013"
  <%IF ANO="2013" THEN%>selected>13
  <%ELSE%>>13
  <%END IF%>
</select>
<textarea  name="Data" rows="2" cols="113" wrap="virtual" tabindex="4"  onBlur="Data1()" style="position:absolute;z-index:2006;left:194px;top:32px;width:385px;height:43px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;"><%=Data%></textarea>
<select name="mnu_unidade" size="1" tabindex="7" 
style="position:absolute;z-index:216;left:81px;top:146px;width:497px;height:22px;font-size:8pt;font-family:Arial;font-weight:normal;font-style:normal;color:#000000;background-color:#FFFFFF;">
  <%
While (NOT Unidade.EOF)
%>
  <option value="<%=(Unidade.Fields.Item("IDUNIDADE").Value)%>"
			  <%if Unidade.Fields.Item("IDUNIDADE").Value = IdUnidade then%> selected >
  <%else%>
>
  <%end if%>
  <%=(Unidade.Fields.Item("NOMEUNIDADE").Value)%></option>
  <%
  Unidade.MoveNext()
Wend
If (Unidade.CursorType > 0) Then
  Unidade.MoveFirst
Else
  Unidade.Requery
End If
%>
</select>

<script language="javascript">
function Data1()
 {
  if (document.CadEventos.Data.value.length>=800)
    {
    window.alert("Você nÃO pode digitar mais que 800 caracteres!");               
	document.CadEventos.Data.focus();
    }
 }

function Local1()
 {
  if (document.CadEventos.Local.value.length>=800)
    {
    window.alert("Você nÃO pode digitar mais que 800 caracteres!");               
	document.CadEventos.Local.focus();
    }
 }
</script>


<script language="vbscript">
function validarData(dia,mes,ano) 
  'elimino possiveis espacos aos lados dos numeros que recebo por parametro 
  dia=document.form1.dia.selected
  mes=document.form1.ano.selected 
  ano=document.form1.ano.selected 

  if len(dia)=0 or len(dia)>2 or len(mes)=0 or len(mes)>2 or len(ano)=0 or len(ano)>4 then 
    validarData = false 
  end if 

  'compovo que os caracteres dos parametros sao numeros 

  if (not isNumeric(dia)) or (not isNumeric(mes)) or (not isNumeric(ano)) then 
    validarData = false 
    exit function 
  end if 

  'O mes nao pode ser maior que 12 nem menor que 1 

  mes = cint(mes) 
  if mes > 12 or mes < 1 then 
    validarData = false 
    exit function 
  end if 
  dia = cint(dia) 

  'O dia nao pode ser menor que 1 

  if dia < 1 then 
    validarData = false 
    exit function 
  end if 

  'O dia, dependendo do mes que seja, pode ter uns ou outros valores 

  if mes=1 or mes=3 or mes=5 or mes=7 or mes=8 or mes=10 or mes=12 then 

    'nesses meses pode ter 31 dias 

    if dia > 31 then 
      validarData = false 
      exit function 
    end if 
  elseif mes=2 then 

    'en fevereiro temos que ver se sera ano bissexto 
    'consigo o numero de ano de 4 cifras. 
    'se nos derem um valor de 2 cifras < 31 se refere a 2000 mais esse valor 

    if ano < 31 then 
      ano = ano + 2000 

    'se nos derem um valor de 2 cifras > 31 se refere a 1900 mais esse valor 

    elseif ano < 100 then 
      ano = ano + 1900 
    end if 

    'calculo se o ano eh bissexto 
    'se for divisivel por quatro e (nao divisivel por 100 ou divisivel por 400) 

    if ((ano mod 4)=0) and ((ano mod 100)<>0 or (ano mod 400)=0) then 

      'eh bissexto 

      if dia > 29 then 
        validarData = false 
        exit function 
      end if 
    else 

      'NAO eh bissexto 

      if dia > 28 then 
        validarData = false 
        exit function 
      end if 
    end if 
  else 

    'em todos os demais meses chegam a ter 30 dias 

    if dia > 30 then 
      validarData = false 
      exit function 
    end if 
  end if 

  'se estou aqui eh porque todas as comprovacoes foram positivas 

  validarData = true 
end function 
</script>

  <script for="Dia" event="onBlur" language="VBScript">
          dia=document.CadEventos.dia.value
          mes=document.CadEventos.mes.value
          ano=document.CadEventos.ano.value
          dia=trim(dia)
          mes=trim(mes)
          ano=trim(ano)
          mes = cint(mes) 
          dia = cint(dia) 
          ano=  cint(ano)
          If mes=2 then 
             if (ano mod 4)=0 then 
                if dia > 29 then 
                   msgbox("Este mês de fevereiro não pode ter " + cstr(dia) + " dias")
			       document.CadEventos.dia.focus
                end if 
             else 
                if dia > 28 then 
                   msgbox("Este mês de fevereiro não pode ter " + cstr(dia) + " dias")
				   document.CadEventos.dia.focus
                end if 
             end if 
         end if
         if mes=4 or mes=6 or mes=9 or mes=11 then
	        if dia > 30 then 
               msgbox("Este mês de não pode ter " + cstr(dia) + " dias")
               document.CadEventos.dia.focus
            end if 
         end if 
 </script>
 
 <script for="Mes" event="onBlur" language="VBScript">
          dia=document.CadEventos.dia.value
          mes=document.CadEventos.mes.value
          ano=document.CadEventos.ano.value
          dia=trim(dia)
          mes=trim(mes)
          ano=trim(ano)
          mes = cint(mes) 
          dia = cint(dia) 
          ano=  cint(ano)
          If mes=2 then 
             if (ano mod 4)=0 then 
                if dia > 29 then 
                   msgbox("Este mês de fevereiro não pode ter " + cstr(dia) + " dias")
			       document.CadEventos.dia.focus
                end if 
             else 
                if dia > 28 then 
                   msgbox("Este mês de fevereiro não pode ter " + cstr(dia) + " dias")
				   document.CadEventos.dia.focus
                end if 
             end if 
         end if
         if mes=4 or mes=6 or mes=9 or mes=11 then
	        if dia > 30 then 
               msgbox("Este mês de não pode ter " + cstr(dia) + " dias")
               document.CadEventos.dia.focus
            end if 
         end if 
 </script>
 