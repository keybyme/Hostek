<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="my.css">
</head>
<body>
    <cfinclude template="menu.cfm"></cfinclude>
	 
  
    <div class="column2" style="background-color:#ffffff;">
      <div class="main">
      <p>
		<div>
   <!---contenido --->
<cfparam name="url.IDtemaU" default="">
<cfset ws_I = 0>	
		
<CFSET GetCara.RecordCount=0>
<CFQUERY NAME="GetCara" datasource="wolffdb_dsn">
  SELECT *    
	From lv_versos_estudios inner join lVersiculos on
	     lv_fk_V_IdVersiculo = V_IdVersiculo inner join lCapitulos on 
	     V_IdCapitulo = C_IdCapitulo inner join lLibros on
	    C_IdLibro = L_IdLibro
     WHERE  lv_fk_e_id_key = #Trim(url.IDtemaU)#     
  order by lv_sort_by
</CFQUERY>

<cfquery name="GetEstudio" datasource="wolffdb_dsn">
     Select * from lEstudios
     where e_id_key = #Trim(url.IDtemaU)#
</cfquery>

	<table border="3" bordercolor="#FF0000">
		<tr><td colspan="4" align="center" style="color:#006">
			<cfoutput><h2>#TRIM(GetEstudio.e_estudio)#</h2></cfoutput> 
			</td></tr>
		 <th style="color:#006" bgcolor="#CCCCCC">Libro</th>
        <th style="color:#006" bgcolor="#CCCCCC">Capitulo</th>
		 <th style="color:#006" bgcolor="#CCCCCC">Versiculo</th>
        <th style="color:#006" bgcolor="#CCCCCC">Texto</th>
 <cfloop query="GetCara"> 
 <cfoutput> 
	 		 <cfif ws_I EQ 0>
                      <cfset ws_color = bgcolorNo>
                      <cfset ws_I = 1>
             <cfelse>
                      <cfset ws_color = bgcolorYes>
                      <cfset ws_I = 0>
             </cfif> 		   	 
	 <tr>
		 
		<div> 
     
		 <td bgcolor="#(ws_color)#"><strong>#TRIM(GetCara.L_Libro_Desc)#</strong></td>
		 <td bgcolor="#(ws_color)#"><strong>#TRIM(GetCara.C_Capitulo_Desc)#</strong></td>
		 <td bgcolor="#(ws_color)#"><strong>#TRIM(GetCara.V_versiculo)#</strong></td>					 
	     <td bgcolor="#(ws_color)#"><strong>#TRIM(GetCara.V_Contenido)#</strong></td> </div>
	 </tr>
						
 </cfoutput>
 </cfloop>
 	</table>
	
	
	<br>
	
  
		
   <!---End contenido	--->	
			
</div>
	  </p>
      
      <!---<h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
 
  </div>
</div>
 
</body>
</html>
