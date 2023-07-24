
<%@page import="com.model.TrackOrderModel"%>
<%@page import="com.entities.TrackOrder"%>
<%@page import="com.entities.QuantityService"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.model.AddressModel"%>
<%@page import="com.entities.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.model.LaundryModel"%>
<%@page import="com.entities.Laundryservices"%>
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
    <title>Recent Order</title>
    <link rel="stylesheet" href="css/orderhistory.css">

</head>
<body>


<%@include file="templates/header.jsp" %>


  
          <div class="col-lg-9 my-lg-5 my-1 " style="margin-left: 175px;" >
              <div id="main-content" class="bg-white border">
               <div class=" recent-order text-uppercase">My recent orders</div>
               <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                 <%
                 boolean todayflag=true,yesterdayflag=true;
                 ArrayList<String> datelist=new ArrayList<String>();
                 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                 List<OrderDetail> list= new OrderDetailModel().findbyUserid(userid);
                 if(list.isEmpty()){
                 %>
                 <div class="text-center"><img alt="" src="images/empty-box.png" width="350">
                 </div>
                  <%}else{ %>
                 
               <%  
              
               for(OrderDetail order:list){ 
            	  
	List<QuantityService> list2= order.getQuantity();
	Address address= order.getAddress();
   
	 
	 %> 
   				<%
                Date today=new Date();
                Date yesterday =new Date(today.getDay()-1,today.getMonth(),today.getYear());
                if(sdf.format(Date.from(order.getDate().atZone(ZoneId.systemDefault()).toInstant())).equals(sdf.format(new Date()))) {
                	if(todayflag){%>
                 
                 	 <div class=" recent-order text-uppercase">Today-<%=order.getDate().getDayOfMonth() %>, <%=order.getDate().getMonth() %> ,<%=order.getDate().getYear() %></div>
                 <%
                	}	
                 todayflag=false; 
                } else if(sdf.format(Date.from(order.getDate().atZone(ZoneId.systemDefault()).toInstant())).equals(sdf.format(yesterday))) {
                	if(yesterdayflag){%>
          
                 	 <div class=" recent-order text-uppercase">Yesterday-<%=order.getDate().getDayOfMonth() %>, <%=order.getDate().getMonth() %> ,<%=order.getDate().getYear() %></div>
                 <%
                	}
                	yesterdayflag=false; 
                } else{
                	if(!datelist.contains(sdf.format(Date.from(order.getDate().atZone(ZoneId.systemDefault()).toInstant())))){%>
                 	 <div class=" recent-order text-uppercase"><%=order.getDate().getDayOfMonth() %>, <%=order.getDate().getMonth() %> ,<%=order.getDate().getYear() %></div>
                 	
                 <%
                 	datelist.add(sdf.format(Date.from(order.getDate().atZone(ZoneId.systemDefault()).toInstant())));
                	} 
               	}%>
                  <div class="order my-3 bg-light">
                      <div class="row">
                         
                        <div class=" col-lg-1 mt-1" >
                        <%for(QuantityService laundry:list2){  %> 
                      <% if(laundry.getServices().getCategory()!=null){%>  
                          <img src="<%if(laundry.getServices().getCategory().equals("Laundry") ){ %>images/Laundry.png<%}else if(laundry.getServices().getCategory().equals("Home Care")){ %>images/homecare.png<%}else if(laundry.getServices().getCategory().equals("Decoration")) {%>images/decoration.png<%}else if(laundry.getServices().getCategory().equals("Auto Services")) {%>images/autoservices.png<%}else if(laundry.getServices().getCategory().equals("Auto Wash")){ %>images/autowash.png<%}else if(laundry.getServices().getCategory().equals("E & E Services")){ %>images/e&eservices.png<%} %>"  width="100" class="rounded" alt="...">
                        <%
                      break;  
                      } %>
                         <%} %>
                        </div>
                        
                          <div class="col-lg-5" style="padding-left: 50px">
                            
                              <div class="d-flex flex-column justify-content-between order-summary">
                                
                                  <div class="d-flex align-items-center">
                                   
                                      <div class="order-id text-uppercase" style="">Order <%=order.getOrderid() %></div>
                                      <div class="green-label ms-auto text-uppercase" >Payment:<% if(order.isPaid()){ %>Paid<%}else{ %>cod<%} %></div>
                                       <% if(!order.isPaid()){ 
                                       for(QuantityService laundry:list2){ %>
                                       <div><a  class="btn  btn-pay text-uppercase" href="payment.jsp?orderid=<%=order.getId()%>&category=<%=laundry.getServices().getCategory() %>">Pay</a></div>
                                  <%
                                  break;
                                       }
                                       } %>
                                  </div>
                                  <%for(QuantityService laundry:list2){  %> 
                                  <div class="services"><%=laundry.getServices().getCategory() %></div> 
                                 <%
                              
                                 break;
                                 } %>
                                  <div class="fs-8"><%=order.getDate().getDayOfMonth() %>, <%=order.getDate().getMonth() %> ,<%=order.getDate().getYear() %> | <%=order.getDate().getHour() %> : <%=order.getDate().getMinute() %>  </div>
                               </div>
                          </div>
                          <div class="col-lg-6 " >
                             
                                  <div class="status" style="float:right;">Status: <button class="add-track-btn"data-bs-toggle="modal" data-bs-target="#track_update_modal-<%=order.getId() %>">Track</button>
</div>
                                  <div style="color:red; text-align: center; font-size: 10px; float: right; margin-left: 30%; "><% if(order.getStatus()== null){%>Note:-Please wait when your order is accepted by the agent <%}%></div>
                              
                                  <button type="button" style="float:right; margin-left: 60%;" class=" btn btn-primary text-uppercase"  data-bs-toggle="modal" data-bs-target="#modal-login-<%=order.getId() %>">Order info
                                  </button>
                                  
 
                              

                          </div>
                      </div>
                  </div>
                  
     <!-------------------------------- Modal-order-detail-info ----------------------------------------->
    <div class="modal fade" id="modal-login-<%=order.getId() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content modal-content-info ">
          <div class="modal-body ">
                <button type="button" class="btn" data-bs-dismiss="modal" ><i class="fa-sharp fa-solid fa-screwdriver-wrench" style="color: #fff;"></i></button>
     
               <div class="mt-1 content-title mb-5" >Thanks for your order</div>

                  <div class=" card-title mb-0 " >Order Details</div>       
    <div class="card order-content mt-1">
        <div class="card-text"><span class="card-text-title">Order Date</span><span class="card-text-content"><%= order.getDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></span></div>
        <div class="card-text"><span class="card-text-title">Order id</span><span class="card-text-content"><%=order.getOrderid() %></span></div>
    </div>

    <div class=" card-title mb-0 " >Payment Information</div>       
    <div class="card order-content mt-1">
        <div class="card-text"><span class="card-text-title">Payment Method</span><span class="card-text-content"><% if(order.isPaid()){ %>paid<%}else{ %>cod<%} %></span></div>
        <div class="card-text"><span class="card-text-title">Transaction Id</span><span class="card-text-content">Test mode</span></div>
       
    </div>
       
    <div class=" card-title mb-0 " >Address</div>       
    <div class="card order-content mt-1">
        
        <div class="card-text"><span class="card-text-address"><%=address.getName() %></span></div>
        
        <div class="card-text"><span class="card-text-address"><%=address.getPhone() %></span></div>
        
        <div class="card-text"><span class="card-text-address"><%=address.getHouse() %>,<%=address.getStreet() %>,<%=address.getCity() %><br> <%=address.getState() %>-<%=address.getPincode() %></span></div>
        
    </div>

    <div class=" card-title mb-0 " >Order Summary</div>       
    <div class="card order-content mt-1">
        <div class="card-text text-center"><span class="card-text-title">Services</span><span class="card-text-title-3" >Price X Qty</span><span class="card-text-title-2">Total</span></div>
       <%for(QuantityService laundry:list2){ 
    	int price= Integer.parseInt( laundry.getServices().getPrice()); 
    			int quty =   laundry.getquantity() ;
    			float result=price*quty;
    			   %>  
        <div class="card-text text-center"><span class="card-text-content-1"><%=laundry.getServices().getService() %></span><span class="card-text-content-2" style="color: #7bbb49; margin-right: 5%;"><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=price %>/<%=laundry.getServices().getPer() %> <span style="color: #315c45;">X<%=quty %> </span> </span><span class="card-text-content"><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=result %> </span></div>
        <%} %>
        <div class="card-text text-center" style="border-top: 1px solid rgb(161, 161, 161); "><span class="card-text-title">Total Amount</span><span class="card-text-content"><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i><%=order.getTotalprices() %></span></div>
        
    </div>

       </div>
       </div>
     </div>
    </div>
    <!-- -----------------------------popup Upadte track------------ -->
<!-- Modal -->
<div class="modal fade" id="track_update_modal-<%=order.getId()  %>" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content" style="border-radius: 10px; margin-top: 20%; width:600px;"> 
      <div class="modal-body" >
     
      <div>
      <span style="font-weight: 600;">OrderId: <%=order.getOrderid() %></span>
       
          <a data-bs-dismiss="modal" id="track-btn-close" ><i class="fa-sharp fa-solid fa-circle-xmark"></i></a>
          </div>
    <div class="container modal-container mt-5">
    
    <div class="text-danger mb-3"> <% if ( order.getStatus() != null && order.getStatus().equals("reject")) { %> Your order is rejected by OTS<% } %></div>
     <% if (order.getStatus()== null) { %> <div class="text-center mb-3">Your order is under processing</div><% } %>
     <% List<TrackOrder> tracklist=new TrackOrderModel().findbyOrder(order.getId());
   
      
     
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
    	 
    	 if(track.getAccept()!=null){ accepdate=track.getAcceptdate().format(formater); accepttime=track.getAcceptdate().format(formatertime);}
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
    <div class="steps-heading mb-5">
      <span class="circle_d <%if(track.getAccept()!=null){%>active <% }if(track.getAccept()!=null && track.getPickup()==null){%>shockwaveJump<%} %>" style="margin-left: -10px;"><%=accepdate %><br><%=accepttime %></span>
      <span class="circle_d  <%if(track.getPickup()!=null){%>active <% }if(track.getPickup()!=null && track.getProcess()==null){%>shockwaveJump<%} %>"><%=pickupdate %><br><%=pickuptime %></span>  
      <span class="circle_d <%if(track.getProcess()!=null){%>active <% }if(track.getProcess()!=null && track.getOutdelivery()==null){%>shockwaveJump<%} %>"><%=processdate%><br><%=processtime %></span>  
      <span class="circle_d  <%if(track.getOutdelivery()!=null){%>active <% }if(track.getOutdelivery()!=null && track.getDelivered()==null){%>shockwaveJump<%} %>" style="margin-left: -10px;"><%=outdeliverydate %><br><%=outdeliverytime %></span>
      <span class="circle_d <%if(track.getDelivered()!=null){%>active <% }if(track.getDelivered()!=null){%>shockwaveJump<%} %>" style="margin-right: -10px;"><%=delivereddate %><br><%=deliveredtime %></span>
     
     </div>
<%} %>

</div>
</div>
</div>
</div>
</div>
    
                  <%} %>
                 <%} %>
                  
                  
                  
              </div>
          </div>
      

   



<%@include file="templates/footer.jsp" %>
<%@include file="templates/cdnlink.jsp" %>

</body>
</html>