<%@page import="java.util.HashMap"%>
<%@page import="java.util.Random"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.entities.Address"%>
<%@page import="com.model.AddressModel"%>
<%@page import="com.model.UserModel"%>
<%@page import="com.entities.User"%>
<%@page import="jakarta.servlet.http.Cookie"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page import="com.entities.Laundryservices"%>
<%@page import="java.util.List"%>
<%@page import="com.model.LaundryModel"%>
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
    <% String cat=request.getParameter("category"); %>
   <title><%=cat %></title>
  
    <link rel="stylesheet" href="../css/laundry.css">
    <style type="text/css">
    .hero-waves {
  display: block;
  width: 100%;
  height: 60px;
  position: relative;
}

.wave1 use {
  -webkit-animation: move-forever1 10s linear infinite;
  animation: move-forever1 10s linear infinite;
  -webkit-animation-delay: -2s;
  animation-delay: -2s;
}

.wave2 use {
  -webkit-animation: move-forever2 8s linear infinite;
  animation: move-forever2 8s linear infinite;
  -webkit-animation-delay: -2s;
  animation-delay: -2s;
}

.wave3 use {
  -webkit-animation: move-forever3 6s linear infinite;
  animation: move-forever3 6s linear infinite;
  -webkit-animation-delay: -2s;
  animation-delay: -2s;
}
@-webkit-keyframes move-forever1 {
  0% {
    transform: translate(85px, 0%);
  }

  100% {
    transform: translate(-90px, 0%);
  }
}

@keyframes move-forever1 {
  0% {
    transform: translate(85px, 0%);
  }

  100% {
    transform: translate(-90px, 0%);
  }
}

@-webkit-keyframes move-forever2 {
  0% {
    transform: translate(-90px, 0%);
  }

  100% {
    transform: translate(85px, 0%);
  }
}

@keyframes move-forever2 {
  0% {
    transform: translate(-90px, 0%);
  }

  100% {
    transform: translate(85px, 0%);
  }
}

@-webkit-keyframes move-forever3 {
  0% {
    transform: translate(-90px, 0%);
  }

  100% {
    transform: translate(85px, 0%);
  }
}

@keyframes move-forever3 {
  0% {
    transform: translate(-90px, 0%);
  }

  100% {
    transform: translate(85px, 0%);
  }
}
    
    </style>

</head>
<body>

  <%@include file="../templates/header.jsp" %> 
          

<!--  bannnerimage-->
<div class="banner-image  <%=cat %> " id="image">
  
    <div class="content" style=" float: right;padding-top: 30%; padding-right: 3%;">
        <h1 class=" banner-text" id="image-text" > Build your Order</h1>
    </div>
    
    <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
      <defs>
        <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z">
      </defs>
      <g class="wave1">
        <use xlink:href="#wave-path" x="50" y="3" fill="rgba(255,255,255, .3)">
      </g>
      <g class="wave2">
        <use xlink:href="#wave-path" x="50" y="0" fill="rgba(255,255,255, .4)">
      </g>
      <g class="wave3">
        <use xlink:href="#wave-path" x="50" y="9" fill="#fff">
      </g>
    </svg>
    
