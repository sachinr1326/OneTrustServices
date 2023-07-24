<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.Base64"%>
<%@page import="com.entities.NotificationMessage"%>
<%@page import="java.util.List"%>
<%@page import="com.model.NotificationMessageModel"%>
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
      <title>Notification</title>
    <link rel="stylesheet" href="css/notification.css">
   
</head>
<body>
<%@include file="templates/header.jsp" %>
 <!-- ======= Services Section ======= -->

   
 
  <section class="section-50">
    <div class="container">
        <h3 class=" heading-line-1">Notifications <i class="fa-sharp fa-solid fa-bell"></i></h3>

                      <%
                           
                        
                      List<NotificationMessage> list= new NotificationMessageModel().findbyUserid(userid);
                          if(list.isEmpty()){
                                   %>
                                   <div class="text-center"><img alt="" src="images/empty.gif" width="350">
                                   </div>
                                    <%}else{
                      
                       for(NotificationMessage message:list){
                            	String encodedata=Base64.getEncoder().encodeToString(message.getImage());
                            String pic="data:image/jpg;base64,"+encodedata;
                            %>


        <div class="notification-ui_dd-content" style="margin-left: 10%; min-height: 100px; width: 80%;">
            <div class="notification-list notification-list--unread">
                <div class="notification-list_content">
                    <div class="notification-list_img">
                        <img src="<%= pic %>" alt="user">
                    </div>
                    <div class="notification-list_detail">
                        <span><b><%=message.getTopic() %></b> </span> <br>
                        <span class="text-muted"><%=message.getComment() %></span> <br>
                        <span class="text-muted"><small><time class="timeago" datetime="<%=message.getDate() %>"></time></small></span>
                    </div>
                </div>
                <div class="notification-list-close">
                <form action="NotificationDeleteServlet?id=<%=message.getId() %>" method="post" >
                 <button type="submit" class="notification-close"><i class="fa-sharp fa-solid fa-xmark" style="font-size: 20px;"></i></button>
              </form>
              </div>
            </div>
           
            
            </div>
            <%}}%>
               
      </div>
      
      
      
      
  </section>
  




<%@include file="templates/footer.jsp" %>
<%@include file="templates/cdnlink.jsp" %>
</body>
</html>