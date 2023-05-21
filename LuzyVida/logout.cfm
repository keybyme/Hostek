<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Luz y Vida</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn        = "No">
     <CFSET SESSION.Auth.user_key          = ''>
     <CFSET SESSION.Auth.user_name         = ''>
     <CFSET SESSION.Auth.user_password     = ''>
     <CFSET SESSION.Auth.user_nombre       = ''>
     <CFSET SESSION.Auth.user_apellido     = ''>  
     <CFSET SESSION.Auth.user_role         = ''>   
     <CFSET SESSION.Auth.accion            = ''>
	 <CFSET GetUser.RecordCount=0>
	
	 
<cfinclude template="index.cfm">
  	 
        
</body>
</html>
