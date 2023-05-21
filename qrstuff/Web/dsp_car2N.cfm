<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  
         QR_Usuarios.user_name, 
         QR_Usuarios.user_password            
  FROM  QR_Usuarios
  WHERE QR_Usuarios.user_name = '#TRIM(Form.ws_USER2)#'
    And QR_Usuarios.user_password = '#TRIM(Form.Tpassword)#' 
   
</CFQUERY>
<CFIF GetUser.RecordCount EQ 1>
 
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO QR_car_records 
                         (rc_fk_car_id_key,
                          rc_date,
                          rc_millas,
                          rc_record)
       VALUES('#URL.claveR#',
              '#Trim(FORM.rc_date)#',
              '#Trim(FORM.rc_millas)#',
              '#Trim(FORM.rc_record)#')
                     
 </cfquery>
   
 <cflocation url="ListarCarsN.cfm?claveU=#URL.claveR#"> 
<cfelse>
 <cflocation url="ListarCarsN.cfm?claveU=#URL.claveR#"> 
</CFIF>                        