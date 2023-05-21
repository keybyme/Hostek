<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="../my.css">

</head>
<body>
  
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
       
      <p>
		<div>
  
<CFSET GetMed.RecordCount=0>
<cfquery name = "GetMed" dataSource = "wolffdb_dsn">
    SELECT *         
    FROM QR_medical 
    WHERE med_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>			

<cfform name="edit" method="post" action="act_MedCards.cfm">
	<cfoutput>
        <input type="hidden" name="med_key" value="#GetMed.med_key#">	
    </cfoutput>
	<br>
<table align="center">
<cfoutput>    
    <tr>
        <td>Name: </td>
        <td><cfinput name="med_name" value="#GetMed.med_name#" size="50"></td>
    </tr>  
    <tr>
        <td>Last Name: </td>
        <td><cfinput name="med_last_name" value="#GetMed.med_last_name#" size="50"></td>
    </tr> 
    <tr>
        <td>Address: </td>
        <td><cfinput name="med_address" value="#GetMed.med_address#" size="50"></td>
    </tr>      
    <tr>
        <td>D.O.B.: </td>
        <td><cfinput name="med_dob" value="#GetMed.med_dob#" size="50"></td>
    </tr>   
    <tr>
        <td>First Contact:</td>
        <td><cfinput name="med_contact1_name" value="#GetMed.med_contact1_name#" size="50"></td>
    </tr>
    <tr>
        <td>First Contact Phone:</td>
        <td><cfinput name="med_contact1_phone" value="#GetMed.med_contact1_phone#" size="50"></td>
    </tr>
    <tr>
        <td>Second Contact:</td>
        <td><cfinput name="med_contact2_name" value="#GetMed.med_contact2_name#" size="50"></td>
    </tr>
    <tr>
        <td>Second Contact Phone:</td>
        <td><cfinput name="med_contact2_phone" value="#GetMed.med_contact2_phone#" size="50"></td>
    </tr>  
    <tr>
        <td>primary Doctor:</td>
        <td><cfinput name="med_primary_doc" value="#GetMed.med_primary_doc#" size="50"></td>
    </tr>
    <tr>
        <td>Primary Doctor Phone:</td>
        <td><cfinput name="med_primary_doc_phone" value="#GetMed.med_primary_doc_phone#" size="50"></td>
    </tr>    
    <tr>
        <td>Medication:</td>
        <td><cfinput name="med_medication" value="#GetMed.med_medication#" size="50"></td>
    </tr>      
    <tr>
        <td>Remarks:</td>
        <td><cfinput name="med_remarks" value="#GetMed.med_remarks#" size="50"></td>
    </tr>
    <tr>
        <td>Password:</td>
        <td><cfinput name="med_pass" value="" size="50"></td>
    </tr>    
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update"></td>
		
    </tr>  
</cfoutput>     
</table>

</cfform>
</div>
	  </p>
	  
     
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
   
  </div>
</div>
	


</body>
</html>
