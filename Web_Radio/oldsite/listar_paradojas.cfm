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
<CFQUERY NAME="GetCara" datasource="luzyvidaDB_dsn">
  SELECT *    
	From lParadojas inner join lPa_cara on
	     pa_key = ca_fk_pa_key inner join lVersiculos on 
	     ca_verso = V_IdVersiculo inner join lCapitulos on
  	    V_IdCapitulo = C_IdCapitulo inner join lLibros on
	    C_IdLibro = L_IdLibro
     WHERE  pa_key = #Trim(url.IDtemaU)#     
  order by ca_verso
</CFQUERY>
	
	<table border="3" bordercolor="#FF0000">
		<tr><td colspan="4" align="center" style="color:#006">
			<cfoutput><h4>#TRIM(GetCara.pa_titulo_cara)#&nbsp;&nbsp;&nbsp;(lado 1)</h4></cfoutput>
			</td></tr>
		 <th style="color:#006" bgcolor="#CCCCCC">Libro</th>
        <th style="color:#006" bgcolor="#CCCCCC">Capitulo</th>
		 <th style="color:#006" bgcolor="#CCCCCC">Versiculo</th>
        <th style="color:#006" bgcolor="#CCCCCC">Texto</th>
 <cfloop query="GetCara"> 
 <cfoutput> 
	 				   	 
	 <tr>
		 
		<div> 
     
		 <td><strong>#TRIM(GetCara.L_Libro_Desc)#</strong></td>
		 <td><strong>#TRIM(GetCara.C_Capitulo_Desc)#</strong></td>
		 <td><strong>#TRIM(GetCara.V_versiculo)#</strong></td>					 
	     <td><strong>#TRIM(GetCara.V_Contenido)#</strong></td> </div>
	 </tr>
						
 </cfoutput>
 </cfloop>
 	</table>
	
	
	<br>
	

<CFSET GetSello.RecordCount=0>
<CFQUERY NAME="GetSello" datasource="luzyvidaDB_dsn">
  SELECT *    
	From lParadojas inner join lPa_sello on
	     pa_key = se_fk_pa_key inner join lVersiculos on 
	     se_verso = V_IdVersiculo inner join lCapitulos on
  	    V_IdCapitulo = C_IdCapitulo inner join lLibros on
	    C_IdLibro = L_IdLibro
     WHERE  pa_key = #Trim(url.IDtemaU)#     
  order by se_verso
</CFQUERY>
	
	<table border="3" bordercolor="#0000A0">
		<tr><td colspan="4" align="center" style="color:#006">
			<cfoutput><h4>#TRIM(GetSello.pa_titulo_sello)#&nbsp;&nbsp;&nbsp;(lado 2)</h4></cfoutput>
			</td></tr>
		 <th style="color:#006" bgcolor="#CCCCCC">Libro</th>
        <th style="color:#006" bgcolor="#CCCCCC">Capitulo</th>
		 <th style="color:#006" bgcolor="#CCCCCC">Versiculo</th>
        <th style="color:#006" bgcolor="#CCCCCC">Texto</th>
 <cfloop query="GetSello"> 
 <cfoutput> 
	 				   	 
	 <tr>
		 
		<div> 
     
		 <td><strong>#TRIM(GetSello.L_Libro_Desc)#</strong></td>
		 <td><strong>#TRIM(GetSello.C_Capitulo_Desc)#</strong></td>
		 <td><strong>#TRIM(GetSello.V_versiculo)#</strong></td>					 
	     <td><strong>#TRIM(GetSello.V_Contenido)#</strong></td> </div>
	 </tr>
						
 </cfoutput>
 </cfloop>
 	</table>
		
		
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
