<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>One Trust Services</title>
    <link rel="stylesheet" href="css/home.css">
   

</head>
<body>
 <%@include file="templates/alert.jsp" %>
<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center  header-transparent ">
  <div class="container d-flex align-items-center justify-content-between">

  
      <img class="logo"
          src="images/ots-m-unscreen.gif"
          height="90" style=" margin-top: 30px; margin-bottom: 5px;text-align: start;"
          alt="OTS.in"
          
        /><img src="images/ots-text-unscreen.gif" alt="" width="250" style=" margin-top: 30px; margin-left:-450px; margin-bottom: 5px;text-align: start;" >
   

    <nav id="navbar" class="navbar">
      <ul>
        <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="#services">Services</a></li>
        
        <li><a class="nav-link scrollto" href="#team">Team</a></li>
       
        <li><a class="nav-link scrollto" href="#contact"  >Contact us</a></li>
        <li>
        <a type="button" class="nav-link scrollto" data-bs-toggle="modal" data-bs-target="#modal-login" >
          Sign in
        </a></li>
      </ul>
     
    </nav><!-- .navbar -->

  </div>
</header><!-- End Header -->

<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex flex-column justify-content-end align-items-center">
  <div id="heroCarousel" data-bs-interval="5000" class="container carousel carousel-fade" data-bs-ride="carousel">

    <!-- Slide 1 -->
    <div class="carousel-item active">
      <div class="carousel-container">
        <h2 class="animate_animated animate_fadeInDown">Welcome to <span>One Trust Services</span></h2>
        <p class="animate_animated fanimate_adeInUp">A customer is the most important visitor on our premises, he is not dependent on us. We are dependent on him. He is not an interruption in our work. He is the purpose of it. He is not an outsider in our business. He is part of it. We are not doing him a favor by serving him. He is doing us a favor by giving us an opportunity to do so.</p>
        <a type="button" data-bs-target="#modalsignup"  data-bs-toggle="modal" class="btn-signup ">Sign Up</a>
      </div>
    </div>


    

  </div>

  <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
    <defs>
      <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z">
    </defs>
    <g class="wave1">
      <use xlink:href="#wave-path" x="50" y="3" fill="rgba(255,255,255, .1)">
    </g>
    <g class="wave2">
      <use xlink:href="#wave-path" x="50" y="0" fill="rgba(255,255,255, .2)">
    </g>
    <g class="wave3">
      <use xlink:href="#wave-path" x="50" y="9" fill="#fff">
    </g>
  </svg>

</section><!-- End Hero -->
<!-- ======= About Section ======= -->
<section id="about" class="about">
  <div class="container">

    <div class="section-title" data-aos="zoom-out">
      <h2>About</h2>
      <p>Who we are</p>
    </div>

    <div class="row content" data-aos="fade-up">
      <div class="col-lg-6">
        <p>
          One Trust Services offers you the best services in your City. We offer you online many types of services like Laundry, Home Care, Decoration, E &E Services, Auto services, Auto Wash etc. OTS is  your neighbour and ready to serve you.
        </p>
        <ul>
          <li><i class="fa-sharp fa-solid fa-star"></i>OTS is a team of passionate Professionals & Experts.</li>
          <li><i class="fa-sharp fa-solid fa-star"></i>One Trust Services is your all-in-one solution for all your cleaning needs. </li>
          <li><i class="fa-sharp fa-solid fa-star"></i> We aim at adding value to your life. Just give us a call or message us, and we will be there for you.</li>
        </ul>
      </div>
      <div class="col-lg-6 pt-4 pt-lg-0">
        <p>
          These services aim at making several day-to-day tasks conveniently actionable and accessible to users through one App.<br>
          We hope our efforts make a considerable difference in the society and that the evolution of one's self will see a new light.
        </p>
        <a data-bs-target="#modalsignup"  data-bs-toggle="modal" class="btn-learn-more">Learn More</a>
      </div>
    </div>

  </div>
