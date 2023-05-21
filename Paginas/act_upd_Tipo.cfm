<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>

<cfquery name="editemp" datasource="wolffdb_dsn">
UPDATE FN_Tipo_Pagos
SET        tp_desc         = '#TRIM(Form.tp_desc)#'
         , tp_limite  = '#TRIM(Form.tp_limite)#' 
         , tp_link    = '#TRIM(Form.tp_link)#' 
WHERE 
        tp_key = #Form.tp_key#       
</cfquery>
 
 <cflocation url="Listar_Tipos_Pagos.cfm">c 

</body>
</html> 