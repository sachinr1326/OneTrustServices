<%@page import="java.util.Base64"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.NotificationMessage"%>
<%@page import="com.model.NotificationMessageModel"%>
<%@page import="com.entities.User"%>
<%@page import="com.model.UserModel"%>
<%@page import="jakarta.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
   <link rel="stylesheet" href="/OneTrustServices/css/header.css">
</head>
<body>
<%@include file="../templates/alert.jsp" %> 
   <%
  Cookie[] cookies=request.getCookies();
	int userid = 0;
	if(cookies!=null){
		for(Cookie cookie:cookies){
			if(cookie.getName().equals("user")) userid = Integer.parseInt(cookie.getValue());
		}
	}
        
                    
        User user= new UserModel().find(userid);                 

    	if(userid==0){
    		response.sendRedirect("../home.jsp");
    	}
    	 
  
  %>
<%if(user!=null){ %>
 <nav class="navbar navbar-expand-lg  navbar-dark bg-dark mx-background-top-linear" style="height: 60px;" >
    <!-- Navbar content -->
    <div class="container ">

      <h1 class="nav-title-logo"><a class="navbar-brand" href="/OneTrustServices/home_two.jsp" style="font-size: xx-large;"><img src="/OneTrustServices/images/ots-m-unscreen.gif" alt="" width="100"><img src="/OneTrustServices/images/ots-text.gif" alt="" width="250"> </a></h1>
        
<div class="collapse navbar-collapse p-0 m-0 " id="navbarText"  style="position: relative;">
        
<div class="nav-item nav-account " style="position: absolute; right:-60px ;">
  <a  class="nav-a nav-a-2 nav-truncate nav-progressive-attribute" >

  <div class="nav-line-1-container" >
  <span id="nav-link-accountList-nav-line-1"  class="nav-line-1 nav-progressive-content">Hello,<%=user.getName() %></span>
</div>

<span class="nav-line-2">Account & Lists<span class="nav-icon nav-arrow" style="visibility: visible; margin: 5px; color:#a7acb2;"><i class="fa-sharp fa-solid fa-caret-down"></i></span></span>

</a>


  <div class="dropdown-menu dropdown-content2">	
    <i class="fa-sharp fa-solid fa-sort-up" style=" color: #fff; font-size: 20px; position: absolute; top:-5px ; right: 22px;"></i>
    					  	
    <div id="nav-container-user container" class="row5" >
      <div id="nav-list"  class="column5">
        <div class="nav-title" id="nav-al-title" style="padding-bottom: 10%;">Your Services</div>
        <a href="/OneTrustServices/Module-I/laundry.jsp?category=Laundry" class="nav-link nav-item"><span class="nav-text">Laundry</span></a>
      <a href="/OneTrustServices/Module-I/laundry.jsp?category=Home Care" class="nav-link nav-item"><span class="nav-text">Home Care</span></a>
      <a href="/OneTrustServices/Module-I/laundry.jsp?category=Decoration" class="nav-link nav-item"><span class="nav-text">Decoration</span></a>
      <a href="/OneTrustServices/Module-I/laundry.jsp?category=Auto Services" class="nav-link nav-item"><span class="nav-text">Auto Services</span></a>
      <a href="/OneTrustServices/Module-I/laundry.jsp?category=Auto Wash" class="nav-link nav-item"><span class="nav-text">Auto Wash</span></a>
      <a href="/OneTrustServices/Module-I/laundry.jsp?category=E and E Services" class="nav-link nav-item"><span class="nav-text">E & E Services</span></a>
      </div>
    <div id="nav-account"  class="column5 " style="border-left: 1px solid #eee; padding-left: 5%;">
      <div class="nav-title" style="padding-bottom: 10%;">Your Account</div>
      <a href="/OneTrustServices/myprofile.jsp" class="nav-link nav-item"><span class="nav-text">your Account</span></a>
      <a href="/OneTrustServices/orderhistory.jsp" class="nav-link nav-item"><span class="nav-text">your Orders</span></a>
      <%if(user.getName().equals("admin")){ %>
     <a href="/OneTrustServices/masterpage.jsp" class="nav-link nav-item"><span class="nav-text">Manage <b>OTS</b></span></a>
     <% }%>
     
    <a href="/OneTrustServices/address.jsp" class="nav-link nav-item"><span class="nav-text">your Address</span></a>
    
     
      <a  class="nav-link nav-item" onclick="logout()" style="border-top: 1px solid #eee;padding-top: 5%;"><span class="nav-text" >Sign Out</span></a>
     
    </div>
    
    
    </div>
  </div>
</div>
  <%if(!user.getName().equals("admin")){ %>
<!-- ==================Notifications======================= -->
<div class="notification_msg " style="position: absolute; right: 15%;">
<div class="dropdown ">
 
  <a  type="button" id="notification-bell"  >
  
    <i class="fa-sharp fa-solid fa-message" style="color: white; font-size: x-large;"></i>
  <span id="badgeChange" class="position-absolute top-1 start-100 translate-middle badge rounded-pill bg-danger" ><%= new NotificationMessageModel().Notificationbadge() %></span>
  </a>

  <div class="dropdown-menu dropdown-menu-msg " >
    <div class="header-msg " >
      <h3 class=" heading-line">Notifications <i class="fa-sharp fa-solid fa-bell"></i></h3>
    </div>
   
                
             
    <div class="container custom-scrollbar-css " >
    <%if(new NotificationMessageModel().Notificationbadge()!=0){ %>
                   <button class="add-track-btn-2 p-0" id="markread" onclick="markallRead()"> Mark All Read   </button>
      <%} %>
                <ul class="notification-list-ul mt-2" id="auto" >
                 
                </ul>
         
        </div>
        <div class="footer-msg " >
          <hr style="margin: 0; width: 320px; margin-left: 13px; margin-bottom: 10px;">
         <a href="/OneTrustServices/notification.jsp">Show more... </a>
        </div>


  </div>
</div>
</div>
 <%}
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
<div class="nav-item dropdown no-arrow d-flex" style="position: absolute; right: 6%;" >
  <div class="vertical-line" style="border-left: 2px solid white; height: 42px; margin-right: 20px ;"></div>
  <div class="user-image">
     <a href="">
     <div class="user-image-pic" style="background-image: url('<%=pic%>');"></div>
   </a>
   </div>
 </div>



      
      </div>
    </div>
  </nav>
  <nav class="navbar navbar-expand-lg  navbar-dark  " style="height: 30px; background-color: #7bbb43;" >
    

    </nav>
<%} %>


