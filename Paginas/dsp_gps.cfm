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
      </script>
</head> 
<body>
   
         
   <cfoutput>
    <br>
    <cfset dire = Replace(Trim(FORM.cl_address), " ", "+", "ALL")/>  
    <cfset finaldire ="https://maps.google.com/?q=" & "#dire#">       
     <h2><a href="#finaldire#">#TRIM(FORM.cl_address)#</a></h2>
  
 </tr>
	   
     
 </cfoutput>
  
	 

</body>
</html>
