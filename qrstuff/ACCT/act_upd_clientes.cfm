<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QRcodeTech</title>
</head>

<body>

<cfquery name="editemp" datasource="wolffdb_dsn">


UPDATE QR_Cont_Clientes
SET                         ccl_user_name = '#TRIM(Form.ccl_user_name)#'
                          , ccl_password = '#TRIM(Form.ccl_password)#'
                          , ccl_razon_social = '#TRIM(Form.ccl_razon_social)#'
                          , ccl_rut = '#TRIM(Form.ccl_rut)#'
                          , ccl_address = '#TRIM(Form.ccl_address)#'
                          , ccl_telefono = '#TRIM(Form.ccl_telefono)#'
                          , ccl_email = '#TRIM(Form.ccl_email)#'
                          , ccl_contacto = '#TRIM(Form.ccl_contacto)#'
                           
WHERE 
        ccl_id_key = #Form.ccl_id_key#       
</cfquery>
 
  <cflocation url="../ACCT/ListarClientesAcct.cfm?claveU=#TRIM(Form.ccl_fk_c_id_key)#"> 
ACTUALIZADO !!!

</body>
</html> 