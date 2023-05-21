<!--- update --->



<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE QR_Links 
SET       
    	lk_link_flag_1  = '#TRIM(Form.lk_link_flag_1)#',         
        lk_link_1       = '#TRIM(Form.lk_link_1)#',
 		lk_link_desc_1  = '#TRIM(Form.lk_link_desc_1)#',
        lk_link_flag_2  = '#TRIM(Form.lk_link_flag_2)#',         
        lk_link_2       = '#TRIM(Form.lk_link_2)#',
 		lk_link_desc_2  = '#TRIM(Form.lk_link_desc_2)#',
        lk_link_flag_3  = '#TRIM(Form.lk_link_flag_3)#',         
        lk_link_3       = '#TRIM(Form.lk_link_3)#',
 		lk_link_desc_3  = '#TRIM(Form.lk_link_desc_3)#',
        lk_link_flag_4  = '#TRIM(Form.lk_link_flag_4)#',         
        lk_link_4       = '#TRIM(Form.lk_link_4)#',
 		lk_link_desc_4  = '#TRIM(Form.lk_link_desc_4)#',
        lk_link_flag_5  = '#TRIM(Form.lk_link_flag_5)#',         
        lk_link_5       = '#TRIM(Form.lk_link_5)#',
 		lk_link_desc_5  = '#TRIM(Form.lk_link_desc_5)#'        
WHERE 
        lk_id_key = #Form.user_key#       
</cfquery>
 <cfoutput>
 <cflocation url="https://www.keybyme.com/qrstuff/Web/ListarLinks.cfm?claveU=#SESSION.Auth.user_name#">
</cfoutput>
Updated !!!