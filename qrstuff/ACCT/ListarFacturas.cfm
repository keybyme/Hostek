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
.centrar {
	text-align: center;
}
</style>
</head>

<body>


<!---<cfinclude template="../Web/Header.cfm">--->
 
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
    WHERE ccl_user_name = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar"> 
      
</cfquery>

<table>
         	<tr>
           	  <td>
				    	<h2><span>
                        <cfoutput>#GetFacturas.ccl_razon_social# &nbsp;&nbsp;Facturas</span></cfoutput>
                        </h2>
                </td>        
  </tr>
         </table>               

		
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
<table border="2" bgcolor="#99CCCC" width="982">
   <tr>
     <th colspan="5">
<!---        <cfoutput>
        <a href="../Web/add_car.cfm?claveR=#TRIM(GetFacturas.car_id_key)#&amp;claveCARRO=#GetFacturas.car_name#&amp;claveUSER=#GetFacturas.user_name#">Add a Record</a>
        </cfoutput>--->     
     </th>
   </tr>
   <tr>
        <th style="color:#006" bgcolor="#CCCCCC" width="100">Fecha</th>
        <th style="color:#006" bgcolor="#CCCCCC">Nro Factura</th>
        <th style="color:#006" bgcolor="#CCCCCC">Razon Social</th>
        <th style="color:#006" bgcolor="#CCCCCC">Rut</th>
        <th style="color:#006" bgcolor="#CCCCCC">Neto</th>
        <th style="color:#006" bgcolor="#CCCCCC">Iva</th>
        <th style="color:#006" bgcolor="#CCCCCC">Total</th>
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
<!---  <td align="center"><a href="../Web/upd_car.cfm?claveU=#GetFacturas.rc_id_key#&amp;claveUSER=#GetFacturas.user_name#&amp;claveCARRO=#GetFacturas.car_name#&amp;action=1">
  <img src="../Web/img/ico-edit.gif" width="16" height="16">
  <td align="center"><a href="del_car.cfm?claveU=#GetFacturas.rc_id_key#&claveUSER=#GetFacturas.user_name#&claveCARRO=#GetFacturas.car_name#&action=2">
    <img src="../Web/img/ico-eliminar2.gif" width="20" height="20">
  </td></a>--->
 </tr>
 </cfoutput>
 </cfoutput>
 
</table>


</body>
</html>