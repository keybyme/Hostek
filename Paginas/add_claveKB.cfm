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
			  
<cfset xcategoria = 0>
<CFQUERY  name="categoria" datasource="wolffdb_dsn">
	select *
	from Categorias_X
	WHERE cat_fk_user_key = '#TRIM(SESSION.Auth.user_key)#'
	ORDER BY cat_desc
</CFQUERY>
<cfset xcategoria = categoria.cat_key>            
           
<cfform name="aghno" method="post" action="dsp_claves.cfm">
	<cfoutput>
<!---        <input type="hidden" name="ws_USER2" value="#claveUSER#">    
        <input type="hidden" name="ws_carro2" value="#claveCARRO#">--->
    </cfoutput> 
<table align="center" border="0"> 
     <tr>
     	<th>URL: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_url" 
         size="100" 
         maxlength="100">
        </td>    
     </tr>
     <tr>
     	<th>Username: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_username" 
         size="100" 
         value="" 
         maxlength="500">
        </td>    
     </tr>
     <tr>
     	<th>Pass1: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_pass1" 
         size="100" 
         value="" 
         maxlength="500"
		 required="Yes" 
		 message="Please, enter password">
        </td>    
     </tr>     
     <tr>
     	<th>Pass2: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_pass2"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr>
     <tr>
     <th>Category: </th>
	 
        <TD>
   
        <select name="category" size="1">
        <option value="" selected="selected">Category</option>
        <cfoutput query="categoria">
           <option value="#cat_key#">
               #categoria.cat_desc#
           </option>    
        </cfoutput>
     <!---   <option value="">Add Category
        <td>   
        <cfinput 
         type="text" 
         name="catnueva"
         size="30" 
         value="" 
         maxlength="100">
        </td>
        </option>--->
        </select>
	 </TD>
         
     </tr>     
     <tr>
     	<th>Remarks: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="cl_remarks"
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
