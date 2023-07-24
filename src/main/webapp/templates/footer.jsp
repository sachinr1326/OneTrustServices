<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Satisfy&display=swap');
     
     
      a {
    color: #ef6603;
    text-decoration: none;
  }
  
  a:hover {
    color: #fc8129;
    text-decoration: none;
  } 
   .footer-title{
    font-family: 'Satisfy', cursive;
        font-size: 40px;
        font-weight: 700;
float: left;
   
  }

  
    .footer {
  color: #fff;
 /*  background: url("../images/home_two/car-wash.png") top center no-repeat;
  background-size: cover; */
  background-color:#033d29;
  font-size: 14px;
  padding: 50px 0 60px 0;
  position: relative;
    box-sizing: border-box;
}

/* .footer:before {
  content: "";
  background: rgba(0, 0, 0, 0.8);
  position: absolute;
  inset: 0;

}
 */
.footer .footer-content .footer-info {
  margin-bottom: 30px;
}

.footer .footer-content .footer-info h3 {
  font-size: 28px;
  margin: 0 0 20px 0;
  padding: 2px 0 2px 0;
  line-height: 1;
  font-weight: 700;
  text-transform: uppercase;
}

.footer .footer-content .footer-info h3 span {
  color: var(--color-primary);
}

.footer .footer-content .footer-info p {
  font-size: 14px;
  line-height: 24px;
  margin-bottom: 0;
font-family: 'Poppins', sans-serif;
  color: #fff;
  float: left;
}

.footer .footer-content .social-links a {
  font-size: 18px;
  display: inline-block;
  background: rgba(255, 255, 255, 0.1);
  color: #fff;
  line-height: 1;
  margin-right: 8px;
  border-radius: 4px;
  width: 36px;
  height: 36px;
  transition: 0.3s;
}

.footer .footer-content .social-links a:hover {
  background: var(--color-primary);
  text-decoration: none;
}

.footer .footer-content h4 {
  font-size: 16px;
  font-weight: 600;
  color: #fff;
  position: relative;
  padding-bottom: 12px;
  font-family: 'Poppins', sans-serif;
}

.footer .footer-content .footer-links {
  margin-bottom: 20px;
  font-family: 'Poppins', sans-serif;
  
}

.footer .footer-content .footer-links ul {
  list-style: none;
  padding: 0;
  margin: 0;
  float: left;
  
}

.footer .footer-content .footer-links ul li {
  padding: 8px 0;
  
}

.footer .footer-content .footer-links ul li:first-child {
  padding-top: 0;
   min-width: 200px;
}

.footer .footer-content .footer-links ul a {
  color: rgba(255, 255, 255, 0.6);
  transition: 0.3s;
  display: inline-block;
  line-height: 1;
}

.footer .footer-content .footer-links ul a:hover {
  color: #fff;
}

.footer .footer-legal .copyright {
  padding-top: 30px;
  border-top: 1px solid rgba(255, 255, 255, 0.15);
  font-family: 'Poppins', sans-serif;
}
   
    
    </style>
</head>
<body>
<footer id="footer" class="footer">

  <div class="footer-content position-relative">
    <div class="container" style="text-align:left; ">
      <div class="row">

        <div class="col-lg-4 col-md-6">
          <div class="footer-info">
            <h2 class="footer-title">One Trust Service</h2>
            <p>
              One Trust Services offers you the best services in your City.  <br>One Trust Services is your all-in-one solution for all  your cleaning needs.
            </p>
           
          </div>
        </div><!-- End footer info column-->

        
        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Laundry</a></li>
            <li><a href="#">Home Care</a></li>
            <li><a href="#">Decoration</a></li>
            
          </ul>
        </div><!-- End footer links column-->

        <div class="col-lg-2 col-md-3 footer-links">
         
          <ul style="margin-top :40px; ;">
           
           
            <li><a href="#">Auto Services</a></li>
            <li><a href="#">Auto Wash</a></li>
            <li><a href="#">E & E Services</a></li>
          </ul>
         
        </div><!-- End footer links column-->
       
        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Contact Us</h4>
          
           
            <p>
              <strong><i class="fa-sharp fa-solid fa-location-dot" style=" font-size:15px; color:#7bbb43;"></i></strong>&nbsp; Village and Post Siau <br>
              Tehsil Chandpur Dist-Bijnor<br>
              Uttar Pradesh-246725<br>
              <strong><i class="fa-sharp fa-solid fa-phone"style="color:#7bbb43;"> </i></strong>&nbsp;&nbsp;+91 9557587998<br>
              <strong><i class="fa-sharp fa-solid fa-envelope"style="color:#7bbb43;"></i></strong>&nbsp;&nbsp; OTS.help@Gmail.com<br>
            </p>
           
          
        </div><!-- End footer links column-->

   
        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Follow Us</h4>
          <div class="social-links d-flex mt-3">
            <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa-brands fa-twitter"></i></a>
            <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa-brands fa-facebook"></i></a>
            <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa-brands fa-instagram"></i></a>
            <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa-brands fa-linkedin"></i></a>
          </div>
         
        </div><!-- End footer links column-->

      </div>
    </div>
  </div>

  <div class="footer-legal text-center position-relative">
   
      <div class="copyright">
        &copy; 2022,<strong><span>OTS.com</span></strong>
      </div>
      
    
  </div>

</footer>

    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timeago/1.6.7/jquery.timeago.min.js" integrity="sha512-RlGrSmkje9EE/FXpJKWf0fvOlg4UULy/blvNsviBX9LFwMj/uewXVoanRbxTIRDXy/0A3fBQppTmJ/qOboJzmA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   
                  
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script >
jQuery(document).ready(function(){
	jQuery("time.timeago").timeago();
});
</script>

</body>
</html>
