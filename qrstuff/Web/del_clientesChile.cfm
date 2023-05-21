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

<CFSET GetTransacciones.RecordCount=0>
<cfquery name = "GetTransacciones" dataSource = "wolffdb_dsn">
    Select cl_id_key
         , cl_bus_name
         , cl_nombre
         
    From ChileClientes
    Where cl_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        <img src="img/carro.gif" width="30" height="30" />
                        <cfoutput>Delete area </cfoutput>
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

<form name="edit" method="post" action="act_del_ChileClientes.cfm">
	<cfoutput>
 
<!---        <input type="hidden" name="ws_USER3" value="#claveUSER#">
        <input type="hidden" name="ws_carro3" value="#claveCARRO#">--->
    </cfoutput>
<cfoutput>
<table align="center">
    <input type="hidden" name="cl_id_key" value="#GetTransacciones.cl_id_key#">	
     
    <tr>
        <td>Empresa:</td>
        <td><input name="cl_bus_name" value="#GetTransacciones.cl_bus_name#"></td>
    </tr>
    <tr>
        <td>Record:</td>
        <td><input name="cl_nombre" value="#GetTransacciones.cl_nombre#"></td>
    </tr>
          
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Delete"></td>
    </tr>   				
</table>
</cfoutput>
</form>
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