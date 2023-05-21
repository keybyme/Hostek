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
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
      
      <p>
		<div>
 
          <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
	
<cfquery name="GetCarrier" datasource="wolffdb_dsn">
 Select *
 From Carriers 
</cfquery>		

<cfform name="aghno" method="post" action="dsp_contacto.cfm">
<h2 align="center">Add Contact</h2><br>
<table align="center" border="0">

     <tr>
     	<th>nombre: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_nombre" 
         size="40" 
         value="" 
         maxlength="100">
        </td>    
     </tr>     
     <tr>
     	<th>apellido: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_apellido"
         size="40" 
         value="" 
         maxlength="100">
        </td>    
     </tr>
         <tr>
     	<th>email: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_email"
         size="40" 
         value="" 
         maxlength="100">
        </td>    
     </tr>

     <tr>
     	<th>address: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_address"
         size="40" 
         value="" 
         maxlength="100">
        </td>    
     </tr>
	
     <tr>
     	<th>phone: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_phone"
         size="40" 
         value="" 
         maxlength="100">
        </td>    
     </tr>	
    
     <tr>
     	<th>celular: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_celular"
         size="40" 
         value="" 
         maxlength="100">
        </td>    
     </tr>	
     
     <tr>
     <th>Carrier: </th>
        <TD>
           <select name="cl_carrier" size="1">
             <option value="" selected="selected">Carriers</option>
             <cfoutput query="GetCarrier">
                 <option value="#ca_key#">
                     #GetCarrier.ca_company#
                 </option>    
             </cfoutput>
           </select>
	    </TD>
         
     </tr>  	
         
     <tr>
     	<td colspan="3">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <cfinput type="submit" name="enviar" value="Send">&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <cfinput type="reset" name="reset" value="Clear">
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
	

</body>
</html>
