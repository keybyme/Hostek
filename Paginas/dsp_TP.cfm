
      
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO FN_Tipo_Pagos (tp_fk_user_key, 
	                       tp_desc,
	                       tp_limite,
                           tp_link)
       VALUES('#Trim(SESSION.Auth.user_key)#',
	          '#Trim(FORM.tp_desc)#',
	          '#Trim(FORM.tp_limite)#',
              '#Trim(FORM.tp_link)#')
 </cfquery>
<cflocation url="Listar_Tipos_Pagos.cfm"> 
                        