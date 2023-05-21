<style type="text/css">
  .style9 {
     color:#000066;
	 font-family:Geneva, Arial, Helvetica, sans-serif;
	 font-size:20px;
 } 
    .style19 {
     color:#000066;
	 font-family:Geneva, Arial, Helvetica, sans-serif;
	 font-size:22px;
 }
 .style1 {
	 color:#900;
	 font-style:normal;
	 font-size:20px;
 }
</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>New Living Translation</title>
</head>

<body>
 
<cfset ws_today = #DateFormat("# Now()#", "mmdd")#>
<cfset ws_time = #TimeFormat("# Now()#", "HH")#>  
        
<cfquery name = "GetBiblia" dataSource = "wolffdb_dsn"> 
    SELECT Lectura.lec_key
        <cfif ws_time GT 9>
	     , Lectura.lec_pm_libro
         , Lectura.lec_pm_cap_start
         , Lectura.lec_pm_cap_end
         , Lectura.lec_pm_vers_start
         , Lectura.lec_pm_vers_end 
         <cfelse>
	     , Lectura.lec_am_libro
         , Lectura.lec_am_cap_start
         , Lectura.lec_am_cap_end
         , Lectura.lec_am_vers_start
         , Lectura.lec_am_vers_end                    
         </cfif> 
		 , Reina_Valera.rv_libro
		 , Reina_Valera.rv_capitulo
		 , Reina_Valera.rv_versiculo
		 , Reina_Valera.rv_contenido_NLT
    FROM Lectura  LEFT OUTER JOIN Reina_Valera ON
         <cfif ws_time GT 9>
         (Reina_Valera.rv_libro = Lectura.lec_pm_libro
	      and (Reina_Valera.rv_capitulo between Lectura.lec_pm_cap_start and Lectura.lec_pm_cap_end))
          <cfelse>
          (Reina_Valera.rv_libro = Lectura.lec_am_libro
	      and (Reina_Valera.rv_capitulo between Lectura.lec_am_cap_start and Lectura.lec_am_cap_end))
          </cfif>
    Where Lectura.lec_fecha = #TRIM(ws_today)#  
	
</cfquery>

<cfquery name = "GetLibro" dataSource = "wolffdb_dsn"> 
    SELECT id
	     , Descripcion
    FROM Libros
    Where id = #TRIM(GetBiblia.rv_libro)#  
	
</cfquery>

		<cfset ws_I = 0>

    
    <table width="100%" border="1" align="center">
			<tr>      
    		<th colspan="3" align="center" style="font-size:25px">
        		Lectura de Hoy: &nbsp;&nbsp;
         		<cfif GetBiblia.RecordCount GT 0> 
         			<cfoutput>
           				#Trim(GetLibro.Descripcion)# &nbsp;&nbsp;     
       			  </cfoutput>
         		</cfif>  
   			</th>
            <th>
            <a href="http://www.qrcodetech.com" target="_blank">
              <img src="image/qrstuff_image.gif" width="603" height="101" /></a>
            </th>
         </tr>   
    </table>
    <table width="100%" border="1" align="center">
			<tr>        
  		     
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Chapter</th> 
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Vers</th>
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">body</th>      
 			<cfoutput query="GetBiblia" group="lec_key">
 				<cfoutput>
        			<tr>
				    	<cfif ws_I EQ 0>
                 	         <cfset ws_color = bgcolorNo>
                             <cfset ws_I = 1>
                        <cfelse>
                             <cfset ws_color = bgcolorYes>
                             <cfset ws_I = 0>
                        </cfif>  
                        <cfif ws_time GT 9>
                          <cfif NOT (('#TRIM(GetBiblia.lec_pm_cap_end)#' EQ '#TRIM(GetBiblia.rv_capitulo)#') and
						           (('#TRIM(GetBiblia.rv_versiculo)#' GT '#TRIM(GetBiblia.lec_pm_vers_end)#') or
								   ('#TRIM(GetBiblia.rv_versiculo)#' LT '#TRIM(GetBiblia.lec_pm_vers_start)#')))>   
				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_capitulo)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_versiculo)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_contenido_NLT)#</span></td>	 
						  </cfif>
                        <cfelse>
						  <cfif NOT (('#TRIM(GetBiblia.lec_am_cap_end)#' EQ '#TRIM(GetBiblia.rv_capitulo)#') and
						           (('#TRIM(GetBiblia.rv_versiculo)#' GT '#TRIM(GetBiblia.lec_am_vers_end)#') or
								   ('#TRIM(GetBiblia.rv_versiculo)#' LT '#TRIM(GetBiblia.lec_am_vers_start)#')))>  
				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_capitulo)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_versiculo)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_contenido_NLT)#</span></td>	 
						  </cfif>
                        </cfif>
                  </tr>    
				</cfoutput>
			</cfoutput> 
		
</table>


</body>
</html>