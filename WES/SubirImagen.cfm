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
    
<cfset w_cat= 0>  
<cfparam name="url.ws_cat" default=""> 
<cfset w_cat = url.ws_cat>  
    
 <cfoutput>  
<CFSET GetCat.RecordCount=0>
<CFQUERY NAME="GetCat" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM Foto_Cat
  where cat_key = #w_cat#
</CFQUERY>    
    #GetCat.cat_desc#</cfoutput>
    
    
    <cfset ws_archivo = "">
<cfparam name="form.fileUpload" default="">

<cfif len(trim(form.fileUpload))>
  <cfoutput>
  <cffile action="upload"
     fileField="fileUpload" nameconflict="MAKEUNIQUE"
      destination="D:\home\Keybyme.com\wwwroot\Fotos\Wolff">
   <cfset ws_link = "https://www.keybyme.com/Fotos/Wolff/">   
  <p>      
    
   You Uploaded #cffile.ClientFileName#.#cffile.ClientFileExt#
      successfully to #cffile.ServerDirectory#.</p>
    <a href="#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#"  target="_blank">#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#</a>   <br>
       <cfset ws_copiar = "#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#">
       <cfset ws_archivo = "#cffile.ClientFileName#.#cffile.ClientFileExt#">        
<!---===================================     --->  

<input type="text" value= "#ws_copiar#" id="myInput" size="70">
<button onclick="myFunction()">Copy Link</button>

<script>
function myFunction() {
  var copyText = document.getElementById("myInput");
  copyText.select();
  copyText.setSelectionRange(0, 99999)
  document.execCommand("copy");
  alert("Copied the text: " + copyText.value);
}
</script>
<!--- ======================================   --->   
    <cfset foto_random = 0>
   <CFQUERY NAME="GetFoto" datasource="wolffdb_dsn"> 
   SELECT * FROM Fotos WHERE foto_random=(SELECT max(foto_random) FROM Fotos)
   </cfquery>   
   <cfloop query="GetFoto">        
      <cfset foto_random = foto_random + 1>
   </cfloop>          
  </cfoutput>      
         
 <cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO Fotos   (foto_type,
                          foto_pic,
                          foto_random)
       VALUES(#w_cat#, '#ws_archivo#', #foto_random#)
                     
 </cfquery>        
</cfif>

<form enctype="multipart/form-data" method="post">
  <input type="file" name="fileUpload" /><br />
  <input type="submit" value="Upload File" />
</form> 
      
</div>	
   
</body>
</html>	
