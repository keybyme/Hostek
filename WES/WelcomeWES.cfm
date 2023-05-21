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
	
	 <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="index.cfm">
          </cfif>
	
  
<div class="container-fluid text-center">    
  <div class="row content">
   
	  <cfinclude template="LadoIzqWES.cfm"></cfinclude>
	  
    <div class="col-sm-8 text-left"> 
      <h1>Bienvenidos</h1>
      <p>
		<div>
   <!---contenido --->
	
	<div>
		<p align="justify">
		  Welcome
		</p>
		            
		<cfif '#TRIM(SESSION.Auth.user_role)#' GT 98>
			
		    <p> <h3>Administrator area</h3></p>
		    <ul>
		    <li><a href="https://www.keybyme.com/keybyme/welcomeKB.cfm" target="_blank">KeyByMe Admin</a></li>
			<li>
			 <a href="https://www.keybyme.com/Keybyme/Altapro/welcome.cfm">Altapro</a>	
			</li>	
			</ul>
		<cfelseif '#TRIM(SESSION.Auth.user_role)#' EQ 55>
			<cflocation url="https://www.keybyme.com/Keybyme/Altapro/welcome.cfm"></cflocation>
			  
		<cfelseif '#TRIM(SESSION.Auth.user_role)#' GT 89>
			  <p> roll mayor que 89
			 </p>	
		<cfelse>
			  <p> roll menor que 90
			 </p>	
		</cfif>	
		
		
	</div>
			
   <!---End contenido	--->	
			
</div>
	  </p>
      
      <!---<h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
<cfinclude template="propagandaWES.cfm"></cfinclude>
  </div>
</div>

<cfinclude template="footerWES.cfm"></cfinclude>

</body>
</html>
