<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: "Lato", sans-serif;
}

/* Fixed sidenav, full height */
.sidenav {
  height: 100%;
  width: 20%;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
  color: #f1f1f1;
}

/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
  background-color: green;
  color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display: none;
  background-color: #262626;
  padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
  float: right;
  padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

* {
          box-sizing: border-box;
  }
        
.column1 {
          float: left;
          width: 10%;
          padding: 10px; 
}

.column2 {
          float: left;
          width: 90%;
          padding: 1px; 
}
        
        /* Clear floats after the columns */
.row:after {
          content: "";
          display: table;
          clear: both;
}
</style>
</head>
<body>
  
  <div class="row">
    <div class="column1" style="background-color:#fff;">
<div class="sidenav">
  <a href="index.cfm">Home</a>

  <button class="dropdown-btn">RV 1960 
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">

    <button class="dropdown-btn">Pentateuco 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a>
    		<select name="genesis" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
          <cfoutput>
            <option value="0" selected>G&eacute;nesis</option>
            <cfloop from="1" to="50" index=i> 
                <option value="index.cfm?IDcapituloU=#i#">#i#</option>
               <!-- <option value="listar_cap.cfm?IDcapituloU=#i#">#i#</option> -->
            </cfloop>   
          </cfoutput>
        </select>  
      </a>  
       
      <a>
        <cfset H = 0>    
		<select name="exodo" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
          <cfoutput>
            <option value="0" selected>Exodo</option>
            <cfloop from="51" to="90" index=i> 
                <cfset H = H + 1>
                <option value="index.cfm?IDcapituloU=#i#">#H#</option>
            </cfloop>   
          </cfoutput>
        </select>
      </a>
      
      <a>
        <select name="levitico" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
          <cfoutput>
            <option value="0" selected>Lev&iacute;tico</option>
            <cfloop from="91" to="117" index=i> 
                <cfset H = H + 1>
                <option value="index.cfm?IDcapituloU=#i#">#H#</option>
            </cfloop>   
          </cfoutput>
        </select> 
      </a>

      <a>
        <cfset H = 0>    
		<select name="numeros" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
          <cfoutput>
            <option value="0" selected>N&uacute;meros</option>
            <cfloop from="118" to="153" index=i> 
                <cfset H = H + 1>
                <option value="index.cfm?IDcapituloU=#i#">#H#</option>
            </cfloop>   
          </cfoutput>
        </select> 
      </a>

      <a>
        <cfset H = 0>    
        <select name="deuteronomio" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Deuteronomio</option>
                <cfloop from="154" to="187" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select>
      </a>
    </div>

    <button class="dropdown-btn">Historia AT 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
      <a>
        <cfset H = 0>    
        <select name="josue" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Josu&eacute;</option>
                <cfloop from="188" to="211" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select> 
      </a>

      <a>
        <cfset H = 0>    
        <select name="jueces" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Jueces</option>
                <cfloop from="212" to="232" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select> 
      </a>

      <a>
        <cfset H = 0>    
        <select name="rut" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Rut</option>
                <cfloop from="233" to="236" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select> 
      </a>

      <a>
        <cfset H = 0>    
        <select name="1samuel" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>1ra de Samuel</option>
                <cfloop from="237" to="267" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select> 
      </a>

      <a>
        <cfset H = 0>    
        <select name="2samuel" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>2ra de Samuel</option>
                <cfloop from="268" to="291" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select> 
      </a>

      <a>        
        <cfset H = 0>    
        <select name="1reyes" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>1ra de Reyes</option>
                <cfloop from="292" to="313" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select> 
      </a>

      <a>
        <cfset H = 0>    
        <select name="2reyes" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>2da de Reyes</option>
                <cfloop from="314" to="338" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select> 
      </a>

      <a>        
        <cfset H = 0>    
        <select name="1cronicas" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>1ra Cr&oacute;nicas</option>
                <cfloop from="339" to="367" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select>
      </a>

      <a>
        <cfset H = 0>    
        <select name="2cronicas" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>2da Cr&oacute;nicas</option>
                <cfloop from="368" to="403" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select>
      </a>

      <a>
        <cfset H = 0>    
        <select name="esdras" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Esdras</option>
                <cfloop from="404" to="413" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select>	
      </a>

      <a>
        <cfset H = 0>    
        <select name="nehemias" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Nehem&iacute;as</option>
                <cfloop from="414" to="426" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select>
      </a>

      <a>
        <cfset H = 0>    
        <select name="ester" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Ester</option>
                <cfloop from="427" to="436" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select>
      </a>

    </div>

    <button class="dropdown-btn">Poes&iacute;a 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">

        <a>
          <cfset H = 0>    
          <select name="job" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Job</option>
                  <cfloop from="437" to="478" index=i> 
                      <cfset H = H + 1>
                      <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>   
                </cfoutput>
              </select>
        </a>

        <a>
        <cfset H = 0>    
        <select name="salmos" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
              <cfoutput>
                <option value="0" selected>Salmos</option>
                <cfloop from="479" to="628" index=i> 
                    <cfset H = H + 1>
                    <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                </cfloop>   
              </cfoutput>
            </select>
        </a>

        <a>
          <cfset H = 0>    
          <select name="proverbios" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Proverbios</option>
                  <cfloop from="629" to="659" index=i> 
                      <cfset H = H + 1>
                      <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>   
                </cfoutput>
              </select>  
        </a>

        <a>
          <cfset H = 0>    
          <select name="eclesiastes" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Eclesiastes</option>
                  <cfloop from="660" to="671" index=i> 
                      <cfset H = H + 1>
                      <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>   
                </cfoutput>
              </select>
        </a>

        <a>
          <select name="cantares" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Cantares</option>
              <cfloop from="672" to="679" index=i> 
                  <cfset H = H + 1>
                  <option value="index.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>   
            </cfoutput>
          </select>
        </a>

      </div>

      <button class="dropdown-btn">Profetas Mayores 
        <i class="fa fa-caret-down"></i>
      </button>
      <div class="dropdown-container">

        <a>
          <cfset H = 0>    
          <select name="isaias" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Isa&iacute;as</option>
                  <cfloop from="680" to="745" index=i> 
                      <cfset H = H + 1>
                      <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>   
                </cfoutput>
              </select>
        </a>

        <a>
          <cfset H = 0>    
          <select name="jeremias" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Jerem&iacute;as</option>
                  <cfloop from="746" to="797" index=i> 
                      <cfset H = H + 1>
                      <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>   
                </cfoutput>
              </select>
        </a>

        <a>
          <cfset H = 0>    
          <select name="lamentaciones" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Lamentaciones</option>
                  <cfloop from="798" to="802" index=i> 
                      <cfset H = H + 1>
                      <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>   
                </cfoutput>
              </select> 
        </a>

        <a>
          <cfset H = 0>    
          <select name="ezequiel" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Ezequiel</option>
                  <cfloop from="803" to="850" index=i> 
                      <cfset H = H + 1>
                      <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>   
                </cfoutput>
              </select> 
        </a>

        <a>
          <cfset H = 0>    
          <select name="daniel" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                <cfoutput>
                  <option value="0" selected>Daniel</option>
                  <cfloop from="851" to="862" index=i> 
                      <cfset H = H + 1>
                      <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                  </cfloop>   
                </cfoutput>
              </select> 
        </a>

      </div>

      <button class="dropdown-btn">Profetas Menores 
        <i class="fa fa-caret-down"></i>
      </button>
      <div class="dropdown-container">

          <a>
            <cfset H = 0>    
            <select name="oseas" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Oseas</option>
                    <cfloop from="863" to="876" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>
          </a>

          <a>
            <cfset H = 0>    
            <select name="joel" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Joel</option>
                    <cfloop from="877" to="879" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select> 
          </a>

          <a>
            <cfset H = 0>    
            <select name="amos" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Amos</option>
                    <cfloop from="880" to="888" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>
          </a>

          <a>
            <cfset H = 0>    
            <select name="abdias" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Abd&iacute;as</option>
                    <cfloop from="889" to="889" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>
          </a>

          <a>
            <cfset H = 0>    
            <select name="jonas" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Jonas</option>
                    <cfloop from="890" to="893" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>
          </a>

          <a>
            <cfset H = 0>    
            <select name="miqueas" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Miqueas</option>
                    <cfloop from="894" to="900" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>
          </a>

          <a>
            <cfset H = 0>    
            <select name="nahum" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Nahum</option>
                    <cfloop from="901" to="903" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>
          </a>

          <a>
            <cfset H = 0>    
            <select name="habacuc" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Habacuc</option>
                    <cfloop from="904" to="906" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>
          </a>

          <a>
            <cfset H = 0>    
            <select name="sofonias" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Sofon&iacute;as</option>
                    <cfloop from="907" to="909" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>
          </a>

          <a>
            <cfset H = 0>    
            <select name="hageo" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Hageo</option>
                    <cfloop from="910" to="911" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>
          </a>

          <a>
            <cfset H = 0>    
            <select name="zacarias" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Zacar&iacute;as</option>
                    <cfloop from="912" to="925" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select>  
          </a>

          <a>
            <cfset H = 0>    
            <select name="malaquias" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                  <cfoutput>
                    <option value="0" selected>Malaqu&iacute;as</option>
                    <cfloop from="926" to="929" index=i> 
                        <cfset H = H + 1>
                        <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                    </cfloop>   
                  </cfoutput>
                </select> 
          </a>

        </div>

        <button class="dropdown-btn">Historia NT 
          <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
  
            <a>
              <cfset H = 0>    
              <select name="mateo" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Mateo</option>
                      <cfloop from="930" to="957" index=i> 
                          <cfset H = H + 1>
                          <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>   
                    </cfoutput>
                  </select>
            </a>   
            
            <a>
              <cfset H = 0>    
              <select name="marcos" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Marcos</option>
                      <cfloop from="958" to="973" index=i> 
                          <cfset H = H + 1>
                          <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>   
                    </cfoutput>
                  </select>
            </a>

            <a>
              <cfset H = 0>    
              <select name="lucas" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Lucas</option>
                      <cfloop from="974" to="997" index=i> 
                          <cfset H = H + 1>
                          <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>   
                    </cfoutput>
                  </select>
            </a>

            <a>
              <cfset H = 0>    
              <select name="juan" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Juan</option>
                      <cfloop from="998" to="1018" index=i> 
                          <cfset H = H + 1>
                          <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>   
                    </cfoutput>
                  </select>
            </a>

            <a>
              <cfset H = 0>    
              <select name="hechos" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                    <cfoutput>
                      <option value="0" selected>Hechos</option>
                      <cfloop from="1019" to="1046" index=i> 
                          <cfset H = H + 1>
                          <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                      </cfloop>   
                    </cfoutput>
                  </select>
            </a>
            
          </div>

          <button class="dropdown-btn">Ep&iacute;stolas Paulinas
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-container">
    
              <a>
                <cfset H = 0>    
                <select name="romanos" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>Romanos</option>
                        <cfloop from="1047" to="1062" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a>  

              <a>
                <cfset H = 0>    
                <select name="1corintios" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>1ra Corintios</option>
                        <cfloop from="1063" to="1078" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>        
                 <cfset H = 0>    
                <select name="2corintios" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>2da Corintios</option>
                        <cfloop from="1079" to="1091" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>
                <cfset H = 0>    
                <select name="galatas" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>G&aacute;latas</option>
                        <cfloop from="1092" to="1097" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>
                <cfset H = 0>    
                <select name="efesios" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>Efesios</option>
                        <cfloop from="1098" to="1103" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>
                <cfset H = 0>    
                <select name="filipenses" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>Filipenses</option>
                        <cfloop from="1104" to="1107" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>
                <cfset H = 0>    
                <select name="colosenses" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>Colosenses</option>
                        <cfloop from="1108" to="1111" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>
                <cfset H = 0>    
                <select name="1tesalonicenses" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>1ra Tesalonicenses</option>
                        <cfloop from="1112" to="1116" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>
                <cfset H = 0>    
                <select name="2tesalonicenses" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>2da Tesalonicenses</option>
                        <cfloop from="1117" to="1119" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>
                <cfset H = 0>    
                <select name="1timoteo" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>1ra Timoteo</option>
                        <cfloop from="1120" to="1125" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>
                <cfset H = 0>    
                <select name="2timoteo" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>2da Timoteo</option>
                        <cfloop from="1126" to="1129" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 

              <a>
                <cfset H = 0>    
                <select name="tito" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>Tito</option>
                        <cfloop from="1130" to="1132" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>	
              </a> 

              <a>
                <cfset H = 0>    
                <select name="filemon" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                      <cfoutput>
                        <option value="0" selected>Filem&oacute;n</option>
                        <cfloop from="1133" to="1133" index=i> 
                            <cfset H = H + 1>
                            <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                        </cfloop>   
                      </cfoutput>
                    </select>
              </a> 
             
            </div>

            <button class="dropdown-btn">Ep&iacute;stolas Generales 
              <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
      
                <a>
                  <cfset H = 0>    
                  <select name="hebreos" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>Hebreos</option>
                          <cfloop from="1134" to="1146" index=i> 
                              <cfset H = H + 1>
                              <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>   
                        </cfoutput>
                      </select>
                </a> 
                
                <a>
                  <cfset H = 0>    
                  <select name="santiago" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>Santiago</option>
                          <cfloop from="1147" to="1151" index=i> 
                              <cfset H = H + 1>
                              <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>   
                        </cfoutput>
                      </select>
                </a>

                <a>
                  <cfset H = 0>    
                  <select name="1pedro" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>1ra Pedro</option>
                          <cfloop from="1152" to="1156" index=i> 
                              <cfset H = H + 1>
                              <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>   
                        </cfoutput>
                      </select>
                </a>

                <a>
                  <cfset H = 0>    
                  <select name="2pedro" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>2da Pedro</option>
                          <cfloop from="1157" to="1159" index=i> 
                              <cfset H = H + 1>
                              <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>   
                        </cfoutput>
                      </select>
                </a>

                <a>
                  <cfset H = 0>    
                  <select name="1juan" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>1ra Juan</option>
                          <cfloop from="1160" to="1164" index=i> 
                              <cfset H = H + 1>
                              <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>   
                        </cfoutput>
                      </select>
                </a>

                <a>        <cfset H = 0>    
                  <select name="2juan" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>2da Juan</option>
                          <cfloop from="1165" to="1165" index=i> 
                              <cfset H = H + 1>
                              <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>   
                        </cfoutput>
                      </select></a>

                <a>
                  <cfset H = 0>    
                  <select name="3juan" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>3ra Juan</option>
                          <cfloop from="1166" to="1166" index=i> 
                              <cfset H = H + 1>
                              <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>   
                        </cfoutput>
                      </select>
                </a>

                <a>
                  <cfset H = 0>    
                  <select name="judas" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <cfoutput>
                          <option value="0" selected>Judas</option>
                          <cfloop from="1167" to="1167" index=i> 
                              <cfset H = H + 1>
                              <option value="index.cfm?IDcapituloU=#i#">#H#</option>
                          </cfloop>   
                        </cfoutput>
                      </select>
                </a>

    </div>
    <a>
      <cfset H = 0>    
      <select name="apocalipsis" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value="0" selected>Apocalipsis</option>
              <cfloop from="1168" to="1189" index=i> 
                  <cfset H = H + 1>
                  <option value="index.cfm?IDcapituloU=#i#">#H#</option>
              </cfloop>   
            </cfoutput>
          </select>
    </a>
  </div>


   
  <a href="#contact">Contact</a>
  <button class="dropdown-btn">Dropdown 
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">Link 1</a>
     
    <button class="dropdown-btn">Otro 
        <i class="fa fa-caret-down"></i>
      </button>
      <div class="dropdown-container">
        <a href="#">Link 1a</a>
        <a href="#">Link 2a</a>
        <a href="#">Link 3a</a>
      </div>

    <a href="#">Link 3</a>
  </div>
   
  <a href="#Nosotros">Nosotros</a>
