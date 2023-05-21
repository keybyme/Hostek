<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Message from QRcodeTech</title>
</head>

<body>
<cfmail to="ventas@qrcodetech.com"
        bcc="911@wolff.cl"
        from="#form.email#" 
        subject="Solicitud de cotizacion"
        server="mail.wolff.cl"
        username="correo@wolff.cl"
        password="77correo##"
        failto="gideon@wesnetwork.com"
        port = "25"> 
  Marca =  "#URL.marcaU#" 
  Modelo =  "#URL.modeloU#"     
  Nombre = #Trim(FORM.nombre)# <br>
  Telefono = #Trim(FORM.telefono)# <br>
  E-mail = #Trim(FORM.email)# <br>
  Comentario =  #Trim(FORM.texto)#   <br>
  DATE/TIME: #DateFormat(now(),"mmm, dd yyyy")# #TimeFormat(now(),"HH:mm:ss")# (+2) <br>    
</cfmail>  
<cflocation url="http://www.qrcodetech.com/qrstuff/Web/gracias.cfm">
</body>
</html>
  