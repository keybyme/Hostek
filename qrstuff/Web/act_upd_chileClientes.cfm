<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QRcodeTech</title>
</head>

<body>

<cfquery name="editemp" datasource="wolffdb_dsn">


UPDATE ChileClientes
SET        cl_bus_name     = '#TRIM(Form.cl_bus_name)#' 
         , cl_nombre   = '#TRIM(Form.cl_nombre)#'
         , cl_telefono   = '#TRIM(Form.cl_telefono)#' 
         , cl_celular   = '#TRIM(Form.cl_celular)#'
         , cl_email   = '#TRIM(Form.cl_email)#'  
         , cl_website   = '#TRIM(Form.cl_website)#'
         , cl_address   = '#TRIM(Form.cl_address)#' 
         , cl_remarks   = '#TRIM(Form.cl_remarks)#'
         , cl_titulo   = '#TRIM(Form.cl_titulo)#'                 
WHERE 
        cl_id_key = #Form.cl_id_key#       
</cfquery>
 
 <cflocation url="ListarClientesChile.cfm">

</body>
</html> 