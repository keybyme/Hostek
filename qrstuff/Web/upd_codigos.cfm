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
	<cfinclude template="loginForm.cfm">
    <cfabort>
</cfif>    
<cfinclude template="../menu/heading.cfm">
<a href="../Admin/logout.cfm">Log out</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
<cfquery name="Get_codigo" datasource="wolffdb_dsn">			
SELECT *
FROM QR_Codigos
WHERE cd_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>

<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_upd_codigos.cfm">
	<cfoutput>
        <input type="hidden" name="cd_id_key" value="#Get_codigo.cd_id_key#">	
       
    </cfoutput>
<table align="center">
<cfoutput>    
    <tr>
        <td>Codigo: </td>
        <td><cfinput name="cd_codigo" value="#Get_codigo.cd_codigo#"></td>
    </tr>
    <tr>
        <td>Flag Activo: </td>
        <td><cfinput name="cd_flag_1_activo" value="#Get_codigo.cd_flag_1_activo#"></td>
    </tr>
    <tr>
        <td>Fecha Activo: (MM/DD/YYYY)</td>
        <td>
         <cfinput 
         type="text"
         validate="date" 
         mask= "99/99/9999"
         name="cd_fecha_activo" 
         size="40" 
         value="#DATEFORMAT((Get_codigo.cd_fecha_activo),"mm/dd/yyyy")#" 
         maxlength="60">
                       
        </td> 
    </tr>        

       <tr>
        <td>Fecha Until: (MM/DD/YYYY) </td>
        <td>
         <cfinput 
         type="text"
         validate="date" 
         mask= "99/99/9999"
         name="cd_fecha_until" 
         size="40" 
         value="#DATEFORMAT((Get_codigo.cd_fecha_until),"mm/dd/yyyy")#" 
         maxlength="60">
    
        </td>
    </tr>
 
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Actualizar"></td>
    </tr>   				
</table>
</cfoutput> 
</cfform>
</body>
</html> 