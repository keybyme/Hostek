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
 
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  
         QR_Usuarios.user_name, 
         QR_Clientes.cl_fk_user_name,
         QR_Clientes.cl_ap_codigo,
         QR_Clientes.cl_multiple, QR_Apps.ap_codigo, QR_Apps.ap_name                
  FROM  QR_Usuarios INNER JOIN QR_Clientes ON
        QR_Usuarios.user_name = QR_Clientes.cl_fk_user_name 
    LEFT JOIN QR_Apps ON
        QR_Clientes.cl_ap_codigo = QR_Apps.ap_codigo
  WHERE QR_Usuarios.user_name = <cfqueryparam value="#URL.userU#" cfsqltype="cf_sql_varchar">
        order by cl_ap_codigo    
   
</CFQUERY>


<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                         
                        <cfoutput>Apps cliente  &nbsp;&nbsp;</span>#TRIM(GetUser.user_name)#</cfoutput>
                         
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

               
<table border="2" bgcolor="#99CCCC" width="982">
   <tr>
     <th colspan="8">
        <cfoutput>
        <a href="add_cliente.cfm">Add Apps</a>
        </cfoutput>     
     </th>
   </tr>
   <tr>
        
        <th style="color:#006" bgcolor="#CCCCCC">Apps</th>
        <th style="color:#006" bgcolor="#CCCCCC">Multiple</th>
            
    </tr>      

 <cfoutput query="GetUser" group="user_name">       
 <cfoutput>  
 <tr>
 
 
  <td>#TRIM(GetUser.ap_name)#</td>
  <td>#TRIM(GetUser.cl_multiple)#</td>
                  
    
<!---  <td align="center"><a href="upd_car.cfm?claveU=#GetTransacciones.rc_id_key#&claveUSER=#GetCar.user_name#&claveCARRO=#GetCar.car_name#&action=1">
  <img src="img/ico-edit.gif" width="16" height="16">
  <td align="center"><a href="del_car.cfm?claveU=#GetTransacciones.rc_id_key#&claveUSER=#GetCar.user_name#&claveCARRO=#GetCar.car_name#&action=2">
    <img src="img/ico-eliminar2.gif" width="20" height="20">--->
  </td></a>
 </tr>
 </cfoutput>
 </cfoutput>
 
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