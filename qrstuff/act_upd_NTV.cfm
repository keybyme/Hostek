<cfparam name="url.Criteria" default="1">
<cfif isDefined("form.Criteria")>
   <cfset url.Criteria = trim(form.Criteria)>
</cfif>
<cfquery name="editemp" datasource="wolffdb_dsn">

UPDATE Reina_Valera 
SET       
    	         
        rv_contenido_NTV  = '#TRIM(Form.rv_contenido_NTV)#'
      , rv_contenido_NLT  = '#TRIM(Form.rv_contenido_NLT)#'
 		WHERE 
        rv_key = #Form.rv_key#       
</cfquery>

<cfinclude template="Listar_biblia.cfm">