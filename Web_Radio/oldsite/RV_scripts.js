 

 
  $(document).ready(function(){
  
   
      $("#diezmo1").tooltip({
          delay: {show: 0, hide: 1000},
          template : `
        <div>
         
          <a href="Estudios/1002.cfm">
           <img class="img-fluid" src="images/1002.jpg" width="200px;" height="200px"> </a>
      </div>
      `
      });  

  });
 
  $(document).ready(function(){

  $("#biblia1").tooltip({
    delay: {show: 0, hide: 1000},
    template : `
  <div>
   
    <a href="Estudios/1018.pdf">
     <img class="img-fluid" src="images/b1.jpg" width="200px;" height="200px"> </a>
</div>
`
});
 
});