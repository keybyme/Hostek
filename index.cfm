<!DOCTYPE html>
<html lang="en">
    <head>
      
        <title>KeyByMe</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/key.png">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css" >
        <link rel="stylesheet" type="text/css" href="assets/css/globe.css" >
        <!--Material Icon -->
        <link rel="stylesheet" type="text/css" href="assets/css/materialdesignicons.min.css" >
    
        <!--pe-7 Icon -->
        <link rel="stylesheet" type="text/css" href="assets/css/pe-icon-7-stroke.css" >

        <!-- Magnific-popup -->
        <link rel="stylesheet" type="text/css" href="assets/css/magnific-popup.css">

        <!-- Custom  sCss -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" >

        

    </head>
<style>
html{
  scroll-behavior: smooth;
}

#earth {      
        width: 400px;
        height: 400px;
    
    }

    #center{
        position:absolute;
        top:15%;
        left:55%;

    }


@media only screen 
  and (min-device-width: 320px) 
  and (max-device-width: 480px)
  and (-webkit-min-device-pixel-ratio: 2) {
    #earth {      
        width: 220px;
        height: 220px;
        
    }

    #center{
        position:relative;
        padding-top:140px;
        left:40px;

    }
  }

  @media only screen 
  and (min-device-width: 375px) 
  and (max-device-width: 667px)
  and (-webkit-min-device-pixel-ratio: 2) {
    #earth {      
        width: 280px;
        height: 280px;
        
    }

    #center{
        position:relative;
        padding-top:140px;
        left:50px;

    }
  }


