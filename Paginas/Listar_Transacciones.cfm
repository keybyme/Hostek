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
	
<cfif isDefined("form.CriteriaCat")>
    <cfset url.CriteriaCat = trim(form.CriteriaCat)>
</cfif>	 	
	
<cfif isDefined("form.CriteriaTP")>
    <cfset url.CriteriaTP = trim(form.CriteriaTP)>
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
	          <cfif isDefined('url.fecha_in') AND TRIM(url.fecha_in) NEQ ''>
				  <cfif isDefined('url.fecha_out') AND TRIM(url.fecha_out) NEQ ''>
				      and fn_yyyymmdd between '#url.fecha_in#' and '#url.fecha_out#'
			      </cfif>		  
			  </cfif>	  
              <cfif (isDefined('url.tienda') AND TRIM(url.tienda) NEQ '')>
		          and fn_tienda LIKE '%#Trim(url.tienda)#%' 
	          </cfif>	
	          <cfif (isDefined('url.CriteriaCat') AND TRIM(url.CriteriaCat) NEQ '')>
		          and fn_fk_cat_key = #Trim(url.CriteriaCat)# 
	          </cfif>
		          <cfif (isDefined('url.CriteriaTP') AND TRIM(url.CriteriaTP) NEQ '')>
		          and fn_fk_tp_key = #Trim(url.CriteriaTP)# 
	          </cfif>
  order by fn_yyyymmdd DESC
</CFQUERY>		
	
<cfset ws_total = 0>	
<cfset ws_monto = 0>
<cfset ws_deuda = 0>
<cfset ws_tot_deuda = 0>
<cfset ws_c1 = "darkslateblue">	
<cfset ws_c2 = "white">		
<table id="tabla" class="table table-striped table-bordered" style="width:100%">
        <thead>
			<tr>  
			<td> <a href="addTrans.cfm" class='btn btn-outline-dark mb-2'> <i class="bi bi-person-plus"></i> Add </a></td> 
			<td><h2>Transacciones</h2></td>	
			<td colspan="3">
               <a>
		          <form action="Listar_Transacciones.cfm">By Date: 
			           <input type="date" name="fecha_in" size="4">
			           <input type="date" name="fecha_out" size="4">
					   <input type="text" name="tienda" autocomplete="on" placeholder="Tienda">
			           <input type="submit" value="Submit">
		          </form>
			   </a>
			 <a href="Finanzas.cfm">Finanzas</a>&nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="Reportes.cfm">Reportes</a>
            </td> 	
			<td>	
				    <cfform name="disp" method="post" action="Listar_Transacciones.cfm">
					<cfselect input name="CriteriaCat" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">	 
		             <cfoutput>   
				       <option value="">Categories</option>
			             <cfloop query="GetCat"> 
					       <option value="Listar_Transacciones.cfm?CriteriaCat=#GetCat.cat_key#">#GetCat.cat_desc#</option>
	                     </cfloop>
				     </cfoutput>  	  
                    </cfselect>	
					</cfform>	
			</td>	
				
			<td>	
				    <cfform name="tpp" method="post" action="Listar_Transacciones.cfm">
					<cfselect input name="CriteriaTP" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">	 
		             <cfoutput>   
				       <option value="">Tipo Pagos</option>
			             <cfloop query="GetTP"> 
					       <option value="Listar_Transacciones.cfm?CriteriaTP=#GetTP.tp_key#">#GetTP.tp_desc#</option>
	                     </cfloop>
				     </cfoutput>  	  
                    </cfselect>	
					</cfform>	
			</td>				
				
			</tr>
            <tr>
				<cfoutput>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Fecha</a></th>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Tienda</a></th>
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Monto</a></th>
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Deuda</a></th>
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Tipo Pago</a></th>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Categoria</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Edit</a></th> 
				</cfoutput>	
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
				<td> <a href="updateTrans.cfm?url_fn_key=#GetTrans.fn_key#" class="btn btn-secondary"><i class='bi bi-pencil'></i> EDIT</a> </td> 
            </tr> 
					
		</cfoutput>
		</cfloop>
        </tbody>
        <tfoot>
            <tr>
				<cfoutput>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Fecha</a></th>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Tienda</a></th>
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Monto</a></th>
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Deuda</a></th>
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Tipo Pago</a></th>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Categoria</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Edit</a></th> 
				</cfoutput>	
            </tr>
        </tfoot>
		<tr>
			<td align="right" colspan="2"> <a style="color: green"><strong>Totales ==></strong></a></td>
		    <td align="right"><cfoutput><a style="color: green"><strong>#numberFormat(ws_total,'_$,9.99')#</strong></a></cfoutput></td>
		    <td align="right"><cfoutput><a style="color: red"><strong>#numberFormat(ws_tot_deuda,'_$,9.99')#</strong></a></cfoutput></td>
			<td colspan="3"></td>
		</tr>
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
