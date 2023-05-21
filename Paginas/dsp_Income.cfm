	<cfoutput>
	<cfset ws_fecha = now()>  
			    <cfset ws_date = #DateFormat(DateAdd('d', 0, ws_fecha),'yyyy-mm-dd')#> 	 	
	</cfoutput>
      
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO FN_Income (i_fk_user_key,  
                           i_fecha,
                           i_monto,
	                       i_from)
       VALUES('#Trim(SESSION.Auth.user_key)#', 
	          <cfif #Trim(FORM.i_fecha)# GT 0>
              '#Trim(FORM.i_fecha)#',
			  <cfelse>	  
				  '#ws_date#',
			  </cfif>	   
	          '#Trim(FORM.i_monto)#',
              '#Trim(FORM.i_from)#')
 </cfquery>
<cflocation url="Income.cfm"> 
	

                        