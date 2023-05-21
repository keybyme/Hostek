<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="my.css">

</head>
<body>
<cfinclude template="menu.cfm"></cfinclude>
	
<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    	<cflocation url="https://www.keybyme.com">
</cfif>   	
 	
<cfset GetCat.RecordCount=0>
<cfquery name="GetCat" datasource="wolffdb_dsn">
	  Select *
		From FN_Cat_Income
		Where ci_fk_user_key = #SESSION.Auth.user_key#
		order by ci_desc
</cfquery>	
	
<cfform name="aghno" method="post" action="dsp_Income.cfm">

<table align="center" border="0">
	<tr>
	  <th>
	      <h2 align="center">Agregar Income</h2>
	  </th>	
	</tr>
	
	<tr><td><br></td></tr>
	
     <tr>
     	<th>Fecha: </th>
        <td colspan="2">   
        <cfinput 
         type="date" 
         name="i_fecha"  
		 required="Yes"
		 message="Fecha es requerida">
        </td>  
     </tr> 
	
     <tr>
  	  <th>Monto:</th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="i_monto" 	 
         class="form-control">
        </td>    
     </tr> 
	
	 <tr> 
	  
	 <tr>
	 <th>From:</th>	
		<td> 
			<cfselect input name="i_from" size="1">	 
		        <cfoutput>   
				  <option value="">Categories</option>
			      <cfloop query="GetCat"> 
				  <option value="#GetCat.ci_key#">#GetCat.ci_desc#</option>
	              </cfloop>
				  </cfoutput>  	  
            </cfselect>	 	
	    </td>
	</tr>
	 
     <tr>
     	<td colspan="3"> 
        <cfinput type="submit" name="enviar" value="Send">  
        </td>
     </tr>   	                                            
</table>     
</cfform>
</div>
	  </p>
	  
     

    </div> 
  </div>
</div>
	 

</body>
</html>
