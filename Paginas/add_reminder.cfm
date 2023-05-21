<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="my.css">

</head>
<body>

   <cfinclude template="menu.cfm"></cfinclude>
	
	      <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 	
	
<div class="container-fluid text-center">    
  <div class="row content">
 
    <div class="col-sm-8 text-left"> 
       
      <p>
		<div>
 
          <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
            
<cfform name="aghno" method="post" action="dsp_reminders.cfm">

<table align="center" border="0">
     <tr>
     	<th>Reminder: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="re_desc" 
         size="100" 
         maxlength="100">
        </td>  
	  <td>&nbsp;&nbsp;</td>
     </tr>
	
        <tr>
     	<th>From: </th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="re_from" 
         size="100" 
         maxlength="100">
        </td>  
	  <td>&nbsp;&nbsp;</td>
     </tr>  
     <tr>
  	  <th>Date Start MMDD:</th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="re_fecha_start" 	 
         size="30" 
         maxlength="30">
        </td>    
        <td>&nbsp;&nbsp;</td>
     </tr> 
	
     <tr>
  	  <th>Date End MMDD:</th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="re_fecha_end" 	 
         size="30" 
         maxlength="30">
        </td>    
        <td>&nbsp;&nbsp;</td>
     </tr>	
	
     <tr>
  	  <th>Time HH/MM:</th>
        <td colspan="2">   
      	<SELECT SIZE="5" NAME="re_hora">
           <OPTION VALUE="0100">01:00</OPTION>
           <OPTION VALUE="0200">02:00</OPTION>
           <OPTION VALUE="0300">03:00</OPTION>
           <OPTION VALUE="0400">04:00</OPTION>	
           <OPTION VALUE="0500">05:00</OPTION>
           <OPTION VALUE="0600">06:00</OPTION>
           <OPTION VALUE="0700">07:00</OPTION>
           <OPTION VALUE="0800">08:00</OPTION>	
           <OPTION VALUE="0900">09:00</OPTION>
           <OPTION VALUE="0930">09:30</OPTION>      
           <OPTION VALUE="1000">10:00</OPTION>
           <OPTION VALUE="1030">10:30</OPTION>        
           <OPTION VALUE="1100">11:00</OPTION>
           <OPTION VALUE="1130">11:30</OPTION>        
           <OPTION VALUE="1200">12:00</OPTION>
           <OPTION VALUE="1230">12:30</OPTION>        
           <OPTION VALUE="1300">13:00</OPTION>
           <OPTION VALUE="1330">13:30</OPTION>    
           <OPTION VALUE="1400">14:00</OPTION>
           <OPTION VALUE="1430">14:30</OPTION>    
           <OPTION VALUE="1500">15:00</OPTION>
           <OPTION VALUE="1530">15:30</OPTION>    
           <OPTION VALUE="1600">16:00</OPTION>	
           <OPTION VALUE="1700">17:00</OPTION>
           <OPTION VALUE="1800">18:00</OPTION>
           <OPTION VALUE="1900">19:00</OPTION>
           <OPTION VALUE="2000">20:00</OPTION>	
           <OPTION VALUE="2100">21:00</OPTION>
           <OPTION VALUE="2200">22:00</OPTION>
           <OPTION VALUE="2300">23:00</OPTION>
           <OPTION VALUE="2400">24:00</OPTION>	
        </SELECT>        
        </td>    
        <td>&nbsp;&nbsp;</td>
     </tr>
	 
	 <tr>
  	  <th>Email:</th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="re_email" 	 
         size="50" 
         maxlength="50">
        </td>    
        <td>&nbsp;&nbsp;</td>
     </tr>	
	
	 <tr>
  	  <th>Message:</th>
        <td colspan="2">   
        <cfinput 
         type="text" 
         name="re_message" 	 
         size="100" 
         maxlength="150">
        </td>    
        <td>&nbsp;&nbsp;</td>
     </tr>	
               
     <tr>
     	<td colspan="3">
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
	  </p>
	  
     

    </div> 
  </div>
</div>
	 

</body>
</html>
