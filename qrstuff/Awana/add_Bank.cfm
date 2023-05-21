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

<cfparam name="url.Criteria" default="">

<cfif isDefined("form.Criteria")>
   <cfset url.Criteria = trim(form.Criteria)>
</cfif>

<CFSET GetKids.RecordCount=0>
<cfquery name = "GetKids" dataSource = "wolffdb_dsn">
    SELECT QR_Kids.kd_id_key,
           QR_Kids.kd_en_id_key,
           QR_Kids.kd_club_id_key,
           RTRIM (QR_Kids.kd_name) + ' ' +
           RTRIM (QR_Kids.kd_last_name) as nombre_apellido,
           QR_Kids.kd_te_id_key,
           QR_Club.club_id_key,
           QR_Club.club_description
    FROM QR_Kids LEFT OUTER JOIN QR_Club ON
         QR_Kids.kd_club_id_key = QR_Club.club_id_key
         Where QR_Kids.kd_en_id_key = '#TRIM(SESSION.Auth.user_en_id_key)#'    
    order by club_id_key, nombre_apellido
    
</cfquery>


 <table align="center" border="0">
 <cfif isDefined('url.criteria') AND trim(url.criteria) NEQ ''>
  <cfoutput>
    <div align="center"><strong>Filter by: '#url.criteria#'</strong><br></div>
  </cfoutput>
</cfif>
<tr><td colspan="3" align="right"><strong><========= Kids =========></strong></td>
<td colspan="6" align="right">
<cfoutput>
<form name="search" method="post" action="add.Bank.cfm?Criteria=#url.Criteria#">
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
  
        <tr  ><th style="color:#006" bgcolor="#CCCCCC">Nombre</th> 
        <th style="color:#006" bgcolor="#CCCCCC">Club</th>
        	<th style="color:#006" bgcolor="#CCCCCC">Add Account</th>   

 <cfoutput query="GetKids" group="kd_id_key">
 <cfoutput>
<CFSET GetAcct.RecordCount=0>
<cfquery name = "GetAcct" dataSource = "wolffdb_dsn">
    SELECT QR_AW_Bank.bk_id_key,
           QR_AW_Bank.bk_en_id_key,
           QR_AW_Bank.bk_kd_id_key,
           QR_AW_Bank.bk_balance
    FROM QR_AW_Bank 
         Where QR_AW_Bank.bk_en_id_key = '#TRIM(SESSION.Auth.user_en_id_key)#'     
         and QR_AW_Bank.bk_kd_id_key = #GetKids.kd_id_key#
</cfquery>
 <CFIF GetAcct.RecordCount EQ 0>
	<tr>
 		<td bgcolor="#(ws_color)#" style="font-size:small" width="170"><strong>#TRIM(GetKids.nombre_apellido)#</strong></td>  
   		<td bgcolor="#(ws_color)#" style="font-size:small" width="105"><strong>#TRIM(GetKids.club_description)#</strong></td>
                  <td align="center"><a href=  "add_bank2.cfm?claveU=#GetKids.kd_id_key#"&action=1>
                  		<img src="image/ico-edit.gif" width="16" height="16" />	</a></td>	
    </tr>
 </CFIF>
 </cfoutput>
 </cfoutput>  
</table> 
 
</body>
</html>


