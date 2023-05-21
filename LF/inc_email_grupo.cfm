 
    <cfset ws_grupo = #URL.grupoU#>
    <cfset ws_emp = #URL.claveU#>
    <cfoutput>
        #ws_grupo#<br> #ws_emp#
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO LF_Grupo_Emp(ge_fk_emp_key, ge_fk_g_key)
	 VALUES(#ws_emp#, #ws_grupo#)
	</CFQUERY> 
   </cfoutput>
	   
<cflocation url="add_emp_grupo.cfm?claveU=#ws_grupo#">
