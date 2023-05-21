<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="my.css">
</head>
<body>
    <cfinclude template="menu.cfm"></cfinclude>
	 
  
    <div class="column2" style="background-color:#ffffff;">
      <div class="main">
      <h1>Diccionario B&iacute;blico</h1>
      <p>
		<div>
   <!---contenido --->
	<cfif isDefined("form.Criteria")>
         <cfset url.Criteria = trim(form.Criteria)>
    </cfif>
		
	<cfif isDefined("form.startRow")>
	     <cfset url.startRow = trim(form.startRow)>	
	</cfif>
		
	<cfset ws_I = 0>

		
<CFSET GetWord.RecordCount=0>
<CFQUERY NAME="GetWord" datasource="wolffdb_dsn">
  SELECT *                  
  FROM  Diccionario
  
  	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
     WHERE  dic_palabra LIKE '%#Trim(url.Criteria)#%'                    
    </cfif> 
  order by dic_palabra	
</CFQUERY>
 
	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
		<cfset ws_end_row = 200>
	<cfelse>		
	    <cfset ws_end_row = #Trim(url.startRow)# + 11> 		
	</cfif>			    		
		
	 
<cfform name="disp" method="post" action="Diccionario.cfm?startRow=1">

 
    
    	
        <td>Search:  <input name="Criteria" size="30"></td>
       
         <td valign="bottom" colspan="2"><input type="submit" name="editpho" value="send"></td> 
               
 
</cfform>
 
     <!---   <p>
        <th style="color:#006" bgcolor="#CCCCCC">Palabra</th>
        <th style="color:#006" bgcolor="#CCCCCC">Definici&oacute;n</th>
        </p> --->      
 <table border="1" bordercolor="#CC0000">      

 <cfloop query="GetWord" startrow="#trim(url.startRow)#" endrow="#ws_end_row#">
 <!---<cfloop query="GetWord">---> 
 <cfoutput> 
	 
	 	    	<cfif ws_I EQ 0>
                <cfset ws_color = bgcolorNo>
                <cfset ws_I = 1>
          <cfelse>
                <cfset ws_color = bgcolorYes>
                <cfset ws_I = 0>
          </cfif> 
	 
 
 
  <tr>
  	<td bgcolor="#(ws_color)#"> 
   <strong>#TRIM(GetWord.dic_palabra)# </strong></td>
   <td bgcolor="#(ws_color)#">
   #TRIM(GetWord.dic_definicion)#</td>
    
  </tr> 
	 
  
 </cfoutput>
 </cfloop>
</table>
 	
			
	<cfoutput>
		<br>
	<cfif NOT (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '')>	
		
	   <cfif ws_end_row GT 12>
	     <cfset ws_prev = trim(url.startRow) - 12>	
	     <a href="Diccionario.cfm?startRow=#ws_prev#"><strong>Prev Page</strong></a>	
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   </cfif>		 
	   <cfset ws_end_row = ws_end_row + 1>		
	   <a href="Diccionario.cfm?startRow=#ws_end_row#"><strong>Next Page</strong></a>
	</cfif>	
	</cfoutput> 			
			
			
   <!---End contenido	--->	
			
</div>
	  </p>
      
      <!---<h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div> 
  </div>
</div>


</body>
</html>
