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
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
<div class="container-fluid text-center">    
  <div class="row content">
 
    <div class="col-sm-8 text-left"> 
       
      <p>
		<div>
  
<CFSET GetRem.RecordCount=0>
<cfquery name = "GetRem" dataSource = "wolffdb_dsn">
    Select *
    From Reminders 
	Where #SESSION.Auth.user_key# = re_fk_user_key
    and re_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>			
			
       
	
<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_upd_reminders.cfm">
	<cfoutput>
        <input type="hidden" name="re_key" value="#GetRem.re_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    

      <tr>
     	<td>Reminder: </td>
        <td><cfinput name="re_desc" value="#GetRem.re_desc#" size="80"></td>    
     </tr>
      <tr>
     	<td>From: </td>
        <td><cfinput name="re_from" value="#GetRem.re_from#" size="80"></td>    
     </tr>	
         
    <tr>
        <td>Date_start: </td>
        <td><cfinput name="re_fecha_start" value="#GetRem.re_fecha_start#" size="50"></td>
    </tr>
    <tr>
        <td>Date_end: </td>
        <td><cfinput name="re_fecha_end" value="#GetRem.re_fecha_end#" size="50"></td>
    </tr>    
    <tr>
        <td>Time:</td>
        <td><cfinput name="re_hora" value="#GetRem.re_hora#" size="50"></td>
    </tr>
 
	<tr>
        <td>Email:</td>
        <td><cfinput name="re_email" value="#GetRem.re_email#" size="50"></td>
    </tr>
	
	<tr>
        <td>Message:</td>
        <td><cfinput name="re_message" value="#GetRem.re_message#" size="150"></td>
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
