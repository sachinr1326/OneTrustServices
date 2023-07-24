<%@page import="com.model.ImageMessageModel"%>
<%@page import="com.entities.ImageMessage"%>
<%@page import="com.model.TrackOrderModel"%>
<%@page import="com.entities.TrackOrder"%>
<%@page import="com.entities.DeliveredOrder"%>
<%@page import="com.model.DeliveredOrderModel"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.model.AcceptOrderModel"%>
<%@page import="com.entities.AcceptOrder"%>
<%@page import="com.model.RejectOrderModel"%>
<%@page import="com.entities.RejectOrder"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.entities.QuantityService"%>
<%@page import="com.entities.Address"%>
<%@page import="com.model.OrderDetailModel"%>
<%@page import="com.entities.OrderDetail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Document</title>
    <link rel="stylesheet" href="css/masterpage.css">
  
   
   
   
   
   
</head>
<body>
 <%@include file="templates/header.jsp" %>
 <%String tab=request.getParameter("tab");

 %>
 <!-- ==========================================================
                 HEADER-SECTION
=========================================================== -->
  <section class="admin-section-header">
<div class="card admin-header-card shadow p-3 mb-5 bg-body rounded">
    <div class="container">
        <div class="row" id="mydiv">
          <div class="col vr ">
            <a onclick="showdashboard()" class="das <%if(tab=="admin1" || tab==null){%>active<%}%>">
            <i class="fas fa-cubes fa-3x  " ></i> Dashboard
        </a>
          </div>
        
          <div class="col vr">
            <a onclick="showOrders()" class="das <%if(tab!=null){if(tab.equals("admin2")){%>active<%}}%>">
            <i class="fa-sharp fa-solid fa-store "></i> Orders
        </a>
          </div>
          <div class="col vr">
            <a  onclick="showNotification()" class="das <%if(tab!=null){if(tab.equals("admin3")){%>active<%}}%>">
                <i class="fa-sharp fa-solid fa-bell "></i> Notification
        </a>
          </div>
          <div class="col vr ">
            <a  onclick="showCustomer()" class="das  <%if(tab!=null){if(tab.equals("admin4")){%>active<%}}%>">
                <i class="fa-sharp fa-solid fa-users "></i> Customers
            </a>
          </div>
          <div class="col vr">
            <a  onclick="showAccept()"  class="das <%if(tab!=null){if(tab.equals("admin5")){%>active<%}}%>">
                <i class="fa-sharp fa-solid fa-circle-check "></i> Accept Order
                
            </a>
          </div>
          <div class="col ">
            <a  onclick="showReject()"  class="das <%if(tab!=null){if(tab.equals("admin6")){%>active<%}}%>">
                <i class="fa-sharp fa-solid fa-circle-xmark "></i> Reject Order
            </a>
          </div>
        </div>
    </div>
      </div>
</section>
<!-- ==========================================================
                DASHBOARD-SECTION
=========================================================== -->
<section class="admin-section-dashboard" id="admin1"style="display: <%if(tab=="admin1"||tab==null){%>block<%}else{ %> none<% }%>;">
  <div class="row">
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 mt-4" style="margin-left: 7%;">
      <div class="card  shadow h-100 py-3" style="border-radius: 7px; border-left: 5px solid #7bbb43;max-width: 400px;">
          <img alt="" style="margin-left:65%; "src="images/gifs/daily.gif" width="110" height="110">
          <div class="card-body card-img-overlay">
              <div class="row  align-items-center pt-3">
              
                  <div class="col mr-2 ">
                      <div class="text-xs text-uppercase mb-1" style="color: #315c45; font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 15px;">
                          Earnings (Daily)</div>
                          <%
                          float dailyearning=0;
                          List<OrderDetail> earn=new OrderDetailModel().TotalEarningByDate("daily");
                          for(OrderDetail order:earn){
                        	  dailyearning=dailyearning + Float.parseFloat(order.getTotalprices());
                        	  }
                          %>
                          
                      <div class="h5 mb-0 " style="font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 25px;"> <i class="fa-sharp fa-solid fa-indian-rupee-sign "></i><%=dailyearning %></div>
                  </div>
                
              </div>
          </div>
      </div>
  </div>
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 mt-4" style="margin-left: 5%;">
      <div class="card  shadow h-100 py-3" style="border-radius: 7px; border-left: 5px solid #7bbb43;max-width: 400px;">
           <img alt="" style="margin-left:65%; "src="images/gifs/month.gif" width="110" height="110">
          <div class="card-body card-img-overlay">
              <div class="row  align-items-center pt-3">
                  <div class="col mr-2">
                      <div class="text-xs text-uppercase mb-1" style="color: #315c45; font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 15px;">
                          Earnings (Monthly)</div>
                           <%
                          float monthlyearning=0;
                          List<OrderDetail> monthearn=new OrderDetailModel().TotalEarningByDate("month");
                          for(OrderDetail order:monthearn){
                        	  monthlyearning=monthlyearning + Float.parseFloat(order.getTotalprices());
                        	  }
                          %>
                      <div class="h5 mb-0 " style="font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 25px;"><i class="fa-sharp fa-solid fa-indian-rupee-sign "></i><%=monthlyearning %></div>
                  </div>
                 
              </div>
          </div>
      </div>
  </div>
 <!-- Earnings (Monthly) Card Example -->
 <div class="col-xl-3 mt-4 " style="margin-left:5%;">
  <div class="card  shadow h-100 py-3" style="border-radius: 7px; border-left: 5px solid #7bbb43; max-width: 400px;">
               <img alt="" style="margin-left:65%; "src="images/gifs/year.gif" width="110" height="110">
      <div class="card-body card-img-overlay">
          <div class="row  align-items-center pt-3">
              <div class="col mr-2">
                  <div class="text-xs text-uppercase mb-1" style="color: #315c45; font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 15px;">
                      Earnings (Annual)</div>
                       <%
                          float yearearning=0;
                          List<OrderDetail> yearearn=new OrderDetailModel().TotalEarningByDate("year");
                          for(OrderDetail order:yearearn){
                        	  yearearning=yearearning + Float.parseFloat(order.getTotalprices());
                        	  }
                          %>
                  <div class="h5 mb-0 " style="font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 25px;"><i class="fa-sharp fa-solid fa-indian-rupee-sign "></i><%=yearearning %></div>
              </div>
             
          </div>
      </div>
  </div>
