	<cfoutput>
	<cfset ws_fecha = now()>  
			    <cfset ws_date = #DateFormat(DateAdd('d', 0, ws_fecha),'yyyy-mm-dd')#> 	 	
	</cfoutput>
      
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO FN_Transacciones (fn_fk_user_key, 
	                       fn_fk_cat_key,
	                       fn_fk_tp_key,
                           fn_yyyymmdd,
                           fn_tienda,
	                       fn_status,
	                       fn_monto)
       VALUES('#Trim(SESSION.Auth.user_key)#',
	          '#Trim(FORM.fn_fk_cat_key)#',
	          '#Trim(FORM.fn_fk_tp_key)#',
	          <cfif #Trim(FORM.fn_yyyymmdd)# GT 0>
              '#Trim(FORM.fn_yyyymmdd)#',
			  <cfelse>	  
				  '#ws_date#',
			  </cfif>	  
              '#Trim(FORM.fn_tienda)#',
	          '#Trim(FORM.fn_status)#',
              '#Trim(FORM.fn_monto)#')
 </cfquery>
<cflocation url="Listar_Transacciones.cfm"> 
	

                        