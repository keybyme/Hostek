<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome</title>
<Style>

   body {margin: 0px;}
   
</style>
</head>

<body>

        	<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cfinclude template="loginForm.cfm">
               <cfabort>
          </cfif> 
 
<cfquery name="get_pe" datasource="wolffdb_dsn">			
SELECT *
FROM QR_Personal
WHERE pe_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>

<cfform name="edit" method="post" action="act_upd_pe.cfm">
	<cfoutput>
        <input type="hidden" name="pe_id_key" value="#get_pe.pe_id_key#">	
       
    </cfoutput>
    
<table width="100%">
 
<cfoutput>
<cfif #get_pe.pe_flag_leido# EQ 1>
	This message has been read
<cfelse>
    This message has NOT been read
</cfif>        
    <tr>
        <td>Username: </td>
        <td><cfinput name="pe_username" value="#get_pe.pe_username#"></td>
    </tr>
    <tr>
        <td>Username change flag: </td>
        <td><cfinput name="pe_flag" value="0"></td>
    </tr>    
    <tr>
        <td>Password: </td>
        <td><cfinput name="pe_password" value="#get_pe.pe_password#" type="password"></td>
    </tr>
    <tr>
        <td>Password Reader: </td>
        <td><cfinput name="pe_password_lect" value="#get_pe.pe_password_lect#" type="password"></td>
    </tr>    
    <tr>
        <td>Name: </td>
        <td><cfinput name="pe_name" value="#get_pe.pe_name#"></td>
    </tr>
    <tr>
        <td>Telephone: </td>
        <td><cfinput name="pe_telephone" value="#get_pe.pe_telephone#"></td>
    </tr> 
    <tr>
        <td>Email: </td>
        <td><cfinput name="pe_email" value="#get_pe.pe_email#"></td>
    </tr>        
    <tr>
        <td>Field1: </td>
        <td><cfinput name="pe_field1" value="#get_pe.pe_field1#"></td>
    </tr>   
    <tr>
        <td>Field2: </td>
        <td><cfinput name="pe_field2" value="#get_pe.pe_field2#"></td>
    </tr>   
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
    </tr>   
                                  
</cfoutput>
</table>
<cfoutput>
<br><br>This services will expired on #DATEFORMAT(TRIM(get_pe.pe_fecha_vence),"mm/dd/yyyy")#  
</cfoutput>
</cfform>
</body>
</html>