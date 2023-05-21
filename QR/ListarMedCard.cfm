<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body

h2 {
  color:blue;
  text-align: center;
  font-size:40px;
}

p1 {
  font-family: verdana;
  font-size: 30px;
  color: blueviolet;
}
p2 {
  font-family: verdana;
  font-size: 20px;
  color:green;
}   
p3 {
  font-family: verdana;
  font-size: 20px;
  color:red;
}      
</style>    

</head>
<body>
 
<div class="container-fluid text-center">    
  <div class="row content">


	  
    <div class="col-sm-8 text-left"> 
      
		<div>

<CFSET GetMed.RecordCount=0>
<cfquery name = "GetMed" dataSource = "wolffdb_dsn">
    SELECT *         
    FROM QR_medical 
    WHERE med_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>
 <cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">	
				    	<h2 align="center"> <cfoutput>#TRIM(GetMed.med_name)# #TRIM(GetMed.med_last_name)#</cfoutput> </h2>
	                
<table border="2" bordercolor="#blue" align="center">
	<cfif (isDefined('url.invalido') AND TRIM(url.invalido) EQ '1')>
         <tr><td align="center" colspan="3">
            <p3>Invalid Password</p3> 
         </td></tr>  
    </cfif> 
<tr>
  <td><img src="images/MedEmblem.png" width="62" height="51" alt=""/></td>    
  <td><p1>Emergency Info Card</p1></td>  
  <td><img src="images/CruzRoja.png" width="76" height="42" alt=""/></td> 
</tr>
<tr><td colspan="3">
<table border="2" bordercolor="#blue" align="center" width="100%">
<cfoutput>     
<tr>
  <th bgcolor="#WbgcolorYes#">D.O.B.</th>      
  <td bgcolor="#WbgcolorYes#">#TRIM(GetMed.med_dob)#</td> 
</tr>
<tr>
  <th bgcolor="#WbgcolorNo#">Address</th>      
  <td bgcolor="#WbgcolorNo#">#TRIM(GetMed.med_address)#</td> 
</tr>  
<tr>
  <th bgcolor="#WbgcolorYes#">First Contact</th>      
  <td bgcolor="#WbgcolorYes#">#TRIM(GetMed.med_contact1_name)#</td> 
</tr>       
<tr>
    <th bgcolor="#WbgcolorNo#">First Contact Phone</th>
 	<cfset ws_phone = 0> 
	<cfif #GetMed.med_contact1_phone# GT 0>
		<cfset ws_phone = #GetMed.med_contact1_phone#>
		<cfset areacode = left(ws_phone, 3)>
		<cfset firstthree = mid(ws_phone, 4, 3)>
		<cfset lastfour = right(ws_phone, 4)>
		<cfset ws_phone = "(#areacode#) " & "#firstthree#" & "-" & "#lastfour#">
	</cfif>     
    <td bgcolor="#WbgcolorNo#"><a href="tel:#TRIM(ws_phone)#">#TRIM(ws_phone)#</a></td> 
</tr>     
<tr>
  <th bgcolor="#WbgcolorYes#">Second Contact</th>      
  <td bgcolor="#WbgcolorYes#">#TRIM(GetMed.med_contact2_name)#</td> 
</tr>       
<tr>
  <th bgcolor="#WbgcolorNo#">Second Contact Phone</th>  
 	<cfset ws_phone = 0> 
	<cfif #GetMed.med_contact2_phone# GT 0>
		<cfset ws_phone = #GetMed.med_contact2_phone#>
		<cfset areacode = left(ws_phone, 3)>
		<cfset firstthree = mid(ws_phone, 4, 3)>
		<cfset lastfour = right(ws_phone, 4)>
		<cfset ws_phone = "(#areacode#) " & "#firstthree#" & "-" & "#lastfour#">
	</cfif>     
    <td bgcolor="#WbgcolorNo#"><a href="tel:#TRIM(ws_phone)#">#TRIM(ws_phone)#</a></td>     
 
</tr>    
<tr>
  <th bgcolor="#WbgcolorYes#">Primary Doctor</th>      
  <td bgcolor="#WbgcolorYes#">#TRIM(GetMed.med_primary_doc)#</td> 
</tr>       
<tr>
  <th bgcolor="#WbgcolorNo#">Primary Doctor Phone</th>  
   	<cfset ws_phone = 0> 
	<cfif #GetMed.med_primary_doc_phone# GT 0>
		<cfset ws_phone = #GetMed.med_primary_doc_phone#>
		<cfset areacode = left(ws_phone, 3)>
		<cfset firstthree = mid(ws_phone, 4, 3)>
		<cfset lastfour = right(ws_phone, 4)>
		<cfset ws_phone = "(#areacode#) " & "#firstthree#" & "-" & "#lastfour#">
	</cfif>     
    <td bgcolor="#WbgcolorNo#"><a href="tel:#TRIM(ws_phone)#">#TRIM(ws_phone)#</a></td>      
</tr>     
<tr>
  <th bgcolor="#WbgcolorYes#">Medication</th>      
  <td bgcolor="#WbgcolorYes#">#TRIM(GetMed.med_medication)#</td> 
</tr>    
<tr>
  <th bgcolor="#WbgcolorNo#">Remarks</th>      
  <td bgcolor="#WbgcolorNo#">#TRIM(GetMed.med_remarks)#</td> 
</tr>   
<tr>
    <td colspan="2" align="center">
       <a href="UploadInsCards.cfm?claveU=#TRIM(GetMed.med_key)#">Add/Edit Insurance Card</a>
    </td>
</tr>            
<tr>
 <cfif #TRIM(GetMed.med_insurances_card)# eq "">     
    <td colspan="2" align="center">&nbsp;</td>
<cfelse>     
    <cfset wsimage = Replace(GetMed.med_insurances_card, "%20", " ")/>
  <td colspan="2" align="center"><img src="#wsimage#" width="300" height="200"  alt=""/></td> 
</cfif>    
</tr>  
<tr>
    <td colspan="2" align="center">
       <a href="UploadCovidCards.cfm?claveU=#TRIM(GetMed.med_key)#">Add/Edit Covid Vaccine Card</a>
    </td>
</tr>             
<tr>
<cfif #TRIM(GetMed.med_covid_vacuna)# eq "">    
    <td colspan="2" align="center">&nbsp;</td>
<cfelse>
    <cfset wsimage = Replace(GetMed.med_covid_vacuna, "%20", " ")/>
    <td colspan="2" align="center"><img src="#wsimage#" width="300" height="200"  alt=""/></td> 
</cfif>    
</tr>             
<tr><td align="center" colspan="2"><a href="Upd_MedCards.cfm?claveU=#TRIM(GetMed.med_key)#"><p2>Edit   Edit   Edit</p2></a></td></tr>            
</cfoutput>     
</table></td></tr> 
</table>
</div>
    </div>
 
  </div>
</div>
	


</body>
</html>
