<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>

<cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from DB_Links
		WHERE 
        	dl_key = #Form.dl_key#

</cfquery> 
 
<cflocation url="DBLinks.cfm"> 
 </body>
</html>