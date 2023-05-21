<Style>

   body {margin: 0px;}
   
     .style17 {
 color:#FFFFFF;
	 font-style:oblique;
	 font-size:25px;
	 font-weight:bold;
	 background-color:#FF0000;
 }
   
</style>
<cfset ws_ref = 0>
<cfset ws_anun = 0>
<cfset ws_ser =0>

<cfquery name = "GetEstrofas" dataSource = "wolffdb_dsn">
    SELECT *
    FROM Estrofas   
         WHERE es_cliente = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_longvarchar">
         and es_flag_linea = 1
         order by es_codigo_columna, es_linea_nro 
</cfquery>

<table>
 
 <cfoutput query="GetEstrofas" group="es_cliente">
   <cfoutput>
  		 <cfif GetEstrofas.es_codigo_columna EQ "1">
            <cfif ws_ref eq 0>
               <cfset ws_ref = 1>
               <th>Reflexiones</th>
             </cfif>
         <cfelseif GetEstrofas.es_codigo_columna EQ "2">  
             <cfif ws_anun eq 0>
               <cfset ws_anun = 1>
               <th>Anuncios</th>
             </cfif>   
         <cfelseif GetEstrofas.es_codigo_columna EQ "3">  
             <cfif ws_ser eq 0>
               <cfset ws_ser = 1>
               <th>Servicios</th>
             </cfif>  
         </cfif>         
   			<tr>
  				<td><strong>#TRIM(GetEstrofas.es_contenido)#</strong></td>
			</tr> 
  	
        
   </cfoutput>
  
  </cfoutput>  
<!---<cflocation url="../RV60_U.cfm?claveU=JCR">--->
</table>  
<table>
<tr><td><br>==============================================================
<br>
<tr>
<td>
<a href="http://www.jw3.us/r/w">Lectura biblica de hoy</a>

</td>
</tr>
</table>





