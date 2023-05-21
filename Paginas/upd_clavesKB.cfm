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
  
<CFSET GetTransacciones.RecordCount=0>
<cfquery name = "GetTransacciones" dataSource = "wolffdb_dsn">
    Select *
    From Claves 
    Where cl_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>			
			
			
	<cfset GetCat.RecordCount=0>
	<cfquery name="GetCat" datasource="wolffdb_dsn">
	  Select cat_key, cat_fk_user_key, cat_desc
		From Categorias_X
		Where cat_fk_user_key = #GetTransacciones.cl_fk_user_key#
	</cfquery>
	<cfset xCategoria = 0>	
		
			

  <cfset xCategoria = GetTransacciones.cl_cat>         
	
<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_upd_claves.cfm">
	<cfoutput>
        <input type="hidden" name="cl_key" value="#GetTransacciones.cl_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    
   <cfset decoded = decrypt(
    #TRIM(GetTransacciones.cl_pass1)#,
    #TRIM(GetTransacciones.cl_llave)#,
    "AES",
    "hex"
    ) />
      <tr>
     	<td>URL: </td>
        <td><cfinput name="cl_url" value="#GetTransacciones.cl_url#" size="80"></td>    
     </tr>
         
    <tr>
        <td>username: </td>
        <td><cfinput name="cl_username" value="#GetTransacciones.cl_username#" size="50"></td>
    </tr>
    <tr>
        <td>pass1: </td>
        <td><cfinput name="cl_pass1" value="#decoded#" size="50"></td>
    </tr>    
    <tr>
        <td>pass2:</td>
        <td><cfinput name="cl_pass2" value="#GetTransacciones.cl_pass2#" size="50"></td>
    </tr>

    <tr>
		
       <!--- <td>categoria:</td>
		<td>
            
			<cfinput name="cat_desc" value="#GetTransacciones.cat_desc#" size="50">
		</td>--->	
		
		<!---Test--->
		
        <TD><span class="style3">
		<cfif NOT isDefined("form.cl_cat")>
            Category:
		<cfelse>
			New Category: 
		</cfif>
        </span></TD>
        <TD>

	
		<select name="cl_cat" size="1">
		   <cfloop query="GetCat"> 
			   <cfoutput>
		     <CFIF GetCat.cat_key EQ xCategoria>
		           <option value="#GetCat.cat_key#" selected> 
		                #GetCat.cat_desc#
	               </option>
		    <CFELSE>
		          <option value="#GetCat.cat_key#"> 
		                #GetCat.cat_desc#
	              </option>
		    </CFIF>
				 </cfoutput>	 
		   </cfloop> 
		  <!--- <option value="add_net_cat">
			    Add New Category:    
			   </option>--->
		   <!---   <option value="add"> 
		        Add New Folder --->
		     <!---</option>--->
        </select>
			
        </TD>
     
			
			
			
		<!---End Test--->
		
    </tr>
        <tr>
        <td>remarks:</td>
        <td><cfinput name="cl_remarks" value="#GetTransacciones.cl_remarks#" size="50"></td>
     
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
