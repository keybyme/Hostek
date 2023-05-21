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

 
<CFSET GetBiblia.RecordCount=0> 
<cfquery name = "GetBiblia" dataSource = "luzyvidaDB_dsn"> 
   
   SELECT *
         From rnd_Versos 
          
</cfquery>
    <cfset ws_rows = GetBiblia.RecordCount> 
 
    <cfset ws_fila = RandRange(01, ws_rows)>

    <cfquery name = "GetBiblia" dataSource = "luzyvidaDB_dsn"> 
	SELECT DISTINCT *                  
	   FROM  lVersiculos inner join lCapitulos on
  	         V_IdCapitulo = C_IdCapitulo inner join lLibros on
	         C_IdLibro = L_IdLibro
	        inner join rnd_Versos on
            V_IdVersiculo = rv_fk_V_IdVersiculo
    WHERE  rv_key = #ws_fila# 
   </cfquery>

		 

  <table width="100%">
  
  <tr><td>  
    <table width="70%" border="0" align="center">
			        
        
 			<cfoutput query="GetBiblia" group="C_IdLibro">
 				<cfoutput>
        			<tr>
				    	 
                        <td>
                            <p style = "font-size:60px"> 
                            <strong>#TRIM(GetBiblia.V_contenido)#</strong>
                            </p>
                        </td>	
                    </tr>
                     
                    <tr align="right">    
                            <td>
                                <p style = "font-size:35px"> 
                                #TRIM(GetBiblia.L_Libro_Desc)#  
                                #TRIM(GetBiblia.C_Capitulo_Desc)# : #TRIM(GetBiblia.V_versiculo)#
                                </p>
                            </td>
 				        	 
                   </tr>    
				</cfoutput>
			</cfoutput> 
		
     </table>
</td></tr>
</table>

</body>
<script>
     setInterval(function() {
                  window.location.reload();
                }, 19876); 
</script>
</html>