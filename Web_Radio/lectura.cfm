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
      <cfoutput>
        <cfset ws_fecha_today=DateFormat(Now(),"mm/dd/yyyy")>
          <cfset ws_fecha=#DateFormat(DateAdd('d', 0, ws_fecha_today),'mmdd')#>

            <cfset todayDate=#Now()#>
              <cfset ws_hora=#TimeFormat(todayDate, "HH" )#>
                <cfif ws_hora GT 11>
                  <cfset am_pm="pm">
                    <cfelse>
                      <cfset am_pm="am">
                </cfif>
      </cfoutput>



      <div id="ajaxArea">
        <div class="pageContentArea">
          <!--=================================
      bread crums
      =================================-->
          <section class="breadcrumb">
            <div class="container">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                  <h1>Lectura</h1>
                  <cfoutput>
                    <cfif am_pm EQ "am">
                      <h5>Lectura AM de #ws_fecha_today#</h5>
                      <cfelse>
                        <h5>Lectura PM de #ws_fecha_today#</h5>
                    </cfif>
                  </cfoutput>
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

          <cfset ws_I=1>

            <CFSET GetLectura.RecordCount=0>

              <CFQUERY NAME="GetLectura" datasource="wolffdb_dsn">

                Select *
                from Lectura
                where lec_fecha = #ws_fecha#

              </CFQUERY>

              <CFSET GetVersos.RecordCount=0>
                <CFQUERY NAME="GetVersos" datasource="wolffdb_dsn">

                  Select *
                  from lVersiculos inner join lCapitulos on
                  V_IdCapitulo = C_IdCapitulo
                  inner join lLibros on
                  C_IdLibro = L_IdLibro
                  <cfif am_pm EQ "am">
                    where V_IdVersiculo BETWEEN #GetLectura.lec_am_start# and #GetLectura.lec_am_end#
                    <cfelse>
                      where V_IdVersiculo BETWEEN #GetLectura.lec_pm_start# and #GetLectura.lec_pm_end#
                  </cfif>
                  order by V_IdVersiculo
                </CFQUERY>

                <section id="blog">
                  <div class="container">
                    <div class="row">
                      <div class="col-lg-12 col-md-12 col-sm-12"
                        style="background:white; color: black; border-top-right-radius:25px; margin-top:20px">
                        <article class="latest-post detail">
                          <img src="assets/img/reading-bible-b.jpg" style="border-top-right-radius:25px;" alt="dummy">
                          <cfoutput>

                            <cfif am_pm EQ "am">
                              <h2 style="color: blue">Lectura AM de hoy #ws_fecha_today#</h2>
                              <cfelse>
                                <h2 style="color: blue">Lectura PM de hoy #ws_fecha_today#</h2>
                            </cfif>

                          </cfoutput>
                          <ul>
                            <li><span class="fa fa-clock-o"></span>24 August, 2013</li>
                            <li><span class=" fa fa-user"></span>by <span>Admin</span></li>
                            <li><span class="fa fa-comment"></span>5 comments</li>
                          </ul>


                        <!---contenido --->
                          <table class="table">

                            <tr>
                              <td colspan="4" align="center">

                              </td>
                            </tr>
                            <cfloop query="GetVersos">
                              <cfoutput>
                                <cfif ws_I EQ 0>
                                  <cfset ws_color = bgcolorNo>
                                  <cfset ws_I = 1>
                                <cfelse>
                                  <cfset ws_color = bgcolorYes>
                                  <cfset ws_I = 0>
                                </cfif> 
                                <tr>
                                  <td bgcolor="#(ws_color)#" style="color: black">#GetVersos.L_Libro_Desc#</td>
                                  <td bgcolor="#(ws_color)#" style="color: black">#GetVersos.C_Capitulo_Desc#</td>
                                  <td bgcolor="#(ws_color)#" style="color: black">#GetVersos.V_versiculo#</td>
                                  <td bgcolor="#(ws_color)#" style="color: black">#GetVersos.V_Contenido#</td>
                                </tr>
                              </cfoutput>
                            </cfloop>
                          </table>
                        </article><!--\\latest post-->




                        <article class="post-comments">
                          <h1>5 comments</h1>
                          <div class="comment-write">
                            <form>
                              <b class="fa fa-user"></b>
                              <input id="leave-comment" placeholder="leave a comment" />
                            </form>
                          </div><!--//comment-->


                          <div class="comment-read">
                            <b class="fa fa-user"></b>
                            <a href="#">
                              <h3>john doe</h3>
                            </a>
                            <h4>JUL 5, 11:43 AM</h4>
                            <p>????????????????
                            </p>
                            <ul class="comment-ul">
                              <li><span>5</span><a href="#"><i class=" fa fa-thumbs-up"></i></a></li>
                              <li class="fa fa-border"><a href="#"><i class=" fa fa-thumbs-down"></i></a></li>
                              <li><a href="#"><i class=" fa fa-mail-forward"></i>Reply</a></li>
                              <li><a href="#"><i class=" fa fa-mail-forward"></i>Share</a></li>
                            </ul>

                            <div class="comment-reply">
                              <i class=" fa fa-reply"></i>
                              <b class="fa fa-user"></b>
                              <a href="#">
                                <h3>john doe</h3>
                              </a>
                              <h4>JUL 5, 11:43 AM</h4>
                              <p>????????????????? </p>
                              <ul class="comment-ul">
                                <li><span>5</span><a href="#"><i class=" fa fa-thumbs-up"></i></a></li>
                                <li class="fa fa-border"><a href="#"><i class=" fa fa-thumbs-down"></i></a></li>
                                <li><a href="#"><i class=" fa fa-mail-forward"></i>Reply</a></li>
                                <li><a href="#"><i class=" fa fa-mail-forward"></i>Share</a></li>
                              </ul>
                            </div><!--//comment reply-->
                          </div><!--//comment read-->






                               <!---contenido --->

                        </article><!--//post comments-->

                      </div><!--latest news-->


                      <!--latest videos-->
                    </div>
                  </div>
                </section>
                <div class="clearfix"></div>
        </div><!--pageContent-->
      </div><!--ajaxwrap-->

      <cfinclude template="template/footer.cfm">