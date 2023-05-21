<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QRcodeTech</title>
</head>

<body>

<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE QR_Usuarios 
SET         
          user_nombre     = '#TRIM(Form.user_nombre)#' 
        , user_apellido   = '#TRIM(Form.user_apellido)#'
        , user_address    = '#TRIM(Form.user_address)#' 
 		, user_phone      = '#TRIM(Form.user_phone)#'  
 		, user_cellphone  = '#TRIM(Form.user_cellphone)#' 
        , user_email      = '#TRIM(Form.user_email)#'
        <cfif '#TRIM(Form.Npassword)#' NEQ "">
             , user_password     = '#TRIM(Form.Npassword)#'  
        </cfif>                
WHERE 
        user_name = '#Form.H_pro_fk_user_name#'       
</cfquery>
 

 <cflocation url="loginForm.cfm?action=9">
</body>
</html> 