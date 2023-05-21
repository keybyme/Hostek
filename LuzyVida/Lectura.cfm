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
  <cfoutput>
    <cfset ws_fecha_today = DateFormat(Now(),"mm/dd/yyyy")> 
    <cfset ws_fecha = #DateFormat(DateAdd('d', 0, ws_fecha_today),'mmdd')#> 
     
    <cfset todayDate = #Now()#>
    <cfset ws_hora = #TimeFormat(todayDate, "HH")#>
    <cfif ws_hora GT 11>
      <cfset am_pm = "pm">
    <cfelse>
      <cfset am_pm = "am">
    </cfif>    
  </cfoutput> 

  <cfset ws_I = 1>

  <CFSET GetLectura.RecordCount=0>
  <CFQUERY NAME="GetLectura" datasource="wolffdb_dsn">
 
      Select * 
      from Lectura 
      where lec_fecha = #ws_fecha#											
                                     
  </CFQUERY>

<CFSET GetVersos.RecordCount=0>
<CFQUERY NAME="GetVersos" datasource="wolffdb_dsn">

    Select * 
    from lVersiculos inner join lCapitulos on 
         V_IdCapitulo = C_IdCapitulo
         inner join lLibros on 
         C_IdLibro = L_IdLibro 
         <cfif am_pm EQ "am">
                 where V_IdVersiculo BETWEEN #GetLectura.lec_am_start# and #GetLectura.lec_am_end#		
              <cfelse>	
                 where V_IdVersiculo BETWEEN #GetLectura.lec_pm_start# and #GetLectura.lec_pm_end#
         </cfif>       
    order by V_IdVersiculo                               
</CFQUERY>

<table border="1" bordercolor="#CC0000"> 
  <tr><td colspan="4" align="center">
    <cfoutput>
    <cfif am_pm EQ "am">
        <h2><font color="blue">Lectura AM de hoy #ws_fecha_today#</font></h2>
    <cfelse>
        <h2><font color="brown">Lectura PM de hoy #ws_fecha_today#</font></h2>
    </cfif> 
  </cfoutput> 
  </td></tr> 
<cfloop query="GetVersos">     
  <cfoutput>
    <cfif ws_I EQ 0>
      <cfset ws_color = bgcolorNo>
       <cfset ws_I = 1>
    <cfelse>
       <cfset ws_color = bgcolorYes>
       <cfset ws_I = 0>
    </cfif> 
    <tr>
      <td bgcolor="#(ws_color)#">#GetVersos.L_Libro_Desc#</td>
      <td bgcolor="#(ws_color)#">#GetVersos.C_Capitulo_Desc#</td>
      <td bgcolor="#(ws_color)#">#GetVersos.V_versiculo#</td>
      <td bgcolor="#(ws_color)#">#GetVersos.V_Contenido#</td>
    </tr>  
  </cfoutput>  
</cfloop>
</table>

<!--
<audio autoplay>  
  <source src="Musica/SoloCristo.mp3" type="audio/mpeg"> 
 
  <source src="Musica/CANTAALELUYAALSENOR.mp3" type="audio/mpeg">
 
  <source src="Musica/ERESMIPROTECTOR.mp3" type="audio/mpeg"> 
</audio>
-->

</div>

</div>
</body>