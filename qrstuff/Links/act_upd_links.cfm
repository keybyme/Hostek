<!--- update --->



<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE Links 
SET       
    	lk_link_flag_1  = '#TRIM(Form.lk_link_flag_1)#',         
        lk_link_1  = '#TRIM(Form.lk_link_1)#',
 		lk_link_desc_1   = '#TRIM(Form.lk_link_desc_1)#',
        lk_link_flag_2  = '#TRIM(Form.lk_link_flag_2)#',         
        lk_link_2  = '#TRIM(Form.lk_link_2)#',
 		lk_link_desc_2   = '#TRIM(Form.lk_link_desc_2)#',
        lk_link_flag_3  = '#TRIM(Form.lk_link_flag_3)#',         
        lk_link_3  = '#TRIM(Form.lk_link_3)#',
 		lk_link_desc_3   = '#TRIM(Form.lk_link_desc_3)#'
WHERE 
        lk_id = #Form.user_key#       
</cfquery>
 <cfoutput>
 <cflocation url="../Web/welcome.cfm?claveU=#SESSION.Auth.user_id_key#">
</cfoutput>
Updated !!!