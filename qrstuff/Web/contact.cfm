<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>QRcodeTech.com</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
	<!--[if IE]><style type="text/css" media="screen"> #navigation ul li a em { top:32px; } </style><![endif]-->
	
	<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<script src="js/jquery-func.js" type="text/javascript"></script>
    
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="icon" type="image/gif" href="animated_favicon1.gif">    
</head>
<body>

<cfinclude template="Header.cfm">

<!-- Slider -->
<div id="title">
	<div class="shell">
		
        <div class="slide-info">
				    	<h2><span>CONTACT</span> US</h2>
			    	</div>

	
		
	</div>
</div>
<!-- End Slider -->



<!-- Main -->
<div id="main">
	<div class="shell">
		
		<!-- Cols -->
		<div class="cols">
			<div class="cl">&nbsp;</div>
			
			<!-- Col -->
			<div class="col1">
				<h3>Contacts in USA:</h3>
				<p>Contact us for a free estimate </p>
				<p>240-813-0012  <a href="mailto: info@QRcodeTech.com">info@QRcodeTech.com</a> </p>
                
 <table width="100%">

    <tr>
      <td bgcolor="#FFFFFF">
      <strong>To contact us, please fill the following form:</strong></td>
  </tr>
<tr>
    	<td>
        	<table>
            	<tr>
                	<td>              
						<form name="jwform" method="post" action="edit.cfm">
							<table align="center" bgcolor="#666666" width="100%">
								<tr>
    								<td width="100"><strong>Name: </strong></td>
        							<td>
            							<input
             							type="text"
            							name="Nombre"
             							size="70"
             							value=""
             							maxlength="100"
             							required="yes"
             							message="Please enter your name.">
         							</td>
    							</tr>
                                <tr>
    								<td width="100"><strong>Telephone: </strong></td>
        							<td>
            							<input
             							type="text"
            							name="Telefono"
             							size="70"
             							value=""
             							maxlength="100"
             							required="yes"
             							message="Please enter your telephne number.">
         							</td>
    							</tr>
								<tr>
    								<td width="100"><strong>E-mail: </strong></td>
        							<td>
           								<input
             							type="text"
             							name="email"
             							size="70"
             							value=""
             							maxlength="100"
             							required="yes"
             							message="Please enter your E-mail.">
         							</td>
     							</tr> 

                                <tr>
                                  <td colspan="2">
                                  <strong> Reason of the contact:</strong></td></tr>
     							<tr>
     								<td valign="top" width="100"><strong>Remarks: </strong></td>
        							<td>
            							<textarea name="texto" rows="7" cols="40"> 
            							</textarea>
        							</td>
     							</tr>  
     							<tr>
        							<td width="100"> 
           								<input name="enviar" type="submit" value="Send" width="50">
        							</td>
        							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           								<input name="resetear" type="reset" value="Clear">
        							</td>
     							</tr>          
							</table>
         			</form>                   
					</td>
                
               </tr>     
           </table>         
       </td>  
               
	</tr>
    
</table>              
               
			</div>
			<!-- End Col -->
			
		
			
			<!-- Col -->
			<!---<div class="col col-last">
				<h3>Contacts in Chile:</h3>
		<table>		
         <tr>
          <td>Ofresinio B. S&aacute;ez R.</td> 
          <td>+56983434240</td>
         </tr>
         <tr>
          <td colspan="2"><a href="mailto:gerencia@QRcodeTech.com">Gerencia@QRcodeTech.com</a></td>  
         </tr> 
         <tr><td>&nbsp;</td></tr>
         <tr>
          <td>Jerson G. S&aacute;ez T.</td> 
          <td>+56963659894</td>
         </tr>
         <tr>
          <td colspan="2"><a href="mailto:ventas@QRcodeTech.com">Ventas@QRcodeTech.com</a></td>  
         </tr>         
        </table>


			</div>--->
			<!-- End Col -->
			
			<div class="cl">&nbsp;</div>
		</div>
		<!-- End Cols -->
        
        
        <!-- Col -->
	<!---		<div class="col col-last">
				<h3>TWITTER</h3>
				

<div style="width:236px;font-size:8px;text-align:right;"><script type="text/javascript">//<![CDATA[
document.write(unescape("%3Cscript src='http://twitterforweb.com/twitterbox.js?username=QRcodeTech&settings=1,1,3,236,550,f4f4f4,0,c4c4c4,101010' type='text/javascript'%3E%3C/script%3E"));
//]]></script>Created by: <a href="http://twitterforweb.com">Twitter on web</a></div>



			</div>--->
			<!-- End Col -->
			
			<div class="cl">&nbsp;</div>
		</div>
		<!-- End Cols -->
		
	</div>
</div>
<!-- End Main -->

<!-- Footer -->
<cfinclude template="footer.cfm">

<!-- End Footer -->
	
</body>
</html>