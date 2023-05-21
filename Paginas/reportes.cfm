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
		From FN_Categorias
		Where cat_fk_user_key = #SESSION.Auth.user_key#
		order by cat_desc
</cfquery>
	
<cfset GetTipo.RecordCount=0>
<cfquery name="GetTipo" datasource="wolffdb_dsn">
	  Select *
		From FN_Tipo_Pagos
		Where tp_fk_user_key = #SESSION.Auth.user_key#
		order by tp_desc
</cfquery>	
	
<cfform name="aghno" method="post" action="imp_reportes.cfm">

<table align="center" border="0">
	<tr>
	  <th>
	      <h2 align="center">Reportes</h2>
	  </th>	
	</tr>
	
	<tr><td><br></td></tr>
	
     <tr>
     	<th>Fecha desde: </th>
        <td>   
        <cfinput 
         type="date" 
         name="fecha_in" 
	     value=""			 
         class="form-control">
        </td>  
     </tr>
     <tr>			
     	<th>Fecha hasta: </th>
        <td>   
        <cfinput 
         type="date" 
         name="fecha_out" 
		 value=""		 
         class="form-control">
        </td>  
     </tr>
     <tr>	   
     	<th>Tienda: </th>
        <td>   
        <cfinput 
         type="text" 
         name="fn_tienda" 
         class="form-control">
        </td>    
      </tr>
      <tr>	
	 <th>Status:</th>	
		<td> 
			<cfselect input name="fn_status" size="1">	 
		        <cfoutput>   
				  <option value="">Status</option> 
				  <option value="1">Por Pagar</option> 
				  <option value="2">Cancelado</option>	
				</cfoutput>  	  
            </cfselect>	 	
	    </td>
      </tr>
     <tr>	
	 <th>Categorias:</th>	
		<td> 
			<cfselect input name="fn_fk_cat_key" size="1">	 
		        <cfoutput>   
				  <option value="">Categories</option>
			      <cfloop query="GetCat"> 
				  <option value="#GetCat.cat_key#">#GetCat.cat_desc#</option>
	              </cfloop>
				  </cfoutput>  	  
            </cfselect>	 	
	    </td>
      </tr>
     <tr>	
	 <th>Tipo de Pagos:</th>	
		<td> 
			<cfselect input name="fn_fk_tp_key" size="1">	 
		        <cfoutput>   
				  <option value="">Pagos</option>
			      <cfloop query="GetTipo"> 
				  <option value="#GetTipo.tp_key#">#GetTipo.tp_desc#</option>
	              </cfloop>
				  </cfoutput>  	  
            </cfselect>	 	
	    </td>
      </tr>
      <tr>	
     	<td> 
        <cfinput type="submit" name="enviar" value="Send">  
        </td>
     </tr>   
</table>     
</cfform>
	
<!---==========================================================--->	
	
<cfform name="aghno" method="post" action="imp_reportes_tot.cfm">

<table align="center" border="0">
	<tr>
	  <th>
	      <h2 align="center">Totales</h2>
	  </th>	
	</tr>
	
	<tr><td><br></td></tr>
	
     <tr>
     	<th>Fecha desde: </th>
        <td>   
        <cfinput 
         type="date" 
         name="fecha_in" 
	     value=""			 
         class="form-control">
        </td>  
     </tr>
     <tr>			
     	<th>Fecha hasta: </th>
        <td>   
        <cfinput 
         type="date" 
         name="fecha_out" 
		 value=""		 
         class="form-control">
        </td>  
     </tr>
     
      <tr>	
     	<td> 
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
