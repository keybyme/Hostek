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
<cfmail to="jorge@wolff.cl"
        from="#CGI.REMOTE_ADDR#" 
        subject="Email from index of QRcodeTech.com"
        server="mail.wolff.cl"
        username="correo@wolff.cl"
        password="77correo##"
        failto="gideon@wesnetwork.com"
        port = "25"> 
  IP Address = #CGI.REMOTE_ADDR# <br>
  Remote Host = #CGI.REMOTE_HOST#  <br>
  Remote User = #CGI.REMOTE_USER#  <br>
  DATE/TIME: #DateFormat(now(),"mmm, dd yyyy")# #TimeFormat(now(),"HH:mm:ss")# (+2) <br>    
</cfmail> 

<cfinclude template="Header.cfm">

<!-- Slider -->
<div id="slider">
	<div class="shell">
		
		<!-- Slides -->
		<div class="slides">
			<ul>
				<!-- Slide -->
			    <li>
			    	<div class="slide-info">
				    	<h2><span>ENTERPRISE</span> SOLUTIONS</h2>
				    	<p>We can create, host, print and engraved your business or personal QR code.</p>
				    	<p>Keep your information update all the time in Business cards, Signs, T-shirts, adds, etc. </p>
			    	</div>
			    	<span class="slide-image image1"></span>
			    </li>
			    <!-- End Slide -->
			    
			    <!-- Slide -->
			    <li>
			    	<div class="slide-info">
				    	<h2><span>INNOVATION</span> SOLUTIONS</h2>
				    	<p>Need help with this technology?.</p>
				    	<p>Check this out quickly. We do the consultant part and of course free estimate. </p>
			    	</div>
			    	<span class="slide-image image1"></span>
			    </li>
			    <!-- End Slide -->
			    
			    <!-- Slide -->
			    <li>
			    	<div class="slide-info">
				    	<h2><span>UPDATE</span> SOLUTIONS </h2>
				    	<p>Everyday we found how unexpensive the technology had have become.</p>
				    	<p>Don't wait longer and call us for a free estimate. </p>
			    	</div>
			    	<span class="slide-image image1"></span>
			    </li>
				<!-- End Slide -->
			    
		    </ul>
		</div>
		<!-- End Slides -->
		
	</div>
</div>
<!-- End Slider -->

<!-- Slider Nav -->
<div id="slider-navigation">
	<div class="shell">
		<ul>
		    <li><a href="#" class="active">OPCION 1<strong>ENTERPRISE</strong><em class="ico1"></em></a></li>
		    <li><a href="#">OPCION 2<strong>INNOVATION</strong><em class="ico2"></em></a></li>
		    <li class="last"><a href="#">OPCION 3<strong>UPDATE</strong><em class="ico3"></em></a></li>
		</ul>
	</div>
</div>
<!-- End Slider Nav -->

<!-- Main -->
<div id="main">
	<div class="shell">
		
		<!-- Cols -->
		<div class="cols">
			<div class="cl">&nbsp;</div>
			
			<!-- Col -->
			<div class="col">
				<h3>The Solution</h3>
				<p>Today is not enough to be fast in technology, MUST be fastest, and so do your Business, to get the line before your competitors and be 100% successfully.<br /><a href="#" class="more">read more</a></p>
				<p>QR code technology, as it name say "QUICK RESPONSE", means don't wait, be quick and don't hesitaste, later on it could be too late. Be the first, hit first and hit twice. <br /><a href="#" class="more">read more</a></p>
			</div>
			<!-- End Col -->
			
			<!-- Col -->
			<div class="col">
				<h3>Our Help</h3>
				<p>This technology is it a lot simple that you might thought. We provide you with all the tools and knowledge that you need to be at the top of the line. <br /><a href="#" class="more">read more</a></p>
				<p>Contact us to get answer to your questions or for free estimate. <br /><a href="#" class="more">read more</a></p>
			</div>
			<!-- End Col -->
			
			<!-- Col -->
			<div class="col col-last">
				<h3>& The Update</h3>
				<p>Once you get update your business with qr codes, you will never back to the old fashion way. <br /><a href="#" class="more">read more</a></p>
				<p>And one of the amazing things of this technology is that is very unexpensive, just contact us for a free estimate and see for yourself. <br /><a href="#" class="more">read more</a></p>
			</div>
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