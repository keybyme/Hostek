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
 
<cfif '#TRIM(SESSION.Auth.roll_upd_bank)#' NEQ 1>
	 
   <br><br><span class="style17">El uso de esta secci&oacute;n esta restringida.</span>
    <cfabort>
</cfif>

<CFSET GetKids.RecordCount=0>
<cfquery name = "GetKids" dataSource = "wolffdb_dsn">
SELECT QR_Kids.kd_id_key,
           QR_Kids.kd_en_id_key,
           QR_Kids.kd_club_id_key,
           RTRIM (QR_Kids.kd_name) + ' ' +
           RTRIM (QR_Kids.kd_last_name) as nombre_apellido
FROM QR_Kids
WHERE kd_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
    
</cfquery>
  
<cfform name="aghno" method="post" action="act_upd_bnk2.cfm?claveU=#GetKids.kd_id_key#">
                                        
<table align="center" border="0">
	<tr>
        <th>Nombre: </th>
    	<td>    <cfoutput>    
        <cfinput 
         type="text" 
         name="Nombre" 
         size="30" 
         value="#GetKids.nombre_apellido#" 
         maxlength="100" 
         required="yes" 
         message="Please enter Name">
        
        </td>    
     </tr>

           
     <tr><td>
     <cfinput name="kdidkey" type="hidden" value="#GetKids.kd_id_key#" >
     </td>
      </cfoutput>
     </tr> 
     

          
     <tr>
     	<td colspan="2" align="center">
        <cfinput type="submit" name="enviar" value="Agregar">&nbsp;&nbsp;&nbsp;
         <cfinput type="reset" name="reset" value="Borrar">
        </td>
     </tr>   	                                            
</table>     
</cfform>
</body>
</html> 