</style>
    <body>

        <!--Navbar Start-->
        <nav class="navbar navbar-expand-lg fixed-top navbar-custom sticky sticky-dark">
            <div class="container-fluid">
                <!-- LOGO -->
                <a class="logo text-uppercase" href="index.cfm">
                    <img src="assets/images/key_logo.png" alt="" class="logo-light" height="18" />
                    <img src="assets/images/key_logo_dark.png" alt="" class="logo-dark" height="18" />
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="mdi mdi-menu"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ml-auto navbar-center">
                        <li class="nav-item active" id="slow">
                            <a href="Paginas/Login.cfm" class="nav-link">Sign In</a>
                        </li>
                       
                     
                    </ul>
                </div>
            </div>



            
        </nav>
        <!-- Navbar End -->

        <!-- home start -->
        <section class="bg-home bg-gradient" id="home">
            <div class="home-center">
                <div class="home-desc-center">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div id="center">
                                        <div id="earth"> </div>
                                    </div>
                                    
                            <div class="col-lg-6 col-sm-6">
                                <div class="home-title text-white">
                                    <h5 class="mb-3 text-white-50"><img src="assets/images/key.png" alt="" class="logo-light" height="38" /></h5>
                                    <h2 class="mb-4">Welcome to KeyByMe </h2>
                                    <p class="text-white-50 home-desc font-16 mb-5">Hardware, Software & Network Solutions </p>
                                    <div class="mt-5">
                                      <a href="Paginas/Login.cfm" class="btn btn-info mr-4">Sign In <i class="mdi mdi-chevron-right ml-1"></i></a>   
                                    </div>
                                   
                                </div>
                            </div>
                            <div class="col-lg-5 offset-lg-1 col-sm-6">
                                <div class="home-img mo-mt-20">
                                    
                                </div>
                            </div>
                        </div> 
                        <!-- end row -->
                       
                    </div>
                    <!-- end container-fluid -->
                </div>
            </div>

            
        </section>
        <!-- home end -->

        <!-- features start -->
        <section class="features" id="features">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                         
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade" id="pills-code" role="tabpanel" aria-labelledby="pills-code-tab">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-lg-4 col-sm-6">
                                        <div>
                                            <img src="assets/images/contact.png" alt="" class="img-fluid mx-auto d-block">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 offset-lg-1">
                                        <div>
                                            <div class="feature-icon mb-4">
               
                                            </div>
                                            <h5 class="mb-3">Get in Touch</h5>
                                            <p class="text-muted">Contact us by email here and we'll get back to you.</p>
                                            <p class="text-muted"></p>
                                            
                                            <div class="mt-4">
                                                <a href="#sign" class="btn btn-custom">Learn More <i class="mdi mdi-arrow-right ml-1"></i></a>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                                <!-- end row -->
                            </div>
                            <div class="tab-pane fades how active" id="pills-customize" role="tabpanel" aria-labelledby="pills-customize-tab">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-lg-4 col-sm-6">
                                        <div>
                                            <img src="assets/images/signin.png" alt="" class="img-fluid mx-auto d-block">
                                        </div>
                                    </div>
                                    
                                </div>
                                <!-- end row -->
                            </div>
                            <div class="tab-pane fade" id="pills-support" role="tabpanel" aria-labelledby="pills-support-tab">
                                
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-lg-4 col-sm-6">
                                        <div>
                                            <img src="assets/images/qr.png" style="width: 45%;" alt="" class="img-fluid mx-auto d-block">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 offset-lg-1">
                                        <div>
                                            <div class="feature-icon mb-4">
                                            </div>
                                            <h5 class="mb-3">Have a Question?</h5>
                                            <p class="text-muted">Fill out a short form and we'll get back to you.</p>
                                            <p class="text-muted">Try our QR code scan to send us a message.</p>
                                           
                                            <div class="mt-4">
                                                <a href="#contact" class="btn btn-custom">Learn More <i class="mdi mdi-arrow-right ml-1"></i></a>
                                            </div>
                                            <div class="mt-4">
                                                <div class="col-md-6 col-xl-3 col-lg-4 natural personal">
                                                    <div class="gal-detail thumb">
                                                        <a href="../Vertical/dist/assets/images/QR2.png" class="image-popup" title="Screenshot-1">
                                                            <img src="../Vertical/dist/assets/images/QR2.png" class="thumb-img img-fluid" alt="">
                                                        </a>
                                                    
                                                        <div class="text-center">
                                                            <h4>Click Me</h4>
                                                          
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                                <!-- end row -->
                            </div>
                        </div>
                        <!-- end tab-content -->
                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container-fluid -->
        </section>
        <!-- features end -->

      
        <!-- counter start -->
      
        <!-- counter end -->

        <!-- contact start -->
        
        <section class="section" id="contact">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="title text-center mb-5">
                            <h6 class="text-primary small-title">Contact</h6>
                            <h4>Have any Questions ?</h4>
                            <p class="text-muted">Don't hesitate to contact us.</p>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-lg-4">
                        <div class="get-in-touch">
                            <h5>Get in touch</h5>
                            <div class="mb-3">
                                <div class="get-touch-icon float-left mr-3">
                                    <i class="pe-7s-mail h2 text-primary"></i>
                                </div>
                                <div class="overflow-hidden">
                                    <h5 class="font-16 mb-0">E-mail</h5>
                                    <p class="text-muted"><a href="mailto:wesnetwork@keybyme.com">wesnetwork@keybyme.com</a></p>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="get-touch-icon float-left mr-3">
                                    <i class="pe-7s-phone h2 text-primary"></i>
                                </div>
                                <div class="overflow-hidden">
                                    <h5 class="font-16 mb-0">Phone</h5>
                                    <p class="text-muted">240-793-9353</p>
                                </div>
                            </div>
                            <div class="mb-2">
                                <div class="get-touch-icon float-left mr-3">
                                    <i class="pe-7s-map-marker h2 text-primary"></i>
                                </div>
                                <div class="overflow-hidden">
                                    <h5 class="font-16 mb-0">Address</h5>
                                    <p class="text-muted">10413 Ridge Landing Pl, Damascus MD 20872</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- end row -->
            </div>
            <!-- end container-fluid -->
        </section>
        <!-- contact end -->

        <!-- footer start -->
        <footer class="footer bg-dark">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="text-center">
                            <div class="footer-logo mb-3">
                                <img src="assets/images/key_logo.png" alt="" height="20">
                            </div>
                          
                            <p class="text-white-50 mb-4">2003 - 2022  ©  Keybyme.com <a href="#" target="_blank" class="text-white-50"></a> </p>

                        </div>
                    </div>
                
                </div>

            </div>
        </footer>





                                    <!-- modal content -->

        <div id="myModal" class="modal fade" tabindex="-1" role="dialog" data-animation="fadein" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel"></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                      
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary waves-effect waves-light">Save changes</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->



        <!-- footer end -->

        <!-- Back to top -->    
        <a href="#" class="back-to-top" id="back-to-top"> <i class="mdi mdi-chevron-up"> </i> </a>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/vendor.js"></script>
        <!-- javascript -->
       
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.easing.min.js"></script>
        <script src="assets/js/scrollspy.min.js" integrity="sha512-UyX8JsMsNRW1cYl8BoxpcamonpwU2y7mSTsN0Z52plp7oKo1u92Xqfpv6lOlTyH3yiMXK+gU1jw0DVCsPTfKew==" crossorigin="anonymous"></script>
        
        <!-- Magnific Popup -->
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/dashboard.init.js"></script>

        <script src="assets/js/custombox.min.js"></script>

        <script src="assets/js/gallery.init.js"></script>

        <script src="assets/js/app.js"></script>
    </body>

</html>