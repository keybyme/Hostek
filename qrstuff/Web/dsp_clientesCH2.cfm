
 
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO ChileClientes 
                         (cl_bus_name,
                          cl_nombre,
                          cl_telefono,
                          cl_celular,
                          cl_email,
                          cl_website,
                          cl_address,
                          cl_remarks,
                          cl_titulo)
       VALUES('#Trim(FORM.cl_bus_name)#',
              '#Trim(FORM.cl_nombre)#',
              '#Trim(FORM.cl_telefono)#',
              '#Trim(FORM.cl_celular)#',
              '#Trim(FORM.cl_email)#',
              '#Trim(FORM.cl_website)#',
              '#Trim(FORM.cl_address)#',
              '#Trim(FORM.cl_remarks)#',
              '#Trim(FORM.cl_titulo)#')
                     
 </cfquery>
<cflocation url="ListarClientesChile.cfm"> 
                        