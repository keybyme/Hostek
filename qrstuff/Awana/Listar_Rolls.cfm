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

<cfif '#TRIM(SESSION.Auth.roll)#' LT 94>
	 
   <br><br><span class="style17">El uso de esta secci&oacute;n esta restringida.</span>
    <cfabort>
</cfif>

<cfquery name = "GetRolls" dataSource = "wolffdb_dsn">
    SELECT *
    FROM QR_Roll
    Where QR_Roll.roll_en_id_key = '#TRIM(SESSION.Auth.user_en_id_key)#'
    order by QR_Roll.roll_nro desc
    
</cfquery>


 <table align="center" border="0">
 <h4 align="center"><========= Rolls =========></h4>
     
        <th style="color:#006" bgcolor="#CCCCCC">Numero Roll</th>
        <th style="color:#006" bgcolor="#CCCCCC">Descripcion</th>
       	<th style="color:#006" bgcolor="#CCCCCC">Kids</th> 
        <th style="color:#006" bgcolor="#CCCCCC">Liders</th>
       	<th style="color:#006" bgcolor="#CCCCCC">Bak</th> 
        <th style="color:#006" bgcolor="#CCCCCC">News</th>
                                  
        <th style="color:#006" bgcolor="#CCCCCC">Editar</th>
        <th style="color:#006" bgcolor="#CCCCCC">Eliminar</th>           
 <cfoutput query="GetRolls" group="roll_en_id_key">
 <cfoutput>
        <tr>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="118"><strong>#TRIM(GetRolls.roll_nro)#</strong></td>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="160"><strong>#TRIM(GetRolls.roll_desc)#</strong></td>
        <cfif #TRIM(GetRolls.roll_upd_kid)# EQ 1>
  			<td bgcolor="#(ws_color)#" style="font-size:small" width="118"><strong>SI</strong></td>
        <cfelse>
        	<td bgcolor="#(ws_color)#" style="font-size:small" width="118"><strong>NO</strong></td>
        </cfif>
   
        <cfif #TRIM(GetRolls.roll_upd_teacher)# EQ 1>
  			<td bgcolor="#(ws_color)#" style="font-size:small" width="118"><strong>SI</strong></td>
        <cfelse>
        	<td bgcolor="#(ws_color)#" style="font-size:small" width="118"><strong>NO</strong></td>
        </cfif>  

        <cfif #TRIM(GetRolls.roll_upd_bank)# EQ 1>
  			<td bgcolor="#(ws_color)#" style="font-size:small" width="118"><strong>SI</strong></td>
        <cfelse>
        	<td bgcolor="#(ws_color)#" style="font-size:small" width="118"><strong>NO</strong></td>
        </cfif>  
   
        <cfif #TRIM(GetRolls.roll_upd_news)# EQ 1>
  			<td bgcolor="#(ws_color)#" style="font-size:small" width="118"><strong>SI</strong></td>
        <cfelse>
        	<td bgcolor="#(ws_color)#" style="font-size:small" width="118"><strong>NO</strong></td>
        </cfif>   

 
  
      
  
              <td align="center"><a href=  "upd_rolls.cfm?claveU=#GetRolls.roll_id_key#"&action=1><img src="image/ico-edit.gif" width="16" height="16" /></a></td>
             <td align="center"><a href="del_rolls.cfm?claveU=#GetRolls.roll_id_key#"&action=2><img src="image/ico-eliminar2.gif"></a></td>
 
     	</tr>
    		  </cfoutput>
</cfoutput>  
</table>  
 
</body>
</html>


