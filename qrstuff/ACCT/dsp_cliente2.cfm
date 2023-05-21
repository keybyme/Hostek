<CFSET GetContador.RecordCount=0>
<CFQUERY NAME="GetContador" datasource="wolffdb_dsn">
  SELECT  *           
  FROM  QR_Contador
  WHERE QR_Contador.c_id_key = '#TRIM(Form.ws_USER2)#'
   
</CFQUERY>
<CFIF GetContador.RecordCount EQ 1>
 
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO QR_Cont_clientes
                         (ccl_fk_c_id_key,
                          ccl_user_name,
                          ccl_password,
                          ccl_razon_social,
                          ccl_rut,
                          ccl_address,
                          ccl_telefono,
                          ccl_email,
                          ccl_contacto)
       VALUES('#TRIM(Form.ws_USER2)#',
              '#Trim(FORM.ccl_user_name)#',
              '#Trim(FORM.ccl_password)#',
              '#Trim(FORM.ccl_razon_social)#',
              '#Trim(FORM.ccl_rut)#',
              '#Trim(FORM.ccl_address)#',
              '#Trim(FORM.ccl_telefono)#',
              '#Trim(FORM.ccl_email)#',
              '#Trim(FORM.ccl_contacto)#')
              
   INSERT INTO QR_CLIENTES
                  (cl_fk_user_name,
                   cl_ap_codigo,
                   cl_multiple)
        VALUES('#Trim(FORM.ccl_user_name)#',
                 101,
                '#TRIM(Form.ws_USER2)#')     
            
    INSERT INTO QR_USUARIOS
                  (user_name,
                   user_password,
                   user_roll_id_key,
                   user_nombre,
                   user_address,
                   user_email,
                   user_phone)
        VALUES('#Trim(FORM.ccl_user_name)#',
                '#Trim(FORM.ccl_password)#',
                30,
                '#Trim(FORM.ccl_contacto)#',                               
                '#Trim(FORM.ccl_address)#',
                '#Trim(FORM.ccl_email)#',
                '#Trim(FORM.ccl_telefono)#')     
 </cfquery>

</CFIF>   
 <cflocation url="../ACCT/ListarClientesAcct.cfm?claveU=#TRIM(GetContador.c_id_key)#"> 
                      