</div>
<!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 mt-4" style="margin-left: 7%;">
      <div class="card  shadow h-100 py-3" style="border-radius: 7px; border-left: 5px solid #7bbb43;max-width: 400px;">
           <img alt="" style="margin-left:65%; "src="images/gifs/orderdaily.gif" width="110" height="110">
          <div class="card-body card-img-overlay">
              <div class="row  align-items-center pt-3">
                  <div class="col mr-2">
                      <div class="text-xs text-uppercase mb-1" style="color: #315c45; font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 15px;">
                          Order (Today)</div>
                      <div class="h5 mb-0 " style="font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 25px;"><%=new OrderDetailModel().findRowOrderByDate("daily") %></div>
                  </div>
                 
              </div>
          </div>
      </div>
  </div>
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 mt-4 " style="margin-left: 5%;">
      <div class="card  shadow h-100 py-3" style="border-radius: 7px; border-left: 5px solid #7bbb43;max-width: 400px;">
          <img alt="" style="margin-left:65%; "src="images/gifs/ordermonth.gif" width="110" height="110">
          <div class="card-body card-img-overlay">
              <div class="row  align-items-center pt-3">
                  <div class="col mr-2">

                      <div class="text-xs text-uppercase mb-1" style="color: #315c45; font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 15px;">
                          Order (Monthly)</div>
                      <div class="h5 mb-0 " style="font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 25px;"><%= new OrderDetailModel().findRowOrderByDate("month") %></div>
                  </div>
                 
              </div>
          </div>
      </div>
  </div>
 <!-- Earnings (Monthly) Card Example -->
 <div class="col-xl-3 mt-4" style="margin-left:5%;">
  <div class="card  shadow h-100 py-3" style="border-radius: 7px; border-left: 5px solid #7bbb43;max-width: 400px;">
      <img alt="" style="margin-left:65%; "src="images/gifs/orderyear.gif" width="110" height="110">
      <div class="card-body card-img-overlay ">
          <div class="row  align-items-center pt-3">
              <div class="col mr-2">
                  <div class="text-xs text-uppercase mb-1" style="color: #315c45; font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 15px;">
                      Order (Year)</div>
                  <div class="h5 mb-0 " style="font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 25px;"><%=new OrderDetailModel().findRowOrderByDate("year") %></div>
              </div>
              
          </div>
      </div>
  </div>
</div>

 
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 mt-4" style="margin-left: 7%;">
      <div class="card  shadow h-100 py-3" style="border-radius: 7px; border-left: 5px solid #7bbb43;max-width: 400px;">
         <img alt="" style="margin-left:65%; "src="images/gifs/orderaccept.gif" width="110" height="110">
          <div class="card-body card-img-overlay ">
              <div class="row  align-items-center pt-3">
                  <div class="col mr-2">
                      <div class="text-xs text-uppercase mb-1" style="color: #315c45; font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 15px;">
                          Order (Accept)</div>
                      <div class="h5 mb-0 " style="font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 25px;"><%=new AcceptOrderModel().findNumberofRows() %></div>
                  </div>
                  
              </div>
          </div>
      </div>
  </div>
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 mt-4 " style="margin-left: 5%;">
      <div class="card  shadow h-100 py-3" style="border-radius: 7px; border-left: 5px solid #7bbb43;max-width: 400px;">
          <img alt="" style="margin-left:65%; "src="images/gifs/orderreject.gif" width="110" height="110">
          <div class="card-body card-img-overlay">
              <div class="row  align-items-center pt-3">
                  <div class="col mr-2">
                      <div class="text-xs text-uppercase mb-1" style="color: #315c45; font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 15px;">
                          Order (Reject)</div>
                      <div class="h5 mb-0 " style="font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 25px;"><%=new RejectOrderModel().findNumberofRows() %></div>
                  </div>
                 
              </div>
          </div>
      </div>
  </div>
 <!-- Earnings (Monthly) Card Example -->
 <div class="col-xl-3 mt-4" style="margin-left:5%;">
  <div class="card  shadow h-100 py-3" style="border-radius: 7px; border-left: 5px solid #7bbb43;max-width: 400px;">
     <img alt="" style="margin-left:65%; "src="images/gifs/orderdelivered.gif" width="110" height="110">
      <div class="card-body card-img-overlay">
          <div class="row  align-items-center pt-3">
              <div class="col mr-2">
                  <div class="text-xs text-uppercase mb-1" style="color: #315c45; font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 15px;">
                      Order (Delivered)</div>
                  <div class="h5 mb-0 " style="font-family: 'Raleway', sans-serif;  font-weight: 900; font-size: 25px;"><%=new DeliveredOrderModel().findNumberofRows()  %></div>
              </div>
             
          </div>
      </div>
  </div>
