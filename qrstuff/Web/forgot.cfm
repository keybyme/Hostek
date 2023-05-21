<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>QRcodeTech.com</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
	<!--[if IE]><style type="text/css" media="screen"> #navigation ul li a em { top:32px; } </style><![endif]-->
	
	<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<script src="js/jquery-func.js" type="text/javascript"></script>

<Style>

   body {margin: 0px;}
   
.b1 {
	color: #006;
	font-size: 16px;
	font-weight: bold;
}
</style>
</head>

<body>
<cfinclude template="Header.cfm">
<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                       
                        <cfoutput>Forgot username/password?</cfoutput>
                      
                        </span></h2>
	     </div>
	</div>
</div>
<div id="main">
	<div class="shell">		
		<!-- Cols -->
		<div class="cols">
			<div class="cl">&nbsp;</div>
			
			<!-- Col -->
			<div class="col1"> 
  

<cfform name="Fpassword" method="post" action="pedirpass.cfm">

<table align="center">
    <TR align="center">
     
      <TH bgcolor="#F2F1D7">Enter Username:</TH>
      <TD>

      <CFINPUT 
        TYPE="Text"
        NAME="username"
        SIZE="20"
        VALUE=""
        MAXLENGTH="100">

      </TD>
    </tr>
    <tr align="center">
    <td>
        <br><h1>OR</h1><br>
    </td>
    </tr>
    <tr align="center">
     
      <TH bgcolor="#F2F1D7">Enter your E-mail:</TH>
      <TD>
    
      <CFINPUT 
        TYPE="Text"
        NAME="email"
        SIZE="20"
        VALUE=""
        MAXLENGTH="100"
        required="yes"
        message="Please,Enter E-mail to contact you">    

      </TD>
      </tr>
      <tr>
      </TD>
	  <td colspan="2">
		   <div align="center">
		  
	<br>	     <input type="Submit" value="Send" style="font-size:larger">
	   	     </div></td>
    </TR>
    <tr>
    <td colspan="3">
    <br>Your username/password will be send to your email address<br>
        after we confirm yur identity. Tnank you.
    </td>
    <tr>
</table> 

</cfform>
</div>
			<!-- End Col -->
			
			<div class="cl">&nbsp;</div>
		</div>
		<!-- End Cols -->
		
	</div>
</div>
 
<!-- Footer -->
<cfinclude template="footer.cfm">
<!-- End Footer -->
</body>
</html>