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
SELECT *
FROM Reina_Valera
WHERE rv_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
</cfquery>

<cfparam name="url.action" default="">

<cfform name="edit" method="post" action="../qrstuff/act_upd_NTV.cfm">
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
        <td><cfinput name="rv_libro" value="#get_verso.rv_libro#"></td>
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
        <td>NTV: </td>
        <td><cfinput name="rv_contenido_NTV" value="#get_verso.rv_contenido_NTV#" size="200"></td>
    </tr>
    <tr>
        <td>NLT: </td>
        <td><cfinput name="rv_contenido_NLT" value="#get_verso.rv_contenido_NLT#" size="200"></td>
    </tr>      
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Actualizar"></td>
    </tr>  
</cfoutput>     				
</table>
 
</cfform>
 