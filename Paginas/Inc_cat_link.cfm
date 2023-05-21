<CFIF NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
   <cflocation url="LoginKB.cfm">
  <CFABORT>
</CFIF>

<cfquery name="cats" datasource="wolffdb_dsn">
	SELECT *
	FROM DB_Links_Cat
	WHERE lc_cat_desc = '#TRIM(FORM.lc_cat_desc)#'
</cfquery>


<cfif cats.RecordCount EQ 0>
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO DB_Links_Cat(lc_cat_desc)
	 VALUES('#Trim(FORM.lc_cat_desc)#')
	</CFQUERY>
<!---	<cfset mensaje = 'Folder "#Trim(FORM.cat_desc)#" was created'>
	<cflocation url="ListarClavesKB.cfm?mensaje=#mensaje#" addtoken="yes">	
<cfelse>
	<cfset error = 'This folder is already there, can not be duplicated'>
	<cflocation url="ListarClavesKB.cfm?error=#error#" addtoken="yes">--->
</cfif>
	   
<cflocation url="ListarCatLinks.cfm">
