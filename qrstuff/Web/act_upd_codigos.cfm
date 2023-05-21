<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Codigos</title>
</head>

<body>
<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE QR_Codigos 
SET       
    	         
        cd_codigo  = '#TRIM(Form.cd_codigo)#',
 		cd_flag_1_activo   = '#TRIM(Form.cd_flag_1_activo)#',
        cd_fecha_activo    = '#TRIM(Form.cd_fecha_activo)#',
        cd_fecha_until   = '#TRIM(Form.cd_fecha_until)#'
WHERE 
        cd_id_key = #Form.cd_id_key#       
</cfquery>
 
 
<cfinclude template="welcome.cfm">
ACTUALIZADO !!!
</body>
</html> 