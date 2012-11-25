<html>
<head>
<link href="css/STYLE.CSS" rel="stylesheet" type="text/css">
<title>SISTEMA DE EVENTOS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- Fireworks MX Dreamweaver MX target.  Created Sun Mar 02 16:58:21 GMT-0300 (Hora oficial do Brasil) 2008-->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div id="entrada" style="position:absolute; width:380px; height:231px; z-index:1; left: 357px; top: 239px;">
<form name="form1" method="post" action="MENUPRINCIPAL.ASP">
  <p align="center"><br>
    <br>
    <br>
    <font color="#0033CC" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#000000" face="Arial, Helvetica, sans-serif">IDENTIFICA&Ccedil;&Atilde;O</font> <br>
    <br>
    </strong></font>           
  <div align="center"><font color="#FF6600"><strong><font size="2" face="Arial, Helvetica, sans-serif">USU&Aacute;RIO
           SENAC</font></strong></font><font color="#003399"><br>
     </font>                           
           <input name="SIGLA" type="text" class="FORMFONT1" id="SIGLA" size="40" maxlength="200">
          <br>
          <strong><font color="#FF6600" size="2" face="Arial, Helvetica, sans-serif">SENHA</font></strong><font color="#FF0000"><br>
          </font><font color="#FF6600">          </font>                                                  
          <input name="SENHA" type="password" class="FORMFONT1" id="SENHA" size="25" maxlength="25" >
          <br>
          <input name="Submit" type="submit" onClick="MM_validateForm('SIGLA','','R','SENHA','','R');return document.MM_returnValue" value="Enviar">
    </div>
</form></div>
<img name="MENU20SCE" src="MENU%20SCE.gif" width="1280" height="768" border="0" alt="">
</body>
</html>