<script type="text/javascript">
function logout(){
	
	document.cookie ='user=;expires=Thu, 01 Jan 1970 00:00:01 GMT;path=/;';
	window.location="/OneTrustServices/";
	
}
window.addEventListener( "pageshow", function ( event ) {
	  var historyTraversal = event.persisted || 
	                         ( typeof window.performance != "undefined" && 
	                              window.performance.navigation.type === 2 );
	  if ( historyTraversal ) {
	    // Handle page restore.
	    window.location.reload();
	  }
	});

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

function markallRead() {
	
	$('#badgeChange').load('/OneTrustServices/markallread.jsp');
	 
}

</script>
<script type="text/javascript">
function badgerefresh() {
	 setTimeout(() => {
	$('#badgeChange').load('/OneTrustServices/badgerefreshnotification.jsp');
	badgerefresh();
		}, 2000);
}
   $(document).ready(function () {
	$('#auto').load('/OneTrustServices/refreshnotification.jsp');
	refresh();
	badgerefresh();
});
   function refresh(){
	   setTimeout(() => {
		$('#auto').load('/OneTrustServices/refreshnotification.jsp');
		refresh();
	}, 20000);
   }
   

   
   </script>
<script>
$(function() {
	console.log("Ready");
    $('.toast').toast('show');
	});
</script>

</body>
</html>