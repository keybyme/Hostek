<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QRcodeTech</title>
</head>

<body>
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  
         QR_Usuarios.user_name, 
         QR_Usuarios.user_password            
  FROM  QR_Usuarios
  WHERE QR_Usuarios.user_name = '#TRIM(Form.ws_USER)#'
    And QR_Usuarios.user_password = '#TRIM(Form.rc_password)#' 
   
</CFQUERY>
<CFIF GetUser.RecordCount EQ 1>
<cfquery name="editemp" datasource="wolffdb_dsn">


UPDATE QR_car_records
SET        rc_date     = '#TRIM(Form.rc_date)#' 
         , rc_millas   = '#TRIM(Form.rc_millas)#'
         , rc_record   = '#TRIM(Form.rc_field1)#' 
WHERE 
        rc_id_key = #Form.rc_id_key#       
</cfquery>
 
 <cflocation url="ListarCarsN.cfm?claveU=#TRIM(Form.ws_car_id_key)#">
ACTUALIZADO !!!
<cfelse>
 <cflocation url="ListarCarsN.cfm?claveU=#TRIM(Form.ws_car_id_key)#">
 
 
</CFIF>
</body>
</html> 