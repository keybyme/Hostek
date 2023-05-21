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
		
 
<CFSET GetLink.RecordCount=0>
<CFQUERY NAME="GetLink" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  User_Links 
	    inner join Usuarios on me_fk_user_key = user_key
	    inner join DB_Links on me_fk_dl_key = dl_key
  <cfif SESSION.Auth.user_role LT 99>	
        Where #SESSION.Auth.user_key# = me_fk_user_key
  </cfif>	  
  order by user_name, dl_link_desc
</CFQUERY>

				    	<h2> <cfoutput>User/Links</cfoutput> </h2>
	              
<table border="2" bordercolor="#blue">
	<cfif SESSION.Auth.user_role GT 97>
  		 <tr>
   			  <th colspan="10">
       			 <cfoutput>
      				  <a href="add_user_link.cfm">Add User/Link</a>&nbsp;&nbsp;&nbsp;&nbsp; 
        		 </cfoutput>     
     	 	  </th>
         </tr> 
    </cfif>
 
   <tr>
	     
        
        <th style="color:#006" bgcolor="#CCCCCC">Link</th>
	    <cfif SESSION.Auth.user_role GT 97>
			<th style="color:#006" bgcolor="#CCCCCC">User</th> 
            <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Delete</th>    
	    </cfif>		
    </tr>      
 
 <cfloop query="GetLink"> 
   <cfoutput> 
   <tr>
   
    	        
  
  <td><a href="#TRIM(GetLink.dl_link)#" id="getlink">#TRIM(GetLink.dl_link_desc)#</a></td>
  <cfif SESSION.Auth.user_role GT 97>	   
	 <td>#TRIM(GetLink.user_name)#</td>  
     <td align="center"><a href="del_user_link.cfm?claveU=#GetLink.me_key#"><img src="../image/ico-eliminar2.gif" width="20" height="20" alt=""/></a></td>    
  </cfif>	
         
<!---===================================     --->  
<td>	   
 
<button><a href="CopiarLink.cfm?claveU=#TRIM(GetLink.dl_key)#">Copiar Link</a></button>
 
</td>	
<!--- ======================================   --->   
   	   
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
