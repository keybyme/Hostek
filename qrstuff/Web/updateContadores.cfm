<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>www.QrcodeTech.com</title>
</head>

<body>


<CFQUERY NAME="GetContador" datasource="wolffdb_dsn">
  SELECT QR_Contador.c_id_key, QR_Contador.c_user_name, QR_Contador.c_password, QR_Contador.c_nombre, 
         QR_Contador.c_telefono, QR_Contador.c_email, QR_Contador.c_address,
         QR_Clientes.cl_id_key, QR_Clientes.cl_fk_user_name, 
         QR_Clientes.cl_ap_codigo, QR_Clientes.cl_multiple         
  FROM  QR_Contador INNER JOIN QR_Clientes ON
        QR_Contador.c_user_name = QR_Clientes.cl_fk_user_name
  WHERE QR_Contador.c_user_name =  <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar"> 
        
</CFQUERY>              
 
<cfoutput> 
 <cfset ws_key1 = #GetContador.c_id_key#>
 <cfset ws_key2 = #GetContador.cl_id_key#>
<cfquery name="editemp" datasource="wolffdb_dsn">             
    UPDATE QR_Clientes
      SET        
               cl_multiple     = '#ws_key1#' 
      WHERE 
               cl_id_key = #ws_key2#   
</cfquery>               
 </cfoutput>     
 <cflocation url="loginForm.cfm?action=8">                  
</body>
</html>