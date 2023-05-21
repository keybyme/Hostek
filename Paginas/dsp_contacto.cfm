
      
<cfquery name="aghno" datasource="wolffdb_dsn">
     INSERT INTO Contactos   (cl_fk_user_key
	                         , cl_nombre
	                         , cl_apellido
                             , cl_email
                             , cl_address
                             , cl_phone
                             , cl_celular
	                         , cl_carrier)
       VALUES(#SESSION.Auth.user_key#
	         , '#Trim(FORM.cl_nombre)#'
             , '#Trim(FORM.cl_apellido)#'
             , '#Trim(FORM.cl_email)#'
             , '#Trim(FORM.cl_address)#'
             , '#Trim(FORM.cl_phone)#'
	         , '#Trim(FORM.cl_celular)#'
	         , '#Trim(FORM.cl_carrier)#')
                     
 </cfquery>
<cflocation url="ListarContactos.cfm"> 
                        