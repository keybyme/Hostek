<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>
<CFSET GetCard.RecordCount=0>
<cfquery name = "GetCard" dataSource = "wolffdb_dsn">
    SELECT *         
    FROM QR_medical 
    WHERE med_key = #Form.med_key#
</cfquery>	
    
<cfif '#TRIM(Form.med_pass)#' eq #TRIM(GetCard.med_pass)#>
<cfquery name="editemp" datasource="wolffdb_dsn">
UPDATE QR_medical
SET        med_name     = '#TRIM(Form.med_name)#'  
         , med_last_name   = '#TRIM(Form.med_last_name)#'
         , med_address   = '#TRIM(Form.med_address)#'
         , med_dob   = '#TRIM(Form.med_dob)#'
         , med_contact1_name   = '#TRIM(Form.med_contact1_name)#'
         , med_contact1_phone = '#TRIM(Form.med_contact1_phone)#' 
         , med_contact2_name   = '#TRIM(Form.med_contact2_name)#'
         , med_contact2_phone   = '#TRIM(Form.med_contact2_phone)#'
         , med_primary_doc   = '#TRIM(Form.med_primary_doc)#'
         , med_primary_doc_phone   = '#TRIM(Form.med_primary_doc_phone)#'
         , med_medication = '#TRIM(Form.med_medication)#' 
         , med_remarks   = '#TRIM(Form.med_remarks)#'    
WHERE 
        med_key = #Form.med_key#       
</cfquery>

 <cflocation url="ListarMedCard.cfm?claveU=#Form.med_key#">
 <cfelse>
  <cflocation url="ListarMedCard.cfm?claveU=#Form.med_key#&invalido=1">   
 </cfif> 
</body>
</html> 