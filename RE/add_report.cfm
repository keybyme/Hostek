
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

 
         
<!---======================================================---> 
<cfset GetEmp.RecordCount=0>
<cfquery name="GetEmp" datasource="wolffdb_dsn">
	  Select *
		From RE_Employees
        order by emp_name
</cfquery>   
         
<!---======================================================---> 

 <CFFORM ACTION="inc_report.cfm" METHOD="post">
        <table align="center" bgcolor="#A1A2A1">		
<TR>
   <TH colspan="2">
      <span class="style1"><font size="+1">Add Report</font></span>
   </TH>
</TR>
<TR>
   <TD><span class="style3">
        Report name:
   </span></TD>
   <TD>
        <CFINPUT TYPE="Text"     
                 NAME="rep_name" 
	             MESSAGE="Name is required!"
	             MAXLENGTH="80"
                 REQUIRED="Yes">   
   </TD>
</TR>


<tr>
    <td>Report By:</td>
    <td>
       <select name="rep_fk_emp_key" size="1">
           <option value="0" selected>Report By</option>
              <cfloop query="GetEmp"> 
               <cfoutput>  
                   <option value="#GetEmp.emp_key#"> 
                       #GetEmp.emp_name#
                   </option> 	 
               </cfoutput>	 
           </cfloop> 
      </select>        
    </td>     
</tr> 


<TR>
    <TD><span class="style3">
         Scope of Report:
    </span></TD>
    <TD>
         <CFINPUT TYPE="Text"     
                  NAME="rep_desc" 
                  size="120"
                  MAXLENGTH="120">   
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
