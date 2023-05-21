<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mensaje desde QrStuff/Awana</title>
</head>

<body>
<cfmail to="911@wolff.cl"
        from="#form.email#" 
        subject="Email from QrStuff/Awana"
        server="mail.wolff.cl"
        username="jorge@wolff.cl"
        password="77jcwv##"
        failto="gideon@wesnetwork.com"
        port = "25"> 
  Nombre = #Trim(FORM.nombre)# <br>
  Telefono = #Trim(FORM.telefono)# <br>
  E-mail = #Trim(FORM.email)# <br>
  Comentario =  #Trim(FORM.texto)#   <br>
  DATE/TIME: #DateFormat(now(),"mmm, dd yyyy")# #TimeFormat(now(),"HH:mm:ss")# (+2) <br>    
</cfmail>  

<cflocation url="index.cfm?action=3">
</body>
</html>
