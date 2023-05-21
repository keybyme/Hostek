<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Awana</title>
</head>

<body>
<!--- Make sure we have Login name and Password --->
<CFPARAM NAME="Form.UserLogin" TYPE="string">
<CFPARAM NAME="Form.UserPassword" TYPE="string">

<!--- Find record with this Username/Password --->
<!--- If no rows returned, password not valid --->
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT QR_Usuarios.user_id_key, 
         QR_Usuarios.user_name, 
         QR_Usuarios.user_password, 
         QR_Usuarios.user_en_id_key, 
         QR_Usuarios.user_roll_id_key, 
         QR_Roll.roll_id_key,
         QR_Roll.roll_nro,                 
         QR_Roll.roll_desc,   
         QR_Roll.roll_en_id_key,           
 		 QR_Roll.roll_upd_kid,       
    	 QR_Roll.roll_upd_entidad,          
         QR_Roll.roll_upd_teacher,
         QR_Roll.roll_upd_bank,
         QR_Roll.roll_upd_news,
         QR_Entidad.en_id_key, 
         QR_Entidad.en_description
  FROM  QR_Usuarios INNER JOIN QR_Roll ON  
        QR_Usuarios.user_roll_id_key = QR_Roll.roll_nro  
         LEFT JOIN QR_Entidad ON
         QR_Usuarios.user_en_id_key = QR_Entidad.en_id_key
  WHERE QR_Usuarios.user_name = '#Form.UserLogin#'
    And QR_Usuarios.user_password = '#Form.UserPassword#' 
</CFQUERY>

<!--- If the username and password is correct ---> 
<CFIF GetUser.RecordCount EQ 1>
     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn             = "Yes">
     <CFSET SESSION.Auth.Entidad                = GetUser.en_description>
     <CFSET SESSION.Auth.user_key               = GetUser.user_id_key>
     <CFSET SESSION.Auth.FirstName              = GetUser.user_name>
	 <CFSET SESSION.Auth.PASSWORD               = GetUser.user_password>
     <CFSET SESSION.Auth.roll                   = GetUser.user_roll_id_key>
     <CFSET SESSION.Auth.user_en_id_key         = GetUser.user_en_id_key>
     <CFSET SESSION.Auth.accion                 = "INQ">
     <CFSET SESSION.Auth.roll_key               = GetUser.roll_nro>  
     <CFSET SESSION.Auth.roll_desc              = GetUser.roll_desc>              
     <CFSET SESSION.Auth.roll_upd_kid   	    = GetUser.roll_upd_kid>       
     <CFSET SESSION.Auth.roll_upd_entidad       = GetUser.roll_upd_entidad>          
     <CFSET SESSION.Auth.roll_upd_teacher       = GetUser.roll_upd_teacher>      
 	 <CFSET SESSION.Auth.roll_upd_bank          = GetUser.roll_upd_bank>
     <CFSET SESSION.Auth.roll_upd_news          = GetUser.roll_upd_news>
<!--- 	 <CFLOCATION URL="#SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">
	 <cfset CLIENT.ErrorLogin = 'No'> --->
      <cflocation url="welcome.cfm">
<cfelse>
     <CFSET SESSION.Auth = StructNew()>     
     <CFSET SESSION.Auth.IsLoggedIn             = "No">
     <CFSET SESSION.Auth.Entidad                = ''>
     <CFSET SESSION.Auth.user_key               = ''>
     <CFSET SESSION.Auth.FirstName              = ''>
	 <CFSET SESSION.Auth.PASSWORD               = ''>
     <CFSET SESSION.Auth.roll                   = ''>
     <CFSET SESSION.Auth.user_en_id_key         = ''>
     <CFSET SESSION.Auth.accion                 = ''>
     <CFSET SESSION.Auth.roll_desc              = ''>              
     <CFSET SESSION.Auth.roll_upd_kid    	    = ''>       
     <CFSET SESSION.Auth.roll_upd_entidad       = ''>          
     <CFSET SESSION.Auth.roll_upd_teacher       = ''>      
 	 <CFSET SESSION.Auth.roll_upd_bank          = ''>
     <CFSET SESSION.Auth.roll_upd_news          = ''>
	<!---  <CFLOCATION URL="LoginForm.cfm?qs=#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">  --->
    <cflocation url="loginForm.cfm?action=2">
</CFIF> 
</body>
</html> 

 