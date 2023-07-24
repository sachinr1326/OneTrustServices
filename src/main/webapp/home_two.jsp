
<%@page import="jakarta.servlet.http.Cookie"%>
<%@page import="com.entities.User"%>
<%@page import="com.model.UserModel"%>
<%@page import="java.util.ArrayList"%>

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
    
    <link rel="stylesheet" href="css/home_two.css" >
  
</head>
<body>
<%@include file="templates/header.jsp" %>
  
<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex flex-column justify-content-end align-items-center"style="height: 70vh;">
    <div id="heroCarousel" data-bs-interval="5000" class="container carousel carousel-fade" data-bs-ride="carousel" >
  
      <!-- Slide 1 -->
      <div class="carousel-item active">
        <div class="carousel-container">
        <div class="carousel-title">Laundry</div> 
       <div class="carousel-text"><i class="fa-sharp fa-solid fa-quote-left" style="color: #ef6603; font-size: 30px;"></i> We are here to lift the burden of laundry from your shoulders so that you can focus on your personal and professional life without worrying about a pile of dirty clothes.<i class="fa-sharp fa-solid fa-quote-right" style="color: #ef6603;font-size: 30px;"></i></div>
       </div>
      </div>

      <div class="carousel-item">
        <div class="carousel-container">
        <div class="carousel-title">Home Care</div> 
       <div class="carousel-text"> <i class="fa-sharp fa-solid fa-quote-left" style="color: #ef6603; font-size: 30px;"></i>OTS will provide an overview of the different types of home care. Care is customized to your individual needs and may include services from one or more of the types described.<i class="fa-sharp fa-solid fa-quote-right" style="color: #ef6603;font-size: 30px;"></i></div>
       </div>
      </div>
      

      <div class="carousel-item ">
        <div class="carousel-container">
        <div class="carousel-title">Decoration</div> 
       <div class="carousel-text"><i class="fa-sharp fa-solid fa-quote-left" style="color: #ef6603; font-size: 30px;"></i>Searching for a good decorator for your special events? Then, ots is right here to offer you high-quality service that reflects our competence as an efficient  party organizer.<i class="fa-sharp fa-solid fa-quote-right" style="color: #ef6603;font-size: 30px;"></i></div>
       </div>
      </div>

      <div class="carousel-item ">
        <div class="carousel-container">
        <div class="carousel-title">Auto Services</div> 
       <div class="carousel-text"> <i class="fa-sharp fa-solid fa-quote-left" style="color: #ef6603; font-size: 30px;"></i>OTS offers complete auto care for your vehicle. Whether its time for your next factory recommended maintenance visit, a routine oil change, new tires, or repair services on your brakes,  air conditioner,etc.<i class="fa-sharp fa-solid fa-quote-right" style="color: #ef6603;font-size: 30px;"></i></div>
       </div>
      </div>

      <div class="carousel-item ">
        <div class="carousel-container">
        <div class="carousel-title">Auto Wash</div> 
       <div class="carousel-text"><i class="fa-sharp fa-solid fa-quote-left" style="color: #ef6603; font-size: 30px;"></i>We strive to provide customers with an excellent car wash using state of the art auto washing technology and professional customer care.<i class="fa-sharp fa-solid fa-quote-right" style="color: #ef6603;font-size: 30px;"></i></div>
       </div>
      </div>

      <div class="carousel-item ">
        <div class="carousel-container">
        <div class="carousel-title">E & E Services</div> 
       <div class="carousel-text"><i class="fa-sharp fa-solid fa-quote-left" style="color: #ef6603; font-size: 30px;"></i> Keeping electrical systems and electronic products always up to date can be a challenge. We offer state-of-the-art services that fully integrate electrical and electronic design through manufacturing.<i class="fa-sharp fa-solid fa-quote-right" style="color: #ef6603;font-size: 30px;"></i></div>
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
  <!-- ======= Services Section ======= -->
  <section id="services" class="services">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>Services</h2>
        <p>Check our Services</p>
      </div>

      <div class="row">
        <div class="col-lg-4 col-md-6 d-flex align-items-stretch  " data-aos="zoom-in" data-aos-delay="100">
          <div class="icon-box ">
            <div class="icon"><img src="images/module-I/laundry-m-2.gif" width="170" alt=""></div>
            <h4><a href="Module-I/laundry.jsp?category=Laundry">Laundry</a></h4>
            <p>We are here to lift the burden of laundry from your shoulders so that you can focus on your personal and professional life without worrying about a pile of dirty clothes.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
          <div class="icon-box">
            <div class="icon"><img src="images/module-I/home-care.gif" width="190" alt=""></div>
            <h4><a href="Module-I/laundry.jsp?category=Home Care">Home Care</a></h4>
            <p>OTS will provide an overview of the different types of home care. Care is customized to your individual needs and may include services from one or more of the types described.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
          <div class="icon-box">
            <div class="icon"><img src="images/module-I/decoration-m.gif" width="220" alt=""></div>
            <h4><a href="Module-I/laundry.jsp?category=Decoration">Decoration</a></h4>
            <p>Searching for a good decorator for your special events? Then, ots is right here to offer you high-quality service that reflects our competence as an efficient  party organizer.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
          <div class="icon-box">
            <div class="icon" ><img src="images/module-I/auto-services.gif" width="150" alt=""></div>
            <h4><a href="Module-I/laundry.jsp?category=Auto Services">Auto Services</a></h4>
            <p>OTS offers complete auto care for your vehicle. Whether its time for your next factory recommended maintenance visit, a routine oil change, new tires, or repair services on your brakes,  air conditioner,etc.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
          <div class="icon-box">
            <div class="icon"><img src="images/module-I/Auto-wash.gif" width="220" alt=""></div>
            <h4><a href="Module-I/laundry.jsp?category=Auto Wash">Auto Wash</a></h4>
            <p>We strive to provide customers with an excellent car wash using state of the art auto washing technology and professional customer care.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
          <div class="icon-box">
            <div class="icon">
              
              <img src="images/module-I/E&E-service.gif" width="140" alt=""></div>
            <h4><a href="Module-I/laundry.jsp?category=E and E Services">E & E Services</a></h4>
            <p>Keeping electrical systems and electronic products always up to date can be a challenge. We offer state-of-the-art services that fully integrate electrical and electronic design through manufacturing.</p>
          </div>
        </div>

      
      </div>

    </div>
  </section><!-- End Services Section -->
   <!-- ======= testimonal ======= -->
  <section id="testimonials" class="testimonials">
