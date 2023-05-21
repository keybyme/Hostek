<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>KeyByMe</title>

</head>
<body>
<cfinclude template="HeaderFotos.cfm"></cfinclude>
	
  
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
       
		
		
      <p>
		<div>
  
<CFSET GetCat.RecordCount=0>
<cfquery name = "GetCat" dataSource = "wolffdb_dsn">
    Select *
    From Foto_Cat 
    Where cat_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>			
        
	
<cfparam name="url.action" default="">
    
    
    

<cfform name="edit" method="post" action="act_upd_cat.cfm" >
	<cfoutput>
        <input type="hidden" name="cat_key" value="#GetCat.cat_key#">	
    </cfoutput>
	<br>
    
     
    
<table align="center" border="3" bordercolor="#B40707">
<cfoutput>    
 
      <tr>
     	<th>Folder: </th>
        <td><cfinput name="cat_desc" value="#GetCat.cat_desc#" size="60"></td>    
     </tr>
 
  
    <tr>
       	<td colspan="2" align="center"><input type="submit" name="editemp" value="Update"   style="background-color: aqua"></td>
		
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
