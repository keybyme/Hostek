<CFIF NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
   <cflocation url="LoginKB.cfm">
  <CFABORT>
</CFIF>

<cfquery name="cats" datasource="wolffdb_dsn">
	SELECT *
	FROM Categorias_X
	WHERE cat_desc = '#TRIM(FORM.cat_desc)#'
			AND cat_fk_user_key = '#SESSION.Auth.user_key#'
</cfquery>


<cfif cats.RecordCount EQ 0>
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO Categorias_X(cat_desc,
						   cat_fk_user_key)
	 VALUES('#Trim(FORM.cat_desc)#', 
		   '#Trim(SESSION.Auth.user_key)#')
	</CFQUERY>
<!---	<cfset mensaje = 'Folder "#Trim(FORM.cat_desc)#" was created'>
	<cflocation url="ListarClavesKB.cfm?mensaje=#mensaje#" addtoken="yes">	
<cfelse>
	<cfset error = 'This folder is already there, can not be duplicated'>
	<cflocation url="ListarClavesKB.cfm?error=#error#" addtoken="yes">--->
</cfif>
	   
<cflocation url="ListarClavesKB.cfm">
