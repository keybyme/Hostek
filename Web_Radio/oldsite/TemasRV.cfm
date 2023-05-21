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
                    <li><a href="/">Home</a></li>
                    <li><a href="/lectura.cfm">Lecura</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </section>
          <div class="clearfix"></div>

          <div class="container">
            <article class="latest-post detail">
              <img src="assets/img/library-2021-08-26-18-11-44-utc-b2.jpg" alt="dummy">
              <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">

                  <div>
              <!---contenido --->
	<cfif isDefined("form.Criteria")>
         <cfset url.Criteria = trim(form.Criteria)>
    </cfif>
	 
	<cfif isDefined("form.startRow")>
	     <cfset url.startRow = trim(form.startRow)>	
	</cfif>
		 
<CFSET GetTema.RecordCount=0>
<CFQUERY NAME="GetTema" datasource="luzyvidaDB_dsn">
  SELECT *                  
  FROM  lTema
  	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
      where  T_titulo LIKE '%#Trim(url.Criteria)#%'                    
    </cfif> 
  order by T_id_key
	 
</CFQUERY>
 
	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>	
		<cfset ws_end_row = 200>
	<cfelse>		
	    <cfset ws_end_row = #Trim(url.startRow)# + 11> 		
	</cfif>	
		
	<table>
   
    

<cfform name="disp" method="post" action="TemasRV.cfm?startRow=1">

    <tr>
        <td>Buscar:  <input name="Criteria" size="30"></td>
         <td valign="bottom" colspan="2"><input type="submit" name="editpho" value="enviar"></td> 
     
    </tr>          
 
</cfform>
		

                        </tr>
                        <tr>
                          <th style="color:#006" bgcolor="#CCCCCC">Tema</th>
                        </tr>


                        <cfloop query="GetTema" startrow="#trim(url.startRow)#" endrow="#ws_end_row#">
                          <cfoutput>
                            <tr>

                              <td><a href="Listar_temas.cfm?IDtemaU=#GetTema.T_id_key#"
                                  target="_blank">#TRIM(GetTema.T_titulo)#</a></td>
                            </tr>


                          </cfoutput>
                        </cfloop>
                      </table>
                      <cfoutput>
                        <br>
                        <cfif NOT (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '' )>

                          <cfif ws_end_row GT 12>
                            <cfset ws_prev=trim(url.startRow) - 12>
                              <a href="temasRV.cfm?startRow=#ws_prev#"><strong>Prev Page</strong></a>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </cfif>
                          <cfset ws_end_row=ws_end_row + 1>
                            <a href="temasRV.cfm?startRow=#ws_end_row#"><strong>Next Page</strong></a>
                        </cfif>
                      </cfoutput>

                      <!---End contenido	--->


                  </div>


                </div>
              </div>
            </article>
          </div>

          <div class="clearfix"></div>
        </div>
      </div>



      <cfinclude template="template/footer.cfm">