
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="my.css">
</head>
<body>
    <cfinclude template="menu.cfm"></cfinclude>
	 
    <cfset ws_I = 0>
    <div class="column2" style="background-color:#ffffff;">
      <div class="main">
		
	 <cfif isDefined("form.Criteria") or isDefined("form.tomatch")>
         <cfset url.Criteria = trim(form.Criteria)>
     	 <cfset url.tomatch = trim(form.tomatch)>
		 <cfset ws_total = 0>	 
	
	<CFSET GetWord.RecordCount=0>
  <CFQUERY NAME="GetWord" datasource="luzyvidaDB_dsn">
    SELECT  *                  
    FROM  lVersiculos inner join lCapitulos on
          V_IdCapitulo = C_IdCapitulo
        inner join lLibros on
         C_IdLibro = L_IdLibro
  
    <cfif (isDefined('url.Criteria')) AND (TRIM(url.Criteria) NEQ '') and (TRIM(url.tomatch) NEQ '')>
              where  V_Contenido LIKE '% #Trim(url.Criteria)# %'
              or V_Contenido LIKE '% #Trim(url.Criteria)#.%'
              or V_Contenido LIKE '% #Trim(url.Criteria)#,%'
              or V_Contenido LIKE '% #Trim(url.Criteria)#;%'
              or V_Contenido LIKE '% #Trim(url.Criteria)#:%'
      <cfelseif (isDefined('url.Criteria')) AND (TRIM(url.Criteria) NEQ '') and (TRIM(url.tomatch) EQ '')>
        where V_Contenido LIKE '%#Trim(url.Criteria)#%'
    </cfif>
    order by C_IdLibro, V_IdCapitulo, V_IdVersiculo
  </CFQUERY>	 
	
<table border="1">		
		 
	
</tr>
   <tr>
        <th style="color:#006" bgcolor="#CCCCCC">Libro</th>
        <th style="color:#006" bgcolor="#CCCCCC">Capitulo</th>
        <th style="color:#006" bgcolor="#CCCCCC">Versiculo</th>
	      <th style="color:#006" bgcolor="#CCCCCC">Contenido</th>
        <th style="color:#006" bgcolor="#CCCCCC">Leer Cap.</th>
            
    </tr>      

 <cfloop query="GetWord"> 
 <cfoutput> 

  <cfif ws_I EQ 0>
    <cfset ws_color = bgcolorNo>
    <cfset ws_I = 1>
  <cfelse>
    <cfset ws_color = bgcolorYes>
    <cfset ws_I = 0>
  </cfif> 

 <tr>
  <td bgcolor="#(ws_color)#">#TRIM(GetWord.L_Libro_Desc)#</td>
  <td bgcolor="#(ws_color)#">#TRIM(GetWord.C_Capitulo_Desc)#</td>
  <td bgcolor="#(ws_color)#">#TRIM(GetWord.V_versiculo)#</td>
  <td bgcolor="#(ws_color)#">#TRIM(GetWord.V_Contenido)#</td>  
  <td bgcolor="#(ws_color)#" align="center"><a href="RV.cfm?IDcapituloU=#GetWord.C_IdCapitulo#">
                                Ir a Capitulo</a></td>             
 </tr>
 <cfset ws_total = ws_total + 1>
 
 </cfoutput>
 </cfloop>

</table>		
	 <cfoutput>
		 Total de palabras <strong>#Trim(url.Criteria)#</strong> encontradas = <strong>#ws_total#</strong>	 
 </cfoutput>	
	
</cfif>
		 
		 
<cfform name="disp" method="post" action="Search.cfm">
    <p> 
        Palabra a buscar:  <input name="Criteria" size="30">
         <input type="submit" name="editpho" value="Enviar">&nbsp;&nbsp;
		match exacto? 
		  <input name="tomatch" size="1">
    </p>          
 
</cfform>	
        
    
	 
  </div>
</div>
   
</body>
</html>
