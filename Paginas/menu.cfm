<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

<div id="mySidenav" class="sidenav">
<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    	<cflocation url="https://www.keybyme.com">
</cfif> 
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="ListarUserLinks.cfm" style="color: yellow">Home</a>
  <cfif SESSION.Auth.user_role GT 98>
    <a href="DBLinks.cfm" style="color: yellow">Admin Links</a>
	<a href="ListarUserLinks.cfm" style="color: yellow">User/Links</a> 
  <a href="https://www.keybyme.com/chess/chess.html" style="color: yellow">Chess</a>
  <a href="https://www.youtube.com/watch?v=Yk4ens6PKks&t=653s" style="color: yellow">Chess2</a>
	<a href="Finanzas.cfm" style="color: yellow">Finanzas</a> 
  
	<a href="EncPass.cfm" style="color: yellow">Enc Pass</a>  
	<a href="DecPass.cfm" style="color: yellow">Dec Pass</a>    
	<a href="../LF/index.cfm" style="color: yellow">L.F. JENNINGS</a>  
  </cfif>	  

  <a href="GPS.cfm" style="color: yellow">GPS</a>	  
  <a href="DBLinks.cfm?CriteriaCat=4" style="color: yellow">Search Engines</a>	
  <cfif SESSION.Auth.user_role GT 70> 	
     
	  <a href="../LuzyVida/index.cfm" style="color: yellow">Luz y Vida</a>  
    <a href="../Web_Radio/index.cfm" style="color: yellow">Radio</a>  
	  <a href="Reminders.cfm" style="color: yellow">Reminders</a>
	  <a href="SendReminders.cfm" style="color: yellow">Send Reminders</a>
  </cfif>	
  <a href="logout.cfm" style="color: yellow">Log out</a>
 	 
</div>

<div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Men&uacute;</span>
</div>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "200px";
  document.getElementById("main").style.marginLeft = "200px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}
</script>
   
</body>
</html> 
