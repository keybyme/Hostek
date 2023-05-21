<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="my.css">

</head>
<body>

<cfset Fecha = now()>
 
<cfoutput>	
<!---<cfquery name="aghno" datasource="wolffdb_dsn">
     INSERT INTO ATable  (t_fecha) 
                   VALUES(#Fecha#) 
</cfquery>--->
</cfoutput>	
<cfinclude template="SendReminders.cfm"></cfinclude>	
<!---<cflocation url="SendReminders.cfm"></cflocation>--->	
</body>
</html>
                        