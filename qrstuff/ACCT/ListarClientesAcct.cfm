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
	font-size: 13px;
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


<cfinclude template="../Web/Header.cfm">
 
<cfquery name = "GetClientes" dataSource = "wolffdb_dsn">
    SELECT *         
    FROM QR_Cont_Clientes
    WHERE ccl_fk_c_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar"> 
      
</cfquery>

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        <cfoutput>Lista de Clientes &nbsp;&nbsp;</span></cfoutput>
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
          
           
              <table cellpadding="2" cellspacing="2" border="0"  bgcolor="#c0c0c0" width="982" align="center" bordercolor="#000033">
   <tr>
     <th colspan="5" style="color:#FFFFFF" bgcolor="#cccccc">
        <cfoutput>
        <a href="../ACCT/add_cliente.cfm?claveU=#URL.claveU#"> Click Aqu&iacute; para agregar clientes</a>
        </cfoutput>     
     </th>
   </tr>
   <tr>
        <th style="color:#black" bgcolor="#CCCCCC">user_name</th>
        <th style="color:#black" bgcolor="#CCCCCC">Razon Social</th>
        <th style="color:#black" bgcolor="#CCCCCC">FACTURAS</th>
        <th style="color:#black" bgcolor="#CCCCCC">R.U.T.</th>
        <th style="color:#black" bgcolor="#CCCCCC">Direccion</th>
        <th style="color:#black" bgcolor="#CCCCCC">Telefono</th>
        <th style="color:#black" bgcolor="#CCCCCC">E-mail</th>
        <th style="color:#black" bgcolor="#CCCCCC">Contacto</th>
        <th style="color:#black" bgcolor="#CCCCCC">Editar</th>
        <th style="color:#black" bgcolor="#CCCCCC">Eliminar</th>
    </tr>      

 <cfoutput query="GetClientes" group="ccl_fk_c_id_key">        
 <cfoutput>  
 <tr>
  <td>#TRIM(GetClientes.ccl_user_name)#</td>
  <td>#TRIM(GetClientes.ccl_razon_social)#</td>
  <td><a href="../ACCT/ListarInvoices2.cfm?claveU=#ccl_id_key#" target="_blank">Click para ver</a></td>
  <td>#TRIM(GetClientes.ccl_rut)#</td>
  <td>#TRIM(GetClientes.ccl_address)#</td>
  <td>#TRIM(GetClientes.ccl_telefono)#</td>
  <td><a href="mailto: #TRIM(GetClientes.ccl_email)#">#TRIM(GetClientes.ccl_email)#</a></td>
  <td>#TRIM(GetClientes.ccl_contacto)#</td>
  <td align="center">
  	<a href="../ACCT/upd_clienteAct.cfm?claveU=#GetClientes.ccl_id_key#">
    <img src="../Web/img/ico-edit.gif" width="16" height="16"></a>
  <td align="center">
    <a href="../ACCT/del_clienteAct.cfm?claveU=#GetClientes.ccl_id_key#">
    <img src="../Web/img/ico-eliminar2.gif" width="20" height="20"></a>
  </td>
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
<cfinclude template="../Web/footer.cfm">
<!-- End Footer -->

</body>
</html>