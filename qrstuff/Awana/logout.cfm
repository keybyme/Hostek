<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Log out</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
     <CFSET SESSION.Auth = StructNew()>     
     <CFSET SESSION.Auth.IsLoggedIn             = "No">
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

<cfinclude template="index.cfm">  	 
        
</body>
</html>
