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

<CFSET GetClientes.RecordCount=0>
<cfquery name = "GetClientes" dataSource = "wolffdb_dsn">
    Select *
    From ChileClientes
    Where cl_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
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

<cfform name="edit" method="post" action="act_upd_chileClientes.cfm">
	<cfoutput>
        <input type="hidden" name="cl_id_key" value="#GetClientes.cl_id_key#">	
 <!---       <input type="hidden" name="ws_USER" value="#claveUSER#">
        <input type="hidden" name="ws_carro" value="#claveCARRO#">--->
    </cfoutput>
<table align="center">
<cfoutput>    

    <tr>
        <td>Empresa: </td>
        <td><cfinput name="cl_bus_name" value="#GetClientes.cl_bus_name#"></td> 
    </tr>        
    <tr>
        <td>Contacto: </td>
        <td><cfinput name="cl_nombre" value="#GetClientes.cl_nombre#"></td>
    </tr>
    <tr>
        <td>Titulo: </td>
        <td><cfinput name="cl_titulo" value="#GetClientes.cl_titulo#"></td>
    </tr>    
    <tr>
        <td>Telefono:</td>
        <td><cfinput name="cl_telefono" value="#GetClientes.cl_telefono#"></td> 
    <tr>
    <tr>
        <td>Celular:</td>
        <td><cfinput name="cl_celular" value="#GetClientes.cl_celular#"></td> 
    <tr> 
    <tr>
        <td>E-mail:</td>
        <td><cfinput name="cl_email" value="#GetClientes.cl_email#"></td> 
    <tr> 
    <tr>
        <td>web site:</td>
        <td><cfinput name="cl_website" value="#GetClientes.cl_website#"></td> 
    <tr> 
    <tr>
        <td>Address:</td>
        <td><cfinput name="cl_address" value="#GetClientes.cl_address#"></td> 
    <tr>   
    <tr>
        <td>Remarks:</td>
        <td><cfinput name="cl_remarks" value="#GetClientes.cl_remarks#"></td> 
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