</div>


 <!-- progress bar -->
 <section class="page_progress_section">

    <div class="container">
       
        <div class="progress-container">
            <div class="progress" id="progress">
     
            </div>
            
            <div class="circle active" > 
                <i class="fa-sharp fa-solid fa-truck-fast "  ></i>
                
            </div>
           
            <div class="circle  "> <i class="fa-sharp fa-solid fa-location-dot " ></i></div>
            <div class="circle  "> <i class="fa-sharp fa-solid fa-clipboard-check "></i></div>
            <div class="circle  "> <i class="fa-sharp fa-solid fa-sack-dollar"></i></div>
         
        </div>
        <div class="content-progress">
           <div class="topleft"> <p id="progress-build">Build Your <br>Order</p></div>
           <div class="center"> <p id="progress-choose">Choose <br>Address</p></div>
           <div class="topright"> <p id="progress-payment">Payment</p></div>
           <div class="topmiddle"> <p id="progress-confirm">Confirm</p></div>
        </div>
    </div> 
    </section>
   <!-- ==========================================================================form-confirm====  -->
   
   <!-- build section  -->
    <section class="build_order_pg_section"  id="build-1" >
       <div class=" container ">
       <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="sec_title_bar mb-5" style="margin-bottom: 20px;">
                            <h2 class="section_title">Build Your <%= cat %> Cart</h2>
                        </div>
                      <%if(user!=null){ %>
                         <%if(user.getName().equals("admin")){ %>
                        
                        <div class="modal-button" style="text-align: end;">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalservices">
                                Add Service
                              </button>
                            </div>
                            <%} %>
                               <%} %>
                              
                         <!--   ===============add new services==========  -->
                            <%
                           
                            HashMap<String, Object> map=new HashMap<String, Object>();
                            
                    		map.put("category", cat);
                       List<Laundryservices> list= new LaundryModel().findByColumns(map);
                           if(list!=null){
                            for(Laundryservices laundry:list){
                            	String encodedata=Base64.getEncoder().encodeToString(laundry.getImage());
                            String pic="data:image/jpg;base64,"+encodedata;
                            %>
                            
                            
                            
                          <div class="card card-build mb-5" style="width: 100%;">
                                    <div class="row g-0 row2" >
                                      <div class="column first" >
                                        <img src="<%= pic %>" class="img-fluid rounded-start" alt="...">
                                      </div>
                                      <div class="column second" >
                                        <div class="card-body ">
                                            <div class="item-info ">
                                          <h5 class="card-title"><%= laundry.getService() %></h5>
                                            <ul class="build-list">
                                                <li><%= laundry.getItem1() %></li>
                                                 <%if(!laundry.getItem2().equals("")){ %>
                                                <li><%= laundry.getItem2() %></li>
                                                 <%} %>
                                                <%if(!laundry.getItem3().equals("")){ %>
                                                <li><%= laundry.getItem3() %></li>
                                                <%} %>
                                            </ul>
                           </div>
 
                                           </div>
                                           
                                        </div>
                                        <div class="column third">
                                            <div class="price-list" >
                                            <%if(!laundry.getPrice().equals("")){ %>
                                            <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i>
                                                <span><%= laundry.getPrice() %>/<%=laundry.getPer() %></span>
                                            <%}else{ %>
                                             <span>Price Based on </span>
                                            
                                            <%} %>
                                            </div>
                                            
                                            </div>
                                            <div class="column  four flex-column">
                                              
                                                   <input type="checkbox"   onclick="MyCheckbox()"   class="form-check-input float-end  service-checkbox" name="services" value="<%= laundry.getId()+","+laundry.getService()+','+laundry.getPrice()+','+ pic+','+laundry.getPer() %>">
                                                <div class="position-absolute bottom-0 end-0" style="margin-right: 25px; margin-bottom: 5px;">
                                                        <%if(user!=null){ %>
                                                       <%if(user.getName().equals("admin")){ %>
                                                     <form method="post" action="../LaundryServicesDeleteServlet?id=<%= laundry.getId() %>&category=<%=cat %>" >
                                                    <button class="remove-service " style="border: none; background:transparent ;color:#ab1309;" ><i class="fa-sharp fa-solid fa-trash"></i></button>
                                                    </form>
                                                    <%} %>
                                                     <%} %>
                                                    
                                      </div>
                              </div>
                                               
                                      </div>
                                      
                                      
                                  </div>  
                                  <%}} %>
                                  
                                  
                                        
                             </div>
 </div> <!-- <   row -->
  </div>
  
 
 <!-- -----------------------------popup add services------------ -->


  <!-- Modal -->
  <div class="modal fade" id="modalservices" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Add New Service</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
         <form  method="post" action="../LaundryServicesServlet?category=<%=cat %>" enctype="multipart/form-data">
        <div class="modal-body">
           
        <div class="row g-3">
                 <div class="col-12">
                  <label for="services" class="form-label">Category</label>
                  <input type="text" class="form-control" id="module" name="category" value="<%= cat%>" readonly="readonly">
                 </div>

                    <div class="file-upload-wrapper">
                        <input type="file"  class="file-upload" name="image" />
                      </div>
                    
                <div class="col-md-6">
              
              
                  <label for="services" class="form-label">Services</label>
              
              
                  <input type="text" class="form-control" id="services" name="service">
              
              
                </div>
              
              
                <div class="col-md-3">
              
              
                  <label for="price" class="form-label">Price</label>
              
              
                  <input type="text" class="form-control" id="price" name="price">
              
              
                </div>
                <div class="col-md-3">
              
              
                  <label for="price" class="form-label">Per</label>
              
              
                   <select id="per" class="form-select" name="per">
              
              
                    <option selected>Price Per</option>
                     <option>PC</option>
                     <option>KG</option>
                      <option>sq.ft</option>
                     <option>Vehicle</option>
                      <option>Event</option>
                       <option>Tank</option>
                     <option>Wall</option>
                     <option>item</option>
                     <option>Fault</option>
                  </select>
              
              
                </div>
              
              
                <div class="col-12">
              
              
                  <label for="item1" class="form-label">Item 1</label>
              
              
                  <input type="text" class="form-control" id="item1" placeholder="Item" name="item1">
              
              
                </div>
              
              
                <div class="col-12">
              
              
                  <label for="item2" class="form-label">Item 2</label>
              
              
                  <input type="text" class="form-control" id="item2" placeholder="item" name="item2">
              
              
                </div>
              
                <div class="col-12">
              
              
                    <label for="item3" class="form-label">Item 3</label>
                
                
                    <input type="text" class="form-control" id="item3" placeholder="Item" name="item3">
                
                
                </div>
             </div>
        </div>
        <div class="modal-footer">
          
          <button type="submit" class="btn btn-primary">Save</button>
        </div>
         </form>
      </div>
    </div>
  </div>




    </section>
   <!-- address  -->
   <section class="address_pg_section" id="build-2">
       <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                
                <div class="sec_title_bar mb-5" style="margin-bottom: 20px;">
                    <h2 class="section_title">Choose Address</h2>
                </div>
               
                
                
                
                
                <!-- Button trigger modal -->
                <div class="modal-button" style="text-align: end;">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Add New Address
                  </button>
                </div>
                 <%
                
                List<Address> list1= new AddressModel().findbyUserid(userid);
                 System.out.println(userid);
                 System.out.println(list1);
                 if(list1!=null){
                for(Address address:list1){
                %>
          
  <div class="grid">
    <label class=" address-cart ">
      <input name="plan" id="address-radio"  checked="checked" class="address-check" type="radio" value="<%= address.getHouse()+'|'+address.getStreet()+'|'+address.getCity()+'|'+address.getPincode()+'|'+address.getState()+'|'+address.getId()+'|'+address.getPlace()  %>">
     <form method="post" action="../AddressDeleteServlet?id=<%= address.getId() %>&category=<%=cat %>" >
      <button class="remove" type="submit">Remove</button> 
      </form>
      <span class="plan-details">
       <ul type="none" class="address-list">
                    <li class="add-item">
        <span class="plan-type"><%= address.getPlace() %></span><br>
        <span ><%= address.getName() %></span><br>
        <span><%= address.getPhone() %></span><br>
        <span><%= address.getHouse() %>,<%= address.getStreet()%></span><br>
        <span><%= address.getCity()%> - <%= address.getPincode()%></span><br>
         <span><%= address.getState() %></span><br>
                         </li>
                </ul>
                 
      </span>
     
    </label>
  </div>
       
       <%}} %>
    </div>
