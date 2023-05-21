<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>

<cfquery name="editemp" datasource="wolffdb_dsn">
<cfset manCrush = '#Trim(FORM.cl_pass1)#' />
<cfset encryptionKey = generateSecretKey( "AES" ) />
<cfset secret = encrypt(
    manCrush,
    encryptionKey,
    "AES",
    "hex"
    ) />

UPDATE Claves
SET        cl_url     = '#TRIM(Form.cl_url)#'  
         , cl_username   = '#TRIM(Form.cl_username)#'
         , cl_pass1   = '#TRIM(secret)#' 
         , cl_pass2   = '#TRIM(Form.cl_pass2)#'
         , cl_cat   = '#TRIM(Form.cl_cat)#'
         , cl_llave = '#TRIM(encryptionKey)#' 
         , cl_remarks   = '#TRIM(Form.cl_remarks)#'
WHERE 
        cl_key = #Form.cl_key#       
</cfquery>
 
 <cflocation url="ListarClavesKB.cfm"> 

</body>
</html> 