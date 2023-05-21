<!--- update --->
<CFSET GetPE.RecordCount=0>
<cfquery name = "GetPE" dataSource = "wolffdb_dsn">
    SELECT pe_username
    FROM QR_Personal   
         WHERE pe_username = '#TRIM(Form.pe_username)#'
</cfquery>

<CFIF GetPE.RecordCount EQ 1>
	<cfif '#TRIM(Form.pe_flag)#' EQ 1>
   		 Username already exist, please try another one
         <cfabort>
    </cfif>     
</CFIF>

<cfset ws_pe_id_key = #Form.pe_id_key#> 

<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE QR_Personal
SET     <cfif '#TRIM(Form.pe_flag)#' EQ 1>
             pe_username  = '#TRIM(Form.pe_username)#',
        </cfif>   
    	pe_password  = '#TRIM(Form.pe_password)#',     
        pe_password_lect  = '#TRIM(Form.pe_password_lect)#',    
        pe_name  = '#TRIM(Form.pe_name)#',
 		pe_telephone  = '#TRIM(Form.pe_telephone)#',
        pe_email  = '#TRIM(Form.pe_email)#',
        <!---pe_photo = '#TRIM(Form.pe_photo)#',--->
        pe_field1 = '#TRIM(Form.pe_field1)#',
        pe_field2 = '#TRIM(Form.pe_field2)#',
        pe_flag_leido = 0
WHERE 
        pe_id_key = #Form.pe_id_key#       
</cfquery>
  
<cflocation url="welcome.cfm?claveU=#ws_pe_id_key#">
Updated !!!
