<!--- update --->



<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE QR_Business_card 
SET       
    	bc_password  = '#TRIM(Form.bc_password)#',         
        bc_name  = '#TRIM(Form.bc_name)#',
 		bc_last_name   = '#TRIM(Form.bc_last_name)#',
        bc_address    = '#TRIM(Form.bc_address)#',
        bc_city   = '#TRIM(Form.bc_city)#',
        bc_state   = '#TRIM(Form.bc_state)#',
        bc_zipcode  = '#TRIM(Form.bc_zipcode)#',
        bc_business_name  = '#TRIM(Form.bc_business_name)#',
        bc_telephone  = '#TRIM(Form.bc_telephone)#',
        bc_celular  = '#TRIM(Form.bc_celular)#',
        bc_email  = '#TRIM(Form.bc_email)#',
        bc_website  = '#TRIM(Form.bc_website)#',
        bc_photo = '#TRIM(Form.bc_photo)#',
        bc_logo = '#TRIM(Form.bc_logo)#',
        bc_title = '#TRIM(Form.bc_title)#',
        bc_fax = '#TRIM(Form.bc_fax)#',
        bc_field1 = '#TRIM(Form.bc_field1)#',
        bc_field2 = '#TRIM(Form.bc_field2)#',
        bc_type = '#TRIM(Form.bc_type)#'

WHERE 
        bc_id_key = #Form.bc_id_key#       
</cfquery>
 
 <cfinclude template="../BC/logout.cfm">
Updated !!!