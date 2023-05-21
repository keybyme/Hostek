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
       
		
  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 	
		
		
      <p>
		<div>

 <!---======================================================--->  					
<cfset GetCia.RecordCount=0>
<cfquery name="GetCia" datasource="wolffdb_dsn">
	  Select *
		From Compania
        order by cia_name
</cfquery>   
         
<!---======================================================---> 	           
  
<CFSET GetUser.RecordCount=0>
<cfquery name = "GetUser" dataSource = "wolffdb_dsn">
    Select *
    From Usuarios 
    Where user_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>			
        
	
<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_upd_usuariosKB.cfm">
	<cfoutput>
        <input type="hidden" name="user_key" value="#GetUser.user_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    
   <cfset decoded = decrypt(
    #TRIM(GetUser.user_password)#,
    #TRIM(GetUser.user_llave)#,
    "AES",
    "hex"
    ) />
      <tr>
     	<td>user_name: </td>
        <td><cfinput name="user_name" value="#GetUser.user_name#" size="80"></td>    
     </tr>
        
	<tr>
        <td>user_password: </td>
        <td><cfinput name="user_password" value="#decoded#" size="50"></td>
    </tr> 
	
    <tr>
        <td>user_nombre: </td>
        <td><cfinput name="user_nombre" value="#GetUser.user_nombre#" size="80"></td>
    </tr>
   
    <tr>
        <td>user_apellido:</td>
        <td><cfinput name="user_apellido" value="#GetUser.user_apellido#" size="50"></td>
    </tr>


    <tr>
        <td>Compania: </td>
        <td>
           <cfselect input name="user_fk_cia_key" size="1">	 
               <cfoutput>   
                  <option value="">Companias</option>
                      <cfloop query="GetCia"> 
                          <cfif #GetUser.user_fk_cia_key# EQ #GetCia.cia_key#>	 
                                <option value="#GetCia.cia_key#" selected>#GetCia.cia_name#</option>
                          <cfelse>
                                <option value="#GetCia.cia_key#">#GetCia.cia_name#</option>
                          </cfif>	   
                      </cfloop>
               </cfoutput>  	  
           </cfselect>		 
       </td>    
     </tr>	
	<tr>
        <td>user_email:</td>
        <td><cfinput name="user_email" value="#GetUser.user_email#" size="50"></td>
    </tr>
	
    <tr>
        <td>user_role: </td>
        <td><cfinput name="user_role" value="#GetUser.user_role#" size="80"></td>
    </tr>
   
    <tr>
        <td>user_address:</td>
        <td><cfinput name="user_address" value="#GetUser.user_address#" size="50"></td>
    </tr>

	<tr>
        <td>user_celular:</td>
        <td><cfinput name="user_celular" value="#GetUser.user_celular#" size="50"></td>
    </tr>
	
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
		
    </tr>   				
</table>
</cfoutput> 
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
