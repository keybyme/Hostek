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

<!---<cfinclude template="Header.cfm">--->
 
<cfquery name = "GetMed" dataSource = "wolffdb_dsn">
    SELECT *         
    FROM QR_medical inner join Usuarios on
         med_fk_user_key = user_key
    WHERE med_fk_user_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_varchar"> 
</cfquery>

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        
                        <cfoutput>#GetMed.med_name# &nbsp;&nbsp;</span></cfoutput>
                        
                        </h2>
                      
	     </div>
	</div>
</div>



</body>
</html>