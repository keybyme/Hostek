<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  
        QR_Usuarios.user_name
  FROM  QR_Usuarios
  WHERE QR_Usuarios.user_name = '#TRIM(Form.codigo)#'
</CFQUERY>
<CFIF GetUser.RecordCount EQ 0>
 
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO QR_Usuarios 
                         (user_name,
                          user_password,
                          user_roll_id_key)
       VALUES('#TRIM(Form.codigo)#',
              1234,
              50)
              
 
     INSERT INTO QR_Links
                         (lk_username,
                          lk_link_1,
                          lk_link_flag_1)
       VALUES('#TRIM(Form.codigo)#',
              'www.qrcodetech.com',
              1)   
              
     INSERT INTO QR_Clientes
                         (cl_fk_user_name,
                          cl_ap_codigo)
       VALUES('#TRIM(Form.codigo)#',
              555)                          
                     
 </cfquery>
   
 <cflocation url="welcome.cfm"> 
<cfelse>
 <cflocation url="welcome.cfm"> 
</CFIF>                        