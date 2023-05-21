      
<cfquery name="aghno" datasource="wolffdb_dsn">
    INSERT INTO DB_Links (dl_link,
                          dl_link_desc,
                          dl_fk_lc_key,
                          dl_fk_user_key)
       VALUES('#Trim(FORM.dl_link)#', 
              '#Trim(FORM.dl_link_desc)#',
              '#Trim(FORM.dl_fk_lc_key)#',
              3)
                     
 </cfquery>
<cflocation url="DBLinks.cfm"> 
                        