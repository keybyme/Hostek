<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>
 
<cfquery name="editemp" datasource="wolffdb_dsn"> 

UPDATE DB_Links
SET dl_link   = '#TRIM(Form.dl_link)#' 
  , dl_link_desc   = '#TRIM(Form.dl_link_desc)#'   
  , dl_fk_lc_key   = '#TRIM(Form.dl_fk_lc_key)#' 	
WHERE 
        dl_key = #Form.dl_key#       
</cfquery>
 
 <cflocation url="DBLinks.cfm">

</body>
</html> 