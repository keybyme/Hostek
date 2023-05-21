<!DOCTYPE html>
<html lang="en">
<head>
  <title>L.F. Jennings</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" type="text/css"  rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<style>
@media print{
   #footer { 
    
  }
  

}

html{
   height:100%;
}

body {
  /* Set "my-sec-counter" to 0 */
  counter-reset: my-sec-counter;
  height:100%;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
  }

.box-break{
  
}

.whole{
  page-break-after: always !important; 
}
  
#shaded{
  width:100%;
  background: #808080;
}


#no-space{
 margin:0;
 padding:0;
}

.fs-6{
 text-align:left;
}

#footer::before {
  /* Increment "my-sec-counter" by 1 */
  counter-increment: my-sec-counter;
  content: counter(my-sec-counter) " / ";
}
  
#footer{
  height:20px;
  border-top:1px solid black;
  text-align: right;
  font-size:small;
  page-break-before: avoid !important; 
   page-break-after: avoid !important; 
}

table{
  border-bottom:solid 0px transparent;
}

 #line{
 width: 100%;
 height: 5px;
 background: #9c0030;
 }

#box1{
  height:880px;
}

img{
  max-height:400px;
}

#resize{
  max-height:300px;
  max-width:300px;
  padding:2px;
}
   </style>

</head>



  <CFSET GetUser.RecordCount=0>
  <CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
    SELECT  *          
    FROM  Usuarios
    WHERE user_name = <cfqueryparam value="#URL.ws_id#" cfsqltype="cf_sql_nvarchar">

     
  </CFQUERY>
   

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
 
 
 <cfset GetRep.RecordCount=0>
 <cfquery name="GetRep" datasource="wolffdb_dsn">
   Select *
   From LF_Reportes inner join LF_Projects on 
            rep_fk_pr_key = pr_key inner join LF_Employees on
            rep_fk_emp_key = emp_key
       Where rep_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">     
    
 </cfquery>

<cfset GetEmp.RecordCount=0>
<cfquery name="GetEmp" datasource="wolffdb_dsn">
 Select *
   From LF_Reportes inner join  LF_Employees on
        rep_fk_emp_key_sup = emp_key
   Where rep_key =  #GetRep.rep_key#  
  order by emp_name  
</cfquery>


<!----------------------------------------------------- HTML starts here --------------------------------------------------------------------------------------->
<cfif #TRIM(GetRep.rep_notes)# neq "">
     <cfset pagesTotal = #GetRep.rep_pages# + 4>
<cfelse>
     <cfset pagesTotal = #GetRep.rep_pages# + 3>
</cfif>







<body id="body">

wesfswefgdFGwseFGWSGVWSGF

<div class="container text-center" id="container">   

<cfoutput>
<div class="whole" style="page-break-before: avoid !important; ">
<div id="box1">


  <!---  Page 1 ---------------------------------------------------------------->
<img src="./jennings3.png" class="img-fluid" id="banner">
<div id="line" style="margin-bottom:15px;"></div>
    <cfset ws_phone = 0> 
    <cfif #GetRep.emp_phone# GT 0>		
          <cfset ws_phone = #GetRep.emp_phone#>
        <cfset areacode = left(ws_phone, 3)>
        <cfset firstthree = mid(ws_phone, 4, 3)>
        <cfset lastfour = right(ws_phone, 4)>
        <cfset ws_phone = "(#areacode#) " & "#firstthree#" & "-" & "#lastfour#"> 
    </cfif> 


<p class="fs-6">#GetRep.rep_yyyymmdd#</p>
<p class="fs-6">To: #GetRep.rep_ws_to#</p>
<p class="fs-6">From: #GetRep.emp_name#</p>
<br>

<p class="fs-6 text-wrap">This report is a follow up to the safety inspection completed on #GetRep.rep_yyyymmdd#. The
      purpose of the inspection was to identify potential safety hazards and/or OSHA violations.<br>
      Attached is a list of observations and recommendations based on the conditions present at the 
      time of my visit. Please review the report and verify that all potential hazards are corrected. <br>
      If you have any questions or require additional information after reviewing this report, please
      don't hesitate to contact me.</p>
<p class="fs-6" id="no-space">Sincerely, </p><br>
<p class="fs-6" id="no-space">#GetRep.emp_name#</p>
<p class="fs-6" id="no-space"> LF Jennings, Inc.</p>
<p class="fs-6" id="no-space"> Safety Department</p>
<p class="fs-6" id="no-space"><cfif ws_phone neq 0>#ws_phone#<br></cfif>#GetRep.emp_email#</p>
</cfoutput> 
</div>
<div id="footer" style="white-space: nowrap;"><cfoutput>#pagesTotal#</cfoutput></div>
</div>

 
<!---  Page 1 end ---------------------------------------------------------------->





<!---  Page 2 ---------------------------------------------------------------->
<cfoutput> 
  <div class="whole" style="page-break-before: avoid !important; ">
