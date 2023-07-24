    <%@page import="java.util.Base64"%>
<%@page import="com.entities.NotificationMessage"%>
<%@page import="com.model.NotificationMessageModel"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.Cookie"%>
<%@page import="com.model.UserModel"%>
<%@page import="com.entities.User"%>
<%
  Cookie[] cookies=request.getCookies();
	int userid = 0;
	if(cookies!=null){
		for(Cookie cookie:cookies){
			if(cookie.getName().equals("user")) userid = Integer.parseInt(cookie.getValue());
		}
	}
        
                    
        User user= new UserModel().find(userid);                 

  
                           
                        
        
        
        List<NotificationMessage> mess= new NotificationMessageModel().findbyUserid(userid);
    if(mess.isEmpty()){
        %>
        <div class="text-center mt-5"><img alt="" src="/OneTrustServices/images/gifs/empty-notification.gif" width="150">
        </div>
         <%}else{ %>
           
         <%
          
        
         for(NotificationMessage message:mess){
      	  
              	String encodedata=Base64.getEncoder().encodeToString(message.getImage());
              String pic="data:image/jpg;base64,"+encodedata;
              %>
    <li>
      <a href="#" class="top-text-block">
        <div class="top-text-heading"><b><%=message.getTopic() %></b></div>
        <div class="top-text-heading" style="font-size: 12px;"><%=message.getComment() %></div>
        <div class="top-text-light"><time class="timeago" datetime="<%=message.getDate() %>"></time></div>
      </a> 
    </li>
                <%}} %>
                
                
     <%@include file="templates/cdnlink.jsp" %>   
       