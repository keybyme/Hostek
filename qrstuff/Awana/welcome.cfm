<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome</title>
<Style>

   body {margin: 0px;}
   
</style>
</head>

<body>
<cfinclude template="header.cfm">
<cfquery name = "GetRolls" dataSource = "wolffdb_dsn">
    SELECT *
    FROM QR_Roll
    Where roll_en_id_key = '#TRIM(SESSION.Auth.user_en_id_key)#' 
    and  roll_nro = #TRIM(SESSION.AUTH.roll)#
</cfquery>
<table cellpadding="1" cellspacing="1" border="1" align="center">
  <tr>
    <td rowspan="2">
    	<cfoutput><strong> #SESSION.Auth.Entidad# </strong></cfoutput> 
    </td>    
  
	   
	<cfif #TRIM(SESSION.Auth.roll_upd_kid)# EQ 1>	
       		<td align="center" style="font:larger" colspan="2">Kids</td>
    </cfif>
	<cfif #TRIM(SESSION.Auth.roll_upd_bank)# EQ 1>	
       		<td align="center" style="font:larger" colspan="2">Bank Acct.</td>
    </cfif>		
	<cfif #TRIM(SESSION.Auth.roll_upd_bank)# EQ 1>	
       		<td align="center" style="font:larger" colspan="2">Credit cards</td>
    </cfif>	  
	<cfif #TRIM(SESSION.Auth.roll_upd_teacher)# EQ 1>	
       		<td align="center" style="font:larger" colspan="2">Liders</td>
    </cfif>
	<cfif #TRIM(SESSION.Auth.roll_key)# GT 98>	
       		<td align="center" style="font:larger" colspan="2">Users</td>
    </cfif>    
	<cfif #TRIM(SESSION.Auth.roll_key)# GT 98>	
       		<td align="center" style="font:larger" colspan="2">Rolls</td>
    </cfif>                
  </tr> 
  <tr> 
		  	<cfif #TRIM(SESSION.Auth.roll_upd_kid)# EQ 1>
   				<td align="center" align="center"> 
					<a href="add_kids.cfm">Add</a>&nbsp;&nbsp;&nbsp;</td>
    	  	<cfelse>
		  		<td>&nbsp;</td>
		  	</cfif>	
		   
				<td align="center" align="center"> 
					<a href="listar_kids.cfm">List</a>&nbsp;&nbsp;&nbsp;</td>
                    
		  	<cfif #TRIM(SESSION.Auth.roll_upd_bank)# EQ 1>
   				<td align="center" align="center"> 
					<a href="add_Bank.cfm">Add</a>&nbsp;&nbsp;&nbsp;</td>
    	  	<cfelse>
		  		<td>&nbsp;</td>
		  	</cfif>	
		   
				<td align="center" align="center"> 
					<a href="listar_Bank.cfm">List</a>&nbsp;&nbsp;&nbsp;</td>	

            <cfif #TRIM(SESSION.Auth.roll_upd_bank)# EQ 1>
   				<td align="center" align="center"> 
					<a href="add_CC.cfm">Add</a>&nbsp;&nbsp;&nbsp;</td>
    	  	<cfelse>
		  		<td>&nbsp;</td>
		  	</cfif>	
		   
				<td align="center" align="center"> 
					<a href="listar_CC.cfm">List</a>&nbsp;&nbsp;&nbsp;</td>	                    		
   
             <cfif #TRIM(SESSION.Auth.roll_upd_teacher)# EQ 1>
   				<td align="center" align="center"> 
					<a href="add_teacher.cfm">Add</a>&nbsp;&nbsp;&nbsp;</td>
    	  	<cfelse>
		  		<td>&nbsp;</td>
		  	</cfif>	
		   
				<td align="center" align="center"> 
					<a href="listar_teacher.cfm">List</a>&nbsp;&nbsp;&nbsp;</td>	   
        
             <cfif #TRIM(SESSION.Auth.roll_key)# GT 98>	
   				<td align="center" align="center"> 
					<a href="add_user.cfm">Add</a>&nbsp;&nbsp;&nbsp;</td>
    	  	<cfelse>
		  		<td>&nbsp;</td>
		  	</cfif>	
		   
				<td align="center" align="center"> 
					<a href="listar_user.cfm">List</a>&nbsp;&nbsp;&nbsp;</td>            
                    
           <cfif #TRIM(SESSION.Auth.roll_key)# GT 98>	
   				<td align="center" align="center"> 
					<a href="add_Rolls.cfm">Add</a>&nbsp;&nbsp;&nbsp;</td>
    	  	<cfelse>
		  		<td>&nbsp;</td>
		  	</cfif>	
		   
				<td align="center" align="center"> 
					<a href="Listar_Rolls.cfm">List</a>&nbsp;&nbsp;&nbsp;</td>                               
 </tr>
</table>

</body>
</html>