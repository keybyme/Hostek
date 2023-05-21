<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>KeyByMe</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <div>
    <cfinclude template="HeaderFotos.cfm"></cfinclude>
    </div> 
    
<div align="center">	
	<br>
<!---      <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	             <cflocation url="LoginKB.cfm"> 
               <cfabort>
          </cfif> --->
<br>
 <!---<cfset ws_random = RandRange(0001, 9999)>--->
    
<cfset w_foto= 0>  
<cfparam name="url.claveU" default=""> 
<cfset w_foto = url.claveU>  
    
<cfset w_catU= 0>  
<cfparam name="url.catU" default=""> 
<cfset w_catU = url.catU>      
    
 <cfoutput>  

w_catU #w_catU#   w_foto  #w_foto#
     
<CFSET GetFoto.RecordCount=0>
<CFQUERY NAME="GetFoto" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM Fotos
  where foto_key = #w_foto#
</CFQUERY>      
    
</cfoutput>   
     
   <cfquery name="editemp" datasource="wolffdb_dsn"> 

UPDATE Fotos
SET        foto_type   = '#w_catU#'  
WHERE 
        foto_key = #w_foto#       
</cfquery>
     
<cflocation url="https://www.keybyme.com/WES/ListarImagenes.cfm?CriteriaCat=22"></cflocation>     
 </div>  
</body>
</html>	