</div>

  </div>


</section>
<!-- ==========================================================
                 ORDER-SECTION
=========================================================== -->
<section class="admin-section-orders" id="admin2" style="display: <%if(tab!=null){if(tab.equals("admin2")){%>block<%}else{ %> none<% }}else{%> none<%}%>;">
  <%
  boolean todayflag3=true,yesterdayflag3=true;
  ArrayList<String> datelist3=new ArrayList<String>();
  SimpleDateFormat sdf3 = new SimpleDateFormat("yyyyMMdd");     
  
   List<DeliveredOrder> listorder= new DeliveredOrderModel().findAll();
       if(listorder.isEmpty()){
        %>
                 <div class="text-center"><img alt="" src="images/gifs/empty-ghost.gif" width="350">
                 </div>
                  <%}else{ %>
      <div style="padding-left: 30%; padding-right: 30%;">
     <form class="d-flex" style="border-radius: 4px; border:1px solid #7bbb43;">
    <i class="fa-sharp fa-solid fa-magnifying-glass m-2" style="font-size: 20px; color: #7bbb43;"></i>
      <input style="border: none; box-shadow: none;" class="form-control me-2" type="search" placeholder="Enter OrderId"id="search-order" onkeyup="ordersearch()" aria-label="Search"/>
    </form>
    </div>
              <div id="order-list">   
              
      
              <div class="card admin-orders-card mt-5 p-3 ">
        
            <div class="row">
              <div class="col vr ">
                Customer
            </div>
           
                <div class="col vr ">
                  OrderId
              </div>
              
                <div class="col vr ">
                 Services
              </div>
              
                <div class="col vr ">
                  Quantity
              </div>
           
                <div class="col vr ">
                  Amount
              </div>
             
                <div class="col vr ">
                  Payment Method
              </div>
            
                <div class="col vr ">
                 Date and Time
              </div>
            
              <div class="col vr ">
                Transcation Id
            </div>

            <div class="col vr ">
               Address
            </div>

                <div class="col  ">
                  Status
              </div>

            </div>
        </div>
       <%  
              
               for(DeliveredOrder order:listorder){
            	   List<QuantityService> list2= order.getOrderdetail().getQuantity();
            	   Address address= order.getOrderdetail().getAddress();
            	   int seq=0;
	 %> 
	 	
                 
        
        <div class="card admin-orders-card-content p-3 mt-1 search_bar_order">
        
            <div class="row">
              <div class="col vr ">
             
               <i class="fa-solid fa-phone"></i> <%=order.getOrderdetail().getUser().getPhone() %><br>
               <i class="fa-sharp fa-solid fa-envelope"></i> <%=order.getOrderdetail().getUser().getEmail() %>
            </div>
           
                <div class="col vr byorderid">
                 <%=order.getOrderdetail().getOrderid() %>
              </div>
              
                <div class="col vr ">
                 <%for(QuantityService laundry:list2){seq++; %>
                	<%=seq %>. <%=laundry.getServices().getService()%><br>
                	 <% } %>
              </div>
              
                <div class="col vr ">
                  <%for(QuantityService laundry:list2){  %>
             	 <%=laundry.getquantity()%><br>
             	 <%} %>
              </div>
           
                <div class="col vr ">
                 <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=order.getOrderdetail().getTotalprices() %>
              </div>
             
                <div class="col vr ">
                  <% if(order.getOrderdetail().isPaid()){ %>paid<%}else{ %>cod<%} %>
              </div>
            
                <div class="col vr ">
                  <i class="fa-regular fa-calendar"></i> <%= order.getOrderdetail().getDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %><br>
         <i class="fa-sharp fa-solid fa-clock"></i> <%=order.getOrderdetail().getDate().getHour() %> : <%=order.getOrderdetail().getDate().getMinute() %>
              </div>
            
              <div class="col vr ">
              <% if(order.getOrderdetail().getRazorpay_payment_id()==null){ %>COD<%}else{ %><%=order.getOrderdetail().getRazorpay_payment_id() %><%} %>
               
            </div>

            <div class="col vr ">
             <%=address.getName() %> ,  <%=address.getPhone() %> <br>
             <%=address.getHouse() %>,<%=address.getStreet() %>,<%=address.getCity() %><br>
              <%=address.getState() %>-<%=address.getPincode() %>
               </div>

                <div class="col  ">
                 <%=order.getOrderdetail().getStatus() %>
              </div>

            </div>
        </div>

<%} }%>
</div>
</section>
<!-- ==========================================================
                 NOTIFICATION-SECTION
