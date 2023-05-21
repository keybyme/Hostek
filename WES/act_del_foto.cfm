<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KeyByMe</title>
</head>

<body>
<cfoutput>    
<cfset ws_foto = "#Form.foto_pic#">

</cfoutput>    
<!---<cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from Fotos
		WHERE 
        	foto_key = #Form.foto_key#

</cfquery> 
 <cfoutput>     

   <cffile action="delete"
	   file="D:\home\Keybyme.com\wwwroot\Fotos\Wolff\#ws_foto#">
   
 </cfoutput>  ---> 
    
<cflocation url="ListarImagenes.cfm"> 
    
 </body>
</html>