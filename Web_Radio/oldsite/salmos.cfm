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

<cfset ws_salmo = RandRange(01, 150)>
 
        
<cfquery name = "GetBiblia" dataSource = "luzyvidaDB_dsn"> 
   
   SELECT   lCapitulos.C_IdLibro
		 , lCapitulos.C_IdCapitulo
		 , lCapitulos.C_Capitulo_Desc
         , lVersiculos.V_Contenido
         , lVersiculos.V_IdCapitulo
         , lVersiculos.V_versiculo
         From lCapitulos JOIN lVersiculos ON
            lCapitulos.C_IdCapitulo = lVersiculos.V_IdCapitulo
         where lCapitulos.C_IdLibro = 19 and 
               lCapitulos.C_Capitulo_Desc = #ws_salmo#
         
	
</cfquery>


		<cfset ws_I = 0>

  <table width="100%">
  <tr><td>  
    <table width="100%" border="1" align="center">
			<tr>      
    		<th colspan="3" align="center" style="font-size:25px">
        	 
         		 
         			<cfoutput>
           				SALMOS &nbsp;&nbsp;     
       			  </cfoutput>
         	 
   			</th>
            <th>
              <a href="http://www.luzyvida.com/" target="_blank">
                <img src="https://www.luzyvida.com/images/b1.jpg" height="105" alt=""/></a></th>
         </tr>   
    </table>
  </td></tr>
  <tr><td>  
    <table width="100%" border="1" align="center">
			        
  		     
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Cap&iacute;tulo</th> 
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Verso</th>
    		<th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Contenido</th>      
 			<cfoutput query="GetBiblia" group="C_IdLibro">
 				<cfoutput>
        			<tr>
				    	<cfif ws_I EQ 0>
                 	         <cfset ws_color = bgcolorNo>
                             <cfset ws_I = 1>
                        <cfelse>
                             <cfset ws_color = bgcolorYes>
                             <cfset ws_I = 0>
                        </cfif>  
                          
				        	<td bgcolor="#(ws_color)#"><span class="style19">#ws_salmo#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.V_versiculo)#</span></td>
 				        	<td bgcolor="#(ws_color)#"><span class="style19">#TRIM(GetBiblia.V_contenido)#</span></td>	 
                   </tr>    
				</cfoutput>
			</cfoutput> 
		
     </table>
</td></tr>
</table>

</body>
</html>