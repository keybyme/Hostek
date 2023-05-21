<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AWANA</title>
</head>

<body>
<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE QR_Kids 
SET       
    	         
        kd_name  = '#TRIM(Form.kd_name)#',
 		kd_last_name   = '#TRIM(Form.kd_last_name)#',
        kd_address    = '#TRIM(Form.kd_address)#',
        kd_city   = '#TRIM(Form.kd_city)#',
        kd_state   = '#TRIM(Form.kd_state)#',
        kd_zipcode  = '#TRIM(Form.kd_zipcode)#',
        kd_apoderado  = '#TRIM(Form.kd_apoderado)#',
        kd_matricula  = '#TRIM(Form.kd_matricula)#',
        kd_telephone  = '#TRIM(Form.kd_telephone)#',
        kd_dob  = '#TRIM(Form.kd_dob)#',
        kd_club_id_key  = '#TRIM(Form.kd_club_id_key)#',
        kd_te_id_key  = '#TRIM(Form.kd_te_id_key)#',
        kd_sexo = '#TRIM(Form.kd_sexo)#'
WHERE 
        kd_id_key = #Form.kd_id_key#       
</cfquery>
 
 
<cfinclude template="welcome.cfm">
ACTUALIZADO !!!
</body>
</html> 