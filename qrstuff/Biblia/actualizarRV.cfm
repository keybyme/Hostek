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
<CFSET GetBiblia.RecordCount=0>        
<cfquery name = "GetBiblia" dataSource = "wolffdb_dsn"> 
    SELECT Reina_Valera.rv_key
		 , Reina_Valera.rv_libro
		 , Reina_Valera.rv_capitulo
		 , Reina_Valera.rv_versiculo
		 , Reina_Valera.rv_contenido
         , Reina_Valera.rv_contenido_NTV
         , Reina_Valera.rv_contenido_NLT
    FROM Reina_Valera
   <!--- Where rv_libro = 20 and rv_capitulo > 18 --->
    Where rv_libro =  <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">
    order by rv_libro, rv_capitulo, rv_versiculo
	
</cfquery>
 
<cfoutput query="GetBiblia" group="rv_key">			 
<cfquery name="editemp" datasource="wolffdb_dsn">
 INSERT INTO Reina_Valera1 
    
       (
           Reina_Valera.rv1_libro
		 , Reina_Valera.rv1_capitulo
		 , Reina_Valera.rv1_versiculo
		 , Reina_Valera.rv1_contenido
         , Reina_Valera.rv1_contenido_NTV
         , Reina_Valera.rv1_contenido_NLT
       )
 Values
       (
          '#GetBiblia.rv_libro#'
        , '#GetBiblia.rv_capitulo#'
        , '#GetBiblia.rv_versiculo#'
        , '#GetBiblia.rv_contenido#'
        , '#GetBiblia.rv_contenido_NTV#'
        , '#GetBiblia.rv_contenido_NLT#'
       )       
       
</cfquery>
</cfoutput>

</table>

ACTUALIZADA !!!!!
</body>
</html>