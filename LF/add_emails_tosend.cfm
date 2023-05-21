

<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main">
  
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
    
		<br>
		 
      <p>
		<div>
			
			<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cflocation url="https://www.keybyme.com"> 
          </cfif> 
<cfoutput>
<cfset ws_key1 = #URL.claveU#>
</cfoutput>
<!---======================================================					
<cfset GetRep.RecordCount=0>
<cfquery name="GetRep" datasource="wolffdb_dsn">
  Select *
    From LF_Reportes
    Where rep_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">      
</cfquery>        
======================================================--->
<cfset GetEmp.RecordCount=0>
<cfquery name="GetEmp" datasource="wolffdb_dsn">
	  Select *
		From LF_Employees
        where emp_email > ''
        order by emp_name
</cfquery>    
<!---======================================================--->  				
<cfset GetRepEmail.RecordCount=0>
<cfquery name="GetRepEmail" datasource="wolffdb_dsn">

Select *
      From LF_Employees inner join LF_Rep_Emails on 
           emp_key = repe_fk_emp_key 
           inner join LF_Reportes on 
           repe_fk_rep_key = rep_key  
      where rep_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
       and emp_email > ''     
      order by emp_name    
</cfquery>        
<!---======================================================---> 
 
<cfquery name="GetGrupo" datasource="wolffdb_dsn">

Select *
      From LF_Grupos        
      order by g_grupo    
</cfquery>        
<!---======================================================---> 

 
    <cfoutput>
        <input type="hidden" name="ws_key" value="#URL.claveU#">	
    </cfoutput>
 <table align="center">		
  <tr>
    <td>
    
        <cfoutput>
        <h1><strong>#TRIM(GetRepEmail.rep_yyyymmdd)#</strong></h1>
        </cfoutput>
    
  </td>
  </tr>
  <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
</table>
<table align="center">
  <cfloop query="GetRepEmail"> 

    <tr>
      <td>
    <cfoutput> 
      <td>#TRIM(GetRepEmail.emp_name)#</td>  
      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
      <td>#TRIM(GetRepEmail.emp_email)#</td>
    </cfoutput>  
  </td>
    </tr>      
  </cfloop>
  <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>    
</table>
<table align="center">
<tr>
    <td>Send to:</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>
       
       <select id="single" name="emp_key" class="js-states form-control" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
           <option value="0" selected>Add Emails to:</option>
              <cfloop query="GetEmp"> 
               <cfoutput>  
                   <option value="inc_rep_email.cfm?claveU=#GetEmp.emp_key#&repU=#ws_key1#"> 
                       #GetEmp.emp_name#
                   </option> 	 
               </cfoutput>	 
           </cfloop> 
      </select>        
   
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script>
        $("#single").select2({
            placeholder: "Select a programming language",
            allowClear: true
        });
      </script>  
</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>


<td>
       
  <select id="single" name="g_key" class="js-states form-control" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
      <option value="0" selected>Add Group to:</option>
         <cfloop query="GetGrupo"> 
          <cfoutput>  
              <option value="inc_rep_emailG.cfm?claveU=#GetGrupo.g_key#&repU=#ws_key1#"> 
                  #GetGrupo.g_grupo#
              </option> 	 
          </cfoutput>	 
      </cfloop> 
 </select>        

 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script>
   $("#single").select2({
       placeholder: "Select a programming language",
       allowClear: true
   });
 </script>  
</td>




<!--- <td><a href="Listar_Grupos.cfm?claveU=#GetEmp.emp_key#&repU=#ws_key1#">Groups</a></td> --->
</tr> 
</table>
<table align="center">
<tr><td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>

 <TR>
 
 <td>     
      <cfoutput>
       <cfif #TRIM(GetRepEmail.rep_key)# GT 0>
           <a href="Imprimir.cfm?claveU=#TRIM(GetRepEmail.rep_key)#&ws_id=#SESSION.Auth.user_name#">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Send Report</strong></a>
       <cfelse>
            <p>Select at least one email</p>   
       </cfif>
      </cfoutput>
 </TD> 
 <td>&nbsp;&nbsp;&nbsp;&nbsp;
  <!--- <cfoutput>
    <a href="Imprimir_np.cfm?claveU=#TRIM(GetRepEmail.rep_key)#&ws_id=#SESSION.Auth.user_name#">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Send Report w/NO Pictures</strong></a>
    </cfoutput> --->
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
 <td>     
      <cfoutput>
        <cfif #TRIM(GetRepEmail.rep_key)# GT 0>
            <a href="clear.cfm?claveU=#ws_key1#">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Clear all</strong></a>
        </cfif>    
      </cfoutput>
 </TD> 
</TR>    
</table>
<br>
<br>
<br>
 
			
</div>
	  </p>
	   
    </div>
  </div>
</div>
	 

</div>
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Select2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script>
      $("#single").select2({
          placeholder: "Select an Employee",
          allowClear: true
      });
      $("#multiple").select2({
          placeholder: "Select an Employee",
          allowClear: true
      });
    </script>
<cfinclude template="footer.cfm"></cfinclude>