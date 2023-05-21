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
	
  
<div class="container-fluid text-center">    
  <div class="row content">
 
	  
    <div class="col-sm-8 text-left"> 
       
  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
		
      <p>
		<div>
  
  
	<cfset GetCat.RecordCount=0>
	<cfquery name="GetCat" datasource="wolffdb_dsn">
	  Select *
		From DB_Links_Cat
		Where lc_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
	</cfquery>
	<cfset xCategoria = 0>	
		       

<cfform name="edit" method="post" action="act_upd_cat_link.cfm">
	<cfoutput>
        <input type="hidden" name="lc_key" value="#GetCat.lc_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    
 
      <tr>
     	<td>Category: </td>
        <td><cfinput name="lc_cat_desc" value="#GetCat.lc_cat_desc#" size="80"></td>    
     </tr>
         
    
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
		
    </tr>   				
</table>
</cfoutput> 
</cfform>
</div>
	
	   
    </div> 
  </div>
</div>
	 
</body>
</html>
