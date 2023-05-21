 

 
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO RE_Reportes(rep_name, rep_fk_emp_key, rep_desc, rep_user_name)
	 VALUES('#Trim(FORM.rep_name)#'
          , '#Trim(FORM.rep_fk_emp_key)#'  
          , '#Trim(FORM.rep_desc)#'
          , '#SESSION.Auth.user_name#')
	</CFQUERY> 
 
	   
 <cfset GetRep.RecordCount=0>
 <cfquery name="GetRep" datasource="wolffdb_dsn">
   Select Top 1 *
     From RE_Reportes
     order by rep_key desc
 </cfquery>

<cfoutput>
<cflocation url="Upload_Files.cfm?reporte=#GetRep.rep_key#" addtoken="false">
</cfoutput>