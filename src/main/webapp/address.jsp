<%@page import="com.model.AddressModel"%>
<%@page import="com.entities.Address"%>
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
    
    <title>your Address</title>
 <style >

 /* address */
 .address_pg_section{
   
   padding: 25px 30px!important;
  
   
   /* box-shadow: 2px 0px 29px rgb(0 0 0 / 14%); */
   background-color: #fbfbfb;
 }

 .address-heading {
  
   width: 85%; 
   text-align: left; 
   border-bottom: 2px solid #7bbb43; 
   line-height: 0.1em;
   /* margin: 10px 0 20px;  */
   margin-top: 5%;
   margin-left: 8%;
   margin-bottom: 5%;
   
 } 

 .address-heading-1 { 
   color:  #315c45;
   font-size: 1.5rem;
   font-weight: 900;
    background:#fff; 
    padding:0 10px; 
 }
 .add-address-btn{
 float: right;
   color:  #315c45;
   font-size: 30px;
   background:#fff; 
   padding:0 10px; 
   margin-top: -9px;
 }
 .add-address-btn:hover{
 color:#7bbb43;
 }
 
 .address-list{
  
  text-align: left;
  font-size: 18px;
   color:  #315c45;

 }
 .remove{
  
   font-size: 16px;
   color: #81ba5a;
   font-weight: 600;
   margin-top: -10%;
 float: right;
   border: none;
   background-color: transparent;
  

 }
 .address-cart-card{
   grid-gap: 1em;
   margin: 10px auto;
   max-width: 70em;
   padding: 0;
   border-radius: 7px;
    border-left: 5px solid #7bbb43; 
   
 }

 .plan-type {
   color: #558309;
   font-size: 1.5rem;
   font-weight: bold;
   line-height: 1em;
 }
.add-item{
 color:#315c45;
   font-weight: 600;
}
.add-color-font{
font-family: 'Raleway', sans-serif;
  font-weight: 600;
   
}
 .add-color-font-btn{
 width:100px;
 background-color:#7bbb43;
font-family: 'Raleway', sans-serif;
border:none;
  font-weight: 600;
   
}
.add-color-font-btn:hover{
background-color:#315c45;
}
 </style>
  
   
   
   
   
   
</head>
<body>
 <%@include file="templates/header.jsp" %>

<!-- address  -->
   <section class="address_pg_section mb-5" >
<div class="address-heading"><span class="address-heading-1">Add New Address</span>
             <!-- Button trigger modal -->
             
              <a class="add-address-btn"data-bs-toggle="modal" data-bs-target="#exampleModal">
                <i class="fa-sharp fa-solid fa-circle-plus"></i>
              </a>
            
            </div>
              <%
             
             List<Address> list1= new AddressModel().findbyUserid(userid);
             
              if(list1.isEmpty()){%>
            	  <div class="text-center"><img alt="" src="images/empty.gif" width="350">
                  </div>
                   <%}else{
            	  
             for(Address address:list1){
             %> 
 <!-- Earnings (Monthly) Card Example -->

  <div class="card address-cart-card shadow h-100 " >
               
      <div class="card-body ">
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
              <form method="post" action="AddressDeleteServlet?id=<%= address.getId() %>" >
                <button class="remove" type="submit">Remove</button> 
                </form> 
      </div>
      
  </div>
     <%}} %> 
<!-- -----------------------------popup add new address------------ -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <div class="modal-dialog">
   <div class="modal-content">
     <div class="modal-header add-color-font">
       <h1 class="modal-title fs-5" id="exampleModalLabel">Add New Address</h1>
       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
     </div>
     <form   action="AddressServlet" method="post">
     <div class="modal-body">
         
   <div class="row g-3 add-color-font" >
   
   
         <div class="col-12" style="display: flex;">
               <div class="home-radio  home-radio-inline add-color-font">
               <input type="radio" id="place" name="place" value="Home">
       <label for="place">Home</label><br></div>
       <div class="home-radio  home-radio-inline add-color-font" style="padding-left: 30px">
               <input type="radio" id="place" name="place" value="Office">
       <label for="place">Office</label><br></div>
       <div class="home-radio  home-radio-inline add-color-font" style="padding-left: 30px">
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
     <div class="modal-footer ">
       
       <button type="submit" class="btn btn-primary add-color-font-btn">Save</button>
     </div>
      </form>
   </div>
 </div>
</div>

</section>





<%@include file="templates/footer.jsp" %>
<%@include file="templates/cdnlink.jsp" %>
</body>
</html>