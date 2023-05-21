<!--- Make sure we have Login name and Password --->
<CFPARAM NAME="Form.UserLogin" TYPE="string">
<CFPARAM NAME="Form.UserPassword" TYPE="string">

<!--- Find record with this Username/Password --->
<!--- If no rows returned, password not valid --->
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  
         QR_Usuarios.user_name, 
         QR_Usuarios.user_password, 
         QR_Usuarios.user_roll_id_key, 
         QR_Usuarios.user_nombre,
         QR_Usuarios.user_apellido,   
         QR_Usuarios.user_email,
         QR_Usuarios.user_phone              
  FROM  QR_Usuarios
  WHERE <!---Usuarios.user_fk_roll = Roll.roll_nro
    And---> QR_Usuarios.user_name = '#Form.UserLogin#'
    And QR_Usuarios.user_password = '#Form.UserPassword#' 
   
</CFQUERY>

<!--- If the username and password is correct ---> 
<CFIF GetUser.RecordCount EQ 1>

     <!--- Remember user's logged-in status, plus --->
     <!--- ContactID and First Name, in structure --->
     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn        = "Yes">
     <CFSET SESSION.Auth.user_name         = GetUser.user_name>
	 <CFSET SESSION.Auth.user_password     = GetUser.user_password>
     <CFSET SESSION.Auth.user_roll_id_key  = GetUser.user_roll_id_key>
     <CFSET SESSION.Auth.user_nombre       = GetUser.user_nombre>
     <CFSET SESSION.Auth.user_apellido     = GetUser.user_apellido>       
     <CFSET SESSION.Auth.email             = GetUser.user_email> 
     <CFSET SESSION.Auth.phone             = GetUser.user_phone>                    
     <CFSET SESSION.Auth.accion            = "INQ">

<!--- 	 <CFLOCATION URL="#SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">
	 <cfset CLIENT.ErrorLogin = 'No'> --->

     <cflocation url="welcome.cfm">
     

<cfelse>
     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn        = "No">
     <CFSET SESSION.Auth.user_name         = ''>
	 <CFSET SESSION.Auth.user_password     = ''>
     <CFSET SESSION.Auth.user_roll_id_key  = ''>
     <CFSET SESSION.Auth.user_nombre       = ''>
     <CFSET SESSION.Auth.user_apellido     = ''>     
     <CFSET SESSION.Auth.email             = ''>
     <CFSET SESSION.Auth.phone             = ''>              
     <CFSET SESSION.Auth.accion            = ''>
    

	<!---  <CFLOCATION URL="LoginForm.cfm?qs=#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">  --->
    <cflocation url="loginForm.cfm?action=2">
    
</CFIF> 


 