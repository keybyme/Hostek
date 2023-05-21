<!DOCTYPE html>
<html lang="en">
<head>
  <title>KeyByMe.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!---  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--->
 
	 <link rel="stylesheet" type="text/css" href="my.css">
</head>
<body>
<!--- <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="LoginKB.cfm">
          </cfif>---> 
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="https://www.keybyme.com/welcomeKB.cfm"><img src="https://www.keybyme.com/image/Keybyme_logo5.gif" width="62" height="21" alt=""/></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
 
      <ul class="nav navbar-nav navbar-right">
        <li><a href="SlideShow.cfm">Photo Slide</a></li>  
        <li><a href="ListarImagenes.cfm?sizeU=40">40%</a></li>
        <li><a href="ListarImagenes.cfm?sizeU=60">60%</a></li>  
        <li><a href="ListarImagenes.cfm?sizeU=80">80%</a></li>
        <li><a href="ListarImagenes.cfm?sizeU=100">100%</a></li>   
           <cfif (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
               <li><a href="Subir.cfm">Upload Pics</a></li>
               <li><a href="https://www.keybyme.com/WES/SubirImagen.cfm?ws_cat=22">Subir Bulk</a></li>
               <li><a href="https://www.keybyme.com/WES/ReplaceFoto.cfm">Replace Foto</a></li>
               <li><a href="AddEdit.cfm">Add/Edit Folder</a></li>
               <li><a href="https://www.keybyme.com/welcomeKB.cfm">Back to menu</a></li>
           </cfif>  
      </ul>
    </div>
  </div>
</nav>
  
</body>
</html>
