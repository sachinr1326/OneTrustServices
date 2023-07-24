<%@page import="com.entities.QuantityService"%>
<%@page import="com.model.OrderDetailModel"%>
<%@page import="com.entities.OrderDetail"%>
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
    <link rel="stylesheet" href="css/payment.css">

</head>
<body>
<%@include file="templates/header.jsp" %>
<%
int orderId=Integer.parseInt(request.getParameter("orderid"));
OrderDetail order=new OrderDetailModel().find(orderId);
 String category=request.getParameter("category"); 
%>
  
  
<form action="">
<!--  bannnerimage-->
<div class="banner-image  " id="image">
  
  <div class="content text-center " style="padding-top:15% ;" >
      <h1 class=" banner-text text-white" id="image-text"> </h1>
  </div>
  
 
  
</div>
	<%-- <h1>Bill Amount</h1>
	<p><%=order.getTotalprices() %></p>
	<h1>kskhdkshksjdhchowhfoieh</h1> --%>
	
	<!-- ------------------payment------------------ -->
<section class="payment_section" id="build-4">
   
        <div class="container py-5">
          <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
              <div class="card" style="border-color:#7bbb43;">
                <div class="card-body p-md-5">
                    
                  <div class="section_title d-flex">
                     <div style="position: absolute;right: 360px ;">
                    <h4 style="text-transform: uppercase;" >Payment</h4>
                </div>
                  </div>
      
                  <div class="px-3 py-4 border border-success border-2 rounded mt-5 d-flex justify-content-between" >
                    <div class="d-flex flex-row align-items-center">
                     
                      
                      <div class="d-flex flex-column ms-4" style="color: #315c45;">
                        <span class="h5 mb-1" >Payable Amount</span>
                        
                      </div>
                    </div>
                    <div class="d-flex flex-row align-items-center" style="color: #7bbb43;">
                        <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i>
                      <span class="h2 mx-1 mb-0"><%=order.getTotalprices() %></span>
                     
                    </div>
                  </div> 
      
                 <!--  <h4 class="mt-5"style="color: #315c45;">Payment Method</h4> -->
      
                 
      
      
                  
                  
                  <div class="mt-5">
                    <button id="rzp-button1" class="btn  btn-block btn-lg" style="margin-left: 40%;">
                      Pay <i class="fas fa-long-arrow-alt-right"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
   


</section>
	<!-- <button id="rzp-button1" style="margin-top: 50%">Pay</button> -->
	
</form>














<%@include file="templates/footer.jsp" %>
<%@include file="templates/cdnlink.jsp" %>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script>
	var options = {
	    "key": "rzp_test_5MxFLrylfQd6sc", // Enter the Key ID generated from the Dashboard
	    "amount": "<%=Double.parseDouble(order.getTotalprices())*100 %>", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
	    "currency": "INR",
	    "name": "OTS",
	    "description": "OTS",
	     "image": "", 
	    "order_id": <%=order.getRazorpay_order_id()%>, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
	    "handler": function (response){
	    	window.location.href = 'http://localhost:8082/OneTrustServices/OrderServlet?razorpay_payment_id='+response.razorpay_payment_id+'&razorpay_order_id='+response.razorpay_order_id+'&razorpay_signature='+response.razorpay_signature+'&orderid='+<%=order.getId()%>+'&category=<%=category.replace(" ","%20")%>';

	    },
	    "prefill": {
	        "name": "<%=order.getUser().getName()%>",
	        "email": "<%=order.getUser().getEmail()%>",
	        "contact": "<%=order.getUser().getPhone()%>"
	    },
	    "notes": {
	        "address": ""
	    },
	    "theme": {
	        "color": "#7bbb43"
	        
	    }
	};
	var rzp1 = new Razorpay(options);
	rzp1.on('payment.failed', function (response){
	        alert(response.error.code);
	        alert(response.error.description);
	        alert(response.error.source);
	        alert(response.error.step);
	        alert(response.error.reason);
	        alert(response.error.metadata.order_id);
	        alert(response.error.metadata.payment_id);
	});
	document.getElementById('rzp-button1').onclick = function(e){
	    rzp1.open();
	    e.preventDefault();
	}
	</script>
</body>
</html>