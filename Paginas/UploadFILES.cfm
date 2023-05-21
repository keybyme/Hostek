<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>FiveStar</title>
</head>

<body>
	
<cfinclude template="menu.cfm"></cfinclude>
	
<div align="center">	
	<br>
  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
<br>
<cfparam name="form.fileUpload" default="">

<cfif len(trim(form.fileUpload))>
  <cfoutput>
  <cffile action="upload"
     fileField="fileUpload" nameconflict="OVERWRITE"
      destination="D:\home\keybyme.com\wwwroot\Nube">
   <cfset ws_link = "https://www.keybyme.com/Nube/">   
  <p>
   You Uploaded #cffile.ClientFileName#.#cffile.ClientFileExt#
      successfully to #cffile.ServerDirectory#.</p>
      <!---#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#--->
    <a href="#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#"  target="_blank">#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#</a>   <br>
       <cfset ws_copiar = "#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#">
<!---===================================     --->  

<input type="text" value= "#ws_copiar#" id="myInput" size="70">
<button onclick="myFunction()">Copy Link</button>

<script>
function myFunction() {
  var copyText = document.getElementById("myInput");
  copyText.select();
  copyText.setSelectionRange(0, 99999)
  document.execCommand("copy");
  alert("Copied the text: " + copyText.value);
}
</script>
<!--- ======================================   --->   
  </cfoutput>      
       
<p><strong>IMPORTANT: Every Saturday at midnight these files in the cloud will be removed.</strong>
</p>       
</cfif>

<form enctype="multipart/form-data" method="post">
  <input type="file" name="fileUpload" /><br />
  <input type="submit" value="Upload File" />
</form> 
      
</div>	
      <br><br>   
</body>
</html>	