=========================================================== -->
<section class="admin-section-notification" id="admin3"style="display: <%if(tab!=null){if(tab.equals("admin3")){%>block<%}else{%>none<%}}else{%> none<%}%>;">


</section>
  <!-- ==========================================================
                 CUSTOMER-SECTION
=========================================================== -->     
<section class="admin-section-customers" id="admin4" style="display: <%if(tab!=null){if(tab.equals("admin4")){%>block<%}else{ %> none<% }}else{%> none<%}%>;">
  
    <% 
     List<User> list= new UserModel().findAll();
    if(list.isEmpty()){%>
     <div class="text-center"><img alt="" src="images/gifs/empty-ghost.gif" width="350">
                 </div>
<%    	
    }else{  %>
    <div style="float: right; margin-bottom: 2%; padding-right: 5%;">
    <button class="add-track-btn"data-bs-toggle="modal" data-bs-target="#image_update_modal"> Message Icon Upload</button>
    </div>
    <div style="padding-left: 30%; padding-right: 30%;">
    <form class="d-flex" style="border-radius: 4px; border:1px solid #7bbb43;">
    <i class="fa-sharp fa-solid fa-magnifying-glass m-2" style="font-size: 20px; color: #7bbb43;"></i>
      <input style="border: none; box-shadow: none;" class="form-control me-2" type="search" placeholder="Enter Phone no."id="search-customer" onkeyup="customersearch()" aria-label="Search"/>
    </form>
    </div>
    <!-- -----------------------------popup Upadte track------------ -->
<!-- Modal -->
<div class="modal fade" id="image_update_modal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content" style="border-radius: 10px; margin-top: 20%; width:600px;"> 
      <form method="post" action="MessageIconUpload?tab=admin4" enctype="multipart/form-data">
      <div class="modal-body" >
      <div>
      <span style="font-weight: 600;">Message Icon </span>
          <a data-bs-dismiss="modal" id="track-btn-close" ><i class="fa-sharp fa-solid fa-circle-xmark"></i></a>
          </div>
    <div class="container modal-container mt-5">
          <input type="text" style="text-transform: capitalize;"placeholder="name"  name="name" class="form-control mb-2" required="required" />
         
                 <input type="file"  class="file-upload mb-2" name="image" required="required" />
                 
    
    <div class="buttons-track mt-3">
        <button type="submit" >Upload</button>
    </div>
</div>
</div>
</form>
</div>
</div>
</div>
        <div class="card admin-customer-card p-3 ">
        
  <div class="row">
    <div class="col vr ">
      Name
  </div>
 
      <div class="col vr ">
        Email
    </div>
    
      <div class="col vr ">
       Phone
    </div>

      <div class="col  ">
        Message
    </div>

  </div>
</div>

 <!-- -------product-list------ -->
 <div id="customer-list">
  <%  for(User customer:list){
    %>
    
   
  <!--  ------------product--------- -->
    <div class="card admin-customer-card-content p-3 mt-1">
        
        <div class="row">
          <div class="col vr ">
          <%=customer.getName() %>
        </div>
       
            <div class="col vr ">
              <%=customer.getEmail() %>
          </div>
        <!--   ----------------h2------------- -->
            <div class="col vr byphone">
             <%=customer.getPhone() %>
          </div>
          
            <div class="col col-message ">
            <!-- Button trigger modal -->
<a type="button" data-bs-toggle="modal" data-bs-target="#customersendmessage-<%=customer.getId()%>">
   Type Message.....
</a>
  
  <!-- Modal -->
  <div class="modal fade mt-5 " id="customersendmessage-<%=customer.getId()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
   <form method="post" action="SendMessageServlet?userid=<%=customer.getId()%>&tab=admin4">
      <div class="modal-content" >
        <div class="modal-header pt-4">
          <div class="card modal-card pt-2 shadow bg-body rounded">Send to <%=customer.getName()%></div>
          </div>
        <div class="modal-body mt-4">
                  
                    <select class="form-select mb-2"  name="imageid">
                 <%List<ImageMessage> imglist= new ImageMessageModel().findAll();
                  for(ImageMessage img:imglist){
                	  String encodedata=Base64.getEncoder().encodeToString(img.getImage());
                     String imgpic="data:image/jpg;base64,"+encodedata;
                  %> 
                 
                  <option value="<%=img.getId()%>"  <%if(img.getName().equals("brand-logo")){%>selected<% }%>><%=img.getName()%></option> 
 
 <%} %> 
  
</select>
                  
                  <input type="text" placeholder="Topic" id="msgtopic" name="topic" class="form-control mb-2" required="required" />
                  <textarea class="form-control"name="comment"  id="msgcomment" placeholder="Comment" style="height: 200px;" required="required"></textarea>
              
    
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            
          <button  id="messagesend" type="submit" class="btn btn-primary">Send <i class="fa-sharp fa-solid fa-share"></i></button>
        </div>
      </div>
      </form>
    </div>
  </div>
          </div>

        </div>
    </div>
<%} }%>
</div>
</section>
<!-- ==========================================================
                 ACCEPT-ORDER-SECTION
