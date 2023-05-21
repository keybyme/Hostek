
      
 
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
            	 
             <cfset td = #Trim(FORM.fn_tienda)#>
             <cfset st = #Trim(FORM.fn_status)#>
	         <cfset ct = #Trim(FORM.fn_fk_cat_key)#>
             <cfset tp = #Trim(FORM.fn_fk_tp_key)#>
				 
	   <cflocation url="L_reportes.cfm?fdU=#fd#&fhU=#fh#&tdU=#td#&stU=#st#&ctU=#ct#&tpU=#tp#"></cflocation>	   
	  		 
       </cfoutput>
                        