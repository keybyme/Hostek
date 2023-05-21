<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QRcodeTech</title>
</head>

<body>
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *           
  FROM  QR_Usuarios
  WHERE QR_Usuarios.user_fk_car_id_key = '#TRIM(Form.ws_USER3)#'
    And QR_Usuarios.user_password = '#TRIM(Form.rc_password)#' 
   
</CFQUERY>
<CFIF GetUser.RecordCount EQ 1>
<cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from QR_car_records
		WHERE 
        	rc_id_key = #Form.rc_id_key#

</cfquery> 
</CFIF> 
<cflocation url="ListarCarsN.cfm?claveU=#TRIM(Form.ws_carro_id)#"> 
 </body>
</html>