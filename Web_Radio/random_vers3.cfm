<cfinclude template="template/head.cfm">
  <style>
 
    #btn1{
    
 
      background:#0d6efd;
    }
    #btn2{
     
      background:#dc3545;
    }
    #btn1:hover{
       
      color: #0d6efd;
      background-color: white;
      
    }
    #btn2:hover{
      
      color:#dc3545;
      background-color: white;
       
    }
 
  </style>
<CFSET GetBiblia.RecordCount=0> 
<cfquery name = "GetBiblia" dataSource = "wolffdb_dsn"> 
   
   SELECT *
         From rnd_Versos 
          
</cfquery>
  <cfif #Trim(url.LibroU)# eq 0>
    <cfset ws_rows = GetBiblia.RecordCount> 
    <cfset ws_fila = RandRange(01, ws_rows)>
  <cfelse>
    <cfset ws_fila = ws_filaU>  
  </cfif>

    <cfquery name = "GetBiblia" dataSource = "wolffdb_dsn"> 
	SELECT DISTINCT *                  
	   FROM  lVersiculos inner join lCapitulos on
  	         V_IdCapitulo = C_IdCapitulo inner join lLibros on
	         C_IdLibro = L_IdLibro
	        inner join rnd_Versos on
            V_IdVersiculo = rv_fk_V_IdVersiculo
    WHERE  rv_key = #ws_fila# 
   </cfquery>






  <!--=================================
	Header
	=================================-->
  <cfinclude template="template/header.cfm">

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
<!---     <cfinclude template="template/player.cfm"> --->


      <div id="ajaxArea">
        <div class="pageContentArea">
          <!--=================================
      bread crums
      =================================-->
 
      <div class="clearfix"></div>
       
            <div class="container">
              <article class="latest-post detail">
               

              <div class="row">
               
                <div class="col-lg-12 col-md-12 col-sm-12" style="background:white; border-top-right-radius:25px; margin-top:20px">
                <article class="latest-post detail">
        

                    <!---contenido --->

                    <div class="card text-center" style="width: 100%;">
                      <!-- <img src="..." class="card-img-top" alt="..."> -->
                      <div class="card-body">
                        <!-- <h5 class="card-title">Card title</h5> -->
                        <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
      <CFFORM ACTION="random_vers3.cfm" METHOD="post">    
        <cfoutput query="GetBiblia" group="C_IdLibro">
          <br><br>
          <div class="container text-center">
            <div class="row" style="background:white">
              <div class="col">
                <p style = "color:blue;font-size:1.775em;"> 
                  <strong>#TRIM(GetBiblia.V_contenido)#</strong>
                  </p>
              </div>
            </div>
            <div class="row" style="background:white; font-size:1.175em;">
              <div class="col" style="background:white;"> 
                <p style="color:red; font-size: 20px;">
                <strong> Cu&aacute;l es el Libro? </strong>
              </p>  
             </div>
             <div class="col-md-auto"  style="background:white;">
              
                          <div>  
                                 <select  class="form-select"  style="min-width:100px" name="genesis" size="1"
                                   onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                                   <cfoutput>
                                     <option value="0" selected>Libro</option>  
                                     <option value="random_vers3.cfm?LibroU=1&ws_filaU=#ws_fila#&merindoU=0">G&eacute;nesis</option>
                                     <option value="random_vers3.cfm?LibroU=2&ws_filaU=#ws_fila#&merindoU=0">Exodo</option> 
                                     <option value="random_vers3.cfm?LibroU=3&ws_filaU=#ws_fila#&merindoU=0">Lev&iacute;tico</option> 
                                     <option value="random_vers3.cfm?LibroU=4&ws_filaU=#ws_fila#&merindoU=0">N&uacute;meros</option> 
                                     <option value="random_vers3.cfm?LibroU=5&ws_filaU=#ws_fila#&merindoU=0">Deuteronomio</option> 
                                     <option value="random_vers3.cfm?LibroU=6&ws_filaU=#ws_fila#&merindoU=0">Josue</option>
                                     <option value="random_vers3.cfm?LibroU=7&ws_filaU=#ws_fila#&merindoU=0">Jueces</option> 
                                     <option value="random_vers3.cfm?LibroU=8&ws_filaU=#ws_fila#&merindoU=0">Rut</option> 
                                     <option value="random_vers3.cfm?LibroU=9&ws_filaU=#ws_fila#&merindoU=0">1ra de Samuel</option> 
                                     <option value="random_vers3.cfm?LibroU=10&ws_filaU=#ws_fila#&merindoU=0">2da de Samuel</option> 
                                     <option value="random_vers3.cfm?LibroU=11&ws_filaU=#ws_fila#&merindoU=0">1ra de Reyes</option> 
                                     <option value="random_vers3.cfm?LibroU=12&ws_filaU=#ws_fila#&merindoU=0">2da de Reyes</option>
                                     <option value="random_vers3.cfm?LibroU=13&ws_filaU=#ws_fila#&merindoU=0">1ra de Cr&oacute;nicas</option> 
                                     <option value="random_vers3.cfm?LibroU=14&ws_filaU=#ws_fila#&merindoU=0">2da de Cr&oacute;nicas</option> 
                                     <option value="random_vers3.cfm?LibroU=15&ws_filaU=#ws_fila#&merindoU=0">Esdras</option> 
                                     <option value="random_vers3.cfm?LibroU=16&ws_filaU=#ws_fila#&merindoU=0">Nehem&iacute;as</option> 
                                     <option value="random_vers3.cfm?LibroU=17&ws_filaU=#ws_fila#&merindoU=0">Ester</option> 
                                     <option value="random_vers3.cfm?LibroU=18&ws_filaU=#ws_fila#&merindoU=0">Job</option> 
                                     <option value="random_vers3.cfm?LibroU=19&ws_filaU=#ws_fila#&merindoU=0">Salmos</option> 
                                     <option value="random_vers3.cfm?LibroU=20&ws_filaU=#ws_fila#&merindoU=0">Proverbios</option> 
                                     <option value="random_vers3.cfm?LibroU=21&ws_filaU=#ws_fila#&merindoU=0">Eclesiastes</option> 
                                     <option value="random_vers3.cfm?LibroU=22&ws_filaU=#ws_fila#&merindoU=0">Cantares</option> 
                                     <option value="random_vers3.cfm?LibroU=23&ws_filaU=#ws_fila#&merindoU=0">Isa&iacute;as</option> 
                                     <option value="random_vers3.cfm?LibroU=24&ws_filaU=#ws_fila#&merindoU=0">Jeremias</option> 
                                     <option value="random_vers3.cfm?LibroU=25&ws_filaU=#ws_fila#&merindoU=0">Lamentaciones</option> 
                                     <option value="random_vers3.cfm?LibroU=26&ws_filaU=#ws_fila#&merindoU=0">Ezequiel</option> 
                                     <option value="random_vers3.cfm?LibroU=27&ws_filaU=#ws_fila#&merindoU=0">Daniel</option> 
                                     <option value="random_vers3.cfm?LibroU=28&ws_filaU=#ws_fila#&merindoU=0">Oseas</option> 
                                     <option value="random_vers3.cfm?LibroU=29&ws_filaU=#ws_fila#&merindoU=0">Joel</option> 
                                     <option value="random_vers3.cfm?LibroU=30&ws_filaU=#ws_fila#&merindoU=0">Amos</option> 
                                     <option value="random_vers3.cfm?LibroU=31&ws_filaU=#ws_fila#&merindoU=0">Abd&iacute;as</option> 
                                     <option value="random_vers3.cfm?LibroU=32&ws_filaU=#ws_fila#&merindoU=0">Jonas</option> 
                                     <option value="random_vers3.cfm?LibroU=33&ws_filaU=#ws_fila#&merindoU=0">Miqueas</option> 
                                     <option value="random_vers3.cfm?LibroU=34&ws_filaU=#ws_fila#&merindoU=0">Nahum</option> 
                                     <option value="random_vers3.cfm?LibroU=35&ws_filaU=#ws_fila#&merindoU=0">Habacuc</option> 
                                     <option value="random_vers3.cfm?LibroU=36&ws_filaU=#ws_fila#&merindoU=0">Sofonias</option> 
                                     <option value="random_vers3.cfm?LibroU=37&ws_filaU=#ws_fila#&merindoU=0">Hageo</option> 
                                     <option value="random_vers3.cfm?LibroU=38&ws_filaU=#ws_fila#&merindoU=0">Zacarias</option> 
                                     <option value="random_vers3.cfm?LibroU=39&ws_filaU=#ws_fila#&merindoU=0">Malaquias</option> 
                                     <option value="random_vers3.cfm?LibroU=40&ws_filaU=#ws_fila#&merindoU=0">Mateo</option> 
                                     <option value="random_vers3.cfm?LibroU=41&ws_filaU=#ws_fila#&merindoU=0">Marcos</option>
                                     <option value="random_vers3.cfm?LibroU=42&ws_filaU=#ws_fila#&merindoU=0">Lucas</option> 
                                     <option value="random_vers3.cfm?LibroU=43&ws_filaU=#ws_fila#&merindoU=0">Juan</option> 
                                     <option value="random_vers3.cfm?LibroU=44&ws_filaU=#ws_fila#&merindoU=0">Hechos</option> 
                                     <option value="random_vers3.cfm?LibroU=45&ws_filaU=#ws_fila#&merindoU=0">Romanos</option> 
                                     <option value="random_vers3.cfm?LibroU=46&ws_filaU=#ws_fila#&merindoU=0">1ra de Corintios</option> 
                                     <option value="random_vers3.cfm?LibroU=47&ws_filaU=#ws_fila#&merindoU=0">2da de Corintios</option> 
                                     <option value="random_vers3.cfm?LibroU=48&ws_filaU=#ws_fila#&merindoU=0">Galatas</option> 
                                     <option value="random_vers3.cfm?LibroU=49&ws_filaU=#ws_fila#&merindoU=0">Efesios</option> 
                                     <option value="random_vers3.cfm?LibroU=50&ws_filaU=#ws_fila#&merindoU=0">Filipenses</option> 
                                     <option value="random_vers3.cfm?LibroU=51&ws_filaU=#ws_fila#&merindoU=0">Colosenses</option> 
                                     <option value="random_vers3.cfm?LibroU=52&ws_filaU=#ws_fila#&merindoU=0">1ra Tesalonicenses</option>
                                     <option value="random_vers3.cfm?LibroU=53&ws_filaU=#ws_fila#&merindoU=0">2da Tesalonicenses</option> 
                                     <option value="random_vers3.cfm?LibroU=54&ws_filaU=#ws_fila#&merindoU=0">1ra de Timoteo</option> 
                                     <option value="random_vers3.cfm?LibroU=55&ws_filaU=#ws_fila#&merindoU=0">2da de Timoteo</option> 
                                     <option value="random_vers3.cfm?LibroU=56&ws_filaU=#ws_fila#&merindoU=0">Tito</option> 
                                     <option value="random_vers3.cfm?LibroU=57&ws_filaU=#ws_fila#&merindoU=0">Filemon</option> 
                                     <option value="random_vers3.cfm?LibroU=58&ws_filaU=#ws_fila#&merindoU=0">Hebreos</option> 
                                     <option value="random_vers3.cfm?LibroU=59&ws_filaU=#ws_fila#&merindoU=0">Santiago</option> 
                                     <option value="random_vers3.cfm?LibroU=60&ws_filaU=#ws_fila#&merindoU=0">1ra de Pedro</option> 
                                     <option value="random_vers3.cfm?LibroU=61&ws_filaU=#ws_fila#&merindoU=0">2da de Pedro</option> 
                                     <option value="random_vers3.cfm?LibroU=62&ws_filaU=#ws_fila#&merindoU=0">1ra de Juan</option> 
                                     <option value="random_vers3.cfm?LibroU=63&ws_filaU=#ws_fila#&merindoU=0">2da de Juan</option>
                                     <option value="random_vers3.cfm?LibroU=64&ws_filaU=#ws_fila#&merindoU=0">3ra de Juan</option> 
                                     <option value="random_vers3.cfm?LibroU=65&ws_filaU=#ws_fila#&merindoU=0">Judas</option> 
                                     <option value="random_vers3.cfm?LibroU=66&ws_filaU=#ws_fila#&merindoU=0">Apocalipsis</option> 
                                   </cfoutput>
                                 </select> 
                             </div><br>
                            </div>
                            <cfoutput>
                            <div class="col"  style="color:black; background:white;">
                                    <cfif #Trim(url.LibroU)# neq 0>
                                        <cfif #Trim(url.merindoU)# neq 0>
                                                 <p style="color:Blue; font-size: 30px;"> <strong>esta en 
                                                    #GetBiblia.L_Libro_Desc# 
                                                    #TRIM(GetBiblia.C_Capitulo_Desc)# : #TRIM(GetBiblia.V_versiculo)#</strong></p>
                                        <cfelse>         
                                                  <cfif #Trim(url.LibroU)# eq #GetBiblia.L_IdLibro#>
                                                    <p style="color:brown; font-size: 30px;">es correcto !!! <br> esta en 
                                                    #GetBiblia.L_Libro_Desc# 
                                                    #TRIM(GetBiblia.C_Capitulo_Desc)# : #TRIM(GetBiblia.V_versiculo)#</p>
                                                    <img src="images/ok.jpeg" class="img-fluid" style="width:140px;height:140px;" alt=""/> 	
                                                  <cfelse> 
                                                   <img src="images/NoOK.jpg" class="img-fluid" style="width:140px;height:140px;"/>  
                                                   <strong> <br> <p style="color:red;">Trata otra vez </p></strong>  
                                                  </cfif>   
                                        </cfif>
                                    </cfif>             
                            </div><br>
                          <div class="col-md-auto"  style="color:black;background:white;">
                          
                           <a href="random_vers3.cfm?LibroU=0&merindoU=0" class="btn btn-primary" id="btn1">Pr&oacute;ximo Verso </a>
                          </div><br>
                          <div class="col-md-auto"  style="background:white;">
                             <a href="random_vers3.cfm?LibroU=#GetBiblia.L_IdLibro#&ws_filaU=#ws_fila#&merindoU=1" id="btn2" class="btn btn-warning">  Me rindo </a>
                          </div>
                        </cfoutput>
                      </div> 
              </cfoutput>         
     </cfform>	
                                
                      </div>
                      <br><br>
                    </div>





 
















          <!---contenido --->






                </article>
                </div>
              </div>
            </article>
     </div>

          <div class="clearfix"></div>
        </div>
        </div>



          <cfinclude template="template/footer.cfm">