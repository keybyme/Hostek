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
    SELECT KJ_1_1000.clave
         , KJ_1_1000.kj
         , Reina_Valera.rv_key
         , Reina_Valera.rv_libro
		 , Reina_Valera.rv_capitulo
		 , Reina_Valera.rv_versiculo
		 , Reina_Valera.rv_contenido
         , Reina_Valera.rv_contenido_NTV_en
         , Reina_Valera.rv_contenido_NLT_es
         , Reina_Valera.rv_contenido_KJV_en
         , Reina_Valera.rv_contenido_NIV_en
      
    FROM KJ_1_1000 LEFT OUTER JOIN Reina_Valera ON
     clave = rv_key
    ORDER BY Reina_Valera.rv_key
</cfquery>

 <cfoutput query="GetBiblia" group="rv_key">
<cfquery name="editemp" datasource="wolffdb_dsn">
 
 <cfoutput>

UPDATE Reina_Valera 
SET       
    	         
        rv_contenido_KJV_en  = '#TRIM(GetBiblia.kj)#'
      
 		WHERE 
        rv_key = #GetBiblia.clave#       

              </cfoutput>
</cfquery>  
</cfoutput>
</table>  
 ============= Actualizado !!!!!!!==================



