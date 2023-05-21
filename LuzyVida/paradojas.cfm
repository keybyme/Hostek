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
      <h1>Paradojas B&iacute;blicas</h1>
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
<CFQUERY NAME="GetTema" datasource="wolffdb_dsn">
  SELECT *                  
  FROM  lParadojas
  	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
      where  pa_titulo_cara LIKE '%#Trim(url.Criteria)#%' or
		     pa_titulo_sello Like '%#Trim(url.Criteria)#%'
    </cfif> 
  order by pa_titulo_cara
	 
</CFQUERY>
 
	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
		<cfset ws_end_row = 200>
	<cfelse>		
	    <cfset ws_end_row = #Trim(url.startRow)# + 11> 		
	</cfif>	
		
	<table>
		<tr><td colspan="4">
					<p>
		 Una paradoja b&iacute;blica es "una moneda" de dos caras que aparentemente (seg&uacute;n la mente finita del hombre) se contradicen; sin embargo "estas dos caras" son dos verdades que estan en las escrituras y solo pueden armonizar bajo la fe que Cristo nos da. Muchas de estas verdades molestan y enojan a la humanidad debido a que son chocante al entendimiento y orgullo humano.
		</p>
			</td></tr>
     
<cfform name="disp" method="post" action="paradojas.cfm?startRow=1">

    <tr>
        <td>Buscar:  <input name="Criteria" size="30"></td>
		 
         <td valign="bottom" colspan="3"><input type="submit" name="editpho" value="enviar"></td> 
    </tr>          
 
</cfform>
		
		

   <tr>
        <th style="color:#006" bgcolor="#CCCCCC">Lado 1</th>
	    <th>&nbsp;</th>
	    <th style="color:#006" bgcolor="#CCCCCC">Lado 2</th>
    </tr>      

	
 <cfloop query="GetTema" startrow="#trim(url.startRow)#" endrow="#ws_end_row#"> 
 <cfoutput> 
 <tr>

  <td><a href="Listar_paradojas.cfm?IDtemaU=#GetTema.pa_key#" target="_blank">#TRIM(GetTema.pa_titulo_cara)#</a></td>
  <td>&nbsp;&nbsp;vs&nbsp;&nbsp;</td>	 
  <td><a href="Listar_paradojas.cfm?IDtemaU=#GetTema.pa_key#" target="_blank">#TRIM(GetTema.pa_titulo_sello)#</a></td>		 
 </tr>

	 
 </cfoutput>
 </cfloop>
 </table>
	<cfoutput>
		<br>
	<cfif NOT (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '')>	
		
	   <cfif ws_end_row GT 12>
	     <cfset ws_prev = trim(url.startRow) - 12>	
	     <a href="paradojas.cfm?startRow=#ws_prev#"><strong>Prev Page</strong></a>	
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   </cfif>		 
	   <cfset ws_end_row = ws_end_row + 1>		
	   <a href="paradojas.cfm?startRow=#ws_end_row#"><strong>Next Page</strong></a>
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
