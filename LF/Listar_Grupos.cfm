

<cfinclude template="headings.cfm"></cfinclude>	
	


  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    <cflocation url="https://www.keybyme.com"> 
  </cfif>  

  <cfif isDefined("form.Criteria")>
    <cfset url.Criteria = trim(form.Criteria)>
 </cfif> 

<div class="container-fluid text-center">    

		<div>

		<cfset ws_primero = 0>
        <cfset ws_grupo_ant = " ">
 
	<cfset GetGrupo.RecordCount=0>
	<cfquery name="GetGrupo" datasource="wolffdb_dsn">
	  Select *
		From LF_Grupos left join LF_Grupo_Emp on 
             g_key = ge_fk_g_key
             left join LF_Employees on 
             ge_fk_emp_key = emp_key
           	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>
             where  (g_grupo LIKE '%#Trim(url.Criteria)#%')
            </cfif>     
		order by g_grupo
	</cfquery>
  
 <center>
				    	<h2> <cfoutput>Groups</cfoutput> </h2>
	                
<table border="2" class="table table-striped">
   <tr>
     <th colspan="3">
        <cfoutput> 
        <a href="add_grupo.cfm">Add Group</a> 
        </cfoutput>     
     </th>
  
     </tr>
    <tr>

    <cfform name="disp" method="post" action="Listar_Grupos.cfm">

        <tr> 
        <td valign="bottom" align="center"><input type="submit" name="editpho" class="btn btn-secondary" value="Search"></td> 
        <td colspan="2"><input name="Criteria" size="30"></td>
        
        </tr>          
     
    </cfform>  
 
</tr>

<cfif ws_primero eq 0>
    <cfoutput>
      <cfset ws_grupo_ant = #TRIM(GetGrupo.g_grupo)#>
      <tr>
        <th><h3>#TRIM(GetGrupo.g_grupo)#</h3></th>
        <th></th>
        <th><a href="add_emp_grupo.cfm?claveU=#GetGrupo.g_key#">Add/Delete</a></th>
      </tr>
    </cfoutput>


   <tr> 
        <th colspan="2" style="color:#006" bgcolor="#CCCCCC">Employee</th> 
        <th>&nbsp;</th>     
    </tr> 
</cfif>

<cfset ws_I = 0>
<cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">
	
 <cfloop query="GetGrupo"> 
 <cfoutput> 
    <cfif TRIM(GetGrupo.g_grupo) neq ws_grupo_ant>
        <cfset ws_grupo_ant = #TRIM(GetGrupo.g_grupo)#>
        <tr>
          <th><h3>#TRIM(GetGrupo.g_grupo)#</h3></th>
          <th></th>
          <th align="left"><a href="add_emp_grupo.cfm?claveU=#GetGrupo.g_key#">Add/Delete</a></th>
        </tr> 
      
  </cfif>
 <tr>
 
	 
	 	<cfif ws_I EQ 0>
                <cfset ws_color = WbgcolorNo>
                <cfset ws_I = 1>
        <cfelse>
                <cfset ws_color = WbgcolorYes>
                <cfset ws_I = 0>
        </cfif>  
      
	 				
  <td colspan="2" bgcolor="#(ws_color)#">#TRIM(GetGrupo.emp_name)#</td>               
  <td>&nbsp;</td>    
 </tr>


 </cfoutput>
 </cfloop>
 
</table>
</center>
 
  </div>
</div>


<cfinclude template="footer.cfm"></cfinclude>