=========================================================== -->
<section class="admin-section-accept-order" id="admin5"style="display: <%if(tab!=null){if(tab.equals("admin5")){%>block<%}else{ %> none<% }}else{%> none<%}%>;">

 <%
 boolean todayflag1=true,yesterdayflag1=true;
 ArrayList<String> datelist1=new ArrayList<String>();
 SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
       
   List<AcceptOrder> listaccept= new AcceptOrderModel().findAll();
       if(listaccept.isEmpty()){
    	  
        %>
                 <div class="text-center"><img alt="" src="images/gifs/empty-ghost.gif" width="350">
                 </div>
                  <%}else{ %>
                 
  <div style="padding-left: 30%; padding-right: 30%;">
     <form class="d-flex" style="border-radius: 4px; border:1px solid #7bbb43;">
    <i class="fa-sharp fa-solid fa-magnifying-glass m-2" style="font-size: 20px; color: #7bbb43;"></i>
      <input style="border: none; box-shadow: none;" class="form-control me-2" type="search" placeholder="Enter OrderId" id="search-accept" onkeyup="acceptsearch()" aria-label="Search"/>
    </form>
    </div>

   
     
	        <div class="card admin-accept-orders-card p-3 mt-5">
        
        <div class="row">
          <div class="col vr ">
            Customer
        </div>
       
            <div class="col vr ">
              OrderId
          </div>
          
            <div class="col vr ">
              Services
          </div>
          
            <div class="col vr ">
              Quantity
          </div>
       
            <div class="col vr ">
              Amount
          </div>
         
            <div class="col vr ">
              Payment Method
          </div>
        
            <div class="col vr ">
              Date and Time
          </div>
        
          <div class="col vr ">
            Transcation Id
        </div>

        <div class="col vr ">
           Address
        </div>

            <div class="col  ">
              Status
          </div>

        </div>
    </div>
     	<div id="accept-list">
            <% 
               for(AcceptOrder accept:listaccept){
            	   List<QuantityService> list4= accept.getOrderdetail().getQuantity();
            	   Address address= accept.getOrderdetail().getAddress();
            	   int seq=0;
	 %>     
              
    <div class="card admin-orders-card-content p-3 mt-1 search_bar_accept">
     <div class="row">
              <div class="col vr ">
             
               <i class="fa-solid fa-phone"></i> <%=accept.getOrderdetail().getUser().getPhone() %><br>
               <i class="fa-sharp fa-solid fa-envelope"></i> <%=accept.getOrderdetail().getUser().getEmail() %>
            </div>
           
                <div class="col vr byorderid">
                 <%=accept.getOrderdetail().getOrderid() %>
              </div>
              
                <div class="col vr ">
                 <%for(QuantityService laundryreject:list4){seq++; %>
                	<%=seq %>. <%=laundryreject.getServices().getService()%><br>
                	 <% } %>
              </div>
              
                <div class="col vr ">
                  <%for(QuantityService laundryreject:list4){  %>
             	 <%=laundryreject.getquantity()%><br>
             	 <%} %>
              </div>
           
                <div class="col vr ">
                 <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=accept.getOrderdetail().getTotalprices() %>
              </div>
             
                <div class="col vr ">
                  <% if(accept.getOrderdetail().isPaid()){ %>paid<%}else{ %>cod<%} %>
              </div>
            
                <div class="col vr ">
                  <i class="fa-regular fa-calendar"></i> <%= accept.getOrderdetail().getDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %><br>
         <i class="fa-sharp fa-solid fa-clock"></i> <%=accept.getOrderdetail().getDate().getHour() %> : <%=accept.getOrderdetail().getDate().getMinute() %>
              </div>
            
              <div class="col vr ">
              <% if(accept.getOrderdetail().getRazorpay_payment_id()==null){ %>COD<%}else{ %><%=accept.getOrderdetail().getRazorpay_payment_id() %><%} %>
               
            </div>

            <div class="col vr ">
             <%=address.getName() %> ,  <%=address.getPhone() %> <br>
             <%=address.getHouse() %>,<%=address.getStreet() %>,<%=address.getCity() %><br>
              <%=address.getState() %>-<%=address.getPincode() %>
               </div>

                <div class="col  ">
               
                  <button class="add-track-btn"data-bs-toggle="modal" data-bs-target="#track_update_modal-<%=accept.getOrderdetail().getId() %>">
                  Track Update
                </button>
              </div>
<!-- -----------------------------popup Upadte track------------ -->
<!-- Modal -->
<div class="modal fade" id="track_update_modal-<%=accept.getOrderdetail().getId()  %>" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content" style="border-radius: 10px; margin-top: 20%; width:600px;"> 
      <div class="modal-body" >
      <div>
      <span style="font-weight: 600;"><%=accept.getOrderdetail().getUser().getName() %><br>OrderId: <%=accept.getOrderdetail().getOrderid() %></span>
          <a data-bs-dismiss="modal" id="track-btn-close" ><i class="fa-sharp fa-solid fa-circle-xmark"></i></a>
          </div>
    <div class="container modal-container mt-5">
     
     <% List<TrackOrder> tracklist=new TrackOrderModel().findbyOrder(accept.getOrderdetail().getId());
     
     for(TrackOrder track:tracklist){
    	 DateTimeFormatter formater = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    	 DateTimeFormatter formatertime = DateTimeFormatter.ofPattern("hh:mm a");
    	 String accepdate="";
    	 String pickupdate="";
    	 String processdate="";
    	 String outdeliverydate="";
    	 String delivereddate="";
    	 String accepttime="";
    	 String pickuptime="";
    	 String processtime="";
    	 String outdeliverytime="";
    	 String deliveredtime="";
    	
    	 if(track.getAccept()!=null){  accepdate=track.getAcceptdate().format(formater); accepttime=track.getAcceptdate().format(formatertime);}
    	  if(track.getPickup()!=null){  pickupdate=track.getPickupdate().format(formater);pickuptime=track.getPickupdate().format(formatertime); }
    	  if(track.getProcess()!=null){ processdate=track.getProcessdate().format(formater) ;processtime=track.getProcessdate().format(formatertime) ;}
    	  if(track.getOutdelivery()!=null){  outdeliverydate=track.getOutdeliverydate().format(formater) ;outdeliverytime=track.getOutdeliverydate().format(formatertime) ;}
    	  if(track.getDelivered()!=null){ delivereddate=track.getDelivereddate().format(formater) ; deliveredtime=track.getDelivereddate().format(formatertime) ;}
      %>
      <div class="steps-heading">
        <span class="circle_h <%if(track.getAccept()!=null){%>active <% }if(track.getAccept()!=null && track.getPickup()==null){%>shockwaveJump<%} %>">Accept</span>
        <span class="circle_h <%if(track.getPickup()!=null){%>active <% }if(track.getPickup()!=null && track.getProcess()==null){%>shockwaveJump<%} %>"style="margin-left: 6%;">Pickup</span>  
        <span class="circle_h <%if(track.getProcess()!=null){%>active <% }if(track.getProcess()!=null && track.getOutdelivery()==null){%>shockwaveJump<%} %>"style="margin-left: 4%;">Processing</span>  
        <span class="circle_h <%if(track.getOutdelivery()!=null){%>active <% }if(track.getOutdelivery()!=null && track.getDelivered()==null){%>shockwaveJump<%} %>">out of Delivery</span>
        <span class="circle_h <%if(track.getDelivered()!=null){%>active <% } if(track.getDelivered()!=null){%>shockwaveJump<%} %>" style="margin-right: -5px;">Delivered</span>
       </div>

    <div class="steps">
     <span class="circle  <%if(track.getAccept()!=null){%>active icon_added <% }else{%>icon_remove<% } if(track.getAccept()!=null && track.getPickup()==null){%>shockwaveJump<%} %> "></span>
     <span class="circle <%if(track.getPickup()!=null){%>active icon_added <% }else{%>icon_remove<% } if(track.getPickup()!=null && track.getProcess()==null){%>shockwaveJump<%} %>"></span>  
     <span class="circle <%if(track.getProcess()!=null){%>active icon_added <% }else{%>icon_remove<% } if(track.getProcess()!=null && track.getOutdelivery()==null){%>shockwaveJump<%} %>"></span>  
     <span class="circle <%if(track.getOutdelivery()!=null){%>active icon_added <% }else{%>icon_remove<% } if(track.getOutdelivery()!=null && track.getDelivered()==null){%>shockwaveJump<%} %>"></span>
     <span class="circle <%if(track.getDelivered()!=null){%>active icon_added <% }else{%>icon_remove<% } if(track.getDelivered()!=null){%>shockwaveJump<%} %>"></span>
     <div class="progress-bar">
      <span class="indicator" style="width:<% if(track.getPickup()!=null && track.getProcess()==null){%>25<%}if(track.getProcess()!=null && track.getOutdelivery()==null){%>50<%}if(track.getOutdelivery()!=null && track.getDelivered()==null){%>75<%} if(track.getDelivered()!=null){%>100<%}%>%;"></span>
     </div>
    </div>
    <div class="steps-heading">
      <span class="circle_d <%if(track.getAccept()!=null){%>active <% }if(track.getAccept()!=null && track.getPickup()==null){%>shockwaveJump<%} %>" style="margin-left: -10px;"><%=accepdate %><br><%=accepttime %></span>
      <span class="circle_d  <%if(track.getPickup()!=null){%>active <% }if(track.getPickup()!=null && track.getProcess()==null){%>shockwaveJump<%} %>"><%=pickupdate %><br><%=pickuptime %></span>  
      <span class="circle_d <%if(track.getProcess()!=null){%>active <% }if(track.getProcess()!=null && track.getOutdelivery()==null){%>shockwaveJump<%} %>"><%=processdate%><br><%=processtime %></span>  
      <span class="circle_d  <%if(track.getOutdelivery()!=null){%>active <% }if(track.getOutdelivery()!=null && track.getDelivered()==null){%>shockwaveJump<%} %>" style="margin-left: -10px;"><%=outdeliverydate %><br><%=outdeliverytime %></span>
      <span class="circle_d <%if(track.getDelivered()!=null){%>active <% }if(track.getDelivered()!=null){%>shockwaveJump<%} %>" style="margin-right: -10px;"><%=delivereddate %><br><%=deliveredtime %></span>
     
     </div>

     <form method="post" action="TrackOrderServlet?acceptid=<%=accept.getId() %>&orderid=<%=accept.getOrderdetail().getId()%>&trackid=<%=track.getId() %>&tab=admin5">
    <div class="buttons-track mt-3">
     <%if(track.getDelivered()==null){ %> <button type="submit"  id="next-track">Update Track</button><%} %>
    </div>
</form>

<%} %>

</div>
</div>
</div>
</div>
</div>
            </div>
        </div>

<%} }%>
</div>
</section>
<!-- ==========================================================
                 REJECT-ORDER-SECTION
