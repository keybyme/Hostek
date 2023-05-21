<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>
 
<cfquery name="editemp" datasource="wolffdb_dsn"> 

UPDATE DB_Links_Cat
SET lc_cat_desc   = '#TRIM(Form.lc_cat_desc)#'  
WHERE 
        lc_key = #Form.lc_key#       
</cfquery>
 
 <cflocation url="ListarCatLinks.cfm">

</body>
</html> 