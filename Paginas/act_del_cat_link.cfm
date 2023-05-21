<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>

<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  DB_Links
	where dl_fk_lc_key = #Form.lc_key#
</CFQUERY>	
	
<cfif GetUser.RecordCount eq 0>	
   <cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from DB_Links_Cat
		WHERE 
        	lc_key = #Form.lc_key#
   </cfquery> 
</cfif>	
 
<cflocation url="ListarCatLinks.cfm"> 
 </body>
</html>