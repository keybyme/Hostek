<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Codigos</title>
</head>

<body>
<cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from QR_Codigos
		WHERE 
        	cd_id_key = #Form.cd_id_key#

</cfquery> 
 
<cfinclude template="welcome.cfm">
DELETED !!!
 </body>
</html>