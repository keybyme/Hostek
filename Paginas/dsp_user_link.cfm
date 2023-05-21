<!---***********************************************************--->
<!---dsp_vendor.cfm--->
<!---***********************************************************--->

<cfset GetLink.RecordCount=0>
<cfquery name="GetLink" datasource="wolffdb_dsn">
	  Select *
		From User_Links
        where me_fk_user_key = #Trim(FORM.user_key)# and
              me_fk_dl_key = #Trim(FORM.dl_key)#
</cfquery>

<cfif GetLink.RecordCount eq 0>	
	
   <cfquery name="aghno" datasource="wolffdb_dsn">
     INSERT INTO User_Links (me_fk_user_key
                            ,me_fk_dl_key)
       VALUES('#Trim(FORM.user_key)#'
             ,'#Trim(FORM.dl_key)#') 
                     
    </cfquery>
	
</cfif>	
	
<cflocation url="ListarUserLinks.cfm"></cflocation>
                        