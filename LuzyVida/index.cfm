<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="my.css">
</head>
<body>
    <cfinclude template="menu.cfm"></cfinclude>
<div class="column2" style="background-color:#ffffff;">
<div class="main">

    <div>
    <img src="images/LogoLYV_12.gif" width="41" height="38" alt=""/>
    
    <h1 style="color: blue">Luz y Vida</h1>
    <cfif IsDefined("SESSION.Auth.IsLoggedIn") and (SESSION.Auth.user_nombre neq '')>
        <cfoutput>
          <p><font color="brown">Welcome #SESSION.Auth.user_nombre# !!!</font></p>
        </cfoutput>    
    </cfif>
    </div>

    <div>
        <p align="justify">	  
     LA BIBLIA contiene la mente de Dios, el estado del hombre, el camino de salvaci&oacute;n, la condenaci&oacute;n de los pecadores y la felicidad de los creyentes. Sus doctrinas son santas, sus preceptos son comprometidos, sus historias son verdaderas y sus decisiones son inmutables. L&eacute;ala para ser sabio, cr&eacute;ala para ser salvo y pract&iacute;quela para ser santo. Contiene luz para guiarle, alimento para sostenerlo y consuelo para alentarlo.<br><br>
       
       La Biblia es el mapa del viajero, el cayado del peregrino, la br&uacute;jula del piloto, la espada del soldado, y el itinerario del cristiano. Aqu&iacute; se restablece el Para&iacute;so y las puertas del infierno son reveladas.<br><br>
       
       CRISTO es su gran tema, nuestro bien su dise&ntilde;o y la gloria de Dios su finalidad.     Debe llenar la memoria, gobernar el coraz&oacute;n y guiar los pies. L&eacute;ala lentamente, frecuentemente y en oraci&oacute;n. Es una mina de riqueza, 
       un para&iacute;so de gloria y un r&iacute;o de placer. Es dada a Ud. en vida, ser&aacute; abierta en el juicio y recordada para siempre. Ella encierra la responsabilidad m&aacute;s alta, recompensar&aacute; la labor m&aacute;s grande y condenar&aacute; a todos los que 
       menosprecien su contenido sagrado.</p>
    </div>
</div>

</div>
</body>