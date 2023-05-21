<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="../my.css">

      </script>--->
</head>
<cfinclude template="HeaderFotos.cfm"></cfinclude>
<body>
  
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
  
      <p>
		<div>
<!--- <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="LoginKB.cfm">
          </cfif> --->


 
<CFSET GetCat.RecordCount=0>
<CFQUERY NAME="GetCat" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  Foto_Cat 
  order by cat_desc
</CFQUERY>
	
	
   <h2 align="center"> <cfoutput>Folders</cfoutput> </h2>
    
<cfset ws_I = 0>
<cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">    
	                
<table border="2" bordercolor="#blue" align="center">
   <tr>
     <th colspan="10">
        <cfoutput>
          <!---<cfif  (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	        <cfif '#TRIM(SESSION.Auth.user_role)#' GT 97> --->   
               <a href="add_cat.cfm">Add Folder</a>&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <!---    </cfif>
          </cfif>--->    
        </cfoutput>     
     </th>
    </tr>
 
   <tr>
        <!---<cfif  (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	        <cfif '#TRIM(SESSION.Auth.user_role)#' GT 97> ---> 
              <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Edit</th>     
           <!--- </cfif>
       </cfif>--->   
        <th style="color:#006" bgcolor="#CCCCCC">Folder</th>
    <!---    <cfif  (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	        <cfif '#TRIM(SESSION.Auth.user_role)#' GT 97>  
              <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Delete</th>     
            </cfif>
       </cfif> --->   
    </tr>      
    
 <cfloop query="GetCat"> 
        <cfif ws_I EQ 0>
                <cfset ws_color = WbgcolorNo>
                <cfset ws_I = 1>
        <cfelse>
                <cfset ws_color = WbgcolorYes>
                <cfset ws_I = 0>
        </cfif> 
     <cfoutput>
  
   
   <tr>
    <!---<cfif  (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	        <cfif '#TRIM(SESSION.Auth.user_role)#' GT 97>--->
<td align="center"><a href="upd_cat.cfm?claveU=#GetCat.cat_key#"><img src="../image/ico-edit.gif" width="16" height="16" alt=""/></a></td>                 
       <!--- </cfif>
       </cfif>--->
    <td bgcolor="#(ws_color)#">#TRIM(GetCat.cat_desc)#</td>	   
 
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
