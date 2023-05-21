<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KeyByMe</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.11.4/css/dataTables.bootstrap4.min.css" rel="stylesheet">
 
</head>
<body>
<cfinclude template="menu.cfm"></cfinclude>
<div class="container">	
<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    	<cflocation url="https://www.keybyme.com">
</cfif> 

<cfset ws_flag = 0>		
<CFSET GetTrans.RecordCount=0>
<CFQUERY NAME="GetTrans" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  FN_Transacciones 		
  Where #SESSION.Auth.user_key# = fn_fk_user_key  	
	    <cfif #URL.fdU# GT ""> 
			<cfif #URL.fhU# GT ""> 
	            and fn_yyyymmdd between '#URL.fdU#' and '#URL.fhU#'
		    </cfif>		
		</cfif>	
  order by fn_yyyymmdd
</CFQUERY>		
	
        <cfset ws_total = 0>	
        <cfset ws_monto = 0> 
		<cfset ws_ini = "">	
			
		<cfloop query="GetTrans">   
        <cfoutput> 		
		<cfif #ws_flag# LT 1>
			<cfset ws_fecha = #TRIM(GetTrans.fn_yyyymmdd)#>
			<cfset ws_ini = #DateFormat(DateAdd('d', 0, ws_fecha),'yyyy-mm-dd')#> 	
			<cfset ws_flag = 1>	
	    </cfif>
		<cfset ws_fin = #TRIM(GetTrans.fn_yyyymmdd)#>	
		<cfset ws_montos = #TRIM(GetTrans.fn_monto)#>
		<cfset ws_total = ws_total + ws_montos> 		
		</cfoutput>	
        </cfloop>	
			
			
		<CFSET GetTrans2.RecordCount=0>
        <CFQUERY NAME="GetTrans2" datasource="wolffdb_dsn">
        SELECT  *                  
        FROM  FN_Transacciones inner join FN_Categorias on fn_fk_cat_key = cat_key 
		Where #SESSION.Auth.user_key# = fn_fk_user_key  	
          	    <cfif #URL.fdU# GT ""> 
			       <cfif #URL.fhU# GT ""> 
	                  and fn_yyyymmdd between '#URL.fdU#' and '#URL.fhU#'
		           </cfif>		
		        </cfif>		
        order by fn_fk_cat_key			
        </CFQUERY>	
		
		<cfset ws_color = 1>	
		<cfset ws_categoria = #TRIM(GetTrans2.fn_fk_cat_key)#>
		<cfset ws_cat = #TRIM(GetTrans2.cat_desc)#>	
		<cfset ws_cat_ant = #TRIM(GetTrans2.cat_desc)#>	
			
		<table border="4" width="100%" bordercolor="blue"> 
			<tr> 
			<td colspan="2"><h3>Expenses</h3></td>	
			<cfoutput> 	 
			<a style="color: brown">Fechas: #ws_ini# &nbsp; #ws_fin#</a>  
			</cfoutput>	
			<td>
			   <a href="Finanzas.cfm">Finanzas</a>
				
			</td>
			<td>	
			   <a href="Reportes.cfm">Reportes</a>
            </td> 	 
			</tr> 	
			
		<cfloop query="GetTrans2">
			  
				<cfif #TRIM(GetTrans2.cat_desc)# NEQ ws_cat_ant> 
                    <cfif ws_total GT 0>				  
				         <cfset ws_red = (ws_monto * 100) / ws_total>
					</cfif>	
					<cfoutput>	
					<cfset aa ="#ws_red#%">	
					<tr>	
					<td><strong>#ws_cat#</strong></td>
					<td align="right"><strong>#numberFormat(ws_monto,'_$,9.99')#</strong></td>
				    <td align="right"><strong>#numberFormat(ws_red,'9.99')#%</strong></td>
					<td></td>	
			        </tr>
					<tr>
					<td colspan="4">	
				    <table style="width: #aa#"> 
	                  <tr> 
						 <cfif ws_color EQ 1>	 
	                         <td style="background-color: red"><a style="color: red">.</a></td> 	  
						 <cfelseif ws_color EQ 2>
							 <td style="background-color: blue"><a style="color: blue">.</a></td> 
						 <cfelseif ws_color EQ 3>	
							 <td style="background-color: green"><a style="color: green">.</a></td> 
						 <cfelseif ws_color EQ 4>	
							 <td style="background-color: maroon"><a style="color: maroon">.</a></td> 
						 <cfelseif ws_color EQ 5>	
							 <td style="background-color: magenta"><a style="color: magenta">.</a></td> 	
						 <cfelseif ws_color EQ 6>	
							 <td style="background-color: yellowgreen"><a style="color: yellowgreen">.</a></td> 	 
						 <cfelseif ws_color EQ 7>	
							 <td style="background-color: aquamarine"><a style="color: aquamarine">.</a></td> 	
						 <cfelseif ws_color EQ 8>	
							 <td style="background-color: yellow"><a style="color: yellow">.</a></td> 	
						 <cfelse>	  
							 <td style="background-color: darkcyan"><a style="color: darkcyan">.</a></td> 
							 <cfset ws_color = 0>	 
						 </cfif>	
						 
					    <cfset ws_color = ws_color + 1>		 
	                  </tr>
	                </table>	
					</td>	
					<cfset ws_cat_ant = #TRIM(GetTrans2.cat_desc)#>	
					<cfset ws_cat = #TRIM(GetTrans2.cat_desc)#>	
					</cfoutput>	
					<cfset ws_monto = 0>
					</tr>
				  		
                </cfif>
							 
				<cfset ws_montos = #TRIM(GetTrans2.fn_monto)#>		
				<cfset ws_monto = ws_monto + ws_montos>  
			  </td>		
            </tr> 
		  				
		</cfloop> 
						
			<tr>
				 
					<cfset ws_red = (ws_monto * 100) / ws_total>
					<cfoutput>	
					<cfset aa ="#ws_red#%">	
					<td><strong>#ws_cat#</strong></td>
					<td align="right"><strong>#numberFormat(ws_monto,'_$,9.99')#</strong></td>
					<td align="right"><strong>#numberFormat(ws_red,'9.99')#%</strong></td> 
					<td></td>		
					 </tr>
					<tr>
					<td colspan="4">	
				    <table style="width: #aa#">
	                  <tr> 
	                    <td style="background-color: tomato"><a style="color: tomato">.</a></td> 	  
	                  </tr>
	                </table>
					</cfoutput>	
				</td>		
			</tr>	
			<tr><td></td>               
			<td align="right"><strong><cfoutput>Total = #numberFormat(ws_total,'_$,9.99')#</cfoutput></strong></td>	
			<td colspan="2"></td>  	
			</tr>		
    </table>
	<br><br>
	<!---++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--->		
							 
