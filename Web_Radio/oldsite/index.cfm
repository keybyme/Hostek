<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Luz y Vida</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  </head>
  <body>
<div class="container text-center">
  <!--- Row 1 --->
  <div class="row justify-content-md-center">
     <cfinclude template="menu.cfm">
  </div>
  <!--- Row 2 --->
  <div class="row justify-content-md-center">
    <div class="col-md-auto">
       <br>
    </div>
  </div>
  <!--- Row 3 --->
  <div class="row justify-content-md-center">
         <!--- Col 3-1 --->
        <div class="col">
             <cfinclude template="radio.cfm">
        </div>
          <!--- Col 3-2 --->
        <div class="col-md-auto">
          <br>
        </div>
          <!--- Col 3-3 --->
        <div class="col-md-auto">
             <table style="background-color:#EBF5FB">
                 <tr><td>
                     <a href="TemasRV.cfm?startRow=1"><h1 style="color: blue">Temas de la Biblia</h1></a> 
                     <a href="TemasRV.cfm?startRow=1"><img src="images/b1.jpg" width="120" alt=""/></a>  
                 </td></tr>
             </table>
        </div>
          <!--- Col 3-4 --->
        <div class="col-md-auto">
          <br>
        </div>
          <!--- Col 3-5 --->
        <div class="col">
          <table style="background-color:#FEF5E7">
            <tr><td>
                <a href="Diccionario.cfm?startRow=1"><h1 style="color: blue">Diccionario B&iacute;blico</h1></a> 
                <a href="Diccionario.cfm?startRow=1"><img src="images/dic.jpg" width="120" alt=""/></a>  
            </td></tr>
          </table>
        </div>
  </div>

    <!--- Row 4 --->
    <div class="row justify-content-md-center">
      <div class="col-md-auto">
         <br>
      </div>
    </div>

  <!--- Row 5 --->
  <div class="row justify-content-md-center">
    <!--- Col 5-1 --->
    <div class="col-md-auto">
      <table style="background-color:#A9DFBF">
          <tr><td>
              <a href="Lectura.cfm"><h1 style="color: blue">Lectura de hoy</h1></a> 
              <a href="Lectura.cfm"><img src="images/lect.jpg" width="120" alt=""/></a>  
          </td></tr>
      </table>
 </div>
     <!--- Col 5-2 --->
   <div class="col-md-auto">
     <br>
   </div>
     <!--- Col 5-3 --->
   <div class="col-md-auto">
        <table style="background-color:#F5B7B1">
            <tr><td>
                <a href="#"><h1 style="color: blue">Reina Valera 1960</h1></a> 
                <a href="#"><img src="images/wef.jpg" width="120" alt=""/></a>  
            </td></tr>
        </table>
   </div>
     <!--- Col 5-4 --->
   <div class="col-md-auto">
     <br>
   </div>
     <!--- Col 5-5 --->
   <div class="col">
     <table style="background-color:#A569BD">
       <tr><td>
           <a href="#"><h1 style="color: blue">Preguntas y Peticiones</h1></a> 
           <a href="#"><img src="images/qwf.jpg" width="120" alt=""/></a>  
       </td></tr>
     </table>
   </div>
</div>

</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  </body>
</html>