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
	
	      <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 	
	
	 <cfinclude template="menu.cfm"></cfinclude>

<div class="container-fluid text-center">    
  <div class="row content">
  
    <div class="col-sm-8 text-left"> 
       
      <p>
		<div>
  
 <cfif isDefined("form.Criteria")>
    <cfset url.Criteria = trim(form.Criteria)>
</cfif>
 
<CFSET GetRem.RecordCount=0>
<CFQUERY NAME="GetRem" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  Reminders 
  Where #SESSION.Auth.user_key# = re_fk_user_key
  	<cfif (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '')>
              and (re_desc LIKE '%#Trim(url.Criteria)#%' OR
                   re_fecha_start LIKE '%#Trim(url.Criteria)#%' OR
                   re_fecha_end LIKE '%#Trim(url.Criteria)#%' OR
                   re_hora LIKE '%#Trim(url.Criteria)#%' OR
		           re_from LIKE '%#Trim(url.Criteria)#%' OR
		           re_message LIKE '%#Trim(url.Criteria)#%')
	</cfif>		
  order by re_fecha_start
</CFQUERY>
	<cfset Fecha_hora = (timeFormat(now(), "HH:mm"))>

 
				    	<h2> <cfoutput>Reminders</cfoutput> </h2>
	                
<table border="2" bordercolor="#blue">
   <tr>
     <th colspan="10">
        <cfoutput>
		<cfset Arizona_time = (timeFormat(now(), "HH:mm"))>      
        <cfset pacific_time = #TimeFormat(DateAdd('h', -2, Arizona_time),'HH:mm')#>   
        <cfset mountain_time =  #TimeFormat(DateAdd('h', -1, Arizona_time),'HH:mm')#>     
        <cfset central_time = #TimeFormat(DateAdd('h', 0, Arizona_time),'HH:mm')#>
        <cfset east_time = #TimeFormat(DateAdd('h', 1, Arizona_time),'HH:mm')#>	
        <a href="add_reminder.cfm">Add Reminder</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<strong>Time now is #east_time# (Eastern Time)</strong>

        </cfoutput>     
     </th>
   </tr> 
	
<cfform name="disp" method="post" action="Reminders.cfm">
 
    <tr>
        <td colspan="2">Search:  <input name="Criteria" size="30"></td>
         <td><input type="submit" name="editpho" value="send"></td> 
		<td colspan="7">&nbsp;</td>
    </tr>          
 
</cfform>
			
	
    <tr><td colspan="10" align="center">
		<cfoutput>  

		<p><b>Pacific Time #pacific_time# ***  
		      Mountain Time #mountain_time# ***
		      Central Time #central_time# ***
		      Eastern Time #east_time#</b></p>	
		</cfoutput>	
    </td>			
	</tr> 
</tr>
   <tr>
	    <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Edit</th>
        <th style="color:#006" bgcolor="#CCCCCC">Reminder</th>
	    <th style="color:#006" bgcolor="#CCCCCC">From</th>
        <th style="color:#006" bgcolor="#CCCCCC">Date Start</th>
	    <th style="color:#006" bgcolor="#CCCCCC">Date End</th>
        <th style="color:#006" bgcolor="#CCCCCC">Time</th> 
	    <th style="color:#006" bgcolor="#CCCCCC">Email</th>
	    <th style="color:#006" bgcolor="#CCCCCC">Message</th>
        <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Delete</th>        
    </tr> 
	
<cfset ws_I = 0>
<cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">
	
 <cfloop query="GetRem"> 
 <cfoutput> 
 <tr>

	 	<cfif ws_I EQ 0>
                <cfset ws_color = WbgcolorNo>
                <cfset ws_I = 1>
        <cfelse>
                <cfset ws_color = WbgcolorYes>
                <cfset ws_I = 0>
        </cfif>  
	 
  <td align="center"><a href="upd_reminders.cfm?claveU=#GetRem.re_key#&action=1">
                                <img src="../image/ico-edit.gif" width="16" height="16" alt=""/></a></td>			 
  <td bgcolor="#(ws_color)#">#TRIM(GetRem.re_desc)#</td>
  <td bgcolor="#(ws_color)#">#TRIM(GetRem.re_from)#</td>					
  <td bgcolor="#(ws_color)#">#TRIM(GetRem.re_fecha_start)#</td>
  <td bgcolor="#(ws_color)#">#TRIM(GetRem.re_fecha_end)#</td>					
  <td bgcolor="#(ws_color)#">#TRIM(GetRem.re_hora)#</td>    
  <td bgcolor="#(ws_color)#">#TRIM(GetRem.re_email)#</td> 	
  <td bgcolor="#(ws_color)#">#TRIM(GetRem.re_message)#</td>					
  <td align="center"><a href="del_reminder.cfm?claveU=#GetRem.re_key#&action=2">
                                 <img src="../image/ico-eliminar2.gif" width="20" height="20" alt=""/></a></td>               
 
 </tr>
 </cfoutput>
 </cfloop>

</table>
</div>
	  </p>
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
   <!---<cfinclude template="propagandaKB.cfm"></cfinclude>--->
  </div>
</div>
	 
<script>

    fetch('https://www.keybyme.com/paginas/remidners.json').then(res=> res.json()).then(data => {
        console.log(data)
    })

</script>
</body>
</html>
