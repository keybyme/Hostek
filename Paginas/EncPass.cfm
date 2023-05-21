<!DOCTYPE html>
<html lang="en">
<head>
  <title>KeyByMe.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="my.css">
	
</head>
<body>

	<cfinclude template="menu.cfm"></cfinclude>
  
<div class="container-fluid text-center">    
  <div class="row content">

<cfset GetLlave.RecordCount=0>
<cfquery name="GetLlave" datasource="wolffdb_dsn">
	  Select *
		From Pllaves
</cfquery>		 
	  
    <div class="col-sm-8 text-left"> 
      <h1>Encrypt Password</h1>
      <p>
	<div>	
  <!---Contenido--->
   

		
     <cfform name="LoginUser" method="post" action="EncPass2.cfm">
      
		<table>
			<tr>
				<td>
		   <p>Palabra</p></td>
		   <td>
                  <!--- Text field for "User Name" --->  
                  <CFINPUT 
                  TYPE="Text"
                  NAME="Palabra"
                  height="1"
                  SIZE="40"
                  VALUE=""
                  MAXLENGTH="100"
                  REQUIRED="Yes"
                  MESSAGE="Please, Enter Palabra.">
         </td>
			   </tr>
			<tr>
			   <td>
			   <p>Llave:</p>
			    </td>
                <td>
               <!--- Text field for Password --->  
                <CFINPUT 
                TYPE="Text"
                NAME="Llave"
                height="1"
                SIZE="40"
                VALUE=""
                MAXLENGTH="100"
                REQUIRED="Yes"
                MESSAGE="Please, Enter Llave.">
                </td>
               <!--- Submit Button that reads "Enter" --->  
              
		         <td>   
				</tr>
			    <tr><td>
		     <input type="Submit" value="Send to Encrypt">
				   
		      </td>
				</tr>
	</table>     
   


</cfform>			
		<br>
		<cfloop query="Getllave">   
        <cfoutput> 		
		  	#Getllave.llave_llave#<br>
		</cfoutput>  
		</cfloop>	
  <!---End Contenido	--->		
</div>
	  </p>
      
     <!--- <h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div>
  
  </div>
</div>
	
	 

</body>
</html>
