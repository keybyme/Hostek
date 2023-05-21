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
  
      </script> 
</head> 
<body>
  <cfinclude template="menu.cfm"></cfinclude>
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
  
      <p>
		<div>
			
	      <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 			
			
<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  Contactos  
  Where #SESSION.Auth.user_key# = cl_fk_user_key	   
  order by cl_nombre
</CFQUERY>   
    
<cfset ws_I = 0>
<cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">    
	
	<cfform name="aghno" method="post" action="dsp_gps.cfm">
	
<table border="2" bordercolor="#blue"> 
 
   <cfoutput>
    <tr>   
      <cfset direH = "10413+Ridge+Landing+Pl+Damascus+MD+20872">  
      <cfset finaldireH ="https://maps.google.com/?q=" & "#direH#">       
    <td colspan="2" align="center"><a href="#finaldireH#"><strong>Home address</strong></a></td>  
	<td><h4 align="center"> <cfoutput>GPS</cfoutput> </h4></td>	  
    </tr>          
  </cfoutput>    
      
     <cfoutput> 
     <tr>
     	<th>address: </th>
        <td colspan="3">   
        <cfinput 
         type="text" 
         name="cl_address"
         size="40" 
         value="" 
         maxlength="100">
        </td>    
     </tr>	 		 
     <tr>
		<td>&nbsp;</td> 
     	<td colspan="2" align="right"> 
        <cfinput type="submit" name="enviar" value="Send"> 
        </td>
     </tr>       
	 <cfloop query="GetUser">
	<cfif #TRIM(GetUser.cl_address)# neq "">	 
	 <tr>
	  <td>
		#TRIM(GetUser.cl_nombre)#
	  </td>
	 <td colspan="2"> 
		 <cfset dire = Replace(Trim(GetUser.cl_address), " ", "+", "ALL")/>  
    <cfset finaldire ="https://maps.google.com/?q=" & "#dire#">       
     <h5><a href="#finaldire#">#TRIM(GetUser.cl_address)#</a></h5>
		
	</td>	 
	</tr>	 
	</cfif>	 
	 </cfloop>	 
 </cfoutput>
 
 
</table>
</cfform>
</div>
	  </p>
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
   <!---<cfinclude template="propagandaKB.cfm"></cfinclude>--->
  </div>
</div>
	 

</body>
</html>
