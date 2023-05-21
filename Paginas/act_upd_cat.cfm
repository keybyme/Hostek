<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>
 
<cfquery name="editemp" datasource="wolffdb_dsn"> 

UPDATE Categorias_X
SET cat_desc   = '#TRIM(Form.cat_desc)#'     
WHERE 
        cat_key = #Form.cat_key#       
</cfquery>
 
 <cflocation url="ListarClavesKB.cfm">

</body>
</html> 