=========================================================== -->
<section class="admin-section-reject-order" id="admin6"style="display: <%if(tab!=null){if(tab.equals("admin6")){%>block<%}else{ %> none<% }}else{%> none<%}%>;">

 <%
 
 
 boolean todayflag=true,yesterdayflag=true;
 ArrayList<String> datelist=new ArrayList<String>();
 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
        
     
   List<RejectOrder> listreject= new RejectOrderModel().findAll();
       if(listreject.isEmpty()){
    	  
        %>
                 <div class="text-center"><img alt="" src="images/gifs/empty-ghost.gif" width="350">
                 </div>
                  <%}else{ %>
                 
                 <div style="padding-left: 30%; padding-right: 30%;">
    <form class="d-flex" style="border-radius: 4px; border:1px solid #7bbb43;">
    <i class="fa-sharp fa-solid fa-magnifying-glass m-2" style="font-size: 20px; color: #7bbb43;"></i>
      <input style="border: none; box-shadow: none;" class="form-control me-2" type="search" placeholder="Enter OrderId" id="search-reject" onkeyup="rejectsearch()" aria-label="Search"/>
    </form>
    </div>
   
     
	 
	   <div class="card admin-reject-orders-card p-3 mt-5 ">
        
        <div class="row">
          <div class="col vr ">
            Customer
        </div>
       
            <div class="col vr ">
              OrderId
          </div>
          
            <div class="col vr ">
              Services
          </div>
          
            <div class="col vr ">
              Quantity
          </div>
       
            <div class="col vr ">
              Amount
          </div>
         
            <div class="col vr ">
              Payment Method
          </div>
        
            <div class="col vr ">
              Date and Time
          </div>
        
          <div class="col vr ">
            Transcation Id
        </div>

        <div class="col vr ">
           Address
        </div>

            <div class="col  ">
              Status
          </div>

        </div>
    </div>
            	<div id="reject-list">
              <% 
               for(RejectOrder reject:listreject){
            	   
            	   List<QuantityService> list3= reject.getOrderdetail().getQuantity();
            	   Address address= reject.getOrderdetail().getAddress();
            	   int seq=0;
	 %>     
              
    <div class="card admin-orders-card-content p-3 mt-1 search_bar_reject">
    
      
            <div class="row">
              <div class="col vr ">
             
               <i class="fa-solid fa-phone"></i> <%=reject.getOrderdetail().getUser().getPhone() %><br>
               <i class="fa-sharp fa-solid fa-envelope"></i> <%=reject.getOrderdetail().getUser().getEmail() %>
            </div>
           
                <div class="col vr byorderid">
                 <%=reject.getOrderdetail().getOrderid() %>
              </div>
              
                <div class="col vr ">
                 <%for(QuantityService laundryreject:list3){seq++; %>
                	<%=seq %>. <%=laundryreject.getServices().getService()%><br>
                	 <% } %>
              </div>
              
                <div class="col vr ">
                  <%for(QuantityService laundryreject:list3){  %>
             	 <%=laundryreject.getquantity()%><br>
             	 <%} %>
              </div>
           
                <div class="col vr ">
                 <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=reject.getOrderdetail().getTotalprices() %>
              </div>
             
                <div class="col vr ">
                  <% if(reject.getOrderdetail().isPaid()){ %>paid<%}else{ %>cod<%} %>
              </div>
            
                <div class="col vr ">
                  <i class="fa-regular fa-calendar"></i> <%= reject.getOrderdetail().getDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %><br>
         <i class="fa-sharp fa-solid fa-clock"></i> <%=reject.getOrderdetail().getDate().getHour() %> : <%=reject.getOrderdetail().getDate().getMinute() %>
              </div>
            
              <div class="col vr ">
              <% if(reject.getOrderdetail().getRazorpay_payment_id()==null){ %>COD<%}else{ %><%=reject.getOrderdetail().getRazorpay_payment_id() %><%} %>
               
            </div>

            <div class="col vr ">
             <%=address.getName() %> ,  <%=address.getPhone() %> <br>
             <%=address.getHouse() %>,<%=address.getStreet() %>,<%=address.getCity() %><br>
              <%=address.getState() %>-<%=address.getPincode() %>
               </div>

                <div class="col  ">
                 <%=reject.getOrderdetail().getStatus() %>
              </div>

            </div>
        </div>

<%} }%>
</div>
</section>






