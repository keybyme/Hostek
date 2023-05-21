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
   
<CFSET GetLinks.RecordCount=0>
<cfquery name = "GetLinks" dataSource = "wolffdb_dsn">
    Select *   
    From User_Links inner join DB_Links on
	     me_fk_dl_key = dl_key
    Where #SESSION.Auth.user_key# =  me_fk_user_key  and
	me_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>


<cfparam name="url.action" default="">

<form name="edit" method="post" action="act_del_user_link.cfm">
	  <h2 align="center">Delete User/Link</h2><br>
<cfoutput>
<table align="center">
    <input type="hidden" name="me_key" value="#GetLinks.me_key#">	
          <tr>
     	<td>Link: </td>
        <td>   
        <input 
         type="text" 
         name="dl_link_desc" 
         value="#GetLinks.dl_link_desc#"
         size="300">
        </td>    
     </tr>
          
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Delete"></td>
    </tr>   				
</table>
</cfoutput>
</form>

</div>
	  </p>
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
 
  </div>
</div>
	
	

</body>
</html>
