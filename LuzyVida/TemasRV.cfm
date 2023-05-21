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
      <h1>Temas de la Biblia</h1>
      <p>
	 
   <!---contenido --->
	<cfif isDefined("form.Criteria")>
         <cfset url.Criteria = trim(form.Criteria)>
    </cfif>
	 
	<cfif isDefined("form.startRow")>
	     <cfset url.startRow = trim(form.startRow)>	
	</cfif>
		 
<CFSET GetTema.RecordCount=0>
<CFQUERY NAME="GetTema" datasource="wolffdb_dsn">
  SELECT *                  
  FROM  lTema
  	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
      where  T_titulo LIKE '%#Trim(url.Criteria)#%'                    
    </cfif> 
  order by T_id_key
	 
</CFQUERY>
 
	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
		<cfset ws_end_row = 200>
	<cfelse>		
	    <cfset ws_end_row = #Trim(url.startRow)# + 11> 		
	</cfif>	
		
	<table>
   
     
<cfform name="disp" method="post" action="TemasRV.cfm?startRow=1">

    <tr>
        <td>Buscar:  <input name="Criteria" size="30"></td>
         <td valign="bottom" colspan="2"><input type="submit" name="editpho" value="enviar"></td> 
    </tr>          
 
</cfform>
		
		
</tr>
   <tr>
        <th style="color:#006" bgcolor="#CCCCCC">Tema</th>
    </tr>      

	
 <cfloop query="GetTema" startrow="#trim(url.startRow)#" endrow="#ws_end_row#"> 
 <cfoutput> 
 <tr>

  <td><a href="Listar_temas.cfm?IDtemaU=#GetTema.T_id_key#" target="_blank">#TRIM(GetTema.T_titulo)#</a></td>	 
 </tr>

	 
 </cfoutput>
 </cfloop>
 </table>
	<cfoutput>
		<br>
	<cfif NOT (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '')>	
		
	   <cfif ws_end_row GT 12>
	     <cfset ws_prev = trim(url.startRow) - 12>	
	     <a href="TemasRV.cfm?startRow=#ws_prev#"><strong>Prev Page</strong></a>	
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   </cfif>		 
	   <cfset ws_end_row = ws_end_row + 1>		
	   <a href="TemasRV.cfm?startRow=#ws_end_row#"><strong>Next Page</strong></a>
	</cfif>	
	</cfoutput> 
			
   <!---End contenido	--->	
			
</div>
	  </p>
      
      <!---<h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    
  </div>
</div>

 

</body>
</html>
