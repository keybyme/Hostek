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
   
<CFSET GetTransacciones.RecordCount=0>
<cfquery name = "GetTransacciones" dataSource = "wolffdb_dsn">
    Select *   
    From Reminders
    Where re_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>


<cfparam name="url.action" default="">

<form name="edit" method="post" action="act_del_reminder.cfm">
	
<cfoutput>
<table align="center">
    <input type="hidden" name="re_key" value="#GetTransacciones.re_key#">	
          <tr>
     	<td>Reminder: </td>
        <td>   
        <input 
         type="text" 
         name="re_desc" 
         value="#GetTransacciones.re_desc#"
         size="100">
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
