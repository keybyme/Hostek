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
  
<cfset GetTP.RecordCount=0>
<cfquery name="GetTP" datasource="wolffdb_dsn">
	  Select *
		From FN_Tipo_Pagos
		Where tp_fk_user_key = #SESSION.Auth.user_key#
	    and tp_key = <cfqueryparam value="#URL.url_fn_key#" cfsqltype="cf_sql_numeric"> 
		order by tp_desc
</cfquery>		
	
<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_upd_Tipo.cfm">
	<cfoutput>
        <input type="hidden" name="tp_key" value="#GetTP.tp_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    

      <tr>
     	<td>Descripccion: </td>
        <td><cfinput name="tp_desc" value="#GetTp.tp_desc#"></td>    
     </tr>
 	 
    <tr>
        <td>Limite: </td>
        <td><cfinput name="tp_limite" value="#GetTp.tp_limite#" size="50"></td>
    </tr>    
    <tr>
        <td>URL:</td>
        <td><cfinput name="tp_link" value="#GetTp.tp_link#" size="150"></td>
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
