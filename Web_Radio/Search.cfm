<cfinclude template="./template/head.cfm">


  <!--=================================
	Header
	=================================-->
  <cfinclude template="./template/header.cfm">

    <!--=================================
Vegas Slider Images
=================================-->

    <ul class="vegas-slides hidden">
      <li><img data-fade='2000' src="assets/img/BG/bg1.jpg" alt="" /></li>
      <li><img data-fade='2000' src="assets/img/BG/bg2.jpg" alt="" /></li>
      <li><img data-fade='2000' src="assets/img/BG/bg3.jpg" alt="" /></li>
      <li><img data-fade='2000' src="assets/img/BG/bg4.jpg" alt="" /></li>
    </ul>

    <!--=================================
JPlayer (Audio Player)
=================================-->
    <cfinclude template="./template/player.cfm">
	 
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
	
<table>
  <tr>
    <td>
      <a href="Search.cfm" style="color: white">Search</a>
    </td>
  </tr>
</table>

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
  <td bgcolor="#(ws_color)#" style="color: black"><strong>#TRIM(GetWord.L_Libro_Desc)#</strong></td>
  <td bgcolor="#(ws_color)#" style="color: black"><strong>#TRIM(GetWord.C_Capitulo_Desc)#</strong></td>
  <td bgcolor="#(ws_color)#" style="color: black"><strong>#TRIM(GetWord.V_versiculo)#</strong></td>
  <td bgcolor="#(ws_color)#" style="color: black"><strong>#TRIM(GetWord.V_Contenido)#</strong></td>  
  <td bgcolor="#(ws_color)#" align="center"><strong><a href="RV.cfm?IDcapituloU=#GetWord.C_IdCapitulo#" style="color: blue"></strong>
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
  <br>
    <p> 
      <input class="form-control" placeholder="Buscar:" name="Criteria" style="width:20%; float:left; margin-right:5px;">
                      <input type="submit" name="editpho" style="float:left;" class="btn btn-info" value="Enviar">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <input name="tomatch" size="1">
    </p>          
 
</cfform>	
        
    
	 
  </div>
</div>
   

