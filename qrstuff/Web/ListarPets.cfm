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
	color:black;
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

<cfinclude template="Header.cfm">
 
<cfquery name = "GetPet" dataSource = "wolffdb_dsn">
    SELECT QR_Pets.pet_id_key
         , QR_Pets.pet_fk_user_name
         , QR_Pets.pet_photo_flag
         , QR_Pets.pet_name
         , QR_Pets.pet_DOB
         , QR_Pets.pet_weight
         , QR_Pets.pet_raza
         , QR_Pets.pet_color
         , QR_Pets.pet_note1
         , QR_Pets.pet_note2
         , QR_Pets.pet_note3
         , QR_Usuarios.user_name
         , QR_Usuarios.user_password
         , RTRIM (QR_Usuarios.user_nombre) + ' ' +
           RTRIM (QR_Usuarios.user_apellido) as nombre_apellido
         , QR_Usuarios.user_address
         , QR_Usuarios.user_email
         , QR_Usuarios.user_phone
         , QR_Usuarios.user_cellphone         
    FROM QR_Pets LEFT OUTER JOIN QR_Usuarios ON
         QR_Pets.pet_fk_user_name = QR_Usuarios.user_name
    WHERE pet_fk_user_name = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar">
      and pet_name = <cfqueryparam value="#URL.claveU2#" cfsqltype="cf_sql_varchar">
</cfquery>

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        <img src="img/PataDePerro2.gif" width="30" height="30" />
                        <cfoutput>#GetPet.pet_name# &nbsp;&nbsp;</span>Information</cfoutput>
                        <img src="img/PataDePerro2.gif" width="30" height="30" />
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
          
<cfform name="edit" method="post" action="act_upd_pet.cfm">

	<cfoutput>
        <input type="hidden" name="H_pet_id_key" value="#GetPet.pet_id_key#">	
        <input type="hidden" name="H_pet_fk_user_name" value="#GetPet.pet_fk_user_name#">
        <input type="hidden" name="claveU2" value="#GetPet.pet_name#">
    </cfoutput>  
  <table valing="bottom" align="left" border="0">
 
  </tr>
  <tr>
  
  <td>  
<table align="center" border="0" background="img/FondoPets2_20.gif" frame="box" cellspacing="2">
 <tr>
     <td width="200" height="200"><center> <img src="img/PastorAleman.jpg" width="150" height="150"  border="2" /> </center></td>
    <td width="200" height="200"><center> <textarea name="comentarios" rows="10" cols="40"> ESCRIBE AQUI TUS COMENTARIO </textarea>
     </td>
    </tr>
    <tr>
    <td colspan="2"> <center> <table valing="top" align="center" border="0" style="filter: alpha(opacity=35)">
    
 	<cfoutput>  
	<tr>
        <td>DOB: </td>
        <td><cfinput name="pet_DOB" value="#GetPet.pet_DOB#" size="40"></td>
  
        <td>Weight: </td>
        <td><cfinput name="pet_weight"  value="#GetPet.pet_weight#" size="40"></td>
    </tr> 
	<tr>
        <td>Address: </td>
        <td><cfinput name="pet_address" value="#GetPet.user_address#" size="40"></td>
   
        <td>Race: </td>
        <td><cfinput name="pet_raza" value="#GetPet.pet_raza#" size="40"></td>
    </tr>                             
	<tr>
        <td>Color: </td>
        <td><cfinput name="pet_color" value="#GetPet.pet_color#" size="40"></td>
       
        <td>Telephone: </td>
        <td><cfinput name="pet_telephone" value="#GetPet.user_phone#" size="40"></td>
        <td>&nbsp;</td><td>&nbsp;</td>
    </tr>  
	<tr>
        <td>Owner: </td>
        <td><cfinput name="pet_owner" value="#GetPet.nombre_apellido#" size="40"></td>
   
         <td>E-mail: </td>
        <td><cfinput name="pet_email" value="#GetPet.user_email#" size="40"></td>
    </tr>                             
	<tr>
        <td>Cellphone: </td>
        <td><cfinput name="pet_cellphone" value="#GetPet.user_cellphone#" size="40"></td>
         
    </tr>                             
	<tr>
        <td>Note 1: </td>
        <td colspan="3"><cfinput name="pet_note1" value="#GetPet.pet_note1#" size="104"></td>
        </tr>                             
	<tr>
        <td>Note 2: </td>
        <td colspan="3"><cfinput name="pet_note2" value="#GetPet.pet_note2#" size="104"></td>
    </tr> 
	<tr>
        <td>Note 3: </td>
        <td colspan="3"><cfinput name="pet_note3" value="#GetPet.pet_note3#" size="104"></td>
    </tr> 
	<tr>  
        <td>Message:</td><td><cfinput name="mensaje" value="To Update, enter your password ===>" size="40"> </td>
        <td>Password:</td><td><cfinput name="password" type="password" value="" size="40"></td>
    </tr>              
 	</cfoutput>
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
       <td colspan="2">
</cfform>
<cfform name="LGedit" method="post" action="welcome.cfm">
 
        <input type="submit" name="editemp2" value="Back to menu">
</cfform> 
</td>

</tr>
</table>
</table>
</center></td>
</td>
</tr>
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