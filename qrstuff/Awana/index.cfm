<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="qr code, qrcode, barcode, qr stuff" />
<meta name="author" content="qrstuff" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Awana</title>
<style type="text/css">
.n1 {
	font-size: 18px;
}
.kjj {
	font-weight: bold;
}
.nj {
	font-style: italic;
	font-size: 24px;
	color: #006;
}
</style>
</head>

<body>
<cfparam name="url.action" default="">
<cfinclude template="header.cfm">
<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
     <cfinclude template="loginForm.cfm">
</cfif>
<cfif url.action EQ 3>
  <cfset url.action = 0>
     Your message has been sent. Thank you!
</cfif>
<table width="100%">
	<tr>
    	<td>
            <img src="image/bcgh.jpeg" width="163" height="309" /><br>
        	<a href="http://www.youtube.com/watch?v=u_SPAn_SQHU&feature=youtube_gdata_player" target="_blank">
            <span>What is Awana?....&nbsp;&nbsp;Click here to watch a video</span></a>
        </td>
        <td valign="bottom">
        	<table align="center">
                <tr align="center">
                	<td>
                    	<h2>This page is for Liders, Directors and Commanders of Awana.</h2>
                    </td>
                </tr>
    			<tr align="center">
      				<td bgcolor="#FFFFFF">
      					<strong>Contact us here:&nbsp;&nbsp;&nbsp;(hablamos espa&ntilde;ol)</strong></td>
  				</tr>
				<tr align="center">
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
             									message="Favor, ingrese su nombre.">
         									</td>
    									</tr>
                                		<tr>
    										<td width="100"><strong>Telephono: </strong></td>
        									<td>
            									<input
             									type="text"
            									name="Telefono"
             									size="70"
             									value=""
             									maxlength="100"
             									required="yes"
             									message="Favor, ingrese su numero de telefono.">
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
             									message="Favor, ingrese su E-mail.">
         									</td>
     									</tr> 
										<tr>
                                  			<td colspan="2">
                                  			<strong> Tell us about your question or concern:</strong></td>
                                        </tr>
     									<tr>
     										<td valign="top" width="100"><strong>Reason: </strong></td>
        									<td>
            									<textarea name="texto" rows="7" cols="40"> 
            									</textarea>
        									</td>
     									</tr>  
     									<tr>
        									<td width="100"> 
           										<input name="enviar" type="submit" value="Enviar" width="50">
        									</td>
        									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           										<input name="resetear" type="reset" value="Borrar">
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
        </td>
        <td>
           <img src="image/hgu.jpeg" width="200" height="196" /><br>
           <a href="http://awana.org/welcometoawana/welcome-to-awana,default,pg.html" target="_blank"> <span>Details about Awana!</span></a>
        </td>
    </tr>
</table>  

</body>
</html>           