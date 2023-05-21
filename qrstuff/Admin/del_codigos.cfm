<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Codigos</title>
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
	<cflocation url="loginForm.cfm">
    <cfabort>
</cfif>    
<cfinclude template="../menu/heading.cfm">
<a href="../Admin/logout.cfm">Log out</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<cfquery name="Get_Codigos" datasource="wolffdb_dsn">			
SELECT *
FROM QR_Codigos
WHERE cd_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>

<cfparam name="url.action" default="">

<form name="edit" method="post" action="act_del_codigos.cfm">
<cfoutput>
<table align="center">
    <input type="hidden" name="cd_id_key" value="#Get_Codigos.cd_id_key#">	
     
    <tr>
        <td>Codigo:</td>
        <td><input name="cd_codigo" value="#Get_Codigos.cd_codigo#"></td>
    </tr>

               
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Delete"></td>
    </tr>   				
</table>
</cfoutput>
</form>
 </body>
</html>