</section><!-- End About Section -->
<!-- ======= Services Section ======= -->
<section id="services" class="services">
  <div class="container">

    <div class="section-title" data-aos="zoom-out">
      <h2>Services</h2>
      <p>What we do offer</p>
    </div>

    <div class="row">
      <div class="col-lg-4 col-md-6">
        <div class="icon-box" data-aos="zoom-in-left">
          <div class="icon"><i class="fa-brands fa-studiovinari" style="color: #ef6603 ;"></i></div>
          <h4 class="title">Laundry</h4>
          <p class="description">We are here to lift the burden of laundry from your shoulders so that you can focus on your personal and professional life without worrying about a pile of dirty clothes.</p>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mt-5 mt-md-0">
        <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="100">
          <div class="icon"><i class="fa-brands fa-studiovinari" style="color:  #7bbb43 ;"></i></div>
          <h4 class="title">Home Care</h4>
          <p class="description">OTS will provide an overview of the different types of home care. Care is customized to your individual needs and may include services from one or more of the types described.</p>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 mt-5 mt-lg-0 ">
        <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="200">
          <div class="icon"><i class="fa-brands fa-studiovinari" style="color:  #315c45 ;"></i></div>
          <h4 class="title">Decoration</h4>
          <p class="description">Searching for a good decorator for your special events? Then, ots is right here to offer you high-quality service that reflects our competence as an efficient  party organizer.</p>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mt-5">
        <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="300">
          <div class="icon"><i class="fa-brands fa-studiovinari" style="color: #04807d ;"></i></div>
          <h4 class="title">E & E Services</h4>
          <p class="description">Keeping electrical systems and electronic products always up to date can be a challenge. We offer state-of-the-art services that fully integrate electrical and electronic design through manufacturing.</p>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 mt-5">
        <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="400">
         <div class="icon"><i class="fa-brands fa-studiovinari" style="color: blueviolet ;"></i></div>
          <h4 class="title">Auto Services</h4>
          <p class="description">OTS offers complete auto care for your vehicle. Whether it’s time for your next factory recommended maintenance visit, a routine oil change, new tires, or repair services on your brakes,  air conditioner,etc.</p>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mt-5">
        <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="500">
          <div class="icon"><i class="fa-brands fa-studiovinari" style="color:  darkred ;"></i></div>
          <h4 class="title">Auto Wash</h4>
          <p class="description">We strive to provide customers with an excellent car wash using state of the art auto washing technology and professional customer care.</p>
        </div>
      </div>
    </div>

  </div>
</section><!-- End Services Section -->
<!-- ======= Team Section ======= -->
<section id="team" class="team">
  <div class="container">

    <div class="section-title" data-aos="zoom-out">
      <h2>Team</h2>
      <p>Our LeaderShip Team</p>
    </div>

    <div class="row">

      <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
        <div class="member" data-aos="fade-up">
          <div class="member-img">
            <img src="images/yasar.jpg" class="img-fluid" alt="">
            <div class="social">
              <a href=""><i class="fa-brands fa-twitter"></i></a>
              <a href=""><i class="fa-brands fa-facebook"></i></a>
              <a href=""><i class="fa-brands fa-instagram"></i></a>
              <a href=""><i class="fa-brands fa-linkedin"></i></a>
            </div>
          </div>
          <div class="member-info">
            <h4>Yasar Moin</h4>
            <span>CTO</span>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
        <div class="member" data-aos="fade-up" data-aos-delay="100">
          <div class="member-img">
            <img src="images/sachin.jpg" class="img-fluid" alt="">
            <div class="social">
              <a href=""><i class="fa-brands fa-twitter"></i></a>
              <a href=""><i class="fa-brands fa-facebook"></i></a>
              <a href=""><i class="fa-brands fa-instagram"></i></a>
              <a href=""><i class="fa-brands fa-linkedin"></i></a>
            </div>
          </div>
          <div class="member-info">
            <h4>Sachin Thakur</h4>
            <span>CEO</span>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
        <div class="member" data-aos="fade-up" data-aos-delay="200">
          <div class="member-img">
            <img src="images/aditya.jpg" class="img-fluid" alt="">
            <div class="social">
              <a href=""><i class="fa-brands fa-twitter"></i></a>
              <a href=""><i class="fa-brands fa-facebook"></i></a>
              <a href=""><i class="fa-brands fa-instagram"></i></a>
              <a href=""><i class="fa-brands fa-linkedin"></i></a>
            </div>
          </div>
          <div class="member-info">
            <h4>Aditya Thakur</h4>
            <span>Cheif Entrepreneur</span>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
        <div class="member" data-aos="fade-up" data-aos-delay="300">
          <div class="member-img">
            <img src="images/ayush.png" class="img-fluid" alt="">
            <div class="social">
              <a href=""><i class="fa-brands fa-twitter"></i></a>
              <a href=""><i class="fa-brands fa-facebook"></i></a>
              <a href=""><i class="fa-brands fa-instagram"></i></a>
              <a href=""><i class="fa-brands fa-linkedin"></i></a>
            </div>
          </div>
          <div class="member-info">
            <h4>Ayush Kumar</h4>
            <span>CMO</span>
          </div>
        </div>
      </div>

    </div>

  </div>
