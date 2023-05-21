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
  
<CFSET GetUser.RecordCount=0>
<cfquery name = "GetUser" dataSource = "wolffdb_dsn">
    Select *
    From Contactos
    Where cl_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>			
        
<cfparam name="url.action" default="">
	
<cfquery name="GetCarrier" datasource="wolffdb_dsn">
 Select *
 From Carriers 
</cfquery>		
	
<cfform name="edit" method="post" action="act_upd_contactos.cfm">
    <h2 align="center">Update Contact</h2><br>
	<cfoutput>
        <input type="hidden" name="cl_id_key" value="#GetUser.cl_id_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    
  
      <tr>
     	<td>cl_nombre: </td>
        <td><cfinput name="cl_nombre" value="#GetUser.cl_nombre#" size="80"></td>    
     </tr>
        
    <tr>
        <td>cl_apellido: </td>
        <td><cfinput name="cl_apellido" value="#GetUser.cl_apellido#" size="80"></td>
    </tr>

	<tr>
        <td>cl_email:</td>
        <td><cfinput name="cl_email" value="#GetUser.cl_email#" size="50"></td>
    </tr>

	<tr>
        <td>cl_address:</td>
        <td><cfinput name="cl_address" value="#GetUser.cl_address#" size="80"></td>
    </tr>
	
    <tr>
	    <td>cl_phone:</td>
		<td><cfinput name="cl_phone" value="#GetUser.cl_phone#" size="50"></td>
	</tr> 
    
	<tr>
	    <td>cl_celular:</td>
		<td><cfinput name="cl_celular" value="#GetUser.cl_celular#" size="50"></td>
	</tr>   
	
    <tr>
        <td>Carrier: </td>
        <td> 
			
        <select name="cl_carrier" size="1">
		   <cfloop query="GetCarrier"> 
			    <cfoutput>
					<cfif #Trim(GetUser.cl_carrier)# EQ #Trim(GetCarrier.ca_key)#>
		               <option value="#GetCarrier.ca_key#" selected> 
		                      #GetCarrier.ca_company#
	                   </option>
			        <cfelse>
					   <option value="#GetCarrier.ca_key#"> 
		                      #GetCarrier.ca_company#
	                   </option>	
					</cfif>	
				 </cfoutput>	 
		   </cfloop> 
	
        </select>			
		</td>	
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
