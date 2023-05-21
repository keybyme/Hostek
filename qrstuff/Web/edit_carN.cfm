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
<!---<cfinclude template="Header.cfm">--->

<CFSET GetVehiculo.RecordCount=0>
<cfquery name = "GetVehiculo" dataSource = "wolffdb_dsn">
    Select *
    From QR_Cars
    Where car_id_key = <cfqueryparam value="#URL.claveR#" cfsqltype="cf_sql_numeric"> 
</cfquery>
<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        <img src="img/carro.gif" width="30" height="30" />
                        <cfoutput>Update area</cfoutput>
                        <img src="img/carro.gif" width="30" height="30" />
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
            
<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_edit_carsN.cfm">
	<cfoutput>
        <input type="hidden" name="car_id_key" value="#GetVehiculo.car_id_key#">	 
    </cfoutput>
<table align="center">
<cfoutput>    
       
    <tr>
        <td>Vehicle: </td>
        <td><cfinput name="car_name" value="#GetVehiculo.car_name#"></td>
    </tr>
    <tr>
        <td>Ins. Company: </td>
        <td><cfinput name="car_ins_company" value="#GetVehiculo.car_ins_company#"></td>
    </tr>  
	<tr>
        <td>Policy Number: </td>
        <td><cfinput name="car_policy_number" value="#GetVehiculo.car_policy_number#"></td>
    </tr> 
	<tr>
        <td>Ins. Telephone: </td>
        <td><cfinput name="car_ins_phone" value="#GetVehiculo.car_ins_phone#"></td>
    </tr> 
    <tr>
        <td>Password:</td>
        <td><cfinput name="rc_password"  type="password" value=""></td> 
    <tr>
    </tr>
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
    </tr>   				
</table>
</cfoutput> 
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