<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Biblia</title>
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
     
	
                <cfif ws_time GT 9>
	    			<a href="#null" onClick=					"newWindow('../IglesiaDeDios/ListarBibliaPM.cfm/','','824','400','resizable,scrollbars,status,toolbar')">
                                        <span class="style1">Biblia en un a&ntilde;o</span></a>	
				<cfelse>
	   				<a href="#null" onClick="newWindow('../IglesiaDeDios/ListarBibliaAM.cfm/','','824','400','resizable,scrollbars,status,toolbar')">
                                        <span class="style1">Biblia en un a&ntilde;o</span></a>	
				</cfif>                			
		 
                
      
        </td>
	</tr>
</table>      
</body>
</html>
		  
