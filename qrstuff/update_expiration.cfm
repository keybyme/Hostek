<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Update</title>
</head>

<body>
<style type="text/css">
  .style9 {
     color:#000066;
	 font-family:Geneva, Arial, Helvetica, sans-serif;
	 font-size:20px;
 } 
   .style19 {
     color:#000066;
	 font-family:Geneva, Arial, Helvetica, sans-serif;
	 font-size:22px;
 } 
 .style1 {
	 color:#900;
	 font-style:normal;
	 font-size:20px;
 }
</style>


 
<cfset ws_today = #DateFormat("# Now()#", "mm/dd/yyyy")#>


<cfquery name = "GetCodigos" dataSource = "wolffdb_dsn">
    SELECT *
      
    FROM QR_Codigos 
    Where cd_flag_1_activo = 1 
    and '#ws_today#' > cd_fecha_until
</cfquery>

<cfoutput query="GetCodigos" group="cd_id_key">
 
	<cfquery name="editemp" datasource="wolffdb_dsn">

		UPDATE QR_Codigos 
		SET           	         
        	cd_flag_1_activo = 0
        where cd_id_key = #GetCodigos.cd_id_key#
   	</cfquery>
	<cfoutput>#GetCodigos.cd_codigo#<br></cfoutput>   
   
</cfoutput>
Actualizado!!!
</body>
</html>