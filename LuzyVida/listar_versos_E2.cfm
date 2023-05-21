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

   <!---contenido ---> 
 
 <cfparam name="url.url_s" default="">
 <cfparam name="url.e_titulo" default=""> 
 <cfset ws_I = 0>
			
<CFSET GetVersos.RecordCount=0>
<CFQUERY NAME="GetVersos" datasource="wolffdb_dsn">
  SELECT *                  
  FROM  estudio_versos inner join lVersiculos on
	    ve_fk_V_IdVersiculo = V_IdVersiculo  
	    inner join lCapitulos on
  	    V_IdCapitulo = C_IdCapitulo inner join lLibros on
	    C_IdLibro = L_IdLibro   
     WHERE  ve_fk_e_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">       
  order by V_IdVersiculo
</CFQUERY>	
	
<CFSET GetTitulo.RecordCount=0>
<CFQUERY NAME="GetTitulo" datasource="wolffdb_dsn">
  SELECT *                  
  FROM  lEstudios  
     WHERE  e_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">   
</CFQUERY>		
	
	<table border="2" bordercolor="blue">
		<tr><h2><cfoutput>#TRIM(GetTitulo.e_estudio)#</cfoutput></h2></tr>
		<tr align="center">
		<td><strong>Libro</strong></td>
		<td><strong>Capitulo</strong></td>
		<td><strong>Verso</strong></td>
		<td><strong>Texto</strong></td>	
		</tr>
 	<cfloop query="GetVersos"> 
 <cfoutput> 
	 
	 				    <cfif ws_I EQ 0>
                 	         <cfset ws_color = bgcolorNo>
                             <cfset ws_I = 1>
                        <cfelse>
                             <cfset ws_color = bgcolorYes>
                             <cfset ws_I = 0>
                        </cfif> 
								 
	 <p>
		 <div style="color: #ws_color#">
		<tr>	 

    <td><strong>#TRIM(GetVersos.L_Libro_Desc)#</strong></td>
	<td><strong>#TRIM(GetVersos.C_Capitulo_Desc)#</strong></td>
	<td><strong>#TRIM(GetVersos.V_versiculo)#</strong></td>				 
	<td><strong>#TRIM(GetVersos.V_Contenido)#</strong></td>
	 </tr>		
   </div>
	 </p>
 </cfoutput>
 </cfloop>
	</table>	
   <!---End contenido	--->	
 
  </div>
</div>
 

</body>
</html>
