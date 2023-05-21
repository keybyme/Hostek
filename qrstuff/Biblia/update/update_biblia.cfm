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
<cfset ws_key = "0">
<cfset ws_libro = "1">
<cfset ws_capitulo = "1">
<cfset ws_versiculo = "1">

<cfif (isdefined('form.wslibro') AND '#TRIM(form.wslibro)#' NEQ '')>
	<cfset ws_libro = '#TRIM(form.wslibro)#'>
</cfif>

<cfif (isdefined('form.wscapitulo') AND '#TRIM(form.wscapitulo)#' NEQ '')>
	<cfset ws_capitulo = '#TRIM(form.wscapitulo)#'>
</cfif>

<cfif (isdefined('form.wsversiculo') AND '#TRIM(form.wsversiculo)#' NEQ '')>
	<cfset ws_versiculo = '#TRIM(form.wsversiculo)#'>
</cfif>

<cfquery name = "GetBiblia" dataSource = "wolffdb_dsn"> 
    SELECT top 3 Reina_Valera.rv_key
         , Reina_Valera.rv_libro
		 , Reina_Valera.rv_capitulo
		 , Reina_Valera.rv_versiculo
		 , Reina_Valera.rv_contenido
         , Reina_Valera.rv_contenido_NTV_en
         , Reina_Valera.rv_contenido_NLT_es
         , Reina_Valera.rv_contenido_KJV_en
         , Reina_Valera.rv_contenido_NIV_en
         , Libros.clave
         , Libros.id
         , Libros.Descripcion
    FROM Reina_Valera LEFT OUTER JOIN Libros ON
        rv_libro = id
     Where  Reina_Valera.rv_libro >= '#TRIM(ws_libro)#'
        AND Reina_Valera.rv_capitulo >= '#TRIM(ws_capitulo)#'
        AND Reina_Valera.rv_versiculo >= '#TRIM(ws_versiculo)#'

    ORDER BY Reina_Valera.rv_key
</cfquery>


 <table align="center" border="0">
		<cfform name="search" method="post" action="update_biblia.cfm">
        <tr>
    		<td>Libro:<cfinput name="wslibro" value="#ws_libro#"></td>
    		<td>Capitulo:<cfinput name="wscapitulo" value="#ws_capitulo#"></td>
            <td>Vers:<cfinput name="wsversiculo" value="#ws_versiculo#"></td>
 			<td> <input type="submit" value="Go" name="Go"> </td>
        </tr>    
           <!--- <input type="hidden" name="ficha" value="#ws_ficha#"/>--->
		</cfform>
        <th style="color:#006" bgcolor="#CCCCCC">key</th>
        <th style="color:#006" bgcolor="#CCCCCC">Lib</th>
        <th style="color:#006" bgcolor="#CCCCCC">Cap</th>
       	<th style="color:#006" bgcolor="#CCCCCC">Vers</th>  
        <th style="color:#006" bgcolor="#CCCCCC">Editar</th>
         
              
 <cfoutput query="GetBiblia" group="rv_key">
 <cfoutput>
        <tr>
  			<td bgcolor="#(ws_color)#" style="font-size:small"><strong>#TRIM(GetBiblia.rv_key)#</strong></td>      
  			<td bgcolor="#(ws_color)#" style="font-size:small"><strong>#TRIM(GetBiblia.Descripcion)#</strong></td>
  			<td bgcolor="#(ws_color)#" style="font-size:small"><strong>#TRIM(GetBiblia.rv_capitulo)#</strong></td>
  			<td bgcolor="#(ws_color)#" style="font-size:small"><strong>#TRIM(GetBiblia.rv_versiculo)#</strong></td>
            <td align="center"><a href="upd_BB.cfm?claveU=#GetBiblia.rv_key#">Editar</a></td>
     	</tr>
        <tr>
            <td>Reina Valera&nbsp;&nbsp;</td>
          	<td bgcolor="#(ws_color)#" style="font-size:small" width="1000" colspan="4"><strong>#TRIM(GetBiblia.rv_contenido)#</strong></td>
  	    </tr><tr>	
            <td>NTV_en&nbsp;&nbsp;</td>	
            <td bgcolor="#(ws_color)#" style="font-size:small" width="1000" colspan="4"><strong>#TRIM(GetBiblia.rv_contenido_NTV_en)#</strong></td>
  		</tr><tr>	
            <td>NLT_es&nbsp;&nbsp;</td>
            <td bgcolor="#(ws_color)#" style="font-size:small" width="1000" colspan="4"><strong>#TRIM(GetBiblia.rv_contenido_NLT_es)#</strong></td>
    	</tr><tr>	
            <td>KJV_en&nbsp;&nbsp;</td>	
            <td bgcolor="#(ws_color)#" style="font-size:small" width="1000" colspan="4"><strong>#TRIM(GetBiblia.rv_contenido_KJV_en)#</strong></td>
  		</tr><tr>	
            <td>NIV_en&nbsp;&nbsp;</td>
            <td bgcolor="#(ws_color)#" style="font-size:small" width="1000" colspan="4"><strong>#TRIM(GetBiblia.rv_contenido_NIV_en)#</strong></td>
        </tr>	
              </cfoutput>
</cfoutput>  
</table>  
 



