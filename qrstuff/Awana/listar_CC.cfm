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

<cfquery name = "GetCC" dataSource = "wolffdb_dsn">
    SELECT QR_Credit_cards.cc_id_key,
           QR_Credit_cards.cc_en_id_key,
           QR_Credit_cards.cc_kd_id_key,
           QR_Credit_cards.cc_balance,
           QR_Credit_cards.cc_prox_pago,
           QR_Credit_cards.cc_credit_limit,
           QR_Credit_cards.cc_3_num,
           QR_Credit_cards.cc_exp_date,
           QR_Kids.kd_id_key,
           RTRIM (QR_Kids.kd_name) + ' ' +
           RTRIM (QR_Kids.kd_last_name) as nombre_apellido
    FROM QR_Credit_cards LEFT OUTER JOIN QR_Kids ON
         QR_Credit_cards.cc_kd_id_key = QR_Kids.kd_id_key
         Where QR_Credit_cards.cc_en_id_key = '#TRIM(SESSION.Auth.user_en_id_key)#' 
     	  <cfif isdefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>   
             AND (QR_Kids.kd_name      LIKE '%#TRIM(url.Criteria)#%' or
                  QR_Kids.kd_last_name LIKE '%#TRIM(url.Criteria)#%')
          </cfif> 
   
    order by nombre_apellido
    
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
<form name="search" method="post" action="listar_CC.cfm?Criteria=#url.Criteria#">
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
        <th style="color:#006" bgcolor="#CCCCCC">CC Number</th>
        <th style="color:#006" bgcolor="#CCCCCC">Balance CC</th>
       	<th style="color:#006" bgcolor="#CCCCCC">CC Next payment</th>
        <th style="color:#006" bgcolor="#CCCCCC">CC Limit</th> 
       
        <cfif #TRIM(SESSION.Auth.roll_upd_bank)# EQ 1>
        	<th style="color:#006" bgcolor="#CCCCCC">Editar</th>
       		<th style="color:#006" bgcolor="#CCCCCC">Eliminar</th>    
        </cfif>
 <cfoutput query="GetCC" group="cc_id_key">
 <cfoutput>
 <cfset ws_CC= #TRIM(GetCC.cc_id_key)#> 
 <cfset ws_CC_1 = Left(ws_CC,4)> 
 <cfset ws_CC_2 = Mid(ws_CC,5,4)>
 <cfset ws_CC_3 = Mid(ws_CC,9,4)>
 <cfset ws_CC_4 = Right(ws_CC,4)>                  
 <cfset ws_CC_F = ws_CC_1 & "-" & ws_CC_2 & "-" & ws_CC_3 & "-" & ws_CC_4>
 			 
<tr>
 <td bgcolor="#(ws_color)#" style="font-size:small" width="160"><strong>#TRIM(GetCC.nombre_apellido)#</strong></td>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="150"><strong>#ws_CC_F#</strong></td>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="100"><strong>#NumberFormat(GetCC.cc_balance, "999,999.99")#</strong></td>
   <td bgcolor="#(ws_color)#" style="font-size:small" width="120"><strong>#DATEFORMAT(TRIM(GetCC.cc_prox_pago),"mm/dd/yyyy")#</strong></td>
   <td bgcolor="#(ws_color)#" style="font-size:small" width="100"><strong>#NumberFormat(GetCC.cc_credit_limit, "999,999.99")#</strong></td>

     <cfif #TRIM(SESSION.Auth.roll_upd_bank)# EQ 1>
                  <td align="center"><a href=  "upd_CC.cfm?claveU=#GetCC.cc_id_key#"&action=1>
                  		<img src="image/ico-edit.gif" width="16" height="16" />	</td>
             <td align="center"><a href="del_CC.cfm?claveU=#GetCC.cc_id_key#"&action=2>
             	<img src="image/ico-eliminar2.gif" width="20" height="20" /></td>
    </cfif> 	
      </tr>
    </cfoutput>
  </cfoutput>  
</table>  
 
</body>
</html>