</div>
   
</div>
<!-- -----------------------------popup add new address------------ -->


  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Add New Address</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form   action="../AddressServlet?category=<%=cat %>" method="post">
        <div class="modal-body">
            
      <div class="row g-3" >
      
      
            <div class="col-12" style="display: flex;">
                  <div class="home-radio  home-radio-inline">
                  <input type="radio" id="place" name="place" value="Home">
				  <label for="place">Home</label><br></div>
				  <div class="home-radio  home-radio-inline" style="padding-left: 30px">
                  <input type="radio" id="place" name="place" value="Office">
				  <label for="place">Office</label><br></div>
				  <div class="home-radio  home-radio-inline" style="padding-left: 30px">
                  <input type="radio" id="place" name="place" value="Other">
				  <label for="place">Other</label><br></div>
                       
             </div>
                       
                <div class="col-md-6">
                   
       
                  <label for="name" class="form-label">Name</label>
              
              
                  <input type="text" class="form-control" id="name" name="name" >
              
              
                </div>
              
              
                <div class="col-md-6">
              
              
                  <label for="phone" class="form-label">Phone no.</label>
              
              
                  <input type="text" class="form-control" id="phone" name="phone">
              
              
                </div>
              
              
                <div class="col-12">
              
              
                  <label for="house" class="form-label">Address</label>
              
              
                  <input type="text" class="form-control" id="house" placeholder="house no." name="house">
              
              
                </div>
              
              
                <div class="col-12">
              
              
                  <label for="street" class="form-label">Address</label>
              
              
                  <input type="text" class="form-control" id="street" placeholder="Street/Road" name="street">
              
              
                </div>
              
              
                <div class="col-md-6">
              
              
                  <label for="City" class="form-label">City</label>
              
              
                  <input type="text" class="form-control" id="City" name="city">
              
              
                </div>
              
              
                <div class="col-md-6">
              
              
                  <label for="inputState" class="form-label">State</label>
              
              
                  <select id="inputState" class="form-select" name="state">
              
              
                    <option selected>Choose...</option>
              
              
                    <option>UP</option>
                    <option>UK</option>
                    <option>MP</option>
                  </select>
              
              
                </div>
              
                <div class="col-12">
              
              
                    <label for="pincode" class="form-label">Pincode</label>
                
                
                    <input type="text" class="form-control" id="pincode" placeholder="pincode" name="pincode">
                
                
                  </div>
              
             </div>
        </div>
        <div class="modal-footer">
          
          <button type="submit" class="btn btn-primary">Save</button>
        </div>
         </form>
      </div>
    </div>
  </div>

   </section>
