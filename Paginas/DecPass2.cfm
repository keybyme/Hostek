<!DOCTYPE html>
<html lang="en">
<head>
  <title>KeyByMe.com</title>
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
      <h1>Encrypt Password</h1>
      <p>
	<div>	
  <!---Contenido--->
   

	 
<CFPARAM NAME="Form.Palabra" TYPE="string">
<CFPARAM NAME="Form.Llave" TYPE="string">

<cfoutput>
    <cfset manCrush = '#Form.Palabra#' />
    <cfset encryptionKey = '#Form.Llave#'/>
    <cfset secret = decrypt(
           manCrush,
           encryptionKey,
           "AES",
           "hex"
           ) />    
      
   Palabra= #Form.Palabra# <br>
   Llave = #Form.Llave#  <br>
   Descriptada =  #secret#
		   
  </cfoutput>      
		  
  <!---End Contenido	--->		
</div>
	  </p>
      
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
  
  </div>
</div>
	
 

</body>
</html>
