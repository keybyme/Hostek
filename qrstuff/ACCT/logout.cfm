<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>QRcodeTech.com</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="shortcut icon" href="../Web/favicon.ico">
    <link rel="icon" type="image/gif" href="../Web/animated_favicon1.gif">
</head>

<body>

     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn = "NO">
     <CFSET SESSION.Auth.user_name         = ''>
	 <CFSET SESSION.Auth.user_password     = ''>
     <CFSET SESSION.Auth.user_roll_id_key  = ''>
     <CFSET SESSION.Auth.user_nombre       = ''>
     <CFSET SESSION.Auth.user_apellido     = ''>     
     <CFSET SESSION.Auth.email             = ''>
     <CFSET SESSION.Auth.phone             = ''>              
     <CFSET SESSION.Auth.accion            = ''>
	 <CFSET GetUser.RecordCount=0>
	
	 
<cfinclude template="../Web/loginForm.cfm">
  	 
        
</body>
</html>