<%@include file="templates/footer.jsp" %>
<%@include file="templates/cdnlink.jsp" %>

 <script>
 const ordersearch = () =>{
	  const searchbox= document.getElementById("search-order").value.toUpperCase();
	  const storeitems= document.getElementById("order-list");
	  const customer = document.querySelectorAll(".search_bar_order");
	  const pname=document.getElementsByClassName('byorderid');
	  console.log(pname);
	  for(var i=0;i<pname.length;i++){
	  let match = customer[i].getElementsByClassName('byorderid')[0];
	  if(match){
	    let textvalue = match.textContent || match.innerHTML

	    if(textvalue.toUpperCase().indexOf(searchbox) > -1){
	      customer[i].style.display ="";
	    }else{
	      customer[i].style.display ="none";
	    }
	  }

	  }

	   }
  const customersearch = () =>{
const searchbox= document.getElementById("search-customer").value.toUpperCase();
const storeitems= document.getElementById("customer-list");
const customer = document.querySelectorAll(".admin-customer-card-content");
const pname=document.getElementsByClassName('byphone');
console.log(pname);
for(var i=0;i<pname.length;i++){
let match = customer[i].getElementsByClassName('byphone')[0];
if(match){
  let textvalue = match.textContent || match.innerHTML

  if(textvalue.toUpperCase().indexOf(searchbox) > -1){
    customer[i].style.display ="";
  }else{
    customer[i].style.display ="none";
  }
}

}

 }
  const acceptsearch = () =>{
	  const searchbox= document.getElementById("search-accept").value.toUpperCase();
	  const storeitems= document.getElementById("accept-list");
	  const customer = document.querySelectorAll(".search_bar_accept");
	  const pname=document.getElementsByClassName('byorderid');
	  console.log(pname);
	  for(var i=0;i<pname.length;i++){
	  let match = customer[i].getElementsByClassName('byorderid')[0];
	  if(match){
	    let textvalue = match.textContent || match.innerHTML

	    if(textvalue.toUpperCase().indexOf(searchbox) > -1){
	      customer[i].style.display ="";
	    }else{
	      customer[i].style.display ="none";
	    }
	  }

	  }

	   }
  const rejectsearch = () =>{
	  const searchbox= document.getElementById("search-reject").value.toUpperCase();
	  const storeitems= document.getElementById("reject-list");
	  const customer = document.querySelectorAll(".search_bar_reject");
	  const pname=document.getElementsByClassName('byorderid');
	  console.log(pname);
	  for(var i=0;i<pname.length;i++){
	  let match = customer[i].getElementsByClassName('byorderid')[0];
	  if(match){
	    let textvalue = match.textContent || match.innerHTML

	    if(textvalue.toUpperCase().indexOf(searchbox) > -1){
	      customer[i].style.display ="";
	    }else{
	      customer[i].style.display ="none";
	    }
	  }

	  }

	   }
  
  
  
 </script>
