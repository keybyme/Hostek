<footer>
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-3">
        <h4><span class="fa fa-sitemap"></span>browse around</h4>
        <div class="row">
  
          <div class="col-lg-9 col-md-9 col-sm-9">
            <ul class="sitemap">
              <li><a href="index.cfm">HOME</a></li>
              <li><a href="temasRV.cfm?startRow=1">TEMAS</a></li>
              <li><a href="lectura.cfm">LECTURA DE HOY</a></li>
              <li><a href="diccionario.cfm?startRow=1">DICCIONARIO</a></li>
              <li><a href="random_vers3.cfm?LibroU=0&merindoU=0" target="_blank">JUEGOS</a></li>
              
              <li><a href="#">PREGUNTAS Y PETICIONES</a></li>
            </ul>
          </div>
        </div>
      </div>
 
      
    </div>
    <!--\\row--> 
  </div>
  <!--\\container--> 
</footer>

<!--=================================
Script Source
================================--> 
  <script defer src="assets/js/bootstrap.min.js"></script>
  <script defer src="assets/js/jquery.easing-1.3.pack.js"></script>
  <script defer src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script defer src="assets/js/jquery.mousewheel.min.js"></script>
  <script defer src="assets/js/jflickrfeed.min.js"></script>
  <script defer src="assets/js/jquery.flexslider-min.js"></script>
  <script defer src="assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
  <script defer src="assets/js/tweetie.min.js"></script>
  <script defer src="assets/js/jquery.prettyPhoto.js"></script>
  <script defer src="assets/jPlayer/jquery.jplayer.min.js"></script>
  <script defer src="assets/jPlayer/add-on/jplayer.playlist.min.js"></script>
  <script defer src="assets/js/jquery.vegas.min.js"></script>
  <script defer src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
  <script defer src="assets/js/jquery.calendar-widget.js"></script>
  <script defer src="assets/js/isotope.js"></script>
  <script defer src="assets/js/main.js"></script>
  <script src="clocks.js"></script>
  
<script>
  fetch('./data.json')
  .then(res => res.json())
  .then(y => {console.log(y)})
</script>

  <script>
    // Set the date we're counting down to
    var countDownDate = new Date("Apr 22, 2023 00:00:00").getTime();

    // Update the count down every 1 second
    var x = setInterval(function () {

      // Get today's date and time
      var now = new Date().getTime();

      // Find the distance between now and the count down date
      var distance = countDownDate - now;

      // Time calculations for days, hours, minutes and seconds
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      // Output the result in an element with id="demo"
      document.getElementById("countdown").innerHTML = days + "d " + hours + "h "
        + minutes + "m " + seconds + "s ";

      // If the count down is over, write some text 
      if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "EXPIRED";
      }
    }, 1000);
  </script>
</body>

</html>