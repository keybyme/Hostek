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
		
<div class="container-fluid text-center">     
  
<CFSET GetTrans.RecordCount=0>
<cfquery name = "GetTrans" dataSource = "wolffdb_dsn">
    Select *
    From FN_Transacciones 
	Where #SESSION.Auth.user_key# = fn_fk_user_key
    and fn_key = <cfqueryparam value="#URL.url_fn_key#" cfsqltype="cf_sql_numeric"> 
</cfquery>			
			
<cfset GetCat.RecordCount=0>
<cfquery name="GetCat" datasource="wolffdb_dsn">
	  Select *
		From FN_Categorias
		Where cat_fk_user_key = #SESSION.Auth.user_key#
		order by cat_desc
</cfquery>	 
	
<cfset GetTP.RecordCount=0>
<cfquery name="GetTP" datasource="wolffdb_dsn">
	  Select *
		From FN_Tipo_Pagos
		Where tp_fk_user_key = #SESSION.Auth.user_key#
		order by tp_desc
</cfquery>		
	
<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_upd_Trans.cfm">
	<cfoutput>
        <input type="hidden" name="fn_key" value="#GetTrans.fn_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    

      <tr>
     	<td>Fecha: </td>
        <td><cfinput name="fn_yyyymmdd" type="DateField" value="#GetTrans.fn_yyyymmdd#"></td>    
     </tr>
	
      <tr>
     	<td>Categoria: </td>
		 <td>
			<cfselect input name="fn_fk_cat_key" size="1">	 
		        <cfoutput>   
				   <option value="">Categories</option>
			           <cfloop query="GetCat"> 
						   <cfif #GetTrans.fn_fk_cat_key# EQ #GetCat.cat_key#>	 
					             <option value="#GetCat.cat_key#" selected>#GetCat.cat_desc#</option>
						   <cfelse>
							     <option value="#GetCat.cat_key#">#GetCat.cat_desc#</option>
						   </cfif>	   
	                   </cfloop>
			    </cfoutput>  	  
            </cfselect>		 
		</td>    
      </tr>	 
	
      <tr>
     	<td>Tipo Pago: </td>
		 <td>
			<cfselect input name="fn_fk_tp_key" size="1">	 
		        <cfoutput>   
				   <option value="">Tipo Pago</option>
			           <cfloop query="GetTP"> 
						   <cfif #GetTrans.fn_fk_tp_key# EQ #GetTP.tp_key#>	 
					             <option value="#GetTP.tp_key#" selected>#GetTP.tp_desc#</option>
						   <cfelse>
							     <option value="#GetTP.tp_key#">#GetTP.tp_desc#</option>
						   </cfif>	   
	                   </cfloop>
				</cfoutput>  	  
            </cfselect>		 
		</td>    
      </tr>		
	
    <tr>
        <td>Tienda: </td>
        <td><cfinput name="fn_tienda" value="#GetTrans.fn_tienda#" size="50"></td>
    </tr>    
    <tr>
        <td>Monto:</td>
        <td><cfinput name="fn_monto" value="#GetTrans.fn_monto#" size="50"></td>
    </tr>
 
	<tr>
        <td>Status:</td>
        <td>
		    <cfselect input name="fn_status" size="1">	 
		        <cfoutput>   
				   <option value="">Status</option>
			           
						   <cfif #GetTrans.fn_status# EQ 1>	 
					              <option value="">Status</option> 
				                  <option value="1" selected>Por Pagar</option> 
				                  <option value="2">Cancelado</option>
						   <cfelseif #GetTrans.fn_status# EQ 2>
							      <option value="">Status</option> 
				                  <option value="1">Por Pagar</option> 
				                  <option value="2" selected>Cancelado</option>
						   <cfelse>
							      <option value="" selected>Status</option> 
				                  <option value="1">Por Pagar</option> 
				                  <option value="2">Cancelado</option>
						   </cfif>	    
				</cfoutput> 
		    </cfselect>			
		</td>
    </tr>
  
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
		
    </tr>   				
</table>
</cfoutput> 
</cfform>
</div>
	  </p>
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div> 
  </div>
</div>
	 

</body>
</html>