</section><!-- End Team Section -->
<!-- ======= Contact Section ======= -->
<section id="contact" class="contact">
  <div class="container">

    <div class="section-title" data-aos="zoom-out">
      <h2>Contact</h2>
      <p>Contact Us</p>
    </div>

    <div class="row mt-5">

      <div class="col-lg-4" data-aos="fade-right">
        <div class="info">
          <div class="address">
            <i class="fa-sharp fa-solid fa-location-dot"></i>
            <h4>Location:</h4>
            <p>Awas Vikas , Bijnor-246701</p>
          </div>

          <div class="email">
            <i class="fa-sharp fa-solid fa-envelope"></i>
            <h4>Email:</h4>
            <p>OTS.help@Gmail.com</p>
          </div>

          <div class="phone">
            <i class="fa-sharp fa-solid fa-phone"></i>
            <h4>Call:</h4>
            <p>+91 9557587998</p>
          </div>

        </div>

      </div>

      <div class="col-lg-8 mt-5 mt-lg-0" data-aos="fade-left">

        <form action="forms/contact.php" method="post" role="form" class="php-email-form">
          <div class="row">
            <div class="col-md-6 form-group">
              <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
            </div>
            <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
            </div>
          </div>
          <div class="form-group mt-3">
            <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
          </div>
          <div class="form-group mt-3">
            <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
          </div>
          <div class="my-3">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your message has been sent. Thank you!</div>
          </div>
          <div class="text-center"><button type="submit">Send Message</button></div>
        </form>

      </div>

    </div>

  </div>
</section><!-- End Contact Section -->

<!-- -----------------------------popup login in------------ -->


  <!-- Modal -->
  <div class="modal fade" id="modal-login" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content ">
        <div class="modal-header">
          <img class="logo"
          src="images/ots-m-unscreen.gif"
          height="90" style=" margin-bottom: 5px;"
          alt="OTS.in"
          
        />
         
          <button type="button" class="btn" data-bs-dismiss="modal" style="margin-top:-50px;"><i class="fa-sharp fa-solid fa-scissors" style="color: white;"></i></button>
        </div>
        <form  action="LoginServlet" method="post">
        <div class="modal-body">
         
          <div class="myform text-center form-horizontal " >
            <h1 class="title" style="margin-top:-40px;margin-bottom: 40px ;color: white;">Login</h1>
            
            
                <div class="mb-3 form-group">
                <input type="email" class="form-control" id="inputEmail3" name="email" placeholder="Email or Username" required="required">
                <i class="fa fa-user"></i>
                </div>
                <div class="mb-3 form-group">
                  <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="Password" required="required">
                  <i class="fa fa-lock"></i>
                  </div>
       


          
            
        </div>
       
        </div>
        <div class="modal-footer justify-content-center  ">
          <div class="position-absolute top-0 start-50 translate-middle" style="padding-top: 40px;">
          <button type="submit" class="login-btn ">
            Login
          </button>
        </div>
         
          <!-- Register buttons -->
          <div class="text-center " style="color: white;padding-top: 40px;">
            <p>or sign in with:</p>
            <button type="button" class="btn btn-link btn-floating mx-1">
              <i class="fab fa-facebook-f" style="color: white;"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating mx-1">
              <i class="fab fa-google" style="color: white;"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating mx-1">
              <i class="fab fa-twitter" style="color: white;"></i>
            </button>

            <button type="button" class="btn btn-link btn-floating mx-1">
              <i class="fab fa-github" style="color: white;"></i>
            </button>
        </div>
     

      </div>
       </form>
    </div>
  </div>
  </div>

<!-- ==================signup============== -->
<div class="modal fade" id="modalsignup" tabindex="-1" aria-labelledby="modalsignuplabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content ">
      <div class="modal-header">
        <img class="logo"
        src="images/ots-m-unscreen.gif"
        height="90" style=" margin-bottom: 5px;"
        alt="OTS.in"
        
      />
       
        <button type="button" class="btn" data-bs-dismiss="modal" style="margin-top:-50px;"><i class="fa-sharp fa-solid fa-scissors" style="color: white;"></i></i></button>
      </div>
      <form class="form-horizontal"  action="UserServlet" method="post">
      <div class="modal-body">
       
        <div class="myform text-center" >
          <h1 class="title" style="margin-top:-70px;margin-bottom: 40px ;color: white;">Sign Up</h1>
          
            <div class="mb-3 form-group">
              <input type="text" class="form-control" placeholder="Name" name="name" required="required">
              <i class="fa fa-user"></i>
              </div>
              <div class="mb-3 form-group">
                <input type="text" class="form-control"  placeholder="Phone" name="phone"  required="required">
                <i class="fa fa-phone"></i>
                </div>
          
              <div class="mb-3 form-group">
              <input type="email" class="form-control"  placeholder="Email" name="email"  required="required">
              <i class="fa-sharp fa-solid fa-envelope"></i>
              </div>
              <div class="mb-3 form-group">
                <input type="password" class="form-control"  placeholder="Password" name="password"  required="required">
                <i class="fa fa-lock"></i>
                </div>
     


        
          
      </div>
     
      </div>
      <div class="modal-footer justify-content-center  ">
        <div class="position-absolute top-0 start-50 translate-middle" style="padding-top: 40px;">
        <button type="submit" class="login-btn ">
          Sign Up
        </button>
      </div>

    </div>
      </form>
  </div>
</div>
</div>
<%@include file="templates/footer.jsp" %>
<script src="javascript/home.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
    $('.toast').toast('show');
	});
</script>

</body>
</html>