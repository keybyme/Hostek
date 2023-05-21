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
      
      <p>
		<div>
 
          <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
<!---======================================================--->  					
<cfset GetUser.RecordCount=0>
<cfquery name="GetUser" datasource="wolffdb_dsn">
	  Select *
		From Usuarios
        order by user_name
</cfquery>   
         
<!---======================================================--->  	
<cfset GetLink.RecordCount=0>
<cfquery name="GetLink" datasource="wolffdb_dsn">
	  Select *
		From DB_Links
        order by dl_link_desc
</cfquery>   
         	
<!---======================================================--->  	 

<cfform name="aghno" method="post" action="dsp_user_link.cfm">
<h2 align="center">Add User/Link</h2><br>
<table align="center" border="0">

     <tr>
         <td>User:</td>
         <td>
        	<select name="user_key" size="1">
				<option value="0" selected>Users</option>
		   		<cfloop query="GetUser"> 
			    	<cfoutput>  
		            	<option value="#GetUser.user_key#"> 
		                	#GetUser.User_name#
						</option> 	 
				    </cfoutput>	 
		        </cfloop> 
           </select>        
         </td>     
     </tr>     
     <tr>
         <td>Link:</td>
         <td>
        	<select name="dl_key" size="1">
				<option value="0" selected>Links</option>	
		   		<cfloop query="GetLink"> 
			    	<cfoutput>  
		            <option value="#GetLink.dl_key#"> 
		                #GetLink.dl_link_desc#
	                </option> 
				    </cfoutput>	 
		        </cfloop> 
           </select>        
         </td>      
     </tr>
 
	
     <tr>
     	<td colspan="3">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <cfinput type="submit" name="enviar" value="Send">&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <cfinput type="reset" name="reset" value="Clear">
        </td>
     </tr>   	                                            
</table>     
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
