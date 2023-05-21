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
      
		<br>

      <p>
		<div>
			
	      <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
		

 
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *                   
  FROM  Usuarios INNER JOIN Compania ON
        Usuarios.user_fk_cia_key = Compania.cia_key
  order by user_apellido
</CFQUERY>
 
				    	<h2> 
                    
                        <cfoutput>Usuarios</cfoutput>
                        
                        </h2>
	 
 

               
<table border="2" bgcolor="#99CCCC" width="982">
   <tr>
     <th colspan="11">
        <cfoutput>
        <a href="add_usuario.cfm">Add Usuario</a><br />
        </cfoutput>     
     </th>
   </tr>
   <tr>
	    <th style="color:#006" bgcolor="#CCCCCC">Edit</th>
        <th style="color:#006" bgcolor="#CCCCCC">User Name</th>
        <th style="color:#006" bgcolor="#CCCCCC">Password</th>
        <th style="color:#006" bgcolor="#CCCCCC">Nombre</th>
        <th style="color:#006" bgcolor="#CCCCCC">Apellido</th>
        <th style="color:#006" bgcolor="#CCCCCC">E-mail</th>
        <th style="color:#006" bgcolor="#CCCCCC">Cia</th>
        <th style="color:#006" bgcolor="#CCCCCC">Role</th>
        <th style="color:#006" bgcolor="#CCCCCC">Address</th>
        <th style="color:#006" bgcolor="#CCCCCC">Cellular</th>
	    <th style="color:#006" bgcolor="#CCCCCC">Delete</th>
    </tr>      

 <cfloop query="GetUser">        
 <cfoutput>  
 <tr>
 <cfset decoded = decrypt(
    #TRIM(GetUser.user_password)#,
    #TRIM(GetUser.user_llave)#,
    "AES",
    "hex"
    ) />
  <td align="center"><a href="upd_usuariosKB.cfm?claveU=#GetUser.user_key#&action=1">
                                <img src="../image/ico-edit.gif" width="16" height="16" alt=""/></a></td>
 	  
 		 
  <td>#TRIM(GetUser.user_name)#</td>
  <td>#TRIM(decoded)#</td>
  <td>#TRIM(GetUser.user_nombre)#</td>
  <td>#TRIM(GetUser.user_apellido)#</td>
  <td>#TRIM(GetUser.user_email)#</td>
  <td>#TRIM(GetUser.cia_name)#</td>
  <td>#TRIM(GetUser.user_role)#</td>
  <td>#TRIM(GetUser.user_address)#</td>  
    <cfset ws_phone = 0> 
	<cfif #GetUser.user_celular# GT 0>
		<cfset ws_phone = #GetUser.user_celular#>
		<cfset areacode = left(ws_phone, 3)>
		<cfset firstthree = mid(ws_phone, 4, 3)>
		<cfset lastfour = right(ws_phone, 4)>
		<cfset ws_phone = "(#areacode#) " & "#firstthree#" & "-" & "#lastfour#">
		<td>#ws_phone#</td> 
	<cfelse>
	     <td></td>	
	</cfif>             
  <td align="center"><a href="del_usuariosKB.cfm?claveU=#GetUser.user_key#&action=2">
                                 <img src="../image/ico-eliminar2.gif" width="20" height="20" alt=""/></a></td>
 </tr>
 </cfoutput>
 </cfloop>
 
</table>
</div>
	  </p>
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
   <!---<cfinclude template="propagandaKB.cfm"></cfinclude>--->
  </div>
</div>
	 
</body>
</html>
