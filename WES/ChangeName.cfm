<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>KeyByMe</title>
</head>

<body>
    <div>
    <cfinclude template="HeaderFotos.cfm"></cfinclude>
    </div> 
    
<div align="center">	
	<br>
 <cfoutput> 
<br>
<cfset ws_random = RandRange(001, 999)>
<cfset ws_claveU = 0>
<cfset ws_new = "">    
<cfparam name="url.claveU" default="">
<cfset ws_claveU = url.claveU>	    
<cfset ws_new = "https://www.keybyme.com/Fotos/Wolff/" & "#ws_random#" & "#ws_claveU#">
   #ws_claveU# <br> #ws_new# <br> 
</cfoutput> 
    
<cfoutput>    
<cffile action="rename"
	source="https://www.keybyme.com/Fotos/Wolff/#ws_claveU#"
	destination="#ws_new#">
    
</cfoutput>
    DONE !!!!
</div> 
</body>
</html>	
