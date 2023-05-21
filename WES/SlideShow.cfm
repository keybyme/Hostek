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
     <script type = "text/JavaScript">
        
            function AutoRefresh( t ) {
               setTimeout("location.reload(true);", t);
            }
         
      </script>
</head>
<body onload = "JavaScript:AutoRefresh(7000);">
  <!--- <cfinclude template="HeaderFotos.cfm"></cfinclude>--->
<body>
  
    
<div class="container-fluid text-center" align="center">    
  <div class="row content" align="center">
    <div class="col-sm-8 text-left" align="center"> 
        
    <cfset foto_random = 0>
   <CFQUERY NAME="GetPic" datasource="wolffdb_dsn"> 
   SELECT * FROM Fotos WHERE foto_random=(SELECT max(foto_random) FROM Fotos)
   </cfquery>   
   <cfloop query="GetPic">    
     <cfoutput>   
      <cfset ws_random = RandRange(1, foto_random)>
     </cfoutput>         
   </cfloop>           
        
        
<CFSET GetFoto.RecordCount=0>
<CFQUERY NAME="GetFoto" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  Fotos
   where   foto_random = #ws_random#
</CFQUERY>
    <div align="center">
        
         <cfset ws_link = "https://www.keybyme.com/Fotos/Wolff/"> 
<cfoutput>
<cfif GetFoto.RecordCount neq 0>    
  <cfset ws_foto = "#ws_link##GetFoto.foto_pic#">
  <a href="#ws_foto#" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>GET THE LINK     </strong></a>     
  <a href="#ws_foto#" download target="_blank">&nbsp;&nbsp;&nbsp;<strong>DOWNLOAD</strong></a> 
      <a href="Pausa.cfm?ft=#GetFoto.foto_key#&sizeU=60">&nbsp;&nbsp;&nbsp;&nbsp;<strong>PAUSE</strong></a><br>
  <img class="img-responsive" src="https://www.keybyme.com/Fotos/Wolff/#GetFoto.foto_pic#" width="75%" alt="Chania">     
</cfif>    
</cfoutput>  
    </div>    
    </div>
    </div>
    </div>    
     
</body>
</html>
