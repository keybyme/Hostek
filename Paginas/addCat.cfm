<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="my.css">

</head>
<body>
<cfinclude template="menu.cfm"></cfinclude>
	
<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    	<cflocation url="https://www.keybyme.com">
</cfif>   	
	         
	
<cfform name="aghno" method="post" action="dsp_Cats.cfm">

<table align="center" border="0">
	<tr>
	  <th>
	      <h2 align="center">Agregar Categoria</h2>
	  </th>	
	</tr>
	
	<tr><td><br></td></tr>
 
	
     <tr>
     	<th>Categoria: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cat_desc" 
         class="form-control">
        </td>   
     </tr>    
	   	 
     <tr>
     	<td colspan="3"> 
        <cfinput type="submit" name="enviar" value="Send">  
        </td>
     </tr>   	                                            
</table>     
</cfform>  
	 

</body>
</html>
