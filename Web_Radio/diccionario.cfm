<!--- <style>
  #disp > div > div > input.form-control{
    background:blue;
    color:white;
  }

</style> --->
<cfinclude template="template/head.cfm">

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
    <cfinclude template="template/player.cfm">


      <div id="ajaxArea">
        <div class="pageContentArea">
          <!--=================================
      bread crums
      =================================-->
      <section class="breadcrumb">
        <div class="container">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
              <h1>diccionario B&iacute;blico</h1>
          
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
       
            <div class="container">
              <article class="latest-post detail">
               

              <div class="row mt-3">
               
                <div class="col-lg-12 col-md-12 col-sm-12" style="background:white; color: black; border-top-right-radius:25px; margin-top:20px">
                <article class="latest-post detail">
                  <img src="assets/img/library-2021-08-26-18-11-44-utc-b.jpg" style="border-top-right-radius:25px;" alt="dummy">
                  <ul>
                            <li><span class="fa fa-clock-o"></span>24 August, 2013</li>
                            <li><span class=" fa fa-user"></span>by <span>Admin</span></li>
                            <li><span class="fa fa-comment"></span>5 comments</li>
                  </ul>
             


                    <!---contenido --->


                    <cfif isDefined("form.Criteria")>

                      <cfset url.Criteria=trim(form.Criteria)>
                    </cfif>

                    <cfif isDefined("form.startRow")>
                      <cfset url.startRow=trim(form.startRow)>
                    </cfif>

                    <cfset ws_I=0>


                      <CFSET GetWord.RecordCount=0>
                        <CFQUERY NAME="GetWord" datasource="wolffdb_dsn">
                          SELECT *
                          FROM diccionario

                          <cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>
                            WHERE dic_palabra LIKE '%#Trim(url.Criteria)#%'
                          </cfif>
                          order by dic_palabra
                        </CFQUERY>

                        <cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>
                          <cfset ws_end_row=200>
                            <cfelse>
                              <cfset ws_end_row=#Trim(url.startRow)# + 11>
                        </cfif>


                        <div class="padding" style="padding: 30px;">
                        <cfform name="disp" method="post" action="diccionario.cfm?startRow=1">
                          <div class="row ">
                            <div class="col">
                          <td>
                            <input class="form-control" placeholder="Palabra a buscar:" name="Criteria" style="width:50%; float:left; margin-right:5px;"></td>
                      
                          <td valign="bottom" colspan="2"><input type="submit" name="editpho" style="float:left;" class="btn btn-info" value="send"></td>
                          </div>
                          </div>
                        </cfform>
                      </div>
                        <table class="table">

                          <cfloop query="GetWord" startrow="#trim(url.startRow)#" endrow="#ws_end_row#">
                            <!---<cfloop query="GetWord">--->
                            <cfoutput>
                                     <cfif ws_I EQ 0>
                                              <cfset ws_color = bgcolorNo>
                                              <cfset ws_I = 1>
                                     <cfelse>
                                              <cfset ws_color = bgcolorYes>
                                              <cfset ws_I = 0>
                                     </cfif> 
                              <tr>
                                <td bgcolor="#(ws_color)#" style="color: black">
                                  <strong>#TRIM(GetWord.dic_palabra)# </strong>
                                </td>
                                <td bgcolor="#(ws_color)#" style="color: black">
                                  #TRIM(GetWord.dic_definicion)#</td>

                              </tr>


                            </cfoutput>
                          </cfloop>
                        </table>
                        <cfoutput>
                          <br>
                        <cfif NOT (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '')>	
                          
                           <cfif ws_end_row GT 12>
                             <cfset ws_prev = trim(url.startRow) - 12>	
                             <a href="Diccionario.cfm?startRow=#ws_prev#"><strong>Prev Page</strong></a>	
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           </cfif>		 
                           <cfset ws_end_row = ws_end_row + 1>		
                           <a href="Diccionario.cfm?startRow=#ws_end_row#"><strong>Next Page</strong></a>
                        </cfif>	
                        </cfoutput> 	

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