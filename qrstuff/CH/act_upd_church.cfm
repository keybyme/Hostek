
<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE Estrofas 
SET       
       <!--- es_codigo_columna = '#TRIM(Form.es_codigo_columna)#',
        es_linea_nro = '#TRIM(Form.es_linea_nro)#',--->
        es_contenido = '#TRIM(Form.es_contenido)#',
        es_flag_linea = '#TRIM(Form.es_flag_linea)#'
    	 
WHERE 
        es_key = #Form.es_key#       
</cfquery>
 
 <cflocation url="welcome.cfm?claveU=#TRIM(Form.es_cliente)#">

Updated !!!