<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>KeyByMe</title>
</head>

<body>
	
 
	
<div align="center">	
	<br>
<cfoutput>    
<cfset ws_claveU = #URL.claveU#>
<cfset ws_dest1 = "D:\home\keybyme.com\wwwroot\QR\Ins_Cards\">
<cfset ws_dest_final = ws_dest1 & ws_claveU>   
</cfoutput>    
<cfparam name="form.fileUpload" default="">

<cfif len(trim(form.fileUpload))>
  <cfoutput>
          
  <cffile action="upload"
     fileField="fileUpload" nameconflict="OVERWRITE"
      destination= "#ws_dest_final#">
   <cfset ws_link = "https://www.keybyme.com/QR/Ins_Cards/" & "#ws_claveU#" & "/">   
  <p>
      <cfset cffile.ClientFileName = Replace(cffile.ClientFileName, " ", "%20", "ALL")/>
   You Uploaded #cffile.ClientFileName#.#cffile.ClientFileExt#
      successfully to #cffile.ServerDirectory#.</p>
    
    <a href="#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#"  target="_blank">#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#</a>   <br>
       <cfset ws_copiar = "#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#">
           <cfset ws_copiar = Replace(ws_copiar, " ", "%20", "ALL")/>
           <cflocation url="UpdInsCard.cfm?claveU=#ws_claveU#&wslink=#ws_copiar#">
<!---===================================     --->  

<!---<input type="text" value= "#ws_copiar#" id="myInput" size="70">
<button onclick="myFunction()">Copy Link</button>

<script>
function myFunction() {
  var copyText = document.getElementById("myInput");
  copyText.select();
  copyText.setSelectionRange(0, 99999)
  document.execCommand("copy");
  alert("Copied the text: " + copyText.value);
}
</script>--->
<!--- ======================================   --->   
  </cfoutput>      
             
</cfif>

<form enctype="multipart/form-data" method="post">
  <input type="file" name="fileUpload" /><br />  
  <input type="submit" value="Upload File" />
</form> 
      
</div>	
   
</body>
</html>	