<script type="text/javascript">
   $(document).ready(function () {
	$('#admin3').load('refreshadminnotification.jsp');
	refresh();
});
   function refresh(){
	   setTimeout(() => {
		$('#admin3').load('refreshadminnotification.jsp');
		refresh();
	}, 20000);
   }
   </script>


    <script>

    
    
    
    const Dashboard=document.getElementById("admin1");
    const Order=document.getElementById("admin2");
    const Notification=document.getElementById("admin3");
    const Customer=document.getElementById("admin4");
    const Accept=document.getElementById("admin5");
    const Reject=document.getElementById("admin6");
    const header=document.getElementById("mydiv");
     const das=header.getElementsByClassName("das");
    
     
      for (var i = 0; i < das.length; i++) {
  das[i].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  });
  
}
 


  function showdashboard(){
     Dashboard.style.display="block";
     Order.style.display="none";
     Notification.style.display="none";
     Customer.style.display="none";
     Accept.style.display="none";
     Reject.style.display="none";
}
function showOrders(){
     Dashboard.style.display="none";
     Order.style.display="block";
     Notification.style.display="none";
     Customer.style.display="none";
     Accept.style.display="none";
     Reject.style.display="none";
     
}
function showNotification(){
     Dashboard.style.display="none";
     Order.style.display="none";
     Notification.style.display="block";
     Customer.style.display="none";
     Accept.style.display="none";
     Reject.style.display="none";
}
function showCustomer(){
     Dashboard.style.display="none";
     Order.style.display="none";
     Notification.style.display="none";
     Customer.style.display="block";
     Accept.style.display="none";
     Reject.style.display="none";
}
function showAccept(){
     Dashboard.style.display="none";
     Order.style.display="none";
     Notification.style.display="none";
     Customer.style.display="none";
     Accept.style.display="block";
     Reject.style.display="none";
}
function showReject(){
     Dashboard.style.display="none";
     Order.style.display="none";
     Notification.style.display="none";
     Customer.style.display="none";
     Accept.style.display="none";
     Reject.style.display="block";
}

  


 </script>
 

</body>
</html>