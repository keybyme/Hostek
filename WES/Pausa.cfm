<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="../my.css">

</head>
<body>
<cfset w_ft= 0>  
<cfparam name="url.ft" default=""> 
<cfset w_ft = url.ft>  
  
<cfset w_sizeU=0>
<cfparam name="url.sizeU" default="">
<cfset w_sizeU = url.sizeU>    
    
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-8 text-left"> 
  
<CFSET GetFoto.RecordCount=0>
<CFQUERY NAME="GetFoto" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  Fotos
   where   foto_key = #w_ft#
</CFQUERY>
    <div align="center">
        
         <cfset ws_link = "https://www.keybyme.com/Fotos/Wolff/"> 
<cfoutput>
   
<cfif GetFoto.RecordCount neq 0>    
  <cfset ws_foto = "#ws_link##GetFoto.foto_pic#">
  <a href="#ws_foto#" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>GET THE LINK</strong></a>     
  <a href="#ws_foto#" download target="_blank">&nbsp;&nbsp;&nbsp;<strong>DOWNLOAD</strong>
      <a href="SlideShow.cfm">&nbsp;&nbsp;&nbsp;&nbsp;<strong>END PAUSE</strong></a> <br> 
  <img class="img-responsive" src="https://www.keybyme.com/Fotos/Wolff/#GetFoto.foto_pic#" alt="Chania">     
</cfif>    
</cfoutput>  
    </div>    
    </div>
    </div>
    </div>    
     
</body>
</html>
