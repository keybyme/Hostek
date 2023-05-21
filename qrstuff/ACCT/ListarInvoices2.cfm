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
 
<cfquery name = "GetFacturas" dataSource = "wolffdb_dsn">
    SELECT QR_Facturas.cf_id_key
         , QR_Facturas.cf_fk_ccl_id_key
         , QR_Facturas.cf_fk_c_id_key
         , QR_Facturas.cf_fecha
         , QR_Facturas.cf_nro_factura
         , QR_Facturas.cf_razon_social
         , QR_Facturas.cf_rut
         , QR_Facturas.cf_neto
         , QR_Facturas.cf_iva
         , QR_Facturas.cf_total
         , QR_Contador.c_id_key
         , QR_Contador.c_user_name
         , QR_Cont_Clientes.ccl_id_key
         , QR_Cont_Clientes.ccl_fk_c_id_key
         , QR_Cont_Clientes.ccl_user_name
         , QR_Cont_Clientes.ccl_razon_social 
         , QR_Cont_Clientes.ccl_rut
         , QR_Cont_Clientes.ccl_contacto
         , QR_Cont_Clientes.ccl_telefono
    FROM QR_Facturas INNER JOIN QR_Contador ON
         QR_Facturas.cf_fk_c_id_key = QR_Contador.c_id_key
    LEFT JOIN QR_Cont_Clientes ON    
         QR_Facturas.cf_fk_ccl_id_key = ccl_id_key
    WHERE QR_Cont_Clientes.ccl_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar"> 

</cfquery>

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        <cfoutput>Facturas de #GetFacturas.ccl_razon_social#</span></cfoutput>
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
            <small> <p style="color:#FFFFFF">
              <cfoutput>
                        Rut: &nbsp;
                        #GetFacturas.ccl_rut# &nbsp;&nbsp;&nbsp;
                        Contacto:  &nbsp;
                        #GetFacturas.ccl_contacto# &nbsp;&nbsp;&nbsp;
                        Telefono:  &nbsp;
                        #GetFacturas.ccl_telefono# &nbsp;&nbsp;&nbsp;          
             </cfoutput> </p> 
             </small>  
             </td></tr></table>
              <table cellpadding="2" cellspacing="2" border="0"  bgcolor="#c0c0c0" width="982" align="center" bordercolor="#000033">
   <tr>
     <th colspan="5" style="color:#FFFFFF" bgcolor="#cccccc">
        <cfoutput>
        <a href="../ACCT/add_factura.cfm?claveU=#GetFacturas.ccl_id_key#"> Click Aqu&iacute; para agregar facturas</a>
        </cfoutput>     
     </th>
   </tr>
   <tr>
        <th style="color:#006" bgcolor="#CCCCCC">Fecha</th>
        <th style="color:#006" bgcolor="#CCCCCC">Nro Factura</th>
        <th style="color:#006" bgcolor="#CCCCCC">Razon Social</th>
        <th style="color:#006" bgcolor="#CCCCCC">Rut</th>
        <th style="color:#006" bgcolor="#CCCCCC">Neto</th>
        <th style="color:#006" bgcolor="#CCCCCC">Iva</th>
        <th style="color:#006" bgcolor="#CCCCCC">Total</th>
        <th style="color:#006" bgcolor="#CCCCCC">Editar</th>
        <th style="color:#006" bgcolor="#CCCCCC">Eliminar</th>
    </tr>      

 <cfoutput query="GetFacturas" group="cf_fk_ccl_id_key">        
 <cfoutput>  
 <tr>
  <td>#DATEFORMAT(TRIM(GetFacturas.cf_fecha),"dd/mm/yyyy")#</td>
  <td>#TRIM(GetFacturas.cf_nro_factura)#</td>
  <td>#TRIM(GetFacturas.cf_razon_social)#</td>
  <td>#TRIM(GetFacturas.cf_rut)#</td>
  <td>#NumberFormat(TRIM(GetFacturas.cf_neto), "$,")#</td>  
  <td>#NumberFormat(TRIM(GetFacturas.cf_iva), "$,")#</td>  
  <td>#NumberFormat(TRIM(GetFacturas.cf_total), "$,")#</td> 
  <td align="center">
  	<a href="../ACCT/upd_invoiceAct.cfm?claveU=#GetFacturas.cf_id_key#">
    <img src="../Web/img/ico-edit.gif" width="16" height="16"></a>
  <td align="center">
    <a href="../ACCT/del_invoiceAct.cfm?claveU=#GetFacturas.cf_id_key#">
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