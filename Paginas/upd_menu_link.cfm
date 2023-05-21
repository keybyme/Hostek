<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>KeyByMe</title>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script> 
</head>
<body> 
	<cfinclude template="menu.cfm"></cfinclude>
  
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
       
		
		
      <p>
		<div>
  
<CFSET GetLink.RecordCount=0>
<cfquery name = "GetLink" dataSource = "wolffdb_dsn">
    Select *
    From DB_Links 
    Where dl_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>			
        
	
<cfparam name="url.action" default="">
       
<cfform name="edit" method="post" action="act_upd_menu_link.cfm" >
	<cfoutput>
        <input type="hidden" name="dl_key" value="#GetLink.dl_key#">	
    </cfoutput>
	<br>
    
     <h2 align="center"><small>Update</small> 
    <p style="color:blue;"><cfoutput>#GetLink.dl_link_desc#</cfoutput></p></h2><br>
    
<table align="center" border="3" bordercolor="#B40707">
<cfoutput>    
  
      <tr>
     	<th>dl_link_desc: </th>
        <td><cfinput name="dl_link_desc" value="#GetLink.dl_link_desc#" size="150"></td>    
     </tr>
   
    <tr>
        <th>dl_link:</th>
        <td><cfinput name="dl_link" value="#GetLink.dl_link#" size="150"></td>
    </tr>
   
    <tr>
       	<td colspan="2" align="center"><input type="submit" name="editemp" value="Update"   style="background-color: aqua"></td>
		
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
