
<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main">
  
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
    
		<br>
		 
      <p>
		<div>
			
			<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cflocation url="https://www.keybyme.com"> 
          </cfif> 

  

 <CFFORM ACTION="inc_emp.cfm" METHOD="post">
        <table align="center" bgcolor="#A1A2A1">		
<TR>
   <TH colspan="2">
      <span class="style1"><font size="+1">Add Employee</font></span>
   </TH>
</TR>
<TR>
   <TD><span class="style3">
        Name:
   </span></TD>
   <TD>
        <CFINPUT TYPE="Text"     
                 NAME="emp_name" 
	             MESSAGE="Name is required!"
	             MAXLENGTH="80"
                 REQUIRED="Yes">   
   </TD>
</TR>

<TR>
   <TD><span class="style3">
        Telephone:
   </span></TD>
   <TD>
        <CFINPUT TYPE="Text"     
                 NAME="emp_phone" 
	             MESSAGE="Telephone is required!"
	             MAXLENGTH="80"
                 REQUIRED="Yes">   
   </TD>
</TR>

<TR>
   <TD><span class="style3">
        Email:
   </span></TD>
   <TD>
        <CFINPUT TYPE="Text"     
                 NAME="emp_email" 
	             MESSAGE="Name is required!"
	             MAXLENGTH="80"
                 REQUIRED="Yes">   
   </TD>
</TR>
 
 <TR>
 <TD colspan="2" align="center">
      <INPUT TYPE="submit" VALUE="Add"> 
 </TD> 
</TR>    
</table>
<br>
<br>
<br>
</CFFORM>
			
</div>
	  </p>
	   
    </div>
  </div>
</div>
	 

</div>

<cfinclude template="footer.cfm"></cfinclude>
