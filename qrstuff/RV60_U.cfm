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
		 , Reina_Valera.rv_libro
		 , Reina_Valera.rv_capitulo
		 , Reina_Valera.rv_versiculo
		 , Reina_Valera.rv_contenido
    FROM Lectura  LEFT OUTER JOIN Reina_Valera ON
         <cfif ws_time GT 11>
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

<cfquery name = "GetCodigos" dataSource = "wolffdb_dsn">
    SELECT *
      
    FROM QR_Codigos 
           
    WHERE cd_codigo = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_char">
    
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
           				#Trim(GetLibro.Descripcion)# &nbsp;&nbsp;     
       			  </cfoutput>
         		</cfif>  
   			</th>
            <th>
              <a href="http://www.qrcodetech.com" target="_blank">
              <img src="image/qrstuff_image.gif"></a></th>
         </tr>   
    </table>
  </td></tr>
  <cfif GetCodigos.cd_flag_1_activo EQ 1>
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
                          <!---<cfif NOT ('#TRIM(GetBiblia.lec_pm_cap_end)#' EQ '#TRIM(GetBiblia.rv_capitulo)#' and
						             '#TRIM(GetBiblia.rv_versiculo)#' GT '#TRIM(GetBiblia.lec_pm_vers_end)#')>---> 
                                     
                         <cfif NOT (('#TRIM(GetBiblia.lec_pm_cap_end)#' EQ '#TRIM(GetBiblia.rv_capitulo)#') and
						           (('#TRIM(GetBiblia.rv_versiculo)#' GT '#TRIM(GetBiblia.lec_pm_vers_end)#') or
								   ('#TRIM(GetBiblia.rv_versiculo)#' LT '#TRIM(GetBiblia.lec_pm_vers_start)#')))>           
				        	<td valign="top" bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_capitulo)#</span></td>
 				        	<td valign="top" bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_versiculo)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_contenido)#</span></td>	 
						  </cfif>
                        <cfelse>
						  <cfif NOT ('#TRIM(GetBiblia.lec_am_cap_end)#' EQ '#TRIM(GetBiblia.rv_capitulo)#' and
						             '#TRIM(GetBiblia.rv_versiculo)#' GT '#TRIM(GetBiblia.lec_am_vers_end)#')> 
				        	<td valign="top" bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_capitulo)#</span></td>
 				        	<td valign="top" bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_versiculo)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.rv_contenido)#</span></td>	 
						  </cfif>
                        </cfif>
                  </tr>    
				</cfoutput>
			</cfoutput> 
		
     </table>
</td></tr>
<tr><td>
<cfoutput>
Este servicio expira en #DATEFORMAT(TRIM(GetCodigos.cd_fecha_until),"mm/dd/yyyy")#, para renovar <a href="renovar.cfm?claveU=#GetCodigos.cd_codigo#"> 
haga click aqui</a><br><br>&nbsp;
</cfoutput>  
</td></tr>
<cfelse>
  
  <cfoutput>
Cuenta Inactiva, para reactivar <a href="renovar.cfm?claveU=#URL.claveU#"> 
haga click aqui</a>
</cfoutput>
</cfif>
</table>

</body>
</html>