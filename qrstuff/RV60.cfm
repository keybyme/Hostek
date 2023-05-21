<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reina Valera</title>
</head>

<body>
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


 
<cfset ws_today = #DateFormat("# Now()#", "mmdd")#>
<cfset ws_time = #TimeFormat("# Now()#", "HH")#>  
        
<cfquery name = "GetBiblia" dataSource = "wolffdb_dsn"> 
   
     SELECT Lectura.lec_key
     <cfif ws_time GT 11>
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
         , Lectura.lec_fecha
		 , lLibros.L_IdLibro
         , lLibros.L_Libro_Desc
		 , lCapitulos.C_IdLibro
		 , lCapitulos.C_IdCapitulo
		 , lCapitulos.C_Capitulo_Desc
         , lVersiculos.V_Contenido
         , lVersiculos.V_IdCapitulo
         , lVersiculos.V_versiculo
         From Lectura JOIN lLibros ON
         <cfif ws_time GT 11>
		  Lectura.lec_pm_libro = lLibros.L_IdLibro
		  JOIN lCapitulos ON (lCapitulos.C_Capitulo_Desc between Lectura.lec_pm_cap_start and Lectura.lec_pm_cap_end)
		    and Lectura.lec_pm_libro = lCapitulos.C_IdLibro
         JOIN lVersiculos on lCapitulos.C_IdCapitulo = lVersiculos.V_IdCapitulo 
		   and (lVersiculos.V_versiculo between Lectura.lec_pm_vers_start and Lectura.lec_pm_vers_end)
		    and Lectura.lec_pm_libro = lCapitulos.C_IdLibro
         <cfelse>
          Lectura.lec_am_libro = lLibros.L_IdLibro
		  JOIN lCapitulos ON (lCapitulos.C_Capitulo_Desc between Lectura.lec_am_cap_start and Lectura.lec_am_cap_end)
		    and Lectura.lec_am_libro = lCapitulos.C_IdLibro
         JOIN lVersiculos on lCapitulos.C_IdCapitulo = lVersiculos.V_IdCapitulo 
		   and (lVersiculos.V_versiculo between Lectura.lec_am_vers_start and Lectura.lec_am_vers_end)
		    and Lectura.lec_am_libro = lCapitulos.C_IdLibro
         </cfif>   
	    where Lectura.lec_fecha = #TRIM(ws_today)# 
	
</cfquery>


		<cfset ws_I = 0>

  <table width="100%">
  <tr><td>  
    <table width="100%" border="1" align="center">
			<tr>      
    		<th colspan="3" align="center" style="font-size:25px">
        		Lectura de Hoy: &nbsp;&nbsp;<br>
         		<cfif GetBiblia.RecordCount GT 0> 
         			<cfoutput>
           				#Trim(GetBiblia.L_Libro_Desc)# &nbsp;&nbsp;     
       			  </cfoutput>
         		</cfif>  
   			</th>
            <th>
              <a href="http://www.KeyByMe.com" target="_blank">
				  <img src="https://www.keybyme.com/image/Keybyme_logo10.gif" width="309" height="105" alt=""/></a></th>
         </tr>   
    </table>
  </td></tr>
  <tr><td>  
    <table width="100%" border="1" align="center">
			        
  		     
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Cap&iacute;tulo</th> 
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Verso</th>
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Contenido</th>      
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
                        <cfif ws_time GT 11>
                          <cfif NOT (('#TRIM(GetBiblia.lec_pm_cap_end)#' EQ '#TRIM(GetBiblia.C_Capitulo_Desc)#') and
						           (('#TRIM(GetBiblia.V_versiculo)#' GT '#TRIM(GetBiblia.lec_pm_vers_end)#') or
								   ('#TRIM(GetBiblia.V_versiculo)#' LT '#TRIM(GetBiblia.lec_pm_vers_start)#')))> 
				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.C_Capitulo_Desc)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.V_versiculo)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.V_contenido)#</span></td>	 
						  </cfif>
                        <cfelse>
						  <cfif NOT (('#TRIM(GetBiblia.lec_am_cap_end)#' EQ '#TRIM(GetBiblia.C_Capitulo_Desc)#') and
						           (('#TRIM(GetBiblia.V_versiculo)#' GT '#TRIM(GetBiblia.lec_am_vers_end)#') or
								   ('#TRIM(GetBiblia.V_versiculo)#' LT '#TRIM(GetBiblia.lec_am_vers_start)#')))> 
				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.C_Capitulo_Desc)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.V_versiculo)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.V_contenido)#</span></td>	 
						  </cfif>
                        </cfif>
                  </tr>    
				</cfoutput>
			</cfoutput> 
		
     </table>
</td></tr>
</table>

</body>
</html>