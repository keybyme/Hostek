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
	color: black;
	font-weight: bold;
	font-style: normal;
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
 
<cfquery name = "GetCar" dataSource = "wolffdb_dsn">
    SELECT QR_Cars.car_id_key
         , QR_Cars.car_fk_user_name
         , QR_Cars.car_name
         , QR_Cars.car_ins_company
         , QR_Cars.car_policy_number
         , QR_Cars.car_ins_phone
         , QR_Usuarios.user_name
         , QR_Usuarios.user_password         
    FROM QR_Cars LEFT OUTER JOIN QR_Usuarios ON
         QR_Cars.car_fk_user_name = QR_Usuarios.user_name
    WHERE car_fk_user_name = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar"> 
      and car_name = <cfqueryparam value="#URL.claveU2#" cfsqltype="cf_sql_varchar">
</cfquery>

<CFSET GetTransacciones.RecordCount=0>
<cfquery name = "GetTransacciones" dataSource = "wolffdb_dsn">
    Select rc_id_key
         , rc_fk_car_id_key
         , rc_date
         , rc_record 
         , rc_millas 
    From QR_car_records
    Where rc_fk_car_id_key = #TRIM(GetCar.car_id_key)#
    order by rc_date desc
</cfquery>
<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        <img src="img/carro.gif" width="30" height="30" />
                        <cfoutput>#GetCar.car_name# &nbsp;&nbsp;</span>Maintenance</cfoutput>
                        <img src="img/carro.gif" width="30" height="30" />
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
            <table width="982"><tr><td>
            <small>
              <cfoutput>Insurance company: &nbsp;
                        #GetCar.car_ins_company# &nbsp;&nbsp;&nbsp;
                        Phone number:  &nbsp;
                        #GetCar.car_ins_phone# &nbsp;&nbsp;&nbsp;
                        Policy:  &nbsp;
                        #GetCar.car_policy_number# 
                        </cfoutput>
             </small>  
              <table cellpadding="2" cellspacing="2" border="0"  bgcolor="#c0c0c0" width="982" align="center" bordercolor="#000033">
   <tr>
     <th colspan="5" style="color:#FFFFFF" bgcolor="#cccccc">
        <cfoutput>
        <a href="add_car.cfm?claveR=#TRIM(GetCar.car_id_key)#&claveCARRO=#GetCar.car_name#&claveUSER=#GetCar.user_name#"> Add a Record</a>
        </cfoutput>     
     </th>
   </tr>
   <tr>
        <th style="color:#black" bgcolor="#CCCCCC" width="100">Date</th>
        <th style="color:#black" bgcolor="#CCCCCC">Miles/kms</th>
        <th style="color:#black" bgcolor="#CCCCCC">Activity</th>
        <th style="color:#black" bgcolor="#CCCCCC">Edit</th>
        <th style="color:#black" bgcolor="#CCCCCC">Delete</th>
    </tr>      

 <cfoutput query="GetTransacciones" group="rc_fk_car_id_key">        
 <cfoutput>  
 <tr>
  <td>#DATEFORMAT(TRIM(GetTransacciones.rc_date),"mm/dd/yyyy")#</td>
  <td>#TRIM(GetTransacciones.rc_millas)#</td>
  <td>#TRIM(GetTransacciones.rc_record)#</td>
  <td align="center"><a href="upd_car.cfm?claveU=#GetTransacciones.rc_id_key#&claveUSER=#GetCar.user_name#&claveCARRO=#GetCar.car_name#&action=1">
  <img src="img/ico-edit.gif" width="16" height="16">
  <td align="center"><a href="del_car.cfm?claveU=#GetTransacciones.rc_id_key#&claveUSER=#GetCar.user_name#&claveCARRO=#GetCar.car_name#&action=2">
    <img src="img/ico-eliminar2.gif" width="20" height="20">
  </td></a>
 </tr>
 </cfoutput>
 </cfoutput>
 </td>
 </td>
</table>
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