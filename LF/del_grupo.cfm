<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>L.F. Jennings</title>
</head>

<body>
  <cfoutput>
    <cfset ws_grupo = #URL.claveU#> 
    
   
   <cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from LF_Grupo_Emp
		WHERE 
        	ge_fk_g_key = #ws_grupo#
   </cfquery>  

<cfquery name="deletecon2" datasource="wolffdb_dsn">
    DELETE from LF_Grupos
    WHERE 
        g_key = #ws_grupo#
</cfquery> 
 
<cflocation url="Listar_Grupos.cfm">  
</cfoutput>
 </body>
</html>