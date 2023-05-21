<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Keybyme</title>
</head>

<body>
 
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM [5Roster] 
   where     ([Res_division] = 2
 	      or [Res_division] = 3) 
</CFQUERY> 
	
<!---to="#TRIM(GetUser.Res_email)#"--->
    <cfset ws_fecha_hoy = DateFormat(Now(),"mm/dd/yyyy")> 
    <cfset ws_tomorrow = #DateFormat(DateAdd('d', 1, ws_fecha_hoy),'mm/dd/yyyy')#>   
    <cfset ws_fecha_D = #DateFormat(ws_tomorrow,"mmmm d, yyyy")#>     
 <cfloop query="GetUser">  
  <cfif #TRIM(GetUser.Res_daily_sheet)# neq "">     
   <cfif #TRIM(GetUser.Res_email)# neq "">
     <cfset ws_email = "#TRIM(GetUser.Res_email)#"> 
     <cfoutput>
    <cfmail from="wjorge@5ssl.com" 
            to="#ws_email#"      
    subject="Daily Sheet" type="HTML">
          <cfmailparam file="https://www.keybyme.com/Nube/daily.pdf">
          <p>Daily Sheet</p>  
          <p>This is an automatic email: </p>
          <p><a href="https://www.keybyme.com/Nube/daily.pdf"><strong>Daily Sheet of #DayofWeekAsString(DayOfWeek(ws_tomorrow))#, #ws_fecha_D#</strong></a></p>   
          <p>Regards</p> 
          <p>Jorge Wolff</p>      
    </cfmail>  
    </cfoutput> 
  </cfif>    
  <cfif #TRIM(GetUser.Res_email2)# neq "">   
      <cfset ws_email2 = "#TRIM(GetUser.Res_email2)#"> 
     <cfoutput>
    <cfmail from="wjorge@5ssl.com" 
            to="#ws_email2#"      
    subject="Daily Sheet" type="HTML">
          <cfmailparam file="https://www.keybyme.com/Nube/daily.pdf">
          <p>Daily Sheet</p>  
          <p>This is an automatic email: </p>
          <p><a href="https://www.keybyme.com/Nube/daily.pdf"><strong>Daily Sheet of #DayofWeekAsString(DayOfWeek(ws_tomorrow))#, #ws_fecha_D#</strong></a></p>   
          <p>Regards</p> 
          <p>Jorge Wolff</p>      
    </cfmail>   
    </cfoutput>     
  </cfif> 
 </cfif>          
 </cfloop> 
Enviado !!!
</body>
</html>
