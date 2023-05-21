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
 
  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 	  
	  
    <div class="col-sm-8 text-left"> 
 
      <p>
		<div>
  
<CFSET GetLinks.RecordCount=0>
<cfquery name = "GetLinks" dataSource = "wolffdb_dsn">
    Select *
    From DB_Links 
    Where dl_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>			
			
			
	<cfset GetCat.RecordCount=0>
	<cfquery name="GetCat" datasource="wolffdb_dsn">
	  Select *
		From DB_Links_Cat
	</cfquery>
	<cfset xCategoria = 0>	 
  <cfset xCategoria = GetLinks.dl_fk_lc_key>         
	
<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_upd_link.cfm">
	<cfoutput>
        <input type="hidden" name="dl_key" value="#GetLinks.dl_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    
 
      <tr>
     	<td>URL: </td>
        <td><cfinput name="dl_link" value="#GetLinks.dl_link#" size="120"></td>    
     </tr>
          
      <tr>
     	<td>Link Desc: </td>
        <td><cfinput name="dl_link_desc" value="#GetLinks.dl_link_desc#" size="80"></td>    
     </tr>	
	
    <tr>   
		<td>Category: </td>
        <TD>
		<select name="dl_fk_lc_key" size="1">
		   <cfloop query="GetCat"> 
			   <cfoutput>
		     <CFIF GetCat.lc_key EQ xCategoria>
		           <option value="#GetCat.lc_key#" selected> 
		                #GetCat.lc_cat_desc#
	               </option>
		    <CFELSE>
		          <option value="#GetCat.lc_key#"> 
		                #GetCat.lc_cat_desc#
	              </option>
		    </CFIF>
				 </cfoutput>	 
		   </cfloop>  
        </select>
			
        </TD>
     
 
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
		
    </tr>   				
</table>
</cfoutput> 
</cfform>
</div>
	  </p>
	   
    </div> 
  </div>
</div>
	 
</body>
</html>
