

<cfinclude template="headings.cfm"></cfinclude>	

  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    <cflocation url="https://www.keybyme.com"> 
  </cfif>  



<div class="container-fluid text-center">    
 
 
	<cfset GetRep.RecordCount=0>
	<cfquery name="GetRep" datasource="wolffdb_dsn">
	  Select *
		From LF_Reportes inner join LF_Projects on 
             rep_fk_pr_key = pr_key inner join LF_Employees on
             rep_fk_emp_key = emp_key 
             where rep_user_name = 'angelc' or
                   rep_user_name = 'ryanb' or 
                   rep_user_name = 'alexg' or 
                   rep_user_name = 'jesusz'        
		order by rep_user_name, rep_key desc
	</cfquery>
   
  <cfset ws_user_ant = "">
  <cfset ws_flag = 0>
 <center>
				    	<h2> <cfoutput>Reports</cfoutput> </h2>
	                
<table border="2"  class="table table-striped">


</tr>
   <tr> 
        <th style="color:#006" bgcolor="#CCCCCC">Report Date</th>  
        <th style="color:#006" bgcolor="#CCCCCC">Project</th> 
        <th style="color:#006" bgcolor="#CCCCCC">Supervisor</th>
        <th style="color:#006" bgcolor="#CCCCCC">Description</th>  
    </tr> 
	
<cfset ws_I = 0>
<cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">
	
 <cfloop query="GetRep"> 
   
  <cfquery name="GetEmp" datasource="wolffdb_dsn">
    Select *
      From LF_Employees
      where emp_key = #GetRep.rep_fk_emp_key_sup#
  </cfquery>
   
 <cfoutput> 
  
	 	<cfif ws_I EQ 0>
                <cfset ws_color = WbgcolorNo>
                <cfset ws_I = 1>
        <cfelse>
                <cfset ws_color = WbgcolorYes>
                <cfset ws_I = 0>
        </cfif>  
    			
   <cfif ws_user_ant neq '#TRIM(GetRep.rep_user_name)#'> 
       <cfif ws_flag eq 0>
           <cfset ws_flag = 1>
       <cfelse>
           <tr><td colspan="4">&nbsp;</td></tr>
           <tr><td colspan="4">&nbsp;</td></tr>
       </cfif>
       <cfset ws_user_ant = #TRIM(GetRep.rep_user_name)#>
       <tr>
       <td colspan="4"><h3>Reports by: #TRIM(GetRep.emp_name)#</h3></td>
       </tr> 
   </cfif>   
  <tr>    
  <!--- <td bgcolor="#(ws_color)#"><a href=""https://www.keybyme.com/LF/Reporte_upd2.cfm?claveU=#TRIM(GetRep.rep_key)#&ws_id=#GetRep.rep_user_name#"">#TRIM(GetRep.rep_yyyymmdd)#</a></td> --->
  <td bgcolor="#(ws_color)#">#TRIM(GetRep.rep_yyyymmdd)#</td>
 <td bgcolor="#(ws_color)#">#TRIM(GetRep.pr_desc)#</td> 
  <td bgcolor="#(ws_color)#">#TRIM(GetEmp.emp_name)#</td>  
  <td bgcolor="#(ws_color)#">#TRIM(GetRep.rep_desc)#</td>
 
 </tr>
 </cfoutput>
 </cfloop>
 
</table>
</center>

</div>
	


<cfinclude template="footer.cfm"></cfinclude>
