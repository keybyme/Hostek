<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
  integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
  integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>


<!-- begin Link2 -->
<CFQUERY NAME="GetLink2" datasource="wolffdb_dsn">
  SELECT *
  FROM lLibros
</CFQUERY>


<cfset myList_L_IdLibro="">
<cfset myList_L_Libro_Desc="">
<cfset myList_L_link="">
<cfset myList_L_link2="">
  <cfloop query="GetLink2">
    <cfset myList_L_IdLibro=ListAppend(myList_L_IdLibro, GetLink2.L_IdLibro)>
    <cfset myList_L_Libro_Desc=ListAppend(myList_L_Libro_Desc, GetLink2.L_Libro_Desc)>
    <cfset myList_L_link=ListAppend(myList_L_link, GetLink2.L_link)>
    <cfset myList_L_link2=ListAppend(myList_L_link2, GetLink2.L_link2)>
  </cfloop>


 

<div class="btn-group">
  <!--- <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Biblia Hablada
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-menu">

    <ul>
      <li>
        <a>
          <select name="drama2" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Libros</option>
              <cfloop query="GetLink2">
                <option value="#GetLink2.L_link2#">#GetLink2.L_Libro_Desc#</option>
              </cfloop>
            </cfoutput>
          </select>
        </a>
      </li>
    </ul>
 
  </div> --->
  <!-- end Link2 -->


  <!--- <button class="btn btn-primary dropdown-toggle">RV 1960
    <i class="fa fa-caret-down"></i>
  </button> --->

  <div class="container">
    <a href="Search.cfm" style="color: white">Search</a>

    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
        style="color: red">Pentateuco
        <i class="fa fa-caret-down"></i>
      </button>
      <ul class="dropdown-menu">

        <li>
          <select name="genesis" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>G&eacute;nesis</option>
              <cfloop from="1" to="50" index=i>
                <option value="RV.cfm?IDcapituloU=#i#">#i#</option>
                <!-- <option value="listar_cap.cfm?IDcapituloU=#i#">#i#</option> -->
              </cfloop>
            </cfoutput>
          </select>
        </li>

    

        <cfset H=0>
          <select name="exodo" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Exodo</option>
              <cfloop from="51" to="90" index=i>
                <cfset H=H + 1>
                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>
            </cfoutput>
          </select>





          <cfset H=0>
            <select name="levitico" size="1"
              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Lev&iacute;tico</option>
                <cfloop from="91" to="117" index=i>
                  <cfset H=H + 1>
                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>
              </cfoutput>
            </select>



            <cfset H=0>
              <select name="numeros" size="1"
                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>N&uacute;meros</option>
                  <cfloop from="118" to="153" index=i>
                    <cfset H=H + 1>
                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>
                </cfoutput>
              </select>

              <cfset H=0>
                <select name="deuteronomio" size="1"
                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Deuteronomio</option>
                    <cfloop from="154" to="187" index=i>
                      <cfset H=H + 1>
                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>
                  </cfoutput>
                </select>


      </ul>
    </div>

    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
        style="color: red">Historia AT
        <i class="fa fa-caret-down"></i>
      </button>
      <ul class="dropdown-menu">



        <cfset H=0>
          <select name="josue" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Josu&eacute;</option>
              <cfloop from="188" to="211" index=i>
                <cfset H=H + 1>
                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>
            </cfoutput>
          </select>

          <cfset H=0>
            <select name="jueces" size="1"
              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Jueces</option>
                <cfloop from="212" to="232" index=i>
                  <cfset H=H + 1>
                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>
              </cfoutput>
            </select>

            <cfset H=0>
              <select name="rut" size="1"
                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Rut</option>
                  <cfloop from="233" to="236" index=i>
                    <cfset H=H + 1>
                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>
                </cfoutput>
              </select>

              <cfset H=0>
                <select name="1samuel" size="1"
                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>1ra de Samuel</option>
                    <cfloop from="237" to="267" index=i>
                      <cfset H=H + 1>
                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>
                  </cfoutput>
                </select>

                <cfset H=0>
                  <select name="2samuel" size="1"
                    onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>2ra de Samuel</option>
                      <cfloop from="268" to="291" index=i>
                        <cfset H=H + 1>
                          <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>
                    </cfoutput>
                  </select>

                  <cfset H=0>
                    <select name="1reyes" size="1"
                      onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>1ra de Reyes</option>
                        <cfloop from="292" to="313" index=i>
                          <cfset H=H + 1>
                            <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>
                      </cfoutput>
                    </select>

                    <cfset H=0>
                      <select name="2reyes" size="1"
                        onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>2da de Reyes</option>
                          <cfloop from="314" to="338" index=i>
                            <cfset H=H + 1>
                              <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>
                        </cfoutput>
                      </select>

                      <cfset H=0>
                        <select name="1cronicas" size="1"
                          onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                          <cfoutput>
                            <option value="0" selected>1ra Cr&oacute;nicas</option>
                            <cfloop from="339" to="367" index=i>
                              <cfset H=H + 1>
                                <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                            </cfloop>
                          </cfoutput>
                        </select>

                        <cfset H=0>
                          <select name="2cronicas" size="1"
                            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                            <cfoutput>
                              <option value="0" selected>2da Cr&oacute;nicas</option>
                              <cfloop from="368" to="403" index=i>
                                <cfset H=H + 1>
                                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                              </cfloop>
                            </cfoutput>
                          </select>


                          <cfset H=0>
                            <select name="esdras" size="1"
                              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                              <cfoutput>
                                <option value="0" selected>Esdras</option>
                                <cfloop from="404" to="413" index=i>
                                  <cfset H=H + 1>
                                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                </cfloop>
                              </cfoutput>
                            </select>

                            <cfset H=0>
                              <select name="nehemias" size="1"
                                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                                <cfoutput>
                                  <option value="0" selected>Nehem&iacute;as</option>
                                  <cfloop from="414" to="426" index=i>
                                    <cfset H=H + 1>
                                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                  </cfloop>
                                </cfoutput>
                              </select>

                              <cfset H=0>
                                <select name="ester" size="1"
                                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                                  <cfoutput>
                                    <option value="0" selected>Ester</option>
                                    <cfloop from="427" to="436" index=i>
                                      <cfset H=H + 1>
                                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                    </cfloop>
                                  </cfoutput>
                                </select>


      </ul>
    </div>

    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
        style="color: red">Poes&iacute;a
        <i class="fa fa-caret-down"></i>
      </button>
      <ul class="dropdown-menu">
        <cfset H=0>
          <select name="job" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Job</option>
              <cfloop from="437" to="478" index=i>
                <cfset H=H + 1>
                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>
            </cfoutput>
          </select>

          <cfset H=0>
            <select name="salmos" size="1"
              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Salmos</option>
                <cfloop from="479" to="628" index=i>
                  <cfset H=H + 1>
                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>
              </cfoutput>
            </select>

            <cfset H=0>
              <select name="proverbios" size="1"
                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Proverbios</option>
                  <cfloop from="629" to="659" index=i>
                    <cfset H=H + 1>
                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>
                </cfoutput>
              </select>

              <cfset H=0>
                <select name="eclesiastes" size="1"
                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Eclesiastes</option>
                    <cfloop from="660" to="671" index=i>
                      <cfset H=H + 1>
                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>
                  </cfoutput>
                </select>

                <cfset H=0>
                  <select name="cantares" size="1"
                    onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Cantares</option>
                      <cfloop from="672" to="679" index=i>
                        <cfset H=H + 1>
                          <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>
                    </cfoutput>
                  </select>

      </ul>
    </div>



    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
        style="color: red">Profetas Mayores
        <i class="fa fa-caret-down"></i>
      </button>
      <ul class="dropdown-menu">



        <cfset H=0>
          <select name="isaias" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Isa&iacute;as</option>
              <cfloop from="680" to="745" index=i>
                <cfset H=H + 1>
                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>
            </cfoutput>
          </select>

          <cfset H=0>
            <select name="jeremias" size="1"
              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Jerem&iacute;as</option>
                <cfloop from="746" to="797" index=i>
                  <cfset H=H + 1>
                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>
              </cfoutput>
            </select>

            <cfset H=0>
              <select name="lamentaciones" size="1"
                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Lamentaciones</option>
                  <cfloop from="798" to="802" index=i>
                    <cfset H=H + 1>
                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>
                </cfoutput>
              </select>

              <cfset H=0>
                <select name="ezequiel" size="1"
                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Ezequiel</option>
                    <cfloop from="803" to="850" index=i>
                      <cfset H=H + 1>
                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>
                  </cfoutput>
                </select>

                <cfset H=0>
                  <select name="daniel" size="1"
                    onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Daniel</option>
                      <cfloop from="851" to="862" index=i>
                        <cfset H=H + 1>
                          <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>
                    </cfoutput>
                  </select>

      </ul>
    </div>




    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
        style="color: red">Profetas Menores
        <i class="fa fa-caret-down"></i>
      </button>
      <ul class="dropdown-menu">

        <cfset H=0>
          <select name="oseas" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Oseas</option>
              <cfloop from="863" to="876" index=i>
                <cfset H=H + 1>
                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>
            </cfoutput>
          </select>

          <cfset H=0>
            <select name="joel" size="1"
              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Joel</option>
                <cfloop from="877" to="879" index=i>
                  <cfset H=H + 1>
                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>
              </cfoutput>
            </select>

            <cfset H=0>
              <select name="amos" size="1"
                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Amos</option>
                  <cfloop from="880" to="888" index=i>
                    <cfset H=H + 1>
                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>
                </cfoutput>
              </select>

              <cfset H=0>
                <select name="abdias" size="1"
                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Abd&iacute;as</option>
                    <cfloop from="889" to="889" index=i>
                      <cfset H=H + 1>
                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>
                  </cfoutput>
                </select>

                <cfset H=0>
                  <select name="jonas" size="1"
                    onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Jonas</option>
                      <cfloop from="890" to="893" index=i>
                        <cfset H=H + 1>
                          <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>
                    </cfoutput>
                  </select>

                  <cfset H=0>
                    <select name="miqueas" size="1"
                      onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>Miqueas</option>
                        <cfloop from="894" to="900" index=i>
                          <cfset H=H + 1>
                            <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>
                      </cfoutput>
                    </select>

                    <cfset H=0>
                      <select name="nahum" size="1"
                        onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>Nahum</option>
                          <cfloop from="901" to="903" index=i>
                            <cfset H=H + 1>
                              <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>
                        </cfoutput>
                      </select>

                      <cfset H=0>
                        <select name="habacuc" size="1"
                          onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                          <cfoutput>
                            <option value="0" selected>Habacuc</option>
                            <cfloop from="904" to="906" index=i>
                              <cfset H=H + 1>
                                <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                            </cfloop>
                          </cfoutput>
                        </select>

                        <cfset H=0>
                          <select name="sofonias" size="1"
                            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                            <cfoutput>
                              <option value="0" selected>Sofon&iacute;as</option>
                              <cfloop from="907" to="909" index=i>
                                <cfset H=H + 1>
                                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                              </cfloop>
                            </cfoutput>
                          </select>

                          <cfset H=0>
                            <select name="hageo" size="1"
                              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                              <cfoutput>
                                <option value="0" selected>Hageo</option>
                                <cfloop from="910" to="911" index=i>
                                  <cfset H=H + 1>
                                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                </cfloop>
                              </cfoutput>
                            </select>

                            <cfset H=0>
                              <select name="zacarias" size="1"
                                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                                <cfoutput>
                                  <option value="0" selected>Zacar&iacute;as</option>
                                  <cfloop from="912" to="925" index=i>
                                    <cfset H=H + 1>
                                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                  </cfloop>
                                </cfoutput>
                              </select>

                              <cfset H=0>
                                <select name="malaquias" size="1"
                                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                                  <cfoutput>
                                    <option value="0" selected>Malaqu&iacute;as</option>
                                    <cfloop from="926" to="929" index=i>
                                      <cfset H=H + 1>
                                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                    </cfloop>
                                  </cfoutput>
                                </select>
      </ul>

    </div>


    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
        style="color: red">Historia NT
        <i class="fa fa-caret-down"></i>
      </button>
      <ul class="dropdown-menu">


        <cfset H=0>
          <select name="mateo" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Mateo</option>
              <cfloop from="930" to="957" index=i>
                <cfset H=H + 1>
                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>
            </cfoutput>
          </select>

          <cfset H=0>
            <select name="marcos" size="1"
              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Marcos</option>
                <cfloop from="958" to="973" index=i>
                  <cfset H=H + 1>
                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>
              </cfoutput>
            </select>

            <cfset H=0>
              <select name="lucas" size="1"
                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Lucas</option>
                  <cfloop from="974" to="997" index=i>
                    <cfset H=H + 1>
                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>
                </cfoutput>
              </select>

              <cfset H=0>
                <select name="juan" size="1"
                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Juan</option>
                    <cfloop from="998" to="1018" index=i>
                      <cfset H=H + 1>
                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>
                  </cfoutput>
                </select>

                <cfset H=0>
                  <select name="hechos" size="1"
                    onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Hechos</option>
                      <cfloop from="1019" to="1046" index=i>
                        <cfset H=H + 1>
                          <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>
                    </cfoutput>
                  </select>
      </ul>

    </div>
    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
        style="color: red">Ep&iacute;stolas Paulinas
        <i class="fa fa-caret-down"></i>
      </button>
      <ul class="dropdown-menu">

        <cfset H=0>
          <select name="romanos" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Romanos</option>
              <cfloop from="1047" to="1062" index=i>
                <cfset H=H + 1>
                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>
            </cfoutput>
          </select>

          <cfset H=0>
            <select name="1corintios" size="1"
              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>1ra Corintios</option>
                <cfloop from="1063" to="1078" index=i>
                  <cfset H=H + 1>
                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>
              </cfoutput>
            </select>

            <cfset H=0>
              <select name="2corintios" size="1"
                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>2da Corintios</option>
                  <cfloop from="1079" to="1091" index=i>
                    <cfset H=H + 1>
                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>
                </cfoutput>
              </select>

              <cfset H=0>
                <select name="galatas" size="1"
                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>G&aacute;latas</option>
                    <cfloop from="1092" to="1097" index=i>
                      <cfset H=H + 1>
                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>
                  </cfoutput>
                </select>

                <cfset H=0>
                  <select name="efesios" size="1"
                    onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Efesios</option>
                      <cfloop from="1098" to="1103" index=i>
                        <cfset H=H + 1>
                          <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>
                    </cfoutput>
                  </select>

                  <cfset H=0>
                    <select name="filipenses" size="1"
                      onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>Filipenses</option>
                        <cfloop from="1104" to="1107" index=i>
                          <cfset H=H + 1>
                            <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>
                      </cfoutput>
                    </select>

                    <cfset H=0>
                      <select name="colosenses" size="1"
                        onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>Colosenses</option>
                          <cfloop from="1108" to="1111" index=i>
                            <cfset H=H + 1>
                              <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>
                        </cfoutput>
                      </select>

                      <cfset H=0>
                        <select name="1tesalonicenses" size="1"
                          onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                          <cfoutput>
                            <option value="0" selected>1ra Tesalonicenses</option>
                            <cfloop from="1112" to="1116" index=i>
                              <cfset H=H + 1>
                                <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                            </cfloop>
                          </cfoutput>
                        </select>

                        <cfset H=0>
                          <select name="2tesalonicenses" size="1"
                            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                            <cfoutput>
                              <option value="0" selected>2da Tesalonicenses</option>
                              <cfloop from="1117" to="1119" index=i>
                                <cfset H=H + 1>
                                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                              </cfloop>
                            </cfoutput>
                          </select>

                          <cfset H=0>
                            <select name="1timoteo" size="1"
                              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                              <cfoutput>
                                <option value="0" selected>1ra Timoteo</option>
                                <cfloop from="1120" to="1125" index=i>
                                  <cfset H=H + 1>
                                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                </cfloop>
                              </cfoutput>
                            </select>

                            <cfset H=0>
                              <select name="2timoteo" size="1"
                                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                                <cfoutput>
                                  <option value="0" selected>2da Timoteo</option>
                                  <cfloop from="1126" to="1129" index=i>
                                    <cfset H=H + 1>
                                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                  </cfloop>
                                </cfoutput>
                              </select>

                              <cfset H=0>
                                <select name="tito" size="1"
                                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                                  <cfoutput>
                                    <option value="0" selected>Tito</option>
                                    <cfloop from="1130" to="1132" index=i>
                                      <cfset H=H + 1>
                                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                    </cfloop>
                                  </cfoutput>
                                </select>

                                <cfset H=0>
                                  <select name="filemon" size="1"
                                    onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                                    <cfoutput>
                                      <option value="0" selected>Filem&oacute;n</option>
                                      <cfloop from="1133" to="1133" index=i>
                                        <cfset H=H + 1>
                                          <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                                      </cfloop>
                                    </cfoutput>
                                  </select>
      </ul>
    </div>



    <div class="dropdown">
      <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
        style="color: red">Ep&iacute;stolas Generales
        <i class="fa fa-caret-down"></i>
      </button>
      <ul class="dropdown-menu">

        <cfset H=0>
          <select name="hebreos" size="1"
            onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Hebreos</option>
              <cfloop from="1134" to="1146" index=i>
                <cfset H=H + 1>
                  <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>
            </cfoutput>
          </select>

          <cfset H=0>
            <select name="santiago" size="1"
              onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Santiago</option>
                <cfloop from="1147" to="1151" index=i>
                  <cfset H=H + 1>
                    <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>
              </cfoutput>
            </select>

            <cfset H=0>
              <select name="1pedro" size="1"
                onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>1ra Pedro</option>
                  <cfloop from="1152" to="1156" index=i>
                    <cfset H=H + 1>
                      <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>
                </cfoutput>
              </select>

              <cfset H=0>
                <select name="2pedro" size="1"
                  onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>2da Pedro</option>
                    <cfloop from="1157" to="1159" index=i>
                      <cfset H=H + 1>
                        <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>
                  </cfoutput>
                </select>

                <cfset H=0>
                  <select name="1juan" size="1"
                    onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>1ra Juan</option>
                      <cfloop from="1160" to="1164" index=i>
                        <cfset H=H + 1>
                          <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>
                    </cfoutput>
                  </select>
                  <cfset H=0>
                    <select name="2juan" size="1"
                      onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>2da Juan</option>
                        <cfloop from="1165" to="1165" index=i>
                          <cfset H=H + 1>
                            <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>
                      </cfoutput>
                    </select>
                    <cfset H=0>
                      <select name="3juan" size="1"
                        onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>3ra Juan</option>
                          <cfloop from="1166" to="1166" index=i>
                            <cfset H=H + 1>
                              <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>
                        </cfoutput>
                      </select>

                      <cfset H=0>
                        <select name="judas" size="1"
                          onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                          <cfoutput>
                            <option value="0" selected>Judas</option>
                            <cfloop from="1167" to="1167" index=i>
                              <cfset H=H + 1>
                                <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
                            </cfloop>
                          </cfoutput>
                        </select>
      </ul>

    </div>
    <a>
      <cfset H=0>
        <select name="apocalipsis" size="1"
          onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
          <cfoutput>
            <option value="0" selected><a>Apocalipsis</a></option>
            <cfloop from="1168" to="1189" index=i>
              <cfset H=H + 1>
                <option value="RV.cfm?IDcapituloU=#i#">#H#</option>
            </cfloop>
          </cfoutput>
        </select>
    </a>
  </div>
</div>


<!--- <a href="Login.cfm" style="color: red">Log In</a>
<a href="Logout.cfm" style="color: red">Log Out</a> --->


<script>
  /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
  var dropdown = document.getElementsByClassName("dropdown-btn");
  var i;

  for (i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function () {
      this.classList.toggle("active");
      var dropdownContent = this.nextElementSibling;
      if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
      } else {
        dropdownContent.style.display = "block";
      }
    });
  }
</script>
</div>
</div>