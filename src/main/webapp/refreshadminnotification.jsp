 
<%@page import="com.entities.Address"%>
<%@page import="com.entities.QuantityService"%>
<%@page import="com.entities.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.model.OrderDetailModel"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%

   List<OrderDetail> listnotify= new OrderDetailModel().findbyStatusNull();
System.out.println("list -----------------------------:- "+listnotify);
       if(listnotify.isEmpty()){
    	
        %>
                 <div class="text-center"><img alt="" src="images/gifs/empty-ghost.gif" width="350">
                 </div>
                  <%}else{ %>
                 
  <div class="card admin-notification-orders-card p-3 ">
        
    <div class="row">
      <div class="col vr ">
        Customer
    </div>
   
        <div class="col vr ">
          OrderId
      </div>
      
        <div class="col vr ">
          Category
      </div>
      
        <div class="col vr ">
          Service X Qty
      </div>
   
        <div class="col vr ">
          Amount
      </div>
     
        <div class="col vr ">
          Payment Method
      </div>
    
        <div class="col vr ">
        Date & Time
      </div>
    
      <div class="col vr ">
        Address
    </div>

    <div class="col vr ">
      Reject
    </div>

        <div class="col  ">
         Accept
      </div>

    </div>
</div>
 <% 
               for(OrderDetail reject:listnotify){
            	   List<QuantityService> list4= reject.getQuantity();
            	   Address address= reject.getAddress();
            	   int seq=0;
	 %> 
	 
	
	 
  <div class="card admin-notification-card-content p-3 mt-1">
    
    <div class="row">
      <div class="col vr ">
               <i class="fa-solid fa-phone"></i> <%=reject.getUser().getPhone() %><br>
               <i class="fa-sharp fa-solid fa-envelope"></i> <%=reject.getUser().getEmail() %>
           </div>
   
        <div class="col vr ">
          <%=reject.getOrderid() %>
      </div>
      
        <div class="col vr ">
       <%for(QuantityService laundryreject:list4){%>
                 <%=laundryreject.getServices().getCategory()%> 
                	 <%
                	 break;
                	 } %>
      </div>
      
        <div class="col vr ">
         <%for(QuantityService laundryreject:list4){seq++; %>
                	<%=seq %>. <%=laundryreject.getServices().getService()%> X <%=laundryreject.getquantity()%><br>
                	 <% } %>
      </div>
   
        <div class="col vr ">
           <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=reject.getTotalprices() %>
      </div>
     
        <div class="col vr ">
          <% if(reject.isPaid()){ %>paid<%}else{ %>cod<%} %>
      </div>
    
        <div class="col vr ">
           <i class="fa-regular fa-calendar"></i> <%= reject.getDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %><br>
         <i class="fa-sharp fa-solid fa-clock"></i> <%=reject.getDate().getHour() %> : <%=reject.getDate().getMinute() %>
         </div>
    
      <div class="col vr ">
       <%=address.getName() %> ,  <%=address.getPhone() %> <br>
             <%=address.getHouse() %>,<%=address.getStreet() %>,<%=address.getCity() %><br>
              <%=address.getState() %>-<%=address.getPincode() %>
    </div>

    <div class="col vr ">
    <form action="RejectOrderServlet?orderid=<%=reject.getId()%>&tab=admin3&userid=<%=reject.getUser().getId() %>" method="post">
      <button type="submit" class="btn btn-danger mt-1" style="width: 80px;"><i class="fa-sharp fa-solid fa-xmark" style="font-size: 20px;"></i></button>
   </form>
    </div>

        <div class="col  ">
        <form action="AcceptOrderServlet?orderid=<%=reject.getId()%>&tab=admin3&userid=<%=reject.getUser().getId() %>" method="post">
          <button type="submit" class="btn btn-success mt-1" style="width: 80px;"><i class="fa-sharp fa-solid fa-check" style="font-size: 20px;"></i></button>
         </form>
      </div>

    </div>
</div>
<%} }%>