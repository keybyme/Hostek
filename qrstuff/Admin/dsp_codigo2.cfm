<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	<cfinclude template="loginFom.cfm">
    <cfabort>
</cfif>
<cfinclude template="../menu/heading.cfm">
<a href="../Admin/logout.cfm">Log out</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<cfquery name = "GetCodigos" dataSource = "wolffdb_dsn">
    SELECT  cd_id_key 
          
    FROM QR_Codigos 
    
    
</cfquery>
 
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO QR_Codigos 
                         (cd_codigo,
                          cd_flag_1_activo,
                          cd_fecha_activo)
       VALUES('#Trim(FORM.cd_codigo)#',
              '#Trim(FORM.cd_flag_1_activo)#',
              '#Trim(FORM.cd_fecha_activo)#')
                     
 </cfquery>
 AGREGADO !!!   
 <cflocation url="welcome.cfm">  
                        