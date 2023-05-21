<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>Mimi's Travel</title>
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
                       
                        <cfoutput>Sign up</span></cfoutput>
                      
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


<cfform name="LoginUser" method="post" action="AddUser.cfm">

<table>
    <tr>
    <td colspan="3">
       <h3><strong>Please enter your information to register</strong></h3>
    </td>
    </tr>
    <TR>
      <TH bgcolor="#F2F1D7" align="left">Username:</TH>
      <TD>
      <CFINPUT 
        TYPE="Text"
        NAME="username"
        SIZE="30"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Please, Enter username.">
       </TD>
    </TR>
    <tr>  
      <TH bgcolor="#F2F1D7" align="left">Password:</TH>
      <TD> 
      <CFINPUT 
        TYPE="Password"
        NAME="UserPassword"
        SIZE="30"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Please, Enter password.">  
      </TD>
      </tr>
   <TR>
      <TH bgcolor="#F2F1D7" align="left">Name:</TH>
      <TD>
      <CFINPUT 
        TYPE="Text"
        NAME="nombre"
        SIZE="30"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Please, Enter your name.">
       </TD>
    </TR>  
   <TR>
      <TH bgcolor="#F2F1D7" align="left">Last name:</TH>
      <TD>
      <CFINPUT 
        TYPE="Text"
        NAME="apellido"
        SIZE="30"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Please, Enter your last name.">
       </TD>
    </TR>
   <TR>
      <TH bgcolor="#F2F1D7" align="left">Address:</TH>
      <TD>
      <CFINPUT 
        TYPE="Text"
        NAME="address"
        SIZE="30"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Please, Enter your address.">
       </TD>
    </TR>            
   <TR>
      <TH bgcolor="#F2F1D7" align="left">E-mail:</TH>
      <TD>
      <CFINPUT 
        TYPE="Text"
        NAME="email"
        SIZE="30"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Please, Enter your email.">
       </TD>
    </TR> 
   <TR>
      <TH bgcolor="#F2F1D7" align="left">Telephone:</TH>
      <TD>
      <CFINPUT 
        TYPE="Text"
        NAME="telephone"
        SIZE="30"
        VALUE=""
        MAXLENGTH="100">
       </TD>
    </TR> 
   <TR>
      <TH bgcolor="#F2F1D7" align="left">Cellphone:</TH>
      <TD>
      <CFINPUT 
        TYPE="Text"
        NAME="cellphone"
        SIZE="30"
        VALUE=""
        MAXLENGTH="100">
       </TD>
    </TR>   
   
    <tr>    
	  <td colspan="2">
		   <div align="center">
		  
		     <input type="Submit" value="Sign up" style="font-size:larger">
	   	     </div></td>
         
    </TR>

   
</table> 

</cfform>
</div>
		
		
	</div>
</div>

</body>
</html>