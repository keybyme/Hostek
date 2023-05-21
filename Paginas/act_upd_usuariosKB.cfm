<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>

<cfquery name="editemp" datasource="wolffdb_dsn">
<cfset manCrush = '#Trim(FORM.user_password)#' />
<cfset encryptionKey = generateSecretKey( "AES" ) />
<cfset secret = encrypt(
    manCrush,
    encryptionKey,
    "AES",
    "hex"
    ) />
	

UPDATE Usuarios
SET        user_name     = '#TRIM(Form.user_name)#'  
         , user_password   = '#TRIM(secret)#' 
         , user_nombre   = '#TRIM(Form.user_nombre)#'
         , user_apellido   = '#TRIM(Form.user_apellido)#'
         , user_fk_cia_key   = '#TRIM(Form.user_fk_cia_key)#'
         , user_email   = '#TRIM(Form.user_email)#'
         , user_role   = '#TRIM(Form.user_role)#'
	     , user_address   = '#TRIM(Form.user_address)#'
	     , user_llave   = '#TRIM(encryptionKey)#'
	     , user_celular   = '#TRIM(Form.user_celular)#'
WHERE 
        user_key = #Form.user_key#       
</cfquery>
 
 <cflocation url="ListarUsuarios.cfm">

</body>
</html> 