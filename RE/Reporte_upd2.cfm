<!DOCTYPE html>
<html lang="en">
<head>
  <title>KeyByMe</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
  
	 <link rel="stylesheet" type="text/css" href="../Paginas/my.css">

</head>

<style>
@media print {
    .container { margin: 0; background:red;}
  }
</style>


<body id="body">
  <CFSET GetUser.RecordCount=0>
  <CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
    SELECT  *          
    FROM  Usuarios
    WHERE user_name = <cfqueryparam value="#URL.ws_id#" cfsqltype="cf_sql_nvarchar">
    <!---  And user_password = '#secret#'--->
     
  </CFQUERY>
   
  <!--- If the username and password is correct ---> 
  <CFIF GetUser.RecordCount EQ 1>
    <CFSET SESSION.Auth = StructNew()>
    <CFSET SESSION.Auth.IsLoggedIn        = "Yes">
    <CFSET SESSION.Auth.user_key          = GetUser.user_key>
    <CFSET SESSION.Auth.user_name         = GetUser.user_name>
    <CFSET SESSION.Auth.user_password     = GetUser.user_password>
    <CFSET SESSION.Auth.user_nombre       = GetUser.user_nombre>
    <CFSET SESSION.Auth.user_apellido     = GetUser.user_apellido>       
    <CFSET SESSION.Auth.email             = GetUser.user_email>  
    <CFSET SESSION.Auth.user_role         = GetUser.user_role>
  </cfif>


  <cfif isDefined("form.Criteria")>
    <cfset url.Criteria = trim(form.Criteria)>
 </cfif> 
 

<div class="container">    


 
	<cfset GetRep.RecordCount=0>
	<cfquery name="GetRep" datasource="wolffdb_dsn">
	  Select *
		From RE_Reportes inner join RE_Employees on
             rep_fk_emp_key = emp_key
        Where rep_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">     
		 
	</cfquery>
  

 <center>
  <table width="100%" class="table">
    <tr>
      <td align="center">
        <a href="#">
        <img src="Images/Keybyme_logo50.gif" width="240" height="90" alt=""/></a>
      </td>
      <td align="right">
        <strong>KeyByMe</strong> <br> 
      </td>
    </tr>
    <tr>  
      <td align="center"><strong>Pictures Report</strong></td>
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
	                
<table border="2"  class="table" bordercolor="#blue" width="100%">
   <cfoutput>
    
	
    <tr> 
        <td>Report By:</td>  
        <td>#GetRep.emp_name#</td>       
    </tr> 
 
<!---
    <tr>
        
        <td align="right">
         <!---  <button onclick="window.print()">Print this page</button>  --->
          <button id="button">Print!</button>

          <script>
            const btn = document.getElementById("button");
            btn.addEventListener("click", function(){
            var element = document.getElementById('body');
            html2pdf().from(element).save('filename.pdf');
            });
            </script>


        </td>
    </tr>
  --->
    <tr>
        <td>
            Scope of Report:
        </td>
        <td>
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
</table>
<cfset ws_c = 0>
<cfloop query="GetFoto">
   
  <br>
  <cfif ws_c gt 0>
    <table  class="table" width="100%">
      <tr>
        <tr>
          <td align="center">
            <a href="">
            <img src="Images/Keybyme_logo50.gif" width="240" height="90" alt=""/></a>
          </td>
          <td align="right">
            <strong>KeyByMe</strong> <br> 
    
          </td>
        </tr>
        <tr>  
          <td align="center"><strong>KeyByMe Project</strong></td>
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
      </tr>   
    </table>
      <br><br>  
  </cfif>
  <cfset ws_c = ws_c + 1>
  <table border="2" class="table" width="100%">
  <tr>
    <td>
        #GetFoto.ph_desc#
    </td>
    <td>
       
      <a href="#TRIM(GetFoto.ph_link)#"><img src="#TRIM(GetFoto.ph_link)#" height="450"/></a>
      
    </td>
</tr>
</table>
<br> <br> <br> <br> <br> <br> <br> <br> <br>
  


</cfloop>   
</cfoutput>
<!---
<table  class="table" border="2" bordercolor="#blue" width="100%">
        <tr>
            <td align="right">
                <cfoutput>
                    
                <a href="Upload_Files.cfm?reporte=#GetFoto.ph_fk_rep_key#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
                </cfoutput>
            <td>    
        </tr>
</table>
--->
</div>


</body>
</html>
