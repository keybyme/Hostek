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
  WHERE QR_Usuarios.user_fk_car_id_key = '#TRIM(Form.car_id_key)#'
    And QR_Usuarios.user_password = '#TRIM(Form.rc_password)#' 
   
</CFQUERY>
<CFIF GetUser.RecordCount EQ 1>
<cfquery name="editemp" datasource="wolffdb_dsn">


UPDATE QR_Cars
SET        car_name     = '#TRIM(Form.car_name)#' 
         , car_ins_company   = '#TRIM(Form.car_ins_company)#'
	     , car_policy_number = '#TRIM(Form.car_policy_number)#'
         , car_ins_phone   = '#TRIM(Form.car_ins_phone)#' 
WHERE 
        car_id_key = #Form.car_id_key#       
</cfquery>
 
 <cflocation url="ListarCarsN.cfm?claveU=#TRIM(Form.car_id_key)#">
ACTUALIZADO !!!
<cfelse>
 <cflocation url="ListarCarsN.cfm?claveU=#TRIM(Form.car_id_key)#">
 
 
</CFIF>
</body>
</html> 