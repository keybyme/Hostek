<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>Upload logo</title>  
</head>  
  
<body>  
<cfinclude template="../menu/heading.cfm">
<h2 style="color:DodgerBlue">Upload Logo</h2>  

<cfoutput>
<cfset numero = "#URL.claveU#">
<cfset ubicacion = "D:\inetpub\iglesiaelmesias\QRstuff\BC\logos\"> 
<cfset ubicacionF = ubicacion & #numero# & "\">
</cfoutput>
  
<cfset UploadFolder="C:\Upload">  
<cfif IsDefined("Form.UploadFile") AND Form.UploadFile NEQ "">  
<cfoutput>
 <cffile   
     action="upload"   
        filefield="UploadFile"   
        destination="#ubicacionF#"   
        nameconflict="overwrite"  
        >  
 </cfoutput>      
 File uploaded successfully!  
    <br />  
    Uploaded file: <cfoutput>#cffile.ClientFile#</cfoutput>  
<cfelse>  
 Select a file first!          
</cfif>  
   
<form name="UploadForm" method="post" enctype="multipart/form-data" action="">  
 <input type="file" name="UploadFile">  
    <input type="submit"  name="submit" value="Upload"/>  
</form>  
<br><br>
<cfform name="LGedit" method="post" action="welcome.cfm?claveU=#SESSION.Auth.bc_id_key#">
 
        <input type="submit" name="editemp4" value="Go back">
</cfform>  
</body>  
</html> 