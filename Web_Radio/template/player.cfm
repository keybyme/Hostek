  <section id="audio-player">
    <div class="container">
    <div style="width:80%; margin:auto;">
      <sam-widget type="player" station-id="135944"
      token="5a2ccd710bc0a296b500394d98612a718adb5f41"
      anim-type='focus-in-expand' easing='ease-in-out-back' refresh-interval='30s'
      theme-border-radius='rounded' image-border-radius='rounded' theme='{"backgroundTop":"#474747","backgroundBottom":"#474747","widgetBorder":"#5f5f5f","dividers":"#5f5f5f","buttons":"#bebebe","text":"#bebebe"}'>
  </sam-widget>


    </div>
    </div>
  </section>

  <div class="hide-this">
    <section id="audio-player">
      <div class="container">
        <div class="rock-player">
          <div class="playListTrigger">
            <a href="#"><i class="fa fa-list"></i></a>
          </div><!--triggerPlayList in responsive-->
          <div class="row">
            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
              <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div id="player-instance" class="jp-jplayer"></div>
                  <div class="controls">
                    <div class="jp-prev"></div>
                    <div class="play-pause jp-play"></div>
                    <div class="play-pause jp-pause" style="display:none"></div>
                    <div class="jp-next"></div>
                  </div>
                  <!--controls-->
                </div>
                <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                  <div class="player-status">
                    <h5 class="audio-title">Currently Live</h5>
                    <div class="audio-timer">
                    <div class="audio-progress">
                      <div class="jp-seek-bar">
                        <div class="audio-play-bar jp-play-bar" style="width:20%;"></div>
                      </div>
                      <!--jp-seek-bar-->
                    </div>
                    <!--audio-progress-->
                  </div>
                  <!--player-status-->
                </div><!--column-->
              </div>
              <!--inner-row-->
            </div>
            <!--column-->

            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
              <div class="audio-list">
                <div class="audio-list-icon"></div>
                <div class="jp-playlist">
                  <!--Add Songs In mp3 formate here-->
                  <ul class="hidden playlist-files">
                    <li data-title="Escucha en Vivo" data-artist=""
                      data-mp3="https://19013.live.streamtheworld.com/SP_R4462671_SC"></li>
                   
                  </ul>
                  <!--Playlist ends-->
                  <h5>Audio Playlist</h5>
                  <div class="audio-track">
                    <ul>
                      <li></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--row-->
        </div>
      </div>
    </section>

  </div>
