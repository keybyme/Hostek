<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="my.css">
</head>
<body>
   <cfinclude template="menu.cfm"></cfinclude> 
<div class="column2" style="background-color:#ffffff;">
<div class="main">

<!--- Make sure we have Login name and Password --->
<CFPARAM NAME="Form.UserLogin" TYPE="string">
<CFPARAM NAME="Form.UserPassword" TYPE="string">


<!--- Find record with this Username/Password --->
<!--- If no rows returned, password not valid --->
        
    
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *          
  FROM  Usuarios
  WHERE user_name = '#Form.UserLogin#'
  <!---  And user_password = '#secret#'--->
   
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
           <CFSET SESSION.Auth.user_role         = GetUser.user_role>
           <CFSET SESSION.Auth.hoy               = DateFormat(Now(),"mm/dd/yyyy")> 
           <CFSET SESSION.Auth.accion            = "INQ">
           <cflocation url="index.cfm">
     <cfelse>
           <CFSET SESSION.Auth = StructNew()>
           <CFSET SESSION.Auth.IsLoggedIn        = "No">
           <CFSET SESSION.Auth.user_key          = ''>
           <CFSET SESSION.Auth.user_name         = ''>
	      <CFSET SESSION.Auth.user_password     = ''>
           <CFSET SESSION.Auth.user_nombre       = ''>
           <CFSET SESSION.Auth.user_apellido     = ''>  
           <CFSET SESSION.Auth.user_role         = ''>   
           <CFSET SESSION.Auth.accion            = ''>
           <cflocation url="LoginError.cfm">
     </cfif>
<cfelse>    
     <cflocation url="LoginError.cfm">
</cfif>    
  


 