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
    <title> Order Confirm</title>
    <link rel="stylesheet" href="css/orderconfirm.css">

</head>
<body>   
<%@include file="templates/header.jsp" %>
 <%  String cat=request.getParameter("category"); %>
<!--  bannnerimage-->
<div class="banner-image  " id="image">
  
  <div class="content text-center " style="padding-top:15% ;" >
      <h1 class=" banner-text text-white" id="image-text"> Your Order Is Confirmed</h1>
  </div>
  
 
  
</div>
<section class="order-section">
<div class="container">
  <div class="row">
 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<div class="confirm-title">
  <img src="images/orderconfirm.png" alt="error" width="100">
  <h1>Your Order is Confirmed</h1>
  <p>Thank you for choosing One Trust Services as your Laundry Partner.<br> Your order is placed with <span>OTS</span>
 <br><b>The Store Team Will Contact you Shortly!<br>Thank You</b>
 </p>
</div>
 <div class="tex-center" style="width: auto; margin: auto;">
  <a type="button" class="btn btn-success " href="Module-I/laundry.jsp?category=<%=cat %>" style="margin-right: 10%; margin-left: 25%;">Order Again</a>
  <a type="button"  class="btn btn-success " href="home_two.jsp" tabindex="0">Back to Home</a>
</div>



 </div>





  </div>
</div>



</section>
 





<%@include file="templates/footer.jsp" %>
<%@include file="templates/cdnlink.jsp" %>
</body>
</html>