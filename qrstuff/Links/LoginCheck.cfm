<!--- Make sure we have Login name and Password --->
<CFPARAM NAME="Form.UserLogin" TYPE="string">
<CFPARAM NAME="Form.UserPassword" TYPE="string">

<!--- Find record with this Username/Password --->
<!--- If no rows returned, password not valid --->
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT *
         
  FROM  Usuarios
       
  WHERE Usuarios.user_name = '#Form.UserLogin#'
    And Usuarios.user_password = '#Form.UserPassword#' 
    and Usuarios.user_fk_iglesia = 777
</CFQUERY>

<!--- If the username and password is correct ---> 
<CFIF GetUser.RecordCount EQ 1>

     <!--- Remember user's logged-in status, plus --->
     <!--- ContactID and First Name, in structure --->
     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn             = "Yes">
     <CFSET SESSION.Auth.user_key               = GetUser.user_name>  

<!--- 	 <CFLOCATION URL="#SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">
	 <cfset CLIENT.ErrorLogin = 'No'> --->
      <cfoutput>
     <cflocation url="welcome.cfm?claveU=#GetUser.user_name#">
      </cfoutput>
     

<cfelse>
     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn             = "No">
     <CFSET SESSION.Auth.user_key              = ''>
    
	<!---  <CFLOCATION URL="LoginForm.cfm?qs=#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">  --->
    <cflocation url="loginForm.cfm?action=2">
    
</CFIF> 


 