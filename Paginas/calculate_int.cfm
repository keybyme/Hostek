<!DOCTYPE html>
<html lang="en">
<head>
  <title>Keybyme.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="my.css">

</head>
<body>
<cfinclude template="menu.cfm"></cfinclude>
	
<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    	<cflocation url="https://www.keybyme.com">
</cfif>   	
 
	
<form action="calculate_int.cfm">

<table align="center" border="0">
	<tr>
	  <th>
	      <h2 align="center">Calcular Interes</h2>
	  </th>	
	</tr>
	
	<tr>
				<td colspan="3">
           
			 <a href="Finanzas.cfm">Finanzas</a>&nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="Reportes.cfm">Reportes</a>	
            </td> 
	</tr>
	
	     <tr>
     	<th>Principal: </th>
        <td colspan="2">   
        <input 
         type="text" 
         name="balance" 	 
         class="form-control">
        </td>   
     </tr> 
	
     <tr>
     	<th>APR: </th>
        <td colspan="2">   
        <input 
         type="text"
         name="apr"  
		 class="form-control">
        </td>    
     </tr> 
 	
     <tr>
     	<th>Meses: </th>
        <td colspan="2">   
        <input 
         type="text" 
         name="meses" 	 
         class="form-control">
        </td>   
     </tr>
	
     <tr>
     	<td colspan="3"> 
        <input type="submit" name="enviar" value="Send">  
        </td>
     </tr>   	                                            
</table>     
</form>  
	 <cfif isDefined('url.apr') AND TRIM(url.apr) NEQ ''>
		 <cfset d_apr = (url.apr / 100) / 365>
		 <cfset d_int = d_apr * url.balance>
		 <cfset m_int = d_int * 30> 	 
		 <cfset y_int = d_int * 365>	
		 <cfset amortizacion = url.balance / url.meses>	 
		 <cfset mensualidad = amortizacion + m_int>	 
		 <cfset new_balance = url.balance - amortizacion>	 
	   <table align="center">
		<cfoutput>  
		<tr><td><strong>Principal</strong></td>
			<td><strong>#numberFormat(url.balance,'_$,9.99')#</strong></td></tr>	
		<tr><td><strong>APR</strong></td>
			<td><strong>#numberFormat(url.apr,'9.99')#%</strong></td></tr>	
		<tr><td><strong>Meses&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
			<td><strong>#url.meses#</strong></td></tr>	
		<tr><td><strong><a style="color: maroon">Interes Mensual&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
			<td><strong><a style="color: red">#numberFormat(m_int,'_$,9.99')#</a></strong></td></tr>	
	    <tr><td><strong>Interes Anual&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
			<td><strong>#numberFormat(y_int,'_$,9.99')#</strong></td></tr>	
		<tr><td><strong>Amortizacion mensual&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
			<td><strong>#numberFormat(amortizacion,'_$,9.99')#</strong></td></tr>	
		<tr><td><strong><a style="color: maroon">Mensualidad&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
			<td><strong><a style="color: red">#numberFormat(mensualidad,'_$,9.99')#</strong></td></tr>	
		<tr><td><strong><a style="color: maroon">Balance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
			<td><strong><a style="color: blue">#numberFormat(new_balance,'_$,9.99')#</strong></td></tr>		
		</td>   
		</tr>	                        
		</cfoutput>
		</table>    
	</cfif>
	  
</body>
</html>