<!-- ------------confirm order---------------- -->
<form action="../OrderDetailServlet?category=<%=cat %>" method="post">
<section class="order_confirm_section" id="build-3">
    
        <div class="d-flex flex-column justify-content-center align-items-center" id="order-heading">
            <div class="text-uppercase">
                <h2 class="section_title">Order detail</h2>
            </div>
            <div class="h4"><%= LocalDate.now().getDayOfWeek() %>, <%= LocalDate.now().getMonth() %> <%= LocalDate.now().getDayOfMonth() %>,<%= LocalDate.now().getYear() %></div>
            <%  Random rand = new Random();
            int randomnumber = rand.nextInt(900000) + 100000; 
            %>
            
            <div class="pt-1">
                <p>Order : <input type="text" style="border: none; background-color: transparent;width:60px;" name="orderid" value="#<%=randomnumber%>"/> is currently<b class="text-dark"> processing</b></p>
            </div>
           
        </div>
        <div class="wrapper bg-white">
            <div class="table-responsive">
            <div class="d-flex text-muted">
           <div class="order-item" style="margin-left: 8%; text-transform: uppercase; color:black;">Services</div>
           <div class="order-item" style="margin-left: 55%; text-transform: uppercase;color:black;">Prices</div>
           <div class="order-item" style="margin-left: 10%; text-transform: uppercase;color:black;">Total</div>
            
            </div>
            

            </div>
            <div id="productcart" >
            
            
            </div>
      
           
        </div>

