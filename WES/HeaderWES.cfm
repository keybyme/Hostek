<!DOCTYPE html>
<html lang="en">
<head>
  <title>Mercy Solis</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
	 <link rel="stylesheet" type="text/css" href="../LuzyVida/my.css">
</head>
<body>
<img src="../image/Wes_Network.gif" width="60" height="60" alt=""/><br>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="logoutWES.cfm">Home</a></li>
		   <cfif  (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
               
               <li><a href="">M1</a></li>
               <li><a href="">M2</a></li>
			   <!---<cfif '#TRIM(SESSION.Auth.user_roll)#' GT 50>
			        <li><a href="../Mercy/FotosME.cfm">Fotos</a></li>
			   </cfif>	--->   
			   
	       </cfif>	
		<li><a href="logoutWES.cfm">Log out</a></li>
			
      </ul>
      
    </div>
  </div>
</nav>
  
</body>
</html>
