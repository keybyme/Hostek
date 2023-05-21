<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>

<cfquery name="editemp" datasource="wolffdb_dsn">
UPDATE QR_medical
SET        med_insurances_card     = '#URL.wslink#'  
WHERE 
        med_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">     
</cfquery>    
<cfset ws_key = URL.claveU>    
<cflocation url="ListarMedCard.cfm?claveU=#ws_key#">    

</body>
</html> 