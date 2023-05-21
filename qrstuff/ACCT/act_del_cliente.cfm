<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QRcodeTech</title>
</head>

<body>

<cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from QR_Cont_Clientes
		WHERE 
        	ccl_id_key = #Form.ccl_id_key#

</cfquery> 
 
<cflocation url="../ACCT/ListarClientesAcct.cfm?claveU=#TRIM(Form.ccl_fk_c_id_key)#"> 
 </body>
</html>