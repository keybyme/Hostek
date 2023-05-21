<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Links</title>
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


 
<!---<cfset ws_today = #DateFormat("# Now()#", "mmdd")#>
<cfset ws_time = #TimeFormat("# Now()#", "HH")#>  --->
        
<cfquery name = "GetLinks" dataSource = "wolffdb_dsn"> 
    SELECT *
		
    FROM QR_Links
    WHERE lk_username = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar">
   <!--- Where Lectura.lec_fecha = #TRIM(ws_today)#  --->
	
</cfquery>

 <cfset ws_I = 0>
  <table width="100%">
 
  <tr><td>  
    <table width="100%" border="1" align="center">
			        
  		     
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Flag</th> 
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Description</th>
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Link</th>      
 			<cfoutput query="GetLinks" group="lk_id">
 				<cfoutput>
        			<tr>
				    	<cfif ws_I EQ 0>
                 	         <cfset ws_color = bgcolorNo>
                             <cfset ws_I = 1>
                        <cfelse>
                             <cfset ws_color = bgcolorYes>
                             <cfset ws_I = 0>
                        </cfif>  
                    
                          <cfif GetLinks.lk_link_flag_1 EQ 1> 
				        	 <cfoutput>
                                  <cflocation url="#GetLinks.lk_link_1#">
                             </cfoutput>
                          <cfelseif GetLinks.lk_link_flag_2 EQ 1> 
				        	 <cfoutput>
                                  <cflocation url="#GetLinks.lk_link_2#">
                             </cfoutput>   
                          <cfelseif GetLinks.lk_link_flag_3 EQ 1> 
				        	 <cfoutput>
                                  <cflocation url="#GetLinks.lk_link_3#">
                             </cfoutput>     
                          <cfelseif GetLinks.lk_link_flag_4 EQ 1> 
				        	 <cfoutput>
                                  <cflocation url="#GetLinks.lk_link_4#">
                             </cfoutput>   
                          <cfelseif GetLinks.lk_link_flag_5 EQ 1> 
				        	 <cfoutput>
                                  <cflocation url="#GetLinks.lk_link_5#">                                  
                             </cfoutput>   
						  </cfif>
                       
                  </tr>    
				</cfoutput>
			</cfoutput> 
		
     </table>
</td></tr>

</table>

</body>
</html>