<CFSET GetTotal.RecordCount=0>
<CFQUERY NAME="GetTotal" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  FN_Income	
  Where #SESSION.Auth.user_key# = i_fk_user_key  	
	    <cfif #URL.fdU# GT ""> 
			<cfif #URL.fhU# GT ""> 
	            and i_fecha between '#URL.fdU#' and '#URL.fhU#'
		    </cfif>		
		</cfif>	 
</CFQUERY>								 
	    <cfset ws_color = 1>
        <cfset ws_total_i = 0>	
        <cfset ws_monto_i = 0>  
		<cfset ws_flag = 0>	
<cfloop query="GetTotal">   
        <cfoutput> 		  	
		<cfset ws_montos_i = #TRIM(GetTotal.i_monto)#>
		<cfset ws_total_i = ws_total_i + ws_montos_i> 		
		</cfoutput>	
</cfloop>		

<table border="4" width="100%" bordercolor="blue"> 
			<tr> 
			<td colspan="4"><h3>Income</h3></td>		 	 
			</tr> 	
	
<cfset GetCat.RecordCount=0>
<cfquery name="GetCat" datasource="wolffdb_dsn">
	  Select *
		From FN_Cat_Income
		Where ci_fk_user_key = #SESSION.Auth.user_key#
		order by ci_desc
</cfquery>	
	
<CFSET GetTotal2.RecordCount=0>
<CFQUERY NAME="GetTotal2" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  FN_Income inner join FN_Cat_Income on
	    i_from = ci_key
  Where #SESSION.Auth.user_key# = i_fk_user_key  	
	    <cfif #URL.fdU# GT ""> 
			<cfif #URL.fhU# GT ""> 
	            and i_fecha between '#URL.fdU#' and '#URL.fhU#'
		    </cfif>		
		</cfif>	 
  order by i_from	
