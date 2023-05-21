<!--- Make sure we have Login name and Password --->
<CFPARAM NAME="Form.UserLogin" TYPE="string">
<CFPARAM NAME="Form.UserPassword" TYPE="string">

<!--- Find record with this Username/Password --->
<!--- If no rows returned, password not valid --->
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT QR_Personal.pe_id_key, 
  	     QR_Personal.pe_username,
         QR_Personal.pe_password,
         QR_Personal.pe_password_lect
  FROM  QR_Personal 
       
  WHERE (QR_Personal.pe_username = '#Form.UserLogin#')
   And (QR_Personal.pe_password_lect = '#Form.UserPassword#' or
        QR_Personal.pe_password = '#Form.UserPassword#')
</CFQUERY>

<!--- If the username and password is correct ---> 
<CFIF GetUser.RecordCount EQ 1>

     <!--- Remember user's logged-in status, plus --->
     <!--- ContactID and First Name, in structure --->
     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn             = "Yes">
     <CFSET SESSION.Auth.pe_id_key               = GetUser.pe_id_key>  
     <CFSET SESSION.Auth.pe_username             = GetUser.pe_username>
     <CFSET SESSION.Auth.pe_password             = GetUser.pe_password>
<!--- 	 <CFLOCATION URL="#SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">
	 <cfset CLIENT.ErrorLogin = 'No'> --->

     

<cfelse>
     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn             = "No">
     <CFSET SESSION.Auth.pe_id_key              = ''>
     <CFSET SESSION.Auth.pe_username            = ''>
     <CFSET SESSION.Auth.pe_password            = ''>
	<!---  <CFLOCATION URL="LoginForm.cfm?qs=#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" addtoken="no">  --->
    <cflocation url="loginForm.cfm?action=2">
    
</CFIF> 
      <cfoutput>
      <cfif '#TRIM(SESSION.Auth.pe_password)#' EQ '#Form.UserPassword#'>
   			  <cflocation url="welcome.cfm?claveU=#GetUser.pe_id_key#">
      <cfelse>
              <cflocation url="listPE.cfm?claveU=#GetUser.pe_id_key#">
      </cfif>        
      </cfoutput>


 