<div id="box1">
<img src="./jennings3.png" class="img-fluid" id="banner">
<div id="line" style="margin-bottom:15px;"></div>
 <CFSET ws_fechaW = DateFormat(Now(),"mm/dd/yyyy")><cfoutput>#ws_fechaW#</cfoutput></p>




  <div class="card" style="width:100%; border-color:transparent;">
  <div class="card-body">
  <h3 class="card-title">Project Safety Inspection</h3>
  <h2 class="card-title"><strong>#GetRep.pr_desc#</strong></h2>
    <p class="card-text">Reported by: #GetRep.emp_name# </p>
   <p class="card-text">On-site Supervisor: #GetEmp.emp_name#</p>
   <p class="card-text">Scope of inspection: #GetRep.rep_desc#</p>
  </div>
</div>
 
</div>

<div id="footer" style="white-space: nowrap;"><cfoutput>#pagesTotal#</cfoutput></div>
</div>
</cfoutput>
<!---  Page 2 end ---------------------------------------------------------------->





<!----------------------------------- not html ----------------------------------->
  <cfset GetFoto.RecordCount=0>   
	<cfquery name="GetFoto" datasource="wolffdb_dsn">
	  Select *
		From LF_Photos left join LF_Reportes on 
             ph_fk_rep_key = rep_key
             left join LF_Photos2 on 
             ph_key = ph_fk_ph_key  
        where ph_fk_rep_key = #GetRep.rep_key#    
          and rep_user_name = '#SESSION.Auth.user_name#'   
          and ph_user_name = '#SESSION.Auth.user_name#'
		order by ph_yyyymmdd
	</cfquery>
<cfset ws_page = 0>
<cfloop query="GetFoto">
<!----------------------------------- not html ----------------------------------->









<!---  Page 3 ---------------------------------------------------------------->

<div class="whole" style="page-break-before: avoid !important; ">
<div id="box1">
  <table  class="table" width="100%">
    
    <cfset ws_page = ws_page + 1>
       <img src="./jennings3.png" class="img-fluid" id="banner">
        <div id="line" style="margin-bottom:15px;"></div>


<script type="text/javascript" language="JavaScript">

</script>
    <strong><p id="shaded">Observation <cfoutput>#ws_page#</cfoutput></p></strong> 
     
  <tr>
    <td colspan="3">
        <cfoutput>#GetFoto.ph_obs#</cfoutput>
    </td>
  </tr>
  <tr>
    <td colspan="3">
        <cfoutput>#GetFoto.ph_desc#</cfoutput>
    </td>
  </tr>

  <cfif #TRIM(GetFoto.ph_key)# eq #TRIM(GetFoto.ph_fk_ph_key)#>
    <tr>
    <td>
           
  
            




<div class="container text-center">
  <div class="row">
    <div class="col">
      <!--- <a href="#TRIM(GetFoto.ph_link)#"><img class="img-fluid" src="<cfoutput>#TRIM(GetFoto.ph_link)#</cfoutput>" id="resize"></a>

      <a href="#TRIM(GetFoto.ph_link2)#"><img class="img-fluid" src="<cfoutput>#TRIM(GetFoto.ph_link2)#</cfoutput>" id="resize"></a> --->
    </div>
  </div>
</div>


    </td>  
    <td>
     
    </td>
   </tr> 
  <cfelse> 
  <tr>  
    <td colspan="3">
      <!--- <a href="#TRIM(GetFoto.ph_link)#"><img class="img-fluid" src="<cfoutput>#TRIM(GetFoto.ph_link)#</cfoutput>" id="resize" ></a> --->
    </td>
</tr>
</cfif>
</table>

</div>

<div id="footer" style="white-space: nowrap;"><cfoutput>#pagesTotal#</cfoutput></div>
</div>
<!---  Page 3 end ---------------------------------------------------------------->


</cfloop>  



<!---  Page 4 ---------------------------------------------------------------->
<cfif #TRIM(GetRep.rep_notes)# neq "">
  <div class="whole" style="page-break-before: avoid !important; ">
<div id="box1">
<img src="./jennings3.png" class="img-fluid">
        <div id="line" style="margin-bottom:15px;"></div>
<table class="table" width="100%"> 
<tr>
  <td>
   <cfoutput> #TRIM(GetRep.rep_notes)# </cfoutput>
  </td>
</tr>
</table>
</div>

<div id="footer" style="white-space: nowrap;"><cfoutput>#pagesTotal#</cfoutput></div>
</div>
</cfif>
 <!---  Page 4 end ---------------------------------------------------------------->



  <!---  Page 5 ---------------------------------------------------------------->
  <div class="whole" style="page-break-before: avoid !important; ">
<div id="box1">
<img src="./jennings3.png" class="img-fluid" id="banner">
        <div id="line" style="margin-bottom:15px;"></div>
<table class="table">
  <tr><td>
    <br><br>
  Submitted by: <br>
<cfoutput>
  #GetRep.emp_name# <br><br>
  L.F. Jennings.<br>
  Safety Department<br>
  <cfif ws_phone neq 0>
  #ws_phone#<br>
  </cfif>    
  #GetRep.emp_email#
  </cfoutput>
</td></tr>
</table>
</div>

</div>
<div class="container">
<div id="footer" class="footer" ><cfoutput>#pagesTotal#</cfoutput></div>
</div>
 <!---  Page 5 end ---------------------------------------------------------------->

</div>  <!---  container --->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
</body>

</html>
