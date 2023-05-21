<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="my.css">
</head>
<body>
    <cfinclude template="menu.cfm"></cfinclude>
	
<div class="column2" style="background-color:#ffffff;">
<div class="main">

 
 
      <cfparam name="url.IDcapituloU" default="">
      <cfset ws_I = 1>	
       
      <CFSET GetCapitulo.RecordCount=0>
      <CFQUERY NAME="GetCapitulo" datasource="wolffdb_dsn">
     
          EXECUTE spListarVers #Trim(url.IDcapituloU)# 																	
                                         
      </CFQUERY>

<cfset ws_prev = 1>
<cfset ws_next = 1189>	
<cfif GetCapitulo.RecordCount GT 0>
  <cfif GetCapitulo.V_IdCapitulo GT 1>
    <cfset ws_prev = #GetCapitulo.V_IdCapitulo# - 1>
  </cfif>	
  <cfif GetCapitulo.V_IdCapitulo LT 1189>
    <cfset ws_next = #GetCapitulo.V_IdCapitulo# + 1>
  </cfif>	  
</cfif>


<cfoutput>
<h2>#TRIM(GetCapitulo.L_Libro_Desc)#&nbsp;&nbsp;
  
  Cap&iacute;tulo&nbsp;&nbsp;&nbsp;
  #TRIM(GetCapitulo.C_Capitulo_Desc)#&nbsp;&nbsp;
  <a href="RV.cfm?IDcapituloU=#ws_prev#"><<<<</a>&nbsp;&nbsp;
  
  <a href="RV.cfm?IDcapituloU=#ws_next#">>>>></a>
  </h2>	
</cfoutput>
    
<cfset ws_verso_ant = "">
<table border="1" bordercolor="#CC0000"> 
<tr>

  
</tr>  
<cfloop query="GetCapitulo"> 
<cfoutput> 
 
 <cfif GetCapitulo.V_IdVersiculo EQ GetCapitulo.T_id_verso_start>
   <tr><td colspan="4">
   <div align="center">
    <h4 style="color: brown">#TRIM(GetCapitulo.T_titulo)#</h4>
   </div>
     </td></tr>		 
 </cfif>
    
 <p>
  <tr>  
  <cfif ws_verso_ant neq #TRIM(GetCapitulo.V_IdVersiculo)#>
	   
             <cfif ws_I EQ 0>
                      <cfset ws_color = bgcolorNo>
                      <cfset ws_I = 1>
             <cfelse>
                      <cfset ws_color = bgcolorYes>
                      <cfset ws_I = 0>
             </cfif> 
           
   <div style="color: #ws_color#">
<cfif (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn AND 
    SESSION.Auth.user_role GT 95)>
     <td bgcolor="#(ws_color)#">
  <a href="Upd_Vers.cfm?claveU=#GetCapitulo.V_IdVersiculo#">Editar</a>
     <strong>#TRIM(GetCapitulo.V_IdVersiculo)#</strong> 
   </td>
  </cfif>		 
    <td bgcolor="#(ws_color)#">
   <strong>#TRIM(GetCapitulo.V_versiculo)#</strong>	</div>
 </td>
     <div style="color: #ws_color#">
   <td bgcolor="#(ws_color)#">						 
 #TRIM(GetCapitulo.V_Contenido)#&nbsp;&nbsp;&nbsp;
    </td> 		 
  </div>
 </cfif>
<cfset ws_verso_ant = #TRIM(GetCapitulo.V_IdVersiculo)#>							   
 
  </tr>  
 </p>
</cfoutput>
</cfloop>
  
</table>							 
               
<cfoutput>
<h2><a href="RV.cfm?IDcapituloU=#ws_prev#"><<<<</a>&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;
  <a href="RV.cfm?IDcapituloU=#ws_next#">>>>></a>
  </h2>	
</cfoutput>
    

</div>

</div>
</body>
</html> 