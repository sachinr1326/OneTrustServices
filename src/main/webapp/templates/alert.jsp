<%@page import="com.model.AlertModel"%>
<%@page import="com.entities.Alert"%>
<%@page import="com.helper.AlertManager"%>
<%@page import="jakarta.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<body>
 <%
 Cookie[] cookiesalert=request.getCookies();
	Alert alert=null;
	if(cookiesalert!=null){
		for(Cookie cookie:cookiesalert){
			if(cookie.getName().equals("toast")){
				alert=new AlertModel().find(cookie.getValue());
			}
		}
		new AlertManager().clearAlert(response);
	}
          

                            	
                            %>
 <% if(alert!=null){ %>
 <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 12;">
              <div  class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="3000" style="border-radius: 5px;">
                <div class="toast-header bg-<%= alert.getTag() %>" >
<!--                  <img src="..." class="rounded me-2" alt="...">-->
                    <span class="badge rounded-pill "><i class="fa fa-bell" style="font-size:20px; "></i></span>
                  <strong class="me-auto mx-2" style="color: #fff;font-weight: 500; font-size:17px; "><%= alert.getTitle() %></strong>
               
                  <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body bg-white" style="color: #315c45;font-family: 'Poppins', sans-serif;font-weight: 500; border-bottom-left-radius: 5px;border-bottom-right-radius: 5px ">
                  <%= alert.getMessage() %>
                </div>
              </div>
    </div>
    
    
    
<%} %>
</body>
</html>