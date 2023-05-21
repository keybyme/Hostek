<style type="text/css">
  .style9 {
     color:#000066;
	 font-family:Geneva, Arial, Helvetica, sans-serif;
	 font-size:18px;
 } 
 .style1 {
	 color:#900;
	 font-style:normal;
	 font-size:11px;
 }
</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BIBLIA</title>
</head>

<body>
 
<cfset ws_today = #DateFormat("# Now()#", "mmdd")#>
  
        
<cfquery name = "GetBiblia" dataSource = "wolffdb_dsn"> 
    SELECT Lectura.lec_key
	     , Lectura.lec_am_libro
         , Lectura.lec_am_cap_start
         , Lectura.lec_am_cap_end
         , Lectura.lec_am_vers_start
         , Lectura.lec_am_vers_end 
		 , Reina_Valera.rv_libro
		 , Reina_Valera.rv_capitulo
		 , Reina_Valera.rv_versiculo
		 , Reina_Valera.rv_contenido
    FROM Lectura  LEFT OUTER JOIN Reina_Valera ON
         (Reina_Valera.rv_libro = Lectura.lec_am_libro
	      and (Reina_Valera.rv_capitulo between Lectura.lec_am_cap_start and Lectura.lec_am_cap_end))
    Where Lectura.lec_fecha = #TRIM(ws_today)#  
	
</cfquery>

<cfquery name = "GetLibro" dataSource = "wolffdb_dsn"> 
    SELECT id
	     , Descripcion
    FROM Libros
    Where id = #TRIM(GetBiblia.rv_libro)#  
	
</cfquery>

		<cfset ws_I = 0>
		<table width="800" border="1" align="center">
  
    </table>
    <table width="800" border="1" align="center">
			<tr>      
    		<th colspan="3" align="center" style="font-size:24px">
        		Lectura de Hoy: &nbsp;&nbsp;
         		<cfif GetBiblia.RecordCount GT 0> 
         			<cfoutput>
           				#Trim(GetLibro.Descripcion)# &nbsp;&nbsp;     
           			</cfoutput>
         		</cfif>  
   			</th>
            <th>
               <span class="style1">
                        	Esta lectura cambia dos veces por dia (AM y PM), <br>
                            y en un a&ntilde;o se puede leer completamente.
               </span>
            </th>
         </tr>   
    </table>
    <table width="800" border="1" align="center">
			<tr>        
  		     
    		<th style="color:#006" bgcolor="#CCCCCC">Cap&iacute;tulo</th> 
    		<th style="color:#006" bgcolor="#CCCCCC">Verso</th>
    		<th style="color:#006" bgcolor="#CCCCCC">Contenido</th>      
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
						<cfif NOT (('#TRIM(GetBiblia.lec_am_cap_end)#' EQ '#TRIM(GetBiblia.rv_capitulo)#') and
						           (('#TRIM(GetBiblia.rv_versiculo)#' GT '#TRIM(GetBiblia.lec_am_vers_end)#') or
								   ('#TRIM(GetBiblia.rv_versiculo)#' LT '#TRIM(GetBiblia.lec_am_vers_start)#')))>  
				        	<td bgcolor="#(ws_color)#" style="font-size:small"><span class="style9">#TRIM(GetBiblia.rv_capitulo)#</span></td>
 				        	<td bgcolor="#(ws_color)#" style="font-size:small"><span class="style9">#TRIM(GetBiblia.rv_versiculo)#</span></td>
 				        	<td bgcolor="#(ws_color)#" style="font-size:small"><span class="style9">#TRIM(GetBiblia.rv_contenido)#</span></td>	 
						</cfif
					></tr>    
				</cfoutput>
			</cfoutput> 
		
</table>


</body>
</html>