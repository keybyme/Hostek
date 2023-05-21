<cfoutput>
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *                   
  FROM  Usuarios 
  where user_name = '#Trim(FORM.user_name)#'
</CFQUERY>
</cfoutput>

<cfif GetUser.RecordCount eq 0>

<cfset manCrush = '#Trim(FORM.user_password)#' />
<cfset encryptionKey = generateSecretKey( "AES" ) />
<cfset secret = encrypt(
    manCrush,
    encryptionKey,
    "AES",
    "hex"
    ) />
      
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO Usuarios (user_name,
                          user_password,
                          user_nombre,
                          user_apellido,
                          user_email,
                          user_fk_cia_key,
                          user_role,
                          user_address,
                          user_llave,
	                      user_celular)
       VALUES('#Trim(FORM.user_name)#',
              '#secret#',
              '#Trim(FORM.user_nombre)#',
              '#Trim(FORM.user_apellido)#',
              '#Trim(FORM.user_email)#',
              '#Trim(FORM.user_fk_cia_key)#',
              '#Trim(FORM.user_role)#',
              '#Trim(FORM.user_address)#',
              '#encryptionKey#',
	          '#Trim(FORM.user_celular)#')
                     
 </cfquery>
<cflocation url="ListarUsuarios.cfm"> 

<cfelse>
    <cfoutput>username #Trim(FORM.user_name)# already exit</cfoutput>

</cfif>
                        