</CFQUERY>	
	<cfif ws_flag LT 1>
	   	<cfset ws_cat = #TRIM(GetTotal2.i_from)#>	
		<cfset ws_cat_ant = #TRIM(GetTotal2.i_from)#>	
		<cfset ws_flag = 1>	
		<cfset ws_ci_desc = #TRIM(GetTotal2.ci_desc)#>	
	</cfif>		
		<cfloop query="GetTotal2">
			  
				<cfif #TRIM(GetTotal2.i_from)# NEQ ws_cat_ant> 
                    <cfif ws_total_i GT 0>				  
				         <cfset ws_red = (ws_monto_i * 100) / ws_total_i>
					</cfif>	
					<cfoutput>	
					<cfset aa ="#ws_red#%">	
					<tr>	
			 	 
					<select name="ifrom" size="1">	   
			             <cfloop query="GetCat"> 
						   <cfif #ws_cat# eq #GetCat.ci_key#>
							 	<td>#GetCat.ci_desc#</td> 
						   </cfif>
	                     </cfloop> 
                    </select>	
				  
					<td align="right"><strong>#numberFormat(ws_monto_i,'_$,9.99')#</strong></td>
				    <td align="right"><strong>#numberFormat(ws_red,'9.99')#%</strong></td>
					<td></td>	
			        </tr>
					<tr>
					<td colspan="4">	
				    <table style="width: #aa#"> 
	                  <tr> 
						 <cfif ws_color EQ 1>	 
	                         <td style="background-color: red"><a style="color: red">.</a></td> 	  
						 <cfelseif ws_color EQ 2>
							 <td style="background-color: blue"><a style="color: blue">.</a></td> 
						 <cfelseif ws_color EQ 3>	
							 <td style="background-color: green"><a style="color: green">.</a></td> 
						 <cfelseif ws_color EQ 4>	
							 <td style="background-color: maroon"><a style="color: maroon">.</a></td> 
						 <cfelseif ws_color EQ 5>	
							 <td style="background-color: magenta"><a style="color: magenta">.</a></td> 	
						 <cfelseif ws_color EQ 6>	
							 <td style="background-color: yellowgreen"><a style="color: yellowgreen">.</a></td> 	 
						 <cfelseif ws_color EQ 7>	
							 <td style="background-color: aquamarine"><a style="color: aquamarine">.</a></td> 	
						 <cfelseif ws_color EQ 8>	
							 <td style="background-color: yellow"><a style="color: yellow">.</a></td> 	
						 <cfelse>	  
							 <td style="background-color: darkcyan"><a style="color: darkcyan">.</a></td> 
							 <cfset ws_color = 0>	 
						 </cfif>	
					    <cfset ws_color = ws_color + 1>		 
	                  </tr>
	                </table>	
					</td>	
					<cfset ws_cat_ant = #TRIM(GetTotal2.i_from)#>	
					<cfset ws_cat = #TRIM(GetTotal2.i_from)#>	
					</cfoutput>	
					<cfset ws_monto_i = 0>
					</tr>
				  		
                </cfif>
							 
				<cfset ws_montos_i = #TRIM(GetTotal2.i_monto)#>		
				<cfset ws_monto_i = ws_monto_i + ws_montos_i>  
			  </td>		
            </tr> 
		  				
		</cfloop> 
						
			<tr>
				 
					<cfset ws_red = (ws_monto_i * 100) / ws_total_i>
					<cfoutput>	
					<cfset aa ="#ws_red#%">	
					<select name="ifrom" size="1">	   
			             <cfloop query="GetCat"> 
						   <cfif #ws_cat# eq #GetCat.ci_key#>
							 	<td>#GetCat.ci_desc#</td> 
						   </cfif>
	                     </cfloop> 
                    </select>		
					<td align="right"><strong>#numberFormat(ws_monto_i,'_$,9.99')#</strong></td>
					<td align="right"><strong>#numberFormat(ws_red,'9.99')#%</strong></td> 
					<td></td>		
					 </tr>
					<tr>
					<td colspan="4">	
				    <table style="width: #aa#">
	                  <tr> 
	                    <td style="background-color: tomato"><a style="color: tomato">.</a></td> 	  
	                  </tr>
	                </table>
					</cfoutput>	
				</td>		
			</tr>	
			<tr><td></td>               
			<td align="right"><strong><cfoutput>Total = #numberFormat(ws_total_i,'_$,9.99')#</cfoutput></strong></td>	
			<td></td>		
			<td></td>  	
			</tr>		
    </table>							 
		
							 
	<!---++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--->						 
</div>
</body>
</html>
