<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Awana</title>
<Style>

   body {margin: 0px;}
   
</style>
</head>

<body>

<cfparam name="url.action" default="">
<cfif url.action eq 2>
   <cfset url.action="">
   <cfinclude template="header.cfm">
     <font color="red"> Username y/o Password errado</font>
<cfelseif url.action eq 5>
   <cfset url.action="">
   <cfinclude template="header.cfm">     
</cfif>   

<cfform name="LoginUser" method="post" action="LoginCheck.cfm">

<table width="200" border="0" align="center" style="font-size:smaller" align="right">
    

    <TR style="font-size:smaller">
      <TH bgcolor="#F2F1D7">Username:</TH>
      <TD>
        
      <!--- Text field for "User Name" --->  
      <CFINPUT 
        TYPE="Text"
        NAME="UserLogin"
        height="1"
        SIZE="12"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Favor entre su Username.">

      </TD>

      <TH bgcolor="#F2F1D7">Password:</TH>
      <TD>
    
      <!--- Text field for Password --->  
      <CFINPUT 
        TYPE="Password"
        NAME="UserPassword"
        height="1"
        SIZE="12"
        VALUE=""
        MAXLENGTH="100"
        REQUIRED="Yes"
        MESSAGE="Favor entre su Password.">

      <!--- Submit Button that reads "Enter" --->  
      </TD>

		<td colspan="2">
		   <div align="center">
		  
		     <input type="Submit" value="Log in" style="font-size:smaller">
	   	     </div></td>
    </TR>
    <tr><td><br><br><br></td></tr>
</table> 

 </cfform>
</body>
</html>