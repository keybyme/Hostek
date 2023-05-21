
      
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO Reminders (re_fk_user_key,
	                       re_desc,
	                       re_from,
                           re_fecha_start,
                           re_fecha_end,
	                       re_hora, 
	                       re_email,
	                       re_message)
       VALUES('#Trim(SESSION.Auth.user_key)#',
	          '#Trim(FORM.re_desc)#',
	          '#Trim(FORM.re_from)#',
              '#Trim(FORM.re_fecha_start)#',
              '#Trim(FORM.re_fecha_end)#',
              '#Trim(FORM.re_hora)#', 
	          '#Trim(FORM.re_email)#',
	          '#Trim(FORM.re_message)#')
 </cfquery>
<cflocation url="Reminders.cfm"> 
                        