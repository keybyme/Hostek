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
    
 <cfoutput>  
<CFSET GetFoto.RecordCount=0>
<CFQUERY NAME="GetFoto" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM Fotos
  where foto_key = #w_foto#
</CFQUERY>    
   
<CFSET GetCat.RecordCount=0>
<CFQUERY NAME="GetCat" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM Foto_Cat
  order by cat_desc
</CFQUERY>     
    
    
    </cfoutput>    
    
<table border="2" bgcolor="#FF0000">     
<cfform name="disp" method="post" action="ChangeF.cfm">
   <cfoutput>
    <tr><td align="center">
        <cfset ws_link = "https://www.keybyme.com/Fotos/Wolff/#GetFoto.foto_pic#"> 
    <img src="#ws_link#" width="400">        
<br>
        </td></tr>   
    <tr>  
        <td align="center">
        <cfselect input name="folder" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
		       <cfoutput>   
				     <option value=""><strong>Change to Folder<strong></option>
			     <cfloop query="GetCat">
					 <option value="https://www.keybyme.com/WES/ChangeF.cfm?catU=#GetCat.cat_key#&claveU=#GetFoto.foto_key#">#GetCat.cat_desc#</option>
	             </cfloop>
				</cfoutput>  	  
        </cfselect>
        </td> 
    </tr>   
  </cfoutput>    
</cfform>  
  </table>     
 </div>  
</body>
</html>	
