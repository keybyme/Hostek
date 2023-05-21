<Style>

   body {margin: 0px;}
   
     .style17 {
 color:#FFFFFF;
	 font-style:oblique;
	 font-size:25px;
	 font-weight:bold;
	 background-color:#FF0000;
 }
   
</style>

        	<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cfinclude template="loginForm.cfm">
               <cfabort>
          </cfif>
          
<cfquery name = "GetPE" dataSource = "wolffdb_dsn">
    SELECT *
    FROM QR_Personal   
         WHERE pe_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>


 <title>www.QrStuff.mobi</title>

<table align="center" width="100%">
 
 <cfoutput query="GetPE" group="pe_id_key">
   <cfoutput>
  
	  <cfif GetPE.pe_field1 NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetPE.pe_field1)#</strong></td>
  			</tr>
  		</cfif>

  		<cfif GetPE.pe_field2 NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetPE.pe_field2)#</strong></td>
		  </tr>
	  </cfif>  
       
   </cfoutput>
  
  </cfoutput>  
  <cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE QR_Personal
SET     
        pe_flag_leido = 1
WHERE 
        pe_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">       
</cfquery>
</table>  
 



