
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KeyByMe</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
    
<style>
.dropdown-menu {         
  max-height: 400px;
  overflow-y: auto;
}
    </style>

<body>
<div align="center">
 
    <cfinclude template="HeaderFotos.cfm"></cfinclude>
 
<CFSET GetCat.RecordCount=0>
<CFQUERY NAME="GetCat" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM Foto_Cat
  order by cat_desc
</CFQUERY>      
      <br><br>
    

 <cfset ws_link = "https://www.keybyme.com/Fotos/Wolff/"> 
 


    <select name="ws_cat" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value "" selected>Select Folder</option>
		      <cfloop query="GetCat">     
		          <option value="SubirImagen.cfm?ws_cat=#GetCat.cat_key#"> 
		                #GetCat.cat_desc#
	              </option>
		      </cfloop> 
            </cfoutput>  
    </select>     
</div>
<div><br><br></div>
    
    
</html>
