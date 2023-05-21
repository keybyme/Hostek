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
      <h1>Estudios B&iacute;blicos</h1>
      <p>
		<div>
   <!---contenido --->
	<cfif isDefined("form.Criteria")>
         <cfset url.Criteria = trim(form.Criteria)>
    </cfif>
	 
	<cfif isDefined("form.startRow")>
	     <cfset url.startRow = trim(form.startRow)>	
	</cfif>
		 
<CFSET GetTema.RecordCount=0>
<CFQUERY NAME="GetEstudio" datasource="wolffdb_dsn">
  SELECT *                  
  FROM  lEstudios
	  where e_flag_activo = 1
  	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
      and  e_estudio LIKE '%#Trim(url.Criteria)#%'                    
    </cfif> 
  order by e_estudio
	 
</CFQUERY>
 
	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
		<cfset ws_end_row = 200>
	<cfelse>		
	    <cfset ws_end_row = #Trim(url.startRow)# + 11> 		
	</cfif>	
		
	<table>
   
     
<cfform name="disp" method="post" action="EstudiosBib.cfm?startRow=1">

    <tr>
        <td>Buscar:  <input name="Criteria" size="30"></td>
         <td valign="bottom" colspan="2"><input type="submit" name="editpho" value="enviar"></td> 
    </tr>          
 
</cfform>
		
		
</tr>
   <tr>
        <th style="color:#006" bgcolor="#CCCCCC">Estudios</th>
      

    <cfif (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn AND 
		  SESSION.Auth.user_role GT 95)>
		<th style="color:#006" bgcolor="#CCCCCC">
			&nbsp; &nbsp; &nbsp; &nbsp;Short Url</th>
    </cfif>	
	</th>
 <cfloop query="GetEstudio" startrow="#trim(url.startRow)#" endrow="#ws_end_row#"> 
 <cfoutput> 
 <tr>

  <td><a href="#e_http#" target="_blank">#TRIM(GetEstudio.e_estudio)#</a></td>	 
  
  <cfif IsDefined("SESSION.Auth.IsLoggedIn") and (SESSION.Auth.user_role GT 95)>
		 &nbsp; &nbsp; &nbsp; &nbsp;
          
  <td><a href="listar_versos_E.cfm?url_s=#TRIM(GetEstudio.e_short_url)#&e_titulo=#TRIM(GetEstudio.e_estudio)#" target="_blank">#TRIM(GetEstudio.e_short_url)#</a></td>	 
 </tr>
    </cfif>
	 
 </cfoutput>
 </cfloop>
 </table>
	<cfoutput>
		<br>
	<cfif NOT (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '')>	
		
	   <cfif ws_end_row GT 12>
	     <cfset ws_prev = trim(url.startRow) - 12>	
	     <a href="EstudiosBib.cfm?startRow=#ws_prev#"><strong>Prev Page</strong></a>	
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   </cfif>		 
	   <cfset ws_end_row = ws_end_row + 1>		
	   <a href="EstudiosBib.cfm?startRow=#ws_end_row#"><strong>Next Page</strong></a>
	</cfif>	
	</cfoutput> 
			
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
