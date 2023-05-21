<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO QR_Facturas
                         (cf_fk_ccl_id_key,
                          cf_fk_c_id_key,
                          cf_fecha,
                          cf_nro_factura,
                          cf_razon_social,
                          cf_rut,
                          cf_neto,
                          cf_iva,
                          cf_total)
       VALUES('#TRIM(Form.ws_USER2)#',
              '#TRIM(Form.ws_USER3)#',
              '#Trim(FORM.cf_fecha)#',
              '#Trim(FORM.cf_nro_factura)#',
              '#Trim(FORM.cf_razon_social)#',
              '#Trim(FORM.cf_rut)#',
              '#Trim(FORM.cf_neto)#',
              '#Trim(FORM.cf_iva)#',
              '#Trim(FORM.cf_total)#')
              
    
 </cfquery>
  
 <cflocation url="../ACCT/ListarInvoices.cfm?claveU=#TRIM(Form.ws_USER2)#"> 
                                        