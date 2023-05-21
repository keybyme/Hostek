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

<cfquery name = "GetBiblia" dataSource = "wolffdb_dsn"> 
    SELECT Reina_Valera.rv_key
         , Reina_Valera.rv_libro
		 , Reina_Valera.rv_capitulo
		 , Reina_Valera.rv_versiculo
		 , Reina_Valera.rv_contenido
         , Reina_Valera.rv_contenido_NTV
         , Reina_Valera.rv_contenido_NLT
    FROM Reina_Valera 
     Where Reina_Valera.rv_key > 15810
       and (Reina_Valera.rv_contenido_NTV is null or Reina_Valera.rv_contenido_NLT is null)
       and Reina_Valera.rv_libro = 19
    ORDER BY Reina_Valera.rv_key
</cfquery>


 <table align="center" border="0">

        <th style="color:#006" bgcolor="#CCCCCC">key</th>
        <th style="color:#006" bgcolor="#CCCCCC">Lib</th>
        <th style="color:#006" bgcolor="#CCCCCC">Cap</th>
       	<th style="color:#006" bgcolor="#CCCCCC">Vers</th> 
        <th style="color:#006" bgcolor="#CCCCCC">RV</th> 
        <th style="color:#006" bgcolor="#CCCCCC">NTV</th>
        <th style="color:#006" bgcolor="#CCCCCC">NLT</th>
        <th style="color:#006" bgcolor="#CCCCCC">Editar</th>
         
              
 <cfoutput query="GetBiblia" group="rv_key">
 <cfoutput>
        <tr>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="35"><strong>#TRIM(GetBiblia.rv_key)#</strong></td>      
  <td bgcolor="#(ws_color)#" style="font-size:small" width="35"><strong>#TRIM(GetBiblia.rv_libro)#</strong></td>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="35"><strong>#TRIM(GetBiblia.rv_capitulo)#</strong></td>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="35"><strong>#TRIM(GetBiblia.rv_versiculo)#</strong></td>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="270"><strong>#TRIM(GetBiblia.rv_contenido)#</strong></td>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="270"><strong>#TRIM(GetBiblia.rv_contenido_NTV)#</strong></td>
  <td bgcolor="#(ws_color)#" style="font-size:small" width="270"><strong>#TRIM(GetBiblia.rv_contenido_NLT)#</strong></td>
   
              <td align="center"><a href=  "../qrstuff/upd_NTV.cfm?claveU=#GetBiblia.rv_key#"&action=1>Editar</a></td>
          
  
     	</tr>
    		  </cfoutput>
</cfoutput>  
</table>  
 



