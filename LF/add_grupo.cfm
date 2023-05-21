
<cfinclude template="headings.cfm"></cfinclude>	


<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  
<div class="container-fluid text-center">    


		<div>
			
			<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cflocation url="https://www.keybyme.com"> 
          </cfif> 

 
         
<!---======================================================---> 


<style>
#btn{
   background-color:9c0030;
   border-color:9c0030;
   color:white;
}
</style>

 <CFFORM ACTION="inc_grupo.cfm" METHOD="post">
        <table align="center"  class="table table-striped" >		
<TR>
   <TH colspan="2">
      <span class="style1"><font size="+1">Add Group</font></span>
   </TH>
</TR>
<TR>
   <TD><span class="style3">
        Group:
   </span></TD>

   <div class="form-group">
   <td>
        <CFINPUT TYPE="Text"     
                 NAME="g_grupo" 
	             MESSAGE="Group is required!"
	             MAXLENGTH="80"
                 REQUIRED="Yes"
                 class="form-control">   
   </TD>
</TR>
   </div>

 <TR>
 <TD colspan="2" align="center">
<div class="d-grid gap-2">
 <input type="submit" class="btn btn-secondary" VALUE="Add"> 
</div>
 </TD> 
</TR>    
</table>
<br>
<br>
<br>
</CFFORM>
			
</div>


</div>

  	

      
<cfinclude template="footer.cfm"></cfinclude>
