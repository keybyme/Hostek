<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>KeByMe.com</title>
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
     <CFSET SESSION.Auth.email             = ''>   
     <CFSET SESSION.Auth.user_role         = ''>
     <CFSET SESSION.Auth.user_cia          = ''>
     <CFSET SESSION.Auth.hoy               = ''>   
     <CFSET SESSION.Auth.edad              = ''>      
	 <CFSET SESSION.Auth.grupo             = ''>
     <CFSET SESSION.Auth.estudio           = ''>   
     <CFSET SESSION.Auth.desde             = ''>   
     <CFSET SESSION.Auth.hasta             = ''>  
     <CFSET SESSION.Auth.titulo            = ''> 
     <CFSET SESSION.Auth.tituloDesc        = ''>      
     <CFSET SESSION.Auth.accion            = ''>
	 <CFSET GetUser.RecordCount=0>
	
	 
<cflocation url="https://www.keybyme.com/index.cfm">
   
</body>
</html>
