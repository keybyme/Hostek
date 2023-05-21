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
	
<CFSET GetCat.RecordCount=0>
<CFQUERY NAME="GetCat" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  FN_Categorias  
        Where #SESSION.Auth.user_key# = cat_fk_user_key   
  order by cat_desc
</CFQUERY>		
	
<table id="tabla" class="table table-striped table-bordered" style="width:100%">
        <thead>
			<tr>
			<td> <a href="addCat.cfm" class='btn btn-outline-dark mb-2'> <i class="bi bi-person-plus"></i> Add Categoria</a></td>
			<td colspan="2"><h2>Categorias</h2></td>	
			<td><a href="Finanzas.cfm">Finanzas</a></td>	
			</tr>
            <tr>
				<cfoutput>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Categoria</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Edit</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#"></a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#"></a></th> 	
				</cfoutput>	
            </tr>
        </thead>
        <tbody>
		  
				
		<cfloop query="GetCat"> 
		  
        <cfoutput>  
            <tr> 
			    <td>#TRIM(GetCat.cat_desc)#</td>  
				<td> <a href="updateCat.cfm?url_fn_key=#GetCat.cat_key#" class="btn btn-secondary"><i class='bi bi-pencil'></i> EDIT</a> </td>
            </tr> 
			  
		</cfoutput>
		</cfloop>
        </tbody>
        <tfoot>
            <tr>
				<cfoutput>
                <th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Categoria</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#">Edit</a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#"></a></th> 
				<th style="background-color: #ws_c1#"><a style="color: #ws_c2#"></a></th> 	
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
