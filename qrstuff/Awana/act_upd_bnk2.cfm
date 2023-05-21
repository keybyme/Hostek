<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AWANA</title>
</head>

<body>
<cfquery name="editemp" datasource="wolffdb_dsn">
 INSERT INTO QR_AW_Bank 
    
       (
         bk_kd_id_key
       , bk_en_id_key
       , bk_balance 
       , bk_cc_flag
       )
 Values
       (
        '#Trim(FORM.kdidkey)#',
        '#TRIM(SESSION.Auth.user_en_id_key)#',
        '#0#',
        '#0#'
       )       
       
</cfquery>
 
 
<cfinclude template="welcome.cfm">
AGREGADO !!!
</body>
</html> 