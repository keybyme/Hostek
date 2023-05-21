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
      Slider
      =================================-->
          <cfinclude template="template/slider.cfm">

            <!--=================================
      Player Wraper
      =================================-->
            <div class="rockPlayerHolder"></div>


            <!--=================================
      Latest Albumbs
      =================================-->
            <cfinclude template="template/albums.cfm">


              <div class="clearfix"></div>
              <!--=================================
      Upcoming events
      =================================-->

              <section id="updates">
                <div class="container">
                  <div class="row">
                   
                  <!--latest events-->
                  <cfinclude  template="template/events.cfm">
                  <!--\\latest events-->


                  <!--- Announcements --->
                  <cfinclude  template="template/anuncios.cfm">
                  <!--\\Announcements-->



                  <!--- clock widget --->
                  <cfinclude  template="template/clock.cfm">
                  <!--- //clock widget --->

          
                  </div>
                </div>
              </section>
        </div><!--pageContent-->
      </div><!--ajaxwrap-->
      <!--=================================
	Latest blog
	=================================-->
      <section id="latest-blog">
        <div class="container">
          <div class="row">
            <h1>Rencently Played</h1>
            <sam-widget type="history" station-id="135875" token="26760dc28d56ff255458e0c7b4e1d8648e998a10"
              anim-type='focus-in-expand' easing='ease-in-out-back' refresh-interval='30s' theme-border-radius='square'
              image-border-radius='rounded'
              theme='{"backgroundTop":"#47474700","backgroundBottom":"#47474700","dividers":"#5f5f5f","text":"#bebebe","buttons":"#bebebe"}'
              show-buy-button='when populated' show-request-button='true' show-cover-art='true' history-limit='6'>
            </sam-widget>
          </div>
        </div>
      </section>

      <!--=================================
	Footer
	=================================-->

      <cfinclude template="template/footer.cfm">