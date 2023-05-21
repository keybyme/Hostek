<cfset GetEmail.RecordCount=0>
<cfquery name="GetEmail" datasource="wolffdb_dsn">
  Select *
    From LF_Grupo_Emp inner join LF_Employees on
         ge_fk_emp_key = emp_key
    Where ge_fk_g_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">    
</cfquery> 
 
<cfset ws_key = #URL.repU#>
 
 <cfloop query="GetEmail"> 
 <cfoutput> 
 <cfif '#Trim(GetEmail.emp_key)#' gt '0'>
	<CFQUERY name="correos" datasource="wolffdb_dsn">
	INSERT INTO LF_Rep_Emails(repe_fk_rep_key, repe_fk_emp_key)
	 VALUES('#ws_key#', '#Trim(GetEmail.emp_key)#')
	</CFQUERY> 
 </cfif>

</cfoutput>
 </cfloop>
 

<cfoutput>
<cflocation url="add_emails_tosend.cfm?claveU=#ws_key#">
       </cfoutput> 
