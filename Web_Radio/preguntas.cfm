<cfinclude template="./template/head.cfm">.cfm


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
                  <h1>Preguntas y Peticiones</h1>
 
                </div>

                <div class="col-lg-6 col-md-6 col-sm-6">
                  <ul>
                    <li><a href="/">Home</a></li>
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
                          <img src="assets/img/question.jpg" style="border-top-right-radius:25px;" alt="dummy">
                          <ul>
                            <li><span class="fa fa-clock-o"></span>24 August, 2013</li>
                            <li><span class=" fa fa-user"></span>by <span>Admin</span></li>
                            <li><span class="fa fa-comment"></span>5 comments</li>
                          </ul>

                          <!-- contenido-->





                          

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