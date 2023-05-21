<!--- Make sure we have Login name and Password --->
<CFPARAM NAME="Form.UserLogin" TYPE="string">
<CFPARAM NAME="Form.UserPassword" TYPE="string">


<!--- Find record with this Username/Password --->
<!--- If no rows returned, password not valid --->
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *          
  FROM  Usuarios_X
  WHERE user_name = '#Form.UserLogin#'
    <!---And user_password = '#secret#'--->
   
</CFQUERY>
 
<!--- If the username and password is correct ---> 
<CFIF GetUser.RecordCount EQ 1>
    <cfset manCrush = '#Form.UserPassword#' />
    <cfset encryptionKey = '#GetUser.user_llave#'/>
    <cfset secret = encrypt(
           manCrush,
           encryptionKey,
           "AES",
           "hex"
           ) />    
           
           
     <cfif secret EQ GetUser.user_password>      
     <!--- Remember user's logged-in status, plus --->
     <!--- ContactID and First Name, in structure --->
     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn        = "Yes">
     <CFSET SESSION.Auth.user_key          = GetUser.user_key>
     <CFSET SESSION.Auth.user_name         = GetUser.user_name>
	 <CFSET SESSION.Auth.user_password     = GetUser.user_password>
     <CFSET SESSION.Auth.user_nombre       = GetUser.user_nombre>
     <CFSET SESSION.Auth.user_apellido     = GetUser.user_apellido>       
     <CFSET SESSION.Auth.email             = GetUser.user_email>  
     <CFSET SESSION.Auth.user_role         = GetUser.user_role>                
     <CFSET SESSION.Auth.accion            = "INQ">

<!--- 	 <CFLOCATION URL="#SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">
	 <cfset CLIENT.ErrorLogin = 'No'> --->

     <cflocation url="welcomeWES.cfm">
     

      </cfif>
      </CFIF>
     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn        = "No">
     <CFSET SESSION.Auth.user_key          = ''>
     <CFSET SESSION.Auth.user_name         = ''>
	 <CFSET SESSION.Auth.user_password     = ''>
     <CFSET SESSION.Auth.user_nombre       = ''>
     <CFSET SESSION.Auth.user_apellido     = ''>     
     <CFSET SESSION.Auth.email             = ''>   
     <CFSET SESSION.Auth.user_role         = ''>        
     <CFSET SESSION.Auth.accion            = ''>
    

	<!---  <CFLOCATION URL="LoginForm.cfm?qs=#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">  --->
    <cflocation url="loginWES.cfm?action=2">
    
  


 