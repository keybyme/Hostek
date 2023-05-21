
<cfset manCrush = '#Trim(FORM.cl_pass1)#' />
<cfset encryptionKey = generateSecretKey( "AES" ) />
<cfset secret = encrypt(
    manCrush,
    encryptionKey,
    "AES",
    "hex"
    ) />
      
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO Claves   (cl_fk_user_key,
                          cl_url,
                          cl_username,
                          cl_pass1,
                          cl_pass2,
                          cl_cat,
                          cl_llave,
                          cl_remarks)
       VALUES('#Trim(SESSION.Auth.user_key)#',
              '#Trim(FORM.cl_url)#',
              '#Trim(FORM.cl_username)#',
              '#Trim(secret)#',
              '#Trim(FORM.cl_pass2)#',
              '#Trim(FORM.category)#',
              '#Trim(encryptionKey)#',
              '#Trim(FORM.cl_remarks)#')
                     
 </cfquery>
<cflocation url="ListarClavesKB.cfm"> 
                        