<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Awana</title>
<SCRIPT LANGUAGE="JavaScript">
var win = null;
function newWindow(mypage,myname,w,h,features) {
  var winl = (screen.width-w)/2;
  var wint = (screen.height-h)/2;
  if (winl < 0) winl = 0;
  if (wint < 0) wint = 0;
  var settings = 'height=' + h + ',';
  settings += 'width=' + w + ',';
  settings += 'top=' + wint + ',';
  settings += 'left=' + winl + ',';
  settings += features;
  win = window.open(mypage,myname,settings);
  win.window.focus();
}
</script>
</head>

<body>
 <style type="text/css"> 
  .style1 {
	 color:#000066;
	 font-style:oblique;
	 font-size:16px;
	 font-weight:bold;
 }
  .style18 {
  color:#B84F30;
	 font-style:oblique;
	 font-size:14px;
	 font-weight:bold;
 }   
 </style>
 
<cfset ws_time = #TimeFormat("# Now()#", "HH")#> 
<table align="center">
	<tr>
    	<td>
      
           <img src="image/heading.gif" width="900" height="90" /><br>
          <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
          		<!---<img src="../IglesiaDeDios/image/menu.gif" width="600" height="20" border="0" usemap="#Map">--->
		 		<cfoutput>
					<span class="style18">&nbsp;
						#DateFormat("# Now()#", "dddd, mmmm dd, yyyy")# &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="logout.cfm">Logout</a>
					</span>
				</cfoutput>
                             			
		  <cfelse>
		  		
		 		<cfoutput>
					<span class="style18">&nbsp;
						#DateFormat("# Now()#", "dddd, mmmm dd, yyyy")# &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="logout.cfm">Logout</a>
					</span>
				</cfoutput>
			
                            
		 </cfif>
  
      
        </td>
	</tr>
</table>      
</body>
</html>
		  
