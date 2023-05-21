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

<cfset ws_c1 = "darkslateblue">	
<cfset ws_c2 = "white">	

<CFSET GetPago.RecordCount=0>
<CFQUERY NAME="GetPago" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  FN_Tipo_Pagos  
        Where #SESSION.Auth.user_key# = tp_fk_user_key   
  order by tp_desc
</CFQUERY>		
	
<table id="tabla" class="table table-striped table-bordered" style="width:100%">
        <thead>
			<tr>
			<td> <a href="addTP.cfm" class='btn btn-outline-dark mb-2'> <i class="bi bi-person-plus"></i> Add Tipo Pago</a></td>
			<td colspan="2"><h2>Tipos de Pago</h2></td>	
			<td><a href="Finanzas.cfm">Finanzas</a></td>	
			</tr>
            <tr>
			<cfoutput>	
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#"><p align="center">Descripccion</p></a></th>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#"><p align="center">Balance</p></a></th>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#"><p align="center">Limite</p></a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#"><p align="center">Edit</p></a></th>
			</cfoutput>
            </tr>
        </thead>
        <tbody>
		
		<cfset ws_tot = 0>	
		<cfset ws_monto = 0>	
	   <cfloop query="GetPago"> 
			 
            <CFQUERY NAME="GetTrans" datasource="wolffdb_dsn">
                SELECT  *                  
                FROM  FN_Transacciones  
                Where fn_fk_tp_key = #TRIM(GetPago.tp_key)# 
				order by fn_fk_tp_key 
            </CFQUERY>	
				
		<cfloop query="GetTrans"> 
		   <cfoutput> 			
	        <cfif #TRIM(GetTrans.fn_status)# EQ 1>
				<cfset ws_monto = #TRIM(GetTrans.fn_monto)#>
			    <cfset ws_tot = ws_tot + ws_monto>   
		    </cfif>
	      </cfoutput>	
	    </cfloop>
			   
		  
        <cfoutput> 
		
            <tr>
				<cfif #TRIM(GetPago.tp_link)# NEQ "">
                      <td><a href="#TRIM(GetPago.tp_link)#" target="_blank">#TRIM(GetPago.tp_desc)#</a></td>
				<cfelse>	
					  <td>#TRIM(GetPago.tp_desc)#</td>
				</cfif>	
				<cfif #ws_tot# GT 0>	
                      <td align="right">#numberFormat(ws_tot,'_$,9.99')#</td> 
				<cfelse>
					  <td></td>
				</cfif>	
                <td align="right">#numberFormat(GetPago.tp_limite,'_$,9.99')#</td> 
				<td> <a href="updateTipo.cfm?url_fn_key=#GetPago.tp_key#" class="btn btn-secondary"><i class='bi bi-pencil'></i> EDIT</a> </td>
            </tr>
          <cfset ws_tot = 0>	
		  <cfset ws_monto = 0>	
			  
		</cfoutput>
		</cfloop>
        </tbody>
        <tfoot>
            <tr>
			<cfoutput>	
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#"><p align="center">Descripccion</p></a></th>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#"><p align="center">Balance</p></a></th>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#"><p align="center">Limite</p></a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#"><p align="center">Edit</p></a></th> 
			</cfoutput>
            </tr>
        </tfoot>
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
