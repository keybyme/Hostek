<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My Pet</title>
</head>

<body>
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  
         QR_Usuarios.user_name, 
         QR_Usuarios.user_password            
  FROM  QR_Usuarios
  WHERE QR_Usuarios.user_name = '#Form.H_pet_fk_user_name#'
    And QR_Usuarios.user_password = '#Form.Password#' 
   
</CFQUERY>
<CFIF GetUser.RecordCount EQ 1>
<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE QR_Pets 
SET       pet_DOB        = '#TRIM(Form.pet_DOB)#' 
        , pet_weight     = '#TRIM(Form.pet_weight)#'
        , pet_raza       = '#TRIM(Form.pet_raza)#' 
 		, pet_color      = '#TRIM(Form.pet_color)#'  
 		, pet_note1      = '#TRIM(Form.pet_note1)#' 
        , pet_note2      = '#TRIM(Form.pet_note2)#'
        , pet_note3      = '#TRIM(Form.pet_note3)#'                
WHERE 
        pet_id_key = #Form.H_pet_id_key#       
</cfquery>
 
 
 
</CFIF>
 <cflocation url="ListarPets.cfm?claveU=#Form.H_pet_fk_user_name#&claveU2=#Form.claveU2#">
</body>
</html> 