<!DOCTYPE html>
<html lang="en">
<head>
  <title>KeyByMe.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="my.css">
<style>

p1 {
   color: white;
}
p2 {
  font-family: verdana;
  font-size: 20px;
   background-color: Blue;
   color: white;
}
</style>    
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
 <cfif isDefined("form.Criteria")>
    <cfset url.Criteria = trim(form.Criteria)>
</cfif>
 <cfif isDefined("form.CriteriaCat")>
    <cfset url.CriteriaCat = trim(form.CriteriaCat)>
</cfif>	 
	 
	<cfset GetCat.RecordCount=0>
	<cfquery name="GetCat" datasource="wolffdb_dsn">
	  Select *
		From DB_Links_Cat
		<!---Where cat_fk_user_key = #SESSION.Auth.user_key#--->
		order by lc_cat_desc
	</cfquery>
		
<cfset ws_apt = 0>

<CFSET GetLink.RecordCount=0>
<CFQUERY NAME="GetLink" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  DB_Links left join DB_Links_Cat on
        dl_fk_lc_key = lc_key 
	<!---and cl_fk_user_key = cat_fk_user_key--->
  <!---Where #SESSION.Auth.user_key# = cl_fk_user_key--->
  	<cfif (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '')>
           Where  dl_link_desc LIKE '%#Trim(url.Criteria)#%'  
	</cfif>	
 	<cfif (isDefined('url.CriteriaCat') AND TRIM(url.CriteriaCat) NEQ '')>
		   Where  lc_key = #Trim(url.CriteriaCat)#
			  <!---AND cl_cat LIKE '%#Trim(url.CriteriaCat)#%'--->
	</cfif>
	order by dl_link_desc
</CFQUERY>	
 
				
	                
<table border="2" bordercolor="#blue" align="center">
	<cfif SESSION.Auth.user_role GT 97>
    <tr>
     <th colspan="2">
        <cfoutput> 
        <a href="add_link.cfm"><h3>Add Link</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="ListarCatLinks.cfm">Categories</h3></a>	
        </cfoutput>     
     </th>
   </tr>
   </cfif>	
<cfif SESSION.Auth.user_role GT 97>	
<cfform name="disp" method="post" action="DBLinks.cfm">
    <tr>
        <td colspan="2">Search:  <input name="Criteria" size="30"></td>
		<td>
		<cfselect input name="CriteriaCat" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">		 
		<!---<cfselect input name="CriteriaCat" size="1">--->
		       <cfoutput>   
				     <option value="">Categories</option>
			     <cfloop query="GetCat">
					 
					 <option value="DBLinks.cfm?CriteriaCat=#GetCat.lc_key#">#GetCat.lc_cat_desc#</option>
	             </cfloop>
				</cfoutput>  	  
        </cfselect>
		</td>
         <td><input type="submit" name="editpho" value="send"></td> 
		<td colspan="7">&nbsp;</td>
    </tr>         
</cfform>	
</cfif>	
   <tr> 
	    <cfif SESSION.Auth.user_role GT 97>
        	<th style="color:#006" bgcolor="#CCCCCC" align="center">Edit</th>
		</cfif>	
        <th style="color:#006" bgcolor="#CCCCCC" align="center">LINKS</th>
	    <th style="color:#006" bgcolor="#CCCCCC">Category</th>
	    <cfif SESSION.Auth.user_role GT 97>
        	<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Delete</th>
		</cfif>		
    </tr> 
<cfset ws_I = 0>
<cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">
	 	
	
 <cfloop query="GetLink"> 
 <cfoutput> 
	 	<cfif ws_I EQ 0>
                <cfset ws_color = WbgcolorNo>
                <cfset ws_I = 1>
        <cfelse>
                <cfset ws_color = WbgcolorYes>
                <cfset ws_I = 0>
        </cfif>
 <tr>
  <cfif SESSION.Auth.user_role GT 97>   
  <td align="center"><a href="upd_link.cfm?claveU=#GetLink.dl_key#"><img src="../image/ico-edit.gif" width="16" height="16" alt=""/></a></td>	 
  </cfif>		 
     <td bgcolor="#(ws_color)#"><a href="#TRIM(GetLink.dl_link)#" target="_blank">#TRIM(GetLink.dl_link_desc)#</a></td> 
  <td bgcolor="#(ws_color)#">#TRIM(GetLink.lc_cat_desc)#</td>	  
  <cfif SESSION.Auth.user_role GT 97>	 
  <td align="center"><a href="del_link.cfm?claveU=#GetLink.dl_key#"><img src="../image/ico-eliminar2.gif" width="20" height="20" alt=""/></a></td>  
  </cfif>                
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
