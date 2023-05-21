<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Keybyme</title>
</head>

<body>
<cfoutput>	
<!---<cfset ws_fecha = DateFormat(Now(),"yyyy-mm-dd")></cfset>---> 
  <cfset Arizona_time = (timeFormat(now(), "HH:mm"))>      
  <cfset ws_fecha_hoy = #DateFormat(now(),"mm/dd/yyyy")#>
  <cfset ws_time_east = TimeFormat(DateAdd('h', 1, Arizona_time),'HH:mm')>	
  <cfset menos15 = #TimeFormat(DateAdd('n', -15, ws_time_east), 'HH:mm')#>
  <cfset mas15 = #TimeFormat(DateAdd('n', 15, ws_time_east), 'HH:mm')#>	    

</cfoutput>	
<CFSET GetRes.RecordCount=0>
<CFQUERY NAME="GetRes" datasource="wolffdb_dsn">
  SELECT  *               
  FROM  [5Roster]   
</CFQUERY>	  
	
<cfoutput>
  <cfset ws_mes_actual = #DatePart('m',now())#>
  <cfset ws_dia_actual = #DatePart('d',now())#> 
  <cfset ws_i = 0>    
  <cfset ws_apt_1 = ""> 
  <cfset ws_name_1 = "">
  <cfset ws_last_1 = "">  
  <cfset ws_email_1 = "">      
  <cfset ws_apt_2 = ""> 
  <cfset ws_name_2 = "">
  <cfset ws_last_2 = ""> 
  <cfset ws_email_2 = "">      
  <cfset ws_apt_3 = ""> 
  <cfset ws_name_3 = "">
  <cfset ws_last_3 = ""> 
  <cfset ws_email_3 = "">      
  <cfset ws_apt_4 = ""> 
  <cfset ws_name_4 = "">
  <cfset ws_last_4 = "">
  <cfset ws_email_4 = "">      
  <cfset ws_apt_5 = ""> 
  <cfset ws_name_5 = "">
  <cfset ws_last_5 = "">
  <cfset ws_email_5 = "">      
  <cfset ws_subject = "Residences Birthday today " & #ws_fecha_hoy#>      
</cfoutput>    
    
 <cfloop query="GetRes"> 
 <cfoutput> 	
  <cfif #TRIM(GetRes.Res_birthdate)# neq "">     
     <cfset ws_mes = #DatePart('m',GetRes.Res_birthdate)#>
     <cfset ws_dia = #DatePart('d',GetRes.Res_birthdate)#>                                                
      <cfif #ws_mes# eq #ws_mes_actual# and
            #ws_dia# eq #ws_dia_actual#>
         <cfset ws_i = ws_i +1>
         <cfif ws_i eq 1>
              <cfset ws_apt_1 = #TRIM(GetRes.Res_apt)#> 
              <cfset ws_name_1 = #TRIM(GetRes.Res_name)#>
              <cfset ws_last_1 = #TRIM(GetRes.Res_last_name)#> 
              <cfif #TRIM(GetRes.Res_email)# neq "">
                  <cfset ws_email_1 = #TRIM(GetRes.Res_email)#>
              </cfif>      
         <cfelseif ws_i eq 2>
              <cfset ws_apt_2 = #TRIM(GetRes.Res_apt)#> 
              <cfset ws_name_2 = #TRIM(GetRes.Res_name)#>
              <cfset ws_last_2 = #TRIM(GetRes.Res_last_name)#> 
              <cfif #TRIM(GetRes.Res_email)# neq "">
                  <cfset ws_email_2 = #TRIM(GetRes.Res_email)#>
              </cfif>      
         <cfelseif ws_i eq 3>
              <cfset ws_apt_3 = #TRIM(GetRes.Res_apt)#> 
              <cfset ws_name_3 = #TRIM(GetRes.Res_name)#>
              <cfset ws_last_3 = #TRIM(GetRes.Res_last_name)#> 
              <cfif #TRIM(GetRes.Res_email)# neq "">
                  <cfset ws_email_3 = #TRIM(GetRes.Res_email)#>
              </cfif>      
         <cfelseif ws_i eq 4>
              <cfset ws_apt_4 = #TRIM(GetRes.Res_apt)#> 
              <cfset ws_name_4 = #TRIM(GetRes.Res_name)#>
              <cfset ws_last_4 = #TRIM(GetRes.Res_last_name)#> 
              <cfif #TRIM(GetRes.Res_email)# neq "">
                  <cfset ws_email_4 = #TRIM(GetRes.Res_email)#>
              </cfif>      
         <cfelse>
              <cfset ws_apt_5 = #TRIM(GetRes.Res_apt)#> 
              <cfset ws_name_5 = #TRIM(GetRes.Res_name)#>
              <cfset ws_last_5 = #TRIM(GetRes.Res_last_name)#>
              <cfif #TRIM(GetRes.Res_email)# neq "">
                  <cfset ws_email_5 = #TRIM(GetRes.Res_email)#>
              </cfif>      
         </cfif>     
      </cfif>
</cfif>     
</cfoutput>
 <!---<cfset br = "#chr(13)##chr(10)#">--->
<cfsavecontent variable="someStr">
        <table>
        <cfoutput>
        <tr><th>APT.</th><th>Name</th><th>Last Name</th><th>E-mail</th></tr>    
        <tr><td>#ws_apt_1#</td><td>#ws_name_1#</td><td>#ws_last_1#</td><td><a href="mailto:#ws_email_1#">#ws_email_1#</a></td></tr> 
        <tr><td>#ws_apt_2#</td><td>#ws_name_2#</td><td>#ws_last_2#</td><td><a href="mailto:#ws_email_2#">#ws_email_2#</a></td></tr> 
        <tr><td>#ws_apt_3#</td><td>#ws_name_3#</td><td>#ws_last_3#</td><td><a href="mailto:#ws_email_3#">#ws_email_3#</a></td></tr> 
        <tr><td>#ws_apt_4#</td><td>#ws_name_4#</td><td>#ws_last_4#</td><td><a href="mailto:#ws_email_4#">#ws_email_4#</a></td></tr> 
        <tr><td>#ws_apt_5#</td><td>#ws_name_5#</td><td>#ws_last_5#</td><td><a href="mailto:#ws_email_5#">#ws_email_5#</a></td></tr> 
      
        <tr><td colspan="4">This is an automatic reminder created by <a href="https://www.keybyme.com">KeyByMe</a>, please do not reply.</td></tr>
        </cfoutput>     
        </table>
</cfsavecontent>             
         <!---bcc = "PPetkovic@5SSL.COM, JSHARPE@5SSL.COM, DSingh@5SSL.COM, JMusa@5SSL.COM, STamakloe@5SSL.COM, JBROMFIELD@5SSL.COM, ANORMAN@5ssl.com"--->    
</cfloop>
  <cfif ws_i neq 0>
    <cfmail from="wesnetwork@keybyme.com" 
            to="me@20874.com" 
            bcc = "wesnetwork@keybyme.com, wesnetwork@gmail.com"        
     subject="#ws_subject#" type="html"> 
       <cfoutput>    
        #Trim(someStr)#
       </cfoutput>       
    </cfmail>  
  <cfelse>
    <cfmail from="wesnetwork@keybyme.com" 
            to="me@20874.com"         
     subject="No Birthdays today">  
            Nada hoy !!!      
    </cfmail>  
  </cfif>  
Enviado !!!
</body>
</html>
