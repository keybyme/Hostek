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
 
<cfquery name="get_bh" datasource="wolffdb_dsn">			
SELECT *
FROM estrofas
WHERE es_cliente = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_longvarchar">
order by es_codigo_columna, es_linea_nro 
</cfquery>

    
<table width="100%">
<tr>
<th style="color:#006" bgcolor="#CCCCCC">Area</th>
        <th style="color:#006" bgcolor="#CCCCCC">Estrofa</th>
        <th style="color:#006" bgcolor="#CCCCCC">Editar</th>
        <th style="color:#006" bgcolor="#CCCCCC">Contenido</th>
        <th style="color:#006" bgcolor="#CCCCCC">Flag</th>    
        	
       	 
</tr>
 <cfoutput query="get_bh" group="es_cliente">
 <cfoutput>
         
<tr>
<cfif get_bh.es_codigo_columna EQ 1>
 <td bgcolor="#(ws_color)#" style="font-size:small" width="105"><strong>Reflexiones</strong></td>
<cfelseif get_bh.es_codigo_columna EQ 2>
<td bgcolor="#(ws_color)#" style="font-size:small" width="105"><strong>Anuncios</strong></td>
<cfelse>
<td bgcolor="#(ws_color)#" style="font-size:small" width="105"><strong>Servicios</strong></td>
</cfif>
 <td bgcolor="#(ws_color)#" style="font-size:small" width="30"><strong>#TRIM(get_bh.es_linea_nro)#</strong></td>
 <td align="center" width="30"><a href=  "upd_church.cfm?claveU=#Get_bh.es_key#"&action=1><img src="ico-edit.gif"></a></td>
 <td bgcolor="#(ws_color)#" style="font-size:small" width="700"><strong>#TRIM(get_bh.es_contenido)#</strong></td>
 <td bgcolor="#(ws_color)#" style="font-size:small" width="30"><strong>#TRIM(get_bh.es_flag_linea)#</strong></td>
             
</tr>
</cfoutput>
</cfoutput>
</table>                    
</body>
</html>