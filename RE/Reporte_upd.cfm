<!DOCTYPE html>
<html lang="en">
<head>
  <title>L.F. Jennings</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
  
	 <link rel="stylesheet" type="text/css" href="../Paginas/my.css">

</head>
<body id="body">



  <cfif isDefined("form.Criteria")>
    <cfset url.Criteria = trim(form.Criteria)>
 </cfif> 

<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
       
      <p>
		<div>

		
 
	<cfset GetRep.RecordCount=0>
	<cfquery name="GetRep" datasource="wolffdb_dsn">
	  Select *
		From RE_Reportes inner join RE_Employees on
             rep_fk_emp_key = emp_key
        Where rep_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">     
		 
	</cfquery>


<cfset GetEmp2.RecordCount=0>
<cfquery name="GetEmp2" datasource="wolffdb_dsn">
    Select *
    From RE_Employees
        order by emp_name
</cfquery> 


 <center>
  <table width="100%" class="table">
    <tr>
      <td align="center">
        <a href="index.cfm">
        <img src="Images/Keybyme_logo50.gif" width="240" height="90" alt=""/></a>
      </td>
      <td align="right">
        <strong>KeyByMe</strong> <br> 
      </td>
    </tr>
    <tr>  
      <td align="center"><strong>Real Estate Projects</strong></td>
      <td align="right">
        <strong>Date:</strong>&nbsp;&nbsp;
        <CFSET ws_fechaW = DateFormat(Now(),"mm-dd-yyyy")>   
        <cfoutput><strong>#ws_fechaW#</strong></cfoutput><br>
      </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            _____________________________________________________________________________
        </td>
    </tr>
  </table>
				    	<h2> <cfoutput>#GetRep.rep_name#</cfoutput> </h2>
	                
<table border="2" bordercolor="#blue">
   <cfoutput>
  
	
    <tr> 
        <td>Report By:</td>  
        <td colspan="2">#GetRep.emp_name#</td>       
    </tr> 

    <tr>
       
        <td colspan="2">
    <!---
          <select name="ac_is_AL" size="1" onChange="this.options[this.selectedIndex].value && 
          (window.location = this.options[this.selectedIndex].value);">
                <option value="0" selected>Send To:</option>
                <cfloop query="GetEmp2"> 
                  
                      <option value="add_email_tosend.cfm?claveu=#GetEmp.rep_key#"> 
                          #GetEmp2.emp_name#
                      </option> 	 
                  
              </cfloop>   
              
            </select>  
             --->
        </td>
        <td align="right">
         <!---  <button onclick="window.print()">Print this page</button>  --->
         <!--- <button id="button">Print!</button>

          <script>
            const btn = document.getElementById("button");
            btn.addEventListener("click", function(){
            var element = document.getElementById('body');
            html2pdf().from(element).save('filename.pdf');
            });
            </script>
          --->
          <a href="add_emails_tosend.cfm?claveU=#TRIM(GetRep.rep_key)#">Send to Emails</a>
        </td>
    </tr>

    <tr>
        <td>
            Scope of Report:
        </td>
        <td colspan="2">
            #GetRep.rep_desc#
        </td>
    </tr>
    <cfset GetFoto.RecordCount=0>
	<cfquery name="GetFoto" datasource="wolffdb_dsn">
	  Select *
		From RE_Photos left join RE_Reportes on 
             ph_fk_rep_key = rep_key
        where ph_fk_rep_key = #GetRep.rep_key#    
          and rep_user_name = '#SESSION.Auth.user_name#'   
          and ph_user_name = '#SESSION.Auth.user_name#'
		order by ph_yyyymmdd
	</cfquery>

<cfloop query="GetFoto"> 
<tr>
    <td>
        #GetFoto.ph_desc#
    </td>
    <td colspan="2">
       
      <a href="#TRIM(GetFoto.ph_link)#"><img src="#TRIM(GetFoto.ph_link)#" height="450"/></a>
      
    </td>
</tr>
</cfloop>   
</cfoutput>
</table>
<table border="2" bordercolor="#blue">
        <tr>
            <td align="right">
                <cfoutput>
                    
                <a href="Upload_Files.cfm?reporte=#GetFoto.ph_fk_rep_key#">Add Photo</a> 
                </cfoutput>
            <td>    
        </tr>
</table    
</center>
</div>
	  </p>
	   
    </div> 
  </div>
</div>

  

</body>
</html>
