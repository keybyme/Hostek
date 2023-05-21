<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	<cfinclude template="loginFom.cfm">
    <cfabort>
</cfif>
<cfinclude template="welcome.cfm">

<cfquery name = "GetKids" dataSource = "wolffdb_dsn">
    SELECT  kd_id_key 
          
    FROM QR_Kids 
    
    
</cfquery>
 
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO QR_Kids 
                         (kd_en_id_key,
                          kd_club_id_key,
                          kd_name,
                          kd_last_name,
                          kd_address,
                          kd_city,
                          kd_state,
                          kd_zipcode,
                          kd_apoderado,
                          kd_telephone,
                          kd_dob,
                          kd_matricula,
                          kd_te_id_key,
                          kd_sexo)
       VALUES('#Trim(SESSION.Auth.user_en_id_key)#',   
              '#Trim(FORM.clubSEL)#',
              '#Trim(FORM.FirstName)#',
              '#Trim(FORM.LastName)#',
              '#Trim(FORM.direccion)#',  
              '#Trim(FORM.ciudad)#',
              '#Trim(FORM.estado)#',
              '#Trim(FORM.zipcode)#',
              '#Trim(FORM.apoderado)#',
              '#Trim(FORM.telefono)#',
              '#Trim(FORM.dob)#',
              '#Trim(FORM.matricula)#',
              '#Trim(FORM.teacherSEL)#',
              '#Trim(FORM.accionSX)#') 
                     
 </cfquery>
 AGREGADO !!!   
 <cflocation url="add_kids.cfm">  
                        