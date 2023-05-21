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

    <div>
    <img src="images/LogoLYV_12.gif" width="41" height="38" alt=""/>
    
    <h1 style="color: blue">Luz y Vida</h1>
    </div>
      <h1>Login</h1>
      <p> 
       <font color="red">Wrong Username and/or Password</font>
      </p> 

     <cfform name="LoginUser" method="post" action="LoginCheck.cfm">
      
		<table>
			<tr>
				<td>
		   <p>Username</p></td>
		   <td>
                  <!--- Text field for "User Name" --->  
                  <CFINPUT 
                  TYPE="Text"
                  NAME="UserLogin"
                  height="1"
                  SIZE="10"
                  VALUE=""
                  MAXLENGTH="100"
                  REQUIRED="Yes"
                  MESSAGE="Please, Enter username.">
         </td>
			   </tr>
			<tr>
			   <td>
			   <p>Password:</p>
			    </td>
                <td>
               <!--- Text field for Password --->  
                <CFINPUT 
                TYPE="Password"
                NAME="UserPassword"
                height="1"
                SIZE="10"
                VALUE=""
                MAXLENGTH="100"
                REQUIRED="Yes"
                MESSAGE="Please, Enter password.">
                </td>
               <!--- Submit Button that reads "Enter" --->  
              
		         <td>   
				</tr>
			    <tr><td>
		     <input type="Submit" value="Log in">
				   
             <!---<a href="../LuzyVida/logout.cfm">Log out</a>--->
		      </td>
				</tr>
	</table>     
   


</cfform>			
		  
 
  </div>
</div>
	 
</body>
</html>
