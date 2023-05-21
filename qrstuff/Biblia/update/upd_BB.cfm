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

<cfquery name="get_verso" datasource="wolffdb_dsn">			
SELECT Reina_Valera.rv_key
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
WHERE rv_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>

<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="act_upd_BB.cfm">
	<cfoutput>
        <input type="hidden" name="rv_key" value="#get_verso.rv_key#">	
       
    </cfoutput>
<table align="center">


<cfoutput>    
    <tr>
        <td>Key: </td>
        <td><cfinput name="rv_libro" value="#get_verso.rv_key#"></td>
    </tr>
    <tr>
        <td>Libro: </td>
        <td><cfinput name="rv_libro" value="#get_verso.Descripcion#"></td>
    </tr>
    <tr>
        <td>Capitulo: </td>
        <td><cfinput name="rv_capitulo" value="#get_verso.rv_capitulo#"></td>
    </tr>  
    <tr>
        <td>Versiculo: </td>
        <td><cfinput name="rv_versiculo" value="#get_verso.rv_versiculo#"></td>
    </tr>      
    <tr>
        <td>Reina Valera: </td>
        <td><cfinput name="rv_contenido" value="#get_verso.rv_contenido#" size="200"></td>
    </tr>
    <tr>
        <td>NTV_en: </td>
        <td><cfinput name="rv_contenido_NTV_en" value="#get_verso.rv_contenido_NTV_en#" size="200"></td>
    </tr>
    <tr>
        <td>NLT_es: </td>
        <td><cfinput name="rv_contenido_NLT_es" value="#get_verso.rv_contenido_NLT_es#" size="200"></td>
    </tr> 
    <tr>
        <td>KJV_en: </td>
        <td><cfinput name="rv_contenido_KJV_en" value="#get_verso.rv_contenido_KJV_en#" size="200"></td>
    </tr>
    <tr>
        <td>NIV_en: </td>
        <td><cfinput name="rv_contenido_NIV_en" value="#get_verso.rv_contenido_NIV_en#" size="200"></td>
    </tr>           
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Actualizar"></td>
    </tr>  
</cfoutput>     				
</table>
 
</cfform>
 