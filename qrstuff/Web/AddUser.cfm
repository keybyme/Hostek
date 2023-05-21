<CFSET GetUsuario.RecordCount=0>
<CFQUERY NAME="GetUsuario" datasource="wolffdb_dsn">
  SELECT  
         QR_Usuarios.user_name            
  FROM  QR_Usuarios
  WHERE QR_Usuarios.user_name = '#Form.username#'
   
</CFQUERY>

<CFIF GetUsuario.RecordCount EQ 1>
     <cflocation url="loginForm.cfm?action=4"> 
     <cfabort>
</CFIF>     
 
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO QR_Usuarios
                         (user_name,
                          user_password,
                          user_roll_id_key,
                          user_nombre,
                          user_apellido,
                          user_address,
                          user_email,
                          user_phone,
                          user_cellphone)
       VALUES('#Trim(FORM.username)#',
              '#Trim(FORM.UserPassword)#',
              30,
              '#Trim(FORM.nombre)#',
              '#Trim(FORM.apellido)#',
              '#Trim(FORM.address)#',
              '#Trim(FORM.email)#',
              '#Trim(FORM.telephone)#',
              '#Trim(FORM.cellphone)#')
                     
      INSERT INTO QR_CLIENTES
                       (cl_fk_user_name,
                        cl_ap_codigo)
       VALUES('#Trim(FORM.username)#',
              '#Trim(FORM.app)#')
              
    INSERT INTO QR_Contador
                         (c_user_name,
                          c_password,
                          c_nombre,
                          c_telefono,
                          c_email,
                          c_address)
       VALUES('#Trim(FORM.username)#',
              '#Trim(FORM.UserPassword)#',
              '#Trim(FORM.nombre)#',
              '#Trim(FORM.telephone)#',
              '#Trim(FORM.email)#',
              '#Trim(FORM.address)#')              
                                                                  
 </cfquery>
<!--- ==============================================================================================--->


<cfmail to="911@wolff.cl"
        from="info@QRcodeTech.com" 
        subject="NEW CUSTOMER !!!"
        server="mail.wolff.cl"
        username="correo@wolff.cl"
        password="77jcwv##"
        failto="gideon@wesnetwork.com"
        port = "25"> 
  Nombre = #Trim(FORM.nombre)# <br>
  Apellido = #Trim(FORM.apellido)# <br>
  username = #Trim(FORM.username)# <br>
  UserPassword = #Trim(FORM.UserPassword)# <br>
  E-mail = #Trim(FORM.email)# <br>
  DATE/TIME: #DateFormat(now(),"mmm, dd yyyy")# #TimeFormat(now(),"HH:mm:ss")# (+2) <br>    
</cfmail>  

  <cfif '#Trim(FORM.app)#' EQ 100 or '#Trim(FORM.app)#' EQ 101>
  
    <cflocation url="updateContadores.cfm?claveU=#Trim(FORM.username)#">
  </cfif>   
  
 <cflocation url="loginForm.cfm?action=8">  
                        