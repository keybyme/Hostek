<Style>

   body {margin: 0px;}
   
     .style17 {
 color:#FFFFFF;
	 font-style:oblique;
	 font-size:25px;
	 font-weight:bold;
	 background-color:#FF0000;
 }
   
</style>


<cfquery name = "GetMisc" dataSource = "wolffdb_dsn">
    SELECT QR_Misc.m_id_key,
           QR_Misc.m_titulo,
           QR_Misc.m_subtitulo,
           QR_Misc.m_image,
           QR_Misc.m_parrafo1,
           QR_Misc.m_parrafo2,
           QR_Misc.m_parrafo3,
           QR_Misc.m_parrafo4,
           QR_Misc.m_parrafo5,
           QR_Misc.m_link
    FROM QR_Misc   
         WHERE m_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>
<cfoutput>
  
<cfset numero = "#URL.claveU#">
<cfset foto1 = "fotos/"> 
<cfset foto2 = ".gif"> 
<cfset ws_foto = foto1 & "/" & #numero#  & foto2>
</cfoutput>

 <title>QrStuff Miscellaneus</title>

<table align="center" width="100%" align="center">
 
 <cfoutput query="GetMisc" group="m_id_key">
   <cfoutput>
   
  		 <cfif GetMisc.m_image EQ "1">
   			<tr align="center">
  				<td><img src="#ws_foto#"></td>
			</tr> <br>
   		</cfif>
   		<cfif GetMisc.m_titulo NEQ "NULL">
     		<tr align="center">
    			<td><strong>#TRIM(GetMisc.m_titulo)#</strong></td>
  			</tr>
   		</cfif>
      	<cfif GetMisc.m_subtitulo NEQ "NULL">
     		<tr align="center">
    			<td><strong>#TRIM(GetMisc.m_subtitulo)#</strong></td>
  			</tr>
   		</cfif>
   		<cfif GetMisc.m_parrafo1 NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetMisc.m_parrafo1)#</strong></td>
  			</tr>
   		</cfif>   
   		<cfif GetMisc.m_parrafo2 NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetMisc.m_parrafo2)#</strong></td>
  			</tr>
   		</cfif>       
   		<cfif GetMisc.m_parrafo3 NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetMisc.m_parrafo3)#</strong></td>
  			</tr>
   		</cfif> 
   		<cfif GetMisc.m_parrafo4 NEQ "NULL">
     		<tr>
    			<td><strong>#TRIM(GetMisc.m_parrafo4)#</strong></td>
  			</tr>
   		</cfif>  
   		<cfif GetMisc.m_link EQ "1">
     		<tr>
    			<td><strong><a href="#TRIM(GetMisc.m_parrafo5)#" target="_blank">#TRIM(GetMisc.m_parrafo5)#</a></strong></td>
  			</tr>
   		</cfif>                      
   </cfoutput>
  
  </cfoutput>  
   <tr><td style="font-size:medium">
   <br><br><br><br><br><br>
   <a href="http://www.qrstuff.mobi/qrstuff/M/logout.cfm">Update the information here!</a></td></tr> 
</table>  
 



