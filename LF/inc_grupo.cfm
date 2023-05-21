 

 
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO LF_Grupos(g_grupo)
	 VALUES('#Trim(FORM.g_grupo)#')
	</CFQUERY> 
 
	   
<cflocation url="Listar_Grupos.cfm">
