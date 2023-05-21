<!---***********************************************************--->
<!---dsp_cat.cfm--->
<!---***********************************************************--->
<cfinclude template="HeaderFotos.cfm"></cfinclude>
      
<cfquery name="aghno" datasource="wolffdb_dsn">
     INSERT INTO Foto_cat   (cat_desc)
                             
       VALUES('#Trim(FORM.cat_desc)#')
                     
 </cfquery>
<cflocation url="AddEdit.cfm"></cflocation>
                        