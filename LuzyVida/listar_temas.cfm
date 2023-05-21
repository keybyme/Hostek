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
      
       
		 
   <!---contenido --->
<cfparam name="url.IDtemaU" default="">
<cfset ws_I = 0>		
 
	
<CFSET GetCapitulo.RecordCount=0>
<CFQUERY NAME="GetVersos" datasource="wolffdb_dsn">
  
  EXECUTE spListarTemas #Trim(url.IDtemaU)#
</CFQUERY>
	
<table border="1" bordercolor="#CC0000">
	<tr>
	<cfoutput>
		<td colspan="3" align="center">	
		<h2>#TRIM(GetVersos.L_Libro_Desc)#</h2></td>
	</tr>
	<tr>
		<td colspan="3" align="center"><strong>
		Cap&iacute;tulo&nbsp;#TRIM(GetVersos.C_Capitulo_Desc)#</strong></td>
	</tr>	
	<tr>
		<td colspan="3" align="center">
			<h2 style="color: brown">#TRIM(GetVersos.T_titulo)#</h2>
		<cfset ws_verso_ant = #TRIM(GetVersos.V_versiculo)#></td>
	</tr></cfoutput>
	
 <cfloop query="GetVersos"> 
	<tr>
 <cfoutput> 
	        <cfif ws_verso_ant GT #TRIM(GetVersos.V_versiculo)#>
				<td>
				<strong>#TRIM(GetVersos.L_Libro_Desc)#&nbsp;&nbsp;
		         Cap&iacute;tulo&nbsp;#TRIM(GetVersos.C_Capitulo_Desc)#</strong></td>
			</cfif> 
	 				   <cfif ws_I EQ 0>
                 	         <cfset ws_color = bgcolorNo>
                             <cfset ws_I = 1>
                        <cfelse>
                             <cfset ws_color = bgcolorYes>
                             <cfset ws_I = 0>
                        </cfif> 
		 
	<cfif (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn AND 
		  SESSION.Auth.user_role GT 95)>
		  <td bgcolor="#(ws_color)#">#TRIM(GetVersos.V_IdVersiculo)#</div></td>
    </cfif>		 
	<td bgcolor="#(ws_color)#"> 
     <strong>#TRIM(GetVersos.V_versiculo)#</td>				 
	<td bgcolor="#(ws_color)#">#TRIM(GetVersos.V_Contenido)#</strong></div></td>
	  
		<cfset ws_verso_ant = #TRIM(GetVersos.V_versiculo)#>					
 </cfoutput>
</tr>
 </cfloop>
</table>
	
		
   <!---End contenido	--->	
			
</div>
	   
      
      <!---<h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div> 
  </div>
</div>
 

</body>
</html>
