
      
 
       <cfoutput>
		   
		     <cfif #Trim(FORM.fecha_in)# eq "">
		   		<cfset fd = "">
				<cfset fh = "">
			 <cfelse>
				 <cfset ws_fecha_in = #Trim(FORM.fecha_in)#>		   
	             <cfset fd = #DateFormat(DateAdd('d', 0, ws_fecha_in),'yyyy-mm-dd')#> 
			     <cfset ws_fecha_out = #Trim(FORM.fecha_out)#> 
				 <cfset fh = #DateFormat(DateAdd('d', 0, ws_fecha_out),'yyyy-mm-dd')#>  	 
		     </cfif> 
					 
					 
				   
		<cflocation url="totales.cfm?fdU=#fd#&fhU=#fh#"></cflocation>	 
		<!---<cflocation url="totales.cfm"></cflocation>	--->			 
       </cfoutput>
                        