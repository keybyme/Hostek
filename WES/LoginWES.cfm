<!DOCTYPE html>
<html lang="en">
<head>
  <title>Wesnetwork, LLC</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="../LuzyVida/my.css">
	
</head>
<body>

	<cfinclude template="HeaderWES.cfm"></cfinclude>
  
<div class="container-fluid text-center">    
  <div class="row content">

	 <cfinclude template="LadoIzqWES.cfm"></cfinclude> 
	  
    <div class="col-sm-8 text-left"> 
      <h1>Login</h1>
      <p>
	<div>	
  <!---Contenido--->
   
<cfparam name="url.action" default="">
<cfif url.action eq 2>
   <cfset url.action="">
   
   <font color="red">Wrong Username/Password</font>

</cfif> 
		
     <cfform name="LoginUser" method="post" action="LoginCheckWES.cfm">
      
		<table>
			<tr>
				<td>
		   <p>Username</p></td>
		   <td>
                  <!--- Text field for "User Name" --->  
                  <CFINPUT 
                  TYPE="Text"
                  NAME="UserLogin"
                  height="1"
                  SIZE="10"
                  VALUE=""
                  MAXLENGTH="100"
                  REQUIRED="Yes"
                  MESSAGE="Please, Enter username.">
         </td>
			   </tr>
			<tr>
				<td>
		   <p>Password</p></td>
		   <td>
                  <!--- Text field for "User Name" --->  
                  <CFINPUT 
                  TYPE="Password"
                  NAME="UserPassword"
                  height="1"
                  SIZE="10"
                  VALUE=""
                  MAXLENGTH="100"
                  REQUIRED="Yes"
                  MESSAGE="Please enter Password.">
         </td>
			   </tr>
			
			    <tr><td>
		     <input type="Submit" value="Log in">
				   
             <!---<a href="../LuzyVida/logout.cfm">Log out</a>--->
		      </td>
				</tr>
	</table>     
   


</cfform>			
		  
  <!---End Contenido	--->		
</div>
	  </p>
     
    </div>
   <cfinclude template="propagandaWES.cfm"></cfinclude>
  </div>
</div>
	
	<cfinclude template="footerWES.cfm"></cfinclude>

</body>
</html>
