<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="my.css">

</head>
<body>

	<cfinclude template="HeaderKBW.cfm"></cfinclude>
  
<div class="container-fluid text-center">    
  <div class="row content">
	  
    <div class="col-sm-8 text-left"> 
      
		
	
		
      <p>
		<div>
 <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="LoginKB.cfm">
          </cfif> 
 <cfif isDefined("form.Criteria")>
    <cfset url.Criteria = trim(form.Criteria)>
</cfif>
<CFSET GetUrl.RecordCount=0>
<CFQUERY NAME="GetUrl" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  [7URLs] 
	<cfif (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '')>
		  Where  tv_desc LIKE '%#Trim(url.Criteria)#%' 
	
    </cfif>	 
  Order by tv_fk_cm_key	
</CFQUERY>
	
<cfform name="disp" method="post" action="Canales.cfm">	 
	<div><p>
	  
       Search:  &nbsp;&nbsp; <input name="Criteria" size="10">	&nbsp;
			<input type="submit" name="editpho" value="Send">
	</p></div>
</cfform>	 
<div>
<p>
	<cfloop query="GetUrl"> 
    <cfoutput> 
	<a href="#TRIM(GetUrl.tv_url)#"><img src="#TRIM(GetUrl.tv_logo)#"></a>
	</cfoutput>
	</cfloop>
</p>
</div>
	  
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
   <!---<cfinclude template="propagandaKB.cfm"></cfinclude>--->
  </div>
</div>
	
	

</body>
</html>
