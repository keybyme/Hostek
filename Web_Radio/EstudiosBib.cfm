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
              <h1>Estudios B&iacute;blicos</h1>
          
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

<CFSET GetTema.RecordCount=0>
<CFQUERY NAME="GetEstudio" datasource="wolffdb_dsn">
  SELECT *                  
  FROM  lEstudios
	  where e_flag_activo = 1
  	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
      and  e_estudio LIKE '%#Trim(url.Criteria)#%'                    
    </cfif> 
  order by e_estudio
	 
</CFQUERY>
 
	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
		<cfset ws_end_row = 200>
	<cfelse>		
	    <cfset ws_end_row = #Trim(url.startRow)# + 7> 		
	</cfif>	
		
	<table>
   
 
<div class="padding" style="padding: 30px;">    
<cfform name="disp" method="post" action="EstudiosBib.cfm?startRow=1">
        <div class="row ">
                            <div class="col">
                          <td>
                            <input class="form-control" placeholder="Buscar:" name="Criteria" style="width:50%; float:left; margin-right:5px;"></td>
                      
                          <td valign="bottom" colspan="2"><input type="submit" name="editpho" style="float:left;" class="btn btn-info" value="send"></td>
                          </div>
                          </div>
</cfform>
</div>
		
<table class="table">		
</tr>
   <tr>
        <th style="color:#006" bgcolor="#CCCCCC">Estudios</th>
      

    <cfif (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn AND 
		  SESSION.Auth.user_role GT 95)>
		<th style="color:#006" bgcolor="#CCCCCC">
			&nbsp; &nbsp; &nbsp; &nbsp;Short Url</th>
    </cfif>	
	</th>
 <cfloop query="GetEstudio" startrow="#trim(url.startRow)#" endrow="#ws_end_row#"> 
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
	<a href="#e_http#" target="_blank">#TRIM(GetEstudio.e_estudio)#</a></td>	 
  
  <cfif IsDefined("SESSION.Auth.IsLoggedIn") and (SESSION.Auth.user_role GT 95)>
		 &nbsp; &nbsp; &nbsp; &nbsp;
          
  <td bgcolor="#(ws_color)#" style="color: black">
	<a href="listar_versos_E.cfm?url_s=#TRIM(GetEstudio.e_short_url)#&e_titulo=#TRIM(GetEstudio.e_estudio)#" target="_blank">#TRIM(GetEstudio.e_short_url)#</a></td>	 
 </tr>
    </cfif>
	 
 </cfoutput>
 </cfloop>
 </table>
	<cfoutput>
		<br>
	<cfif NOT (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '')>	
		
	   <cfif ws_end_row GT 8>
	     <cfset ws_prev = trim(url.startRow) - 8>	
	     <a href="EstudiosBib.cfm?startRow=#ws_prev#"><strong>Prev Page</strong></a>	
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   </cfif>		 
	   <cfset ws_end_row = ws_end_row + 1>		
	   <a href="EstudiosBib.cfm?startRow=#ws_end_row#"><strong>Next Page</strong></a>
	</cfif>	
	</cfoutput> 
			
   <!---End contenido	--->	
			
</div>
	  </p>
      
      <!---<h3>Test</h3>
      <p>Lorem ipsum...</p>--->
    </div> 
  </div>
</div>

</body>
</html>
