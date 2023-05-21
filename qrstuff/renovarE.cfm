<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reina Valera</title>
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


 
<cfset ws_today = #DateFormat("# Now()#", "mmdd")#>
<cfset ws_time = #TimeFormat("# Now()#", "HH")#>  

<cfquery name = "GetCodigos" dataSource = "Cristianos_dsn">
    SELECT *
      
    FROM QR_Codigos 
           
    WHERE cd_codigo = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_char">
    
</cfquery>

<table align="center" width="100%">
<tr>
<td>
<cfoutput>
To renew it, pleae call at 240-793-9353 or mail to: 
<a href="mailto:jorge@wolff.cl">jorge@wolff.cl</a> with your client ID  <strong> "#GetCodigos.cd_codigo#".</strong><br>
Thank you very much.
</cfoutput>
</td>
</tr>
</table>
</body>
</html>