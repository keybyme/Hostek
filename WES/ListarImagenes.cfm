
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KeyByMe</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
}

#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}
</style>    
    
</head>
    
<style>
.dropdown-menu {         
  max-height: 400px;
  overflow-y: auto;
}
    </style>

<body>
    

<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
 
<script>
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
    
 <cfset w_sizeU=0>
<cfparam name="url.sizeU" default="">
<cfset w_sizeU = url.sizeU>    
    
    
    
<div align="center">
 
    <cfinclude template="HeaderFotos.cfm"></cfinclude>
 
<cfif isDefined("form.Criteria")>
    <cfset url.Criteria = trim(form.Criteria)>
</cfif>   
 <cfif isDefined("form.CriteriaCat")>
    <cfset url.CriteriaCat = trim(form.CriteriaCat)>
</cfif>	 
     
<CFSET GetCat.RecordCount=0>
<CFQUERY NAME="GetCat" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM Foto_Cat
  order by cat_desc
</CFQUERY>      
       
    
<CFSET GetFoto.RecordCount=0>
<CFQUERY NAME="GetFoto" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM  Fotos 
       	<cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>
             where (foto_pic LIKE '%#Trim(url.Criteria)#%')
     	<cfelseif (isDefined('url.CriteriaCat') AND TRIM(url.CriteriaCat) NEQ '')>
		      where foto_type = #Trim(url.CriteriaCat)#
	    </cfif>
	Order by foto_pic
</CFQUERY>
    

 <cfset ws_link = "https://www.keybyme.com/Fotos/Wolff/"> 
 <cfset ws_foto = "#ws_link##GetFoto.foto_pic#">
     <div>
        <h1 style="color: green">
            Wolff's
        </h1>
     </div>     
          <br> 
<!---<div class="btn-group">
  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
        Fotos
  </button>
  <ul class="dropdown-menu">
      <cfloop>    
            <a href="#">
            <cfoutput query="GetFoto">
                    <strong>#GetFoto.foto_pic#</strong>
                
                    <strong>
                         #TRIM(GetFoto.foto_pic)#&nbsp;&nbsp;
                         <cfset ws_foto = "#ws_link##GetFoto.foto_pic#">
                         <a href="#ws_foto#" target="_blank">LINK</a> 
                     </strong>
                
                            &nbsp;&nbsp;
                   <a href="del_foto.cfm?claveU=#GetFoto.foto_key#"><img src="../image/ico-eliminar2.gif" width="20" height="20" alt=""/></a><br>
                    <img src="../Fotos/Wolff/#GetFoto.foto_pic#" width="500"></a>
            </cfoutput>
      </cfloop>
  </ul>
</div>--->
      
<div align="center">    
    <br>
<div align="center">    
<cfform name="disp" method="post" action="ListarImagenes.cfm?sizeU=40">
   <cfoutput> 
        <p><input name="Criteria" size="20" placeholder="Type here">
        <input type="submit" name="editpho" value="Search">
        
        <cfselect input name="CriteriaCat" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
		       <cfoutput>   
				     <option value="">Folders</option>
			     <cfloop query="GetCat">
					 <option value="https://www.keybyme.com/WES/ListarImagenes.cfm?CriteriaCat=#GetCat.cat_key#&sizeU=40">#GetCat.cat_desc#</option>
	             </cfloop>
				</cfoutput>  	  
        </cfselect>
        </p>
          
  </cfoutput>    
</cfform>  
  </div>     
   <br>
    
  <div align="center">
 
      <cfloop query="GetFoto">        
         <cfoutput> 
             <cfif (isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ '') or
                   (isDefined('url.CriteriaCat') AND TRIM(url.CriteriaCat) NEQ '')>
               <p>
                     <!---<strong>
                         #TRIM(GetFoto.foto_pic)#
                     </strong>--->
                
                 <cfset ws_foto = "#ws_link##GetFoto.foto_pic#">
                         <a href="#ws_foto#" target="_blank"><strong>LINK</strong></a> 
                
                    <a href="#ws_foto#" download target="_blank">&nbsp;&nbsp;&nbsp;<strong>DOWNLOAD</strong></a>
                        
                 
                     <a href="ChangeFolder.cfm?claveU=#GetFoto.foto_key#">Change Folder</a>
                    
                 <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
                 &nbsp;    
                 <cfelse>     
                  <a href="del_foto.cfm?claveU=#GetFoto.foto_key#"><img src="../image/ico-eliminar2.gif" width="20" height="20" alt=""/></a>
              
                 </cfif>     
                 </p>
                 <p>   
                  <img class="img-responsive" src="../Fotos/Wolff/#foto_pic#" alt="Chania">
                 </p>     
            
            <cfelse>     
                <p>
                    <!--- <strong>
                         #TRIM(GetFoto.foto_pic)# 
                     </strong>--->
                   <cfset ws_foto = "#ws_link##GetFoto.foto_pic#">
                         <a href="#ws_foto#" target="_blank"><strong>LINK</strong></a> 
                
                     <a href="ChangeFolder.cfm?claveU=#GetFoto.foto_key#">Change Folder</a>
                    
                 <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
                  &nbsp;      
                 <cfelse>    
                   <a href="del_foto.cfm?claveU=#GetFoto.foto_key#"><img src="../image/ico-eliminar2.gif" width="20" height="20" alt=""/></a>
                 
                </cfif>     
               
                     
                  <img class="img-responsive" src="../Fotos/Wolff/#foto_pic#" alt="Chania">
                 </p>
            </cfif>   
                 
          </cfoutput>
        </cfloop>     
    </div>           
 </div>    
<!---  <div>

    <select name="ws_cat" size="1" onChange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            <cfoutput>
              <option value "" selected>Upload Pic</option>
		      <cfloop query="GetCat">     
		          <option value="SubirImagen.cfm?ws_cat=#GetCat.cat_key#"> 
		                #GetCat.cat_desc#
	              </option>
		      </cfloop> 
            </cfoutput>  
    </select>    
    </div>  --->  
    
</div>
</html>
