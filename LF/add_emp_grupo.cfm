

<cfinclude template="headings.cfm"></cfinclude>	
	


  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    <cflocation url="https://www.keybyme.com"> 
  </cfif>  
 
 <!-- ======================================================-->
<cfset GetEmp.RecordCount=0>
<cfquery name="GetEmp" datasource="wolffdb_dsn">
	  Select *
		From LF_Employees
        where emp_email > ''
        order by emp_name
</cfquery>    
<!---======================================================---> 

 <cfset GetGrupo.RecordCount=0>
 <cfquery name="GetGrupo" datasource="wolffdb_dsn">
       Select *
         From LF_Grupos
         where g_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
 </cfquery>   
 <!-- ======================================================-->

 <cfset GetGrupoEmp.RecordCount=0>
 <cfquery name="GetGrupoEmp" datasource="wolffdb_dsn">
       Select *
         From LF_Grupo_Emp inner join LF_Employees on 
              ge_fk_emp_key = emp_key
         where ge_fk_g_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">      
 </cfquery>   
 <!-- ======================================================-->

 
<div class="container-fluid text-center">    

		<div>
  
 <center>
 <table border="2">  
    <tr>
        <cfoutput>
       <th>
        <h2>#GetGrupo.g_grupo#</h2>
       </th> 
       <th>
       <a href="del_grupo.cfm?claveU=#GetGrupo.g_key#">&nbsp;&nbsp;&nbsp;&nbsp;<img src="Images/ico-eliminar2.gif" width="20" height="20" alt=""/></a>
       </th>
    </cfoutput>
    </tr>
   <tr>
    <th>Employee</th>
    <th>Delete</th>
   </tr>  
<cfloop query="GetGrupoEmp">
<cfoutput>
  <tr>
    <td>#GetGrupoEmp.emp_name#</td>  
    <td align="center"><a href="del_grupo_email.cfm?claveU=#GetGrupoEmp.ge_key#&grupoU=#GetGrupo.g_key#"><img src="Images/ico-eliminar2.gif" width="20" height="20" alt=""/></a></td>   
</tr> 
</cfoutput>     
</cfloop>  
</table> 
 <table align="center">
 <tr>
     
        <select id="single" name="emp_key" class="js-states form-control" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>  
            <option value="0" selected><strong>Add Emails to #GetGrupo.g_grupo#:</strong></option> 
               <cfloop query="GetEmp"> 
                
                    <option value="inc_email_grupo.cfm?claveU=#GetEmp.emp_key#&grupoU=#GetGrupo.g_key#"> 
                        #GetEmp.emp_name#
                    </option> 	 
                 
            </cfloop> 
        </cfoutput>	
       </select>        
    
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <script>
         $("#single").select2({
             placeholder: "Select a programming language",
             allowClear: true
         });
       </script>  
 </td>
</tr>
</table>

</center>
 
  </div>
</div>


<cfinclude template="footer.cfm"></cfinclude>
