<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>

<cfquery name="editemp" datasource="wolffdb_dsn">
  
UPDATE Contactos
SET        cl_nombre     = '#TRIM(Form.cl_nombre)#'  
         , cl_apellido   = '#TRIM(Form.cl_apellido)#'
         , cl_email   = '#TRIM(Form.cl_email)#'
	     , cl_address   = '#TRIM(Form.cl_address)#'
         , cl_phone   = '#TRIM(Form.cl_phone)#'
         , cl_celular = '#TRIM(Form.cl_celular)#' 
         , cl_carrier   = '#TRIM(Form.cl_carrier)#'
WHERE 
        cl_id_key = #Form.cl_id_key#  
	

	
</cfquery>
 
 <cflocation url="ListarContactos.cfm">

</body>
</html> 