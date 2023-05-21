
<CFSET GetLink.RecordCount=0>
<CFQUERY NAME="GetLink" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM   DB_Links 	
    Where dl_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
</CFQUERY>


<cfoutput>
<input type="text" value= "#TRIM(GetLink.dl_link)#" id="myInput" size="70">
<!---<button onclick="myFunction()">Copy Link</button>--->
</cfoutput>
<script>
function myFunction() {
  var copyText = document.getElementById("myInput");
  copyText.select();
  copyText.setSelectionRange(0, 99999)
  document.execCommand("copy"); 
  location.replace("ListarUserLinks.cfm")	
}
</script>
<!--- ======================================   --->   
  	<button onclick="myFunction()">Copy Link</button>
<!---<cflocation url="ListarUserLinks.cfm"></cflocation>--->	