<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>QRcodeTech.com</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
	<!--[if IE]><style type="text/css" media="screen"> #navigation ul li a em { top:32px; } </style><![endif]-->
	
	<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<script src="js/jquery-func.js" type="text/javascript"></script>
<Style>

   body {margin: 0px;}
   
body,td,th {
	font-size: 16px;
	color: #000066;
	font-weight: bold;
	font-style: italic;
}
a:link {
	color: #F00;
}
</style>
<style type="text/css">
p {color:blue;}
</style>
</head>

<body>

<cfinclude template="Header.cfm">
 
<cfquery name = "GetUser" dataSource = "wolffdb_dsn">
    SELECT user_name,
           user_password,
           user_roll_id_key,
           user_nombre,
           user_apellido,
           user_address,
           user_email,
           user_phone,
           user_cellphone
    FROM QR_Usuarios
         
    WHERE user_name = '#TRIM(SESSION.Auth.user_name)#'
    
</cfquery>

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                    
                        <cfoutput>#GetUser.user_name# &nbsp;&nbsp;</span>Information</cfoutput>
                      
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
<cfform name="edit" method="post" action="act_upd_profile.cfm">
	<cfoutput>	
        <input type="hidden" name="H_pro_fk_user_name" value="#GetUser.user_name#">
 
    </cfoutput>    
               
<table align="center" border="2" bgcolor="#99CCCC">
 <cfoutput>  
	<tr>
        <td>Password:</td><td><cfinput name="Npassword" value="" size="55"></td>
    </tr>
    <tr>
        <td>Nombre: </td>
        <td><cfinput name="user_nombre" value="#GetUser.user_nombre#" size="55"></td>
    </tr> 
	<tr>
        <td>Apellido: </td>
        <td><cfinput name="user_apellido" value="#GetUser.user_apellido#" size="55"></td>
   </tr>
   <tr>
        <td>Address: </td>
        <td><cfinput name="user_address" value="#GetUser.user_address#" size="55"></td>
    </tr>                           
        <td>Telephone: </td>
        <td><cfinput name="user_phone" value="#GetUser.user_phone#" size="55"></td>
    </tr>                             
	<tr>
        <td>Cellphone: </td>
        <td><cfinput name="user_cellphone" value="#GetUser.user_cellphone#" size="55"></td>
    <tr>
        <td>E-mail: </td>
        <td><cfinput name="user_email" value="#GetUser.user_email#" size="55"></td>
    </tr>         
              
 	</cfoutput>
    <tr>
       	<td><input type="submit" name="editemp" value="Update">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
       <td align="right">
</cfform>
<cfform name="LGedit" method="post" action="welcome.cfm">
 
        <input type="submit" name="editemp2" value="Back to menu">
</cfform>  
</td>
</tr>
    
</table>
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