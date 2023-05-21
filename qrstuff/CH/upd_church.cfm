<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Update</title>
<Style>

   body {margin: 0px;}
   
</style>
</head>

<body>

        	<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cfinclude template="../CH/loginForm.cfm">
               <cfabort>
          </cfif> 
 
<cfquery name="get_bh" datasource="wolffdb_dsn">			
SELECT *
FROM Estrofas   
         WHERE es_key = <cfqueryparam value="#URL.claveU#"  cfsqltype="cf_sql_numeric">
          
</cfquery>

<cfform name="edit" method="post" action="../CH/act_upd_church.cfm">
	<cfoutput>
        <input type="hidden" name="es_key" value="#get_bh.es_key#">	
        <input type="hidden" name="es_cliente" value="#get_bh.es_cliente#">	
    </cfoutput>
    
<table width="100%">

<cfoutput>
     <cfif get_bh.es_codigo_columna EQ 1>
    <tr>
        <td>Area: </td>
        <td><cfinput name="es_codigo_columna" value="Reflexiones"></td>
    </tr>
    <tr>
    <cfelseif get_bh.es_codigo_columna EQ 2>
    <tr>
        <td>Area: </td>
        <td><cfinput name="es_codigo_columna" value="Anuncios"></td>
    </tr>
    <tr>
     <cfelse>
    <tr>
        <td>Area: </td>
        <td><cfinput name="es_codigo_columna" value="Servicios"></td
    ></tr>
    </cfif>
    <tr>    
    
        <td>Estrofa: </td>
        <td><cfinput name="es_linea_nro" value="#get_bh.es_linea_nro#"></td>
    </tr>
    <tr>
        <td>Contenido: </td>
        <td><cfinput name="es_contenido" value="#get_bh.es_contenido#" size="500"></td>
    </tr> 
    <tr>
        <td>Flag: </td>
        <td><cfinput name="es_flag_linea" value="#get_bh.es_flag_linea#"></td>
    </tr>    
   
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
    </tr>                                        
</cfoutput>
</table>
</cfform>
</body>
</html>