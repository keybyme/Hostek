<!---***********************************************************--->
<!---add_cat.cfm--->
<!---***********************************************************--->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
 
</head>
<body>
<cfinclude template="HeaderFotos.cfm"></cfinclude>
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
      
      <p>
		<div>
    <!---  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="../../LoginKB.cfm">
          </cfif> --->
    

<cfform name="aghno" method="post" action="dsp_cat.cfm">

   
<table align="center" border="3" bordercolor="#B40707">

     
    
     <tr>
     	<th>Folder:</th>
        <td colspan="2">   
        <input type="text" name="cat_desc" size="45" value="" maxlength="70"> 
               
       
        </td>    
     </tr>     
 
     <tr>
     	<td colspan="3" align="center">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <cfinput type="submit" name="enviar" value="ADD" style="background-color: aqua">
        </td>
     </tr>   	                                            
</table>     
</cfform>
</div>
	  </p>
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
   
  </div>
</div>
	
	<!---<cfinclude template="../../footerKB.cfm"></cfinclude>--->

</body>
</html>
