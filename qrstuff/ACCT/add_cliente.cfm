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

<cfquery name = "GetClientes" dataSource = "wolffdb_dsn">
    SELECT *         
    FROM QR_Contador
    WHERE c_id_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar"> 
      
</cfquery>

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        
                        <cfoutput>Agregar Clientes</cfoutput>
                         
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
            
           
<cfform name="aghno" method="post" action="../ACCT/dsp_cliente2.cfm?claveU=#GetClientes.c_id_key#">
	<cfoutput>
        <input type="hidden" name="ws_USER2" value="#GetClientes.c_id_key#">    
    </cfoutput> 
<table align="center" border="0" >
 <!---   <td><img src="" width="150" height="150" />
    <td>---> 
<table align="center" border="0">

     <tr>
     	<th>user name: </th>
        <td>   
        <cfinput 
         type="text" 
         name="ccl_user_name" 
         size="30"  
         maxlength="100"
         required="yes"
         message="Favor entre user_name">
        </td>    
     </tr>
     <tr>
     	<th>Password: </th>
        <td>   
        <cfinput 
         type="password"
         name="ccl_password" 
         size="30"
         value="" 
         maxlength="100"
         required="yes"
         message="Favor entre password">
        </td>    
     </tr>
     <tr>
     	<th>Razon Social: </th>
        <td>   
        <cfinput 
         type="text" 
         name="ccl_razon_social" 
         size="30" 
         value="" 
         maxlength="500"
         required="yes"
         message="Favor entre Razon Social">
        </td>    
     </tr>     
     <tr>
     	<th>R.U.T.: </th>
        <td>   
        <cfinput 
         type="text" 
         name="ccl_rut" 
         size="30" 
         value="" 
         maxlength="100"
         required="yes"
         message="Favor entre R.U.T.">
        </td>    
     </tr>
     <tr>
     	<th>Direcci&oacute;n: </th>
        <td>   
        <cfinput 
         type="text" 
         name="ccl_address" 
         size="30" 
         value="" 
         maxlength="100"
         required="yes"
         message="Favor entre direccion">
        </td>    
     </tr>   
     <tr>
     	<th>Tel&eacute;fono: </th>
        <td>   
        <cfinput 
         type="text" 
         name="ccl_telefono" 
         size="30" 
         value="" 
         maxlength="100"
         required="yes"
         message="Favor entre telefono">
        </td>    
     </tr>  
     <tr>
     	<th>E-mail: </th>
        <td>   
        <cfinput 
         type="text" 
         name="ccl_email" 
         size="30" 
         value="" 
         maxlength="100"
         required="yes"
         message="Favor entre E-mail">
        </td>    
     </tr>
     <tr>
     	<th>Contacto: </th>
        <td>   
        <cfinput 
         type="text" 
         name="ccl_contacto" 
         size="30" 
         value="" 
         maxlength="100"
         required="yes"
         message="Favor entre contacto">
        </td>    
     </tr>                  
     <tr>
     	<td colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <cfinput type="submit" name="enviar" value="Agregar">&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <cfinput type="reset" name="reset" value="Resetear">
        </td>
     </tr>   	                                            
</table>  
 </td>   
 </td> 	                                            
</table>     
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