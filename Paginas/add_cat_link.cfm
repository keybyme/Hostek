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

	<cfinclude template="menu.cfm"></cfinclude>
  
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
    
		<br>
		 
      <p>
		<div>
			
			<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cflocation url="Login.cfm">
          </cfif> 

 <CFFORM ACTION="inc_cat_link.cfm?#CLIENT.URLToken#" METHOD="post">
        <table align="center" bgcolor="#A1A2A1">		
<TR>
   <TH colspan="2">
      <span class="style1"><font size="+1">Add a Category</font></span>
   </TH>
</TR>
<TR>
   <TD><span class="style3">
        Category Description:
   </span></TD>
   <TD>
        <CFINPUT TYPE="Text"     
                 NAME="lc_cat_desc" 
	             MESSAGE="Descripcion is required!"
	             MAXLENGTH="15"
                 REQUIRED="Yes">   
   </TD>
</TR>

 <TR>
 <TD colspan="2" align="center">
      <INPUT TYPE="submit" VALUE="Enter"> 
 </TD> 
</TR>    
</table>
<br>
<br>
<br>
</CFFORM>
			
</div>
	  </p>
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
  </div>
</div>
	 

</body>
</html>
