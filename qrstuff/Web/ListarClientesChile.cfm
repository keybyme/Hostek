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

<cfparam name="url.Criteria" default="">

<cfif isDefined("form.Criteria")>
   <cfset url.Criteria = trim(form.Criteria)>
</cfif>
 
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *                     
  FROM  ChileClientes
     	  <cfif isdefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>   
           Where (ChileClientes.cl_bus_name   LIKE '%#TRIM(url.Criteria)#%' or
                  ChileClientes.cl_nombre LIKE '%#TRIM(url.Criteria)#%' or 
                  ChileClientes.cl_telefono  LIKE '%#TRIM(url.Criteria)#%' or 
                  ChileClientes.cl_celular     LIKE '%#TRIM(url.Criteria)#%' or 
                  ChileClientes.cl_email   LIKE '%#TRIM(url.Criteria)#%' or 
                  ChileClientes.cl_website  LIKE '%#TRIM(url.Criteria)#%' or 
                  ChileClientes.cl_address LIKE '%#TRIM(url.Criteria)#%' or 
                  ChileClientes.cl_remarks    LIKE '%#TRIM(url.Criteria)#%' or 
                  ChileClientes.cl_titulo      LIKE '%#TRIM(url.Criteria)#%')
          </cfif> 
  order by cl_bus_name
   
</CFQUERY>


<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                    
                        <cfoutput>Clientes &nbsp;&nbsp;</span>Information</cfoutput>
                        
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

               
<table border="2" bgcolor="#99CCCC">
   <tr>
     <th colspan="11">
        <cfoutput>
        <a href="add_clienteChile.cfm">Add Cliente</a>
        </cfoutput>    

<cfif isDefined('url.criteria') AND trim(url.criteria) NEQ ''>
  <cfoutput>
    <div align="center"><strong>Filter by: '#url.criteria#'</strong><br></div>
  </cfoutput>
</cfif> 

<cfoutput>
<form name="search" method="post" action="ListarClientesChile.cfm?Criteria=#url.Criteria#">
    Search:
       <cfif TRIM(url.Criteria) NEQ ''>
           <input name="Criteria" type="text" value="#url.Criteria#" class="search">
       <cfelse>
           <input name="Criteria" type="text" value="#url.Criteria#">
       </cfif>
       
       <input type="submit" value="Go" name="Go">        
</form>
</cfoutput>
     </th>
   </tr>
   <tr>
        <th style="color:#006" bgcolor="#CCCCCC">Negocio</th>
        <th style="color:#006" bgcolor="#CCCCCC">Contacto</th>
        <th style="color:#006" bgcolor="#CCCCCC">Posicion</th>
        <th style="color:#006" bgcolor="#CCCCCC">Telefono</th>
        <th style="color:#006" bgcolor="#CCCCCC">Celular</th>
        <th style="color:#006" bgcolor="#CCCCCC">E-mail</th>
        <th style="color:#006" bgcolor="#CCCCCC">Web site</th>
        <th style="color:#006" bgcolor="#CCCCCC">Direccion</th>     
        <th style="color:#006" bgcolor="#CCCCCC">Comentarios</th>   
        <th style="color:#006" bgcolor="#CCCCCC">Edit</th>
        <th style="color:#006" bgcolor="#CCCCCC">Delete</th> 
    </tr>      

 <cfloop query="GetUser">        
 <cfoutput>  
 <tr>
<!---  <td>#DATEFORMAT(TRIM(GetTransacciones.rc_date),"mm/dd/yyyy")#</td>--->
  <td>#TRIM(GetUser.cl_bus_name)#</td>
  <td>#TRIM(GetUser.cl_nombre)#</td>
  <td>#TRIM(GetUser.cl_titulo)#</td>
  <td>#TRIM(GetUser.cl_telefono)#</td>
  <td>#TRIM(GetUser.cl_celular)#</td>
  <td><a href="mailto: #TRIM(GetUser.cl_email)#">#TRIM(GetUser.cl_email)#</a></td>
  <td><a href="http://#TRIM(GetUser.cl_website)#" target="_blank">#TRIM(GetUser.cl_website)#</a></td>  
  <td>#TRIM(GetUser.cl_address)#</td>
  <td>#TRIM(GetUser.cl_remarks)#</td>                    

  <td align="center"><a href="upd_clientesChile.cfm?claveU=#GetUser.cl_id_key#">
  <img src="img/ico-edit.gif" width="16" height="16">
  <td align="center"><a href="del_clientesChile.cfm?claveU=#GetUser.cl_id_key#">
    <img src="img/ico-eliminar2.gif" width="20" height="20">
  </td></a>    

 </tr>
 </cfoutput>
 </cfloop>
 
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