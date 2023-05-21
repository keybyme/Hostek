
      
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO FN_Categorias (cat_fk_user_key, 
	                       cat_desc)
       VALUES('#Trim(SESSION.Auth.user_key)#',
	          '#Trim(FORM.cat_desc)#')
 </cfquery>
<cflocation url="Listar_Categorias.cfm"> 
                        