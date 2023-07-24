<%@page import="java.util.Base64"%>
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
    <link rel="stylesheet" href="css/myprofile.css">
   
</head>
<body>
  <%@include file="templates/header.jsp" %>
  <!-- ======= Services Section ======= -->
  <section id="account-section" class="account-section">
    <div class="container "  >
      <h1>MY PROFILE</h1>
      <%
      String pic=null;
      String border=null;
      if(user.getImage()!=null){
      String encodedata=Base64.getEncoder().encodeToString(user.getImage());
       pic="data:image/jpg;base64,"+encodedata;
       border="#7bbb42";
     }else{
      pic="images/myprofile/myprofile.png";
      border="gray";
      } 
      %>
       <form  method="post" action="UpdateProfileServlet?userid=<%=user.getId() %>" enctype="multipart/form-data">
       
      <div class="wraper1">
          <div class="wrapper" id="profile" style="background-image:url('<%= pic %>'); border-color:<%= border%>">
            <input type="file" class="my-file" id="file-1" name="image1" onchange="loadFile(event)" />
           
          </div>
             <button type="submit" class="saveimage">Save</button>
        </div>
       </form>
        <div class="inputs">
            <input type="text" name="name" value="<%=user.getName() %>" disabled required>
            <label>Name</label>
            
        </div>
        <div class="inputs">
          <input type="text" id="email" name="email" value="<%=user.getEmail() %>" disabled required>
          <label>Email Address</label>
          <a  class="btn-acc"  data-bs-toggle="modal" data-bs-target="#modal-email" >Edit</a>
      </div>
      <div class="inputs">
        <input type="text" id="phone" name="phone" value="<%=user.getPhone() %>" disabled required>
        <label>Phone No.</label>
        <a  class="btn-acc"  data-bs-toggle="modal" data-bs-target="#modal-phone" >Update</a>
    </div>
   
    
        
    </div>
   </section>
    <!-- ==============================modal-email================= -->
    <div class="modal fade" id="modal-email" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content ">
        <form  action="UpdateEmailServlet?userid=<%=user.getId() %>" method="post">
          <div class="modal-body ">
             <div class="mt-1 content-title mb-0" >Update Email ID</div>
       <div class=" card-title mb-4 " >Ensure your email ID is the latest to receive security alerts</div>       
    <div class="card order-content mt-1 mb-3">
      <div class="inputs">
        <input type="text" id="email" name="email"  required>
        <label>Email Address</label>
    </div>
    <button type="submit" class="update mt-3">Update Email ID</button>
    <button class="later mt-3" data-bs-dismiss="modal" >Do it later</button>
    </div>
     </div>
     </form>
       </div>
     </div>
    </div>
      <!-- ==============================modal-phone================= -->
      <div class="modal fade" id="modal-phone" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content ">
           <form  action="UpdatePhoneServlet?userid=<%=user.getId() %>" method="post">
        
            <div class="modal-body ">
               <div class="mt-1 content-title mb-0" >Update Phone No.</div>
         <div class=" card-title mb-4 " >Ensure your phone no. is correct for some security purpose </div>       
      <div class="card order-content mt-1 mb-3">
        <div class="inputs">
          <input type="text" id="phone" name="phone" value=""  required>
          <label>Phone No.</label>
      </div>
      <button type="submit" class="update mt-3">Confirm</button>
      <button class="later mt-3" data-bs-dismiss="modal" >Cancel</button>
      </div>
       </div>
       </form>
         </div>
       
       </div>
      </div>


<%@include file="templates/footer.jsp" %>
<%@include file="templates/cdnlink.jsp" %>
       <script>
        var loadFile = function(event) {
         
          var image2 = document.getElementById('profile');
         
          
          image2.style.backgroundImage= 'url("'+URL.createObjectURL(event.target.files[0])+'")';
           
        };
        </script>
        
</body>
</html>