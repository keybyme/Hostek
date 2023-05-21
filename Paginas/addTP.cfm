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
 
	
<cfform name="aghno" method="post" action="dsp_TP.cfm">

<table align="center" border="0">
	<tr>
	  <th>
	      <h2 align="center">Agregar Tipo Pago</h2>
	  </th>	
	</tr>
	
	<tr><td><br></td></tr>
	
     <tr>
     	<th>Descripccion: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="tp_desc" 
         class="form-control">
        </td>  
     </tr>
	
     <tr>
     	<th>Limite: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="tp_limite" 
         class="form-control">
        </td>   
     </tr>  
	
     <tr>
  	  <th>URL:</th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="tp_link" 	 
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
</div>
	  </p>
	  
     

    </div> 
  </div>
</div>
	 

</body>
</html>
