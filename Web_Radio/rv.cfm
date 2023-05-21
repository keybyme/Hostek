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
 


      <div id="ajaxArea">
        <div class="pageContentArea">
          <!--=================================
      bread crums
      =================================-->
          <section class="breadcrumb">
            <div class="container">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                  <h1>Reina Valera</h1>
 
                </div>

                <div class="col-lg-6 col-md-6 col-sm-6">
                  <ul>
                    <li><a href="temasRV.cfm?startRow=1">Temas</a></li>
                    <li><a href="lectura.cfm">Lectura</a></li>
                     <li><a href="diccionario.cfm?startRow=1">Diccionario</a></li>
                     <li><a href="rv.cfm">RV</a></li>
                     <li><a href="preguntas.cfm">Preguntas</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </section>
          <div class="clearfix"></div>
  
                <section id="blog">
                  <div class="container">
                    <div class="row">
                      <div class="col-lg-12 col-md-12 col-sm-12" style="background:white; color: black; border-top-right-radius:25px; margin-top:20px">
                        <article class="latest-post detail">
                          <img src="assets/img/rvb.jpg" style="border-top-right-radius:25px;" alt="dummy">
                          <ul>
                            <li><span class="fa fa-clock-o"></span>24 August, 2013</li>
                            <li><span class=" fa fa-user"></span>by <span>Admin</span></li>
                            <li><span class="fa fa-comment"></span>5 comments</li>
                          </ul>

                       <!-- contenido-->


                       <cfinclude template="menu.cfm"></cfinclude>
	
                       <div class="column2" style="background-color:#ffffff;">
                        <div class="main">
                        
                         
                         
                              <cfparam name="url.IDcapituloU" default="">
                              <cfset ws_I = 1>	
                               
                              <CFSET GetCapitulo.RecordCount=0>
                              <CFQUERY NAME="GetCapitulo" datasource="wolffdb_dsn">
                              
                            	SELECT DISTINCT *                  
	                            FROM  lVersiculos inner join lCapitulos on
  	                                V_IdCapitulo = C_IdCapitulo inner join lLibros on
	                                  C_IdLibro = L_IdLibro
	                            inner join lTema on
	                                  V_IdVersiculo >= T_id_verso_start and V_IdVersiculo <= T_id_verso_end
                              WHERE  V_IdCapitulo = #Trim(url.IDcapituloU)#  
                              order by V_versiculo
                                    
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
                        <h2 style="color: blue">#TRIM(GetCapitulo.L_Libro_Desc)#&nbsp;&nbsp;
                          
                          Cap&iacute;tulo&nbsp;&nbsp;&nbsp;
                          #TRIM(GetCapitulo.C_Capitulo_Desc)#&nbsp;&nbsp;
                          <a href="rv.cfm?IDcapituloU=#ws_prev#"><<<<</a>&nbsp;&nbsp;
                          
                          <a href="rv.cfm?IDcapituloU=#ws_next#">>>>></a>
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
                            <td bgcolor="#(ws_color)#" style="color: black">
                           <strong>#TRIM(GetCapitulo.V_versiculo)#</strong>	</div>
                         </td>
                             <div style="color: #ws_color#">
                           <td bgcolor="#(ws_color)#" style="color: black">						 
                            <strong>#TRIM(GetCapitulo.V_Contenido)#</strong>&nbsp;&nbsp;&nbsp;
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
                        <h2><a href="rv.cfm?IDcapituloU=#ws_prev#" style="color:black;"><<<<</a>&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;
                          <a href="rv.cfm?IDcapituloU=#ws_next#" style="color:black;">>>>></a>
                          </h2>	
                        </cfoutput>
                            
                        
                        </div>
                        
                        </div>







                          

                        <!-- contenido-->

                          
 
                        </article> 
                      </div> 
                    </div>
                  </div>
                </section>
                <div class="clearfix"></div>
        </div><!--pageContent-->
      </div><!--ajaxwrap-->

      <cfinclude template="template/footer.cfm">