<div class="container text-center">

  <div class="testi-text">One Trust Services offers you the best services in your City. We offer you online many types of services like Laundry, Home Care, Decoration, E &E Services, Auto services, Auto Wash etc.</div>
  <div class="testi-title">One Trust Services</div>
  <div class="testi-title-text">OTS is  your neighbor and ready to serve you.</div>

</div>
   
</section>
<!-- ======= end testimonal ======= -->
     
<!-- ======= Our Portfolio Section ======= -->

<section id="portfolio" class="portfolio" style=" background-color: #f2f2f6; height: 760px;">
  <div class="container " style="padding-left: 80px;">
    <img src="images/home_two/screnshoot.png" alt="" style="margin-top: -100px;">
  </div>
</section><!-- End Our Portfolio Section -->
   <section id="faq" class="faq">
    <div class="container" data-aos="fade-up">
    <div class="section-title" data-aos="zoom-out" style="text-align: center;">

      <p style="color: #315c45;">OUR PROMISE</p>
    </div>

   <div class="col-lg-12 d-flex" style="margin-top: 25px; padding: 0px;">
    <div class="col-lg-4" style="position: relative; min-height: 1px;padding-right: 15px;padding-left: 15px;">
      <div class="promise_block">
        <div class="promise_icon" style=" width: 90px; height: 90px; background-color: #7bbb43;  text-align: center; border-radius: 8px;border: 8px solid #d1e6be; margin: 0 auto;"><img src="images/home_two/award.png" alt="" width="100%" height="auto" style="padding: 10px;"></div>
        <div class="promise_text text-center" style="padding: 25px 0;"><h4 style="font-weight: 500;color: #053e2b;font-size: 20px;">QUALITY</h4><p>Expert professional handling <br> your clothes with utmost care </p></div>
      </div>
    </div>
    <div class="col-lg-4">
      <div class="promise_block">
        <div class="promise_icon"style=" width: 90px; height: 90px; background-color: #9dc844;  text-align: center; border-radius: 8px;border: 8px solid #d1e6be; margin: 0 auto;"><img src="images/home_two/transparency.png" alt=""  width="100%" height="auto" style="padding: 10px;"></div>
        <div class="promise_text text-center" style="padding: 25px 0;"><h4 style="font-weight: 500;color: #053e2b; font-size: 20px;">TRANSPARENCY</h4><p>Neighbourhood live laundry stores <br>offering service as you please </p></div>
      </div>
    </div>
    <div class="col-lg-4">
      <div class="promise_block">
        <div class="promise_icon" style=" width: 90px; height: 90px; background-color: #b0c823;  text-align: center; border-radius: 8px;border: 8px solid #d1e6be; margin: 0 auto;"><img src="images/home_two/speedometer.png" alt=""  width="100%" height="auto" style="padding: 10px;"></div>
        <div class="promise_text text-center" style="padding: 25px 0;"><h4 style="font-weight: 500;color: #053e2b;font-size: 20px;">SPEED</h4><p>Shorter turnaround times, delivery <br> within 24 Hours of pick up </p></div>
      </div>
    </div>
   </div>



  </div>
   </section>



<%@include file="templates/footer.jsp" %>
<%@include file="templates/cdnlink.jsp" %>
<script src="javascript/home_two.js"></script>
</body>
</html>