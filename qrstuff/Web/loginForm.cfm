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
                       
                        <cfoutput>Login </span>area</cfoutput>
                      
                        </h2>
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
<cfparam name="url.action" default="">
<cfif url.action eq 2>
   <cfset url.action="">
   
   <font color="red">Invalid Username and/or Password </font>
<cfelseif url.action eq 4>
   <cfset url.action="">
   
   <font color="red" size="+1">User name already exist, Please try a new one! </font>   
<cfelseif url.action eq 5>
   <cfset url.action="">
   
   <font color="red">Your notification has been sent, we will contact you soon! </font>   
<cfelseif url.action eq 8>
   <cfset url.action="">
   
   <font color="red">Congratulations!, you may now log in.</font>    
<cfelseif url.action eq 9>
   <cfset url.action="">
   
   <font color="red">Personal profile has been updated!.</font>    

</cfif>   

<cfform name="LoginUser" method="post" action="LoginCheck.cfm">
<table>
<tr>
<td>
<table align="center">
    <TR align="center">
      <TD>     
      </TD>
      <TH bgcolor="#F2F1D7">Username:</TH>
      <TD>
        
      <!--- Text field for "User Name" --->  
      <CFINPUT 
        TYPE="Text"
        NAME="UserLogin"
        height="2"
        SIZE="15"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Please, Enter username.">

      </TD>
      <TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </TD>
      <TH bgcolor="#F2F1D7">Password:</TH>
      <TD>
    
      <!--- Text field for Password --->  
      <CFINPUT 
        TYPE="Password"
        NAME="UserPassword"
        height="2"
        SIZE="15"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Please, Enter password.">

      <!--- Submit Button that reads "Enter" --->  
      </TD>
      <TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </TD>
	  <td colspan="2">
		   <div align="center">
		  
		     <input type="Submit" value="Log in" style="font-size:larger">
	   	     </div></td>
                  
    </TR>

    <tr align="right"><td colspan="9"><a href="forgot.cfm"><small><tt>Forgot username/password?</tt></small></a></td></tr>
    <tr><td colspan="9"><br><br></td></tr>    
    <tr align="center">
    <td class="b1" align="center" colspan="9">
     
      This area is for QRcodeTech's customer to access their apps. 
    </td>
    </tr>
</table> 
</td>
<td valign="top" rowspan="5">
<table width="350">
<tr valign="top">
       <td valign="top">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="signup.cfm"><strong>New Customers Sign Up here!</strong></a>
       </td>
</tr>
</table>        
</td>
</tr>
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