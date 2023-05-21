<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>QRcodeTech.com</title>
	<link rel="stylesheet" href="../Web/css/style.css" type="text/css" media="all" />
	<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
	<!--[if IE]><style type="text/css" media="screen"> #navigation ul li a em { top:32px; } </style><![endif]-->
	
	<script src="../Web/js/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src="../Web/js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<script src="../Web/js/jquery-func.js" type="text/javascript"></script>
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
<cfinclude template="../Web/Header.cfm">

<CFSET GetClientes.RecordCount=0>
<cfquery name = "GetClientes" dataSource = "wolffdb_dsn">
    Select * 
    From QR_Cont_Clientes
    Where ccl_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>
<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                      
                        <cfoutput>Actualizar Cliente</cfoutput>
                     
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

<cfform name="edit" method="post" action="../ACCT/act_upd_clientes.cfm">
	<cfoutput>
        <input type="hidden" name="ccl_id_key" value="#GetClientes.ccl_id_key#">	
        <input type="hidden" name="ccl_fk_c_id_key" value="#GetClientes.ccl_fk_c_id_key#">
       <!--- <input type="hidden" name="ws_carro" value="#claveCARRO#">--->
    </cfoutput>
<table align="center">
<cfoutput>    
       
    <tr>
        <td>user_name: </td>
        <td><cfinput name="ccl_user_name" value="#GetClientes.ccl_user_name#"></td>
    </tr>
    <tr>
        <td>Password: </td>
        <td><cfinput name="ccl_password" value="#GetClientes.ccl_password#"></td>
    </tr>    
    <tr>
        <td>Razon Social:</td>
        <td><cfinput name="ccl_razon_social"  value="#GetClientes.ccl_razon_social#"></td> 
    </tr>
    <tr>
        <td>R.U.T.: </td>
        <td><cfinput name="ccl_rut" value="#GetClientes.ccl_rut#"></td>
    </tr>
    <tr>
        <td>Direccion: </td>
        <td><cfinput name="ccl_address" value="#GetClientes.ccl_address#"></td>
    </tr>    
    <tr>
        <td>Telefono:</td>
        <td><cfinput name="ccl_telefono"  value="#GetClientes.ccl_telefono#"></td> 
    </tr> 
    <tr>
        <td>E-mail: </td>
        <td><cfinput name="ccl_email" value="#GetClientes.ccl_email#"></td>
    </tr>    
    <tr>
        <td>Contacto:</td>
        <td><cfinput name="ccl_contacto"  value="#GetClientes.ccl_contacto#"></td> 
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
<cfinclude template="../Web/footer.cfm">
<!-- End Footer -->
</body>
</html> 