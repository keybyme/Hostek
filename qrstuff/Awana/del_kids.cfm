<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Awana</title>
<Style>

   body {margin: 0px;}
   
     .style17 {
 color:#FFFFFF;
	 font-style:oblique;
	 font-size:25px;
	 font-weight:bold;
	 background-color:#FF0000;
 }
   
</style>
</head>

<body>
<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	<cflocation url="loginForm.cfm?action=5">
    <cfabort>
</cfif>    
<cfinclude template="welcome.cfm">

<cfif '#TRIM(SESSION.Auth.roll_upd_kid)#' NEQ 1>
	 
   <br><br><span class="style17">El uso de esta secci&oacute;n esta restringida.</span>
    <cfabort>
</cfif>
 
<cfquery name="Get_Kids" datasource="wolffdb_dsn">			
SELECT *
FROM QR_Kids
WHERE kd_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>

<cfparam name="url.action" default="">

<form name="edit" method="post" action="act_del_kids.cfm">
<cfoutput>
<table align="center">
    <input type="hidden" name="kd_id_key" value="#Get_Kids.kd_id_key#">	
     
    <tr>
        <td>Nombre:</td>
        <td><input name="kd_name" value="#Get_Kids.kd_name#"></td>
    </tr>
    <tr>
        <td>Apellido: </td>
        <td><input name="kd_last_name" value="#Get_Kids.kd_last_name#"></td>
    </tr>
   
               
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Delete"></td>
    </tr>   				
</table>
</cfoutput>
</form>
 </body>
</html>