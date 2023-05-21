<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="my.css">
</head>
<body>
    <cfinclude template="menu.cfm"></cfinclude>
<div class="column2" style="background-color:#ffffff;">
<div class="main">
   <!---contenido --->
	
		
<CFSET GetVers.RecordCount=0>
<CFQUERY NAME="GetVers" datasource="wolffdb_dsn">
  SELECT *                  
  FROM  lVersiculos  
  Where V_IdVersiculo = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</CFQUERY>
   
 <cfparam name="url.action" default="">
	 

<cfform name="edit" method="post" action="act_upd_vers.cfm?claveU=#GetVers.V_IdVersiculo#">
	<cfoutput>
        <input type="hidden" name="V_IdVersiculo" value="#GetVers.V_IdVersiculo#">	
		<input type="hidden" name="V_IdCapitulo" value="#GetVers.V_IdCapitulo#">
    </cfoutput>
<table align="center">
<cfoutput>    
 
      <tr>
     	<td>Texto (RV60): </td>
		<td>
		 <cfinput name="V_Contenido" value="#GetVers.V_Contenido#" size="200"> 
		 
		</td>
       <!--- <td><cfinput name="cl_url" value="#GetVers.V_Contenido#" size="5000" ></td> --->   
     </tr>
	
	      <tr>
     	<td>Texto (LBLA): </td>
		<td>
		 <cfinput name="V_LBLA" value="#GetVers.V_LBLA#" size="200"> 
		 
		</td>
       <!--- <td><cfinput name="cl_url" value="#GetVers.V_Contenido#" size="5000" ></td> --->   
     </tr>
    
   
    </tr>
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Update Update Update Update Update Update Update Update Update Update Update Update Update Update Update Update Update "></td>
    </tr>   				
</table>
</cfoutput> 
</cfform>
	
  </div>
</div>


</body>
</html>