</section>

<!-- ------------------payment------------------ -->
<section class="payment_section" id="build-4">
   
        <div class="container py-5">
          <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
              <div class="card" style="border-color:#7bbb43;">
                <div class="card-body p-md-5">
                    
                  <div class="section_title d-flex">
                    <button class="back-btn" id="back-btn" type="button" style="border: none; background:transparent ;color:#7bbb43; " ><i class="fa-sharp fa-solid fa-arrow-left"></i></button>
                    <div style="position: absolute;right: 320px ;">
                    <h4 >Payment Method</h4>
                </div>
                  </div>
      
                  
      
                  <div class="px-3 py-4 border border-primary border-2 rounded mt-4 d-flex justify-content-between">
                    <div class="d-flex flex-row align-items-center">
                     
                      <i class="fa-sharp fa-solid fa-hand-holding-dollar" style=" font-size: 2rem; color:#7bbb43 ;" ></i>
                      <div class="d-flex flex-column ms-3" style="color: #315c45;">
                        <span class="h5 mb-1">Cash on Delivery</span>
                    
                      </div>
                    </div>
                    <div>
                      <input type="radio"  class="payment-radio" name="paymenttype"  value="cod"/>
                    </div>
                  </div>
      
                  <div class="px-3 py-4 border border-primary border-2 rounded mt-4 d-flex justify-content-between" style="border-color:#7bbb43;">
                    <div class="d-flex flex-row align-items-center">
                     
                        <i class="fa-sharp fa-solid fa-credit-card" style=" font-size: 2rem; color:#7bbb43 ;" ></i>
                      <div class="d-flex flex-column ms-3" style="color: #315c45;">
                        <span class="h5 mb-1">Online Payment</span>
                       
                      </div>
                    </div>
                    <div>
                      <input type="radio"  class="payment-radio"  name="paymenttype"  value="online" checked="checked" />
                    </div>
                  </div>
      
                  
                  
                  <div class="mt-5">
                    <button class="btn btn-primary btn-block btn-lg" id="paymentbtn" type="submit" >
                      Proceed to payment <i class="fas fa-long-arrow-alt-right"></i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
   


</section>
</form>


<div class="button_section text-center" id="button-section">
      
    <div id="note" style="text-align: center; color:red; margin-bottom: 10px; display: none;" class="container" ><span>Note:-</span><span>After pressing confirm, You are confirming the order and if you are failed to payment then it will automatically goes to COD.</span></div>
    <button class="btn" id="prev" disabled><i class="fa-sharp fa-solid fa-arrow-left"></i> Back</button>
    
   
    <button class="btn" onclick="savedetail()" disabled="disabled" id="next" value="next" >Next <i class="fas fa-long-arrow-alt-right"></i></button>
   
</div>

<%@include file="../templates/footer.jsp" %>
 <%@include file="../templates/cdnlink.jsp" %>
<script type="text/javascript">
function MyCheckbox() {
	var checkbox =document.getElementsByClassName('service-checkbox');
	var btn=document.getElementById("next");
	if(checkbox.checked==true){
		btn.disabled=true;
	}else{
		
		btn.disabled=false;
	}
}
 
