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
	color: #FF00FF;
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
 
<cfquery name = "GetClientes" dataSource = "wolffdb_dsn">
    SELECT QR_Clientes.cl_id_key
         , QR_Clientes.cl_fk_user_name
         , QR_Clientes.cl_ap_codigo
         , QR_Clientes.cl_multiple
         , QR_Apps.ap_codigo
         , QR_Apps.ap_name
    FROM QR_Clientes LEFT OUTER JOIN QR_Apps ON
         QR_Clientes.cl_ap_codigo = QR_Apps.ap_codigo
    Where cl_fk_user_name = '#TRIM(SESSION.Auth.user_name)#' 
    order by cl_ap_codigo
</cfquery>

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>APPLICATIONS</span> MENU</h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <small><tt><a href="EditProfile.cfm">Edit Profile</a></tt></small>
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
	<table align="center" width="100%">
        <cfif '#TRIM(SESSION.Auth.user_roll_id_key)#' EQ 99>
          
       		<tr valign="top">
       		  <td align="center" valign="top">
                 <a href="ListarClientes.cfm" target="_blank"><p>Listar Clientes</p></a>
       	  </td></tr>  
        
               		<tr valign="top">
       		  <td align="center" valign="top">
                 <a href="ListarClientesChile.cfm" target="_blank"><p>Listar Clientes Chile</p></a>
       	  </td></tr>  
        
               		<tr valign="top">
       		  <td align="center" valign="top">
                 <a href="AsignarQR.cfm" target="_blank"><p>Asignar Codigos QR</p></a>
       	  </td></tr>           
    	</cfif> 

        <cfif '#TRIM(SESSION.Auth.user_roll_id_key)#' EQ 91>
 
               		<tr valign="top">
       		  <td align="center" valign="top">
                 <a href="ListarClientesChile.cfm" target="_blank"><p>Listar Clientes Chile</p></a>
       	  </td></tr>  
    	</cfif>         
    
 	<cfoutput query="GetClientes" group="cl_fk_user_name">
 	<cfoutput>     
          
        <cfif GetClientes.cl_ap_codigo EQ 999>
          
       		<tr valign="top">
       		  <td align="center" valign="top">
                 <a href="CodigosAnuales.cfm" target="_blank"><p>#GetClientes.ap_name#</p></a>
       	  </td></tr>  
        
    	</cfif>
        <cfif GetClientes.cl_ap_codigo EQ 100>
          
       		<tr valign="top">
       		  <td align="center" valign="top">
                 <!---<a href="../ACCT/Contadores.cfm?claveU=#GetClientes.cl_multiple#"><p>#GetClientes.ap_name#</p></a>--->
                 <a href="../ACCT/ListarClientesAcct.cfm?claveU=#GetClientes.cl_multiple#">Clientes</a><br />
       	  </td></tr>  
        
    	</cfif>    
        <cfif GetClientes.cl_ap_codigo EQ 101>
          <cfquery name = "GetCliente" dataSource = "wolffdb_dsn">
    			SELECT *         
    			FROM QR_Cont_Clientes
   			    WHERE ccl_user_name = '#TRIM(SESSION.Auth.user_name)#'
      
          </cfquery>
       		<tr valign="top">
       		  <td align="center" valign="top">
                 <a href="../ACCT/ListarInvoices.cfm?claveU=#GetCliente.ccl_id_key#"><p>#GetClientes.ap_name#</p></a>
       	  </td></tr>  
        
    	</cfif>              
        <cfif GetClientes.cl_ap_codigo EQ 111>	
             
       		<tr>
       		  <td align="center">
                 <a href="../Awana/index.cfm" target="_blank"><p>#GetClientes.ap_name#</p></a>
        	  </td></tr>
              
    	</cfif>		
        <cfif GetClientes.cl_ap_codigo EQ 888>	
                       
       		<tr>
       		  <td align="center">
                 <a href="http://www.jw3.us/r/admin?action=logout" target="_blank"><p>#GetClientes.ap_name#</p></a>
        	  </td></tr>
             
    	</cfif>      
        <cfif GetClientes.cl_ap_codigo EQ 444>
            
       		<tr>
       		  <td align="center">
                 <a href="update_expiration.cfm" target="_blank"><p>#GetClientes.ap_name#</p></a>
        	  </td></tr>
              
    	</cfif>  
        <cfif GetClientes.cl_ap_codigo EQ 555>	
       		
            <tr>
       		  <td align="center">
                 <a href="ListarLinks.cfm?claveU=#GetClientes.cl_fk_user_name#"><p>#GetClientes.ap_name#</p></a>
        	  </td></tr>
              
    	</cfif> 
        <cfif GetClientes.cl_ap_codigo EQ 222>	
       		
            <tr>
       		  <td align="center">
                 
                 <a href="ListarPets.cfm?claveU=#GetClientes.cl_fk_user_name#&claveU2=#GetClientes.cl_multiple#"><p>#GetClientes.ap_name#&nbsp;&nbsp;#GetClientes.cl_multiple#</p></a>
        	  </td></tr>
             
    	</cfif>        
        <cfif GetClientes.cl_ap_codigo EQ 333>	
       		
            <tr>
       		  <td align="center">
                 <a href="ListarCars.cfm?claveU=#GetClientes.cl_fk_user_name#&claveU2=#GetClientes.cl_multiple#"><p>#GetClientes.ap_name#&nbsp;&nbsp;#GetClientes.cl_multiple#</p></a>
        	  </td></tr>
             
    	</cfif>                               
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