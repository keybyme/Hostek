<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Keybyme</title>
</head>

<body> 
<cfoutput>	
<!---<cfset ws_fecha = DateFormat(Now(),"yyyy-mm-dd")></cfset>---> 
  
  <cfset ws_time_now =	(timeFormat(now(), "HH:mm"))> 
  <cfset east_time = #TimeFormat(DateAdd('h', 1, ws_time_now),'HHmm')#>		  
  <cfset Arizona_time = (timeFormat(now(), "HH:mm"))>      
  <cfset ws_fecha_hoy = #DateFormat(now(),"mm/dd/yyyy")#>	 
  <cfset fecha_de_hoy = #DateFormat(DateAdd('d', 0, ws_fecha_hoy),'mmdd')#>       
  <cfset ws_time_east = TimeFormat(DateAdd('h', 1, Arizona_time),'HH:mm')>	
  <cfset menos15 = #TimeFormat(DateAdd('n', -15, ws_time_east), 'HH:mm')#>
  <cfset mas15 = #TimeFormat(DateAdd('n', 15, ws_time_east), 'HH:mm')#>	    
#fecha_de_hoy# <br><br>
</cfoutput>	
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  Reminders
</CFQUERY> 
	
<!---to="#TRIM(GetUser.Res_email)#"--->
    
 <cfloop query="GetUser">    
 <cfif #TRIM(GetUser.re_fecha_start)# LT fecha_de_hoy or
	   #TRIM(GetUser.re_fecha_start)# EQ fecha_de_hoy>   
	   <cfif #TRIM(GetUser.re_fecha_end)# GT fecha_de_hoy or
	         #TRIM(GetUser.re_fecha_end)# EQ fecha_de_hoy> 
		 <cfif #TRIM(GetUser.re_hora)# EQ east_time> 
		   <cfif #TRIM(GetUser.re_email)# neq "">
             <cfoutput>
             <cfmail from="wesnetwork@keybyme.com" 
                       to="#TRIM(GetUser.re_email)#"
                       bcc ="wesnetwork@keybyme.com"        
                       subject="Reminder" type="HTML">  
				  <p>From: #TRIM(GetUser.re_from)#</p>
                  <p>Reminder: #TRIM(GetUser.re_desc)#</p>  
		          <p>Message: #TRIM(GetUser.re_message)#</p>	   
              </cfmail>  
             </cfoutput>  
		   </cfif>	
		 </cfif>	 
       </cfif>   
 </cfif>	 
 </cfloop> 
Enviado !!!
</body>
</html>
