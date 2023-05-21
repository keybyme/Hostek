<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>KeyByMe.com</title>

	
	<script src="../../../root_OLD/qrstuff/Web/js/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src="../../../root_OLD/qrstuff/Web/js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<script src="../../../root_OLD/qrstuff/Web/js/jquery-func.js" type="text/javascript"></script>
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
<cfinclude template="HeaderKBW.cfm">

<div id="title">
	<div class="shell">
		 <div class="slide-info">
				    	<h2><span>
                        <img src="../../../root_OLD/qrstuff/Web/img/carro.gif" width="30" height="30" />
                        <cfoutput>Add area for #claveCARRO#</cfoutput>
                        <img src="../../../root_OLD/qrstuff/Web/img/carro.gif" width="30" height="30" />
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
            
           
<cfform name="aghno" method="post" action="dsp_car2.cfm?claveR=#claveR#">
	<cfoutput>
        <input type="hidden" name="ws_USER2" value="#claveUSER#">    
        <input type="hidden" name="ws_carro2" value="#claveCARRO#">
    </cfoutput> 
<table align="center" border="0" >
    <td><img src="" width="150" height="150" />
    <td> 
<table align="center" border="0">
 
     <tr>
     	<th>Date: </th>
        <td>   
        <cfinput 
         type="text" 
         validate="date" 
         mask="99/99/9999"
         name="rc_date" 
         size="30" 
         value="#DateFormat(Now(),"mm/dd/yyyy")#" 
         maxlength="100"
         required="yes"
         message="Invalid date....  enter format MM/DD/YYYY">
        </td>    
     </tr>
     <tr>
     	<th>Activity: </th>
        <td>   
        <cfinput 
         type="text" 
         name="rc_record" 
         size="100" 
         value="" 
         maxlength="500">
        </td>    
     </tr>
     <tr>
     	<th>Miles/Kms: </th>
        <td>   
        <cfinput 
         type="text" 
         name="rc_millas" 
         size="100" 
         value="" 
         maxlength="500">
        </td>    
     </tr>     
     <tr>
     	<th>Password: </th>
        <td>   
        <cfinput 
         type="text" 
         name="Tpassword" 
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
 
</body>
</html> 