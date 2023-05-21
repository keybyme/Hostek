<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Awana</title>
</head>

<body>
<cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from QR_Kids
		WHERE 
        	kd_id_key = #Form.kd_id_key#

</cfquery> 
 
<cfinclude template="welcome.cfm">
DELETED !!!
 </body>
</html>