<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Log out</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

     <CFSET SESSION.Auth = StructNew()>
     <CFSET SESSION.Auth.IsLoggedIn = "NO">
     <CFSET SESSION.Auth.login  = "">
     <CFSET SESSION.Auth.FirstName  = "">
	 <CFSET SESSION.AUTH.PASSWORD = "">
     <CFSET SESSION.AUTH.roll = "">
	 <CFSET GetUser.RecordCount=0>
     <table align="center">
     <tr>
     <td>
<cfinclude template="heading.cfm">
</td>
</tr>
</table>
<cfinclude template="loginForm.cfm">
 <table align="center">
 <tr>
 <td>
 Update your links for your personal QR Code
 </td>
 </tr>
 </table> 	 
        
</body>
</html>
