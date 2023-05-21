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
	  <cfif '#TRIM(SESSION.Auth.user_role)#' LT 99>
	           <cflocation url="https://www.keybyme.com/index.cfm">
               <cfabort>
      </cfif> 
</cfif>		
<!---======================================================--->  					
<cfset GetCia.RecordCount=0>
<cfquery name="GetCia" datasource="wolffdb_dsn">
	  Select *
		From Compania
        order by cia_name
</cfquery>   
         
<!---======================================================---> 		    
 
<cfform name="aghno" method="post" action="dsp_usuarios.cfm">
	<cfoutput>
<!---        <input type="hidden" name="ws_USER2" value="#claveUSER#">    
        <input type="hidden" name="ws_carro2" value="#claveCARRO#">--->
    </cfoutput> 
<table align="center" border="0">
 <br>
     <tr>
     	<th>username: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="user_name" 
         size="30" 
         maxlength="100"
		 REQUIRED="Yes"
         MESSAGE="Please, Enter Username.">
        </td>    
     </tr>
     <tr>
     	<th>password: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="user_password" 
         size="30" 
         value="" 
         maxlength="500"
         REQUIRED="Yes"
         MESSAGE="Please, Enter Password.">
        </td>    
     </tr>
     <tr>
     	<th>nombre: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="user_nombre" 
         size="30" 
         value="" 
         maxlength="500"
		 REQUIRED="Yes"
         MESSAGE="Please, Enter Name.">
        </td>    
     </tr>     
     <tr>
     	<th>apellido: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="user_apellido"
         size="30" 
         value="" 
         maxlength="100"
		 REQUIRED="Yes"
         MESSAGE="Please, Enter Last Name.">
        </td>    
     </tr>
         <tr>
     	<th>email: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="user_email"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr>
          <tr>
     	<th>Cia: </th>
        <td colspan="2">   
      
       <select name="user_fk_cia_key" size="1" required>
         <option value="0" selected>Compania</option>
            <cfloop query="GetCia"> 
             <cfoutput>  
                 <option value="#GetCia.cia_key#"> 
                     #GetCia.cia_name#
                 </option> 	 
             </cfoutput>	 
         </cfloop> 
    </select>   
        </td>    
     </tr>

          <tr>
     	<th>role: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="user_role"
         size="30" 
         value="" 
         required="Yes"         
         maxlength="100"
		 MESSAGE="Please, Enter Role.">
        </td>    
     </tr>
     <tr>
     	<th>address: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="user_address"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr>
   
     <tr>
     	<th>Celular: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="user_celular"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
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