function savedetail() {
	var nextbtn=document.getElementById('next');
	if(nextbtn.innerHTML!='Confirm <i class="fas fa-long-arrow-alt-right"></i>'){
		
		
	var x=0;
	var items='';
	var totalprice=0;
	var checkedValue = document.querySelector('.service-checkbox:checked').value;
	var data=null;
	var data =document.getElementsByClassName('service-checkbox');
	var services='';
	for(var i=0;data[i];i++){
		if(data[i].checked){
			var id=data[i].value.split(',')[0];
			var service=data[i].value.split(',')[1];
			var price=parseInt(data[i].value.split(',')[2]);
			var image=data[i].value.split(',')[3]+','+data[i].value.split(',')[4];
			var per= data[i].value.split(',')[5];
			items = items+'\n'+
            '<div class="d-flex justify-content-start align-items-center list my-2 py-1">'+
           
            '<div class="mx-3"> <img src="'+image+'" alt="apple" width="30" height="30"> </div>'+
            '<div class="order-item" style="color:#315c45;">'+service+'</div><div style="position:absolute; margin-left: 25%;"><button id="minus" type="button" onclick="decrement('+id+')">-</button><input id="multipleprice_'+id+'" type="number"  name="multipleprice_'+id+'" min="1" max="30" value="1" style=" border-radius: 5px;border:1px #558309 solid;text-align: center;" readonly /><button id="plus" type="button" onclick="increment('+id+')">+</button></div>'+
            '<div class="order-price" style="position:absolute; margin-left:41%;color:gray;" ><p><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><span id="price-'+id+'">'+price+'</span><span>/'+per+'</span></p></div>'+
            '<div class="order-price" style="position:absolute; margin-left:51%;color:#315c45;" ><p><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><span id="total-'+id+'">'+price+'</span></p></div>'+
            '</div>';
        	services=services+(services==''? '':',')+id;
        	totalprice = totalprice+price;
        	
		
			
		
		}
	}

	items = items +'<input type="hidden" name="serviceids" value="'+services+'"/>';
	items = items+'<div class="pt-2 border-bottom mb-3"></div>'+'<div class="d-flex justify-content-start align-items-center pl-3 py-3 mb-4 border-bottom ">'+
					    '<div style="margin-left: 9%; color:black;"> Total Amount </div>'+
					    '<div class="ml-5 h5" style="margin-left: 66%; color:#315c45;"> <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><span id="totalprice"  >'+totalprice+'</span></div>'+
					'</div>';
					
					
 		
	var addresscheck = document.querySelector('.address-check:checked').value;
	var data2=null;
	var data2 =document.getElementsByClassName('address-check');
	for(var i=0;data2[i];i++){
		if(data2[i].checked){
			
			
			var house=data2[i].value.split('|')[0];
			var street=data2[i].value.split('|')[1];
			var city=data2[i].value.split('|')[2]; 
			var pincode=data2[i].value.split('|')[3]; 
			var state=data2[i].value.split('|')[4];
			var id=data2[i].value.split('|')[5];
					
					
	items=items+'<div class="row border rounded p-1 my-3">'+
	  '<div class="col-md-6 py-3">'+
   ' <div class="d-flex flex-column align-items start"> <b>Shipping Address</b>'+
        '<p class="text-justify pt-2" style=" color:#315c45;">'+house+','+street+','+city+'-'+pincode+'</p>'+
       ' <p class="text-justify" style=" color:#315c45;">'+state+'</p>'+
    '</div>'+
'</div>'+
'</div> ';

	items = items +'<input type="hidden" name="addressid" value="'+id+'"/>';
}
		} 
	
	document.getElementById("productcart").innerHTML=items;
	
}
}


function increment(id) {
	var total=document.getElementById('total-'+id+'');
	var price=document.getElementById('price-'+id+'').innerHTML;
	var totalprice=document.getElementById('totalprice');
	var incre=  document.getElementById('multipleprice_'+id+'');

        incre.stepUp();
       total.innerHTML= price*incre.value;
       totalprice.innerHTML= parseInt(totalprice.innerHTML )+ parseInt(price) ;
        incre.setAttribute('value', incre.value);
        
}
function decrement(id) {
	var total=document.getElementById('total-'+id+'');
	var price=document.getElementById('price-'+id+'').innerHTML;
	
	 var decre= document.getElementById('multipleprice_'+id+'');
	 decre.stepDown();
	 if(price!=total.innerHTML){
	 total.innerHTML= total.innerHTML-price;
	  totalprice.innerHTML= parseInt(totalprice.innerHTML )- parseInt(price);
	  decre.setAttribute('value', decre.value);
	 }
}	
			</script>


<script src="../javascript/laundry.js"></script>
</body>
</html>