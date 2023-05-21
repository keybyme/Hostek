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
	 
<CFSET GetInc.RecordCount=0>
<CFQUERY NAME="GetInc" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  FN_Income inner join FN_Cat_Income on
	    i_from = ci_key
        Where #SESSION.Auth.user_key# = i_fk_user_key  
	          <cfif isDefined('url.fecha_in') AND TRIM(url.fecha_in) NEQ ''>
				  <cfif isDefined('url.fecha_out') AND TRIM(url.fecha_out) NEQ ''>
				      and i_fecha between '#url.fecha_in#' and '#url.fecha_out#'
			      </cfif>		  
			  </cfif>	  
	          <cfif (isDefined('url.CriteriaCat') AND TRIM(url.CriteriaCat) NEQ '')>
		          and i_from = #Trim(url.CriteriaCat)# 
	          </cfif>
		 
  order by i_fecha desc
</CFQUERY>		
	
<cfset ws_total = 0>	
<cfset ws_monto = 0>
<cfset ws_c1 = "darkslateblue">	
<cfset ws_c2 = "white">		
<table id="tabla" class="table table-striped table-bordered" style="width:100%">
        <thead>
			<tr>  
			<td> <a href="addIncome.cfm" class='btn btn-outline-dark mb-2'> <i class="bi bi-person-plus"></i> Add </a></td> 
			<td><h2>Income</h2></td>	
			<td colspan="3">
               <a>
		          <form action="Income.cfm">By Date: 
			           <input type="date" name="fecha_in" size="4">
			           <input type="date" name="fecha_out" size="4">
			           <input type="submit" value="Submit">
		          </form>
			   </a>
			 <a href="Finanzas.cfm">Finanzas</a>&nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="Reportes.cfm">Reportes</a>	
            </td> 	
			<td>	
				    <cfform name="disp" method="post" action="Income.cfm">
					<cfselect input name="CriteriaCat" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">	 
		             <cfoutput>   
				       <option value="">Categories</option>
					   <option value="Income.cfm?CriteriaCat=1">Dad</option>	
					   <option value="Income.cfm?CriteriaCat=2">Mom</option>	 
			           <option value="Income.cfm?CriteriaCat=3">Refund</option>	
					   <option value="Income.cfm?CriteriaCat=4">Retirement</option>
					   <option value="Income.cfm?CriteriaCat=5">Alita</option>	
					   <option value="Income.cfm?CriteriaCat=6">Other</option>
				     </cfoutput>  	  
                    </cfselect>	
					</cfform>	
			</td>	
 
			</tr>
            <tr>
				<cfoutput>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Fecha</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Monto</a></th>  
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">From</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Edit</a></th> 
				<th style="background-color: #ws_c1#"></th>	
				<th style="background-color: #ws_c1#"></th>
				<th style="background-color: #ws_c1#"></th>	
				</cfoutput>	
            </tr>
        </thead>
        <tbody>
			
		<cfloop query="GetInc">   
        <cfoutput> 		
			
			<tr>
			    <cfset ws_fecha = #TRIM(GetInc.i_fecha)#>  
			    <cfset ws_date = #DateFormat(DateAdd('d', 0, ws_fecha),'yy/mm/dd')#>  
			    <cfset ws_date_f = #DateFormat(DateAdd('d', 0, ws_date),'mm/dd/yy')#>  
				<cfset ws_monto = #TRIM(GetInc.i_monto)#>
			    <cfset ws_total = ws_total + ws_monto>	
            
                <td>#ws_date_f#</td> 
				<td align="right">#numberFormat(ws_monto,'_$,9.99')#</td> 	 
				<td>#TRIM(GetInc.ci_desc)#</td> 
				<td> <a href="updateIncome.cfm?url_i_key=#GetInc.i_key#" class="btn btn-secondary"><i class='bi bi-pencil'></i> EDIT</a> </td> 
				<td></td>	
				<td></td>
				<td></td>	
            </tr> 
					
		</cfoutput>
		</cfloop>
        </tbody>
        <tfoot>
            <tr>
				<cfoutput>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Fecha</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Monto</a></th>  
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">From</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Edit</a></th> 
				<th style="background-color: #ws_c1#"></th>	
				<th style="background-color: #ws_c1#"></th>
				<th style="background-color: #ws_c1#"></th>		
				</cfoutput>	
            </tr>
        </tfoot>
		<tr>
			
			<td align="right"> <a style="color: green"><strong>Totales ==></strong></a></td>
		    <td align="right"><cfoutput><a style="color: green"><strong>#numberFormat(ws_total,'_$,9.99')#</strong></a></cfoutput></td>
			<td colspan="5"></td>
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
