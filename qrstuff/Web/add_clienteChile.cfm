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

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                       
                        <cfoutput>Add area  </cfoutput>
                       
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
            
           
<cfform name="aghno" method="post" action="dsp_clientesCH2.cfm">
	<cfoutput>
<!---        <input type="hidden" name="ws_USER2" value="#claveUSER#">    
        <input type="hidden" name="ws_carro2" value="#claveCARRO#">--->
    </cfoutput> 
<table align="center" border="0">
 
     <tr>
     	<th>Empresa: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cl_bus_name" 
         size="30" 
         maxlength="100">
        </td>    
     </tr>
     <tr>
     	<th>Contacto: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cl_nombre" 
         size="100" 
         value="" 
         maxlength="500">
        </td>    
     </tr>
     <tr>
     	<th>Titulo: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cl_titulo" 
         size="100" 
         value="" 
         maxlength="500">
        </td>    
     </tr>     
     <tr>
     	<th>Telefono: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cl_telefono"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr>
     <tr>
     	<th>Celular: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cl_celular"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr>     
     <tr>
     	<th>E-mail: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cl_email"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr> 
     <tr>
     	<th>website: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cl_website"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr>   
     <tr>
     	<th>Direccion: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cl_address"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr>  
     <tr>
     	<th>Remarks: </th>
        <td>   
        <cfinput 
         type="text" 
         name="cl_remarks"
         size="30" 
         value="" 
         maxlength="100">
        </td>    
     </tr>              
     <tr>
     	<td colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <cfinput type="submit" name="enviar" value="Send">&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <cfinput type="reset" name="reset" value="Clear">
        </td>
     </tr>   	                                            
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
<cfinclude template="footer.cfm">
<!-- End Footer -->
</body>
</html> 