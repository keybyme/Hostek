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
 
</cfoutput>	
 

<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *          
  FROM  Usuarios
  WHERE user_name = <cfqueryparam value="#URL.ws_id#" cfsqltype="cf_sql_nvarchar">
  <!---  And user_password = '#secret#'--->
   
</CFQUERY>
 
<!--- If the username and password is correct ---> 
<CFIF GetUser.RecordCount EQ 1>
  <CFSET SESSION.Auth = StructNew()>
  <CFSET SESSION.Auth.IsLoggedIn        = "Yes">
  <CFSET SESSION.Auth.user_key          = GetUser.user_key>
  <CFSET SESSION.Auth.user_name         = GetUser.user_name>
  <CFSET SESSION.Auth.user_password     = GetUser.user_password>
  <CFSET SESSION.Auth.user_nombre       = GetUser.user_nombre>
  <CFSET SESSION.Auth.user_apellido     = GetUser.user_apellido>       
  <CFSET SESSION.Auth.email             = GetUser.user_email>  
  <CFSET SESSION.Auth.user_role         = GetUser.user_role>
</cfif>
 

<CFSET GetReporte.RecordCount=0>
<CFQUERY NAME="GetReporte" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM RE_Rep_Emails inner join RE_Reportes on
         repe_fk_rep_key = rep_key 
        inner join RE_Employees on
        repe_fk_emp_key = emp_key
        Where rep_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</CFQUERY> 
 
    
 <cfset ws_correos = 0>
 <cfset ws_to = "">
 <cfset ws_reporte = "">
 <cfloop query="GetReporte">    
 <cfset ws_correos = ws_correos + 1>
 <cfif ws_correos eq 1>
     <cfset ws_to = #TRIM(GetReporte.emp_email)#>
     <cfset ws_reporte = #TRIM(GetReporte.rep_name)#>
 <cfelse>
     <cfset ws_to = '#ws_to#' & ', ' & '#TRIM(GetReporte.emp_email)#'>     
 </cfif>

 <cfquery name="deletecon" datasource="wolffdb_dsn">
    DELETE from RE_Rep_Emails
    WHERE 
          repe_key = #GetReporte.repe_key#
   </cfquery> 

 </cfloop>  
 
 <CFSET GetNombre.RecordCount=0>
<CFQUERY NAME="GetNombre" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM RE_Reportes inner join RE_Employees on
         #GetReporte.rep_fk_emp_key#  = emp_key
        Where rep_key = #GetReporte.rep_key#
</CFQUERY> 

             <cfoutput>
            
              <cfset ws_url = "https://www.keybyme.com/RE/Reporte_upd2.cfm?claveU=#TRIM(GetReporte.rep_key)#&ws_id=#SESSION.Auth.user_name#">
              
               <cfmail from="wesnetwork@gmail.com" 
                      <!--- to="#TRIM(GetReporte.emp_email)#" --->
                       to=#ws_to#
                       bcc ="wesnetwork@keybyme.com"        
                       subject="#ws_reporte#" type="HTML"
                       server="smtp.gmail.com:587"
                       username="wesnetwork@gmail.com" 
                       password="tjdcpzbanjbbvmxb" 
                       useTLS = "yes">  
				  <p><strong>Project: #TRIM(GetReporte.rep_name)#</strong></p>  
          <p><strong>From: Real Estate Projects</strong></p> 
       
          <p><a href="#ws_url#">Click here to open Report #TRIM(GetReporte.rep_name)#</a></p>
        

        
             #TRIM(GetNombre.emp_name)# <br>
              Pictures Report<br><br>
              <img src="https://www.keybyme.com/RE/Images/Keybyme_logo50.gif" width="240" height="90" alt=""><br>
              <strong>KeyByMe</strong><br> 
             
            </cfmail>  
            Report #TRIM(GetReporte.rep_name)# has been sent to #ws_to# <br><br> <br>
             </cfoutput>  

 
<cfoutput>


<a href="Listar_Reports.cfm">Go back</a>

</cfoutput>
 
</body>
</html>
