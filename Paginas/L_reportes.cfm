<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KeyByMe</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.11.4/css/dataTables.bootstrap4.min.css" rel="stylesheet">
 
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
	
<cfset GetTP.RecordCount=0>
<cfquery name="GetTP" datasource="wolffdb_dsn">
	  Select *
		From FN_Tipo_Pagos
		Where tp_fk_user_key = #SESSION.Auth.user_key#
		order by tp_desc
</cfquery>	 
	
<CFSET GetTrans.RecordCount=0>
<CFQUERY NAME="GetTrans" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  FN_Transacciones inner join FN_Categorias on fn_fk_cat_key = cat_key
	                     inner join FN_Tipo_Pagos on fn_fk_tp_key = tp_key 
        Where #SESSION.Auth.user_key# = fn_fk_user_key  
	    <cfif #URL.fdU# GT ""> 
			<cfif #URL.fhU# GT ""> 
	            and fn_yyyymmdd between '#URL.fdU#' and '#URL.fhU#'
		    </cfif>		
		</cfif>		
	    <cfif #URL.stU# GT 0>
	        and fn_status = <cfqueryparam value="#URL.stU#" cfsqltype="cf_sql_numeric">
		</cfif>	
        <cfif #URL.tdU# GT "">
		    and fn_tienda LIKE '%#URL.tdU#%'	
		</cfif>
		<cfif #URL.ctU# GT 0>
		    and fn_fk_cat_key = <cfqueryparam value="#URL.ctU#" cfsqltype="cf_sql_numeric">
		</cfif>	
		<cfif #URL.tpU# GT 0>
		    and fn_fk_tp_key = <cfqueryparam value="#URL.tpU#" cfsqltype="cf_sql_numeric">
		</cfif>		
   order by fn_fk_cat_key			
</CFQUERY>		
	
 
<cfset ws_total = 0>	
<cfset ws_monto = 0>
<cfset ws_deuda = 0>
<cfset ws_tot_deuda = 0>	
<table id="tabla" class="table table-striped table-bordered" style="width:100%">
        <thead>
			<tr>
			 
			<td><h2>Reportes</h2></td>	
			<td>
			   <a href="Finanzas.cfm">Finanzas</a><br>	
			   <a href="Reportes.cfm">Reportes</a>
            </td> 	
			<td colspan="4">
			   <cfoutput>
			   <cfif #URL.fdU# GT "">
			       <cfif #URL.fhU# GT "">	
					 <a style="color: brown">Fechas: #URL.fdU# &nbsp; #URL.fhU#</a>
				   </cfif>
			   </cfif>	   
               <cfif #URL.stU# EQ 1>
				     <a style="color: brown">Trans. Por Pagar</a>
			   <cfelseif #URL.stU# EQ 2>
				  <a style="color: brown">Trans. Pagadas</a>
			   </cfif> 
			   <cfif #URL.tdU# GT "">
				  <a style="color: brown">Tienda: #URL.tdU#</a>
			   </cfif>  
			   <cfif #URL.tpU# GT 0>
		          <a style="color: brown">Tipo Pago: #TRIM(GetTrans.tp_desc)#</a>
		       </cfif>	 
		       <cfif #URL.ctU# GT 0>
		         <a style="color: brown">Categoria: #TRIM(GetTrans.cat_desc)#</a>
		       </cfif>	   
			   </cfoutput>	   
			</td> 	
				
			</tr>
            <tr>
                <th>Fecha</th>
                <th>Tienda</th>
				<th>Monto</th>
				<th>Deuda</th>
				<th>Tipo Pago</th>
                <th>Categoria</th>  
            </tr>
        </thead>
        <tbody>
			
		<cfloop query="GetTrans">   
        <cfoutput> 		
			
			<tr>
			    <cfset ws_fecha = #TRIM(GetTrans.fn_yyyymmdd)#>  
			    <cfset ws_date = #DateFormat(DateAdd('d', 0, ws_fecha),'yy/mm/dd')#>  
			    <cfset ws_date_f = #DateFormat(DateAdd('d', 0, ws_date),'mm/dd/yy')#>  
				<cfset ws_monto = #TRIM(GetTrans.fn_monto)#>
			    <cfset ws_total = ws_total + ws_monto>	
            
                <td>#ws_date_f#</td>
                <td>#TRIM(GetTrans.fn_tienda)#</td> 
                <td align="right">#numberFormat(ws_monto,'_$,9.99')#</td> 
				<cfif #TRIM(GetTrans.fn_status)# EQ 1>
					<td align="right"><a style="color: red">#numberFormat(ws_monto,'_$,9.99')#</a></td> 
					<cfset ws_tot_deuda = ws_tot_deuda + ws_monto>
				<cfelse>
					<td>&nbsp;</td>
				</cfif> 	
				<td><a href="#TRIM(GetTrans.tp_link)#" target="_blank">#TRIM(GetTrans.tp_desc)#</a></td>
                <td>#TRIM(GetTrans.cat_desc)#</td>  
            </tr> 
					
		</cfoutput>
		</cfloop>
        </tbody>
        <tfoot>
            <tr>
                <th>Fecha</th>
                <th>Tienda</th>
				<th>Monto</th>
				<th>Deuda</th>
				<th>Tipo Pago</th>
                <th>Categoria</th>  
            </tr>
        </tfoot>
		<tr>
			<cfset ws_red = (ws_tot_deuda * 100) / ws_total> 
			 <cfset aa ="#ws_red#%"> 	
			  	 
			<td></td>
			<td align="right"> <a style="color: green"><strong>Totales ==></strong></a></td>
		    <td align="right"><cfoutput><a style="color: green"><strong>#numberFormat(ws_total,'_$,9.99')#</strong></a></cfoutput></td>
		    <td align="right"><cfoutput><a style="color: red"><strong>#numberFormat(ws_tot_deuda,'_$,9.99')#</strong></a></cfoutput></td>
			<td colspan="3"><cfoutput>#numberFormat(ws_red,'9.99')#%</cfoutput></td>
		</tr>
						
	<cfoutput>		
 	
	<!---<cfinclude template="totales.cfm?fdU=#fdi#&fhU=#fdo#"></cfinclude>	--->
 	
	</cfoutput>
			
    </table>

		
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap4.min.js"></script>
<script>
  $(document).ready(function() {
    $('#tabla').DataTable();
    } );
</script>
</body>
</html>
