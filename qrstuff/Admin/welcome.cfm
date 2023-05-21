<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome</title>

</head>

<body>

        	<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cfinclude template="../Admin/loginForm.cfm">
               <cfabort>
          </cfif> 
<cfinclude template="../menu/heading.cfm">
<a href="../Admin/logout.cfm">Log out</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="../Admin/add_codigo.cfm">Add Codigo</a>

<cfparam name="url.Criteria" default="">

<cfif isDefined("form.Criteria")>
   <cfset url.Criteria = trim(form.Criteria)>
</cfif>

<cfquery name = "GetCodigos" dataSource = "wolffdb_dsn">
    SELECT *
      
    FROM QR_Codigos 
           
     	  <cfif isdefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>   
             Where (QR_Codigos.cd_codigo      LIKE '%#TRIM(url.Criteria)#%' or
                  QR_Codigos.cd_flag_1_activo LIKE '%#TRIM(url.Criteria)#%')
          </cfif> 
   
    order by cd_flag_1_activo, cd_codigo 
    
</cfquery>

<table align="center" border="0">
 <cfif isDefined('url.criteria') AND trim(url.criteria) NEQ ''>
  <cfoutput>
    <div align="center"><strong>Filter by: '#url.criteria#'</strong><br></div>
  </cfoutput>
</cfif>
<tr><td colspan="3" align="right"><strong><========= Codigos =========></strong></td>
<td colspan="6" align="right">
<cfoutput>
<form name="search" method="post" action="Welcome.cfm?Criteria=#url.Criteria#">
    Search:
       <cfif TRIM(url.Criteria) NEQ ''>
           <input name="Criteria" type="text" value="#url.Criteria#" class="search">
       <cfelse>
           <input name="Criteria" type="text" value="#url.Criteria#">
       </cfif>
       
       <input type="submit" value="Go" name="Go">        
</form>
</cfoutput>
</td></tr>
  
        <tr  ><th style="color:#006" bgcolor="#CCCCCC">Codigo</th>
        <th style="color:#006" bgcolor="#CCCCCC">Flag Activo</th>
       	<th style="color:#006" bgcolor="#CCCCCC">Fecha Activo</th>
        <th style="color:#006" bgcolor="#CCCCCC">Activo Hasta</th> 
 
        	<th style="color:#006" bgcolor="#CCCCCC">Editar</th>
       		<th style="color:#006" bgcolor="#CCCCCC">Eliminar</th>    
        
 <cfoutput query="GetCodigos" group="cd_id_key">
 <cfoutput>
         
<tr>
 <td bgcolor="#(ws_color)#" style="font-size:small" width="170"><strong>#TRIM(GetCodigos.cd_codigo)#</strong></td>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="270"><strong>#TRIM(GetCodigos.cd_flag_1_activo)#</strong></td>
   <td bgcolor="#(ws_color)#" style="font-size:small" width="75"><strong>#DATEFORMAT(TRIM(GetCodigos.cd_fecha_activo),"mm/dd/yyyy")#</strong></td> 
   <td bgcolor="#(ws_color)#" style="font-size:small" width="75"><strong>#DATEFORMAT(TRIM(GetCodigos.cd_fecha_until),"mm/dd/yyyy")#</strong></td>   
  
                  <td align="center"><a href=  "upd_codigos.cfm?claveU=#GetCodigos.cd_id_key#"&action=1>
                  		<img src="image/ico-edit.gif" width="16" height="16" />	</td>
             <td align="center"><a href="del_codigos.cfm?claveU=#GetCodigos.cd_id_key#"&action=2>
             	<img src="image/ico-eliminar2.gif" width="20" height="20" /></td>	
      </tr>
    </cfoutput>
  </cfoutput>  
</table>  

</body>
</html>