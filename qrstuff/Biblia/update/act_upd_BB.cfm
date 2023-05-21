<cfparam name="url.Criteria" default="1">
<cfif isDefined("form.Criteria")>
   <cfset url.Criteria = trim(form.Criteria)>
</cfif>
<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE Reina_Valera 
SET       
    	         
        rv_contenido_NTV_en  = '#TRIM(Form.rv_contenido_NTV_en)#'
      , rv_contenido_NLT_es  = '#TRIM(Form.rv_contenido_NLT_es)#'
      , rv_contenido_KJV_en = '#TRIM(Form.rv_contenido_KJV_en)#'
      , rv_contenido_NIV_en = '#TRIM(Form.rv_contenido_NIV_en)#'
 		WHERE 
        rv_key = #Form.rv_key#       
</cfquery>

<cfinclude template="update_biblia.cfm">