</div>
</div>
<div class="column2" style="background-color:#ffffff;">
<div class="main">

  <cfif isDefined('url.IDcapituloU')>
<!-- Begin main 1 ********************************************************************--> 
      <cfparam name="url.IDcapituloU" default="">
      <cfset ws_I = 1>	
       
      <CFSET GetCapitulo.RecordCount=0>
      <CFQUERY NAME="GetCapitulo" datasource="luzyvidaDB_dsn">
     
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
  <a href="index.cfm?IDcapituloU=#ws_prev#"><<<<</a>&nbsp;&nbsp;
  
  <a href="index.cfm?IDcapituloU=#ws_next#">>>>></a>
  </h2>	
</cfoutput>
    

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
 
             <cfif ws_I EQ 0>
                          <cfset ws_color = bgcolorNo>
                           <cfset ws_I = 1>
                      <cfelse>
                           <cfset ws_color = bgcolorYes>
                           <cfset ws_I = 0>
                      </cfif> 
               
 <p>
  <tr>  
  
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
   
 
  </tr>  
 </p>
</cfoutput>
</cfloop>
  
</table>							 
               
<cfoutput>
<h2><a href="index.cfm?IDcapituloU=#ws_prev#"><<<<</a>&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;
  <a href="index.cfm?IDcapituloU=#ws_next#">>>>></a>
  </h2>	
</cfoutput>
   <cfif (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn AND 
    SESSION.Auth.user_role GT 95)>
     <a href="
   https://www.bibliatodo.com/la-biblia/Biblia-de-las-americas/genesis-1" target="_blank">Link</a>
   </cfif>

 

<!-- End main 1 **************************************************************************-->

  <cfelse>  
     <h2>Luz y Vida</h2>
     <p><img src="images/LogoLYV_12.gif" width="41" height="38" alt=""/></p>
  </cfif>

</div>

<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
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
</body>
</html> 