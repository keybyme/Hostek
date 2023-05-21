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
  
<cfset GetCat.RecordCount=0>
<cfquery name="GetCat" datasource="wolffdb_dsn">
	  Select *
		From FN_Categorias
		Where cat_fk_user_key = #SESSION.Auth.user_key#
	    and cat_key = <cfqueryparam value="#URL.url_fn_key#" cfsqltype="cf_sql_numeric"> 
		order by cat_desc
</cfquery>		
	
<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_updcat.cfm">
	<cfoutput>
        <input type="hidden" name="cat_key" value="#GetCat.cat_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    

      <tr>
     	<td>Categoria: </td>
        <td><cfinput name="cat_desc" value="#GetCat.cat_desc#"></td>    
     </tr>
 	 
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
		
    </tr>   				
</table>
</cfoutput> 
</cfform> 
	  

</body>
</html>
