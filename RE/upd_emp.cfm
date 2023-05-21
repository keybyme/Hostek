
<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main" style="height:100%">
	
  
<div class="container-fluid text-center">    
  <div class="row content">
  
    <div class="col-sm-8 text-left"> 
       
  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
      <p>
		<div>
  
  	<cfset Get_Emp.RecordCount=0>
	<cfquery name="Get_Emp" datasource="wolffdb_dsn">
	  Select *
		From RE_Employees  
		Where emp_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
	</cfquery> 
 
 <cfform name="edit" method="post" action="act_upd_emp.cfm">
	<cfoutput>
        <input type="hidden" name="emp_key" value="#Get_Emp.emp_key#">	
    </cfoutput>
	<br>

	<table align="center">
	  <cfoutput>	
 
    <tr>
        <td>Name: </td>
       <td><cfinput name="emp_name" value="#Get_Emp.emp_name#" size="80"></td>    
    </tr>

    <tr>
        <td>Telephone: </td>
       <td><cfinput name="emp_phone" value="#Get_Emp.emp_phone#" size="80"></td>    
    </tr>

      <tr>
        <td>Email: </td>
       <td><cfinput name="emp_email" value="#Get_Emp.emp_email#" size="80"></td>    
    </tr>
     </cfoutput>

    <tr>
        <td colspan="2"><input type="submit" name="editemp" value="Update"></td>
     
 </tr> 	  
	</table>		
   

</cfform>		
</div>
	
	   
    </div> 
  </div>
</div>

</div>

<cfinclude template="footer.cfm"></cfinclude>
